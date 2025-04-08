@extends('layouts.admin')
@push('script-page')
@endpush
@section('page-title')
    {{__('Contract')}}
@endsection
@section('title')
    <div class="d-inline-block">
        <h5 class="h4 d-inline-block font-weight-400 mb-0 ">{{__('Contract')}}</h5>
    </div>
@endsection
@section('breadcrumb')

    @if(\Auth::guard('customer')->check())
    <li class="breadcrumb-item"><a href="{{route('customer.dashboard')}}">{{__('Dashboard')}}</a></li>
    @else
    <li class="breadcrumb-item"><a href="{{route('dashboard')}}">{{__('Dashboard')}}</a></li>
    @endif
    <li class="breadcrumb-item active" aria-current="page">{{__('Contract')}}</li>
@endsection

@section('action-btn')
    {{-- <a href="{{ route('contract.grid') }}" class="btn btn-sm btn-primary btn-icon m-1">
        <i class="ti ti-layout-grid text-white" data-bs-toggle="tooltip" data-bs-original-title="{{ __('Grid View') }}">  </i>
    </a> --}}
    @if(\Auth::user()->can('create contract'))
        <div class="float-end">
            <a href="#" data-url="{{ route('contract.create') }}" data-bs-toggle="tooltip" data-size="lg" title="{{__('Create')}}" data-ajax-popup="true" data-title="{{__('Create New Contract')}}" class="btn btn-sm btn-primary">
                <i class="ti ti-plus"></i>
            </a>
        </div>
    @endif
    
