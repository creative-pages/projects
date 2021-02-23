-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2020 at 07:17 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_7`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `user_id`, `brand_name`, `brand_image`, `created_at`, `updated_at`) VALUES
(3, 1, 'Walton Loves', 'images/brand/1666805031317644.png', '2020-05-15 22:39:35', '2020-05-16 00:32:29'),
(4, 1, 'Symphony', 'images/brand/1666805013223044.png', '2020-05-15 22:42:51', '2020-05-16 00:32:12'),
(6, 1, 'Walton', 'images/brand/1666804752124924.png', '2020-05-15 23:53:47', '2020-05-16 00:28:03'),
(7, 1, 'Samsung', 'images/brand/1666859616099817.png', '2020-05-16 15:00:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `category_name`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'Mobile', NULL, '2020-05-14 10:02:01', NULL),
(7, 2, 'Laptop', NULL, '2020-05-14 11:42:15', NULL),
(8, 2, 'Fassion', NULL, '2020-05-14 11:45:09', NULL),
(9, 2, 'Again Test', NULL, '2020-05-15 01:32:49', NULL),
(10, 2, 'Arafat', NULL, NULL, NULL),
(12, 2, 'Cock', NULL, '2020-05-15 02:53:49', NULL),
(13, 2, 'Again Test', NULL, '2020-05-15 03:04:48', '2020-05-15 09:19:44'),
(14, 2, 'Tester', NULL, '2020-05-15 03:04:52', NULL),
(15, 2, 'Keyboard', NULL, '2020-05-15 03:04:59', NULL),
(16, 2, 'Bag', NULL, '2020-05-15 03:05:06', NULL),
(17, 2, 'Pen', NULL, '2020-05-15 03:05:10', '2020-05-17 01:55:04'),
(18, 2, 'Pencils', NULL, '2020-05-15 03:05:18', '2020-05-15 09:23:41'),
(19, 1, 'Love You', NULL, '2020-05-15 03:05:21', '2020-05-15 04:57:26'),
(20, 1, 'Our House', NULL, '2020-05-15 03:05:24', '2020-05-15 09:34:03');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 2),
(4, '2020_05_14_093520_create_categories_table', 3),
(5, '2020_05_15_154939_create_brands_table', 4),
(6, '2020_05_16_063426_create_multiple_images_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `multiple_images`
--

CREATE TABLE `multiple_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multiple_images`
--

INSERT INTO `multiple_images` (`id`, `images`, `created_at`, `updated_at`) VALUES
(1, 'images/multi_img/1666808362016499.png', '2020-05-16 01:25:25', NULL),
(2, 'images/multi_img/1666808362342006.png', '2020-05-16 01:25:25', NULL),
(3, 'images/multi_img/1666808362622080.png', '2020-05-16 01:25:26', NULL),
(4, 'images/multi_img/1666808363013829.png', '2020-05-16 01:25:26', NULL),
(5, 'images/multi_img/1666808363672256.png', '2020-05-16 01:25:27', NULL),
(6, 'images/multi_img/1666808393911387.png', '2020-05-16 01:25:56', NULL),
(7, 'images/multi_img/1666808394517847.png', '2020-05-16 01:25:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Arif Hossain', 'arif@gmail.com', '2020-05-16 16:26:01', '$2y$10$7RNxk.RgcxYCeVe7trBG2OwoMA53uuKH4WdTV0eqAdDw.Pvy1fEOq', 'IciujBgL41dI4NOWr02wdM5JV4Q0vi0vZ7wvF6yABxQvxcm5jIMl8YbsgL0c', '2020-05-16 04:19:55', '2020-05-16 16:26:01'),
(2, 'Arafat Hossain', 'arafat@gmail.com', '2020-05-16 04:53:25', '$2y$10$WGgUxfbwwIvfpI4wrVZ2Luv9yVUtui5dfNF18/C/QNAOS85vvdvNO', NULL, '2020-05-16 04:20:16', '2020-05-16 04:53:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `multiple_images`
--
ALTER TABLE `multiple_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `multiple_images`
--
ALTER TABLE `multiple_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
