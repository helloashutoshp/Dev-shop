-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2025 at 04:32 PM
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
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nike', 'nike', 1, '2025-03-04 10:17:47', '2025-03-04 10:17:47');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cat`
--

CREATE TABLE `cat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `showHome` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cat`
--

INSERT INTO `cat` (`id`, `name`, `slug`, `image`, `status`, `showHome`, `created_at`, `updated_at`) VALUES
(12, 'Food', 'food', NULL, 0, 'No', '2025-03-03 12:52:16', '2025-03-05 09:26:51'),
(14, 'sdnjdf', 'sdnjdf', '14.jpg', 0, 'No', '2025-03-03 12:55:32', '2025-03-05 09:26:24'),
(15, 'sdfdf', 'sdfdf', '15.jpg', 0, 'No', '2025-03-03 12:59:06', '2025-03-05 09:26:13'),
(18, 'Electronics', 'electronics', '18.jpg', 1, 'Yes', '2025-03-04 08:58:51', '2025-03-04 08:59:15'),
(19, 'Foods', 'foods', '19.jpg', 1, 'Yes', '2025-03-04 09:02:05', '2025-03-04 09:02:05'),
(20, 'Fashion', 'fashion', '20.jpg', 1, 'Yes', '2025-03-04 09:03:47', '2025-03-04 09:48:53'),
(21, 'Cosmetic', 'cosmetic', '21.jpg', 1, 'Yes', '2025-03-04 09:09:14', '2025-03-04 09:09:14'),
(22, 'Toy', 'toy', '22.jpg', 0, 'Yes', '2025-03-04 09:10:15', '2025-03-14 00:44:17'),
(23, 'Medicine', 'medicine', '23.jpg', 1, 'No', '2025-03-04 09:43:03', '2025-03-04 09:47:15'),
(24, 'testdsjndkdmnmn', 'testdsjndkdmnmn', '24.jpg', 0, 'No', '2025-03-04 09:50:07', '2025-03-05 09:25:40'),
(25, 'Furniture', 'furniture', '25.jpg', 1, 'Yes', '2025-03-05 09:21:16', '2025-03-05 09:21:16'),
(26, 'Household Things', 'household-things', '26.jpg', 1, 'No', '2025-03-10 09:53:15', '2025-03-14 00:43:41');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Ashutosh Pradhan', 'ashupra73@gmail.com', 'Enquiry', 'this is for testing', '2025-05-05 10:51:47', '2025-05-05 10:51:47'),
(2, 'Test', 'test@gmail.com', 'test', 'testing', '2025-05-05 10:53:19', '2025-05-05 10:53:19'),
(3, 'test', 'test@gmail.com', 'test', 'test', '2025-05-05 11:02:12', '2025-05-05 11:02:12'),
(4, 'Abinash Sahu', 'sahooabinash2003@gmail.com', 'Testing', 'This is for testing', '2025-05-05 11:10:24', '2025-05-05 11:10:24'),
(5, 'Rajeev', 'ashupra73@gmail.com', 'test', 'test', '2025-05-05 11:14:33', '2025-05-05 11:14:33'),
(6, 'Sujata Sahu', 'sahooabinash2003@gmail.com', 'Test', 'test', '2025-05-05 11:19:14', '2025-05-05 11:19:14');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'United States', 'US', NULL, NULL),
(2, 'Canada', 'CA', NULL, NULL),
(3, 'United Kingdom', 'GB', NULL, NULL),
(4, 'India', 'IN', NULL, NULL),
(5, 'Australia', 'AU', NULL, NULL),
(6, 'Germany', 'DE', NULL, NULL),
(7, 'France', 'FR', NULL, NULL),
(8, 'Italy', 'IT', NULL, NULL),
(9, 'Japan', 'JP', NULL, NULL),
(10, 'China', 'CN', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `max_uses` int(11) DEFAULT NULL,
  `max_uses_user` int(11) DEFAULT NULL,
  `type` enum('percent','fixed') NOT NULL DEFAULT 'fixed',
  `dicount_amount` double(10,2) NOT NULL,
  `minimum_amount` double(10,2) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `starts_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`id`, `code`, `name`, `description`, `max_uses`, `max_uses_user`, `type`, `dicount_amount`, `minimum_amount`, `status`, `starts_at`, `ends_at`, `created_at`, `updated_at`) VALUES
(1, 'SHJBDJ5454SDKSMD54', 'Zomato', 'SHJBDJ5454SDKSMD54', 25, 10, 'percent', 15.00, 500.00, 1, '2025-04-02 15:40:02', '2025-04-08 15:39:59', '2025-03-17 10:10:26', '2025-04-02 04:38:22'),
(2, 'SHJBDJ5454SDKSMD54as', 'Fashion', 'SHJBDJ5454SDKSMD54as', 33, 3, 'fixed', 14.00, 500.00, 0, '2025-05-15 15:55:45', '2025-03-18 15:39:59', '2025-03-17 10:25:58', '2025-03-17 10:25:58'),
(3, 'SHJBDJ5454SDKSMD54asdfgdgf', 'testdsjndkd', 'SHJBDJ5454SDKSMD54asdfgdgf', 5, 5, 'percent', 5.00, 5.00, 1, '2025-04-23 16:04:04', '2025-03-27 16:04:01', '2025-03-17 10:34:36', '2025-03-17 10:34:36'),
(4, 'SHJBDJ5454SDKSMD54sdsdsd', 'Fashion', 'SHJBDJ5454SDKSMD54sdsdsd', 4, 20, 'fixed', 5.00, 2000000.00, 1, '2025-04-09 16:06:29', '2025-04-10 16:06:27', '2025-03-17 10:36:44', '2025-04-09 11:51:47'),
(12, 'ABTRFTYHBEG74478HGTG', 'Summer Coupon', 'ABTRFTYHBEG74478HGTG', 5, 2, 'percent', 50.00, 200.00, 1, '2025-04-12 05:51:33', '2025-04-18 05:51:41', '2025-04-02 00:22:12', '2025-04-12 09:50:02');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language_tabel`
--

CREATE TABLE `language_tabel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_11_13_154753_alter_users_table', 1),
(6, '2024_11_16_143821_create_cat_table', 1),
(7, '2024_11_21_160146_create_tempimg_table', 1),
(8, '2024_12_04_170442_create_brand_table', 1),
(9, '2024_12_06_160128_create_product_table', 2),
(10, '2024_12_06_163248_create_product_img_table', 2),
(11, '2025_01_08_150519_alter_cat_table', 2),
(12, '2025_01_08_153302_alter_product_table', 2),
(13, '2025_01_27_160346_alter_product_table', 2),
(14, '2025_02_05_161136_create_language_tabel', 2),
(15, '2025_02_05_161745_create_test_table', 2),
(16, '2025_02_05_162148_create_test_image_table', 2),
(17, '2025_02_06_182512_add_lan_to_test', 2),
(18, '2025_02_12_160633_create_cart_table', 2),
(19, '2025_02_19_172253_add_phone_to_users', 2),
(20, '2025_02_26_155021_create_country_table', 2),
(21, '2025_02_26_164504_create_order_table', 2),
(22, '2025_02_27_154232_create_order_item_table', 2),
(23, '2025_02_27_161903_create_usershipping_address_table', 2),
(24, '2025_03_03_155242_create_sub_cate_table', 3),
(25, '2025_03_03_174936_create_prod_table', 4),
(26, '2025_03_03_175411_create_prod_table', 5),
(27, '2025_03_03_180657_alter_prod_table', 6),
(28, '2025_03_03_181343_create_prod_img_table', 7),
(29, '2025_03_04_145500_change_show_home_to_enum_in_sub_cate', 8),
(30, '2025_03_11_163018_update_product_foreign_key_in_order_item', 9),
(31, '2025_03_12_153602_create_shipping_charges_table', 10),
(32, '2025_03_12_161715_create_shipcharge_table', 11),
(33, '2025_03_15_134114_create_discount_table', 12),
(34, '2025_04_12_081518_add_status_columns_to_order_table', 13),
(35, '2025_04_15_154016_add_shipped_date_to_order_table', 14),
(36, '2025_04_24_155623_create__wishlist_table', 15),
(37, '2025_04_30_154407_create_pages_table', 16),
(38, '2025_05_05_161729_create_contact_us_table', 17),
(39, '2025_05_08_160438_create_ratings_table', 18);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `shipping` double(10,2) NOT NULL,
  `subtotal` double(10,2) NOT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `grandTotal` double(10,2) DEFAULT NULL,
  `delivery_status` enum('delivered','pending','cancelled','shipped') NOT NULL DEFAULT 'pending',
  `payment_status` enum('paid','unpaid') NOT NULL DEFAULT 'unpaid',
  `shipped_date` timestamp NULL DEFAULT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `appartment` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `user_id`, `shipping`, `subtotal`, `coupon_code`, `discount`, `grandTotal`, `delivery_status`, `payment_status`, `shipped_date`, `firstName`, `lastName`, `email`, `mobile`, `country_id`, `address`, `appartment`, `city`, `state`, `zip`, `note`, `created_at`, `updated_at`) VALUES
(28, 5, 10.00, 2500.00, 'ABTRFTYHBEG74478HGTG', 1250.00, 1260.00, 'pending', 'unpaid', NULL, 'Salar', 'Das', 'salar@gmail.com', '1478523696', 9, 'malisahi', 'Red light Area', 'delhi', 'delhi', 147852, 'Fuck You', '2025-04-12 09:58:15', '2025-04-12 09:58:15'),
(29, 5, 10.00, 5000.00, NULL, 0.00, 5010.00, 'delivered', 'unpaid', '2025-04-21 15:55:55', 'Salar', 'Das', 'salar@gmail.com', '1478523696', 9, 'malisahi', 'Red light Area', 'delhi', 'delhi', 147852, NULL, '2025-04-12 09:59:00', '2025-04-21 11:10:20'),
(30, 9, 10.00, 5500.00, NULL, 0.00, 5510.00, 'delivered', 'unpaid', '2025-04-23 16:44:03', 'Jessi', 'jessi', 'jessi@gmail.com', '1478523696', 9, 'Manguli', 'test', 'test', 'Peladharpur', 258963, NULL, '2025-04-21 11:13:29', '2025-04-21 11:14:09'),
(31, 8, 200.00, 12000.00, NULL, 0.00, 12200.00, 'pending', 'unpaid', NULL, 'Mic', 'das', 'mic@gmail.com', '1478523696', 5, 'riverSide', 'baliapada', 'Ahmedabad', 'Gujurat', 258963, 'Thank You', '2025-04-22 11:25:57', '2025-04-22 11:25:57'),
(32, 8, 10.00, 6000.00, NULL, 0.00, 6010.00, 'pending', 'unpaid', NULL, 'Mic', 'das', 'mic@gmail.com', '1478523696', 6, 'riverSide', 'baliapada', 'Ahmedabad', 'Gujurat', 258963, NULL, '2025-04-22 11:34:32', '2025-04-22 11:34:32'),
(33, 8, 10.00, 8500.00, NULL, 0.00, 8510.00, 'pending', 'unpaid', NULL, 'Mic', 'das', 'ashupra73@gmail.com', '1478523696', 6, 'riverSide', 'baliapada', 'Ahmedabad', 'Gujurat', 258963, NULL, '2025-04-23 10:58:40', '2025-04-23 10:58:40'),
(34, 8, 10.00, 13000.00, NULL, 0.00, 13010.00, 'pending', 'unpaid', NULL, 'Mic', 'das', 'ashutoshpradhan200210@gmail.com', '1478523696', 6, 'riverSide', 'baliapada', 'Ahmedabad', 'Gujurat', 258963, NULL, '2025-04-23 11:20:49', '2025-04-23 11:20:49'),
(35, 8, 10.00, 13000.00, NULL, 0.00, 13010.00, 'pending', 'unpaid', NULL, 'Mic', 'das', 'ashutoshpradhan200210@gmail.com', '1478523696', 6, 'riverSide', 'baliapada', 'Ahmedabad', 'Gujurat', 258963, NULL, '2025-04-23 11:21:41', '2025-04-23 11:21:41'),
(36, 8, 10.00, 13000.00, NULL, 0.00, 13010.00, 'pending', 'unpaid', NULL, 'Mic', 'das', 'ashutoshpradhan200210@gmail.com', '1478523696', 6, 'riverSide', 'baliapada', 'Ahmedabad', 'Gujurat', 258963, NULL, '2025-04-23 11:23:11', '2025-04-23 11:23:11'),
(37, 8, 10.00, 7500.00, NULL, 0.00, 7510.00, 'pending', 'unpaid', NULL, 'Mic', 'das', 'sahooabinash2003@gmail.com', '1478523696', 6, 'riverSide', 'baliapada', 'Ahmedabad', 'Gujurat', 258963, NULL, '2025-04-23 11:25:08', '2025-04-23 11:25:08'),
(38, 8, 10.00, 25500.00, NULL, 0.00, 25510.00, 'pending', 'unpaid', NULL, 'Mic', 'das', 'sahooabinash2003@gmail.com', '1478523696', 6, 'riverSide', 'baliapada', 'Ahmedabad', 'Gujurat', 258963, NULL, '2025-04-23 11:27:29', '2025-04-23 11:27:29'),
(39, 8, 10.00, 25500.00, NULL, 0.00, 25510.00, 'shipped', 'unpaid', '2025-04-25 17:10:34', 'Mic', 'das', 'sahooabinash2003@gmail.com', '1478523696', 6, 'riverSide', 'baliapada', 'Ahmedabad', 'Gujurat', 258963, NULL, '2025-04-23 11:27:53', '2025-04-23 11:40:39'),
(40, 8, 10.00, 5000.00, NULL, 0.00, 5010.00, 'pending', 'unpaid', NULL, 'Mic', 'das', 'ashutospradhan200210@gmail.com', '1478523696', 6, 'riverSide', 'baliapada', 'Ahmedabad', 'Gujurat', 258963, NULL, '2025-04-23 11:28:59', '2025-04-23 11:28:59'),
(41, 8, 10.00, 5000.00, NULL, 0.00, 5010.00, 'pending', 'unpaid', NULL, 'Mic', 'das', 'ashutoshpradhan200210@gmail.com', '1478523696', 6, 'riverSide', 'baliapada', 'Ahmedabad', 'Gujurat', 258963, NULL, '2025-04-23 11:31:05', '2025-04-23 11:31:05'),
(42, 8, 10.00, 5000.00, NULL, 0.00, 5010.00, 'pending', 'unpaid', NULL, 'Mic', 'das', 'ashupra73@gmail.com', '1478523696', 6, 'riverSide', 'baliapada', 'Ahmedabad', 'Gujurat', 258963, NULL, '2025-04-23 11:32:46', '2025-04-23 11:32:46'),
(43, 9, 800.00, 10000.00, NULL, 0.00, 10800.00, 'delivered', 'unpaid', NULL, 'Mousumi', 'Pradhan', 'mousumipradhan2310@gmail.com', '1478523696', 10, 'Manguli', 'test', 'test', 'Peladharpur', 258963, NULL, '2025-04-26 11:25:41', '2025-05-07 12:06:33'),
(44, 9, 300.60, 5000.00, NULL, 0.00, 5300.60, 'pending', 'unpaid', NULL, 'Ashutosh', 'Pradhan', 'ashupra73@gmail.com', '9090245091', 4, 'Ahmedabad', 'Rameswaram,Tenament', 'Ahmedabad', 'Gujarat', 258963, 'Thank you', '2025-04-27 08:24:39', '2025-04-27 08:24:39'),
(45, 9, 300.60, 5000.00, NULL, 0.00, 5300.60, 'pending', 'unpaid', NULL, 'Ashutosh', 'Pradhan', 'ashupra73@gmail.com', '9090245091', 4, 'Ahmedabad', 'Rameswaram', 'Ahmedabad', 'Gujarat', 258964, NULL, '2025-04-27 09:21:00', '2025-04-27 09:21:00'),
(46, 12, 10.00, 7500.00, NULL, 0.00, 7510.00, 'shipped', 'unpaid', '2025-05-22 17:23:10', 'Ashutosh', 'Pradhan', 'ashupra73@gmail.com', '1478523696', 9, 'Manguli', 'Rameswaram', 'Ahmedabad', 'Peladharpur', 258963, NULL, '2025-05-07 11:47:46', '2025-05-07 11:53:39'),
(47, 9, 10.00, 1000.00, NULL, 0.00, 1010.00, 'pending', 'unpaid', NULL, 'Siddharth', 'Senapati', 'siddharthsenapati80@gmail.com', '9937460762', 9, 'Baidhipada', 'Aludandapatana', 'Puri', 'Odisha', 752110, 'maghia', '2025-05-10 02:13:05', '2025-05-10 02:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` double(10,2) NOT NULL,
  `total` double(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`id`, `order_id`, `product_id`, `name`, `qty`, `price`, `total`, `created_at`, `updated_at`) VALUES
(39, 28, 7, 'Testing 1', 2, 500.00, 1000.00, '2025-04-12 09:58:15', '2025-04-12 09:58:15'),
(40, 28, 10, 'ShowCase', 3, 500.00, 1500.00, '2025-04-12 09:58:15', '2025-04-12 09:58:15'),
(41, 29, 9, 'Full Sofa', 1, 5000.00, 5000.00, '2025-04-12 09:59:00', '2025-04-12 09:59:00'),
(42, 30, 10, 'ShowCase', 1, 500.00, 500.00, '2025-04-21 11:13:29', '2025-04-21 11:13:29'),
(43, 30, 9, 'Full Sofa', 1, 5000.00, 5000.00, '2025-04-21 11:13:29', '2025-04-21 11:13:29'),
(44, 31, 10, 'ShowCase', 3, 500.00, 1500.00, '2025-04-22 11:25:57', '2025-04-22 11:25:57'),
(45, 31, 9, 'Full Sofa', 2, 5000.00, 10000.00, '2025-04-22 11:25:57', '2025-04-22 11:25:57'),
(46, 31, 7, 'Testing 1', 1, 500.00, 500.00, '2025-04-22 11:25:57', '2025-04-22 11:25:57'),
(47, 32, 9, 'Full Sofa', 1, 5000.00, 5000.00, '2025-04-22 11:34:32', '2025-04-22 11:34:32'),
(48, 32, 7, 'Testing 1', 2, 500.00, 1000.00, '2025-04-22 11:34:32', '2025-04-22 11:34:32'),
(49, 33, 9, 'Full Sofa', 1, 5000.00, 5000.00, '2025-04-23 10:58:40', '2025-04-23 10:58:40'),
(50, 33, 10, 'ShowCase', 7, 500.00, 3500.00, '2025-04-23 10:58:40', '2025-04-23 10:58:40'),
(51, 34, 9, 'Full Sofa', 2, 5000.00, 10000.00, '2025-04-23 11:20:49', '2025-04-23 11:20:49'),
(52, 34, 10, 'ShowCase', 6, 500.00, 3000.00, '2025-04-23 11:20:49', '2025-04-23 11:20:49'),
(53, 35, 9, 'Full Sofa', 2, 5000.00, 10000.00, '2025-04-23 11:21:41', '2025-04-23 11:21:41'),
(54, 35, 10, 'ShowCase', 6, 500.00, 3000.00, '2025-04-23 11:21:41', '2025-04-23 11:21:41'),
(55, 36, 9, 'Full Sofa', 2, 5000.00, 10000.00, '2025-04-23 11:23:11', '2025-04-23 11:23:11'),
(56, 36, 10, 'ShowCase', 6, 500.00, 3000.00, '2025-04-23 11:23:11', '2025-04-23 11:23:11'),
(57, 37, 10, 'ShowCase', 5, 500.00, 2500.00, '2025-04-23 11:25:08', '2025-04-23 11:25:08'),
(58, 37, 9, 'Full Sofa', 1, 5000.00, 5000.00, '2025-04-23 11:25:08', '2025-04-23 11:25:08'),
(59, 38, 10, 'ShowCase', 1, 500.00, 500.00, '2025-04-23 11:27:29', '2025-04-23 11:27:29'),
(60, 38, 9, 'Full Sofa', 5, 5000.00, 25000.00, '2025-04-23 11:27:29', '2025-04-23 11:27:29'),
(61, 39, 10, 'ShowCase', 1, 500.00, 500.00, '2025-04-23 11:27:53', '2025-04-23 11:27:53'),
(62, 39, 9, 'Full Sofa', 5, 5000.00, 25000.00, '2025-04-23 11:27:53', '2025-04-23 11:27:53'),
(63, 40, 9, 'Full Sofa', 1, 5000.00, 5000.00, '2025-04-23 11:28:59', '2025-04-23 11:28:59'),
(64, 41, 9, 'Full Sofa', 1, 5000.00, 5000.00, '2025-04-23 11:31:05', '2025-04-23 11:31:05'),
(65, 42, 9, 'Full Sofa', 1, 5000.00, 5000.00, '2025-04-23 11:32:46', '2025-04-23 11:32:46'),
(66, 43, 9, 'Full Sofa', 2, 5000.00, 10000.00, '2025-04-26 11:25:41', '2025-04-26 11:25:41'),
(67, 44, 9, 'Full Sofa', 1, 5000.00, 5000.00, '2025-04-27 08:24:39', '2025-04-27 08:24:39'),
(68, 45, 9, 'Full Sofa', 1, 5000.00, 5000.00, '2025-04-27 09:21:00', '2025-04-27 09:21:00'),
(69, 46, 9, 'Full Sofa', 1, 5000.00, 5000.00, '2025-05-07 11:47:46', '2025-05-07 11:47:46'),
(70, 46, 10, 'ShowCase', 4, 500.00, 2000.00, '2025-05-07 11:47:46', '2025-05-07 11:47:46'),
(71, 46, 7, 'Testing 1', 1, 500.00, 500.00, '2025-05-07 11:47:46', '2025-05-07 11:47:46'),
(72, 47, 10, 'ShowCase', 2, 500.00, 1000.00, '2025-05-10 02:13:05', '2025-05-10 02:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `content`, `created_at`, `updated_at`) VALUES
(3, 'About Us', 'about-us', '<p>This is about us page.This is a<span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.&nbsp;</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">bout us page.This is about us page.This is about us page.This is about us page.This is about us page.This is about us page.This is about us page.This is about us page.This is about us page.This is about us page.This is about us page.This is about us page.This is about us page.This is about us page.This is about us page.This is about us page. This is about us page.This is about us page.This is about us page.This is about us page.&nbsp; This is about us page.This is about us page.</span></p><p>This is about us page.<span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.&nbsp;</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.&nbsp;</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.vv</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.</span><span style=\"font-size: 1rem;\">This is about us page.</span></p>', '2025-04-30 11:19:25', '2025-05-01 11:14:49'),
(4, 'Contact Us', 'contact-us', '<p>This is contact us page.</p>', '2025-04-30 11:19:54', '2025-04-30 11:19:54');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'auth_token', 'cd6ecaf32a67e63c76a7b107cb51bbc8569f8c0cb5a39973bd92170df02cf899', '[\"*\"]', '2025-03-30 09:42:52', NULL, '2025-03-30 09:42:49', '2025-03-30 09:42:52'),
(2, 'App\\Models\\User', 4, 'auth_token', '277d48019e9b58ea81428c4a795651e6b07a85dd716b61ed416ed504d848d919', '[\"*\"]', '2025-03-30 09:44:14', NULL, '2025-03-30 09:44:02', '2025-03-30 09:44:14'),
(3, 'App\\Models\\User', 4, 'auth_token', '702b345209de256f1f247e5b952acb272ef1a83ce4efc8d4ff8cf45419ceabb3', '[\"*\"]', NULL, NULL, '2025-03-30 09:46:25', '2025-03-30 09:46:25'),
(4, 'App\\Models\\User', 4, 'auth_token', '07200441603a660720ca1bfe857d1b633359c5e3ebafa43b4282980a084ef54e', '[\"*\"]', NULL, NULL, '2025-03-30 09:46:30', '2025-03-30 09:46:30'),
(5, 'App\\Models\\User', 4, 'auth_token', '9690d719bee5eaa5f96752f9c818bc8c8f0f47696d3aa528edc936a59615d36f', '[\"*\"]', '2025-03-30 09:48:14', NULL, '2025-03-30 09:46:38', '2025-03-30 09:48:14'),
(6, 'App\\Models\\User', 4, 'auth_token', '623aecac396b588974b36a193424723d64a4a94bd722d212471bd867e6daf413', '[\"*\"]', NULL, NULL, '2025-03-30 09:48:45', '2025-03-30 09:48:45'),
(7, 'App\\Models\\User', 4, 'auth_token', '14c1976cf825f4b58224d21cfa33fa14d2bd1202b71e7fbeb755a82b64b71224', '[\"*\"]', '2025-03-30 09:59:25', NULL, '2025-03-30 09:53:23', '2025-03-30 09:59:25'),
(8, 'App\\Models\\User', 4, 'auth_token', 'fde07691f81ed2a537476c95e2eafe054b202a377c606f62311b04d2b20f8055', '[\"*\"]', '2025-03-30 10:10:33', NULL, '2025-03-30 10:05:36', '2025-03-30 10:10:33'),
(9, 'App\\Models\\User', 4, 'auth_token', '98f8bd9915c30db3f82a1c46ff689a0cfa60b2541365de8130e97803b953e8f9', '[\"*\"]', '2025-03-30 10:14:31', NULL, '2025-03-30 10:14:28', '2025-03-30 10:14:31');

-- --------------------------------------------------------

--
-- Table structure for table `prod`
--

CREATE TABLE `prod` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `shipping_return` text DEFAULT NULL,
  `related_product` text DEFAULT NULL,
  `price` double(10,2) NOT NULL,
  `compare_price` double(10,2) DEFAULT NULL,
  `cate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_cate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `isfeature` enum('Yes','No') NOT NULL DEFAULT 'No',
  `sku` varchar(255) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `trackqty` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `qty` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prod`
--

INSERT INTO `prod` (`id`, `title`, `slug`, `description`, `short_description`, `shipping_return`, `related_product`, `price`, `compare_price`, `cate_id`, `brand_id`, `sub_cate_id`, `isfeature`, `sku`, `barcode`, `trackqty`, `qty`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Testing 1', 'testing-1', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ex nulla repellat fugit, nesciunt perferendis optio nihil perspiciatis eos quis quas doloremque ut quibusdam iusto illo tempora at maiores, quidem aspernatur. Quisquam ab commodi, laudantium fugiat praesentium distinctio delectus voluptatum doloribus sequi ea animi error quasi aut nisi nostrum perspiciatis velit! Totam et voluptates optio labore dolore ad repudiandae, omnis obcaecati officia minus incidunt! Atque eum adipisci quidem voluptatum officiis reprehenderit a ipsam debitis blanditiis. Voluptatibus sunt facere nobis autem tempore iusto quae consectetur numquam maiores odio dignissimos, laudantium et libero consequatur, corrupti beatae quam laboriosam rem minima eos neque illum.</p>', 'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ex nulla repellat fugit, nesciunt perferendis optio nihil perspiciatis eos quis quas doloremque ut quibusdam iusto illo tempora at maiores, quidem aspernatur. Quisquam ab commodi, laudantium fugiat praesentium distinctio delectus voluptatum doloribus sequi ea animi error quasi aut nisi nostrum perspiciatis velit! Totam et voluptates optio labore dolore ad repudiandae, omnis obcaecati officia minus incidunt! Atque eum adipisci quidem voluptatum officiis reprehenderit a ipsam debitis blanditiis. Voluptatibus sunt facere nobis autem tempore iusto quae consectetur numquam maiores odio dignissimos, laudantium et libero consequatur, corrupti beatae quam laboriosam rem minima eos neque illum.', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ex nulla repellat fugit, nesciunt perferendis optio nihil perspiciatis eos quis quas doloremque ut quibusdam iusto illo tempora at maiores, quidem aspernatur. Quisquam ab commodi, laudantium fugiat praesentium distinctio delectus voluptatum doloribus sequi ea animi error quasi aut nisi nostrum perspiciatis velit! Totam et voluptates optio labore dolore ad repudiandae, omnis obcaecati officia minus incidunt! Atque eum adipisci quidem voluptatum officiis reprehenderit a ipsam debitis blanditiis. Voluptatibus sunt facere nobis autem tempore iusto quae consectetur numquam maiores odio dignissimos, laudantium et libero consequatur, corrupti beatae quam laboriosam rem minima eos neque illum.</p>', '9,10', 500.00, 450.00, 21, 1, 3, 'Yes', '5', '45', 'No', NULL, 1, '2025-03-04 09:55:41', '2025-03-14 00:46:31'),
(9, 'Full Sofa', 'full-sofa', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ex nulla repellat fugit, nesciunt perferendis optio nihil perspiciatis eos quis quas doloremque ut quibusdam iusto illo tempora at maiores, quidem aspernatur. Quisquam ab commodi, laudantium fugiat praesentium distinctio delectus voluptatum doloribus sequi ea animi error quasi aut nisi nostrum perspiciatis velit! Totam et voluptates optio labore dolore ad repudiandae, omnis obcaecati officia minus incidunt! Atque eum adipisci quidem voluptatum officiis reprehenderit a ipsam debitis blanditiis. Voluptatibus sunt facere nobis autem tempore iusto quae consectetur numquam maiores odio dignissimos, laudantium et libero consequatur, corrupti beatae quam laboriosam rem minima eos neque illum.</p><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ex nulla repellat fugit, nesciunt perferendis optio nihil perspiciatis eos quis quas doloremque ut quibusdam iusto illo tempora at maiores, quidem aspernatur. Quisquam ab commodi, laudantium fugiat praesentium distinctio delectus voluptatum doloribus sequi ea animi error quasi aut nisi nostrum perspiciatis velit! Totam et voluptates optio labore dolore ad repudiandae, omnis obcaecati officia minus incidunt! Atque eum adipisci quidem voluptatum officiis reprehenderit a ipsam debitis blanditiis. Voluptatibus sunt facere nobis autem tempore iusto quae consectetur numquam maiores odio dignissimos, laudantium et libero consequatur, corrupti beatae quam laboriosam rem minima eos neque illum.</p>', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ex nulla repellat fugit, nesciunt perferendis optio nihil perspiciatis eos quis quas doloremque ut quibusdam iusto illo tempora at maiores, quidem aspernatur. Quisquam ab commodi, laudantium fugiat praesentium distinctio delectus voluptatum doloribus sequi ea animi error quasi aut nisi nostrum perspiciatis velit! Totam et voluptates optio labore dolore ad repudiandae, omnis obcaecati officia minus incidunt! Atque eum adipisci quidem voluptatum officiis reprehenderit a ipsam debitis blanditiis. Voluptatibus sunt facere nobis autem tempore iusto quae consectetur numquam maiores odio dignissimos, laudantium et libero consequatur, corrupti beatae quam laboriosam rem minima eos neque illum.</p>', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ex nulla repellat fugit, nesciunt perferendis optio nihil perspiciatis eos quis quas doloremque ut quibusdam iusto illo tempora at maiores, quidem aspernatur. Quisquam ab commodi, laudantium fugiat praesentium distinctio delectus voluptatum doloribus sequi ea animi error quasi aut nisi nostrum perspiciatis velit! Totam et voluptates optio labore dolore ad repudiandae, omnis obcaecati officia minus incidunt! Atque eum adipisci quidem voluptatum officiis reprehenderit a ipsam debitis blanditiis. Voluptatibus sunt facere nobis autem tempore iusto quae consectetur numquam maiores odio dignissimos, laudantium et libero consequatur, corrupti beatae quam laboriosam rem minima eos neque illum.</p>', '', 5000.00, 60000.00, 25, 1, 8, 'Yes', '5', NULL, 'Yes', 4, 1, '2025-03-05 09:24:07', '2025-04-27 00:28:06'),
(10, 'ShowCase', 'showcase', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ex nulla repellat fugit, nesciunt perferendis optio nihil perspiciatis eos quis quas doloremque ut quibusdam iusto illo tempora at maiores, quidem aspernatur. Quisquam ab commodi, laudantium fugiat praesentium distinctio delectus voluptatum doloribus sequi ea animi error quasi aut nisi nostrum perspiciatis velit! Totam et voluptates optio labore dolore ad repudiandae, omnis obcaecati officia minus incidunt! Atque eum adipisci quidem voluptatum officiis reprehenderit a ipsam debitis blanditiis. Voluptatibus sunt facere nobis autem tempore iusto quae consectetur numquam maiores odio dignissimos, laudantium et libero consequatur, corrupti beatae quam laboriosam rem minima eos neque illum.</p><p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ex nulla repellat fugit, nesciunt perferendis optio nihil perspiciatis eos quis quas doloremque ut quibusdam iusto illo tempora at maiores, quidem aspernatur. Quisquam ab commodi, laudantium fugiat praesentium distinctio delectus voluptatum doloribus sequi ea animi error quasi aut nisi nostrum perspiciatis velit! Totam et voluptates optio labore dolore ad repudiandae, omnis obcaecati officia minus incidunt! Atque eum adipisci quidem voluptatum officiis reprehenderit a ipsam debitis blanditiis. Voluptatibus sunt facere nobis autem tempore iusto quae consectetur numquam maiores odio dignissimos, laudantium et libero consequatur, corrupti beatae quam laboriosam rem minima eos neque illum.</p>', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ex nulla repellat fugit, nesciunt perferendis optio nihil perspiciatis eos quis quas doloremque ut quibusdam iusto illo tempora at maiores, quidem aspernatur. Quisquam ab commodi, laudantium fugiat praesentium distinctio delectus voluptatum doloribus sequi ea animi error quasi aut nisi nostrum perspiciatis velit! Totam et voluptates optio labore dolore ad repudiandae, omnis obcaecati officia minus incidunt! Atque eum adipisci quidem voluptatum officiis reprehenderit a ipsam debitis blanditiis. Voluptatibus sunt facere nobis autem tempore iusto quae consectetur numquam maiores odio dignissimos, laudantium et libero consequatur, corrupti beatae quam laboriosam rem minima eos neque illum.</p>', '<p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Ex nulla repellat fugit, nesciunt perferendis optio nihil perspiciatis eos quis quas doloremque ut quibusdam iusto illo tempora at maiores, quidem aspernatur. Quisquam ab commodi, laudantium fugiat praesentium distinctio delectus voluptatum doloribus sequi ea animi error quasi aut nisi nostrum perspiciatis velit! Totam et voluptates optio labore dolore ad repudiandae, omnis obcaecati officia minus incidunt! Atque eum adipisci quidem voluptatum officiis reprehenderit a ipsam debitis blanditiis. Voluptatibus sunt facere nobis autem tempore iusto quae consectetur numquam maiores odio dignissimos, laudantium et libero consequatur, corrupti beatae quam laboriosam rem minima eos neque illum.</p>', '', 500.00, 600.00, 18, 1, 5, 'Yes', '5', NULL, 'No', NULL, 1, '2025-03-10 09:55:34', '2025-04-27 00:42:34');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `shipping_return` text DEFAULT NULL,
  `related_product` text DEFAULT NULL,
  `price` double(10,2) NOT NULL,
  `compare_price` double(10,2) DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_cate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `isfeature` enum('Yes','No') NOT NULL DEFAULT 'No',
  `sku` varchar(255) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `trackqty` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `qty` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_img`
--

CREATE TABLE `product_img` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prod_img`
--

CREATE TABLE `prod_img` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prod_img`
--

INSERT INTO `prod_img` (`id`, `product_id`, `image`, `sort_order`, `created_at`, `updated_at`) VALUES
(9, 7, '7-9-1741101941.jpg', NULL, '2025-03-04 09:55:41', '2025-03-04 09:55:41'),
(11, 7, '7-11-1741101968.jpg', NULL, '2025-03-04 09:56:08', '2025-03-04 09:56:08'),
(15, 9, '9-15-1741186447.jpg', NULL, '2025-03-05 09:24:07', '2025-03-05 09:24:07'),
(16, 9, '9-16-1741186447.jpg', NULL, '2025-03-05 09:24:07', '2025-03-05 09:24:07'),
(17, 10, '10-17-1741620334.jpg', NULL, '2025-03-10 09:55:34', '2025-03-10 09:55:34'),
(18, 10, '10-18-1741620334.jpg', NULL, '2025-03-10 09:55:34', '2025-03-10 09:55:34');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `rating` double(2,1) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `product_id`, `username`, `email`, `comment`, `rating`, `status`, `created_at`, `updated_at`) VALUES
(1, 9, 'Ashutosh Pradhan', 'ashu@gmail.com', 'Nice product', 3.0, 0, '2025-05-09 11:18:01', '2025-05-09 11:18:01'),
(3, 9, 'Prakash', 'prakash@gmail.com', 'Poor product', 2.0, 0, '2025-05-10 01:29:16', '2025-05-10 01:29:16'),
(4, 9, 'Kelvin', 'kelvin@gmail.com', 'very good product', 5.0, 0, '2025-05-10 01:36:55', '2025-05-10 01:36:55'),
(5, 9, 'Thomas', 'thomas@gmail.com', 'Average Product', 3.0, 0, '2025-05-10 01:54:49', '2025-05-10 01:54:49'),
(6, 9, 'Rober', 'robert@gmail.com', 'Nice product', 5.0, 0, '2025-05-10 01:56:03', '2025-05-10 01:56:03'),
(7, 10, 'Mottu', 'mottu@gmail.com', 'Poor product', 2.0, 0, '2025-05-10 02:08:55', '2025-05-10 02:08:55'),
(8, 10, 'ashutosh', 'ashu@gmail.com', 'Nice product', 5.0, 0, '2025-05-10 02:09:27', '2025-05-10 02:09:27');

-- --------------------------------------------------------

--
-- Table structure for table `shipcharge`
--

CREATE TABLE `shipcharge` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` varchar(255) NOT NULL,
  `charge` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipcharge`
--

INSERT INTO `shipcharge` (`id`, `country_id`, `charge`, `created_at`, `updated_at`) VALUES
(3, '5', '200', '2025-03-12 11:30:49', '2025-03-14 08:53:11'),
(5, '4', '300.60', '2025-03-13 10:18:16', '2025-03-15 00:40:28'),
(6, '2', '80', '2025-03-13 11:13:29', '2025-03-13 11:13:36'),
(8, '8', '20', '2025-03-14 00:42:51', '2025-03-14 00:42:51'),
(9, 'Others', '10', NULL, '2025-03-14 08:53:39'),
(10, '7', '500', '2025-03-14 08:47:19', '2025-03-14 08:47:26'),
(11, '10', '800', '2025-03-14 08:51:31', '2025-03-14 08:51:31');

-- --------------------------------------------------------

--
-- Table structure for table `sub_cate`
--

CREATE TABLE `sub_cate` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `showHome` enum('Yes','No') NOT NULL DEFAULT 'No',
  `cate_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_cate`
--

INSERT INTO `sub_cate` (`id`, `name`, `slug`, `status`, `showHome`, `cate_id`, `created_at`, `updated_at`) VALUES
(3, 'Lipstick', 'lipstick', 1, 'Yes', 21, '2025-03-04 09:44:17', '2025-03-04 09:47:46'),
(4, 'Powder', 'powder', 1, 'No', 21, '2025-03-04 09:44:36', '2025-04-27 00:39:36'),
(5, 'Tv', 'tv', 1, 'Yes', 18, '2025-03-04 09:45:08', '2025-04-27 00:43:07'),
(6, 'Phone', 'phone', 1, 'No', 18, '2025-03-04 09:45:21', '2025-04-27 00:35:35'),
(7, 'Clothes', 'clothes', 1, 'No', 20, '2025-03-04 09:46:00', '2025-04-27 00:34:39'),
(8, 'Sofa', 'sofa', 1, 'Yes', 25, '2025-03-05 09:22:53', '2025-03-05 09:22:53');

-- --------------------------------------------------------

--
-- Table structure for table `tempimg`
--

CREATE TABLE `tempimg` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tempimg`
--

INSERT INTO `tempimg` (`id`, `name`, `created_at`, `updated_at`) VALUES
(127, '17423125666882.jpg', '2025-03-18 10:12:46', '2025-03-18 10:12:46'),
(128, '17423125664891.jpg', '2025-03-18 10:12:46', '2025-03-18 10:12:46'),
(129, '17423125663813.jpg', '2025-03-18 10:12:46', '2025-03-18 10:12:46'),
(130, '17423125667213.jpg', '2025-03-18 10:12:46', '2025-03-18 10:12:46'),
(131, '17423126697604.jpg', '2025-03-18 10:14:29', '2025-03-18 10:14:29'),
(132, '17423126702920.jpg', '2025-03-18 10:14:30', '2025-03-18 10:14:30'),
(133, '17423126707761.jpg', '2025-03-18 10:14:30', '2025-03-18 10:14:30'),
(134, '17423126761720.jpg', '2025-03-18 10:14:36', '2025-03-18 10:14:36'),
(135, '17423126767484.jpg', '2025-03-18 10:14:36', '2025-03-18 10:14:36'),
(136, '17423126816086.jpg', '2025-03-18 10:14:41', '2025-03-18 10:14:41'),
(137, '17423126811615.jpg', '2025-03-18 10:14:41', '2025-03-18 10:14:41'),
(138, '17423126827293.jpg', '2025-03-18 10:14:42', '2025-03-18 10:14:42'),
(139, '17423126972303.jpg', '2025-03-18 10:14:57', '2025-03-18 10:14:57'),
(140, '17423126974957.jpg', '2025-03-18 10:14:57', '2025-03-18 10:14:57'),
(141, '17423127375567.jpg', '2025-03-18 10:15:37', '2025-03-18 10:15:37'),
(142, '17423127382594.jpg', '2025-03-18 10:15:38', '2025-03-18 10:15:38'),
(143, '17423127384068.jpg', '2025-03-18 10:15:38', '2025-03-18 10:15:38'),
(144, '17423127651863.jpg', '2025-03-18 10:16:05', '2025-03-18 10:16:05'),
(145, '17423127651179.jpg', '2025-03-18 10:16:05', '2025-03-18 10:16:05'),
(146, '17423127665690.jpg', '2025-03-18 10:16:06', '2025-03-18 10:16:06'),
(147, '17423127661276.jpg', '2025-03-18 10:16:06', '2025-03-18 10:16:06'),
(148, '17423127662193.jpg', '2025-03-18 10:16:06', '2025-03-18 10:16:06'),
(149, '17423128001105.jpg', '2025-03-18 10:16:40', '2025-03-18 10:16:40'),
(150, '17423128009125.jpg', '2025-03-18 10:16:40', '2025-03-18 10:16:40'),
(151, '17423128004067.jpg', '2025-03-18 10:16:40', '2025-03-18 10:16:40'),
(152, '17423131449561.jpg', '2025-03-18 10:22:24', '2025-03-18 10:22:24'),
(153, '17423131445581.jpg', '2025-03-18 10:22:24', '2025-03-18 10:22:24'),
(154, '17423131588092.jpg', '2025-03-18 10:22:38', '2025-03-18 10:22:38'),
(155, '17423131587743.jpg', '2025-03-18 10:22:38', '2025-03-18 10:22:38'),
(156, '17423131593266.jpg', '2025-03-18 10:22:39', '2025-03-18 10:22:39'),
(157, '17423132717526.jpg', '2025-03-18 10:24:31', '2025-03-18 10:24:31'),
(158, '17423132713646.jpg', '2025-03-18 10:24:31', '2025-03-18 10:24:31'),
(159, '17423136124338.jpg', '2025-03-18 10:30:12', '2025-03-18 10:30:12'),
(160, '17423136122561.jpg', '2025-03-18 10:30:12', '2025-03-18 10:30:12'),
(161, '17423137907143.jpg', '2025-03-18 10:33:10', '2025-03-18 10:33:10'),
(162, '17423138171161.jpg', '2025-03-18 10:33:37', '2025-03-18 10:33:37'),
(163, '17423138519302.jpg', '2025-03-18 10:34:11', '2025-03-18 10:34:11'),
(164, '17423139551465.jpg', '2025-03-18 10:35:55', '2025-03-18 10:35:55'),
(165, '17423140123580.jpg', '2025-03-18 10:36:52', '2025-03-18 10:36:52'),
(166, '17423141274363.jpg', '2025-03-18 10:38:47', '2025-03-18 10:38:47'),
(167, '17423141484427.jpg', '2025-03-18 10:39:08', '2025-03-18 10:39:08'),
(168, '17423142036944.jpg', '2025-03-18 10:40:03', '2025-03-18 10:40:03'),
(169, '17423142572981.jpg', '2025-03-18 10:40:57', '2025-03-18 10:40:57'),
(170, '17423142851414.jpg', '2025-03-18 10:41:25', '2025-03-18 10:41:25'),
(171, '17423143449064.jpg', '2025-03-18 10:42:24', '2025-03-18 10:42:24'),
(172, '17423143624718.jpg', '2025-03-18 10:42:42', '2025-03-18 10:42:42'),
(173, '17423145048108.jpg', '2025-03-18 10:45:04', '2025-03-18 10:45:04'),
(174, '17423145565800.jpg', '2025-03-18 10:45:56', '2025-03-18 10:45:56'),
(175, '17423145605364.jpg', '2025-03-18 10:46:00', '2025-03-18 10:46:00'),
(176, '17423145602588.jpg', '2025-03-18 10:46:00', '2025-03-18 10:46:00'),
(177, '17423145606397.jpg', '2025-03-18 10:46:00', '2025-03-18 10:46:00'),
(178, '17423145602451.jpg', '2025-03-18 10:46:00', '2025-03-18 10:46:00'),
(179, '17423146261035.jpg', '2025-03-18 10:47:06', '2025-03-18 10:47:06'),
(180, '17423146267426.jpg', '2025-03-18 10:47:06', '2025-03-18 10:47:06'),
(181, '17423146263469.jpg', '2025-03-18 10:47:06', '2025-03-18 10:47:06'),
(182, '17423146266163.jpg', '2025-03-18 10:47:06', '2025-03-18 10:47:06'),
(183, '17423146262313.jpg', '2025-03-18 10:47:06', '2025-03-18 10:47:06'),
(184, '17423147712123.jpg', '2025-03-18 10:49:31', '2025-03-18 10:49:31'),
(185, '17423147881259.jpg', '2025-03-18 10:49:48', '2025-03-18 10:49:48'),
(186, '17423147888190.jpg', '2025-03-18 10:49:48', '2025-03-18 10:49:48'),
(187, '17423147884846.jpg', '2025-03-18 10:49:48', '2025-03-18 10:49:48'),
(188, '17423147883824.jpg', '2025-03-18 10:49:48', '2025-03-18 10:49:48'),
(189, '17423147886282.jpg', '2025-03-18 10:49:48', '2025-03-18 10:49:48'),
(190, '17423152641902.jpg', '2025-03-18 10:57:44', '2025-03-18 10:57:44'),
(191, '17423152642050.jpg', '2025-03-18 10:57:44', '2025-03-18 10:57:44'),
(192, '17423152644979.jpg', '2025-03-18 10:57:44', '2025-03-18 10:57:44'),
(193, '17423152642727.jpg', '2025-03-18 10:57:44', '2025-03-18 10:57:44'),
(194, '17423152647607.jpg', '2025-03-18 10:57:44', '2025-03-18 10:57:44'),
(195, '17423534363695.jpg', '2025-03-18 21:33:56', '2025-03-18 21:33:56'),
(196, '17423535506569.jpg', '2025-03-18 21:35:50', '2025-03-18 21:35:50'),
(197, '17423535501286.jpg', '2025-03-18 21:35:50', '2025-03-18 21:35:50');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `phone` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `language` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_image`
--

CREATE TABLE `test_image` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `test_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT 1,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Ashutosh Pradhan', 'ashutosh@gmail.com', '1478523696', 1, NULL, '$2y$10$Eqe5NgfPBhtqs2zmYT0GDO6BJnOvzX9PIam3caP7deUK/t6ksMwju', NULL, '2025-03-15 00:20:14', '2025-03-15 00:20:14'),
(4, 'ashutosh', 'ashu200210@gmail.com', NULL, 1, NULL, '$2y$12$zwNtpnu//B4zVrW4PzA96OeeiL3UtMk/CV0UBMbA8okA4.I1KB1FK', NULL, '2025-03-30 09:26:31', '2025-03-30 09:26:31'),
(5, 'Salar', 'salar@gmail.com', '1478523696', 1, NULL, '$2y$10$5ewWRWvTe52Rd.IaC0OoruUoZYnV26wMVX6.xPCxgZTZpyrx9Il9S', NULL, '2025-04-12 09:56:39', '2025-04-12 09:56:39'),
(8, 'Mic', 'mic@gmail.com', NULL, 0, NULL, '$2y$10$OFkm5kU8caZjxQZVKXDR4udoeekMGgBmNKQVOizgclRt66HmqGS22', NULL, '2025-04-21 11:09:27', '2025-05-03 11:23:35'),
(9, 'Jesi', 'jessi@gmail.com', '9938052582', 1, NULL, '$2y$10$uP/YiyeyNHAmFFMYyCjHROd4hFyq3g2SIpHGMZu/kQil2HKpai9Oe', NULL, '2025-04-21 11:12:41', '2025-05-03 03:04:55'),
(10, 'Kelvin', 'kelvin@gmail.com', '1478523696', 1, NULL, '$2y$10$GCXrnyRDEGDiLodxgPqoWu3W.RXY4t6OxTj7d4Z3eMwmwYZnud7He', NULL, '2025-05-03 03:52:39', '2025-05-03 03:54:22'),
(12, 'Mic das', 'ashupra73@gmail.com', '1478523696', 1, NULL, '$2y$10$fzYofPLGz3yLl2XxJKRXEOhpTIVHrz.VAxBNbt/YJyscu1seA8ucC', NULL, '2025-05-06 12:09:01', '2025-05-07 11:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `usershipping_address`
--

CREATE TABLE `usershipping_address` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `appartment` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `usershipping_address`
--

INSERT INTO `usershipping_address` (`id`, `user_id`, `firstName`, `lastName`, `email`, `mobile`, `country_id`, `address`, `appartment`, `city`, `state`, `zip`, `created_at`, `updated_at`) VALUES
(3, 5, 'Salar', 'Das', 'salar@gmail.com', '1478523696', 9, 'malisahi', 'Red light Area', 'delhi', 'delhi', 147852, '2025-04-12 09:58:15', '2025-04-12 09:58:15'),
(4, 9, 'Siddharth', 'Senapati', 'siddharthsenapati80@gmail.com', '9937460762', 9, 'Baidhipada', 'Aludandapatana', 'Puri', 'Odisha', 752110, '2025-04-21 11:13:29', '2025-05-10 02:13:05'),
(5, 8, 'Mic', 'das', 'ashupra73@gmail.com', '1478523696', 6, 'riverSide', 'baliapada', 'Ahmedabad', 'Gujurat', 258963, '2025-04-22 11:25:57', '2025-04-23 11:32:46'),
(6, 12, 'Ashutosh', 'Pradhan', 'ashupra73@gmail.com', '1478523696', 9, 'Manguli', 'Rameswaram', 'Ahmedabad', 'Peladharpur', 258963, '2025-05-07 11:47:46', '2025-05-07 11:47:46');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(9, 9, 9, '2025-05-03 03:03:33', '2025-05-03 03:03:33'),
(10, 9, 7, '2025-05-03 03:03:38', '2025-05-03 03:03:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cat`
--
ALTER TABLE `cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `language_tabel`
--
ALTER TABLE `language_tabel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_user_id_foreign` (`user_id`),
  ADD KEY `order_country_id_foreign` (`country_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_item_order_id_foreign` (`order_id`),
  ADD KEY `order_item_product_id_foreign` (`product_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prod`
--
ALTER TABLE `prod`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prod_cate_id_foreign` (`cate_id`),
  ADD KEY `prod_brand_id_foreign` (`brand_id`),
  ADD KEY `prod_sub_cate_id_foreign` (`sub_cate_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_cate_id_foreign` (`category_id`),
  ADD KEY `product_brand_id_foreign` (`brand_id`);

--
-- Indexes for table `product_img`
--
ALTER TABLE `product_img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_img_product_id_foreign` (`product_id`);

--
-- Indexes for table `prod_img`
--
ALTER TABLE `prod_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ratings_product_id_foreign` (`product_id`);

--
-- Indexes for table `shipcharge`
--
ALTER TABLE `shipcharge`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_cate`
--
ALTER TABLE `sub_cate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tempimg`
--
ALTER TABLE `tempimg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_language_foreign` (`language`);

--
-- Indexes for table `test_image`
--
ALTER TABLE `test_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_image_test_id_foreign` (`test_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `usershipping_address`
--
ALTER TABLE `usershipping_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usershipping_address_user_id_foreign` (`user_id`),
  ADD KEY `usershipping_address_country_id_foreign` (`country_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_user_id_foreign` (`user_id`),
  ADD KEY `wishlist_product_id_foreign` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cat`
--
ALTER TABLE `cat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language_tabel`
--
ALTER TABLE `language_tabel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `prod`
--
ALTER TABLE `prod`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_img`
--
ALTER TABLE `product_img`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `prod_img`
--
ALTER TABLE `prod_img`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `shipcharge`
--
ALTER TABLE `shipcharge`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sub_cate`
--
ALTER TABLE `sub_cate`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tempimg`
--
ALTER TABLE `tempimg`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_image`
--
ALTER TABLE `test_image`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `usershipping_address`
--
ALTER TABLE `usershipping_address`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `order_item_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_item_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `prod` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prod`
--
ALTER TABLE `prod`
  ADD CONSTRAINT `prod_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `prod_cate_id_foreign` FOREIGN KEY (`cate_id`) REFERENCES `cat` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `prod_sub_cate_id_foreign` FOREIGN KEY (`sub_cate_id`) REFERENCES `sub_cate` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `product_img`
--
ALTER TABLE `product_img`
  ADD CONSTRAINT `product_img_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `prod` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_language_foreign` FOREIGN KEY (`language`) REFERENCES `language_tabel` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test_image`
--
ALTER TABLE `test_image`
  ADD CONSTRAINT `test_image_test_id_foreign` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `usershipping_address`
--
ALTER TABLE `usershipping_address`
  ADD CONSTRAINT `usershipping_address_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usershipping_address_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `prod` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
