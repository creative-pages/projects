-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2020 at 07:43 PM
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
-- Database: `work`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `status`, `create_date`, `update_date`) VALUES
(1, 'admin@gmail.com', 'admin@gmail.com', 'admin', '2020-10-17 13:43:26', '2020-10-19 14:30:55');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `check_in` datetime NOT NULL,
  `check_out` datetime NOT NULL,
  `time` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `month` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `user_id`, `employee_id`, `check_in`, `check_out`, `time`, `date`, `month`, `create_time`, `update_time`) VALUES
(6, 4, 'EID-9', '2020-10-19 06:58:27', '2020-10-19 07:00:50', '00:2', '2020-10-19', '2020-10', '2020-10-19 16:58:27', '2020-10-20 04:29:06'),
(9, 1, 'EID-1', '2020-10-20 07:21:28', '2020-10-20 07:24:53', '00:3', '2020-10-20', '2020-10', '2020-10-20 17:21:28', '2020-10-20 17:24:53'),
(10, 4, 'EID-9', '2020-10-20 07:29:53', '2020-10-20 07:36:36', '00:6', '2020-10-20', '2020-10', '2020-10-20 17:29:53', '2020-10-20 17:36:36');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `dept` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `dept`, `create_time`, `update_time`) VALUES
(3, 'Computer', '2020-10-18 07:03:36', '2020-10-18 07:03:36'),
(4, 'RSC', '2020-10-18 08:32:06', '2020-10-18 08:48:02'),
(5, 'Civil', '2020-10-18 08:42:53', '2020-10-18 08:42:53');

-- --------------------------------------------------------

--
-- Table structure for table `leave_request`
--

CREATE TABLE `leave_request` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  `days` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
  `month` varchar(255) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leave_request`
--

INSERT INTO `leave_request` (`id`, `employee_id`, `employee_name`, `from_date`, `to_date`, `days`, `reason`, `description`, `status`, `year`, `month`, `create_date`, `update_date`) VALUES
(8, 'EID-1', 'Arafat Hossain', '2020-10-20', '2020-10-21', 2, 'Annual Leave', 'Sick Leave', 'accepted', '2020', '2020-10', '2020-10-20 15:41:38', '2020-10-20 16:49:36'),
(9, 'EID-1', 'Arafat Hossain', '2020-10-20', '2020-10-20', 1, 'Festival Leave', 'Sick Leave', 'pending', '2020', '2020-10', '2020-10-20 15:44:06', '2020-10-20 16:49:40'),
(10, 'EID-1', 'Arafat Hossain', '2020-10-20', '2020-10-24', 4, 'Annual Leave', 'test', 'pending', '2020', '2020-10', '2020-10-20 15:54:29', '2020-10-20 16:49:42'),
(11, 'EID-1', 'Arafat Hossain', '2020-10-15', '2020-10-17', 3, 'Medical Leave', 'sick', 'pending', '2020', '2020-10', '2020-10-20 16:52:31', '2020-10-20 16:52:31');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `state` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `user_id`, `subject`, `description`, `state`, `status`, `date_time`) VALUES
(1, 1, 'test', 'test', 'sent', 1, '2020-10-19 11:18:59'),
(2, 1, 'test', 'reply test', 'reply', 1, '2020-10-19 12:03:25'),
(3, 1, 'test', 'second reply', 'sent', 1, '2020-10-19 12:07:15'),
(4, 1, 'test', 'third reply', 'reply', 1, '2020-10-19 12:08:54'),
(5, 1, 'test', 'dfdfd', 'sent', 0, '2020-10-20 06:01:37');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `pos` varchar(255) NOT NULL,
  `annual_leave` int(11) NOT NULL,
  `casual_leave` int(11) NOT NULL,
  `medical_leave` int(11) NOT NULL,
  `maternity_leave` int(11) NOT NULL,
  `festival_leave` int(11) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `pos`, `annual_leave`, `casual_leave`, `medical_leave`, `maternity_leave`, `festival_leave`, `create_time`, `update_time`) VALUES
(2, 'Peon', 6, 4, 5, 7, 3, '2020-10-18 11:50:40', '2020-10-20 13:28:20'),
(3, 'Managear', 6, 2, 6, 5, 8, '2020-10-18 11:52:54', '2020-10-20 13:27:41'),
(4, 'Assistant', 4, 6, 4, 8, 3, '2020-10-18 11:56:03', '2020-10-20 13:29:23'),
(6, 'Test', 8, 5, 4, 2, 5, '2020-10-20 13:20:13', '2020-10-20 13:20:13');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `token`, `update_date`) VALUES
(1, '123abc456', '2020-10-19 03:02:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `dept` varchar(255) NOT NULL,
  `pos` varchar(255) NOT NULL,
  `salary` varchar(255) NOT NULL,
  `hire_date` date NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(255) NOT NULL,
  `marital_status` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `nid` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `employee_id`, `first_name`, `last_name`, `email`, `password`, `dept`, `pos`, `salary`, `hire_date`, `birthday`, `gender`, `marital_status`, `phone`, `nid`, `address`, `photo`, `create_time`, `update_time`) VALUES
(1, 'EID-1', 'Arafat', 'Hossain', 'arafat@gmail.com', 'arafat@gmail.com', 'Computer', 'Managear', '20000', '2020-06-01', '2010-06-08', 'Male', 'Single', '01782763384', '17827633845', 'Bhola, Barisal, Bangladesh', '516285ad67.png', '2020-10-18 13:25:23', '2020-10-20 07:05:51'),
(4, 'EID-9', 'Aklima', 'Akter', 'aklima@gmail.com', 'aklima@gmail.com', 'RSC', 'Assistant', '15000', '2020-06-18', '2020-10-30', 'Female', 'Widowed', '01782763389', '17827633890', 'Bhola, Barisal, Bangladesh', '0c4107ef24.gif', '2020-10-18 14:08:53', '2020-10-19 14:12:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_request`
--
ALTER TABLE `leave_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `leave_request`
--
ALTER TABLE `leave_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
