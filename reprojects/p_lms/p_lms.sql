-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2020 at 07:27 AM
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
-- Database: `p_lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(5) NOT NULL,
  `book_name` varchar(70) NOT NULL,
  `book_image` varchar(100) NOT NULL,
  `book_author_name` varchar(50) NOT NULL,
  `book_publications_name` varchar(50) NOT NULL,
  `book_purchase_date` varchar(50) NOT NULL,
  `book_price` varchar(10) NOT NULL,
  `book_qty` int(5) NOT NULL,
  `available_qty` int(5) NOT NULL,
  `librarian_username` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `book_name`, `book_image`, `book_author_name`, `book_publications_name`, `book_purchase_date`, `book_price`, `book_qty`, `available_qty`, `librarian_username`, `date_time`) VALUES
(8, 'Choto Vai', '200413051332.png', 'Ashrafull', 'Family Publications', '2020-04-06', '346', 12, 11, 'adminarif', '2020-04-13 03:13:32'),
(9, 'Pran Pakhi', '200413051418.png', 'Arif Hossain', 'Love Publications', '2020-04-30', '345', 13, 11, 'adminarif', '2020-04-13 03:14:18'),
(10, 'Selfish', '200413051418.png', 'Arif Hossain', 'Selfish love', '2020-04-30', '345', 15, 15, 'adminarif', '2020-04-13 03:14:18'),
(11, 'Quarrel', '200413051442.png', 'Aivey Hossain', 'Family Publications', '2020-04-09', '3545', 20, 20, 'adminarif', '2020-04-13 03:14:42'),
(12, 'Taka Dollar', '200413052332.png', 'Ashrafull', 'Money Publications', '2020-04-08', '353', 11, 10, 'adminarif', '2020-04-13 03:23:32');

-- --------------------------------------------------------

--
-- Table structure for table `issue_books`
--

CREATE TABLE `issue_books` (
  `id` int(5) NOT NULL,
  `book_id` int(5) NOT NULL,
  `student_id` int(5) NOT NULL,
  `book_issue_date` varchar(20) NOT NULL,
  `book_return_date` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issue_books`
--

INSERT INTO `issue_books` (`id`, `book_id`, `student_id`, `book_issue_date`, `book_return_date`, `date_time`) VALUES
(1, 11, 7, '13-04-2020', '13-04-20', '2020-04-13 05:16:01'),
(9, 8, 11, '13-04-2020', '', '2020-04-13 06:14:07'),
(10, 9, 11, '13-04-2020', '13-04-20', '2020-04-13 06:14:17'),
(11, 11, 12, '13-04-2020', '13-04-20', '2020-04-13 06:22:07'),
(12, 9, 12, '13-04-2020', '', '2020-04-13 06:22:16'),
(13, 10, 10, '13-04-2020', '13-04-20', '2020-04-13 08:31:15'),
(14, 10, 10, '13-04-2020', '13-04-20', '2020-04-13 08:31:27'),
(15, 8, 13, '13-04-2020', '13-04-20', '2020-04-13 08:54:03'),
(16, 11, 13, '13-04-2020', '', '2020-04-13 08:54:12'),
(17, 12, 14, '13-04-2020', '', '2020-04-13 08:54:22'),
(18, 9, 10, '13-04-2020', '', '2020-04-13 11:51:58');

-- --------------------------------------------------------

--
-- Table structure for table `librarian`
--

CREATE TABLE `librarian` (
  `id` int(3) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `librarian`
--

INSERT INTO `librarian` (`id`, `fname`, `lname`, `email`, `username`, `password`, `date_time`) VALUES
(1, 'Arafat', 'Hasan', 'admin@gmail.com', 'adminarif', '99999999', '2020-04-12 15:30:57');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(5) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `roll` int(6) NOT NULL,
  `reg` int(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `fname`, `lname`, `roll`, `reg`, `email`, `username`, `password`, `phone`, `image`, `status`, `date_time`) VALUES
(5, 'Kamal', 'Hossain', 555555, 555555, 'arifh3261@gmail.com', 'arifhossain', '$2y$10$jrS3AM4em00TWV21MsTolewE0/l/TW9dcEunzZ2o1Ta8zSw/PueIu', '01882763384', NULL, 0, '2020-04-12 14:01:56'),
(7, 'Kamal', 'Hossain', 555555, 555555, 'aivey@gmai.com', 'kamalhasan', '$2y$10$psjb88HhveyT6iqBYSz/weD4MQpZHTT2suopKahLvKsv6fxvrBkIS', '01882763384', NULL, 1, '2020-04-12 14:03:07'),
(8, 'Arif', 'Hossain', 666666, 777777, 'kamal@gmai.com', 'admin', '$2y$10$PWP/Q8MdKUhyZUESr/yMiupjWm.lL2H/Ed8UP/mOjKfeu5pBfRg2K', '01482763384', NULL, 0, '2020-04-12 14:11:33'),
(10, 'Kamal', 'Hossain', 555555, 555555, 'aivey8@gmai.com', 'jjjjjjjj', '$2y$10$pR2J4tCKKYBNDauHYz1/1eCja83jJ2L1vIM.8/1FyQRmVN2z0WU9e', '01482763384', NULL, 1, '2020-04-12 14:29:15'),
(11, 'Admin', 'Hossain', 999999, 999999, 'admin@gmail.com', 'adminarif', '$2y$10$RaoJLmCim96GIPFIbHl1EOQxOVPgm6cMD5q3FByi/e18by9D43.3.', '01882763384', NULL, 1, '2020-04-12 14:48:52'),
(12, 'Omor', 'Hasan', 555555, 345678, 'omor@gmail.com', 'omorhasan', '$2y$10$t6Soh.mWtThnxCfwAJrsN.lI7XQS/DHyDvMhw1KXR4puhqmn9SOGu', '01882763384', NULL, 1, '2020-04-13 06:21:15'),
(13, 'Subahan', 'Molla', 444444, 333333, 'sobahan@gmail.com', 'sobahamolla', '$2y$10$lXYJ/w1//YwESpODo0DvwOCcf1MLlldkRCIwJyxr0Lfgz2acvrNb6', '01782763384', NULL, 1, '2020-04-13 08:52:33'),
(14, 'Mukta', 'Molla', 444444, 333333, 'mukta@gmail.com', 'muktamolla', '$2y$10$T30wKahScGCw5YHdG8ynluS77VQOXeVENo7edfJCY4pKEbK5UWk7e', '01782763384', NULL, 1, '2020-04-13 08:52:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `issue_books`
--
ALTER TABLE `issue_books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `librarian`
--
ALTER TABLE `librarian`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `issue_books`
--
ALTER TABLE `issue_books`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `librarian`
--
ALTER TABLE `librarian`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
