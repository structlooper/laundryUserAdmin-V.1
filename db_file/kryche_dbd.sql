-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 05, 2021 at 04:47 PM
-- Server version: 5.7.27
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `covidvaccination_kryche`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `door_no` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `customer_id`, `address`, `door_no`, `latitude`, `longitude`, `pincode`, `status`, `created_at`, `updated_at`) VALUES
(4, 13, 'C/71, Block C, Sector 8 Dwarka, Dwarka, New Delhi, Delhi 110077, India', 'Door number 18 ,', '28.57013269142383', '77.07488419488072', '110077', 1, '2021-04-24 12:44:02', '2021-04-29 11:19:22'),
(6, 13, '482, Phase III, Jacobpura, Sector 19, Gurugram, Haryana 122016, India', 'Gurugram hrayana updated address', '28.45949615948365', '77.02663796022534', '122016', 1, '2021-04-24 12:59:00', '2021-04-26 08:56:56'),
(9, 16, 'A104, Block A, Sector 8 Dwarka, Dwarka, New Delhi, Delhi 110077, India', 'Sector 55 gurgaon', '28.574299628160333', '77.07159982994199', '110077', 1, '2021-04-29 06:32:25', NULL),
(10, 16, 'Unnamed Road, Ghatta Kanarpur, Sector 58, Ghata, Haryana 122102, India', 'House no 106', '28.418584400793655', '77.1139951609075', '122102', 1, '2021-04-29 06:33:32', NULL),
(12, 13, '22D, Block F, Raj Nagar II Extension, Raj Nagar, New Delhi, Delhi 110045, India', 'Thkgg', '28.5748512241515', '77.08125343546271', '110045', 1, '2021-04-29 11:31:39', NULL),
(19, 14, '906/7, Block F, Raj Nagar Extension, Raj Nagar, New Delhi, Delhi 110045, India', 'Delhi dwarka', '28.5770844345815', '77.07913281396031', '110059', 1, '2021-04-30 13:23:11', '2021-05-28 13:16:25'),
(21, 13, '254, Block G, Subhash Park, Palam, New Delhi, Delhi 110075, India', 'Home address updated', '28.605230616230926', '77.05460099503398', '110075', 1, '2021-05-13 07:25:13', '2021-05-13 07:29:42'),
(22, 13, '64/1, Majra, Block B, Om Vihar, Nawada, New Delhi, Delhi 110059, India', 'Test address', '28.62404332754106', '77.0548195950687', '110059', 1, '2021-05-14 09:41:40', NULL),
(23, 22, 'Unnamed Road, Dwarka Sector 9, Dwarka, New Delhi, Delhi 110077, India', 'New', '28.577964779279796', '77.06459758803248', '110077', 1, '2021-05-17 08:33:38', '2021-05-17 08:33:50'),
(24, 16, '26B, Block E, Om Vihar, Uttam Nagar, New Delhi, Delhi 110059, India', 'Plot 7c near Shiv mandir', '28.62853926035602', '77.0524431578815', '110059', 1, '2021-05-20 07:15:43', NULL),
(25, 13, 'Uttam Nagar East, shish ram park A-62/3, Chatrapati, Shivaji Marg, Block D, JJ Colony, Uttam Nagar, New Delhi, Delhi 110059, India', 'Thanks 😘', '28.62480497150005', '77.06530602648854', '110059', 1, '2021-06-04 07:20:04', NULL),
(26, 13, '1600 Amphitheatre Pkwy, Mountain View, CA 94043, USA', 'hrtrtj', '37.42199778241184', '-122.08400001749398', '112288', 1, '2021-06-04 07:29:01', NULL),
(27, 13, 'B-107, Rajan Enclave, Vikas Nagar, Uttam Nagar, Hastsal, Delhi, 110059, India', 'Hdjskwn', '28.635289446392093', '77.04871052876115', '110059', 1, '2021-06-04 07:34:14', NULL),
(28, 13, 'B-107, Rajan Enclave, Vikas Nagar, Uttam Nagar, Hastsal, Delhi, 110059, India', 'Hdjskwn', '28.635289446392093', '77.04871052876115', '110059', 1, '2021-06-04 07:35:38', NULL),
(29, 13, 'B-107, Rajan Enclave, Vikas Nagar, Uttam Nagar, Hastsal, Delhi, 110059, India', 'Hdjskwn', '28.635288857856445', '77.0487098582089', '110059', 1, '2021-06-04 07:36:44', NULL),
(30, 13, 'B-107, Rajan Enclave, Vikas Nagar, Uttam Nagar, Hastsal, Delhi, 110059, India', 'Hdjskwn', '28.635289446392093', '77.04871052876115', '110059', 1, '2021-06-04 07:37:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, '2021-05-17 05:46:59'),
(8, 0, 19, 'Faqs', 'fa-question-circle', 'faqs', NULL, '2019-07-23 03:37:04', '2021-05-17 08:05:29'),
(10, 25, 4, 'Services', 'fa-align-justify', 'services', NULL, '2019-07-23 03:37:44', '2021-05-17 05:46:59'),
(11, 29, 21, 'App Settings', 'fa-cog', 'app_settings', '*', '2019-07-23 03:38:09', '2021-05-17 08:08:05'),
(12, 0, 17, 'Promo Codes', 'fa-bookmark', 'promo_codes', NULL, '2019-07-23 03:38:54', '2021-05-17 06:42:18'),
(13, 25, 5, 'Categories', 'fa-bars', 'categories', NULL, '2019-07-26 10:36:06', '2021-05-17 05:46:59'),
(14, 0, 15, 'Customers', 'fa-users', 'customers', '*', '2019-08-20 02:12:07', '2021-05-17 06:42:18'),
(15, 0, 16, 'Delivery Boys', 'fa-user', 'delivery_boys', '*', '2019-08-20 02:12:32', '2021-05-17 06:42:18'),
(16, 29, 23, 'Privacy Policies', 'fa-file-pdf-o', 'privacy_policies', '*', '2019-08-22 14:34:52', '2021-05-17 06:42:18'),
(17, 25, 6, 'Products', 'fa-align-justify', 'products', '*', '2019-08-22 14:45:12', '2021-05-17 05:46:59'),
(19, 0, 7, 'Orders', 'fa-th-list', 'orders', '*', '2019-08-25 07:47:04', '2021-05-17 05:46:59'),
(21, 29, 22, 'Payment Methods', 'fa-product-hunt', 'payment-methods', '*', '2020-06-09 13:43:09', '2021-05-17 06:42:18'),
(22, 0, 18, 'Units', 'fa-calculator', 'units', '*', '2021-04-22 09:28:59', '2021-05-17 06:42:18'),
(23, 0, 10, 'Home Banners', 'fa-image', 'banner-images', '*', '2021-04-22 09:45:18', '2021-05-20 07:00:38'),
(24, 0, 9, 'Time Slots', 'fa-calendar', 'time-slots', '*', '2021-04-26 12:05:40', '2021-05-20 07:00:38'),
(25, 0, 3, 'Management', 'fa-bars', '#', NULL, '2021-04-28 10:08:35', '2021-05-17 09:38:45'),
(27, 0, 8, 'Membership', 'fa-universal-access', 'memberships', '*', '2021-05-10 08:51:06', '2021-05-17 05:46:59'),
(28, 0, 2, 'Service areas', 'fa-location-arrow', 'service-areas', '*', '2021-05-12 11:59:21', '2021-05-17 05:46:59'),
(29, 0, 20, 'Settings', 'fa-cogs', '#', '*', '2021-05-14 10:39:09', '2021-05-17 06:42:18'),
(32, 0, 11, 'System management', 'fa-bank', '#', '*', '2021-05-17 05:39:09', '2021-05-17 06:42:18'),
(33, 32, 13, 'Admin users', 'fa-users', 'auth/users', '*', '2021-05-17 05:40:04', '2021-05-17 09:09:41'),
(34, 32, 12, 'Admin user roles', 'fa-hand-paper-o', 'auth/roles', NULL, '2021-05-17 05:46:39', '2021-05-17 09:09:41'),
(35, 32, 14, 'Side menus', 'fa-ellipsis-v', 'auth/menu', '*', '2021-05-17 05:54:36', '2021-05-17 06:42:18');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin/view_orders/23', 'GET', '47.31.222.20', '[]', '2021-06-05 11:16:59', '2021-06-05 11:16:59');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', '2021-05-17 09:14:39', '2021-05-17 09:20:53'),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL),
(6, 'services', 'services', '', '/services', '2021-05-17 08:23:29', '2021-05-17 08:23:51'),
(7, 'faq', 'faq', '', '/faqs', '2021-05-17 08:51:40', '2021-05-17 08:51:40'),
(10, 'categories', 'categories', '', '/categories', '2021-05-17 09:31:08', '2021-05-17 09:31:08'),
(11, 'customers', 'customers', '', '/customers', '2021-05-17 09:31:26', '2021-05-17 09:32:53'),
(12, 'Delivery boys', 'delivery_boys', '', '/delivery_boys', '2021-05-17 09:31:59', '2021-05-17 09:32:43'),
(13, 'Privacy policies', 'privacy_policies', '', '/privacy_policies', '2021-05-17 09:32:34', '2021-05-17 09:32:34'),
(14, 'Products', 'products', '', '/products', '2021-05-17 09:33:15', '2021-05-17 09:33:15'),
(15, 'orders', 'orders', '', '/orders', '2021-05-17 09:33:37', '2021-05-17 09:33:37'),
(16, 'payment methods', 'payment-methods', '', '/payment-methods', '2021-05-17 09:34:09', '2021-05-17 09:34:09'),
(17, 'Banner images', 'banner-images', '', '/banner-images', '2021-05-17 09:34:38', '2021-05-17 09:34:38'),
(18, 'units', 'units', '', '/units', '2021-05-17 09:34:57', '2021-05-17 09:34:57'),
(19, 'Time slots', 'time-slots', '', '/time-slots', '2021-05-17 09:35:29', '2021-05-17 09:35:29'),
(20, 'memberships', 'memberships', '', '/memberships', '2021-05-17 09:35:48', '2021-05-17 09:35:48'),
(21, 'service areas', 'service-areas', '', 'service-areas', '2021-05-17 09:36:07', '2021-05-17 09:36:07');

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2019-07-21 03:46:33', '2019-07-21 03:46:33'),
(2, 'Tester', 'Tester', '2021-05-17 04:09:02', '2021-05-17 04:09:02');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 8, NULL, NULL),
(1, 10, NULL, NULL),
(1, 11, NULL, NULL),
(1, 12, NULL, NULL),
(1, 13, NULL, NULL),
(1, 14, NULL, NULL),
(1, 15, NULL, NULL),
(1, 16, NULL, NULL),
(1, 17, NULL, NULL),
(1, 19, NULL, NULL),
(1, 21, NULL, NULL),
(1, 8, NULL, NULL),
(1, 10, NULL, NULL),
(1, 11, NULL, NULL),
(1, 12, NULL, NULL),
(1, 13, NULL, NULL),
(1, 14, NULL, NULL),
(1, 15, NULL, NULL),
(1, 16, NULL, NULL),
(1, 17, NULL, NULL),
(1, 19, NULL, NULL),
(1, 21, NULL, NULL),
(1, 22, NULL, NULL),
(1, 23, NULL, NULL),
(1, 24, NULL, NULL),
(1, 25, NULL, NULL),
(1, 27, NULL, NULL),
(1, 28, NULL, NULL),
(1, 29, NULL, NULL),
(1, 32, NULL, NULL),
(1, 33, NULL, NULL),
(1, 35, NULL, NULL),
(1, 1, NULL, NULL),
(2, 8, NULL, NULL),
(2, 1, NULL, NULL),
(2, 25, NULL, NULL),
(2, 13, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(2, 3, NULL, NULL),
(1, 1, NULL, NULL),
(2, 2, NULL, NULL),
(2, 7, NULL, NULL),
(2, 4, NULL, NULL),
(2, 10, NULL, NULL),
(2, 16, NULL, NULL),
(2, 17, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(1, 1, NULL, NULL),
(2, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$M.hVzY4gb8mOLb9h1pn6nehmpXt6079X8yeSQ3zQec1JqDxci0.Li', 'Administrator', 'images/IMG_20200917_092552_738.jpg', 'pSkO2RaOsLiEX8iTTT5NrqwprVIumg38Y7Iw73GShLBXKGjqmbx8RQ5bFxXV', '2019-07-21 03:46:33', '2021-05-20 06:54:47'),
(3, 'testing', '$2y$10$8cptlckKCmIk1C9PdSijMO16C6FiNmpWU9rPji5x7.bfHEqXgovgK', 'testing', NULL, 'ByGBlgSJvCCYkxYu83gXTtQJ21eMcd2as1GAgPUaSPxKvRA6r6XgbpuBiwYT', '2021-05-17 04:16:57', '2021-05-17 05:56:17');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_user_permissions`
--

INSERT INTO `admin_user_permissions` (`user_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE `app_settings` (
  `id` int(11) NOT NULL,
  `application_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `whatsapp_number` varchar(100) NOT NULL,
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(250) NOT NULL,
  `address_lat` double NOT NULL,
  `address_lng` double NOT NULL,
  `about_us` text NOT NULL,
  `country` varchar(50) NOT NULL,
  `default_currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_short_code` varchar(10) NOT NULL,
  `fcm_server_key` varchar(225) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_settings`
--

INSERT INTO `app_settings` (`id`, `application_name`, `logo`, `contact_number`, `whatsapp_number`, `email`, `address`, `address_lat`, `address_lng`, `about_us`, `country`, `default_currency`, `currency_short_code`, `fcm_server_key`, `created_at`, `updated_at`) VALUES
(1, 'KRYCHE', 'images/86e12013466c485b59229f280aa03415.jpg', '7678178911', '7678178911', 'support@kryche.com', 'Block A, 2nd Floor, Plot No. 11, 12, 16, 17 Palam Extension, Sector 7 Dwarka, Dwarka, Delhi, 110075', 28.5851, 77.0713, 'this Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam lacinia placerat nunc pretium efficitur. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nulla id eros tortor. Etiam ut porttitor dolor. Vivamus interdum, purus a eleifend condimentum, eros erat finibus ex, nec lacinia elit arcu eget neque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean elementum quam magna, et ultrices orci dignissim ac. Integer eu viverra lacus. In metus augue, porta sed ullamcorper sit amet, semper a sapien. Etiam congue eu massa sed facilisis. Pellentesque scelerisque viverra rutrum. Maecenas fermentum vehicula tellus. Aliquam sit amet pretium mauris, quis mollis erat.', 'India', '₹', 'INR', 'AAAA6CbcUU4:APA91bEjXcUD5QHo5eJ70JNWQYhbgmS24mDBwIIwn4sexCbT8mKThwddBoevcjOM8uOcZZ_5E_3MikmSmQgtNiVaeUDnHxKrvh9yY1wan673VZs4TBlpyNS4gK06bKP5C895CP6dNmcD', '2019-07-23 09:14:40', '2021-05-03 17:08:37');

-- --------------------------------------------------------

--
-- Table structure for table `banner_images`
--

CREATE TABLE `banner_images` (
  `id` int(11) NOT NULL,
  `banner_image` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(225) COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banner_images`
--

INSERT INTO `banner_images` (`id`, `banner_image`, `title`, `text`, `service_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'images/d1383611345f6af5262f1c4bbf2f577f.jpg', 'Flat 20% off on laundry service', 'View all offers', 1, 1, '2020-06-12 12:58:27', '2021-04-21 18:14:31'),
(2, 'images/af9a96745be6d0b11eb2bdce51aebbad.jpg', 'Rupees 100 discount on new users', 'More offers', 2, 1, '2020-06-12 12:58:45', '2021-04-21 18:15:56'),
(3, 'images/37577f54019b69030964971caa7e17fd.png', 'Make Iron with wash and get 20% off', 'View all offers', 3, 1, '2020-06-12 12:59:04', '2021-04-21 18:18:12');

-- --------------------------------------------------------

--
-- Table structure for table `cart_products`
--

CREATE TABLE `cart_products` (
  `id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `mem_dis` double(5,2) NOT NULL DEFAULT '0.00',
  `price` double(10,2) NOT NULL,
  `final_price` double(5,2) NOT NULL DEFAULT '0.00',
  `unit` varchar(225) NOT NULL,
  `product_additional_charges` double(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart_products`
--

INSERT INTO `cart_products` (`id`, `cart_id`, `product_id`, `qty`, `mem_dis`, `price`, `final_price`, `unit`, `product_additional_charges`) VALUES
(70, 11, 1, 4, 20.00, 40.00, 20.00, 'kg', 0.00),
(71, 11, 4, 1, 7.50, 15.00, 7.50, 'kg', 0.00),
(72, 12, 1, 3, 15.00, 30.00, 15.00, 'kg', 0.00),
(73, 13, 1, 4, 20.00, 40.00, 20.00, 'kg', 0.00),
(74, 14, 1, 1, 5.00, 10.00, 5.00, 'kg', 0.00),
(75, 15, 4, 2, 15.00, 30.00, 15.00, 'kg', 0.00),
(77, 16, 1, 2, 10.00, 20.00, 10.00, 'kg', 0.00),
(79, 18, 1, 1, 1.00, 10.00, 9.00, 'kg', 0.00),
(80, 17, 1, 3, 3.00, 30.00, 27.00, 'kg', 0.00),
(81, 17, 2, 8, 5.20, 52.00, 46.80, 'piece', 0.00),
(83, 17, 4, 2, 3.00, 30.00, 27.00, 'kg', 0.00),
(84, 17, 5, 1, 0.70, 7.00, 6.30, 'piece', 0.00),
(85, 16, 4, 1, 3.00, 15.00, 12.00, 'kg', 0.00),
(86, 19, 1, 0, 0.00, 0.00, 0.00, 'kg', 0.00),
(87, 19, 2, 1, 0.00, 6.50, 6.50, 'piece', 0.00),
(88, 19, 3, 1, 0.00, 10.00, 10.00, 'meter', 0.00),
(89, 19, 4, 5, 0.00, 75.00, 75.00, 'kg', 0.00),
(91, 20, 4, 2, 0.00, 30.00, 30.00, 'kg', 0.00),
(92, 21, 4, 3, 0.00, 45.00, 45.00, 'kg', 0.00),
(93, 22, 4, 12, 0.00, 180.00, 180.00, 'kg', 0.00),
(94, 22, 5, 2, 0.00, 14.00, 14.00, 'piece', 0.00),
(112, 24, 5, 3, 0.00, 21.00, 21.00, 'piece', 0.00),
(113, 24, 4, 6, 0.00, 90.00, 90.00, 'kg', 0.00),
(117, 20, 1, 2, 0.00, 20.00, 20.00, 'kg', 0.00),
(118, 20, 2, 3, 0.00, 19.50, 19.50, 'piece', 0.00),
(119, 24, 2, 3, 0.00, 19.50, 19.50, 'piece', 0.00),
(120, 24, 1, 2, 0.00, 20.00, 20.00, 'kg', 0.00),
(121, 25, 1, 1, 0.00, 10.00, 10.00, 'kg', 0.00),
(122, 25, 2, 1, 0.00, 6.50, 6.50, 'piece', 0.00),
(123, 26, 1, 1, 0.00, 10.00, 10.00, 'kg', 0.00),
(124, 26, 2, 1, 0.00, 6.50, 6.50, 'piece', 0.00),
(125, 26, 2, 1, 0.00, 6.50, 6.50, 'piece', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_name_ar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_id` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_name_ar`, `service_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Men', 'arSampleCat', '1,2', 1, '2021-04-21 06:07:58', '2021-04-22 09:19:49'),
(2, 'Women', 'arSampleCat2', '1,2', 1, '2021-04-21 06:07:58', '2021-04-21 19:10:53'),
(3, 'Kids', 'arSampleCat3', '1', 1, '2021-04-21 06:07:58', '2021-04-21 19:13:01'),
(4, 'Others', 'arSampleCat4', '1', 1, '2021-04-21 06:07:58', '2021-05-10 11:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `membership` int(11) NOT NULL DEFAULT '0',
  `customer_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `profile_picture` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address` int(11) NOT NULL DEFAULT '0',
  `otp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` text,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `membership`, `customer_name`, `phone_number`, `email`, `password`, `profile_picture`, `default_address`, `otp`, `fcm_token`, `status`, `created_at`, `updated_at`) VALUES
(13, 2, 'Deepak kumar', '7678178911', 'structlooper@gmail.com', NULL, 'images/1619881268.jpg', 25, '461392', NULL, 1, '2021-04-20 23:16:40', '2021-06-04 15:09:12'),
(14, 0, 'Satish sahab', '9990944381', 'sahabsatish@gmail.com', NULL, NULL, 19, '373380', 'ejoNsgBoR8mOHK8YV1XBQb:APA91bHJ9scOl7_j9TZ2ZSZN3NhRoS7ySEMapvoQ5moqcYily1VrDMna5n22JBGx6WpQRXktixHIeVRek0u3TUL8wfs5Fdfpkwjk2I_isr-6Bcoi1G0pivLQmCukIogavzm-23vGaclM', 1, '2021-04-23 20:09:57', '2021-05-29 11:22:37'),
(15, 0, 'Sachin', '8601502970', 'sachinmaurya699@gmail.com', NULL, NULL, 0, '882879', NULL, 1, '2021-04-25 13:59:12', '2021-04-25 13:59:12'),
(16, 0, 'Niraj', '7979034079', 'nirajkumarchoudhary99@gmail.com', NULL, 'images/1621494597.png', 24, '139903', 'cMciOspbS7aFfxhe2Pd_tr:APA91bGBBc5tug6m_NKZmaYfRw3EECo6WmYFsKmHRKP41yLNdpSYRZt34dnwkWX7GFvVsf6tv654h2E7RPxN6tTGlhE4rwJqM5IEWYgA9x1L2S0hMTSorY9aWNX50iuo3zRTRMVBCGmg', 1, '2021-04-29 11:58:28', '2021-05-20 12:45:52'),
(22, 1, 'Sanjay', '8447494296', 'Sanjay@gmail.com', NULL, 'images/1621238305.jpg', 23, '299750', 'eeAxgc7IRyiixubwG63Wtk:APA91bGlDeGSRxVx9tpbk-VFyOsdUeQPaGLlF2IQy9qvd9E4oLUNkgZ4tMEtApayX2fLsAyDOZyWMXmewTxShGDsRl336dOFeB9xFU1cgnp5EDq_GsBPpNBDUacNYiKZhcu_8zuY3aSu', 1, '2021-05-17 13:26:33', '2021-05-17 18:08:56'),
(23, 0, 'Dhiraj', '7632859600', 'dhirajchoudhary999@gmail.com', NULL, NULL, 0, '246225', 'fAaZ3FnoRCWDFXBZTc6fac:APA91bFZbcjgYkSz6A5ws1Rq0e1IIvK9fQCJPVZTwRHAlkgcUDf12-nXhJMQrznVHKYVep0kof78DiE8tErhIMv2iGKwsRgVMCDWyVfO0aQ2gI5ztdpXzSoJufAbP2NlL4qqhBlP8kox', 1, '2021-05-19 17:36:11', '2021-05-19 17:36:11'),
(24, 0, 'Shivam', '8340294480', 'gamogeneegames@gmail.com', NULL, NULL, 0, '564807', 'fA-fA1jJTAWEZPU62nvzYO:APA91bG5EBSyFXJDJb8DMug-YrHdB_0oND3zxfG7Zh91i6PGpSCzveBESpAxs0pCLjz3lc-O2RSTGAnnN_SHRV3rA9HsGOrX5BXTT23DvWdvRP5gDKwmBWoog_RC2YKGjmfexX6K63iY', 1, '2021-05-23 13:32:46', '2021-05-23 13:43:30');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boys`
--

CREATE TABLE `delivery_boys` (
  `id` int(11) NOT NULL,
  `wallet` double(5,2) NOT NULL DEFAULT '0.00',
  `delivery_boy_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `profile_picture` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `otp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` text,
  `delivery_boy_type` int(11) NOT NULL DEFAULT '1',
  `salary` double(10,2) DEFAULT NULL,
  `commission` double(10,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_boys`
--

INSERT INTO `delivery_boys` (`id`, `wallet`, `delivery_boy_name`, `phone_number`, `email`, `password`, `profile_picture`, `status`, `otp`, `fcm_token`, `delivery_boy_type`, `salary`, `commission`, `created_at`, `updated_at`) VALUES
(1, 0.00, 'test Driver', '1234567892', 'test@test.com', '$2y$12$WJz6gktTucnlI4UZKuoUzuAezqLfuApJ4UhyRU5FrUsxweKIMpm7i', 'images/a1b12e04dd4bd30d6b0c4ef306e502e3.jpg', 1, '131509', 'd-SEhxK4SMaQqRspQO7kqW:APA91bFazeMw7cMy4lAPD50WxgvM7EDkwCgbRlCxh3Mvto58S-aTN_XB375VMroiaf74CnJrkJCF3x-V0qb6elr7rdVm3kuozrusL9mh0nvwK97ZHOwL3hn58qDyCQmXXBchkQbtbYxg', 2, 5000.00, NULL, '2021-04-28 15:50:29', '2021-05-28 18:43:06'),
(2, 7.30, 'Deepak kumar', '7678178911', 'structlooper@gmail.com', NULL, 'images/1621256093.jpg', 1, '316909', 'fITSI7QyTgGS-yrJaKik_6:APA91bFtSIMoqHzxqkgNaKmKXyJvto43SLwyM16xV-QEkYO8TjRPbUdyuFuJJPVvjTsCh04MtZvBKeT12JI3-9SXxPougaiaXN0xETMJrlHe0u-GBAL_m2gfygCWjFAyCYpZLvpeWBx8', 1, NULL, 10.00, '2021-05-05 14:56:48', '2021-05-17 18:25:06'),
(3, 0.00, 'Dhiraj', '7632859600', 'dhirajchoudhary999@gmail.com', NULL, NULL, 1, '692861', 'eH_lRGjDSO2KuigOKGRrLl:APA91bE1w3gGSqvsf73m8pq2CtFvTVbwM7ldKdB9JUyHsAE-mZ8gcRfd3BPU0ZG1n99nDgUtxS7oqzsZxvAbIUhkqoPINlU-_xdH-dgahzRKbmBGmAx67kga-oRVX3g2t1TK5IV7HMlF', 1, NULL, NULL, '2021-05-19 17:32:12', '2021-05-19 17:32:12'),
(4, 0.00, 'Niraj', '7979034079', 'nirajkumarchoudhary99@gmail.com', NULL, 'images/04784e0c80c62aec0fb7ac6f5568dcb9.jpg', 1, '691785', 'dAU8kZtYRvmYzYJ-Kwgdjb:APA91bHOXEWSkCFJ8D3bd3X0K7x-Rtg6vRABIfOO5vHtWJ5QW4g81U_VlC3n40WDmUEKEahE4pMdw0Ui7Qpvw8O_xcbvH6APcy6-OXUhDWgjNjHISX5sM6RzEQqRBfosd9XSeNfvnIpl', 2, NULL, NULL, '2021-05-20 12:18:31', '2021-05-20 13:09:26'),
(5, 0.00, 'rohan', '7011266538', 'alisha247u@gmail.com', NULL, 'images/cbfbec8275e7f7666fcb3d8f01d25ae6.jpg', 1, '803625', 'd-SEhxK4SMaQqRspQO7kqW:APA91bFazeMw7cMy4lAPD50WxgvM7EDkwCgbRlCxh3Mvto58S-aTN_XB375VMroiaf74CnJrkJCF3x-V0qb6elr7rdVm3kuozrusL9mh0nvwK97ZHOwL3hn58qDyCQmXXBchkQbtbYxg', 1, NULL, NULL, '2021-05-28 18:44:12', '2021-05-28 18:44:23');

-- --------------------------------------------------------

--
-- Table structure for table `delivery_boy_types`
--

CREATE TABLE `delivery_boy_types` (
  `id` int(11) NOT NULL,
  `title` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `delivery_boy_types`
--

INSERT INTO `delivery_boy_types` (`id`, `title`) VALUES
(1, 'Delivery Based'),
(2, 'Month Based');

-- --------------------------------------------------------

--
-- Table structure for table `driver_notifications`
--

CREATE TABLE `driver_notifications` (
  `id` int(11) NOT NULL,
  `order_id` varchar(225) NOT NULL,
  `fcm_msg_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `driver_notifications`
--

INSERT INTO `driver_notifications` (`id`, `order_id`, `fcm_msg_id`, `driver_id`, `created_at`) VALUES
(2, 'ORD54113423', 2, 2, '2021-05-07 09:30:39'),
(3, 'ORD54113423', 5, 2, '2021-05-07 09:32:00'),
(5, 'ORD47759552', 2, 2, '2021-05-13 11:35:48'),
(7, 'ORD93571319', 2, 2, '2021-05-14 05:51:27'),
(8, 'ORD62933240', 5, 4, '2021-05-22 07:40:39'),
(9, 'ORD64812029', 2, 5, '2021-05-28 13:17:40'),
(10, 'ORD49788851', 2, 4, '2021-05-28 13:25:11'),
(11, 'ORD46425248', 2, 2, '2021-05-29 06:35:44');

-- --------------------------------------------------------

--
-- Table structure for table `earning_status`
--

CREATE TABLE `earning_status` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `order_id` varchar(225) NOT NULL,
  `total_amt` double(10,2) NOT NULL,
  `earn_amt` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `earning_status`
--

INSERT INTO `earning_status` (`id`, `driver_id`, `order_id`, `total_amt`, `earn_amt`, `created_at`, `updated_at`) VALUES
(2, 2, 'ORD54113423', 10.00, 1.00, '2021-05-15 07:56:32', NULL),
(3, 2, 'ORD93571319', 53.00, 5.30, '2021-05-17 12:55:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `question` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `question_ar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_ar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `question`, `question_ar`, `answer`, `answer_ar`, `status`, `created_at`, `updated_at`) VALUES
(1, 'How do i book my pickup?', NULL, 'Kryche dryclean laundry solution is most easy and convenient to book , you simply need to login to KRYCHE application and book a flexible slot or else call us directly.', NULL, 1, '2021-05-03 12:59:32', '2021-05-20 12:34:58'),
(2, 'How will I know that my laundry has been picked-up?', NULL, 'We most certainly can sort your items on your behalf for an extra charge of $20. Also, you would be agreeing that if we added any item to either service, its not our responsibility. For example, if you wanted your sweaters to be wash and folded, but we chose the Dry Clean service as we were worried about shrinkage of the item, then its the customer responsibility, as we tried to sort the order to the best of our ability', NULL, 1, '2021-05-03 13:00:01', '2021-05-03 13:00:01'),
(3, 'My concierge doesn\'t accept laundry. What shall I do?', NULL, 'We most certainly can sort your items on your behalf for an extra charge of $20. Also, you would be agreeing that if we added any item to either service, its not our responsibility. For example, if you wanted your sweaters to be wash and folded, but we chose the Dry Clean service as we were worried about shrinkage of the item, then its the customer responsibility, as we tried to sort the order to the best of our ability\r\n                                We most certainly can sort your items on your behalf for an extra charge of $20. Also, you would be agreeing that if we added any item to either service, its not our responsibility. For example, if you wanted your sweaters to be wash and folded, but we chose the Dry Clean service as we were worried about shrinkage of the item, then its the customer responsibility, as we tried to sort the order to the best of our ability', NULL, 1, '2021-05-03 13:00:42', '2021-05-03 13:00:42'),
(4, 'Do I need to count the items in my order?', NULL, 'items on your behalf for an extra charge of $20. Also, you would be agreeing that if we added any item to either service, its not our responsibility. For example, if you wanted your sweaters to be wash and folded, but we chose the Dry Clean service as we were worried about shrinkage of the item, then its the customer responsibility, as we tried to sort the order to the best of our ability', NULL, 1, '2021-05-03 13:01:20', '2021-05-03 13:01:20'),
(5, 'What happens to my laundry bag?', NULL, 'sort your items on your behalf for an extra charge of $20. Also, you would be agreeing that if we added any item to either service, its not our responsibility. For example, if you wanted your sweaters to be wash and folded,', NULL, 1, '2021-05-03 13:01:57', '2021-05-03 13:01:57');

-- --------------------------------------------------------

--
-- Table structure for table `fare_managements`
--

CREATE TABLE `fare_managements` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `fcm_notification_messages`
--

CREATE TABLE `fcm_notification_messages` (
  `id` int(11) NOT NULL,
  `status_image` mediumtext COLLATE utf8mb4_unicode_ci,
  `customer_title` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_description` text COLLATE utf8mb4_unicode_ci,
  `delivery_title` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_description` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fcm_notification_messages`
--

INSERT INTO `fcm_notification_messages` (`id`, `status_image`, `customer_title`, `customer_description`, `delivery_title`, `delivery_description`, `created_at`, `updated_at`) VALUES
(1, 'status_images/order_confirmed.png', 'Order placed', 'Your order has been placed successfully.', NULL, NULL, '2020-05-29 12:03:47', '2020-05-29 12:03:59'),
(2, 'status_images/assigned.png', 'Order Assigned', 'Your order has been assigned to delivery boy', 'Order Assigned', 'You got new order', '2020-05-29 12:13:35', '2020-05-29 12:13:43'),
(3, 'status_images/pickup.png', 'On the way to pickup', 'Delivery boy was on the way to pickup your clothes', NULL, NULL, '2020-05-29 12:13:49', '2020-05-29 12:13:57'),
(4, 'status_images/processing.png', 'Processing', 'Your order has been processing', NULL, NULL, '2020-05-29 12:15:55', '2020-05-29 12:16:04'),
(5, 'status_images/ready_to_dispatch.png', 'Ready to Dispatch', 'Your cloths are ready to dispatch', 'Ready to Dispatch', 'Order processed, cloths are ready to collect', '2020-05-29 12:23:37', '2020-05-29 12:23:44'),
(6, 'status_images/on_way_to deliver.png', 'On the way to Deliver', 'Your cloths are on the way to deliver', NULL, NULL, '2020-05-29 12:23:49', '2020-05-29 12:23:53'),
(7, 'status_images/delivered.png', 'Order Completed', 'Your order has been completed', NULL, NULL, '2020-05-29 12:23:58', '2020-05-29 12:24:01');

-- --------------------------------------------------------

--
-- Table structure for table `labels`
--

CREATE TABLE `labels` (
  `id` int(11) NOT NULL,
  `label_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_image` mediumtext,
  `label_name_ar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label_for_delivery_boy` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `labels`
--

INSERT INTO `labels` (`id`, `label_name`, `label_image`, `label_name_ar`, `label_for_delivery_boy`, `description`, `description_ar`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Order Placed', 'status_images/order_confirmed.png', 'تم الطلب', 'Order Placed', 'Order Placed', 'تم الطلب', 1, '2019-07-23 09:33:18', '2020-06-09 01:47:46'),
(2, 'Assigned', 'status_images/assigned.png', 'تعيين', 'Assigned', 'Assigned', 'تعيين', 1, '2019-07-23 09:33:18', '2020-06-09 01:48:10'),
(3, 'On the way to pickup', 'status_images/pickup.png', 'في الطريق لاقط', 'Ready to pickup', 'On the way to pickup', 'في الطريق لاقط', 1, '2019-07-23 09:33:18', '2020-06-09 01:48:48'),
(4, 'Processing', 'status_images/processing.png', 'معالجة', 'Picked up', 'Processing', 'معالجة', 1, '2019-07-23 09:33:18', '2020-06-09 01:49:50'),
(5, 'Ready to dispatch', 'status_images/ready_to_dispatch.png', 'جاهز للإرسال', 'Ready to dispatch', 'Ready to dispatch', 'جاهز للإرسال', 1, '2019-07-23 09:33:18', '2020-06-09 01:50:35'),
(6, 'On the way to deliver', '	\r\nstatus_images/on_way_to deliver.png', 'في الطريق الى التسليم', 'Ready to deiver', 'On the way to deliver', 'في الطريق الى التسليم', 1, '2019-07-23 09:33:18', '2020-06-09 01:51:06'),
(7, 'Completed', 'status_images/delivered.png', 'منجز', 'Completed', 'Completed', 'منجز', 1, '2019-07-23 09:33:18', '2020-06-09 01:51:31');

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` int(11) NOT NULL,
  `service_id` varchar(250) NOT NULL,
  `title` varchar(250) NOT NULL,
  `price` double NOT NULL,
  `discount` double NOT NULL,
  `duration` double NOT NULL,
  `desc_1` text NOT NULL,
  `desc_2` text,
  `desc_3` text,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `service_id`, `title`, `price`, `discount`, `duration`, `desc_1`, `desc_2`, `desc_3`, `status`, `created_at`, `updated_at`) VALUES
(1, '1,2', 'Basic', 150, 10, 1, 'Basic Plans for stater user', '10% discount on wash and dry cleaning services', NULL, 1, '2021-05-10 06:22:08', '2021-05-10 11:19:46'),
(2, '2,3', 'professional', 200, 20, 2, 'professional users are nice', 'Get a 20% discount on all wash, wash & Iron services', 'Starter pack', 1, '2021-05-10 06:27:56', '2021-05-10 10:18:35'),
(3, '1,2,3', 'Pro pack', 400, 50, 2, 'These are our premium user', 'Get a big 50% discount on all services', NULL, 1, '2021-05-10 06:31:08', '2021-05-10 06:31:08');

-- --------------------------------------------------------

--
-- Table structure for table `membership_duration`
--

CREATE TABLE `membership_duration` (
  `id` int(11) NOT NULL,
  `duration_name` varchar(225) NOT NULL,
  `duration` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membership_duration`
--

INSERT INTO `membership_duration` (`id`, `duration_name`, `duration`) VALUES
(1, '1 Month', '30'),
(2, '3 Months', '90'),
(3, '1 Year', '365');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `selected_service_ids` varchar(255) NOT NULL,
  `estimated_cloths` varchar(255) DEFAULT NULL,
  `additional_item_ids` varchar(255) DEFAULT NULL,
  `promo_code_id` int(11) DEFAULT NULL,
  `expected_pickup_date` datetime NOT NULL,
  `expected_delivery_date` datetime NOT NULL,
  `pickup_time` varchar(225) NOT NULL,
  `drop_time` varchar(225) NOT NULL,
  `total` float NOT NULL DEFAULT '0',
  `delivery_changes` double(5,2) NOT NULL DEFAULT '0.00',
  `discount` float NOT NULL DEFAULT '0',
  `mem_total_discount` double(5,2) NOT NULL DEFAULT '0.00',
  `sub_total` float NOT NULL DEFAULT '0',
  `promo_id` int(11) DEFAULT NULL,
  `delivered_by` int(11) DEFAULT NULL,
  `payment_mode` int(11) NOT NULL DEFAULT '3',
  `payment_status` int(11) NOT NULL DEFAULT '1',
  `items` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `customer_id`, `address_id`, `selected_service_ids`, `estimated_cloths`, `additional_item_ids`, `promo_code_id`, `expected_pickup_date`, `expected_delivery_date`, `pickup_time`, `drop_time`, `total`, `delivery_changes`, `discount`, `mem_total_discount`, `sub_total`, `promo_id`, `delivered_by`, `payment_mode`, `payment_status`, `items`, `status`, `created_at`, `updated_at`) VALUES
(13, 'ORD31040688', 13, 22, '', NULL, NULL, NULL, '2021-05-14 00:00:00', '2021-05-15 00:00:00', '04 pm to 05 pm', '11 am to 12 pm', 35, 20.00, 0, 15.00, 30, NULL, NULL, 1, 1, '1', 1, '2021-05-14 15:31:48', '2021-05-14 15:31:48'),
(14, 'ORD62365215', 16, 24, '', NULL, NULL, NULL, '2021-05-20 00:00:00', '2021-05-21 00:00:00', '02 pm to 03 pm', '09 am to 10 am', 111.5, 20.00, 3.15, 0.00, 91.5, NULL, 4, 1, 1, '4', 7, '2021-05-20 12:47:00', '2021-05-20 13:29:56'),
(15, 'ORD62933240', 16, 24, '', NULL, NULL, NULL, '2021-05-22 00:00:00', '2021-05-23 00:00:00', '09 am to 11 am', '11 am to 1 pm', 214, 20.00, 30, 0.00, 194, NULL, 4, 2, 2, '2', 7, '2021-05-21 14:38:02', '2021-05-22 13:11:47'),
(16, 'ORD64812029', 14, 19, '', NULL, NULL, NULL, '2021-05-29 00:00:00', '2021-05-30 00:00:00', '11 am to 1 pm', '11 am to 1 pm', 79.5, 10.00, 0, 0.00, 69.5, NULL, 5, 1, 1, '3', 4, '2021-05-28 18:46:54', '2021-05-28 18:51:33'),
(17, 'ORD76328663', 16, 24, '', NULL, NULL, NULL, '2021-05-29 00:00:00', '2021-05-30 00:00:00', '11 am to 1 pm', '11 am to 1 pm', 170.5, 20.00, 30, 0.00, 150.5, NULL, NULL, 1, 1, '4', 1, '2021-05-28 18:54:30', '2021-05-28 18:54:30'),
(18, 'ORD49788851', 16, 24, '', NULL, NULL, NULL, '2021-05-29 00:00:00', '2021-05-30 00:00:00', '11 am to 1 pm', '11 am to 1 pm', 170.5, 20.00, 30, 0.00, 150.5, NULL, 4, 1, 1, '4', 3, '2021-05-28 18:54:32', '2021-05-28 19:01:36'),
(23, 'ORD28048230', 13, 25, '1,2', '20-40', 'Carpet+,Blanket+', 2, '2021-06-05 14:52:25', '2021-06-06 14:52:26', '3 pm to 5 pm', '09 am to 11 am', 0, 0.00, 0, 0.00, 0, NULL, NULL, 3, 1, NULL, 1, '2021-06-05 00:00:00', '2021-06-05 16:23:35');

-- --------------------------------------------------------

--
-- Table structure for table `order_histories`
--

CREATE TABLE `order_histories` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `delivery_boy_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_histories`
--

INSERT INTO `order_histories` (`id`, `order_id`, `delivery_boy_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 7, '2021-04-28 15:53:16', '2021-04-28 15:53:16'),
(2, 1, 1, 6, '2021-04-28 15:53:49', '2021-04-28 15:53:49'),
(3, 1, 1, 5, '2021-04-28 16:07:34', '2021-04-28 16:07:34'),
(4, 1, 1, 7, '2021-04-28 17:04:02', '2021-04-28 17:04:02'),
(5, 2, 1, 2, '2021-04-30 11:07:20', '2021-04-30 11:07:20'),
(6, 3, 1, 3, '2021-04-30 11:08:40', '2021-04-30 11:08:40'),
(7, 4, 1, 4, '2021-04-30 11:08:53', '2021-04-30 11:08:53'),
(8, 6, 1, 4, '2021-05-03 12:05:23', '2021-05-03 12:05:23'),
(9, 2, 1, 3, '2021-05-04 17:18:05', '2021-05-04 17:18:05'),
(10, 3, 1, 2, '2021-05-04 17:19:33', '2021-05-04 17:19:33'),
(11, 3, 1, 3, '2021-05-04 17:22:41', '2021-05-04 17:22:41'),
(12, 3, 1, 4, '2021-05-04 17:23:00', '2021-05-04 17:23:00'),
(13, 3, 1, 6, '2021-05-04 17:23:10', '2021-05-04 17:23:10'),
(14, 3, 1, 3, '2021-05-04 17:23:35', '2021-05-04 17:23:35'),
(15, 3, 1, 4, '2021-05-04 17:23:52', '2021-05-04 17:23:52');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `mem_dis` double(5,2) NOT NULL DEFAULT '0.00',
  `price` float NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `service_id`, `qty`, `mem_dis`, `price`, `created_at`, `updated_at`) VALUES
(2, 2, 1, 1, 3, 0.00, 30, '2021-04-28 18:49:23', '2021-04-28 18:49:23'),
(3, 2, 2, 1, 2, 0.00, 13, '2021-04-28 18:49:23', '2021-04-28 18:49:23'),
(4, 2, 3, 1, 1, 0.00, 10, '2021-04-28 18:49:23', '2021-04-28 18:49:23'),
(5, 3, 1, 1, 3, 0.00, 30, '2021-04-28 19:36:25', '2021-04-28 19:36:25'),
(6, 3, 2, 1, 2, 0.00, 13, '2021-04-28 19:36:25', '2021-04-28 19:36:25'),
(7, 3, 3, 1, 1, 0.00, 10, '2021-04-28 19:36:25', '2021-04-28 19:36:25'),
(8, 4, 1, 1, 1, 0.00, 10, '2021-04-28 20:01:51', '2021-04-28 20:01:51'),
(9, 5, 4, 2, 2, 0.00, 30, '2021-04-30 14:45:25', '2021-04-30 14:45:25'),
(10, 5, 1, 1, 2, 0.00, 20, '2021-04-30 14:45:25', '2021-04-30 14:45:25'),
(11, 6, 1, 1, 1, 0.00, 10, '2021-04-30 14:51:00', '2021-04-30 14:51:00'),
(12, 6, 2, 1, 1, 0.00, 6.5, '2021-04-30 14:51:00', '2021-04-30 14:51:00'),
(13, 6, 3, 1, 1, 0.00, 10, '2021-04-30 14:51:00', '2021-04-30 14:51:00'),
(14, 7, 1, 1, 1, 0.00, 10, '2021-05-02 01:10:08', '2021-05-02 01:10:08'),
(15, 7, 2, 1, 1, 0.00, 6.5, '2021-05-02 01:10:08', '2021-05-02 01:10:08'),
(16, 8, 1, 1, 2, 0.00, 20, '2021-05-11 11:49:19', '2021-05-11 11:49:19'),
(17, 9, 1, 1, 4, 20.00, 40, '2021-05-13 16:41:37', '2021-05-13 16:41:37'),
(18, 9, 4, 2, 1, 7.50, 15, '2021-05-13 16:41:37', '2021-05-13 16:41:37'),
(19, 10, 1, 1, 3, 15.00, 30, '2021-05-14 12:11:30', '2021-05-14 12:11:30'),
(20, 11, 1, 1, 4, 20.00, 40, '2021-05-14 12:21:04', '2021-05-14 12:21:04'),
(21, 12, 1, 1, 1, 5.00, 10, '2021-05-14 12:26:50', '2021-05-14 12:26:50'),
(22, 13, 4, 2, 2, 15.00, 30, '2021-05-14 15:31:48', '2021-05-14 15:31:48'),
(23, 14, 1, 1, 0, 0.00, 0, '2021-05-20 12:47:00', '2021-05-20 12:47:00'),
(24, 14, 2, 1, 1, 0.00, 6.5, '2021-05-20 12:47:00', '2021-05-20 12:47:00'),
(25, 14, 3, 1, 1, 0.00, 10, '2021-05-20 12:47:00', '2021-05-20 12:47:00'),
(26, 14, 4, 2, 5, 0.00, 75, '2021-05-20 12:47:00', '2021-05-20 12:47:00'),
(27, 15, 4, 2, 12, 0.00, 180, '2021-05-21 14:38:02', '2021-05-21 14:38:02'),
(28, 15, 5, 2, 2, 0.00, 14, '2021-05-21 14:38:02', '2021-05-21 14:38:02'),
(29, 16, 4, 2, 2, 0.00, 30, '2021-05-28 18:46:54', '2021-05-28 18:46:54'),
(30, 16, 1, 1, 2, 0.00, 20, '2021-05-28 18:46:54', '2021-05-28 18:46:54'),
(31, 16, 2, 1, 3, 0.00, 19.5, '2021-05-28 18:46:54', '2021-05-28 18:46:54'),
(32, 17, 5, 2, 3, 0.00, 21, '2021-05-28 18:54:30', '2021-05-28 18:54:30'),
(33, 18, 5, 2, 3, 0.00, 21, '2021-05-28 18:54:32', '2021-05-28 18:54:32'),
(34, 18, 4, 2, 6, 0.00, 90, '2021-05-28 18:54:32', '2021-05-28 18:54:32'),
(35, 17, 4, 2, 6, 0.00, 90, '2021-05-28 18:54:30', '2021-05-28 18:54:30'),
(36, 18, 2, 1, 3, 0.00, 19.5, '2021-05-28 18:54:32', '2021-05-28 18:54:32'),
(37, 17, 2, 1, 3, 0.00, 19.5, '2021-05-28 18:54:30', '2021-05-28 18:54:30'),
(38, 17, 1, 1, 2, 0.00, 20, '2021-05-28 18:54:30', '2021-05-28 18:54:30'),
(39, 18, 1, 1, 2, 0.00, 20, '2021-05-28 18:54:32', '2021-05-28 18:54:32');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `payment_mode` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_mode_ar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `payment_mode`, `payment_mode_ar`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 'السيولة النقدية', 'images/8342ffc12c9bb743950331a337714210.png', 1, '2020-05-29 18:20:29', '2021-05-13 17:41:30'),
(2, 'Online', 'بطاقة', 'images/2c9e92b6a6bbf24cf040f93bf3c4236b.png', 1, '2020-05-29 18:22:00', '2021-05-14 10:05:31'),
(3, 'Not selected', NULL, 'dsadtt', 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `payment_responses`
--

CREATE TABLE `payment_responses` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL DEFAULT '0',
  `payment_mode` int(11) NOT NULL,
  `payment_response` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_status`
--

CREATE TABLE `payment_status` (
  `id` int(11) NOT NULL,
  `title` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_status`
--

INSERT INTO `payment_status` (`id`, `title`) VALUES
(1, 'Due'),
(2, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `privacy_policies`
--

CREATE TABLE `privacy_policies` (
  `id` int(11) NOT NULL,
  `title` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `privacy_policies`
--

INSERT INTO `privacy_policies` (`id`, `title`, `title_ar`, `description`, `description_ar`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Terms of use', NULL, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', NULL, 1, '2021-05-03 12:48:33', '2021-05-03 12:48:33'),
(2, 'Privacy Policy', NULL, 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur', NULL, 1, '2021-05-03 12:49:26', '2021-05-03 12:49:26');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `product_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_name_ar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(5,2) NOT NULL DEFAULT '0.00',
  `unit` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `service_id`, `product_name`, `product_name_ar`, `image`, `price`, `unit`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Blazer', 'product1ar', 'images/ee663c735cb5f3c17794f25ae1a1944f.png', 10.00, 2, 1, '2021-04-21 23:11:53', '2021-04-21 19:14:07'),
(2, 1, 1, 'Jeans', 'product2ar', 'images/60c92bb20f959e39dcb777ee815e7af7.png', 6.50, 1, 1, '2021-04-21 23:12:26', '2021-04-21 19:14:31'),
(3, 1, 1, 'Mens Kurta', 'product3ar', 'images/b971645894f6bd5686a89b33d0603500.png', 10.00, 3, 1, '2021-04-21 23:13:01', '2021-04-21 19:15:13'),
(4, 2, 2, 'Shirt', 'product4ar', 'images/5e51b54e3c4a1e7afcd4826236c46cac.png', 15.00, 2, 1, '2021-04-21 23:13:24', '2021-04-21 19:16:10'),
(5, 2, 2, 'product5', 'product5ar', 'images/8ace039ebdd24e6d762205bd8e5a9c01.png', 7.00, 1, 1, '2021-04-21 23:15:09', '2021-04-22 01:12:42');

-- --------------------------------------------------------

--
-- Table structure for table `promo_codes`
--

CREATE TABLE `promo_codes` (
  `id` int(11) NOT NULL,
  `promo_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `promo_name_ar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promo_code` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `description_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `promo_type` int(11) NOT NULL,
  `discount` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promo_codes`
--

INSERT INTO `promo_codes` (`id`, `promo_name`, `promo_name_ar`, `promo_code`, `description`, `description_ar`, `promo_type`, `discount`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Get Rupee 10 Flat discount on order', NULL, 'NEWOFFER13', 'This offer is applicable for new user and Contrary to popular belief, Lorem Ipsum is not simply random text.', NULL, 1, 10, 1, '2021-04-30 10:00:10', '2021-04-30 12:54:14'),
(2, 'Get 10 % discount on special offer', NULL, 'PEROFFER13', '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', NULL, 2, 10, 1, '2021-04-30 10:02:20', '2021-04-30 12:54:27'),
(3, 'Diwali special', NULL, 'Deep30', 'This Dewali get 30 % off on dryclean', NULL, 1, 30, 1, '2021-05-21 14:06:14', '2021-05-21 14:06:14');

-- --------------------------------------------------------

--
-- Table structure for table `promo_types`
--

CREATE TABLE `promo_types` (
  `id` int(6) UNSIGNED NOT NULL,
  `type_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `promo_types`
--

INSERT INTO `promo_types` (`id`, `type_name`, `created_at`, `updated_at`) VALUES
(1, 'Fixed', '2019-07-24 18:30:00', '2019-07-24 18:30:00'),
(2, 'Percentage', '2019-07-24 18:30:00', '2019-07-24 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `service_name_ar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `service_time` int(11) NOT NULL,
  `description_ar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `image` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_name`, `service_name_ar`, `description`, `service_time`, `description_ar`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Wash only', 'service Ar 2', '10 hours min', 10, 'second descriptions', 'images/ab7285a443c32138b1caedd3922d6959.jpg', 1, '2021-04-21 01:06:46', '2021-05-01 14:10:12'),
(2, 'Dry Cleaning', 'service Ar', '18 hours min', 18, 'ar description', 'images/91bab58c7f0316890d6ef9db06d46ac9.jpg', 1, '2021-04-21 01:06:09', '2021-05-01 14:10:22'),
(3, 'Wash & Iron', 'service Ar 3', '24 hours min', 24, 'second descriptions ', 'images/1809e221fe62e5e8a764aa90d172592e.jpg', 1, '2021-04-21 01:06:46', '2021-05-01 14:10:32');

-- --------------------------------------------------------

--
-- Table structure for table `service_areas`
--

CREATE TABLE `service_areas` (
  `id` int(11) NOT NULL,
  `title` varchar(225) NOT NULL,
  `pincode` varchar(225) NOT NULL,
  `delivery_changes` double(5,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_areas`
--

INSERT INTO `service_areas` (`id`, `title`, `pincode`, `delivery_changes`, `created_at`, `updated_at`) VALUES
(1, 'Uttam Nagar', '110059', 20.00, '2021-05-12 11:55:49', '2021-05-12 11:55:49'),
(2, 'Janak Puri', '110060', 30.00, '2021-05-12 11:56:30', '2021-05-12 11:56:30'),
(3, 'Dawaka', '110075', 50.00, '2021-05-12 11:58:10', '2021-05-12 11:58:10'),
(4, 'uttamnagr', '110059', 10.00, '2021-05-22 07:25:09', '2021-05-22 07:25:09'),
(5, 'gurgaon', '1220011', 10.00, '2021-05-22 07:26:19', '2021-05-22 07:26:19'),
(6, 'fazilpur', '122018', 0.00, '2021-05-22 12:13:40', '2021-05-22 12:13:40');

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` int(11) NOT NULL,
  `status_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `status_name`, `created_at`, `updated_at`) VALUES
(1, 'Active', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Inactive', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` int(11) NOT NULL,
  `time_from` varchar(225) NOT NULL,
  `time_to` varchar(225) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `time_slots`
--

INSERT INTO `time_slots` (`id`, `time_from`, `time_to`, `created_at`, `updated_at`) VALUES
(1, '09 am', '11 am', '2021-04-26 12:03:26', '2021-05-21 08:58:35'),
(2, '11 am', '1 pm', '2021-04-26 12:04:01', '2021-05-21 08:59:04'),
(3, '1 pm', '3 pm', '2021-04-26 12:15:22', '2021-05-21 09:00:11'),
(4, '3 pm', '5 pm', '2021-04-26 12:15:22', '2021-05-21 09:02:45'),
(5, '5 pm', '7 pm', '2021-04-26 12:03:26', '2021-05-21 09:03:36');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(11) NOT NULL,
  `unit_code` varchar(225) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `unit_code`, `created_at`, `updated_at`) VALUES
(1, 'piece', NULL, '2021-04-22 09:25:48'),
(2, 'kg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_carts`
--

CREATE TABLE `user_carts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cart_status` varchar(225) NOT NULL,
  `selected_service_ids` varchar(255) NOT NULL,
  `estimated_cloths` varchar(255) DEFAULT NULL,
  `additional_item_ids` varchar(255) DEFAULT NULL,
  `subtotal` double(10,2) NOT NULL DEFAULT '0.00',
  `delivery_changes` double(5,2) NOT NULL DEFAULT '0.00',
  `additional_charges` double(10,2) NOT NULL DEFAULT '0.00',
  `discount` double(10,2) NOT NULL DEFAULT '0.00',
  `mem_total_discount` double(5,2) NOT NULL DEFAULT '0.00',
  `promocode_id` int(11) NOT NULL DEFAULT '0',
  `total_amt` double(10,2) NOT NULL DEFAULT '0.00',
  `pickup_date` varchar(225) DEFAULT NULL,
  `pickup_time` varchar(225) DEFAULT NULL,
  `drop_date` varchar(225) DEFAULT NULL,
  `drop_time` varchar(225) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_carts`
--

INSERT INTO `user_carts` (`id`, `user_id`, `cart_status`, `selected_service_ids`, `estimated_cloths`, `additional_item_ids`, `subtotal`, `delivery_changes`, `additional_charges`, `discount`, `mem_total_discount`, `promocode_id`, `total_amt`, `pickup_date`, `pickup_time`, `drop_date`, `drop_time`, `created_at`, `updated_at`) VALUES
(11, 13, 'ordered', '', NULL, NULL, 37.00, 50.00, 0.00, 0.00, 0.00, 0, 57.00, '21-05-13', '05 pm to 06 pm', '21-05-14', '09 am to 10 am', '2021-05-11 11:13:35', '2021-05-27 08:20:07'),
(12, 13, 'ordered', '', NULL, NULL, 37.00, 50.00, 0.00, 0.00, 0.00, 0, 57.00, '21-05-14', '02 pm to 03 pm', '21-05-15', '09 am to 10 am', '2021-05-13 12:13:03', '2021-05-27 08:20:07'),
(13, 13, 'ordered', '', NULL, NULL, 37.00, 50.00, 0.00, 0.00, 0.00, 0, 57.00, '21-05-14', '02 pm to 03 pm', '21-05-15', '11 am to 12 pm', '2021-05-14 06:47:14', '2021-05-27 08:20:07'),
(14, 13, 'ordered', '', NULL, NULL, 37.00, 50.00, 0.00, 0.00, 0.00, 0, 57.00, '21-05-14', '02 pm to 03 pm', '21-05-15', '09 am to 10 am', '2021-05-14 06:55:28', '2021-05-27 08:20:07'),
(15, 13, 'ordered', '', NULL, NULL, 37.00, 20.00, 0.00, 0.00, 0.00, 0, 57.00, '21-05-14', '04 pm to 05 pm', '21-05-15', '11 am to 12 pm', '2021-05-14 09:17:15', '2021-05-27 08:20:07'),
(16, 13, 'created', '', NULL, NULL, 37.00, 10.00, 0.00, 0.00, 0.00, 0, 47.00, NULL, NULL, NULL, NULL, '2021-05-14 10:04:43', '2021-06-04 09:39:12'),
(17, 22, 'created', '', NULL, NULL, 37.00, 0.00, 0.00, 0.00, 0.00, 0, 57.00, NULL, NULL, NULL, NULL, '2021-05-17 08:00:28', '2021-05-27 08:20:07'),
(18, 22, 'created', '', NULL, NULL, 37.00, 0.00, 0.00, 0.00, 0.00, 0, 57.00, NULL, NULL, NULL, NULL, '2021-05-17 08:00:28', '2021-05-27 08:20:07'),
(19, 16, 'ordered', '', NULL, NULL, 37.00, 20.00, 0.00, 3.15, 0.00, 2, 57.00, '21-05-20', '02 pm to 03 pm', '21-05-21', '09 am to 10 am', '2021-05-18 18:29:46', '2021-05-27 08:20:07'),
(20, 14, 'ordered', '', NULL, NULL, 69.50, 10.00, 0.00, 0.00, 0.00, 0, 79.50, '21-05-29', '11 am to 1 pm', '21-05-30', '11 am to 1 pm', '2021-05-20 06:51:28', '2021-05-28 13:16:51'),
(21, 23, 'created', '', NULL, NULL, 37.00, 0.00, 0.00, 0.00, 0.00, 0, 57.00, NULL, NULL, NULL, NULL, '2021-05-20 12:47:40', '2021-05-27 08:20:07'),
(22, 16, 'ordered', '', NULL, NULL, 37.00, 20.00, 0.00, 30.00, 0.00, 3, 57.00, '21-05-22', '09 am to 11 am', '21-05-23', '11 am to 1 pm', '2021-05-21 08:32:59', '2021-05-27 08:20:07'),
(23, 24, 'created', '', NULL, NULL, 37.00, 0.00, 0.00, 0.00, 0.00, 0, 57.00, NULL, NULL, NULL, NULL, '2021-05-23 08:09:34', '2021-05-27 08:20:07'),
(24, 16, 'ordered', '', NULL, NULL, 150.50, 20.00, 0.00, 30.00, 0.00, 3, 170.50, '21-05-29', '11 am to 1 pm', '21-05-30', '11 am to 1 pm', '2021-05-24 09:46:06', '2021-05-28 13:24:09'),
(25, 14, 'created', '', NULL, NULL, 16.50, 20.00, 0.00, 0.00, 0.00, 0, 36.50, NULL, NULL, NULL, NULL, '2021-05-28 13:29:42', '2021-05-28 13:29:42'),
(26, 16, 'created', '', NULL, NULL, 23.00, 20.00, 0.00, 0.00, 0.00, 0, 43.00, NULL, NULL, NULL, NULL, '2021-05-28 14:11:06', '2021-05-28 14:11:12');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(11) NOT NULL,
  `order_id` varchar(225) NOT NULL,
  `fcm_msg_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `order_id`, `fcm_msg_id`, `user_id`, `created_at`) VALUES
(2, 'ORD30542021', 2, 13, '2021-05-04 13:02:04'),
(3, 'ORD85519272', 7, 13, '2021-05-04 13:02:48'),
(4, 'ORD30542021', 3, 13, '2021-05-04 13:30:05'),
(5, 'ORD30542021', 2, 13, '2021-05-04 13:30:27'),
(6, 'ORD18316715', 4, 13, '2021-05-06 10:14:48'),
(8, 'ORD18316715', 4, 13, '2021-05-07 06:22:15'),
(9, 'ORD18316715', 5, 13, '2021-05-07 09:01:04'),
(10, 'ORD85519272', 5, 13, '2021-05-07 09:02:14'),
(12, 'ORD85519272', 2, 13, '2021-05-07 09:03:51'),
(13, 'ORD18316715', 2, 13, '2021-05-07 09:05:32'),
(14, 'ORD85519272', 3, 13, '2021-05-07 09:06:50'),
(15, 'ORD85519272', 4, 13, '2021-05-07 09:07:01'),
(16, 'ORD85519272', 5, 13, '2021-05-07 09:07:25'),
(17, 'ORD85519272', 7, 13, '2021-05-07 09:08:34'),
(23, 'ORD54113423', 2, 16, '2021-05-07 09:30:39'),
(24, 'ORD54113423', 5, 16, '2021-05-07 09:31:59'),
(26, 'ORD47759552', 2, 13, '2021-05-13 11:35:48'),
(27, 'ORD47759552', 3, 13, '2021-05-13 11:36:17'),
(30, 'ORD93571319', 2, 13, '2021-05-14 05:51:27'),
(31, 'ORD47759552', 4, 13, '2021-05-14 06:33:07'),
(32, 'ORD54113423', 3, 16, '2021-05-15 07:41:57'),
(35, 'ORD54113423', 6, 16, '2021-05-15 07:55:56'),
(36, 'ORD54113423', 7, 16, '2021-05-15 07:56:33'),
(37, 'ORD93571319', 3, 13, '2021-05-17 05:30:04'),
(38, 'ORD18316715', 3, 13, '2021-05-17 08:58:51'),
(39, 'ORD93571319', 4, 13, '2021-05-17 08:59:09'),
(40, 'ORD93571319', 7, 13, '2021-05-17 12:55:06'),
(41, 'ORD62365215', 3, 16, '2021-05-20 07:49:55'),
(43, 'ORD62365215', 4, 16, '2021-05-20 07:59:15'),
(44, 'ORD62365215', 6, 16, '2021-05-20 07:59:39'),
(45, 'ORD62365215', 7, 16, '2021-05-20 07:59:56'),
(46, 'ORD62933240', 5, 16, '2021-05-22 07:40:39'),
(48, 'ORD94918353', 7, 13, '2021-05-22 07:43:01'),
(49, 'ORD62933240', 7, 16, '2021-05-22 12:14:45'),
(50, 'ORD64812029', 2, 14, '2021-05-28 13:17:39'),
(51, 'ORD64812029', 3, 14, '2021-05-28 13:21:30'),
(52, 'ORD64812029', 4, 14, '2021-05-28 13:21:33'),
(53, 'ORD49788851', 2, 16, '2021-05-28 13:25:11'),
(55, 'ORD49788851', 3, 16, '2021-05-28 13:31:37'),
(56, 'ORD46425248', 2, 13, '2021-05-29 06:35:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner_images`
--
ALTER TABLE `banner_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery_boy_types`
--
ALTER TABLE `delivery_boy_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `driver_notifications`
--
ALTER TABLE `driver_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `earning_status`
--
ALTER TABLE `earning_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fare_managements`
--
ALTER TABLE `fare_managements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fcm_notification_messages`
--
ALTER TABLE `fcm_notification_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `labels`
--
ALTER TABLE `labels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `membership_duration`
--
ALTER TABLE `membership_duration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_histories`
--
ALTER TABLE `order_histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_responses`
--
ALTER TABLE `payment_responses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_status`
--
ALTER TABLE `payment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_codes`
--
ALTER TABLE `promo_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `promo_types`
--
ALTER TABLE `promo_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_areas`
--
ALTER TABLE `service_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_carts`
--
ALTER TABLE `user_carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banner_images`
--
ALTER TABLE `banner_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart_products`
--
ALTER TABLE `cart_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `delivery_boys`
--
ALTER TABLE `delivery_boys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `delivery_boy_types`
--
ALTER TABLE `delivery_boy_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `driver_notifications`
--
ALTER TABLE `driver_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `earning_status`
--
ALTER TABLE `earning_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fare_managements`
--
ALTER TABLE `fare_managements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fcm_notification_messages`
--
ALTER TABLE `fcm_notification_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `labels`
--
ALTER TABLE `labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `membership_duration`
--
ALTER TABLE `membership_duration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_histories`
--
ALTER TABLE `order_histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_responses`
--
ALTER TABLE `payment_responses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_status`
--
ALTER TABLE `payment_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `privacy_policies`
--
ALTER TABLE `privacy_policies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `promo_codes`
--
ALTER TABLE `promo_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `promo_types`
--
ALTER TABLE `promo_types`
  MODIFY `id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `service_areas`
--
ALTER TABLE `service_areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_carts`
--
ALTER TABLE `user_carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
