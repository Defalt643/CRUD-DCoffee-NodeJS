-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2022 at 01:37 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dcoffee`
--

-- --------------------------------------------------------

--
-- Table structure for table `mst_employee`
--

CREATE TABLE `mst_employee` (
  `id_employee` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `salary` double NOT NULL,
  `total_sale` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mst_employee`
--

INSERT INTO `mst_employee` (`id_employee`, `name`, `surname`, `position`, `salary`, `total_sale`) VALUES
(1, 'สุขใจ', 'ไทยเดิม', 'พนักงาน', 5000, 30000),
(2, 'มานี', 'รักถิ่นไทย', 'เจ้าของร้าน', 6000, 50000);

-- --------------------------------------------------------

--
-- Table structure for table `mst_security`
--

CREATE TABLE `mst_security` (
  `id_security` int(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id_employee` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mst_security`
--

INSERT INTO `mst_security` (`id_security`, `user`, `password`, `id_employee`) VALUES
(1, 'sutgai.t@gmail.com', 'qw123', 1),
(2, 'manee.r@gmail.com', 'as123', 2);

-- --------------------------------------------------------

--
-- Table structure for table `trn_login`
--

CREATE TABLE `trn_login` (
  `id_login` int(11) NOT NULL,
  `datetime_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_employee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trn_login`
--

INSERT INTO `trn_login` (`id_login`, `datetime_login`, `id_employee`) VALUES
(1, '2022-03-04 12:32:36', 2),
(2, '2022-03-04 12:34:06', 2),
(3, '2022-03-04 12:36:28', 2),
(4, '2022-03-04 12:36:52', 1);

-- --------------------------------------------------------

--
-- Table structure for table `trn_logout`
--

CREATE TABLE `trn_logout` (
  `id_logout` int(11) NOT NULL,
  `datetime_logout` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_employee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trn_logout`
--

INSERT INTO `trn_logout` (`id_logout`, `datetime_logout`, `id_employee`) VALUES
(1, '2022-03-04 12:36:29', 2),
(2, '2022-03-04 12:36:54', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mst_employee`
--
ALTER TABLE `mst_employee`
  ADD PRIMARY KEY (`id_employee`),
  ADD UNIQUE KEY `id_employee` (`id_employee`);

--
-- Indexes for table `mst_security`
--
ALTER TABLE `mst_security`
  ADD PRIMARY KEY (`id_security`);

--
-- Indexes for table `trn_login`
--
ALTER TABLE `trn_login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indexes for table `trn_logout`
--
ALTER TABLE `trn_logout`
  ADD PRIMARY KEY (`id_logout`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `trn_login`
--
ALTER TABLE `trn_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `trn_logout`
--
ALTER TABLE `trn_logout`
  MODIFY `id_logout` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