@endsection
@section('filter')
@endsection
@section('content')
<div class="row">

        <div class="col-xl-3 col-6 dashboard-card">
            <div class="card comp-card ">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="m-b-20">{{__('Total Contracts')}}</h6>
                            <h3 class="text-primary">{{  $cnt_contract['total'] }}</h3>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-handshake bg-success text-white"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-6 dashboard-card">
            <div class="card comp-card ">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="m-b-20">{{__('This Month Total Contracts')}}</h6>
                            <h3 class="text-info">{{ $cnt_contract['this_month'] }}</h3>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-handshake bg-info text-white"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-6 dashboard-card">
            <div class="card comp-card ">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="m-b-20">{{__('This Week Total Contracts')}}</h6>
                            <h3 class="text-warning">{{ $cnt_contract['this_week'] }}</h3>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-handshake bg-warning text-white"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-6 dashboard-card">
            <div class="card comp-card ">
                <div class="card-body">
                    <div class="row align-items-center">
                        <div class="col">
                            <h6 class="m-b-20">{{__('Last 30 Days Total Contracts')}}</h6>
                            <h3 class="text-danger">{{ $cnt_contract['last_30days'] }}</h3>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-handshake bg-danger text-white"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    <div class="col-xl-12">
        <div class="card">
            <div class="card-header card-body table-border-style">
                <!-- <h5></h5> -->
                <div class="table-responsive">
                    <table class="table datatable">
                        <thead>
                            <tr>
                                @if(\Auth::user()->can('view contract'))
                                    <th scope="col">{{__('#')}}</th>
                                @endif
                                <th scope="col">{{__('Subject')}}</th>
                                @if(Gate::check('manage contract'))
                                    <th scope="col">{{__('Customer')}}</th>
                                @endif
                                <th scope="col">{{__('Type')}}</th>
                                <th scope="col">{{__('Value')}}</th>
                                <th scope="col">{{__('Start Date')}}</th>
                                <th scope="col">{{__('End Date')}}</th>
                                <th scope="col">{{__('Status')}}</th>
                                {{-- <th scope="col">{{__('Description')}}</th>--}}
                                
                                    <th scope="col" class="text-right">{{__('Action')}}</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($contracts as $contract)
    
                            <tr class="font-style">
                            
                                <td>
                                @if(\Auth::user()->type =='company')
                                    @if(\Auth::user()->can('view contract'))
                                    <a href="{{route('contract.show',$contract->id)}}" class="btn btn-outline-primary" >{{\Auth::user()->contractNumberFormat($contract->id)}}</a>
                                    @endif
                                @else
                                    @if(\Auth::user()->can('view contract'))
                                    <a href="{{route('customer.contract.show',$contract->id)}}" class="btn btn-outline-primary" >{{\Auth::user()->contractNumberFormat($contract->id)}}</a>
                                    @endif
                                @endif
                                </td>
                            
                                <td>{{ $contract->subject}}</td>
                                @if(Gate::check('manage contract'))
                                    <td>{{ !empty($contract->clients)?$contract->clients->name:'' }}</td>
                                @endif
                                <td>{{ !empty($contract->types)?$contract->types->name:'' }}</td>
                                <td>{{ \Auth::user()->priceFormat($contract->value) }}</td>
                                <td>{{  \Auth::user()->dateFormat($contract->start_date )}}</td>
                                <td>{{  \Auth::user()->dateFormat($contract->end_date )}}</td>
                                <td>
                                    {{-- @if($contract->status == 'start')
                                    <span class="badge fix_badges bg-primary p-2 px-3 rounded">{{__('Started')}}</span>
                                    @else
                                    <span class="badge fix_badges bg-danger p-2 px-3 rounded">{{__('Close')}}</span>
                                    @endif --}}

                                    @if($contract->edit_status == 'accept')
                                        <span class="status_badge badge bg-primary  p-2 px-3 rounded">{{__('Accept')}}</span>
                                    @elseif($contract->edit_status == 'decline')
                                        <span class="status_badge badge bg-danger p-2 px-3 rounded">{{ __('Decline') }}</span>
                                    @elseif($contract->edit_status == 'pending')  
                                        <span class="status_badge badge bg-warning p-2 px-3 rounded">{{ __('Pending') }}</span>
                                    @endif
                                </td>
                                {{-- <td>
                                    <div class="action-btn bg-warning ms-2">
                                        <a href="#" class="mx-3 btn btn-sm d-inline-flex align-items-center" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal" data-url="{{ route('contract.description',$contract->id) }}" 
                                         data-bs-whatever="{{__('Description')}}"><i class="fa fa-comment text-white" data-bs-toggle="tooltip" data-bs-original-title="{{ __('Description') }}"></i></a>
                                    </div>    
                                </td> --}}
                                
                                    <td class="action text-end">
                                    @if((\Auth::user()->can('duplicate contract')) && ($contract->edit_status == 'accept'))
                                        <div class="action-btn bg-primary ms-2">
                                            <a href="#" class="mx-3 btn btn-sm align-items-center" data-size="lg" data-url="{{ route('contract.duplicate',$contract->id) }}" data-ajax-popup="true" data-title="{{__('Duplicate Contract')}}" data-bs-toggle="tooltip" title="{{__('Duplicate')}}" data-original-title="{{__('Duplicate')}}">
                                                <i class="ti ti-copy text-white"></i>
                                            </a>
                                        </div>
                                    @endif
                                   
                                    @if(\Auth::user()->type =='company')
                                        @if(\Auth::user()->can('view contract'))
                                            <div class="action-btn bg-warning ms-2">
                                                <a href="{{route('contract.show',$contract->id)}}" class="mx-3 btn btn-sm align-items-center"   data-bs-toggle="tooltip" data-bs-original-title="{{__('View')}}">
                                                    <i class="ti ti-eye text-white"></i>
                                                </a>
                                            </div>
                                        @endif
                                    @else
                                            @if(\Auth::user()->can('view contract'))
                                                <div class="action-btn bg-warning ms-2">
                                                    <a href="{{route('customer.contract.show',$contract->id)}}" class="mx-3 btn btn-sm align-items-center"   data-bs-toggle="tooltip" data-bs-original-title="{{__('View')}}">
                                                        <i class="ti ti-eye text-white"></i>
                                                    </a>
                                                </div>
                                            @endif
                                    @endif
                                    

                                    @if(\Auth::user()->can('edit contract'))
                                        <div class="action-btn bg-info ms-2">
                                            <a href="#" class="mx-3 btn btn-sm align-items-center" data-size="lg" data-url="{{ route('contract.edit',$contract->id) }}" data-ajax-popup="true" data-title="{{__('Edit Contract')}}" data-bs-toggle="tooltip" title="{{__('Edit')}}" data-original-title="{{__('Edit')}}">
                                                <i class="ti ti-edit text-white"></i>
                                            </a>
                                        </div>
                                    @endif

                                    @if(\Auth::user()->can('delete contract'))
                                        <div class="action-btn bg-danger ms-2">
                                            {!! Form::open(['method' => 'DELETE', 'route' => ['contract.destroy', $contract->id],'id'=>'delete-form-'.$contract->id]) !!}
                                                <a href="#" class="mx-3 btn btn-sm align-items-center bs-pass-para" data-bs-toggle="tooltip" title="{{__('Delete')}}" data-original-title="{{__('Delete')}}" data-confirm="{{__('Are You Sure?').'|'.__('This action can not be undone. Do you want to continue?')}}" data-confirm-yes="document.getElementById('delete-form-{{$contract->id}}').submit();">
                                                    <i class="ti ti-trash text-white"></i>
                                                </a>
                                            {!! Form::close() !!}
                                        </div>
                                    @endif

                                        <!-- <div class="action-btn bg-info ms-2">
                                            <a href="#" class="mx-3 btn btn-sm d-inline-flex align-items-center" data-bs-toggle="modal"
                                            data-bs-target="#exampleModal" data-size="lg" data-url="{{ route('contract.edit',$contract->id) }}"
                                            data-bs-whatever="{{__('Edit Contract')}}" > <span class="text-white"> <i
                                                    class="ti ti-edit" data-bs-toggle="tooltip" data-bs-original-title="{{ __('Edit') }}"></i></span></a>
                                        </div> -->

                                        <!-- <div class="action-btn bg-danger ms-2">

                                            {!! Form::open(['method' => 'DELETE', 'route' => ['contract.destroy', $contract->id]]) !!}
                                            <a href="#!" class="mx-3 btn btn-sm d-flex align-items-center show_confirm">
                                                <i class="ti ti-trash text-white" data-bs-toggle="tooltip" data-bs-original-title="{{ __('Delete') }}"></i>
                                            </a>
                                            {!! Form::close() !!}
                                        </div> -->
                                    </td>
                                
                            </tr>
                        
                        @endforeach

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

