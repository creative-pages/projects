-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2020 at 12:18 PM
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
-- Database: `flipmart`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `brand_slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mrs. Elvera Legros', 'Jaydon Schamberger', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(2, 'Bennett Murazik', 'Dr. Aron Weimann V', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(3, 'Alexa Kuhn', 'Alexanne Reilly', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(4, 'Miss Zella Mraz II', 'Miss Angeline Will Jr.', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(5, 'Eileen Kub', 'Brayan Beatty', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(6, 'Obie Shanahan', 'Prof. Stanley Upton I', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(7, 'Katrine Hartmann', 'Mr. Edgardo Konopelski IV', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(8, 'Nichole Kshlerin', 'Dr. Lamont Wiegand Jr.', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(9, 'River Ebert', 'Dr. Maria Keeling II', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(10, 'Dr. Garth Cummings DDS', 'Samanta Roob', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Berniece Treutel', 'Rex Reinger', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(2, 'Emmanuel Herzog', 'Jamir Pagac', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(3, 'Dr. Telly Wolff', 'Sydney Conn', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(4, 'Rene Friesen', 'Kane Jacobi', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(5, 'Miss Sunny Quigley', 'Ms. Jazmin Strosin', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(6, 'Vanessa Mills', 'Quinn Sauer', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(7, 'Fletcher Veum II', 'Tiara Ward', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(8, 'Geoffrey Bogisich', 'Jean Huel', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(9, 'Lexus Pouros', 'Kevon Terry', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL),
(10, 'Diego Morissette DDS', 'Delilah Collins DVM', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41', NULL);

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
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_05_19_061233_create_brands_table', 1),
(5, '2020_05_21_080725_create_categories_table', 1),
(6, '2020_05_21_114655_create_sub_categories_table', 1);

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
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cat_id` int(11) NOT NULL,
  `subcat_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `cat_id`, `subcat_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Miss Fabiola O\'Reilly', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41'),
(2, 5, 'Ms. Antoinette Skiles I', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41'),
(3, 7, 'Barry Dare', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41'),
(4, 3, 'Lori Baumbach I', 1, '2020-05-22 00:33:41', '2020-05-22 00:33:41'),
(5, 9, 'Martin Torphy DVM', 1, '2020-05-22 00:33:42', '2020-05-22 00:33:42'),
(6, 4, 'Mr. Henderson Goyette II', 1, '2020-05-22 00:33:42', '2020-05-22 00:33:42'),
(7, 8, 'Dolores Cremin', 1, '2020-05-22 00:33:42', '2020-05-22 00:33:42'),
(8, 2, 'Roslyn Sipes', 1, '2020-05-22 00:33:42', '2020-05-22 00:33:42'),
(9, 5, 'Alejandrin Leffler III', 1, '2020-05-22 00:33:42', '2020-05-22 00:33:42'),
(10, 8, 'Prof. Naomie Bergstrom', 1, '2020-05-22 00:33:42', '2020-05-22 00:33:42');

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
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$5IMekGGe/s9bpoi2HgjKZOKxUsxv1gduAPEG3xBbbyoAwYSW9Yjsy', NULL, '2020-05-22 00:33:38', '2020-05-22 00:33:38'),
(2, 'Grayce Padberg PhD', 'ckeeling@crooks.com', NULL, '$2y$10$RQHLhAwzmE8HaaEDpWvrAOG8d2W4hq3p.2AWP/gi4CHI69jfatLP2', NULL, '2020-05-22 00:33:39', '2020-05-22 00:33:39'),
(3, 'Gabriel Kunde', 'lee04@hotmail.com', NULL, '$2y$10$HiEX72YQXth.ELR3SZEqh.jr4RxAtHCLDJzN0r0BExFgp6d8EYwXG', NULL, '2020-05-22 00:33:39', '2020-05-22 00:33:39'),
(4, 'Prof. Orin Hamill Jr.', 'martine88@hotmail.com', NULL, '$2y$10$8OLlkbtbU.Bs5MhK.H9N1O/fS5ac/F6nYV23SFoxjGPewmsIKvsP.', NULL, '2020-05-22 00:33:39', '2020-05-22 00:33:39'),
(5, 'Dr. Sebastian Walker', 'parker.billie@yahoo.com', NULL, '$2y$10$LNIpnGmN7H0GjIa9026DXuDD2z9G4fzEFE38CXpDT6EuZf1VKEqRq', NULL, '2020-05-22 00:33:39', '2020-05-22 00:33:39'),
(6, 'Brennan Dickens', 'lisette23@pollich.com', NULL, '$2y$10$jb75hOmf7ItzAWzBErvExuN7V2o4BSLvGRNZtX1J7lbj.nimS7o6G', NULL, '2020-05-22 00:33:39', '2020-05-22 00:33:39'),
(7, 'Dr. Twila Marks Jr.', 'qmoore@gmail.com', NULL, '$2y$10$.JwJvKCV4STcFHX.beitau89lJfwEFMCbzp4zS2f1sLxkk7PMlinG', NULL, '2020-05-22 00:33:40', '2020-05-22 00:33:40'),
(8, 'Adelle Boyle MD', 'progahn@barrows.com', NULL, '$2y$10$d0kIKSYnMYFXcTqQV7HTm.SKoyrpH5YGQT.WfbWURbwP56d9FsrGq', NULL, '2020-05-22 00:33:40', '2020-05-22 00:33:40'),
(9, 'Dr. Green Batz MD', 'rowena.gaylord@yahoo.com', NULL, '$2y$10$bkkbU5zOhwYO5qVdN3ic6.LZ3e2eelquAuroBFRZeEddg8PbOrRwy', NULL, '2020-05-22 00:33:40', '2020-05-22 00:33:40'),
(10, 'Roosevelt Kuhic', 'maximus18@yahoo.com', NULL, '$2y$10$cbfbvu3lJ9lkImi6UNvj4OTFoJud6JagrwZ/X/ZK1Rz8qE4BbNqKG', NULL, '2020-05-22 00:33:40', '2020-05-22 00:33:40'),
(11, 'Asha Graham II', 'feil.chauncey@yahoo.com', NULL, '$2y$10$I.y2kRDiwlwvxfrC37gdve0qrH1jHc6YpO5jCcGaYC/i/9DbFsLnS', NULL, '2020-05-22 00:33:40', '2020-05-22 00:33:40');

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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
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
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
