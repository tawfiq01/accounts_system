<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use App\Models\Customer;
use App\Models\Invoice;
use App\Models\InvoicePayment;
use App\Models\Retainer;
use App\Models\RetainerPayment;
use App\Models\Order;
use App\Models\Plan;
use App\Models\Utility;
use CoinGate\CoinGate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;

class CoingatePaymentController extends Controller
{
    //


    public $mode;
    public $coingate_auth_token;
    public $is_enabled;

    public function paymentConfig()
    {
        if (\Auth::user()->type == 'company') {
            $payment_setting = Utility::getAdminPaymentSetting();
        } else {
            $payment_setting = Utility::getCompanyPaymentSetting();
        }

        $this->coingate_auth_token = isset($payment_setting['coingate_auth_token']) ? $payment_setting['coingate_auth_token'] : '';
        $this->mode                = isset($payment_setting['coingate_mode']) ? $payment_setting['coingate_mode'] : 'off';
        $this->is_enabled          = isset($payment_setting['is_coingate_enabled']) ? $payment_setting['is_coingate_enabled'] : 'off';

        return $this;
    }


    public function planPayWithCoingate(Request $request)
    {
        $payment    = $this->paymentConfig();
        $planID     = \Illuminate\Support\Facades\Crypt::decrypt($request->plan_id);
        $plan       = Plan::find($planID);
        $authuser   = Auth::user();
        $coupons_id = '';

        if ($plan) {
            $price = $plan->price;
            if (isset($request->coupon) && !empty($request->coupon)) {
                $request->coupon = trim($request->coupon);
                $coupons         = Coupon::where('code', strtoupper($request->coupon))->where('is_active', '1')->first();

                if (!empty($coupons)) {
                    $usedCoupun             = $coupons->used_coupon();
                    $discount_value         = ($price / 100) * $coupons->discount;
                    $plan->discounted_price = $price - $discount_value;
                    $coupons_id             = $coupons->id;
                    if ($usedCoupun >= $coupons->limit) {
                        return redirect()->back()->with('error', __('This coupon code has expired.'));
                    }
                    $price = $price - $discount_value;
                } else {
                    return redirect()->back()->with('error', __('This coupon code is invalid or has expired.'));
                }
            }

            if ($price <= 0) {
                $authuser->plan = $plan->id;
                $authuser->save();

                $assignPlan = $authuser->assignPlan($plan->id);

                if ($assignPlan['is_success'] == true && !empty($plan)) {

                    $orderID = time();
                    Order::create(
                        [
                            'order_id' => $orderID,
                            'name' => null,
                            'email' => null,
                            'card_number' => null,
                            'card_exp_month' => null,
                            'card_exp_year' => null,
                            'plan_name' => $plan->name,
                            'plan_id' => $plan->id,
                            'price' => $price == null ? 0 : $price,
                            'price_currency' => !empty(env('CURRENCY')) ? env('CURRENCY') : 'USD',
                            'txn_id' => '',
                            'payment_type' => 'coingate',
                            'payment_status' => 'succeeded',
                            'receipt' => null,
                            'user_id' => $authuser->id,
                        ]
                    );
                    $assignPlan = $authuser->assignPlan($plan->id);

                    return redirect()->route('plans.index')->with('success', __('Plan activated Successfully!'));
                } else {
                    return redirect()->back()->with('error', __('Plan fail to upgrade.'));
                }
            }
            CoinGate::config(
                array(
                    'environment' => $this->mode,
                    'auth_token' => $this->coingate_auth_token,
                    'curlopt_ssl_verifypeer' => FALSE,
                )
            );
            $post_params = array(
                'order_id' => time(),
                'price_amount' => $price,
                'price_currency' => env('CURRENCY'),
                'receive_currency' => env('CURRENCY'),
                'callback_url' => route(
                    'plan.coingate',
                    [
                        $request->plan_id,
                        'coupon_id=' . $coupons_id,
                    ]
                ),
                'cancel_url' => route('stripe', [$request->plan_id]),
                'success_url' => route(
                    'plan.coingate',
                    [
                        $request->plan_id,
                        'coupon_id=' . $coupons_id,
                    ]
                ),
                'title' => 'Plan #' . time(),
            );

            $order = \CoinGate\Merchant\Order::create($post_params);
            if ($order) {
                return redirect($order->payment_url);
            } else {
                return redirect()->back()->with('error', __('opps something wren wrong.'));
            }
        } else {
            return redirect()->back()->with('error', 'Plan is deleted.');
        }
    }

