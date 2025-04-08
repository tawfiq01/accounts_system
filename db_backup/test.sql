-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2025 at 07:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_payment_settings`
--

CREATE TABLE `admin_payment_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `purchase_date` date NOT NULL,
  `supported_date` date NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `holder_name` varchar(191) NOT NULL,
  `bank_name` varchar(191) NOT NULL,
  `account_number` varchar(191) NOT NULL,
  `opening_balance` double(15,2) NOT NULL DEFAULT 0.00,
  `contact_number` varchar(191) NOT NULL,
  `bank_address` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bank_accounts`
--

INSERT INTO `bank_accounts` (`id`, `holder_name`, `bank_name`, `account_number`, `opening_balance`, `contact_number`, `bank_address`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Cash', '', '-', 0.00, '-', '-', 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` varchar(191) NOT NULL DEFAULT '0',
  `vender_id` int(11) NOT NULL,
  `bill_date` date NOT NULL,
  `due_date` date NOT NULL,
  `order_number` int(11) NOT NULL DEFAULT 0,
  `status` int(11) NOT NULL DEFAULT 0,
  `shipping_display` int(11) NOT NULL DEFAULT 1,
  `send_date` date DEFAULT NULL,
  `discount_apply` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_payments`
--

CREATE TABLE `bill_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `account_id` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `reference` varchar(191) NOT NULL,
  `add_receipt` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill_products`
--

CREATE TABLE `bill_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `tax` varchar(50) DEFAULT '0.00',
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `budgets`
--

CREATE TABLE `budgets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `period` varchar(191) NOT NULL,
  `from` varchar(191) DEFAULT NULL,
  `to` varchar(191) DEFAULT NULL,
  `income_data` text DEFAULT NULL,
  `expense_data` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_accounts`
--

CREATE TABLE `chart_of_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `sub_type` int(11) NOT NULL DEFAULT 0,
  `is_enabled` int(11) NOT NULL DEFAULT 1,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_of_accounts`
--

