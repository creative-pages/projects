-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2020 at 07:19 AM
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
-- Database: `lms`
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
  `book_price` varchar(50) NOT NULL,
  `book_qty` int(5) NOT NULL,
  `available_qty` int(5) NOT NULL,
  `librarian_username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `book_name`, `book_image`, `book_author_name`, `book_publications_name`, `book_purchase_date`, `book_price`, `book_qty`, `available_qty`, `librarian_username`) VALUES
(1, 'Arif', '20200410053120.png', 'Arif Hossain', 'Publications', '2020-04-15', '23456', 35, 55, 'librarian_username'),
(2, 'My Crush', '20200410055140.png', 'Aivey Hossain', 'পচা Publications', '2020-04-15', '345567', 58, 3, 'arafathossain'),
(5, 'Pran Pakhi', '20200410054553.png', 'Aivey Hossain', 'Love Publications', '2020-04-24', '100000', 47, 9, 'arafathossain'),
(6, 'Choto Vai', '20200410055140.png', 'Ashrafull', 'Family Publications', '2020-04-20', '200', 20, 9, 'arafathossain'),
(7, 'Bangla', '20200410054553.png', 'Kamal', 'Government', '2018-02-05', '500', 100, 60, 'arafathossain');

-- --------------------------------------------------------

--
-- Table structure for table `issue_books`
--

CREATE TABLE `issue_books` (
  `id` int(5) NOT NULL,
  `student_id` int(5) NOT NULL,
  `books_id` int(5) NOT NULL,
  `book_issue_date` varchar(20) NOT NULL,
  `book_return_date` varchar(20) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `issue_books`
--

INSERT INTO `issue_books` (`id`, `student_id`, `books_id`, `book_issue_date`, `book_return_date`, `date_time`) VALUES
(1, 2, 2, '10-Apr-20', '10-Apr-20', '2020-04-10 09:32:34'),
(2, 2, 2, '10-Apr-20', '10-Apr-20', '2020-04-10 09:35:30'),
(3, 2, 2, '10-Apr-20', '', '2020-04-10 09:36:30'),
(4, 1, 6, '10-Apr-20', '', '2020-04-10 10:35:57'),
(5, 1, 5, '10-Apr-20', '', '2020-04-10 10:36:18'),
(6, 1, 7, '10-Apr-20', '', '2020-04-10 11:02:52'),
(7, 5, 5, '10-Apr-20', '', '2020-04-10 15:28:06'),
(8, 2, 1, '10-Apr-20', '', '2020-04-10 15:37:55'),
(9, 4, 2, '10-Apr-20', '', '2020-04-10 15:38:01'),
(10, 9, 6, '10-Apr-20', '', '2020-04-10 15:38:07');

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
(1, 'Arafat', 'Hossin', 'arafat@gmail.com', 'arafathossain', '11111111', '2020-04-09 12:46:31'),
(2, 'Omor', 'Hasan', 'omor@gmail.com', 'omorhasan', '00000000', '2020-04-10 12:38:08');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(6) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `roll` int(6) NOT NULL,
  `reg` int(6) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `phone` int(11) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `fname`, `lname`, `roll`, `reg`, `email`, `username`, `password`, `phone`, `image`, `status`, `date_time`) VALUES
(1, 'Arif', 'Hossain', 111111, 111111, 'arif@gmail.com', 'arifhossain', '$2y$10$cmlbqJqgLMoWCZ3D8yj1y.ELmgOTSrNYw./BJ8V7c761FdvVRbYLS', 1482763384, NULL, 1, '2020-04-09 10:55:33'),
(2, 'Aivey', 'Hossain', 222222, 222222, 'arif2@gmail.com', 'arifhossain2', '$2y$10$INTZz2Ep6j/R5afW9GKFpeefYT36Dce/h/3V6Ks2lh/Tk4.17D1r6', 1482763385, NULL, 1, '2020-04-09 10:56:17'),
(3, 'Omor', 'Hasan', 0, 0, 'omor@gmail.com', 'omorhasan', '$2y$10$Bik231OapnFTKQlGTii5D.m50EU2Fme3sYah6UZoT1NOGgQaLkpJe', 1882763384, NULL, 1, '2020-04-10 12:39:56'),
(4, 'Kamal', 'Hasan', 555555, 555555, 'kamal@gmail.com', 'kamalhasan', '55555555', 1782763384, NULL, 1, '2020-04-10 14:16:58'),
(5, 'Jamal', 'Hasan', 666666, 666666, 'jamal@gmail.com', 'jamalhasan', '66666666', 1782763384, NULL, 1, '2020-04-10 14:16:58'),
(8, 'Kamal', 'Hasan', 555555, 555555, 'kamal22@gmail.com', 'kamalhasan22', '55555555', 1782763384, NULL, 1, '2020-04-10 14:17:45'),
(9, 'Jamal', 'Hasan', 666666, 666666, 'jamal22@gmail.com', 'jamalhasan22', '66666666', 1782763384, NULL, 1, '2020-04-10 14:17:45'),
(10, 'Dady', 'Baba', 333333, 333333, 'dady@gmail.com', 'dadybaba', '33333333', 1882763384, NULL, 1, '2020-04-10 14:54:24');

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
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `issue_books`
--
ALTER TABLE `issue_books`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `librarian`
--
ALTER TABLE `librarian`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