    public function getPaymentStatus(Request $request,$plan)
    {
        $this->paymentConfig();
        $user                  = Auth::user();
        $planID  = \Illuminate\Support\Facades\Crypt::decrypt($plan);
        $plan    = Plan::find($planID);
        // $plan_id               = $request->plan_id;
        // $store_id              = \Auth::user()->current_store;
        // $admin_payment_setting = Utility::getAdminPaymentSetting();
        // $plan                  = Plan::find($plan_id);
        $user                  = Auth::user();
        $orderID = time();
        $price                 = isset($plan->price)?$plan->price:'';

        if ($plan) {
            try {
                $orderID = time();
                if ($request->has('coupon_id') && $request->coupon_id != '') {
                    $coupons = Coupon::find($request->coupon_id);
                    if (!empty($coupons)) {
                        $usedCoupun             = $coupons->used_coupon();
                        $discount_value         = ($price / 100) * $coupons->discount;
                        $plan->discounted_price = $price - $discount_value;
                        $coupons_id             = $coupons->id;
                        if ($usedCoupun >= $coupons->limit) {
                            return redirect()->back()->with('error', __('This coupon code has expired.'));
                        }
                        $price = $price - $discount_value;
                    }
                }
                $order                 = new Order();
                $order->order_id       = $orderID;
                $order->name           = $user->name;
                $order->card_number    = '';
                $order->card_exp_month = '';
                $order->card_exp_year  = '';
                $order->plan_name      = $plan->name;
                $order->plan_id        = $plan->id;
                $order->price          = $price;
                $order->price_currency = isset($request->CURRENCY_CODE) ? $request->CURRENCY_CODE : 'USD';
                $order->txn_id         = isset($request->transaction_id) ? $request->transaction_id : '';
                $order->payment_type   = __('Coingate');
                $order->payment_status = 'success';
                $order->receipt        = '';
                $order->user_id        = $user->id;
                $order->save();

                $assignPlan = $user->assignPlan($plan->id);
                if ($assignPlan['is_success']) {
                    return redirect()->route('plans.index')->with('success', __('Plan activated Successfully.'));
                } else {
                    return redirect()->route('plans.index')->with('error', $assignPlan['error']);
                }
            } catch (\Exception $e) {
                return redirect()->route('plans.index')->with('error', __('Transaction has been failed.'));
            }
        } else {
            return redirect()->route('plans.index')->with('error', __('Plan is deleted.'));
        }
    }

    public function retainerPayWithCoingate(Request $request)
    {

        $retainerID = \Illuminate\Support\Facades\Crypt::decrypt($request->retainer_id);
        $retainer   = Retainer::find($retainerID);


        if ($retainer) {
            // dd($invoice);
            if (Auth::check()) {
                $payment   = $this->paymentConfig();
                $settings  = DB::table('settings')->where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('value', 'name');
            } else {
                $payment_setting = Utility::getNonAuthCompanyPaymentSetting($retainer->created_by);
                $this->coingate_auth_token = isset($payment_setting['coingate_auth_token']) ? $payment_setting['coingate_auth_token'] : '';
                $this->mode                = isset($payment_setting['coingate_mode']) ? $payment_setting['coingate_mode'] : 'off';
                $this->is_enabled          = isset($payment_setting['is_coingate_enabled']) ? $payment_setting['is_coingate_enabled'] : 'off';
                $settings = Utility::settingsById($retainer->created_by);
            }
            $orderID   = strtoupper(str_replace('.', '', uniqid('', true)));
            $result    = array();
            $price = $request->amount;
            if ($price > 0) {
                CoinGate::config(
                    array(
                        'environment' => $this->mode,
                        'auth_token' => $this->coingate_auth_token,
                        'curlopt_ssl_verifypeer' => FALSE,
                    )
                );
                $post_params = array(
                    'order_id' => time(),
                    'price_amount' => $price,
                    'price_currency' => Utility::getValByName('site_currency'),
                    'receive_currency' => Utility::getValByName('site_currency'),
                    'callback_url' => route(
                        'customer.retainer.coingate',
                        [
                            $request->retainer_id,
                            $price,
                        ]
                    ),
                    'cancel_url' => route('customer.retainer.show', [Crypt::encrypt($request->retainer_id)]),
                    'success_url' => route(
                        'customer.retainer.coingate',
                        [
                            $request->retainer_id,
                            $price,
                        ]
                    ),
                    'title' => __('Retainer') . ' ' . Utility::retainerNumberFormat($settings, $retainer->retainer_id),
                );

                $order = \CoinGate\Merchant\Order::create($post_params);
                if ($order) {
                    return redirect($order->payment_url);
                } else {
                    return redirect()->back()->with('error', __('opps something wren wrong.'));
                }
            } else {
                $res['msg']  = __("Enter valid amount.");
                $res['flag'] = 2;

                return $res;
            }
        } else {
            return redirect()->route('customer.retainer')->with('error', __('Invoice is deleted.'));
        }
    }

