-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2025 at 11:23 AM
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
-- Database: `web_ban_dt`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(10) UNSIGNED DEFAULT NULL,
  `date_order` date NOT NULL,
  `total` int(10) UNSIGNED NOT NULL,
  `payment` varchar(191) NOT NULL,
  `note` varchar(191) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `status`, `created_at`, `updated_at`) VALUES
(22, 23, '2025-06-23', 2000000, 'COD', '1', 0, '2025-06-23 03:05:30', '2025-06-23 03:05:30'),
(23, 24, '2025-06-24', 6000000, 'ATM', 'ggg', 0, '2025-06-24 00:19:42', '2025-06-24 00:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) UNSIGNED DEFAULT NULL,
  `id_products` int(10) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_products`, `quantity`, `image`, `price`, `created_at`, `updated_at`) VALUES
(23, 17, 39, 2, NULL, 7000000, '2025-06-23 02:40:01', '2025-06-23 02:40:01'),
(24, 18, 46, 2, NULL, 7300000, '2025-06-23 02:46:45', '2025-06-23 02:46:45'),
(25, 19, 37, 2, NULL, 1000, '2025-06-23 02:47:44', '2025-06-23 02:47:44'),
(26, 20, 36, 2, NULL, 11800000, '2025-06-23 02:48:03', '2025-06-23 02:48:03'),
(27, 21, 40, 1, NULL, 9000000, '2025-06-23 03:03:24', '2025-06-23 03:03:24'),
(28, 22, 47, 1, NULL, 2000000, '2025-06-23 03:05:30', '2025-06-23 03:05:30'),
(29, 23, 48, 1, NULL, 6000000, '2025-06-24 00:19:42', '2025-06-24 00:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tongtien` decimal(12,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(12,2) NOT NULL DEFAULT 0.00,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_detail`
--

CREATE TABLE `cart_detail` (
  `id` int(11) NOT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `image`, `description`, `content`, `created_at`, `updated_at`) VALUES
(14, 'Iphone', '1750495132.jpg', 'Đặc điểm nổi bật của iPhone 12 Pro 128GB  iPhone 12 Pro - \"Siêu phẩm công nghệ\" với nhiều nâng cấp mạnh mẽ về thiết kế, cấu hình và hiệu năng, khẳng định đẳng cấp thời thượng trên thị trường smartphone cao cấp.', '<p>Iphone</p>', '2020-12-18 08:14:57', '2025-06-21 01:38:52'),
(15, 'Sam Sung', '1608304562.jpeg', 'Samsung lại tiếp tục cho ra mắt chiếc smartphone mới thuộc thế hệ Galaxy M với tên gọi là Samsung Galaxy M51. Thiết kế mới này tuy nằm trong phân khúc tầm trung nhưng được Samsung nâng cấp và cải tiến với camera góc siêu rộng, dung lượng pin siêu khủng cùng vẻ ngoài sang trọng và thời thượng.', '<h2><a href=\"https://www.thegioididong.com/dtdd-samsung\" target=\"_blank\">Samsung</a>&nbsp;lại tiếp tục cho ra mắt chiếc smartphone mới thuộc thế hệ&nbsp;<a href=\"https://www.thegioididong.com/dtdd-samsung-galaxy-m\" target=\"_blank\">Galaxy M</a>&nbsp;với t&ecirc;n gọi l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-m51\">Samsung&nbsp;Galaxy M51</a>. Thiết kế mới n&agrave;y tuy nằm trong ph&acirc;n kh&uacute;c tầm trung nhưng được Samsung n&acirc;ng cấp v&agrave; cải tiến với camera g&oacute;c si&ecirc;u rộng, dung lượng pin si&ecirc;u khủng c&ugrave;ng vẻ ngo&agrave;i sang trọng v&agrave; thời thượng.</h2>', '2020-12-18 08:16:02', '2020-12-18 08:16:02'),
(16, 'Oppo', '1608304597.jpeg', 'Samsung lại tiếp tục cho ra mắt chiếc smartphone mới thuộc thế hệ Galaxy M với tên gọi là Samsung Galaxy M51. Thiết kế mới này tuy nằm trong phân khúc tầm trung nhưng được Samsung nâng cấp và cải tiến với camera góc siêu rộng, dung lượng pin siêu khủng cùng vẻ ngoài sang trọng và thời thượng.', '<h2>Oppo lại tiếp tục cho ra mắt chiếc smartphone mới thuộc thế hệ&nbsp;<a href=\"https://www.thegioididong.com/dtdd-samsung-galaxy-m\" target=\"_blank\">Galaxy M</a>&nbsp;với t&ecirc;n gọi l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-m51\">Samsung&nbsp;Galaxy M51</a>. Thiết kế mới n&agrave;y tuy nằm trong ph&acirc;n kh&uacute;c tầm trung nhưng được Samsung n&acirc;ng cấp v&agrave; cải tiến với camera g&oacute;c si&ecirc;u rộng, dung lượng pin si&ecirc;u khủng c&ugrave;ng vẻ ngo&agrave;i sang trọng v&agrave; thời thượng.</h2>', '2020-12-18 08:16:37', '2020-12-18 08:16:37'),
(17, 'XiaoMi', '1608304655.jpeg', 'Samsung lại tiếp tục cho ra mắt chiếc smartphone mới thuộc thế hệ Galaxy M với tên gọi là Samsung Galaxy M51. Thiết kế mới này tuy nằm trong phân khúc tầm trung nhưng được Samsung nâng cấp và cải tiến với camera góc siêu rộng, dung lượng pin siêu khủng cùng vẻ ngoài sang trọng và thời thượng.', '<h2>XiaoMi&nbsp;lại tiếp tục cho ra mắt chiếc smartphone mới thuộc thế hệ&nbsp;<a href=\"https://www.thegioididong.com/dtdd-samsung-galaxy-m\" target=\"_blank\">Galaxy M</a>&nbsp;với t&ecirc;n gọi l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-m51\">Samsung&nbsp;Galaxy M51</a>. Thiết kế mới n&agrave;y tuy nằm trong ph&acirc;n kh&uacute;c tầm trung nhưng được Samsung n&acirc;ng cấp v&agrave; cải tiến với camera g&oacute;c si&ecirc;u rộng, dung lượng pin si&ecirc;u khủng c&ugrave;ng vẻ ngo&agrave;i sang trọng v&agrave; thời thượng.</h2>', '2020-12-18 08:17:35', '2020-12-18 08:17:35'),
(18, 'APPLE WATCH', '1608304706.jpeg', 'Samsung lại tiếp tục cho ra mắt chiếc smartphone mới thuộc thế hệ Galaxy M với tên gọi là Samsung Galaxy M51. Thiết kế mới này tuy nằm trong phân khúc tầm trung nhưng được Samsung nâng cấp và cải tiến với camera góc siêu rộng, dung lượng pin siêu khủng cùng vẻ ngoài sang trọng và thời thượng.', '<h2>Apple Watch lại tiếp tục cho ra mắt chiếc smartphone mới thuộc thế hệ&nbsp;<a href=\"https://www.thegioididong.com/dtdd-samsung-galaxy-m\" target=\"_blank\">Galaxy M</a>&nbsp;với t&ecirc;n gọi l&agrave;&nbsp;<a href=\"https://www.thegioididong.com/dtdd/samsung-galaxy-m51\">Samsung&nbsp;Galaxy M51</a>. Thiết kế mới n&agrave;y tuy nằm trong ph&acirc;n kh&uacute;c tầm trung nhưng được Samsung n&acirc;ng cấp v&agrave; cải tiến với camera g&oacute;c si&ecirc;u rộng, dung lượng pin si&ecirc;u khủng c&ugrave;ng vẻ ngo&agrave;i sang trọng v&agrave; thời thượng.</h2>', '2020-12-18 08:18:26', '2020-12-18 08:18:26'),
(19, 'SONY', '1608304757.jpeg', 'Sony', '<p>Sony</p>', '2020-12-18 08:19:17', '2020-12-18 08:19:17'),
(20, 'LAPTOP', '1608304788.png', 'LapTop', '<p>Laptop</p>', '2020-12-18 08:19:48', '2020-12-18 08:19:48');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `content` varchar(191) NOT NULL,
  `id_com` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `name`, `email`, `content`, `id_com`, `created_at`, `updated_at`) VALUES
(5, 'Sam Sung', 'admin@gmail.com', 'Mắc Quá', 36, '2020-12-23 04:13:09', '2020-12-23 04:13:09'),
(7, 'Sam Sung Note 20', 'admin@example.com', 'Gà', 36, '2020-12-23 04:13:46', '2020-12-23 04:13:46'),
(8, 'nhat22', 'nhat2@gmail.com', 'wwee', 38, '2025-06-18 22:27:49', '2025-06-18 22:27:49'),
(9, 'nhat22', 'nhat2@gmail.com', '1111', 38, '2025-06-18 22:27:57', '2025-06-18 22:27:57');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `gender` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `address` varchar(191) NOT NULL,
  `phone_number` varchar(191) NOT NULL,
  `note` varchar(191) NOT NULL,
  `status` int(2) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Nguyến Khánh', 'nam', 'admin@gmail.com', '65 Huỳnh Thúc KHáng', '0343754517', 'Ok', 0, '2020-12-11 08:00:21', '2020-12-11 08:00:21'),
(7, 'nhật', 'nam', 'nhat1@gmail.com', '622 tổ 19 kp tcv', '1234456', '123455', 0, '2025-06-18 20:05:39', '2025-06-18 20:05:39'),
(8, 'nhat1', 'male', 'nhattest@gmail.com', 'nhat1', 'fdfd', '11', 0, '2025-06-20 19:51:46', '2025-06-20 19:51:46'),
(17, 'iphone 16', 'male', 'admin@gmail.com', '12345', '0123456789', '1111', 0, '2025-06-23 02:38:35', '2025-06-23 02:38:35'),
(18, 'iphone 16', 'male', 'admin@gmail.com', '12345', '0123456789', '12', 0, '2025-06-23 02:40:01', '2025-06-23 02:40:01'),
(19, 'iphone 16', 'male', 'admin@gmail.com', '12345', '0123456789', 'ds', 0, '2025-06-23 02:46:45', '2025-06-23 02:46:45'),
(20, 'iphone 16', 'male', 'admin@gmail.com', '12345', '0123456789', '2dsd', 0, '2025-06-23 02:47:44', '2025-06-23 02:47:44'),
(21, 'iphone 16', 'female', 'admin@gmail.com', '12345', '0123456789', 'f', 0, '2025-06-23 02:48:03', '2025-06-23 02:48:03'),
(22, 'iphone 16', 'male', 'admin@gmail.com', '12345', '0123456789', '1', 0, '2025-06-23 03:03:24', '2025-06-23 03:03:24'),
(23, 'iphone 16', 'male', 'admin@gmail.com', '12345', '0123456789', '1', 0, '2025-06-23 03:05:30', '2025-06-23 03:05:30'),
(24, 'nhat', 'male', 'nhatnehaha@gmail.com', 'fdfd', '123456', 'ggg', 0, '2025-06-24 00:19:42', '2025-06-24 00:19:42');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_08_12_0003651_create_news_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2020_10_01_021229_add_level_status_to_users_table', 1),
(6, '2020_10_27_112720_create_category_table', 1),
(7, '2020_10_27_112722_create_products_table', 1),
(8, '2020_11_27_065826_comment_table', 1),
(9, '2020_11_28_124331_slider_table', 1),
(10, '2020_11_28_124450_customer_table', 1),
(11, '2020_11_28_124531_bill_table', 1),
(12, '2020_11_28_124601_bill_detail_table', 1),
(13, '2019_12_14_000001_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `metakeyword` varchar(191) DEFAULT NULL,
  `metadescription` varchar(191) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

CREATE TABLE `nguoidung` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `status` tinyint(200) DEFAULT NULL,
  `diachi` varchar(200) DEFAULT NULL,
  `dienthoai` varchar(200) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nguoidung`
--

INSERT INTO `nguoidung` (`id`, `name`, `email`, `email_verified_at`, `password`, `level`, `status`, `diachi`, `dienthoai`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Sam Sung', '1234@gmail.com', NULL, '$2y$10$j1mf.J630g6bzsOzVSu1QeYH34WKbJOax9M/hfsN34OeG3whlpyDS', 0, 1, '65 Huỳnh Thúc Kháng', '09543577', NULL, '2020-12-10 21:32:47', '2020-12-10 21:32:47'),
(2, 'aaa', '12345@gmail.com', NULL, '$2y$10$olXvyZuMMv5j3LazNIpNHuYHLrwpQaeQpdzCnlO4OviXudMKp.6G2', 0, NULL, '65 Huỳnh Thúc Kháng', '2222222222222222', NULL, '2020-12-10 21:51:28', '2020-12-10 21:51:28');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `description` varchar(1000) NOT NULL,
  `baohanh` varchar(191) NOT NULL,
  `new` varchar(191) NOT NULL,
  `trangthai` varchar(191) NOT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idcat` int(10) UNSIGNED DEFAULT NULL,
  `hang_ton_kho` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `image`, `price`, `discount`, `description`, `baohanh`, `new`, `trangthai`, `content`, `created_at`, `updated_at`, `idcat`, `hang_ton_kho`) VALUES
(35, 'Iphone Pro Max', '1750388695.jpg', 22000000, 0, '<p>Iphone H&atilde;ng H&agrave;ng đầu việt nam</p>', '24 Tháng', '1', 'Còn Hàng', '<p>Ram 6GB</p>\r\n\r\n<p>Dung Lượng 128gB</p>\r\n\r\n<p>IOS 14</p>', '2020-12-21 06:47:04', '2025-06-19 20:04:55', 14, 20),
(36, 'Iphone 7 Plus', '1750495023.jpg', 12000000, 11800000, '<p>Iphone Mạnh Mẽ</p>', '12 Tháng', '1', 'Còn Hàng', '<p>Ram 3GB</p>\r\n\r\n<p>Dung Lượng 64GB</p>', '2020-12-21 06:49:29', '2025-06-23 02:57:55', 14, 18),
(37, 'Iphone 6Plus', '1750495042.jpg', 7000000, 1000, '<p>Sam Sung Mạnh Mẽ</p>', '12 Tháng', '1', 'Còn Hàng', '<p>Ram 2GB</p>', '2020-12-21 06:52:26', '2025-06-23 02:57:57', 14, 27),
(38, 'Sam Sung J7 Pro', '1608558807.jpeg', 7500000, 0, '<p>Sam Sung H&agrave;ng đầu việt nam</p>', '12 Tháng', '0', 'Còn Hàng', '<p>Ram 3GB</p>', '2020-12-21 06:53:27', '2020-12-21 06:53:27', 15, 20),
(39, 'Sam sung J7 Prime', '1608558866.jpeg', 7200000, 7000000, '<p>Sam Sung H&agrave;ng đầu việt nam</p>', '12 Tháng', '1', 'Còn Hàng', '<p>Ram 4GB</p>', '2020-12-21 06:54:26', '2025-06-23 02:40:19', 15, 13),
(40, 'OPPO A12', '1608558936.jpeg', 10000000, 9000000, '<p>Oppo Lướt &ecirc;m mượt m&agrave;&nbsp;</p>', '12 Tháng', '1', 'Còn Hàng', '<p>Ram 8GB</p>\r\n\r\n<p>DL 64GB</p>', '2020-12-21 06:55:36', '2025-06-23 03:03:58', 16, 27),
(42, 'APPLE WATCH 005X', '1608559095.jpeg', 23000000, 22900000, '<p>Phong c&aacute;ch thời thượng</p>', '12 Tháng', '1', 'Còn Hàng', '<p>M&agrave;n H&igrave;nh 2In</p>', '2020-12-21 06:58:15', '2020-12-21 06:58:15', 18, 5),
(43, 'SONY XA', '1608559237.jpeg', 5500000, 0, '<p>SONY cổ xưa vẫn giữ được sức mạnh</p>', '12 Tháng', '0', 'Còn Hàng', '<p>Ram 2GB</p>', '2020-12-21 07:00:37', '2020-12-21 07:00:37', 19, 6),
(44, 'Dell 007X', '1608559290.png', 18000000, 0, '<p>Laptop&nbsp;</p>', '12 Tháng', '1', 'Còn Hàng', '<p>Ram 8GB</p>\r\n\r\n<p>SSD 240</p>', '2020-12-21 07:01:30', '2020-12-21 07:01:30', 20, 4),
(45, 'XiaoMi', '1608559359.png', 8200000, 0, '<p>XiaoMi Pin Tr&acirc;u</p>', '12 Tháng', '0', 'Còn Hàng', '<p>Ram 2GB</p>', '2020-12-21 07:02:39', '2020-12-21 07:02:39', 17, 5),
(46, 'Sam Sung A50', '1608649876.jpeg', 7300000, 0, '<p>Sam SUng Pin Tr&acirc;u</p>', '24 Tháng', '1', 'Còn Hàng', '<p>Ram 4GB</p>\r\n\r\n<p>&nbsp;</p>', '2020-12-22 08:11:16', '2025-06-23 02:57:57', 15, 4),
(47, 'Iphone 5S', '1608724763.jpeg', 2000000, 0, '<p>Iphone</p>', '24 Tháng', '1', 'Còn Hàng', '<p>Ram 1GB</p>', '2020-12-23 04:59:23', '2020-12-23 04:59:23', 14, 7),
(48, 'Sam SUng J7 PRIME', '1608724915.jpeg', 6000000, 0, '<p>Sam&nbsp; Sung</p>', '12 Tháng', '1', 'Còn Hàng', '<p>Ram 3GB</p>\r\n\r\n<p>Dung lượng 64GB</p>', '2020-12-23 05:01:55', '2025-06-21 01:19:23', 15, 31),
(49, 'Sony 5', '1608725170.jpeg', 4500000, 0, '<p>Sony</p>', '12 Tháng', '1', 'Còn Hàng', '<p>Ram 4GB</p>\r\n\r\n<p>Dung Lượng 32GB</p>', '2020-12-23 05:06:10', '2025-06-21 01:19:23', 19, 3),
(51, 'MapBook PRO', '1608725621.png', 35000000, 34000000, '<p>Laptop</p>', '24 Tháng', '0', 'Còn Hàng', '<p>Ram 16GB</p>\r\n\r\n<p>&nbsp;</p>', '2020-12-23 05:13:41', '2020-12-23 05:13:41', 20, 14),
(52, 'HP 009X', '1608725682.png', 23000000, 22000000, '<p>LapTop</p>', '24 Tháng', '0', 'Còn Hàng', '<p>Ram 8GB</p>\r\n\r\n<p>SSD 240GB</p>\r\n\r\n<p>Core i7</p>', '2020-12-23 05:14:42', '2020-12-23 05:14:42', 20, 23),
(53, 'iphone 15', '1750390208.jpg', 15000000, 1000, '<p>hi</p>', '24 Tháng', '1', 'còn hàng', '<p>ha</p>', '2025-06-19 20:30:08', '2025-06-19 20:30:08', 14, 0),
(54, 'iphone 16', '1750390541.jpg', 15000000, 10000, '<p>haa</p>', '24 Tháng', '1', 'còn hàng', '<p>hiii</p>', '2025-06-19 20:34:22', '2025-06-19 20:35:41', 14, 0),
(59, 'nhat', '1750661253.jpg', 15000000, 1234, '<p>1</p>', '12 Tháng', '1', 'còn hàng', '<p>12</p>', '2025-06-22 23:47:33', '2025-06-22 23:47:33', 16, 12);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `image_path` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slide`
--

CREATE TABLE `slide` (
  `id` int(10) UNSIGNED NOT NULL,
  `link` varchar(191) NOT NULL,
  `image` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`, `created_at`, `updated_at`) VALUES
(1, '', 'Banner1.png\r\n\r\n\r\n\r\n', NULL, NULL),
(11, '', 'slider_5.png', NULL, NULL),
(10, '', 'banner3.png', NULL, NULL),
(9, '', 'slider_3.jpg\r\n', NULL, NULL),
(8, '', 'slider_2.jpg\r\n', NULL, NULL),
(12, '', 'slider_6.png', NULL, NULL),
(13, '', 'slider_7.png', NULL, NULL),
(14, '', 'Banner1.png', NULL, NULL);

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
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `trangthai` varchar(255) DEFAULT 'activiti',
  `loaitaikhoan` varchar(200) DEFAULT NULL,
  `diachi` varchar(200) DEFAULT NULL,
  `dienthoai` varchar(200) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `level`, `trangthai`, `loaitaikhoan`, `diachi`, `dienthoai`, `remember_token`, `created_at`, `updated_at`) VALUES
(19, 'nhat', 'nhatnehaha@gmail.com', NULL, '$2y$10$QCKpHHCU5JGqmTR8s0.oIuAlDPYFjwPcRr2wXpbbJ9VqM6A3PlwRa', 0, 'activiti', 'user', 'fdfd', '123456', NULL, '2025-06-22 22:31:35', '2025-06-22 22:31:35'),
(20, 'iphone 16', 'admin@gmail.com', NULL, '$2y$10$/iJzL0r.2OV8AnOqrs.OkurvIC.ztd8/lT8RrsfFZAA6.Y43tbzDe', 0, 'unactive', 'user', '12345', '0123456789', NULL, '2025-06-22 22:33:00', '2025-06-22 22:33:00'),
(18, 'nguyenvannhat', 'nguyenvannhat@gmail.com', NULL, '$2y$10$FY9N/3hq24NskxNXoy3TJ.4GOKRN2h9DzXoDxN3cMcsS.1yph0QvS', 0, 'activiti', 'admin', NULL, NULL, NULL, '2025-06-22 22:31:01', '2025-06-22 22:31:01'),
(17, 'nhật', 'nhatday@gmail.com', NULL, '$2y$10$Abgv2SjksE7rRMA4w03QWe/zHzsTKQi9rLEkTt5azVDysj1Oq6Tn2', 0, 'unactive', 'admin', '622', '123456', NULL, '2025-06-22 22:14:58', '2025-06-22 22:14:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_id_com_foreign` (`id_com`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_idcat_foreign` (`idcat`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_detail`
--
ALTER TABLE `cart_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart_detail`
--
ALTER TABLE `cart_detail`
  ADD CONSTRAINT `cart_detail_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  ADD CONSTRAINT `cart_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_id_com_foreign` FOREIGN KEY (`id_com`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_idcat_foreign` FOREIGN KEY (`idcat`) REFERENCES `category` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
