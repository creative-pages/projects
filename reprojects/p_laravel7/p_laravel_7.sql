-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2020 at 07:18 AM
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
-- Database: `p_laravel_7`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `brand_image`, `created_at`, `updated_at`) VALUES
(1, 'Nokia', 'images/brand/1666935799654829.png', '2020-05-17 10:14:14', '2020-05-17 11:10:59'),
(2, 'Samsung', 'images/brand/1666935781807582.png', '2020-05-17 10:15:15', '2020-05-17 11:10:42'),
(3, 'Symphony', 'images/brand/1666935765419887.png', '2020-05-17 10:15:23', '2020-05-17 11:10:26');

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
(1, 4, 'Laptop', NULL, '2020-05-17 05:00:26', NULL),
(2, 4, 'Computer', NULL, '2020-05-17 05:03:59', '2020-05-17 05:03:59'),
(3, 4, 'Fashion', NULL, '2020-05-17 05:07:20', NULL),
(4, 1, 'Love', NULL, '2020-05-17 05:08:53', NULL),
(5, 1, 'Tester', NULL, '2020-05-17 05:11:02', NULL),
(6, 1, 'Test', NULL, '2020-05-17 05:11:06', NULL),
(7, 1, 'Again Test', NULL, '2020-05-17 05:11:09', NULL),
(8, 1, 'Keyboard', NULL, '2020-05-17 05:11:20', NULL),
(9, 1, 'Mouse', '2020-05-18 05:10:56', '2020-05-17 05:11:26', '2020-05-18 05:10:56'),
(11, 1, 'Home Love', NULL, '2020-05-17 05:11:41', '2020-05-18 05:11:24'),
(14, 1, 'Bata Shoe', NULL, '2020-05-17 05:12:02', '2020-05-17 06:00:59'),
(21, 1, 'Brash', NULL, '2020-05-18 05:11:14', NULL);

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
(4, '2020_05_17_035539_create_categories_table', 3),
(5, '2020_05_17_154013_create_brands_table', 4),
(6, '2020_05_17_171142_create_multi_imgs_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `multi_imgs`
--

CREATE TABLE `multi_imgs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi_imgs`
--

INSERT INTO `multi_imgs` (`id`, `images`, `created_at`, `updated_at`) VALUES
(1, 'images/multiimg/1666939755886549.png', '2020-05-17 12:13:52', NULL),
(2, 'images/multiimg/1666939756150528.png', '2020-05-17 12:13:52', NULL),
(3, 'images/multiimg/1666939756310026.png', '2020-05-17 12:13:52', NULL),
(4, 'images/multiimg/1666939756547225.png', '2020-05-17 12:13:53', NULL),
(5, 'images/multiimg/1666939835808467.png', '2020-05-17 12:15:08', NULL),
(6, 'images/multiimg/1666939836066774.png', '2020-05-17 12:15:08', NULL),
(7, 'images/multiimg/1666939836257191.png', '2020-05-17 12:15:09', NULL),
(8, 'images/multiimg/1666939836516178.png', '2020-05-17 12:15:09', NULL),
(9, 'images/multiimg/1666939836714986.png', '2020-05-17 12:15:09', NULL),
(10, 'images/multiimg/1666939859788977.png', '2020-05-17 12:15:31', NULL),
(11, 'images/multiimg/1666939860091129.png', '2020-05-17 12:15:31', NULL),
(12, 'images/multiimg/1666939860296388.png', '2020-05-17 12:15:31', NULL),
(13, 'images/multiimg/1667003815481445.png', '2020-05-18 05:12:05', NULL),
(14, 'images/multiimg/1667003817312261.png', '2020-05-18 05:12:06', NULL);

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
(1, 'Arif', 'arif@gmail.com', NULL, '$2y$10$x9YqrmKecYJi0nzxCYtKcey7ChkteCyteuTMxR99v54lK2QEbK89y', 'C4FsABgQ4WDC0Qo4bqcneAAxrzfuWy6G7m5ERT219HiGMFL8YVciuy4gRLRK', '2020-05-16 21:33:24', '2020-05-18 03:29:26'),
(2, 'Arif Aivey', 'arifaivey@gmail.com', NULL, '$2y$10$7U8rNLGkC9StAY/Mcv2NX.6mGP4RJnXaD.O9nUmgiPN4UKizgFKEW', NULL, '2020-05-16 21:34:14', '2020-05-18 02:43:10'),
(3, 'Arafat Hossain', 'arafat@gmail.com', NULL, '$2y$10$7nvcI1srHjZ8bIUbNJ3m9eU/eRh4qtQmdXc/YCONn.Aa1ksR2s/k.', NULL, '2020-05-16 21:34:30', '2020-05-16 21:34:30'),
(4, 'Ashraful', 'ashraful@gmail.com', '2020-05-18 03:37:50', '$2y$10$B3i3T11zawexaGyUTJccWed3If2MLcFXdQjFDLMFUIcReYBw7DqkK', NULL, '2020-05-16 21:34:55', '2020-05-18 03:37:50');

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
-- Indexes for table `multi_imgs`
--
ALTER TABLE `multi_imgs`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
-- AUTO_INCREMENT for table `multi_imgs`
--
ALTER TABLE `multi_imgs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