    public function getRetainerPaymentStatus(Request $request, $retainer_id, $amount)
    {

        $retainerID = \Illuminate\Support\Facades\Crypt::decrypt($retainer_id);
        $retainer   = Retainer::find($retainerID);
        if (Auth::check()) {
            $payment   = $this->paymentConfig();
            $settings  = DB::table('settings')->where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('value', 'name');
        } else {
            $payment_setting = Utility::getNonAuthCompanyPaymentSetting($retainer->created_by);
            $this->coingate_auth_token = isset($payment_setting['coingate_auth_token']) ? $payment_setting['coingate_auth_token'] : '';
            $this->mode                = isset($payment_setting['coingate_mode']) ? $payment_setting['coingate_mode'] : 'off';
            $this->is_enabled          = isset($payment_setting['is_coingate_enabled']) ? $payment_setting['is_coingate_enabled'] : 'off';
            $settings = Utility::settingsById($retainer->created_by);
        }
        $orderID   = strtoupper(str_replace('.', '', uniqid('', true)));
        $result    = array();

        if ($retainer) {
            $payments = RetainerPayment::create(
                [
                    'retainer_id' => $retainer->id,
                    'date' => date('Y-m-d'),
                    'amount' => $amount,
                    'payment_method' => 1,
                    'order_id' => $orderID,
                    'payment_type' => __('Coingate'),
                    'receipt' => '',
                    'description' => __('Retainer') . ' ' . Utility::retainerNumberFormat($settings, $retainer->retainer_id),
                ]
            );

            $retainer = Retainer::find($retainer->id);

            if ($retainer->getDue() <= 0.0) {
                Retainer::change_status($retainer->id, 4);
            } elseif ($retainer->getDue() > 0) {
                Retainer::change_status($retainer->id, 3);
            } else {
                Retainer::change_status($retainer->id, 2);
            }

            //Twilio Notification
            // $setting  = Utility::settings(\Auth::user()->creatorId());
            // $customer = Customer::find($retainer->customer_id);
            // if(isset($setting['payment_notification']) && $setting['payment_notification'] ==1)
            // {
            //     $msg = __("New payment of").' ' . $amount . __("created for").' ' . $customer->name . __("by").' '.  $payments['payment_type'] . '.';
            //     Utility::send_twilio_msg($customer->contact,$msg);
            // }


            if (Auth::check()) {
                return redirect()->route('customer.retainer.show', \Crypt::encrypt($retainer->id))->with('success', __('Payment successfully added.'));
            } else {
                return redirect()->back()->with('success', __(' Payment successfully added.'));
            }

        }
        else
        {
            if (Auth::check()) {
                return redirect()->route('customer.retainer.show', \Crypt::encrypt($retainer->id))->with('error', __('Transaction has been ' . $status));
            } else {
                return redirect()->back()->with('success', __('Transaction succesfull'));
            }
        }
    }