INSERT INTO `chart_of_accounts` (`id`, `name`, `code`, `type`, `sub_type`, `is_enabled`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Accounts Receivable', 120, 1, 1, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(2, 'Computer Equipment', 160, 1, 2, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(3, 'Office Equipment', 150, 1, 2, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(4, 'Inventory', 140, 1, 3, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(5, 'Budget - Finance Staff', 857, 1, 6, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(6, 'Accumulated Depreciation', 170, 1, 7, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(7, 'Accounts Payable', 200, 2, 8, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(8, 'Accruals', 205, 2, 8, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(9, 'Office Equipment', 150, 2, 8, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(10, 'Clearing Account', 855, 2, 8, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(11, 'Employee Benefits Payable', 235, 2, 8, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(12, 'Employee Deductions payable', 236, 2, 8, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(13, 'Historical Adjustments', 255, 2, 8, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(14, 'Revenue Received in Advance', 835, 2, 8, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(15, 'Rounding', 260, 2, 8, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(16, 'Costs of Goods Sold', 500, 3, 11, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(17, 'Advertising', 600, 3, 12, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(18, 'Automobile Expenses', 644, 3, 12, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(19, 'Bad Debts', 684, 3, 12, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(20, 'Bank Revaluations', 810, 3, 12, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(21, 'Bank Service Charges', 605, 3, 12, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(22, 'Consulting & Accounting', 615, 3, 12, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(23, 'Depreciation', 700, 3, 12, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(24, 'General Expenses', 628, 3, 12, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(25, 'Interest Income', 460, 4, 13, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(26, 'Other Revenue', 470, 4, 13, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(27, 'Purchase Discount', 475, 4, 13, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(28, 'Sales', 400, 4, 13, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(29, 'Common Stock', 330, 5, 16, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(30, 'Owners Contribution', 300, 5, 16, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(31, 'Owners Draw', 310, 5, 16, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(32, 'Retained Earnings', 320, 5, 16, 1, NULL, 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_account_sub_types`
--

CREATE TABLE `chart_of_account_sub_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL DEFAULT '1',
  `type` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_of_account_sub_types`
--

INSERT INTO `chart_of_account_sub_types` (`id`, `name`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Current Asset', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(2, 'Fixed Asset', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(3, 'Inventory', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(4, 'Non-current Asset', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(5, 'Prepayment', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(6, 'Bank & Cash', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(7, 'Depreciation', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(8, 'Current Liability', 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(9, 'Liability', 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(10, 'Non-current Liability', 2, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(11, 'Direct Costs', 3, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(12, 'Expense', 3, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(13, 'Revenue', 4, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(14, 'Sales', 4, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(15, 'Other Income', 4, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(16, 'Equity', 5, '2025-04-07 02:19:20', '2025-04-07 02:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `chart_of_account_types`
--

CREATE TABLE `chart_of_account_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chart_of_account_types`
--

INSERT INTO `chart_of_account_types` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Assets', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(2, 'Liabilities', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(3, 'Expenses', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(4, 'Income', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(5, 'Equity', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `company_payment_settings`
--

CREATE TABLE `company_payment_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `value` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer` int(11) NOT NULL DEFAULT 0,
  `subject` varchar(191) DEFAULT NULL,
  `value` double(8,2) NOT NULL DEFAULT 0.00,
  `type` int(11) NOT NULL DEFAULT 0,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `edit_status` varchar(191) NOT NULL DEFAULT 'pending',
  `description` text DEFAULT NULL,
  `notes` longtext DEFAULT NULL,
  `customer_signature` longtext DEFAULT NULL,
  `company_signature` longtext DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_attachments`
--

CREATE TABLE `contract_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` int(11) NOT NULL,
  `files` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_comments`
--

CREATE TABLE `contract_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` int(11) NOT NULL,
  `comment` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_notes`
--

CREATE TABLE `contract_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `contract_id` int(11) NOT NULL,
  `note` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contract_types`
--

CREATE TABLE `contract_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `code` varchar(191) NOT NULL,
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `limit` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `credit_notes`
--

CREATE TABLE `credit_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice` int(11) NOT NULL DEFAULT 0,
  `customer` int(11) NOT NULL DEFAULT 0,
  `amount` double(15,2) NOT NULL DEFAULT 0.00,
  `date` date NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `tax_number` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `contact` varchar(191) DEFAULT NULL,
  `avatar` varchar(100) NOT NULL DEFAULT '',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `billing_name` varchar(191) NOT NULL,
  `billing_country` varchar(191) NOT NULL,
  `billing_state` varchar(191) NOT NULL,
  `billing_city` varchar(191) NOT NULL,
  `billing_phone` varchar(191) NOT NULL,
  `billing_zip` varchar(191) NOT NULL,
  `billing_address` text NOT NULL,
  `shipping_name` varchar(191) DEFAULT NULL,
  `shipping_country` varchar(191) DEFAULT NULL,
  `shipping_state` varchar(191) DEFAULT NULL,
  `shipping_city` varchar(191) DEFAULT NULL,
  `shipping_phone` varchar(191) DEFAULT NULL,
  `shipping_zip` varchar(191) DEFAULT NULL,
  `shipping_address` varchar(191) DEFAULT NULL,
  `lang` varchar(191) NOT NULL DEFAULT 'en',
  `balance` double(8,2) NOT NULL DEFAULT 0.00,
  `remember_token` varchar(100) DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `module` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_values`
--

CREATE TABLE `custom_field_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `record_id` bigint(20) UNSIGNED NOT NULL,
  `field_id` bigint(20) UNSIGNED NOT NULL,
  `value` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `debit_notes`
--

CREATE TABLE `debit_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill` int(11) NOT NULL DEFAULT 0,
  `vendor` int(11) NOT NULL DEFAULT 0,
  `amount` double(15,2) NOT NULL DEFAULT 0.00,
  `date` date NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `from` varchar(191) DEFAULT NULL,
  `slug` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `from`, `slug`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'New Bill Payment', 'AccountGo SaaS', 'new_bill_payment', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(2, 'Customer Invoice Sent', 'AccountGo SaaS', 'customer_invoice_sent', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(3, 'Bill Sent', 'AccountGo SaaS', 'bill_sent', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(4, 'New Invoice Payment', 'AccountGo SaaS', 'new_invoice_payment', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(5, 'Invoice Sent', 'AccountGo SaaS', 'invoice_sent', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(6, 'Payment Reminder', 'AccountGo SaaS', 'payment_reminder', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(7, 'Proposal Sent', 'AccountGo SaaS', 'proposal_sent', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(8, 'User Created', 'AccountGo SaaS', 'user_created', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(9, 'Vendor Bill Sent', 'AccountGo SaaS', 'vendor_bill_sent', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(10, 'New Contract', 'AccountGo SaaS', 'new_contract', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(11, 'Retainer Sent', 'AccountGo SaaS', 'retainer_sent', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(12, 'Customer Retainer Sent', 'AccountGo SaaS', 'customer_retainer_sent', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(13, 'New Retainer Payment', 'AccountGo SaaS', 'new_retainer_payment', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `email_template_langs`
--

CREATE TABLE `email_template_langs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL,
  `lang` varchar(100) NOT NULL,
  `subject` varchar(191) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_template_langs`
--

INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'ar', 'New Bill Payment', '<p>مرحبا ، { payment_name }</p>\n                    <p>&nbsp;</p>\n                    <p>مرحبا بك في { app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>نحن نكتب لإبلاغكم بأننا قد أرسلنا مدفوعات (payment_bill) } الخاصة بك.</p>\n                    <p>&nbsp;</p>\n                    <p>لقد أرسلنا قيمتك { payment_amount } لأجل { payment_bill } قمت بالاحالة في التاريخ { payment_date } من خلال { payment_method }.</p>\n                    <p>&nbsp;</p>\n                    <p>شكرا جزيلا لك وطاب يومك ! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(2, 1, 'da', 'New Bill Payment', '<p>Hej, { payment_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Velkommen til { app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Vi skriver for at informere dig om, at vi har sendt din { payment_bill }-betaling.</p>\n                    <p>&nbsp;</p>\n                    <p>Vi har sendt dit bel&oslash;b { payment_amount } betaling for { payment_bill } undertvist p&aring; dato { payment_date } via { payment_method }.</p>\n                    <p>&nbsp;</p>\n                    <p>Mange tak, og ha en god dag!</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(3, 1, 'de', 'New Bill Payment', '<p>Hi, {payment_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Willkommen bei {app_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Wir schreiben Ihnen mitzuteilen, dass wir Ihre Zahlung von {payment_bill} gesendet haben.</p>\n                    <p>&nbsp;</p>\n                    <p>Wir haben Ihre Zahlung {payment_amount} Zahlung f&uuml;r {payment_bill} am Datum {payment_date} &uuml;ber {payment_method} gesendet.</p>\n                    <p>&nbsp;</p>\n                    <p>Vielen Dank und haben einen guten Tag! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(4, 1, 'en', 'New Bill Payment', '<p>Hi, {payment_name}</p>\n                    <p>Welcome to {app_name}</p>\n                    <p>We are writing to inform you that we has sent your {payment_bill} payment.</p>\n                    <p>We has sent your amount {payment_amount} payment for {payment_bill} submited on date {payment_date} via {payment_method}.</p>\n                    <p>Thank You very much and have a good day !!!!</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(5, 1, 'es', 'New Bill Payment', '<p>Hi, {payment_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Bienvenido a {app_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Estamos escribiendo para informarle que hemos enviado su pago {payment_bill}.</p>\n                    <p>&nbsp;</p>\n                    <p>Hemos enviado su importe {payment_amount} pago para {payment_bill} submitado en la fecha {payment_date} a trav&eacute;s de {payment_method}.</p>\n                    <p>&nbsp;</p>\n                    <p>Thank You very much and have a good day! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(6, 1, 'fr', 'New Bill Payment', '<p>Salut, { payment_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Bienvenue dans { app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Nous vous &eacute;crivons pour vous informer que nous avons envoy&eacute; votre paiement { payment_bill }.</p>\n                    <p>&nbsp;</p>\n                    <p>Nous avons envoy&eacute; votre paiement { payment_amount } pour { payment_bill } soumis &agrave; la date { payment_date } via { payment_method }.</p>\n                    <p>&nbsp;</p>\n                    <p>Merci beaucoup et avez un bon jour ! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(7, 1, 'it', 'New Bill Payment', '<p>Ciao, {payment_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Benvenuti in {app_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Scriviamo per informarti che abbiamo inviato il tuo pagamento {payment_bill}.</p>\n                    <p>&nbsp;</p>\n                    <p>Abbiamo inviato la tua quantit&agrave; {payment_amount} pagamento per {payment_bill} subita alla data {payment_date} tramite {payment_method}.</p>\n                    <p>&nbsp;</p>\n                    <p>Grazie mille e buona giornata! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(8, 1, 'ja', 'New Bill Payment', '<p>こんにちは、 {payment_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_name} へようこそ</p>\n                    <p>&nbsp;</p>\n                    <p>{payment_bill} の支払いを送信したことをお知らせするために執筆しています。</p>\n                    <p>&nbsp;</p>\n                    <p>{payment_date } に提出された {payment_議案} に対する金額 {payment_date} の支払いは、 {payment_method}を介して送信されました。</p>\n                    <p>&nbsp;</p>\n                    <p>ありがとうございます。良い日をお願いします。</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(9, 1, 'nl', 'New Bill Payment', '<p>Hallo, { payment_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Welkom bij { app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Wij schrijven u om u te informeren dat wij uw betaling van { payment_bill } hebben verzonden.</p>\n                    <p>&nbsp;</p>\n                    <p>We hebben uw bedrag { payment_amount } betaling voor { payment_bill } verzonden op datum { payment_date } via { payment_method }.</p>\n                    <p>&nbsp;</p>\n                    <p>Hartelijk dank en hebben een goede dag! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(10, 1, 'pl', 'New Bill Payment', '<p>Witaj, {payment_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Witamy w aplikacji {app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Piszemy, aby poinformować Cię, że wysłaliśmy Twoją płatność {payment_bill }.</p>\n                    <p>&nbsp;</p>\n                    <p>Twoja kwota {payment_amount } została wysłana przez użytkownika {payment_bill } w dniu {payment_date } za pomocą metody {payment_method }.</p>\n                    <p>&nbsp;</p>\n                    <p>Dziękuję bardzo i mam dobry dzień! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(11, 1, 'ru', 'New Bill Payment', '<p>Привет, { payment_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Вас приветствует { app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Мы пишем, чтобы сообщить вам, что мы отправили вашу оплату { payment_bill }.</p>\n                    <p>&nbsp;</p>\n                    <p>Мы отправили вашу сумму оплаты { payment_amount } для { payment_bill }, подав на дату { payment_date } через { payment_method }.</p>\n                    <p>&nbsp;</p>\n                    <p>Большое спасибо и хорошего дня! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(12, 1, 'pt', 'New Bill Payment', '<p>Oi, {payment_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Bem-vindo a {app_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Estamos escrevendo para inform&aacute;-lo que enviamos o seu pagamento {payment_bill}.</p>\n                    <p>&nbsp;</p>\n                    <p>N&oacute;s enviamos sua quantia {payment_amount} pagamento por {payment_bill} requisitado na data {payment_date} via {payment_method}.</p>\n                    <p>&nbsp;</p>\n                    <p>Muito obrigado e tenha um bom dia! !!!</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(13, 2, 'ar', 'Customer Invoice Sent', '<p>مرحبا ، { invoice_name }</p>\n                    <p>مرحبا بك في { app_name }</p>\n                    <p>أتمنى أن يجدك هذا البريد الإلكتروني جيدا برجاء الرجوع الى رقم الفاتورة الملحقة { invoice_number } للخدمة / الخدمة.</p>\n                    <p>ببساطة اضغط على الاختيار بأسفل.</p>\n                    <p>{ invoice_url }</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(14, 2, 'da', 'Customer Invoice Sent', '<p>Hej, { invoice_name }</p>\n                    <p>Velkommen til { app_name }</p>\n                    <p>H&aring;ber denne e-mail finder dig godt! Se vedlagte fakturanummer { invoice_number } for product/service.</p>\n                    <p>Klik p&aring; knappen nedenfor.</p>\n                    <p>{ invoice_url }</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>&nbsp;</p>\n                    <p>Med venlig hilsen</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(15, 2, 'de', 'Customer Invoice Sent', '<p>Hi, {invoice_name}</p>\n                    <p>Willkommen bei {app_name}</p>\n                    <p>Hoffe, diese E-Mail findet dich gut! Bitte beachten Sie die beigef&uuml;gte Rechnungsnummer {invoice_number} f&uuml;r Produkt/Service.</p>\n                    <p>Klicken Sie einfach auf den Button unten.</p>\n                    <p>{invoice_url}</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Vielen Dank,</p>\n                    <p>&nbsp;</p>\n                    <p>Betrachtet,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(16, 2, 'en', 'Customer Invoice Sent', '<p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">Hi, {invoice_name}</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">Welcome to {app_name}</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">Hope this email finds you well! Please see attached invoice number {invoice_number} for product/service.</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">Simply click on the button below.</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">{invoice_url}</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">Feel free to reach out if you have any questions.</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">Thank You,</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">Regards,</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">{company_name}</span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\">{app_url}</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(17, 2, 'es', 'Customer Invoice Sent', '<p>Hi, {invoice_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Bienvenido a {app_name}</p>+\n                    <p>&nbsp;</p>\n                    <p>&iexcl;Espero que este email le encuentre bien! Consulte el n&uacute;mero de factura adjunto {invoice_number} para el producto/servicio.</p>\n                    <p>&nbsp;</p>\n                    <p>Simplemente haga clic en el bot&oacute;n de abajo.</p>\n                    <p>&nbsp;</p>\n                    <p>{invoice_url}</p>\n                    <p>&nbsp;</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&nbsp;</p>\n                    <p>Gracias,</p>\n                    <p>&nbsp;</p>\n                    <p>Considerando,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(18, 2, 'fr', 'Customer Invoice Sent', '<p>Bonjour, { invoice_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Bienvenue dans { app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Jesp&egrave;re que ce courriel vous trouve bien ! Voir le num&eacute;ro de facture { invoice_number } pour le produit/service.</p>\n                    <p>&nbsp;</p>\n                    <p>Cliquez simplement sur le bouton ci-dessous.</p>\n                    <p>&nbsp;</p>\n                    <p>{ invoice_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>&nbsp;</p>\n                    <p>Merci,</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(19, 2, 'it', 'Customer Invoice Sent', '<p>Ciao, {invoice_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Benvenuti in {app_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Spero che questa email ti trovi bene! Si prega di consultare il numero di fattura collegato {invoice_number} per il prodotto/servizio.</p>\n                    <p>&nbsp;</p>\n                    <p>Semplicemente clicca sul pulsante sottostante.</p>\n                    <p>&nbsp;</p>\n                    <p>{invoice_url}</p>\n                    <p>&nbsp;</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>&nbsp;</p>\n                    <p>Grazie,</p>\n                    <p>&nbsp;</p>\n                    <p>Riguardo,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(20, 2, 'ja', 'Customer Invoice Sent', '<p>こんにちは、 {invoice_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_name} へようこそ</p>\n                    <p>&nbsp;</p>\n                    <p>この E メールでよくご確認ください。 製品 / サービスについては、添付された請求書番号 {invoice_number} を参照してください。</p>\n                    <p>&nbsp;</p>\n                    <p>以下のボタンをクリックしてください。</p>\n                    <p>&nbsp;</p>\n                    <p>{invoice_url}</p>\n                    <p>&nbsp;</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>&nbsp;</p>\n                    <p>ありがとうございます</p>\n                    <p>&nbsp;</p>\n                    <p>よろしく</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(21, 2, 'nl', 'Customer Invoice Sent', '<p>Hallo, { invoice_name }</p>\n                    <p>Welkom bij { app_name }</p>\n                    <p>Hoop dat deze e-mail je goed vindt! Zie bijgevoegde factuurnummer { invoice_number } voor product/service.</p>\n                    <p>Klik gewoon op de knop hieronder.</p>\n                    <p>{ invoice_url }</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank U,</p>\n                    <p>Betreft:</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(22, 2, 'pl', 'Customer Invoice Sent', '<p>Witaj, {invoice_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Witamy w aplikacji {app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Mam nadzieję, że ta wiadomość znajdzie Cię dobrze! Sprawdź załączoną fakturę numer {invoice_number } dla produktu/usługi.</p>\n                    <p>&nbsp;</p>\n                    <p>Wystarczy kliknąć na przycisk poniżej.</p>\n                    <p>&nbsp;</p>\n                    <p>{invoice_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>&nbsp;</p>\n                    <p>Dziękuję,</p>\n                    <p>&nbsp;</p>\n                    <p>W odniesieniu do</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(23, 2, 'ru', 'Customer Invoice Sent', '<p>Привет, { invoice_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Вас приветствует { app_name }</p>\n                    <p>&nbsp;</p>\n                    <p>Надеюсь, это электронное письмо найдет вас хорошо! См. вложенный номер счета-фактуры { invoice_number } для производства/услуги.</p>\n                    <p>&nbsp;</p>\n                    <p>Просто нажмите на кнопку внизу.</p>\n                    <p>&nbsp;</p>\n                    <p>{ invoice_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>&nbsp;</p>\n                    <p>Спасибо.</p>\n                    <p>&nbsp;</p>\n                    <p>С уважением,</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>&nbsp;</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(24, 2, 'pt', 'Customer Invoice Sent', '<p>Oi, {invoice_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Bem-vindo a {app_name}</p>\n                    <p>&nbsp;</p>\n                    <p>Espero que este e-mail encontre voc&ecirc; bem! Por favor, consulte o n&uacute;mero da fatura anexa {invoice_number} para produto/servi&ccedil;o.</p>\n                    <p>&nbsp;</p>\n                    <p>Basta clicar no bot&atilde;o abaixo.</p>\n                    <p>&nbsp;</p>\n                    <p>{invoice_url}</p>\n                    <p>&nbsp;</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>&nbsp;</p>\n                    <p>Obrigado,</p>\n                    <p>&nbsp;</p>\n                    <p>Considera,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>&nbsp;</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(25, 3, 'ar', 'Bill Sent', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">مرحبا ، { bill_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">مرحبا بك في { app_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">أتمنى أن يجدك هذا البريد الإلكتروني جيدا ! ! برجاء الرجوع الى رقم الفاتورة الملحقة { bill_number } للحصول على المنتج / الخدمة.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">ببساطة اضغط على الاختيار بأسفل.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ bill_url }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">شكرا لك</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Regards,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ company_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_url }</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(26, 3, 'da', 'Bill Sent', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hej, { bill_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Velkommen til { app_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">H&aring;ber denne e-mail finder dig godt! Se vedlagte fakturanummer } { bill_number } for product/service.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Klik p&aring; knappen nedenfor.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ bill_url }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Tak.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Med venlig hilsen</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ company_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_url }</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(27, 3, 'de', 'Bill Sent', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hi, {bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Willkommen bei {app_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hoffe, diese E-Mail findet dich gut!! Sehen Sie sich die beigef&uuml;gte Rechnungsnummer {bill_number} f&uuml;r Produkt/Service an.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Klicken Sie einfach auf den Button unten.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Vielen Dank,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betrachtet,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(28, 3, 'en', 'Bill Sent', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hi, {bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Welcome to {app_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hope this email finds you well!! Please see attached bill number {bill_number} for product/service.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Simply click on the button below.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Feel free to reach out if you have any questions.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Thank You,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Regards,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(29, 3, 'es', 'Bill Sent', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hi,&nbsp;{bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Bienvenido a {app_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">&iexcl;Espero que este correo te encuentre bien!! Consulte el n&uacute;mero de factura adjunto {bill_number} para el producto/servicio.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Simplemente haga clic en el bot&oacute;n de abajo.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Gracias,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Considerando,</span></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(30, 3, 'fr', 'Bill Sent', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Salut,&nbsp;{bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Bienvenue dans { app_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Jesp&egrave;re que ce courriel vous trouve bien ! ! Veuillez consulter le num&eacute;ro de facture {bill_number}&nbsp;associ&eacute; au produit / service.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Cliquez simplement sur le bouton ci-dessous.</span></p>\n                    <p><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Merci,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Regards,</span></p>\n                    <p><span style=\"font-family: sans-serif;\">{company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(31, 3, 'it', 'Bill Sent', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Ciao, {bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Benvenuti in {app_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Spero che questa email ti trovi bene!! Si prega di consultare il numero di fattura allegato {bill_number} per il prodotto/servizio.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Semplicemente clicca sul pulsante sottostante.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Sentiti libero di raggiungere se hai domande.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Grazie,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Riguardo,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(32, 3, 'ja', 'Bill Sent', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">こんにちは、 {bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_name} へようこそ</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">この E メールによりよく検出されます !! 製品 / サービスの添付された請求番号 {bill_number} を参照してください。</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">以下のボタンをクリックしてください。</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">質問がある場合は、自由に連絡してください。</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">ありがとうございます</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">よろしく</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(33, 3, 'nl', 'Bill Sent', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hallo, { bill_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Welkom bij { app_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hoop dat deze e-mail je goed vindt!! Zie bijgevoegde factuurnummer { bill_number } voor product/service.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Klik gewoon op de knop hieronder.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ bill_url }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Voel je vrij om uit te reiken als je vragen hebt.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dank U,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Betreft:</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ company_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_url }</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(34, 3, 'pl', 'Bill Sent', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Witaj,&nbsp;{bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Witamy w aplikacji {app_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Mam nadzieję, że ta wiadomość e-mail znajduje Cię dobrze!! Zapoznaj się z załączonym numerem rachunku {bill_number } dla produktu/usługi.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Wystarczy kliknąć na przycisk poniżej.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Czuj się swobodnie, jeśli masz jakieś pytania.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Dziękuję,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">W odniesieniu do</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{company_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url }</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(35, 3, 'ru', 'Bill Sent', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Привет, { bill_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Вас приветствует { app_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Надеюсь, это письмо найдет вас хорошо! См. прилагаемый номер счета { bill_number } для product/service.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Просто нажмите на кнопку внизу.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ bill_url }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Не стеснитесь, если у вас есть вопросы.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Спасибо.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">С уважением,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ company_name }</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{ app_url }</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(36, 3, 'pt', 'Bill Sent', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Oi, {bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Bem-vindo a {app_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Espero que este e-mail encontre voc&ecirc; bem!! Por favor, consulte o n&uacute;mero de faturamento conectado {bill_number} para produto/servi&ccedil;o.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Basta clicar no bot&atilde;o abaixo.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Obrigado,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Considera,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(37, 4, 'ar', 'New Invoice Payment', '<p>مرحبا</p>\n                    <p>مرحبا بك في { app_name }</p>\n                    <p>عزيزي { payment_name }</p>\n                    <p>لقد قمت باستلام المبلغ الخاص بك {payment_amount}&nbsp; لبرنامج { invoice_number } الذي تم تقديمه في التاريخ { payment_date }</p>\n                    <p>مقدار الاستحقاق { invoice_number } الخاص بك هو {payment_dueAmount}</p>\n                    <p>ونحن نقدر الدفع الفوري لكم ونتطلع إلى استمرار العمل معكم في المستقبل.</p>\n                    <p>&nbsp;</p>\n                    <p>شكرا جزيلا لكم ويوم جيد ! !</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(38, 4, 'da', 'New Invoice Payment', '<p>Hej.</p>\n                    <p>Velkommen til { app_name }</p>\n                    <p>K&aelig;re { payment_name }</p>\n                    <p>Vi har modtaget din m&aelig;ngde { payment_amount } betaling for { invoice_number } undert.d. p&aring; dato { payment_date }</p>\n                    <p>Dit { invoice_number } Forfaldsbel&oslash;b er { payment_dueAmount }</p>\n                    <p>Vi s&aelig;tter pris p&aring; din hurtige betaling og ser frem til fortsatte forretninger med dig i fremtiden.</p>\n                    <p>Mange tak, og ha en god dag!</p>\n                    <p>&nbsp;</p>\n                    <p>Med venlig hilsen</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(39, 4, 'de', 'New Invoice Payment', '<p>Hi,</p>\n                    <p>Willkommen bei {app_name}</p>\n                    <p>Sehr geehrter {payment_name}</p>\n                    <p>Wir haben Ihre Zahlung {payment_amount} f&uuml;r {invoice_number}, die am Datum {payment_date} &uuml;bergeben wurde, erhalten.</p>\n                    <p>Ihr {invoice_number} -f&auml;lliger Betrag ist {payment_dueAmount}</p>\n                    <p>Wir freuen uns &uuml;ber Ihre prompte Bezahlung und freuen uns auf das weitere Gesch&auml;ft mit Ihnen in der Zukunft.</p>\n                    <p>Vielen Dank und habe einen guten Tag!!</p>\n                    <p>&nbsp;</p>\n                    <p>Betrachtet,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(40, 4, 'en', 'New Invoice Payment', '<p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">Hi,</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">Welcome to {app_name}</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">Dear {payment_name}</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">We have recieved your amount {payment_amount} payment for {invoice_number} submited on date {payment_date}</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">Your {invoice_number} Due amount is {payment_dueAmount}</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">We appreciate your prompt payment and look forward to continued business with you in the future.</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">Thank you very much and have a good day!!</span></span></p>\n                    <p>&nbsp;</p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">Regards,</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">{company_name}</span></span></p>\n                    <p><span style=\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\"><span style=\"font-size: 15px; font-variant-ligatures: common-ligatures;\">{app_url}</span></span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(41, 4, 'es', 'New Invoice Payment', '<p>Hola,</p>\n                    <p>Bienvenido a {app_name}</p>\n                    <p>Estimado {payment_name}</p>\n                    <p>Hemos recibido su importe {payment_amount} pago para {invoice_number} submitado en la fecha {payment_date}</p>\n                    <p>El importe de {invoice_number} Due es {payment_dueAmount}</p>\n                    <p>Agradecemos su pronto pago y esperamos continuar con sus negocios con usted en el futuro.</p>\n                    <p>Muchas gracias y que tengan un buen d&iacute;a!!</p>\n                    <p>&nbsp;</p>\n                    <p>Considerando,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(42, 4, 'fr', 'New Invoice Payment', '<p>Salut,</p>\n                    <p>Bienvenue dans { app_name }</p>\n                    <p>Cher { payment_name }</p>\n                    <p>Nous avons re&ccedil;u votre montant { payment_amount } de paiement pour { invoice_number } soumis le { payment_date }</p>\n                    <p>Votre {invoice_number} Montant d&ucirc; est { payment_dueAmount }</p>\n                    <p>Nous appr&eacute;cions votre rapidit&eacute; de paiement et nous attendons avec impatience de poursuivre vos activit&eacute;s avec vous &agrave; lavenir.</p>\n                    <p>Merci beaucoup et avez une bonne journ&eacute;e ! !</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(43, 4, 'it', 'New Invoice Payment', '<p>Ciao,</p>\n                    <p>Benvenuti in {app_name}</p>\n                    <p>Caro {payment_name}</p>\n                    <p>Abbiamo ricevuto la tua quantit&agrave; {payment_amount} pagamento per {invoice_number} subita alla data {payment_date}</p>\n                    <p>Il tuo {invoice_number} A somma cifra &egrave; {payment_dueAmount}</p>\n                    <p>Apprezziamo il tuo tempestoso pagamento e non vedo lora di continuare a fare affari con te in futuro.</p>\n                    <p>Grazie mille e buona giornata!!</p>\n                    <p>&nbsp;</p>\n                    <p>Riguardo,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(44, 4, 'ja', 'New Invoice Payment', '<p>こんにちは。</p>\n                    <p>{app_name} へようこそ</p>\n                    <p>{ payment_name} に出れます</p>\n                    <p>{ payment_date} 日付で提出された {請求書番号} の支払金額 } の金額を回収しました。 }</p>\n                    <p>お客様の {請求書番号} 予定額は {payment_dueAmount} です</p>\n                    <p>お客様の迅速な支払いを評価し、今後も継続してビジネスを継続することを期待しています。</p>\n                    <p>ありがとうございます。良い日をお願いします。</p>\n                    <p>&nbsp;</p>\n                    <p>よろしく</p>\n                    <p>{ company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20');
INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(45, 4, 'nl', 'New Invoice Payment', '<p>Hallo,</p>\n                    <p>Welkom bij { app_name }</p>\n                    <p>Beste { payment_name }</p>\n                    <p>We hebben uw bedrag ontvangen { payment_amount } betaling voor { invoice_number } ingediend op datum { payment_date }</p>\n                    <p>Uw { invoice_number } verschuldigde bedrag is { payment_dueAmount }</p>\n                    <p>Wij waarderen uw snelle betaling en kijken uit naar verdere zaken met u in de toekomst.</p>\n                    <p>Hartelijk dank en hebben een goede dag!!</p>\n                    <p>&nbsp;</p>\n                    <p>Betreft:</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(46, 4, 'pl', 'New Invoice Payment', '<p>Witam,</p>\n                    <p>Witamy w aplikacji {app_name }</p>\n                    <p>Droga {payment_name }</p>\n                    <p>Odebrano kwotę {payment_amount } płatności za {invoice_number } w dniu {payment_date }, kt&oacute;ry został zastąpiony przez użytkownika.</p>\n                    <p>{invoice_number } Kwota należna: {payment_dueAmount }</p>\n                    <p>Doceniamy Twoją szybką płatność i czekamy na kontynuację działalności gospodarczej z Tobą w przyszłości.</p>\n                    <p>Dziękuję bardzo i mam dobry dzień!!</p>\n                    <p>&nbsp;</p>\n                    <p>W odniesieniu do</p>\n                    <p>{company_name }</p>\n                    <p>{app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(47, 4, 'ru', 'New Invoice Payment', '<p>Привет.</p>\n                    <p>Вас приветствует { app_name }</p>\n                    <p>Дорогая { payment_name }</p>\n                    <p>Мы получили вашу сумму оплаты {payment_amount} для { invoice_number }, подавшей на дату { payment_date }</p>\n                    <p>Ваша { invoice_number } Должная сумма-{ payment_dueAmount }</p>\n                    <p>Мы ценим вашу своевременную оплату и надеемся на продолжение бизнеса с вами в будущем.</p>\n                    <p>Большое спасибо и хорошего дня!!</p>\n                    <p>&nbsp;</p>\n                    <p>С уважением,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(48, 4, 'pt', 'New Invoice Payment', '<p>Oi,</p>\n                    <p>Bem-vindo a {app_name}</p>\n                    <p>Querido {payment_name}</p>\n                    <p>N&oacute;s recibimos sua quantia {payment_amount} pagamento para {invoice_number} requisitado na data {payment_date}</p>\n                    <p>Sua quantia {invoice_number} Due &eacute; {payment_dueAmount}</p>\n                    <p>Agradecemos o seu pronto pagamento e estamos ansiosos para continuarmos os neg&oacute;cios com voc&ecirc; no futuro.</p>\n                    <p>Muito obrigado e tenha um bom dia!!</p>\n                    <p>&nbsp;</p>\n                    <p>Considera,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(49, 5, 'ar', 'Invoice Sent', '<p>مرحبا { invoice_name },</p>\n                    <p>أتمنى أن يجدك هذا البريد الإلكتروني جيدا برجاء الرجوع الى رقم الفاتورة الملحقة { invoice_number } للخدمة / الخدمة.</p>\n                    <p>ببساطة اضغط على الاختيار بأسفل</p>\n                    <p>{ invoice_url }</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لعملك ! !</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(50, 5, 'da', 'Invoice Sent', '<p>Hallo { invoice_name },</p>\n                    <p>H&aring;ber denne e-mail finder dig godt! Se vedlagte fakturanummer { invoice_number } for product/service.</p>\n                    <p>Klik p&aring; knappen nedenfor</p>\n                    <p>{ invoice_url }</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak for din virksomhed!</p>\n                    <p>&nbsp;</p>\n                    <p>Med venlig hilsen</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(51, 5, 'de', 'Invoice Sent', '<p>Hello {invoice_name},</p>\n                    <p>Hoffe, diese E-Mail findet dich gut! Bitte beachten Sie die beigef&uuml;gte Rechnungsnummer {invoice_number} f&uuml;r Produkt/Service.</p>\n                    <p>Klicken Sie einfach auf den Button unten</p>\n                    <p>{invoice_url}</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Vielen Dank f&uuml;r Ihr Unternehmen!!</p>\n                    <p>&nbsp;</p>\n                    <p>Betrachtet,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(52, 5, 'en', 'Invoice Sent', '<p>Hello {invoice_name},</p>\n                    <p>Hope this email finds you well! Please see attached invoice number {invoice_number} for product/service.</p>\n                    <p>Simply click on the button below</p>\n                    <p>{invoice_url}</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you for your business!!</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{company_name}<br />{app_url}</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(53, 5, 'es', 'Invoice Sent', '<p>Hello {invoice_name},</p>\n                    <p>&iexcl;Espero que este email le encuentre bien! Consulte el n&uacute;mero de factura adjunto {invoice_number} para el producto/servicio.</p>\n                    <p>Simplemente haga clic en el bot&oacute;n de abajo</p>\n                    <p>{invoice_url}</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias por su negocio!!</p>\n                    <p>&nbsp;</p>\n                    <p>Considerando,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(54, 5, 'fr', 'Invoice Sent', '<p>Bonjour {invoice_name},</p>\n                    <p>Jesp&egrave;re que ce courriel vous trouve bien ! Voir le num&eacute;ro de facture { invoice_number } pour le produit/service.</p>\n                    <p>Cliquez simplement sur le bouton ci-dessous</p>\n                    <p>{ invoice_url}</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Merci pour votre entreprise ! !</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(55, 5, 'it', 'Invoice Sent', '<p>Ciao {invoice_name},</p>\n                    <p>Spero che questa email ti trovi bene! Si prega di consultare il numero di fattura collegato {invoice_number} per il prodotto/servizio.</p>\n                    <p>Semplicemente clicca sul pulsante sottostante</p>\n                    <p>{invoice_url}</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie per il tuo business!!</p>\n                    <p>&nbsp;</p>\n                    <p>&nbsp;</p>\n                    <p>Riguardo,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(56, 5, 'ja', 'Invoice Sent', '<p>こんにちは {invoice_name}、</p>\n                    <p>この E メールでよくご確認ください。 製品 / サービスについては、添付された請求書番号 {invoice_number} を参照してください。</p>\n                    <p>以下のボタンをクリックしてください。</p>\n                    <p>{invoice_url}</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>お客様のビジネスに感謝します。</p>\n                    <p>&nbsp;</p>\n                    <p>よろしく</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(57, 5, 'nl', 'Invoice Sent', '<p>Hallo { invoice_name },</p>\n                    <p>Hoop dat deze e-mail je goed vindt! Zie bijgevoegde factuurnummer { invoice_number } voor product/service.</p>\n                    <p>Klik gewoon op de knop hieronder</p>\n                    <p>{ invoice_url }</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u voor uw bedrijf!!</p>\n                    <p>&nbsp;</p>\n                    <p>Betreft:</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(58, 5, 'pl', 'Invoice Sent', '<p>Witaj {invoice_name },</p>\n                    <p>Mam nadzieję, że ta wiadomość znajdzie Cię dobrze! Sprawdź załączoną fakturę numer {invoice_number } dla produktu/usługi.</p>\n                    <p>Wystarczy kliknąć na przycisk poniżej</p>\n                    <p>{invoice_url }</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy za prowadzenie działalności!!</p>\n                    <p>&nbsp;</p>\n                    <p>W odniesieniu do</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name }</p>\n                    <p>{app_url }</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(59, 5, 'ru', 'Invoice Sent', '<p>Здравствуйте, { invice_name },</p>\n                    <p>Надеюсь, это электронное письмо найдет вас хорошо! См. вложенный номер счета-фактуры { invoice_number } для производства/услуги.</p>\n                    <p>Просто нажмите на кнопку ниже</p>\n                    <p>{ invoice_url }</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо за ваше дело!</p>\n                    <p>&nbsp;</p>\n                    <p>С уважением,</p>\n                    <p>&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(60, 5, 'pt', 'Invoice Sent', '<p>Ol&aacute; {invoice_name},</p>\n                    <p>Espero que este e-mail encontre voc&ecirc; bem! Por favor, consulte o n&uacute;mero da fatura anexa {invoice_number} para produto/servi&ccedil;o.</p>\n                    <p>Basta clicar no bot&atilde;o abaixo</p>\n                    <p>{invoice_url}</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado pelo seu neg&oacute;cio!!</p>\n                    <p>&nbsp;</p>\n                    <p>Considera,</p>\n                    <p>&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(61, 6, 'ar', 'Payment Reminder', '<p>عزيزي ، { payment_name }</p>\n                    <p>آمل أن تكون بخير. هذا مجرد تذكير بأن الدفع على الفاتورة { invoice_number } الاجمالي { payment_dueAmount } ، والتي قمنا بارسالها على { payment_date } مستحق اليوم.</p>\n                    <p>يمكنك دفع مبلغ لحساب البنك المحدد على الفاتورة.</p>\n                    <p>أنا متأكد أنت مشغول ، لكني أقدر إذا أنت يمكن أن تأخذ a لحظة ونظرة على الفاتورة عندما تحصل على فرصة.</p>\n                    <p>إذا كان لديك أي سؤال مهما يكن ، يرجى الرد وسأكون سعيدا لتوضيحها.</p>\n                    <p>&nbsp;</p>\n                    <p>شكرا&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(62, 6, 'da', 'Payment Reminder', '<p>K&aelig;re, { payment_name }</p>\n                    <p>Dette er blot en p&aring;mindelse om, at betaling p&aring; faktura { invoice_number } i alt { payment_dueAmount}, som vi sendte til { payment_date }, er forfalden i dag.</p>\n                    <p>Du kan foretage betalinger til den bankkonto, der er angivet p&aring; fakturaen.</p>\n                    <p>Jeg er sikker p&aring; du har travlt, men jeg ville s&aelig;tte pris p&aring;, hvis du kunne tage et &oslash;jeblik og se p&aring; fakturaen, n&aring;r du f&aring;r en chance.</p>\n                    <p>Hvis De har nogen sp&oslash;rgsm&aring;l, s&aring; svar venligst, og jeg vil med gl&aelig;de tydeligg&oslash;re dem.</p>\n                    <p>&nbsp;</p>\n                    <p>Tak.&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(63, 6, 'de', 'Payment Reminder', '<p>Sehr geehrte/r, {payment_name}</p>\n                    <p>Ich hoffe, Sie sind gut. Dies ist nur eine Erinnerung, dass die Zahlung auf Rechnung {invoice_number} total {payment_dueAmount}, die wir gesendet am {payment_date} ist heute f&auml;llig.</p>\n                    <p>Sie k&ouml;nnen die Zahlung auf das auf der Rechnung angegebene Bankkonto vornehmen.</p>\n                    <p>Ich bin sicher, Sie sind besch&auml;ftigt, aber ich w&uuml;rde es begr&uuml;&szlig;en, wenn Sie einen Moment nehmen und &uuml;ber die Rechnung schauen k&ouml;nnten, wenn Sie eine Chance bekommen.</p>\n                    <p>Wenn Sie irgendwelche Fragen haben, antworten Sie bitte und ich w&uuml;rde mich freuen, sie zu kl&auml;ren.</p>\n                    <p>&nbsp;</p>\n                    <p>Danke,&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(64, 6, 'en', 'Payment Reminder', '<p>Dear, {payment_name}</p>\n                    <p>I hope you&rsquo;re well.This is just a reminder that payment on invoice {invoice_number} total dueAmount {payment_dueAmount} , which we sent on {payment_date} is due today.</p>\n                    <p>You can make payment to the bank account specified on the invoice.</p>\n                    <p>I&rsquo;m sure you&rsquo;re busy, but I&rsquo;d appreciate if you could take a moment and look over the invoice when you get a chance.</p>\n                    <p>If you have any questions whatever, please reply and I&rsquo;d be happy to clarify them.</p>\n                    <p>&nbsp;</p>\n                    <p>Thanks,&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(65, 6, 'es', 'Payment Reminder', '<p>Estimado, {payment_name}</p>\n                    <p>Espero que est&eacute;s bien. Esto es s&oacute;lo un recordatorio de que el pago en la factura {invoice_number} total {payment_dueAmount}, que enviamos en {payment_date} se vence hoy.</p>\n                    <p>Puede realizar el pago a la cuenta bancaria especificada en la factura.</p>\n                    <p>Estoy seguro de que est&aacute;s ocupado, pero agradecer&iacute;a si podr&iacute;as tomar un momento y mirar sobre la factura cuando tienes una oportunidad.</p>\n                    <p>Si tiene alguna pregunta, por favor responda y me gustar&iacute;a aclararlas.</p>\n                    <p>&nbsp;</p>\n                    <p>Gracias,&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(66, 6, 'fr', 'Payment Reminder', '<p>Cher, { payment_name }</p>\n                    <p>Jesp&egrave;re que vous &ecirc;tes bien, ce nest quun rappel que le paiement sur facture {invoice_number}total { payment_dueAmount }, que nous avons envoy&eacute; le {payment_date} est d&ucirc; aujourdhui.</p>\n                    <p>Vous pouvez effectuer le paiement sur le compte bancaire indiqu&eacute; sur la facture.</p>\n                    <p>Je suis s&ucirc;r que vous &ecirc;tes occup&eacute;, mais je vous serais reconnaissant de prendre un moment et de regarder la facture quand vous aurez une chance.</p>\n                    <p>Si vous avez des questions, veuillez r&eacute;pondre et je serais heureux de les clarifier.</p>\n                    <p>&nbsp;</p>\n                    <p>Merci,&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(67, 6, 'it', 'Payment Reminder', '<p>Caro, {payment_name}</p>\n                    <p>Spero che tu stia bene, questo &egrave; solo un promemoria che il pagamento sulla fattura {invoice_number} totale {payment_dueAmount}, che abbiamo inviato su {payment_date} &egrave; dovuto oggi.</p>\n                    <p>&Egrave; possibile effettuare il pagamento al conto bancario specificato sulla fattura.</p>\n                    <p>Sono sicuro che sei impegnato, ma apprezzerei se potessi prenderti un momento e guardare la fattura quando avrai una chance.</p>\n                    <p>Se avete domande qualunque, vi prego di rispondere e sarei felice di chiarirle.</p>\n                    <p>&nbsp;</p>\n                    <p>Grazie,&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(68, 6, 'ja', 'Payment Reminder', '<p>ID、 {payment_name}</p>\n                    <p>これは、 { payment_dueAmount} の合計 {payment_dueAmount } に対する支払いが今日予定されていることを思い出させていただきたいと思います。</p>\n                    <p>請求書に記載されている銀行口座に対して支払いを行うことができます。</p>\n                    <p>お忙しいのは確かですが、機会があれば、少し時間をかけてインボイスを見渡すことができればありがたいのですが。</p>\n                    <p>何か聞きたいことがあるなら、お返事をお願いしますが、喜んでお答えします。</p>\n                    <p>&nbsp;</p>\n                    <p>ありがとう。&nbsp;</p>\n                    <p>{ company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(69, 6, 'nl', 'Payment Reminder', '<p>Geachte, { payment_name }</p>\n                    <p>Ik hoop dat u goed bent. Dit is gewoon een herinnering dat betaling op factuur { invoice_number } totaal { payment_dueAmount }, die we verzonden op { payment_date } is vandaag verschuldigd.</p>\n                    <p>U kunt betaling doen aan de bankrekening op de factuur.</p>\n                    <p>Ik weet zeker dat je het druk hebt, maar ik zou het op prijs stellen als je even over de factuur kon kijken als je een kans krijgt.</p>\n                    <p>Als u vragen hebt, beantwoord dan uw antwoord en ik wil ze graag verduidelijken.</p>\n                    <p>&nbsp;</p>\n                    <p>Bedankt.&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(70, 6, 'pl', 'Payment Reminder', '<p>Drogi, {payment_name }</p>\n                    <p>Mam nadzieję, że jesteś dobrze. To jest tylko przypomnienie, że płatność na fakturze {invoice_number } total {payment_dueAmount }, kt&oacute;re wysłaliśmy na {payment_date } jest dzisiaj.</p>\n                    <p>Płatność można dokonać na rachunek bankowy podany na fakturze.</p>\n                    <p>Jestem pewien, że jesteś zajęty, ale byłbym wdzięczny, gdybyś m&oacute;gł wziąć chwilę i spojrzeć na fakturę, kiedy masz szansę.</p>\n                    <p>Jeśli masz jakieś pytania, proszę o odpowiedź, a ja chętnie je wyjaśniam.</p>\n                    <p>&nbsp;</p>\n                    <p>Dziękuję,&nbsp;</p>\n                    <p>{company_name }</p>\n                    <p>{app_url }</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(71, 6, 'ru', 'Payment Reminder', '<p>Уважаемый, { payment_name }</p>\n                    <p>Я надеюсь, что вы хорошо. Это просто напоминание о том, что оплата по счету { invoice_number } всего { payment_dueAmount }, которое мы отправили в { payment_date }, сегодня.</p>\n                    <p>Вы можете произвести платеж на банковский счет, указанный в счете-фактуре.</p>\n                    <p>Я уверена, что ты занята, но я была бы признательна, если бы ты смог бы поглядеться на счет, когда у тебя появится шанс.</p>\n                    <p>Если у вас есть вопросы, пожалуйста, ответьте, и я буду рад их прояснить.</p>\n                    <p>&nbsp;</p>\n                    <p>Спасибо.&nbsp;</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(72, 6, 'pt', 'Payment Reminder', '<p>Querido, {payment_name}</p>\n                    <p>Espero que voc&ecirc; esteja bem. Este &eacute; apenas um lembrete de que o pagamento na fatura {invoice_number} total {payment_dueAmount}, que enviamos em {payment_date} &eacute; devido hoje.</p>\n                    <p>Voc&ecirc; pode fazer o pagamento &agrave; conta banc&aacute;ria especificada na fatura.</p>\n                    <p>Eu tenho certeza que voc&ecirc; est&aacute; ocupado, mas eu agradeceria se voc&ecirc; pudesse tirar um momento e olhar sobre a fatura quando tiver uma chance.</p>\n                    <p>Se voc&ecirc; tiver alguma d&uacute;vida o que for, por favor, responda e eu ficaria feliz em esclarec&ecirc;-las.</p>\n                    <p>&nbsp;</p>\n                    <p>Obrigado,&nbsp;</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(73, 7, 'ar', 'Proposal Sent', '<p>مرحبا ، { proposal_name }</p>\n                    <p>أتمنى أن يجدك هذا البريد الإلكتروني جيدا برجاء الرجوع الى رقم الاقتراح المرفق { proposal_number } للمنتج / الخدمة.</p>\n                    <p>اضغط ببساطة على الاختيار بأسفل</p>\n                    <p>{ proposal_url }</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لعملك ! !</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(74, 7, 'da', 'Proposal Sent', '<p>Hej, {proposal__name }</p>\n                    <p>H&aring;ber denne e-mail finder dig godt! Se det vedh&aelig;ftede forslag nummer { proposal_number } for product/service.</p>\n                    <p>klik bare p&aring; knappen nedenfor</p>\n                    <p>{ proposal_url }</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak for din virksomhed!</p>\n                    <p>&nbsp;</p>\n                    <p>Med venlig hilsen</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(75, 7, 'de', 'Proposal Sent', '<p>Hi, {proposal_name}</p>\n                    <p>Hoffe, diese E-Mail findet dich gut! Bitte sehen Sie die angeh&auml;ngte Vorschlagsnummer {proposal_number} f&uuml;r Produkt/Service an.</p>\n                    <p>Klicken Sie einfach auf den Button unten</p>\n                    <p>{proposal_url}</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Vielen Dank f&uuml;r Ihr Unternehmen!!</p>\n                    <p>&nbsp;</p>\n                    <p>Betrachtet,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(76, 7, 'en', 'Proposal Sent', '<p>Hi, {proposal_name}</p>\n                    <p>Hope this email ﬁnds you well! Please see attached proposal number {proposal_number} for product/service.</p>\n                    <p>simply click on the button below</p>\n                    <p>{proposal_url}</p>\n                    <p>Feel free to reach out if you have any questions.</p>\n                    <p>Thank you for your business!!</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(77, 7, 'es', 'Proposal Sent', '<p>Hi, {proposal_name}</p>\n                    <p>&iexcl;Espero que este email le encuentre bien! Consulte el n&uacute;mero de propuesta adjunto {proposal_number} para el producto/servicio.</p>\n                    <p>simplemente haga clic en el bot&oacute;n de abajo</p>\n                    <p>{proposal_url}</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>&iexcl;Gracias por su negocio!!</p>\n                    <p>&nbsp;</p>\n                    <p>Considerando,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(78, 7, 'fr', 'Proposal Sent', '<p>Salut, {proposal_name}</p>\n                    <p>Jesp&egrave;re que ce courriel vous trouve bien ! Veuillez consulter le num&eacute;ro de la proposition jointe {proposal_number} pour le produit/service.</p>\n                    <p>Il suffit de cliquer sur le bouton ci-dessous</p>\n                    <p>{proposal_url}</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Merci pour votre entreprise ! !</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(79, 7, 'it', 'Proposal Sent', '<p>Ciao, {proposal_name}</p>\n                    <p>Spero che questa email ti trovi bene! Si prega di consultare il numero di proposta allegato {proposal_number} per il prodotto/servizio.</p>\n                    <p>semplicemente clicca sul pulsante sottostante</p>\n                    <p>{proposal_url}</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie per il tuo business!!</p>\n                    <p>&nbsp;</p>\n                    <p>Riguardo,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(80, 7, 'ja', 'Proposal Sent', '<p>こんにちは、 {proposal_name}</p>\n                    <p>この E メールでよくご確認ください。 製品 / サービスの添付されたプロポーザル番号 {proposal_number} を参照してください。</p>\n                    <p>下のボタンをクリックするだけで</p>\n                    <p>{proposal_url}</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>お客様のビジネスに感謝します。</p>\n                    <p>&nbsp;</p>\n                    <p>よろしく</p>\n                    <p>{ company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(81, 7, 'nl', 'Proposal Sent', '<p>Hallo, {proposal_name}</p>\n                    <p>Hoop dat deze e-mail je goed vindt! Zie bijgevoegde nummer { proposal_number } voor product/service.</p>\n                    <p>gewoon klikken op de knop hieronder</p>\n                    <p>{ proposal_url }</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank u voor uw bedrijf!!</p>\n                    <p>&nbsp;</p>\n                    <p>Betreft:</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(82, 7, 'pl', 'Proposal Sent', '<p>Witaj, {proposal_name}</p>\n                    <p>Mam nadzieję, że ta wiadomość znajdzie Cię dobrze! Proszę zapoznać się z załączonym numerem wniosku {proposal_number} dla produktu/usługi.</p>\n                    <p>po prostu kliknij na przycisk poniżej</p>\n                    <p>{proposal_url}</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękujemy za prowadzenie działalności!!</p>\n                    <p>&nbsp;</p>\n                    <p>W odniesieniu do</p>\n                    <p>{company_name }</p>\n                    <p>{app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(83, 7, 'ru', 'Proposal Sent', '<p>Здравствуйте, { proposal_name }</p>\n                    <p>Надеюсь, это электронное письмо найдет вас хорошо! См. вложенное предложение номер { proposal_number} для product/service.</p>\n                    <p>просто нажмите на кнопку внизу</p>\n                    <p>{ proposal_url}</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо за ваше дело!</p>\n                    <p>&nbsp;</p>\n                    <p>С уважением,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(84, 7, 'pt', 'Proposal Sent', '<p>Oi, {proposal_name}</p>\n                    <p>Espero que este e-mail encontre voc&ecirc; bem! Por favor, consulte o n&uacute;mero da proposta anexada {proposal_number} para produto/servi&ccedil;o.</p>\n                    <p>basta clicar no bot&atilde;o abaixo</p>\n                    <p>{proposal_url}</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado pelo seu neg&oacute;cio!!</p>\n                    <p>&nbsp;</p>\n                    <p>Considera,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(85, 8, 'ar', 'User Created', '<p>مرحبا ، مرحبا بك في { app_name }.</p>\n                    <p>البريد الالكتروني : { email }</p>\n                    <p>كلمة السرية : { password }</p>\n                    <p>{ app_url }</p>\n                    <p>شكرا</p>\n                    <p>{ app_name }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(86, 8, 'da', 'User Created', '<p>Hej,</p>\n                    <p>velkommen til { app_name }.</p>\n                    <p>E-mail: { email }</p>\n                    <p>-kodeord: { password }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Tak.</p>\n                    <p>{ app_name }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(87, 8, 'de', 'User Created', '<p>Hallo, Willkommen bei {app_name}.</p>\n                    <p>E-Mail: {email}</p>\n                    <p>Kennwort: {password}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>\n                    <p>Danke,</p>\n                    <p>{app_name}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(88, 8, 'en', 'User Created', '<p>Hello,&nbsp;<br />Welcome to {app_name}.</p>\n                    <p><strong>Email&nbsp;</strong>: {email}<br /><strong>Password</strong>&nbsp;: {password}</p>\n                    <p>{app_url}</p>\n                    <p>Thanks,<br />{app_name}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(89, 8, 'es', 'User Created', '<p>Hola, Bienvenido a {app_name}.</p>\n                    <p>Correo electr&oacute;nico: {email}</p>\n                    <p>Contrase&ntilde;a: {password}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>\n                    <p>Gracias,</p>\n                    <p>{app_name}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(90, 8, 'fr', 'User Created', '<p>Bonjour, Bienvenue dans { app_name }.</p>\n                    <p>E-mail: { email }</p>\n                    <p>Mot de passe: { password }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Merci,</p>\n                    <p>{ app_name }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(91, 8, 'it', 'User Created', '<p>Ciao, Benvenuti in {app_name}.</p>\n                    <p>Email: {email}</p>\n                    <p>Password: {password}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>\n                    <p>Grazie,</p>\n                    <p>{app_name}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(92, 8, 'ja', 'User Created', '<p>こんにちは、 {app_name}へようこそ。</p>\n                    <p>E メール : {email}</p>\n                    <p>パスワード : {password}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>\n                    <p>ありがとう。</p>\n                    <p>{app_name}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(93, 8, 'nl', 'User Created', '<p>Hallo, Welkom bij { app_name }.</p>\n                    <p>E-mail: { email }</p>\n                    <p>Wachtwoord: { password }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Bedankt.</p>\n                    <p>{ app_name }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(94, 8, 'pl', 'User Created', '<p>Witaj, Witamy w aplikacji {app_name }.</p>\n                    <p>E-mail: {email }</p>\n                    <p>Hasło: {password }</p>\n                    <p>{app_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Dziękuję,</p>\n                    <p>{app_name }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(95, 8, 'ru', 'User Created', '<p>Здравствуйте, Добро пожаловать в { app_name }.</p>\n                    <p>Адрес электронной почты: { email }</p>\n                    <p>Пароль: { password }</p>\n                    <p>{ app_url }</p>\n                    <p>&nbsp;</p>\n                    <p>Спасибо.</p>\n                    <p>{app_name }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(96, 8, 'pt', 'User Created', '<p>Ol&aacute;, Bem-vindo a {app_name}.</p>\n                    <p>E-mail: {email}</p>\n                    <p>Senha: {password}</p>\n                    <p>{app_url}</p>\n                    <p>&nbsp;</p>\n                    <p>Obrigado,</p>\n                    <p>{app_name}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(97, 9, 'ar', 'Vendor Bill Sent', '<p>مرحبا ، { bill_name }</p>\n                    <p>مرحبا بك في { app_name }</p>\n                    <p>أتمنى أن يجدك هذا البريد الإلكتروني جيدا ! ! برجاء الرجوع الى رقم الفاتورة الملحقة { bill_number } للحصول على المنتج / الخدمة.</p>\n                    <p>ببساطة اضغط على الاختيار بأسفل.</p>\n                    <p>{ bill_url }</p>\n                    <p>إشعر بالحرية للوصول إلى الخارج إذا عندك أي أسئلة.</p>\n                    <p>شكرا لك</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(98, 9, 'da', 'Vendor Bill Sent', '<p>Hej, { bill_name }</p>\n                    <p>Velkommen til { app_name }</p>\n                    <p>H&aring;ber denne e-mail finder dig godt! Se vedlagte fakturanummer } { bill_number } for product/service.</p>\n                    <p>Klik p&aring; knappen nedenfor.</p>\n                    <p>{ bill_url }</p>\n                    <p>Du er velkommen til at r&aelig;kke ud, hvis du har nogen sp&oslash;rgsm&aring;l.</p>\n                    <p>Tak.</p>\n                    <p>&nbsp;</p>\n                    <p>Med venlig hilsen</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(99, 9, 'de', 'Vendor Bill Sent', '<p>Hi, {bill_name}</p>\n                    <p>Willkommen bei {app_name}</p>\n                    <p>Hoffe, diese E-Mail findet dich gut!! Sehen Sie sich die beigef&uuml;gte Rechnungsnummer {bill_number} f&uuml;r Produkt/Service an.</p>\n                    <p>Klicken Sie einfach auf den Button unten.</p>\n                    <p>{bill_url}</p>\n                    <p>F&uuml;hlen Sie sich frei, wenn Sie Fragen haben.</p>\n                    <p>Vielen Dank,</p>\n                    <p>&nbsp;</p>\n                    <p>Betrachtet,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(100, 9, 'en', 'Vendor Bill Sent', '<p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hi, {bill_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Welcome to {app_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Hope this email finds you well!! Please see attached bill number {bill_number} for product/service.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Simply click on the button below.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{bill_url}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Feel free to reach out if you have any questions.</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Thank You,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">Regards,</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{company_name}</span></p>\n                    <p style=\"line-height: 28px; font-family: Nunito,;\"><span style=\"font-family: sans-serif;\">{app_url}</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(101, 9, 'es', 'Vendor Bill Sent', '<p>Hi, {bill_name}</p>\n                    <p>Bienvenido a {app_name}</p>\n                    <p>&iexcl;Espero que este correo te encuentre bien!! Consulte el n&uacute;mero de factura adjunto {bill_number} para el producto/servicio.</p>\n                    <p>Simplemente haga clic en el bot&oacute;n de abajo.</p>\n                    <p>{bill_url}</p>\n                    <p>Si&eacute;ntase libre de llegar si usted tiene alguna pregunta.</p>\n                    <p>Gracias,</p>\n                    <p>&nbsp;</p>\n                    <p>Considerando,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(102, 9, 'fr', 'Vendor Bill Sent', '<p>Salut, { bill_name }</p>\n                    <p>Bienvenue dans { app_name }</p>\n                    <p>Jesp&egrave;re que ce courriel vous trouve bien ! ! Veuillez consulter le num&eacute;ro de facture { bill_number } associ&eacute; au produit / service.</p>\n                    <p>Cliquez simplement sur le bouton ci-dessous.</p>\n                    <p>{bill_url }</p>\n                    <p>Nh&eacute;sitez pas &agrave; nous contacter si vous avez des questions.</p>\n                    <p>Merci,</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(103, 9, 'it', 'Vendor Bill Sent', '<p>Ciao, {bill_name}</p>\n                    <p>Benvenuti in {app_name}</p>\n                    <p>Spero che questa email ti trovi bene!! Si prega di consultare il numero di fattura allegato {bill_number} per il prodotto/servizio.</p>\n                    <p>Semplicemente clicca sul pulsante sottostante.</p>\n                    <p>{bill_url}</p>\n                    <p>Sentiti libero di raggiungere se hai domande.</p>\n                    <p>Grazie,</p>\n                    <p>&nbsp;</p>\n                    <p>Riguardo,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(104, 9, 'ja', 'Vendor Bill Sent', '<p>こんにちは、 {bill_name}</p>\n                    <p>{app_name} へようこそ</p>\n                    <p>この E メールによりよく検出されます !! 製品 / サービスの添付された請求番号 {bill_number} を参照してください。</p>\n                    <p>以下のボタンをクリックしてください。</p>\n                    <p>{bill_url}</p>\n                    <p>質問がある場合は、自由に連絡してください。</p>\n                    <p>ありがとうございます</p>\n                    <p>&nbsp;</p>\n                    <p>よろしく</p>\n                    <p>{ company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(105, 9, 'nl', 'Vendor Bill Sent', '<p>Hallo, { bill_name }</p>\n                    <p>Welkom bij { app_name }</p>\n                    <p>Hoop dat deze e-mail je goed vindt!! Zie bijgevoegde factuurnummer { bill_number } voor product/service.</p>\n                    <p>Klik gewoon op de knop hieronder.</p>\n                    <p>{ bill_url }</p>\n                    <p>Voel je vrij om uit te reiken als je vragen hebt.</p>\n                    <p>Dank U,</p>\n                    <p>&nbsp;</p>\n                    <p>Betreft:</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(106, 9, 'pl', 'Vendor Bill Sent', '<p>Witaj, {bill_name }</p>\n                    <p>Witamy w aplikacji {app_name }</p>\n                    <p>Mam nadzieję, że ta wiadomość e-mail znajduje Cię dobrze!! Zapoznaj się z załączonym numerem rachunku {bill_number } dla produktu/usługi.</p>\n                    <p>Wystarczy kliknąć na przycisk poniżej.</p>\n                    <p>{bill_url}</p>\n                    <p>Czuj się swobodnie, jeśli masz jakieś pytania.</p>\n                    <p>Dziękuję,</p>\n                    <p>&nbsp;</p>\n                    <p>W odniesieniu do</p>\n                    <p>{company_name }</p>\n                    <p>{app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(107, 9, 'ru', 'Vendor Bill Sent', '<p>Привет, { bill_name }</p>\n                    <p>Вас приветствует { app_name }</p>\n                    <p>Надеюсь, это письмо найдет вас хорошо! См. прилагаемый номер счета { bill_number } для product/service.</p>\n                    <p>Просто нажмите на кнопку внизу.</p>\n                    <p>{ bill_url }</p>\n                    <p>Не стеснитесь, если у вас есть вопросы.</p>\n                    <p>Спасибо.</p>\n                    <p>&nbsp;</p>\n                    <p>С уважением,</p>\n                    <p>{ company_name }</p>\n                    <p>{ app_url }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(108, 9, 'pt', 'Vendor Bill Sent', '<p>Oi, {bill_name}</p>\n                    <p>Bem-vindo a {app_name}</p>\n                    <p>Espero que este e-mail encontre voc&ecirc; bem!! Por favor, consulte o n&uacute;mero de faturamento conectado {bill_number} para produto/servi&ccedil;o.</p>\n                    <p>Basta clicar no bot&atilde;o abaixo.</p>\n                    <p>{bill_url}</p>\n                    <p>Sinta-se &agrave; vontade para alcan&ccedil;ar fora se voc&ecirc; tiver alguma d&uacute;vida.</p>\n                    <p>Obrigado,</p>\n                    <p>&nbsp;</p>\n                    <p>Considera,</p>\n                    <p>{company_name}</p>\n                    <p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(109, 10, 'ar', 'New Contract', '<p>مرحبا { contract_customer }</p>\n                    <p>موضوع العقد : { contract_subject }</p>\n                    <p>نوع العقد : { contract_type }</p>\n                    <p>قيمة العقد : { contract_value }</p>\n                    <p>تاريخ البدء : { contract_start_date }</p>\n                    <p>تاريخ الانتهاء : { contract_end_date }</p>\n                    <p>. أتطلع لسماع منك</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{ company_name }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(110, 10, 'da', 'New Contract', '<p>Hej { contract_customer }</p>\n                    <p>Kontraktemne: { contract_subject }</p>\n                    <p>Kontrakttype: { contract_type }</p>\n                    <p>Kontraktv&aelig;rdi: { contract_value }</p>\n                    <p>Startdato: { contract_start_date }</p>\n                    <p>Slutdato: { contract_end_date }</p>\n                    <p>Jeg gl&aelig;der mig til at h&oslash;re fra dig.</p>\n                    <p>&nbsp;</p>\n                    <p>Med venlig hilsen</p>\n                    <p>{ company_name }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(111, 10, 'de', 'New Contract', '<p>Hi {contract_customer}</p>\n                    <p>Vertragsgegenstand: {contract_subject}</p>\n                    <p>Vertragstyp: {contract_type}</p>\n                    <p>Vertragswert: {contract_value}</p>\n                    <p>Startdatum: {contract_start_date}</p>\n                    <p>Enddatum: {contract_end_date}</p>\n                    <p>Freuen Sie sich auf das H&ouml;ren von Ihnen.</p>\n                    <p>&nbsp;</p>\n                    <p>Betrachtet,</p>\n                    <p>{company_name}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(112, 10, 'es', 'New Contract', '<p>Hi {contract_customer}</p>\n                    <p>Asunto del contrato: {contract_subject}</p>\n                    <p>Tipo de contrato: {contract_type}</p>\n                    <p>Valor de contrato: {contract_value}</p>\n                    <p>Fecha de inicio: {contract_start_date}</p>\n                    <p>Fecha de finalizaci&oacute;n: {contract_end_date}</p>\n                    <p>Con ganas de escuchar de ti.</p>\n                    <p>&nbsp;</p>\n                    <p>Considerando,</p>\n                    <p>{company_name}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(113, 10, 'en', 'New Contract', '<p>Hi {contract_customer}</p>\n                    <p>Contract Subject: {contract_subject}</p>\n                    <p>Contract Type: {contract_type}</p>\n                    <p>Contract Value: {contract_value}</p>\n                    <p>Start Date: {contract_start_date}</p>\n                    <p>End Date: {contract_end_date}</p>\n                    <p>Looking forward to hear from you.</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{company_name}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(114, 10, 'fr', 'New Contract', '<p>Bonjour { contract_customer }</p>\n                    <p>Objet du contrat: { contract_subject }</p>\n                    <p>Type de contrat: { contract_type }</p>\n                    <p>Valeur du contrat: { contract_value }</p>\n                    <p>Date de d&eacute;but: { contract_start_date }</p>\n                    <p>Date de fin: { contract_end_date }</p>\n                    <p>Vous avez h&acirc;te de vous entendre.</p>\n                    <p>&nbsp;</p>\n                    <p>Regards,</p>\n                    <p>{ company_name }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(115, 10, 'it', 'New Contract', '<p>Ciao {contract_customer}</p>\n                    <p>Oggetto contratto: {contract_subject}</p>\n                    <p>Tipo di contratto: {contract_type}</p>\n                    <p>Valore contratto: {contract_value}</p>\n                    <p>Data inizio: {contract_start_date}</p>\n                    <p>Data di fine: {contract_end_date}</p>\n                    <p>Non vedo lora di sentirti.</p>\n                    <p>&nbsp;</p>\n                    <p>Riguardo,</p>\n                    <p>{company_name}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(116, 10, 'ja', 'New Contract', '<p>こんにちは {contract_customer }</p>\n                    <p>契約件名: {contract_subject}</p>\n                    <p>契約タイプ: {contract_type}</p>\n                    <p>契約値: {contract_value}</p>\n                    <p>開始日: {contract_start_date}</p>\n                    <p>終了日: {contract_end_date}</p>\n                    <p>あなたからの便りを楽しみにしています</p>\n                    <p>&nbsp;</p>\n                    <p>&nbsp;</p>\n                    <p>よろしく</p>\n                    <p>{ company_name}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(117, 10, 'nl', 'New Contract', '<p>Hallo { contract_customer }</p>\n                    <p>Contractonderwerp: { contract_subject }</p>\n                    <p>Contracttype: { contract_type }</p>\n                    <p>Contractwaarde: { contract_value }</p>\n                    <p>Begindatum: { contract_start_date }</p>\n                    <p>Einddatum: { contract_end_date }</p>\n                    <p>Ik kijk ernaar uit om van je te horen.</p>\n                    <p>&nbsp;</p>\n                    <p>Betreft:</p>\n                    <p>{ company_name }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20');
INSERT INTO `email_template_langs` (`id`, `parent_id`, `lang`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(118, 10, 'pl', 'New Contract', '<p>Witaj {contract_customer }</p>\n                    <p>Temat kontraktu: {contract_subject }</p>\n                    <p>Typ kontraktu: {contract_type }</p>\n                    <p>Wartość kontraktu: {contract_value }</p>\n                    <p>Data rozpoczęcia: {contract_start_date }</p>\n                    <p>Data zakończenia: {contract_end_date }</p>\n                    <p>Nie mogę się doczekać, by usłyszeć od ciebie.</p>\n                    <p>&nbsp;</p>\n                    <p>&nbsp;</p>\n                    <p>W odniesieniu do</p>\n                    <p>{company_name }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(119, 10, 'pt', 'New Contract', '<p>Oi {contract_customer}</p>\n                    <p>Assunto do Contrato: {contract_subject}</p>\n                    <p>Tipo de Contrato: {contract_type}</p>\n                    <p>Valor do Contrato: {contract_value}</p>\n                    <p>Data de In&iacute;cio: {contract_start_date}</p>\n                    <p>Data de encerramento: {contract_end_date}</p>\n                    <p>Olhando para a frente para ouvir de voc&ecirc;.</p>\n                    <p>&nbsp;</p>\n                    <p>Considera,</p>\n                    <p>{company_name}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(120, 10, 'ru', 'New Contract', '<p>Здравствуйте { contract_customer }</p>\n                    <p>Тема договора: { contract_subject }</p>\n                    <p>Тип контракта: { contract_type }</p>\n                    <p>Значение контракта: { contract_value }</p>\n                    <p>Дата начала: { contract_start_date }</p>\n                    <p>Дата окончания: { contract_end_date }</p>\n                    <p>С нетерпением жду услышать от тебя.</p>\n                    <p>&nbsp;</p>\n                    <p>С уважением,</p>\n                    <p>{ company_name }</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(121, 11, 'ar', 'Retainer Sent', '<p>مرحبًا ، {retainer_name}</p><p>آمل أن يكون هذا البريد الإلكتروني جيدًا! يرجى الاطلاع على رقم التجنيب المرفق {retainer_number} للمنتج/الخدمة.</p><p>ببساطة انقر على الزر أدناه</p><p>{retainer_url}</p><p>لا تتردد في التواصل إذا كان لديك أي أسئلة.</p><p>شكرا لك على عملك!!</p><p>&nbsp;</p><p>يعتبر،</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(122, 11, 'da', 'Retainer Sent', '<p>Hej, {retainer_name}</p><p>H&aring;ber denne e -mail finder dig godt! Se vedh&aelig;ftet indehavernummer {retainer_number} for produkt/service.</p><p>Klik blot p&aring; knappen nedenfor</p><p>{retainer_url}</p><p>Du er velkommen til at n&aring; ud, hvis du har sp&oslash;rgsm&aring;l.</p><p>Tak for din forretning!!</p><p>&nbsp;</p><p>Hilsen,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(123, 11, 'de', 'Retainer Sent', '<p>Hi, {retainer_name}</p><p>Ich hoffe, diese E -Mail findet Sie gut! Bitte beachten Sie die beigef&uuml;gte Retainer -Nummer {retainer_number} f&uuml;r Produkt/Dienstleistung.</p><p>Klicken Sie einfach auf die Schaltfl&auml;che unten</p><p>{retainer_url}</p><p>F&uuml;hlen Sie sich frei zu erreichen, wenn Sie Fragen haben.</p><p>Danke f&uuml;r dein Gesch&auml;ft !!</p><p>&nbsp;</p><p>Gr&uuml;&szlig;e,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(124, 11, 'es', 'Retainer Sent', '<p>Hola, {retainer_name}</p><p>&iexcl;Espero que este correo electr&oacute;nico te encuentre bien! Consulte el n&uacute;mero de retenci&oacute;n adjunto {retainer_number} para producto/servicio.</p><p>Simplemente haga clic en el bot&oacute;n de abajo</p><p>{retainer_url}</p><p>No dude en comunicarse si tiene alguna pregunta.</p><p>&iexcl;&iexcl;Gracias por hacer negocios!!</p><p>&nbsp;</p><p>Saludos,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(125, 11, 'en', 'Retainer Sent', '<p>Hi, {retainer_name}</p><p>Hope this email ﬁnds you well! Please see attached retainer number {retainer_number} for product/service.</p><p>simply click on the button below</p><p>{retainer_url}</p><p>Feel free to reach out if you have any questions.</p><p>Thank you for your business!!</p><p>&nbsp;</p><p>Regards,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(126, 11, 'fr', 'Retainer Sent', '<p>Salut, {retainer_name}</p><p>J\'esp&egrave;re que cet e-mail vous trouve bien! Veuillez consulter le num&eacute;ro de dispositif ci-joint {retainer_number} pour le produit / service.</p><p>Cliquez simplement sur le bouton ci-dessous</p><p>{retainer_url}</p><p>N\'h&eacute;sitez pas &agrave; tendre la main si vous avez des questions.</p><p>Merci pour votre entreprise !!</p><p>&nbsp;</p><p>Salutations,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(127, 11, 'it', 'Retainer Sent', '<p>Ciao, {retainer_name}</p><p>Spero che questa e -mail ti faccia bene! Si prega di consultare il numero di fermo allegato {retainer_number} per prodotto/servizio.</p><p>Basta fare clic sul pulsante in basso</p><p>{retainer_url}</p><p>Sentiti libero di contattare se hai domande.</p><p>Grazie per il tuo business!!</p><p>&nbsp;</p><p>Saluti,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(128, 11, 'ja', 'Retainer Sent', '<p>こんにちは、{retainer_name}</p><p>この電子メールがあなたをうまく見つけることを願っています！製品/サービスについては、添付のリテーナー番号{retainer_number}を参照してください。</p><p>下のボタンをクリックするだけです</p><p>{retainer_url}</p><p>ご質問がある場合は、お気軽にご連絡ください。</p><p>お買い上げくださってありがとうございます！！</p><p>&nbsp;</p><p>よろしく、</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(129, 11, 'nl', 'Retainer Sent', '<p>Hallo, {retainer_Name}</p><p>Ik hoop dat deze e -mail je goed vindt! Zie bijgevoegd bewaarnummer {retainer_number} voor product/service.</p><p>Klik eenvoudig op de onderstaande knop</p><p>{retainer_url}</p><p>Voel je vrij om contact op te nemen als je vragen hebt.</p><p>Bedankt voor uw zaken!!</p><p>&nbsp;</p><p>Groeten,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(130, 11, 'pl', 'Retainer Sent', '<p>Cześć, {retainer_name}</p><p>Mam nadzieję, że ten e -mail dobrze Cię znajdzie! Aby uzyskać produkt/usługę/usługi.</p><p>Po prostu kliknij przycisk poniżej</p><p>{retainer_url}</p><p>Możesz się skontaktować, jeśli masz jakieś pytania.</p><p>Dziękuję za Tw&oacute;j biznes !!</p><p>&nbsp;</p><p>Pozdrowienia,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(131, 11, 'pt', 'Retainer Sent', '<p>Oi, {retainer_name}</p><p>Espero que este e -mail o encontre bem! Consulte o n&uacute;mero do retentor anexado {retainer_number} para obter o produto/servi&ccedil;o.</p><p>Basta clicar no bot&atilde;o abaixo</p><p>{retainer_url}</p><p>Sinta -se &agrave; vontade para alcan&ccedil;ar se tiver alguma d&uacute;vida.</p><p>Agrade&ccedil;o pelos seus servi&ccedil;os!!</p><p>&nbsp;</p><p>Cumprimentos,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(132, 11, 'ru', 'Retainer Sent', '<p>Привет, {retainer_name}</p><p>Надеюсь, что это электронное письмо вам хорошо найдет! Пожалуйста, см. Прикрепленный номер фиксатора {retainer_number} для продукта/услуги.</p><p>Просто нажмите на кнопку ниже</p><p>{retainer_url}</p><p>Не стесняйтесь обращаться, если у вас есть какие -либо вопросы.</p><p>Спасибо за ваш бизнес !!</p><p>&nbsp;</p><p>С уважением,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(133, 12, 'ar', 'Customer Retainer Sent', '<p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">مرحبًا ، {retainer_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">مرحبا بكم في {app_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">أتمنى حين تصلك رسالتي أن تكون بخير! يرجى الاطلاع على رقم التجنيب المرفق {retainer_number} للمنتج/الخدمة.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">ببساطة انقر على الزر أدناه.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{retainer_url}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">لا تتردد في التواصل إذا كان لديك أي أسئلة.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">شكرا لك،</span></span></p><p>&nbsp;</p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">يعتبر،</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{company_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{app_url}</span></span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(134, 12, 'da', 'Customer Retainer Sent', '<p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Hej, {retainer_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Velkommen til {app_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">H&aring;ber denne e -mail finder dig godt! Se vedh&aelig;ftet indehavernummer {retainer_number} for produkt/service.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Klik blot p&aring; knappen nedenfor.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{retainer_url}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Du er velkommen til at n&aring; ud, hvis du har sp&oslash;rgsm&aring;l.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Tak skal du have,</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">&nbsp;</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Hilsen,</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{company_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{app_url}</span></span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(135, 12, 'de', 'Customer Retainer Sent', '<p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Hi, {retainer_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Willkommen bei {app_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Ich hoffe diese email kommt bei dir an! Bitte beachten Sie die beigef&uuml;gte Retainer -Nummer {retainer_number} f&uuml;r Produkt/Dienstleistung.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Klicken Sie einfach auf die Schaltfl&auml;che unten.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{retainer_url}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">F&uuml;hlen Sie sich frei zu erreichen, wenn Sie Fragen haben.</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Danke,</span></span></p><p>&nbsp;</p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Gr&uuml;&szlig;e,</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{company_name}</span></span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{app_url}</span></span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(136, 12, 'es', 'Customer Retainer Sent', '<p>Hola, {retainer_name}</p><p>Bienvenido a {app_name}</p><p>&iexcl;Espero que este mensaje te encuentre bien! Consulte el n&uacute;mero de retenci&oacute;n adjunto {retainer_number} para producto/servicio.</p><p>Simplemente haga clic en el bot&oacute;n de abajo.</p><p>{retainer_url}</p><p>No dude en comunicarse si tiene alguna pregunta.</p><p>Gracias,</p><p>&nbsp;</p><p>Saludos,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(137, 12, 'en', 'Customer Retainer Sent', '<p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">Hi, {retainer_name}</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">Welcome to {app_name}</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">Hope this email finds you well! Please see attached retainer number {retainer_number} for product/service.</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">Simply click on the button below.</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">{retainer_url}</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">Feel free to reach out if you have any questions.</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">Thank You,</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">Regards,</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">{company_name}</span></p><p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-variant-ligatures: common-ligatures; background-color: #f8f8f8;\\\">{app_url}</span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(138, 12, 'fr', 'Customer Retainer Sent', '<p>Hola, {retainer_name}</p><p>Bienvenido a {app_name}</p><p>&iexcl;Espero que este mensaje te encuentre bien! Consulte el n&uacute;mero de retenci&oacute;n adjunto {retainer_number} para producto/servicio.</p><p>Simplemente haga clic en el bot&oacute;n de abajo.</p><p>{retainer_url}</p><p>No dude en comunicarse si tiene alguna pregunta.</p><p>Gracias,</p><p>&nbsp;</p><p>Saludos,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(139, 12, 'it', 'Customer Retainer Sent', '<p>Ciao, {retainer_name}</p><p>Benvenuti in {app_name}</p><p>Spero che questa email ti trovi bene! Si prega di consultare il numero di fermo allegato {retainer_number} per prodotto/servizio.</p><p>Basta fare clic sul pulsante in basso.</p><p>{retainer_url}</p><p>Sentiti libero di contattare se hai domande.</p><p>Grazie,</p><p>&nbsp;</p><p>Saluti,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(140, 12, 'ja', 'Customer Retainer Sent', '<p>こんにちは、{retainer_name}</p><p>{app_name}へようこそ</p><p>このメールは、あなたがよく見つけた願っています！製品/サービスについては、添付のリテーナー番号{retainer_number}を参照してください。</p><p>下のボタンをクリックするだけです。</p><p>{retainer_url}</p><p>ご質問がある場合は、お気軽にご連絡ください。</p><p>ありがとうございました、</p><p>&nbsp;</p><p>よろしく、</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(141, 12, 'nl', 'Customer Retainer Sent', '<p>Hallo, {retainer_name}</p><p>Welkom bij {app_name}</p><p>Ik hoop dat deze e-mail je goed vindt! Zie bijgevoegde houdernummer {retainer_number} voor product/service.</p><p>Klik eenvoudig op de onderstaande knop.</p><p>{retainer_url}</p><p>Neem gerust contact op als je vragen hebt.</p><p>Bedankt,</p><p>&nbsp;</p><p>Groeten,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(142, 12, 'pl', 'Customer Retainer Sent', '<p>Cześć, {retainer_name}</p><p>Witamy w {app_name}</p><p>Mam nadzieję, że ten e-mail Cię dobrze odnajdzie! Zobacz załączony numer ustalający {retainer_number} dla produktu/usługi.</p><p>Po prostu kliknij poniższy przycisk.</p><p>{retainer_url}</p><p>Jeśli masz jakiekolwiek pytania, skontaktuj się z nami.</p><p>Dziękuję,</p><p>&nbsp;</p><p>Pozdrowienia,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(143, 12, 'pt', 'Customer Retainer Sent', '<p>Ol&aacute;, {retainer_name}</p><p>Bem-vindo ao {app_name}</p><p>Espero que este e-mail o encontre bem! Consulte o n&uacute;mero de reten&ccedil;&atilde;o em anexo {retainer_number} para o produto/servi&ccedil;o.</p><p>Basta clicar no bot&atilde;o abaixo.</p><p>{retainer_url}</p><p>Sinta-se &agrave; vontade para entrar em contato se tiver alguma d&uacute;vida.</p><p>Obrigada,</p><p>&nbsp;</p><p>Cumprimentos,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(144, 12, 'ru', 'Customer Retainer Sent', '<p>Привет, {retainer_name}</p><p>Добро пожаловать в {app_name}</p><p>Надеюсь, это письмо найдет вас хорошо! Пожалуйста, смотрите прилагаемый номер клиента {retainer_number} для продукта/услуги.</p><p>Просто нажмите на кнопку ниже.</p><p>{retainer_url}</p><p>Не стесняйтесь обращаться, если у вас есть какие-либо вопросы.</p><p>Благодарю вас,</p><p>&nbsp;</p><p>С уважением,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(145, 13, 'ar', 'New Retainer Payment', '<p>أهلاً،</p><p>مرحبًا بك في {app_name}</p><p>عزيزي {payment_name}</p><p>لقد استلمنا المبلغ {payment_amount} الخاص بك مقابل {retainer_number} تم إرساله بتاريخ {payment_date}</p><p>المبلغ المستحق {retainer_number} هو {payment_dueAmount}</p><p>نحن نقدر دفعك الفوري ونتطلع إلى استمرار العمل معك في المستقبل.</p><p>شكرا جزيلا لك ويوم سعيد !!</p><p>&nbsp;</p><p>يعتبر،</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(146, 13, 'da', 'New Retainer Payment', '<p>Hej,</p><p>Velkommen til {app_name}</p><p>K&aelig;re {payment_name}</p><p>Vi har modtaget dit bel&oslash;b {payment_amount} betaling for {retainer_number} indsendt p&aring; datoen {payment_date}</p><p>Dit forfaldne bel&oslash;b for {retainer_number} er {payment_dueAmount}</p><p>Vi s&aelig;tter pris p&aring; din hurtige betaling og ser frem til at forts&aelig;tte forretninger med dig i fremtiden.</p><p>Mange tak og god dag!!</p><p>&nbsp;</p><p>Med venlig hilsen</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(147, 13, 'de', 'New Retainer Payment', '<p>Hi,</p><p>Willkommen bei {app_name}</p><p>Sehr geehrte(r) {payment_name}</p><p>Wir haben Ihre Zahlung in H&ouml;he von {payment_amount} f&uuml;r {retainer_number} erhalten, die am {payment_date} eingereicht wurde</p><p>Ihr {retainer_number} f&auml;lliger Betrag betr&auml;gt {payment_dueAmount}</p><p>Wir wissen Ihre prompte Zahlung zu sch&auml;tzen und freuen uns auf die weitere Zusammenarbeit mit Ihnen in der Zukunft.</p><p>Vielen Dank und einen sch&ouml;nen Tag!!</p><p>&nbsp;</p><p>Gr&uuml;&szlig;e,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(148, 13, 'es', 'New Retainer Payment', '<p>Hola,</p><p>Bienvenido a {app_name}</p><p>Estimado {payment_name}</p><p>Recibimos su pago de {payment_amount} por {retainer_number} enviado en la fecha {payment_date}</p><p>Su monto adeudado de {retainer_number} es {payment_dueAmount}</p><p>Agradecemos su pago puntual y esperamos seguir haciendo negocios con usted en el futuro.</p><p>&iexcl;&iexcl;Muchas gracias y buen d&iacute;a!!</p><p>&nbsp;</p><p>Saludos,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(149, 13, 'en', 'New Retainer Payment', '<p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Hi,</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Welcome to {app_name}</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Dear {payment_name}</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">We have recieved your amount {payment_amount} payment for {invoice_number} submited on date {payment_date}</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Your {invoice_number} Due amount is {payment_dueAmount}</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">We appreciate your prompt payment and look forward to continued business with you in the future.</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Thank you very much and have a good day!!</span></span></p>                    <p>&nbsp;</p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">Regards,</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{company_name}</span></span></p>                    <p><span style=\\\"color: #1d1c1d; font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif;\\\"><span style=\\\"font-size: 15px; font-variant-ligatures: common-ligatures;\\\">{app_url}</span></span></p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(150, 13, 'fr', 'New Retainer Payment', '<p>Salut</p><p>Bienvenue sur {app_name}</p><p>Cher {payment_name}</p><p>Nous avons re&ccedil;u votre paiement d\'un montant de {payment_amount} pour {retainer_number} soumis le {payment_date}</p><p>Votre montant d&ucirc; de {retainer_number} est de {payment_dueAmount}</p><p>Nous appr&eacute;cions votre paiement rapide et esp&eacute;rons continuer &agrave; faire affaire avec vous &agrave; l\'avenir.</p><p>Merci beaucoup et bonne journ&eacute;e !!</p><p>&nbsp;</p><p>Salutations,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(151, 13, 'it', 'New Retainer Payment', '<p>Ciao,</p><p>Benvenuti in {app_name}</p><p>Caro {payment_name}</p><p>Abbiamo ricevuto il tuo importo {payment_amount} pagamento per {retainer_number} inviato alla data {payment_date}</p><p>Il tuo {retainer_number} l\'importo dovuto &egrave; {payment_dueamount}</p><p>Apprezziamo il tuo rapido pagamento e non vediamo l\'ora di continuare a fare affari con te in futuro.</p><p>Grazie mille e buona giornata !!</p><p>&nbsp;</p><p>Saluti,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(152, 13, 'ja', 'New Retainer Payment', '<p>やあ、</p><p>{app_name}へようこそ</p><p>親愛なる{payment_name}</p><p>{retainer_number}の金額{payment_amount}支払いを受け取りました{payment_date}に提出されました</p><p>あなたの{reterer_number}正当な金額は{payment_dueamount}です</p><p>私たちはあなたの迅速な支払いに感謝し、将来あなたとの継続的なビジネスを楽しみにしています。</p><p>どうもありがとうございました、そして良い一日を！</p><p>&nbsp;</p><p>よろしく、</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(153, 13, 'nl', 'New Retainer Payment', '<p>Hoi,</p><p>Welkom bij {app_name}</p><p>Beste {payment_Name}</p><p>We hebben uw bedrag ontvangen.</p><p>Uw {retainer_number} vervallen bedrag is {payment_dueAmount}</p><p>We waarderen uw snelle betaling en kijken uit naar voortdurende zaken met u in de toekomst.</p><p>Heel erg bedankt en een fijne dag fijn !!</p><p>&nbsp;</p><p>Groeten,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(154, 13, 'pl', 'New Retainer Payment', '<p>Cześć,</p><p>Witamy w {app_name}</p><p>Drogi {payment_name}</p><p>Otrzymaliśmy twoją kwotę {payment_amount} płatność za {retainer_number} przesłany na datę {payment_date}</p><p>Twoja {retainer_number} należna kwota to {payment_dueAmount}</p><p>Doceniamy twoją szybką płatność i czekamy na dalszą działalność z Tobą w przyszłości.</p><p>Dziękuję bardzo i życzę miłego dnia !!</p><p>&nbsp;</p><p>Pozdrowienia,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(155, 13, 'pt', 'New Retainer Payment', '<p>Oi,</p><p>Bem -vindo ao {app_Name}</p><p>Querido {retainer_name}</p><p>Recebemos seu valor {payment_amount} pagamento de {retainer_number} submetido na data {payment_date}</p><p>Seu {retainer_number} de vencimento &eacute; {payment_dueAmount}</p><p>Agradecemos seu pagamento imediato e esperamos os neg&oacute;cios cont&iacute;nuos com voc&ecirc; no futuro.</p><p>Muito obrigado e tenha um bom dia !!</p><p>&nbsp;</p><p>Cumprimentos,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(156, 13, 'ru', 'New Retainer Payment', '<p>Привет,</p><p>Добро пожаловать в {app_name}</p><p>Дорогой {retainer_name}</p><p>Мы получили вашу сумму {payment_amount} платеж за {retainer_number}, представленную на дату {payment_date}</p><p>Ваша {retainer_number} Долженная сумма {payment_dueAmount}</p><p>Мы ценим вашу оперативную оплату и с нетерпением ждем продолжения бизнеса с вами в будущем.</p><p>Большое спасибо и хорошего дня !!</p><p>&nbsp;</p><p>С уважением,</p><p>{company_name}</p><p>{app_url}</p>', '2025-04-07 02:19:20', '2025-04-07 02:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT 0.00,
  `date` date DEFAULT NULL,
  `project` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `attachment` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `from` varchar(191) DEFAULT NULL,
  `to` varchar(191) DEFAULT NULL,
  `amount` double NOT NULL DEFAULT 0,
  `is_display` int(11) NOT NULL DEFAULT 1,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `send_date` date DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `ref_number` text DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `shipping_display` int(11) NOT NULL DEFAULT 1,
  `discount_apply` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_payments`
--

CREATE TABLE `invoice_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `account_id` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `receipt` varchar(191) DEFAULT NULL,
  `payment_type` varchar(191) NOT NULL DEFAULT 'Manually',
  `txn_id` varchar(191) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `order_id` varchar(191) DEFAULT NULL,
  `reference` varchar(191) NOT NULL,
  `add_receipt` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_products`
--

CREATE TABLE `invoice_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `tax` varchar(50) DEFAULT '0.00',
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journal_entries`
--

CREATE TABLE `journal_entries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `journal_id` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journal_items`
--

CREATE TABLE `journal_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `journal` int(11) NOT NULL DEFAULT 0,
  `account` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `debit` double(8,2) NOT NULL DEFAULT 0.00,
  `credit` double(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_09_28_102009_create_settings_table', 1),
(5, '2019_11_13_051828_create_taxes_table', 1),
(6, '2019_11_13_055026_create_invoices_table', 1),
(7, '2019_11_13_072623_create_expenses_table', 1),
(8, '2019_11_21_090403_create_plans_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2020_01_08_063207_create_product_services_table', 1),
(11, '2020_01_08_084029_create_product_service_categories_table', 1),
(12, '2020_01_08_092717_create_product_service_units_table', 1),
(13, '2020_01_08_121541_create_customers_table', 1),
(14, '2020_01_09_104945_create_venders_table', 1),
(15, '2020_01_09_113852_create_bank_accounts_table', 1),
(16, '2020_01_09_124222_create_transfers_table', 1),
(17, '2020_01_10_064723_create_transactions_table', 1),
(18, '2020_01_13_072608_create_invoice_products_table', 1),
(19, '2020_01_15_034438_create_revenues_table', 1),
(20, '2020_01_15_051228_create_bills_table', 1),
(21, '2020_01_15_060859_create_bill_products_table', 1),
(22, '2020_01_15_073237_create_payments_table', 1),
(23, '2020_01_16_043907_create_orders_table', 1),
(24, '2020_01_18_051650_create_invoice_payments_table', 1),
(25, '2020_01_20_091035_create_bill_payments_table', 1),
(26, '2020_02_25_052356_create_credit_notes_table', 1),
(27, '2020_02_26_033827_create_debit_notes_table', 1),
(28, '2020_03_12_095629_create_coupons_table', 1),
(29, '2020_03_12_120749_create_user_coupons_table', 1),
(30, '2020_04_02_045834_create_proposals_table', 1),
(31, '2020_04_02_055706_create_proposal_products_table', 1),
(32, '2020_04_18_035141_create_goals_table', 1),
(33, '2020_04_21_115823_create_assets_table', 1),
(34, '2020_04_24_023732_create_custom_fields_table', 1),
(35, '2020_04_24_024217_create_custom_field_values_table', 1),
(36, '2020_05_21_065337_create_permission_tables', 1),
(37, '2020_06_30_120854_add_balance_to_customers_table', 1),
(38, '2020_06_30_121531_add_balance_to_vender_table', 1),
(39, '2020_07_01_033457_change_product_services_tax_id_column_type', 1),
(40, '2020_07_01_063255_change_tax_column_type', 1),
(41, '2020_07_03_054342_add_convert_in_proposal_table', 1),
(42, '2020_07_06_102454_add_payment_type_in_orders_table', 1),
(43, '2020_07_07_052211_add_field_in_invoice_payments_table', 1),
(44, '2020_07_22_131715_change_amount_type_size', 1),
(45, '2020_08_04_034206_change_settings_value_type', 1),
(46, '2020_09_16_040822_change_user_type_size_in_users_table', 1),
(47, '2020_09_17_053350_change_shipping_default_val', 1),
(48, '2020_09_17_070031_add_description_field', 1),
(49, '2020_12_11_094137_add_mode_to_users', 1),
(50, '2020_12_11_094137_add_receipt_to_payment', 1),
(51, '2020_12_11_094137_add_tax_number_to_customers', 1),
(52, '2021_01_11_062508_create_chart_of_accounts_table', 1),
(53, '2021_01_11_070441_create_chart_of_account_types_table', 1),
(54, '2021_01_12_032834_create_journal_entries_table', 1),
(55, '2021_01_12_033815_create_journal_items_table', 1),
(56, '2021_01_20_072219_create_chart_of_account_sub_types_table', 1),
(57, '2021_07_15_091920_admin_payment_settings', 1),
(58, '2021_07_15_091933_company_payment_settings', 1),
(59, '2021_09_10_160559_add_last_login_to_user_table', 1),
(60, '2021_09_10_165514_create_plan_requests_table', 1),
(61, '2021_12_02_052828_create_budgets_table', 1),
(62, '2022_03_03_100148_change_price_val', 1),
(63, '2022_03_11_035602_create_stock_reports_table', 1),
(64, '2022_07_18_045119_create_email_templates_table', 1),
(65, '2022_07_18_045328_create_user_email_templates_table', 1),
(66, '2022_07_18_045420_create_email_template_langs_table', 1),
(67, '2022_07_27_025909_create_contract_types_table', 1),
(68, '2022_07_27_040057_create_contracts_table', 1),
(69, '2022_07_29_024854_create_contract_attachments_table', 1),
(70, '2022_07_29_041911_create_contract_comments_table', 1),
(71, '2022_07_29_051300_create_contract_notes_table', 1),
(72, '2022_08_05_071423_create_retainers_table', 1),
(73, '2022_08_05_101408_create_retainer_products_table', 1),
(74, '2022_08_09_111831_create_retainer_payments_table', 1),
(75, '2022_09_21_094234_add_type_field_in_all_contract_table', 1),
(76, '2022_11_08_112554_add_converted_retainer_id_to_proposals_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(4, 'App\\Models\\User', 2),
(5, 'App\\Models\\User', 3),
(5, 'App\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `card_number` varchar(10) DEFAULT NULL,
  `card_exp_month` varchar(10) DEFAULT NULL,
  `card_exp_year` varchar(10) DEFAULT NULL,
  `plan_name` varchar(100) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `price` double(8,2) NOT NULL,
  `price_currency` varchar(10) NOT NULL,
  `txn_id` varchar(100) NOT NULL,
  `payment_status` varchar(100) NOT NULL,
  `payment_type` varchar(191) NOT NULL DEFAULT 'Manually',
  `receipt` varchar(191) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `account_id` int(11) NOT NULL,
  `vender_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `recurring` varchar(191) DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `reference` varchar(191) NOT NULL,
  `add_receipt` varchar(191) DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'show dashboard', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(2, 'manage user', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(3, 'create user', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(4, 'edit user', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(5, 'delete user', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(6, 'create language', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(7, 'manage system settings', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(8, 'manage role', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(9, 'create role', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(10, 'edit role', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(11, 'delete role', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(12, 'manage permission', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(13, 'create permission', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(14, 'edit permission', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(15, 'delete permission', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(16, 'manage company settings', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(17, 'manage business settings', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(18, 'manage stripe settings', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(19, 'manage expense', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(20, 'create expense', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(21, 'edit expense', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(22, 'delete expense', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(23, 'manage invoice', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(24, 'create invoice', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(25, 'edit invoice', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(26, 'delete invoice', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(27, 'show invoice', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(28, 'create payment invoice', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(29, 'delete payment invoice', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(30, 'send invoice', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(31, 'delete invoice product', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(32, 'convert invoice', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(33, 'manage plan', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(34, 'create plan', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(35, 'edit plan', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(36, 'manage constant unit', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(37, 'create constant unit', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(38, 'edit constant unit', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(39, 'delete constant unit', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(40, 'manage constant tax', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(41, 'create constant tax', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(42, 'edit constant tax', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(43, 'delete constant tax', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(44, 'manage constant category', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(45, 'create constant category', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(46, 'edit constant category', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(47, 'delete constant category', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(48, 'manage product & service', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(49, 'create product & service', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(50, 'edit product & service', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(51, 'delete product & service', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(52, 'manage customer', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(53, 'create customer', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(54, 'edit customer', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(55, 'delete customer', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(56, 'show customer', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(57, 'manage vender', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(58, 'create vender', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(59, 'edit vender', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(60, 'delete vender', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(61, 'show vender', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(62, 'manage bank account', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(63, 'create bank account', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(64, 'edit bank account', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(65, 'delete bank account', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(66, 'manage transfer', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(67, 'create transfer', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(68, 'edit transfer', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(69, 'delete transfer', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(70, 'manage constant payment method', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(71, 'create constant payment method', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(72, 'edit constant payment method', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(73, 'delete constant payment method', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(74, 'manage transaction', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(75, 'manage revenue', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(76, 'create revenue', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(77, 'edit revenue', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(78, 'delete revenue', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(79, 'manage bill', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(80, 'create bill', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(81, 'edit bill', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(82, 'delete bill', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(83, 'show bill', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(84, 'manage payment', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(85, 'create payment', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(86, 'edit payment', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(87, 'delete payment', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(88, 'delete bill product', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(89, 'buy plan', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(90, 'send bill', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(91, 'create payment bill', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(92, 'delete payment bill', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(93, 'manage order', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(94, 'income report', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(95, 'expense report', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(96, 'income vs expense report', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(97, 'invoice report', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(98, 'bill report', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(99, 'stock report', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(100, 'tax report', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(101, 'loss & profit report', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(102, 'manage customer payment', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(103, 'manage customer transaction', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(104, 'manage customer invoice', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(105, 'vender manage bill', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(106, 'manage vender bill', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(107, 'manage vender payment', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(108, 'manage vender transaction', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(109, 'manage credit note', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(110, 'create credit note', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(111, 'edit credit note', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(112, 'delete credit note', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(113, 'manage debit note', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(114, 'create debit note', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(115, 'edit debit note', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(116, 'delete debit note', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(117, 'duplicate invoice', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(118, 'duplicate bill', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(119, 'manage coupon', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(120, 'create coupon', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(121, 'edit coupon', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(122, 'delete coupon', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(123, 'manage proposal', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(124, 'create proposal', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(125, 'edit proposal', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(126, 'delete proposal', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(127, 'duplicate proposal', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(128, 'show proposal', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(129, 'send proposal', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(130, 'delete proposal product', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(131, 'manage customer proposal', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(132, 'manage goal', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(133, 'create goal', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(134, 'edit goal', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(135, 'delete goal', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(136, 'manage assets', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(137, 'create assets', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(138, 'edit assets', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(139, 'delete assets', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(140, 'statement report', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(141, 'manage constant custom field', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(142, 'create constant custom field', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(143, 'edit constant custom field', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(144, 'delete constant custom field', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(145, 'manage chart of account', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(146, 'create chart of account', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(147, 'edit chart of account', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(148, 'delete chart of account', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(149, 'manage journal entry', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(150, 'create journal entry', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(151, 'edit journal entry', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(152, 'delete journal entry', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(153, 'show journal entry', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(154, 'balance sheet report', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(155, 'ledger report', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(156, 'trial balance report', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(157, 'create budget planner', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(158, 'edit budget planner', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(159, 'manage budget planner', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(160, 'delete budget planner', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(161, 'view budget planner', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(162, 'manage contract', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(163, 'create contract', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(164, 'manage customer contract', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(165, 'edit contract', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(166, 'delete contract', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(167, 'view contract', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(168, 'duplicate contract', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(169, 'delete attachment', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(170, 'delete comment', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(171, 'delete notes', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(172, 'contract description', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(173, 'upload attachment', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(174, 'add comment', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(175, 'add notes', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(176, 'send contract mail', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(177, 'manage retainer', 'web', '2025-04-07 02:19:18', '2025-04-07 02:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `duration` varchar(100) NOT NULL,
  `max_users` int(11) NOT NULL DEFAULT 0,
  `max_customers` int(11) NOT NULL DEFAULT 0,
  `max_venders` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `price`, `duration`, `max_users`, `max_customers`, `max_venders`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Free Plan', 0.00, 'unlimited', 5, 5, 5, NULL, 'free_plan.png', '2025-04-07 02:19:18', '2025-04-07 02:19:18');

-- --------------------------------------------------------

--
-- Table structure for table `plan_requests`
--

CREATE TABLE `plan_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `duration` varchar(20) NOT NULL DEFAULT 'monthly',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_services`
--

CREATE TABLE `product_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `sku` varchar(191) NOT NULL,
  `sale_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `purchase_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `tax_id` varchar(50) DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT 0,
  `unit_id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_service_categories`
--

CREATE TABLE `product_service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL DEFAULT '0',
  `color` varchar(191) NOT NULL DEFAULT '#fc544b',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_service_units`
--

CREATE TABLE `product_service_units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposals`
--

CREATE TABLE `proposals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `proposal_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `issue_date` date NOT NULL,
  `send_date` date DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `discount_apply` int(11) NOT NULL DEFAULT 0,
  `converted_invoice_id` int(11) NOT NULL DEFAULT 0,
  `converted_retainer_id` int(11) NOT NULL DEFAULT 0,
  `is_convert` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_products`
--

CREATE TABLE `proposal_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `proposal_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `tax` varchar(50) DEFAULT '0',
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `retainers`
--

CREATE TABLE `retainers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `retainer_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `send_date` date DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `discount_apply` int(11) NOT NULL DEFAULT 0,
  `converted_invoice_id` int(11) NOT NULL DEFAULT 0,
  `is_convert` int(11) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `retainer_payments`
--

CREATE TABLE `retainer_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `retainer_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` double(8,2) NOT NULL DEFAULT 0.00,
  `account_id` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `receipt` varchar(191) DEFAULT NULL,
  `payment_type` varchar(191) NOT NULL DEFAULT 'Manually',
  `txn_id` varchar(191) DEFAULT NULL,
  `currency` varchar(191) DEFAULT NULL,
  `order_id` varchar(191) DEFAULT NULL,
  `reference` varchar(191) DEFAULT NULL,
  `add_receipt` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `retainer_products`
--

CREATE TABLE `retainer_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `retainer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `tax` varchar(191) DEFAULT '0',
  `discount` double(8,2) NOT NULL DEFAULT 0.00,
  `price` double(8,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `revenues`
--

CREATE TABLE `revenues` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `account_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `reference` varchar(191) NOT NULL,
  `add_receipt` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'super admin', 'web', 0, '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(2, 'customer', 'web', 0, '2025-04-07 02:19:19', '2025-04-07 02:19:19'),
(3, 'vender', 'web', 0, '2025-04-07 02:19:19', '2025-04-07 02:19:19'),
(4, 'company', 'web', 1, '2025-04-07 02:19:19', '2025-04-07 02:19:19'),
(5, 'accountant', 'web', 2, '2025-04-07 02:19:19', '2025-04-07 02:19:19');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 4),
(1, 5),
(2, 1),
(2, 4),
(3, 1),
(3, 4),
(4, 1),
(4, 4),
(5, 1),
(5, 4),
(6, 1),
(7, 1),
(8, 1),
(8, 4),
(9, 1),
(9, 4),
(10, 1),
(10, 4),
(11, 1),
(11, 4),
(12, 1),
(12, 4),
(13, 1),
(13, 4),
(14, 1),
(14, 4),
(15, 1),
(15, 4),
(16, 4),
(17, 4),
(18, 1),
(19, 4),
(19, 5),
(20, 4),
(20, 5),
(21, 4),
(21, 5),
(22, 4),
(22, 5),
(23, 4),
(23, 5),
(24, 4),
(24, 5),
(25, 4),
(25, 5),
(26, 4),
(26, 5),
(27, 2),
(27, 4),
(27, 5),
(28, 4),
(28, 5),
(29, 4),
(29, 5),
(30, 4),
(30, 5),
(31, 4),
(31, 5),
(32, 4),
(32, 5),
(33, 1),
(33, 4),
(34, 1),
(35, 1),
(36, 4),
(36, 5),
(37, 4),
(37, 5),
(38, 4),
(38, 5),
(39, 4),
(39, 5),
(40, 4),
(40, 5),
(41, 4),
(41, 5),
(42, 4),
(42, 5),
(43, 4),
(43, 5),
(44, 4),
(44, 5),
(45, 4),
(45, 5),
(46, 4),
(46, 5),
(47, 4),
(47, 5),
(48, 4),
(48, 5),
(49, 4),
(49, 5),
(50, 4),
(50, 5),
(51, 4),
(51, 5),
(52, 4),
(52, 5),
(53, 4),
(53, 5),
(54, 4),
(54, 5),
(55, 4),
(55, 5),
(56, 2),
(56, 4),
(56, 5),
(57, 4),
(57, 5),
(58, 4),
(58, 5),
(59, 4),
(59, 5),
(60, 4),
(60, 5),
(61, 3),
(61, 4),
(61, 5),
(62, 4),
(62, 5),
(63, 4),
(63, 5),
(64, 4),
(64, 5),
(65, 4),
(65, 5),
(66, 4),
(66, 5),
(67, 4),
(67, 5),
(68, 4),
(68, 5),
(69, 4),
(69, 5),
(74, 4),
(74, 5),
(75, 4),
(75, 5),
(76, 4),
(76, 5),
(77, 4),
(77, 5),
(78, 4),
(78, 5),
(79, 4),
(79, 5),
(80, 4),
(80, 5),
(81, 4),
(81, 5),
(82, 4),
(82, 5),
(83, 3),
(83, 4),
(83, 5),
(84, 4),
(84, 5),
(85, 4),
(85, 5),
(86, 4),
(86, 5),
(87, 4),
(87, 5),
(88, 4),
(88, 5),
(89, 4),
(90, 4),
(90, 5),
(91, 4),
(91, 5),
(92, 4),
(92, 5),
(93, 1),
(93, 4),
(94, 4),
(94, 5),
(95, 4),
(95, 5),
(96, 4),
(96, 5),
(97, 4),
(97, 5),
(98, 4),
(98, 5),
(99, 4),
(99, 5),
(100, 4),
(100, 5),
(101, 4),
(101, 5),
(102, 2),
(103, 2),
(104, 2),
(105, 3),
(106, 3),
(107, 3),
(108, 3),
(109, 4),
(109, 5),
(110, 4),
(110, 5),
(111, 4),
(111, 5),
(112, 4),
(112, 5),
(113, 4),
(113, 5),
(114, 4),
(114, 5),
(115, 4),
(115, 5),
(116, 4),
(116, 5),
(117, 4),
(118, 4),
(119, 1),
(120, 1),
(121, 1),
(122, 1),
(123, 4),
(123, 5),
(124, 4),
(124, 5),
(125, 4),
(125, 5),
(126, 4),
(126, 5),
(127, 4),
(127, 5),
(128, 2),
(128, 4),
(128, 5),
(129, 4),
(129, 5),
(130, 4),
(130, 5),
(131, 2),
(132, 4),
(132, 5),
(133, 4),
(133, 5),
(134, 4),
(134, 5),
(135, 4),
(135, 5),
(136, 4),
(136, 5),
(137, 4),
(137, 5),
(138, 4),
(138, 5),
(139, 4),
(139, 5),
(140, 4),
(140, 5),
(141, 4),
(141, 5),
(142, 4),
(142, 5),
(143, 4),
(143, 5),
(144, 4),
(144, 5),
(145, 4),
(145, 5),
(146, 4),
(146, 5),
(147, 4),
(147, 5),
(148, 4),
(148, 5),
(149, 4),
(149, 5),
(150, 4),
(150, 5),
(151, 4),
(151, 5),
(152, 4),
(152, 5),
(153, 4),
(153, 5),
(154, 4),
(154, 5),
(155, 4),
(155, 5),
(156, 4),
(156, 5),
(157, 4),
(157, 5),
(158, 4),
(158, 5),
(159, 4),
(159, 5),
(160, 4),
(160, 5),
(161, 4),
(161, 5),
(162, 4),
(163, 4),
(164, 2),
(165, 4),
(166, 4),
(167, 2),
(167, 4),
(168, 4),
(169, 4),
(170, 4),
(171, 4),
(172, 2),
(172, 4),
(173, 2),
(173, 4),
(174, 2),
(174, 4),
(175, 2),
(175, 4),
(176, 4),
(177, 4),
(177, 5);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `value` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'local_storage_validation', 'jpg,jpeg,png,xlsx,xls,csv,pdf', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(2, 'wasabi_storage_validation', 'jpg,jpeg,png,xlsx,xls,csv,pdf', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(3, 's3_storage_validation', 'jpg,jpeg,png,xlsx,xls,csv,pdf', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(4, 'local_storage_max_upload_size', '2048000', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(5, 'wasabi_max_upload_size', '2048000', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(6, 's3_max_upload_size', '2048000', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(7, 'storage_setting', 'local', 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `stock_reports`
--

CREATE TABLE `stock_reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `type` varchar(191) NOT NULL,
  `type_id` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `rate` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` varchar(191) NOT NULL,
  `account` int(11) NOT NULL,
  `type` varchar(191) NOT NULL,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `description` text DEFAULT NULL,
  `date` date NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `payment_id` int(11) NOT NULL DEFAULT 0,
  `category` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_account` int(11) NOT NULL DEFAULT 0,
  `to_account` int(11) NOT NULL DEFAULT 0,
  `amount` decimal(16,2) NOT NULL DEFAULT 0.00,
  `date` date NOT NULL,
  `payment_method` int(11) NOT NULL DEFAULT 0,
  `reference` varchar(191) DEFAULT NULL,
  `description` text NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `type` varchar(100) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `lang` varchar(100) NOT NULL,
  `mode` varchar(10) NOT NULL DEFAULT 'light',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `plan` int(11) DEFAULT NULL,
  `plan_expire_date` date DEFAULT NULL,
  `requested_plan` int(11) NOT NULL DEFAULT 0,
  `delete_status` int(11) NOT NULL DEFAULT 1,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `type`, `avatar`, `lang`, `mode`, `created_by`, `plan`, `plan_expire_date`, `requested_plan`, `delete_status`, `is_active`, `remember_token`, `last_login_at`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'superadmin@example.com', '2025-04-07 02:19:18', '$2y$10$qxRnGjeQb05dYa9MZ0ArIeyRc22YUT77EtSq0y1w2RIVzN1LVp76y', 'super admin', '', 'en', 'light', 0, NULL, NULL, 0, 1, 1, NULL, NULL, '2025-04-07 02:19:18', '2025-04-07 02:19:18'),
(2, 'company', 'company@example.com', '2025-04-07 02:19:19', '$2y$10$40Ai2EkSBC93gAj4jixpdOjvgj2jQcuxdjysyf7dSLAjvOr6xD9cK', 'company', '', 'en', 'light', 1, 1, NULL, 0, 1, 1, NULL, NULL, '2025-04-07 02:19:19', '2025-04-07 02:19:19'),
(3, 'accountant', 'accountant@example.com', '2025-04-07 02:19:20', '$2y$10$7.Z.UB1.BbM2NPkBvUeNuuTNFWjmN4APaVnkbFbBtAt/r6yVrewtS', 'accountant', '', 'en', 'light', 2, NULL, NULL, 0, 1, 1, NULL, NULL, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(4, 'tawfiq', 'tawfiq@example.com', '2025-04-07 04:25:05', '$2y$10$bQYhhsASjwQGVxba3LNRc.e9kygrhuEoErXjJbzF8suyHajItA4Au', 'accountant', NULL, 'en', 'light', 2, NULL, NULL, 0, 1, 1, NULL, NULL, '2025-04-07 04:25:05', '2025-04-07 04:25:05');

-- --------------------------------------------------------

--
-- Table structure for table `user_coupons`
--

CREATE TABLE `user_coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL,
  `coupon` int(11) NOT NULL,
  `order` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_email_templates`
--

CREATE TABLE `user_email_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `template_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_email_templates`
--

INSERT INTO `user_email_templates` (`id`, `template_id`, `user_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(2, 2, 2, 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(3, 3, 2, 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(4, 4, 2, 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(5, 5, 2, 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(6, 6, 2, 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(7, 7, 2, 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(8, 8, 2, 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(9, 9, 2, 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(10, 10, 2, 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(11, 11, 2, 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(12, 12, 2, 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20'),
(13, 13, 2, 1, '2025-04-07 02:19:20', '2025-04-07 02:19:20');

-- --------------------------------------------------------

--
-- Table structure for table `venders`
--

CREATE TABLE `venders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `vender_id` int(11) NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `tax_number` varchar(191) DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `contact` varchar(191) DEFAULT NULL,
  `avatar` varchar(100) NOT NULL DEFAULT '',
  `created_by` int(11) NOT NULL DEFAULT 0,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `billing_name` varchar(191) NOT NULL,
  `billing_country` varchar(191) NOT NULL,
  `billing_state` varchar(191) NOT NULL,
  `billing_city` varchar(191) NOT NULL,
  `billing_phone` varchar(191) NOT NULL,
  `billing_zip` varchar(191) NOT NULL,
  `billing_address` text NOT NULL,
  `shipping_name` varchar(191) DEFAULT NULL,
  `shipping_country` varchar(191) DEFAULT NULL,
  `shipping_state` varchar(191) DEFAULT NULL,
  `shipping_city` varchar(191) DEFAULT NULL,
  `shipping_phone` varchar(191) DEFAULT NULL,
  `shipping_zip` varchar(191) DEFAULT NULL,
  `shipping_address` varchar(191) DEFAULT NULL,
  `lang` varchar(191) NOT NULL DEFAULT 'en',
  `balance` double(8,2) NOT NULL DEFAULT 0.00,
  `remember_token` varchar(100) DEFAULT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_payment_settings`
--
ALTER TABLE `admin_payment_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_payment_settings_name_created_by_unique` (`name`,`created_by`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_payments`
--
ALTER TABLE `bill_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_products`
--
ALTER TABLE `bill_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `budgets`
--
ALTER TABLE `budgets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_of_account_sub_types`
--
ALTER TABLE `chart_of_account_sub_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chart_of_account_types`
--
ALTER TABLE `chart_of_account_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_payment_settings`
--
ALTER TABLE `company_payment_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `company_payment_settings_name_created_by_unique` (`name`,`created_by`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_attachments`
--
ALTER TABLE `contract_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_comments`
--
ALTER TABLE `contract_comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_notes`
--
ALTER TABLE `contract_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_types`
--
ALTER TABLE `contract_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `credit_notes`
--
ALTER TABLE `credit_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_field_values_record_id_field_id_unique` (`record_id`,`field_id`),
  ADD KEY `custom_field_values_field_id_foreign` (`field_id`);

--
-- Indexes for table `debit_notes`
--
ALTER TABLE `debit_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_template_langs`
--
ALTER TABLE `email_template_langs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_products`
--
ALTER TABLE `invoice_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_entries`
--
ALTER TABLE `journal_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `journal_items`
--
ALTER TABLE `journal_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_id_unique` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `plans_name_unique` (`name`);

--
-- Indexes for table `plan_requests`
--
ALTER TABLE `plan_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_services`
--
ALTER TABLE `product_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_service_categories`
--
ALTER TABLE `product_service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_service_units`
--
ALTER TABLE `product_service_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposals`
--
ALTER TABLE `proposals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `proposal_products`
--
ALTER TABLE `proposal_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `retainers`
--
ALTER TABLE `retainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `retainer_payments`
--
ALTER TABLE `retainer_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `retainer_products`
--
ALTER TABLE `retainer_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `revenues`
--
ALTER TABLE `revenues`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_name_created_by_unique` (`name`,`created_by`);

--
-- Indexes for table `stock_reports`
--
ALTER TABLE `stock_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_coupons`
--
ALTER TABLE `user_coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_email_templates`
--
ALTER TABLE `user_email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `venders`
--
ALTER TABLE `venders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_payment_settings`
--
ALTER TABLE `admin_payment_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assets`
--
ALTER TABLE `assets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_payments`
--
ALTER TABLE `bill_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bill_products`
--
ALTER TABLE `bill_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `budgets`
--
ALTER TABLE `budgets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chart_of_accounts`
--
ALTER TABLE `chart_of_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `chart_of_account_sub_types`
--
ALTER TABLE `chart_of_account_sub_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `chart_of_account_types`
--
ALTER TABLE `chart_of_account_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `company_payment_settings`
--
ALTER TABLE `company_payment_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_attachments`
--
ALTER TABLE `contract_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_comments`
--
ALTER TABLE `contract_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_notes`
--
ALTER TABLE `contract_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contract_types`
--
ALTER TABLE `contract_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `credit_notes`
--
ALTER TABLE `credit_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `debit_notes`
--
ALTER TABLE `debit_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `email_template_langs`
--
ALTER TABLE `email_template_langs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_payments`
--
ALTER TABLE `invoice_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_products`
--
ALTER TABLE `invoice_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journal_entries`
--
ALTER TABLE `journal_entries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journal_items`
--
ALTER TABLE `journal_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `plan_requests`
--
ALTER TABLE `plan_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_services`
--
ALTER TABLE `product_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_service_categories`
--
ALTER TABLE `product_service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_service_units`
--
ALTER TABLE `product_service_units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposals`
--
ALTER TABLE `proposals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_products`
--
ALTER TABLE `proposal_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retainers`
--
ALTER TABLE `retainers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retainer_payments`
--
ALTER TABLE `retainer_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `retainer_products`
--
ALTER TABLE `retainer_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revenues`
--
ALTER TABLE `revenues`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stock_reports`
--
ALTER TABLE `stock_reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_coupons`
--
ALTER TABLE `user_coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_email_templates`
--
ALTER TABLE `user_email_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `venders`
--
ALTER TABLE `venders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `custom_field_values`
--
ALTER TABLE `custom_field_values`
  ADD CONSTRAINT `custom_field_values_field_id_foreign` FOREIGN KEY (`field_id`) REFERENCES `custom_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