    public function invoicePayWithCoingate(Request $request)
    {

        $invoiceID = \Illuminate\Support\Facades\Crypt::decrypt($request->invoice_id);
        $invoice   = Invoice::find($invoiceID);


        if ($invoice) {
            // dd($invoice);
            if (Auth::check()) {
                $payment   = $this->paymentConfig();
                $settings  = DB::table('settings')->where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('value', 'name');
            } else {
                $payment_setting = Utility::getNonAuthCompanyPaymentSetting($invoice->created_by);
                $this->coingate_auth_token = isset($payment_setting['coingate_auth_token']) ? $payment_setting['coingate_auth_token'] : '';
                $this->mode                = isset($payment_setting['coingate_mode']) ? $payment_setting['coingate_mode'] : 'off';
                $this->is_enabled          = isset($payment_setting['is_coingate_enabled']) ? $payment_setting['is_coingate_enabled'] : 'off';
                $settings = Utility::settingsById($invoice->created_by);
            }
            $orderID   = strtoupper(str_replace('.', '', uniqid('', true)));
            $result    = array();
            $price = $request->amount;
            if ($price > 0) {
                CoinGate::config(
                    array(
                        'environment' => $this->mode,
                        'auth_token' => $this->coingate_auth_token,
                        'curlopt_ssl_verifypeer' => FALSE,
                    )
                );
                $post_params = array(
                    'order_id' => time(),
                    'price_amount' => $price,
                    'price_currency' => Utility::getValByName('site_currency'),
                    'receive_currency' => Utility::getValByName('site_currency'),
                    'callback_url' => route(
                        'customer.invoice.coingate',
                        [
                            $request->invoice_id,
                            $price,
                        ]
                    ),
                    'cancel_url' => route('invoice.show', [Crypt::encrypt($request->invoice_id)]),
                    'success_url' => route(
                        'customer.invoice.coingate',
                        [
                            $request->invoice_id,
                            $price,
                        ]
                    ),
                    'title' => __('Invoice') . ' ' . Utility::invoiceNumberFormat($settings, $invoice->invoice_id),
                );

                $order = \CoinGate\Merchant\Order::create($post_params);
                if ($order) {
                    return redirect($order->payment_url);
                } else {
                    return redirect()->back()->with('error', __('opps something when wrong.'));
                }
            } else {
                $res['msg']  = __("Enter valid amount.");
                $res['flag'] = 2;

                return $res;
            }
        } else {
            return redirect()->route('invoice.index')->with('error', __('Invoice is deleted.'));
        }
    }

    public function getInvoicePaymentStatus(Request $request, $invoice_id, $amount)
    {
        $invoiceID = \Illuminate\Support\Facades\Crypt::decrypt($invoice_id);
        $invoice   = Invoice::find($invoiceID);
        if (Auth::check()) {
            $payment   = $this->paymentConfig();
            $settings  = DB::table('settings')->where('created_by', '=', \Auth::user()->creatorId())->get()->pluck('value', 'name');
        } else {
            $payment_setting = Utility::getNonAuthCompanyPaymentSetting($invoice->created_by);
            $this->coingate_auth_token = isset($payment_setting['coingate_auth_token']) ? $payment_setting['coingate_auth_token'] : '';
            $this->mode                = isset($payment_setting['coingate_mode']) ? $payment_setting['coingate_mode'] : 'off';
            $this->is_enabled          = isset($payment_setting['is_coingate_enabled']) ? $payment_setting['is_coingate_enabled'] : 'off';
            $settings = Utility::settingsById($invoice->created_by);
        }
        $orderID   = strtoupper(str_replace('.', '', uniqid('', true)));
        $result    = array();

        if ($invoice) {
            $payments = InvoicePayment::create(
                [
                    'invoice_id' => $invoice->id,
                    'date' => date('Y-m-d'),
                    'amount' => $amount,
                    'account_id' => 1,
                    'payment_method' => 1,
                    'order_id' => $orderID,
                    'reference' => '',
                    'payment_type' => __('Coingate'),
                    'receipt' => '',
                    'description' => __('Invoice') . ' ' . Utility::invoiceNumberFormat($settings, $invoice->invoice_id),
                ]
            );

            $invoice = Invoice::find($invoice->id);

            if ($invoice->getDue() <= 0.0) {
                Invoice::change_status($invoice->id, 4);
            } elseif ($invoice->getDue() > 0) {
                Invoice::change_status($invoice->id, 3);
            } else {
                Invoice::change_status($invoice->id, 2);
            }


            //Twilio Notification
            if (Auth::check()){
                $setting  = Utility::settings(\Auth::user()->creatorId());
                }
                $customer = Customer::find($invoice->customer_id);
            if(isset($setting['payment_notification']) && $setting['payment_notification'] ==1)
            {
                $msg = __("New payment of").' ' . $amount . __("created for").' ' . $customer->name . __("by").' '.  $payments['payment_type'] . '.';
                Utility::send_twilio_msg($customer->contact,$msg);
            }


            if (Auth::check()) {
                return redirect()->route('invoice.show', \Crypt::encrypt($invoice->id))->with('success', __('Payment successfully added.'));
            } else {
                return redirect()->back()->with('success', __(' Payment successfully added.'));
            }

        }
        else
        {
            if (Auth::check()) {
                return redirect()->route('invoice.show', \Crypt::encrypt($invoice->id))->with('error', __('Transaction has been ' . $status));
            } else {
                return redirect()->back()->with('success', __('Transaction succesfull'));
            }
        }
    }
}
