-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 18, 2022 at 11:22 AM
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
  `id_employee` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `salary` double NOT NULL,
  `total_sale` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id_security` int(11) NOT NULL,
  `user` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `id_employee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(4, '2022-03-04 12:36:52', 1),
(5, '2022-03-06 09:05:20', 2),
(6, '2022-03-06 09:05:45', 2),
(7, '2022-03-06 09:08:30', 2),
(8, '2022-03-06 09:08:51', 1),
(9, '2022-03-06 09:09:05', 2),
(10, '2022-03-06 09:09:40', 2),
(11, '2022-03-06 09:10:00', 2),
(12, '2022-03-06 09:10:22', 1),
(13, '2022-03-06 09:12:12', 1),
(14, '2022-03-06 09:12:28', 1),
(15, '2022-03-06 09:12:29', 1),
(16, '2022-03-06 09:12:48', 1),
(17, '2022-03-11 08:16:15', 2),
(18, '2022-03-11 08:18:36', 2),
(19, '2022-03-11 08:21:16', 2),
(20, '2022-03-11 08:22:33', 2),
(21, '2022-03-11 08:23:12', 2),
(22, '2022-03-11 08:25:49', 2),
(23, '2022-03-11 08:26:08', 2),
(24, '2022-03-11 08:27:14', 2),
(25, '2022-03-11 08:27:45', 2),
(26, '2022-03-11 08:28:37', 2),
(27, '2022-03-11 08:29:18', 2),
(28, '2022-03-11 08:30:00', 2),
(29, '2022-03-11 08:31:22', 2),
(30, '2022-03-11 08:32:08', 2),
(31, '2022-03-11 08:32:25', 2),
(32, '2022-03-11 08:32:45', 2),
(33, '2022-03-11 08:33:13', 2),
(34, '2022-03-11 08:34:32', 2),
(35, '2022-03-11 08:34:53', 2),
(36, '2022-03-11 08:35:40', 2),
(37, '2022-03-11 08:36:12', 2),
(38, '2022-03-11 08:36:26', 2),
(39, '2022-03-11 08:38:10', 2),
(40, '2022-03-11 08:38:58', 2),
(41, '2022-03-11 08:39:06', 2),
(42, '2022-03-11 08:39:12', 2),
(43, '2022-03-11 08:39:47', 2),
(44, '2022-03-11 08:40:32', 2),
(45, '2022-03-11 08:40:40', 2),
(46, '2022-03-11 08:40:49', 2),
(47, '2022-03-11 08:40:55', 2),
(48, '2022-03-11 08:40:59', 2),
(49, '2022-03-11 08:41:03', 2),
(50, '2022-03-11 08:41:12', 2),
(51, '2022-03-11 08:41:18', 2),
(52, '2022-03-11 08:41:29', 2),
(53, '2022-03-11 08:41:40', 2),
(54, '2022-03-11 08:44:02', 2),
(55, '2022-03-11 08:44:06', 2),
(56, '2022-03-11 08:44:09', 2),
(57, '2022-03-11 08:47:31', 2),
(58, '2022-03-11 08:47:33', 2),
(59, '2022-03-11 08:47:43', 2),
(60, '2022-03-11 08:49:04', 2),
(61, '2022-03-11 08:50:37', 2),
(62, '2022-03-11 08:53:28', 2),
(63, '2022-03-11 08:54:04', 2),
(64, '2022-03-11 08:54:50', 2),
(65, '2022-03-11 08:55:11', 2),
(66, '2022-03-11 08:55:48', 2),
(67, '2022-03-11 08:55:52', 2),
(68, '2022-03-11 08:56:05', 2),
(69, '2022-03-11 09:07:27', 2),
(70, '2022-03-11 09:08:57', 2),
(71, '2022-03-11 09:09:09', 2),
(72, '2022-03-11 09:09:39', 2),
(73, '2022-03-11 09:09:44', 2),
(74, '2022-03-11 09:10:26', 2),
(75, '2022-03-11 09:10:39', 2),
(76, '2022-03-11 09:10:42', 2),
(77, '2022-03-11 09:10:57', 2),
(78, '2022-03-11 09:11:16', 2),
(79, '2022-03-11 09:12:32', 2),
(80, '2022-03-11 09:13:00', 2),
(81, '2022-03-11 09:13:37', 2),
(82, '2022-03-11 09:14:22', 2),
(83, '2022-03-11 09:14:27', 2),
(84, '2022-03-11 09:14:43', 2),
(85, '2022-03-11 09:17:50', 2),
(86, '2022-03-11 09:18:08', 2),
(87, '2022-03-11 09:18:25', 2),
(88, '2022-03-11 09:20:39', 2),
(89, '2022-03-11 09:20:55', 2),
(90, '2022-03-11 09:21:14', 2),
(91, '2022-03-11 09:21:32', 2),
(92, '2022-03-11 09:21:46', 2),
(93, '2022-03-11 09:25:34', 2),
(94, '2022-03-11 09:25:38', 2),
(95, '2022-03-11 09:26:18', 2),
(96, '2022-03-11 09:26:27', 2),
(97, '2022-03-11 09:32:38', 2),
(98, '2022-03-11 09:33:20', 2),
(99, '2022-03-11 09:33:43', 2),
(100, '2022-03-11 09:37:21', 2),
(101, '2022-03-11 09:38:17', 2),
(102, '2022-03-11 09:39:52', 2),
(103, '2022-03-11 09:39:55', 2),
(104, '2022-03-11 09:41:03', 2),
(105, '2022-03-11 09:42:56', 2),
(106, '2022-03-11 09:44:19', 2),
(107, '2022-03-11 09:46:29', 2),
(108, '2022-03-11 09:46:32', 2),
(109, '2022-03-11 09:46:51', 2),
(110, '2022-03-11 09:47:43', 2),
(111, '2022-03-11 09:48:20', 2),
(112, '2022-03-11 09:48:44', 2),
(113, '2022-03-11 09:51:08', 2),
(114, '2022-03-11 09:51:33', 2),
(115, '2022-03-11 09:51:47', 2),
(116, '2022-03-11 09:54:52', 2),
(117, '2022-03-11 09:55:52', 2),
(118, '2022-03-11 09:56:38', 2),
(119, '2022-03-11 09:56:44', 2),
(120, '2022-03-11 09:59:18', 2),
(121, '2022-03-11 10:05:18', 2),
(122, '2022-03-11 10:05:31', 2),
(123, '2022-03-11 10:05:35', 2),
(124, '2022-03-11 10:14:14', 2),
(125, '2022-03-11 10:14:36', 2),
(126, '2022-03-11 10:14:39', 2),
(127, '2022-03-11 10:15:50', 2),
(128, '2022-03-11 10:16:05', 2),
(129, '2022-03-11 10:20:30', 2),
(130, '2022-03-11 10:20:42', 2),
(131, '2022-03-11 10:20:45', 2),
(132, '2022-03-11 10:21:37', 2),
(133, '2022-03-11 10:21:48', 2),
(134, '2022-03-11 10:25:11', 2),
(135, '2022-03-11 10:25:20', 2),
(136, '2022-03-11 10:26:22', 2),
(137, '2022-03-11 10:26:29', 2),
(138, '2022-03-11 10:28:46', 2),
(139, '2022-03-11 10:30:26', 2),
(140, '2022-03-11 10:33:06', 2),
(141, '2022-03-11 10:34:30', 2),
(142, '2022-03-11 10:34:57', 2),
(143, '2022-03-11 10:37:11', 2),
(144, '2022-03-11 10:37:18', 2),
(145, '2022-03-11 10:37:26', 2),
(146, '2022-03-11 10:42:03', 2),
(147, '2022-03-11 10:42:46', 2),
(148, '2022-03-11 10:43:21', 2),
(149, '2022-03-11 10:50:14', 2),
(150, '2022-03-11 10:51:21', 2),
(151, '2022-03-11 10:51:26', 2),
(152, '2022-03-11 10:51:49', 2),
(153, '2022-03-11 10:52:01', 2),
(154, '2022-03-11 10:53:27', 2),
(155, '2022-03-11 10:53:46', 2),
(156, '2022-03-11 10:56:27', 2),
(157, '2022-03-11 11:00:52', 2),
(158, '2022-03-11 11:01:02', 2),
(159, '2022-03-11 11:01:57', 2),
(160, '2022-03-11 11:02:40', 2),
(161, '2022-03-11 11:03:02', 2),
(162, '2022-03-11 11:03:29', 2),
(163, '2022-03-11 11:03:45', 2),
(164, '2022-03-11 11:04:31', 2),
(165, '2022-03-11 11:10:04', 2),
(166, '2022-03-11 11:10:22', 2),
(167, '2022-03-11 11:10:26', 2),
(168, '2022-03-11 11:11:40', 2),
(169, '2022-03-11 11:12:19', 2),
(170, '2022-03-11 11:25:34', 2),
(171, '2022-03-11 11:25:56', 2),
(172, '2022-03-11 11:27:58', 2),
(173, '2022-03-11 11:29:09', 2),
(174, '2022-03-11 11:29:39', 2),
(175, '2022-03-11 11:31:41', 2),
(176, '2022-03-11 11:32:16', 2),
(177, '2022-03-11 11:32:27', 2),
(178, '2022-03-11 11:32:33', 2),
(179, '2022-03-11 11:32:37', 2),
(180, '2022-03-11 11:33:29', 2),
(181, '2022-03-11 11:34:25', 2),
(182, '2022-03-11 11:34:35', 2),
(183, '2022-03-11 11:55:05', 2),
(184, '2022-03-11 11:59:28', 2),
(185, '2022-03-11 12:00:39', 2),
(186, '2022-03-11 12:00:52', 2),
(187, '2022-03-11 12:01:04', 2),
(188, '2022-03-11 12:01:35', 2),
(189, '2022-03-11 12:02:22', 2),
(190, '2022-03-11 12:02:37', 2),
(191, '2022-03-11 12:03:12', 2),
(192, '2022-03-11 12:04:22', 2),
(193, '2022-03-11 12:05:13', 2),
(194, '2022-03-11 12:05:16', 2),
(195, '2022-03-11 12:07:12', 2),
(196, '2022-03-11 12:07:44', 2),
(197, '2022-03-11 12:07:49', 2),
(198, '2022-03-12 10:33:29', 2),
(199, '2022-03-12 10:35:10', 2),
(200, '2022-03-12 10:48:49', 2),
(201, '2022-03-12 10:49:34', 2),
(202, '2022-03-12 10:50:22', 2),
(203, '2022-03-12 10:52:29', 2),
(204, '2022-03-12 10:52:33', 2),
(205, '2022-03-12 10:58:13', 2),
(206, '2022-03-12 10:59:22', 2),
(207, '2022-03-12 11:01:27', 2),
(208, '2022-03-12 11:02:19', 2),
(209, '2022-03-12 11:04:51', 2),
(210, '2022-03-12 11:05:47', 2),
(211, '2022-03-12 11:06:30', 2),
(212, '2022-03-12 11:07:15', 2),
(213, '2022-03-12 11:07:17', 2),
(214, '2022-03-12 11:08:34', 2),
(215, '2022-03-12 11:09:34', 2),
(216, '2022-03-12 11:10:16', 2),
(217, '2022-03-12 11:10:21', 2),
(218, '2022-03-12 11:14:34', 2),
(219, '2022-03-12 11:19:06', 2),
(220, '2022-03-12 11:19:33', 2),
(221, '2022-03-12 11:19:44', 2),
(222, '2022-03-12 11:19:47', 2),
(223, '2022-03-12 11:19:58', 2),
(224, '2022-03-12 11:21:05', 2),
(225, '2022-03-12 11:23:59', 2),
(226, '2022-03-12 11:24:03', 2),
(227, '2022-03-12 11:25:22', 2),
(228, '2022-03-12 11:25:26', 2),
(229, '2022-03-12 11:25:49', 2),
(230, '2022-03-12 11:26:00', 2),
(231, '2022-03-12 11:27:28', 2),
(232, '2022-03-12 11:32:23', 2),
(233, '2022-03-12 11:33:25', 2),
(234, '2022-03-12 11:34:17', 2),
(235, '2022-03-12 11:39:09', 2),
(236, '2022-03-12 12:26:56', 2),
(237, '2022-03-16 03:36:37', 2),
(238, '2022-03-16 03:39:21', 2),
(239, '2022-03-16 04:13:15', 2),
(240, '2022-03-16 04:29:55', 2),
(241, '2022-03-16 04:31:26', 2),
(242, '2022-03-16 04:32:22', 2),
(243, '2022-03-16 04:32:43', 2),
(244, '2022-03-16 04:34:31', 2),
(245, '2022-03-16 04:35:00', 2),
(246, '2022-03-16 04:36:46', 2),
(247, '2022-03-16 04:37:58', 2),
(248, '2022-03-16 04:39:37', 2),
(249, '2022-03-16 04:41:19', 2),
(250, '2022-03-16 04:47:37', 2),
(251, '2022-03-16 04:48:31', 2),
(252, '2022-03-16 04:50:52', 2),
(253, '2022-03-16 04:52:05', 2),
(254, '2022-03-16 04:55:05', 2),
(255, '2022-03-16 04:57:28', 2),
(256, '2022-03-16 04:59:27', 2),
(257, '2022-03-16 05:01:55', 2),
(258, '2022-03-16 05:03:47', 2),
(259, '2022-03-16 05:05:23', 2),
(260, '2022-03-16 05:07:09', 2),
(261, '2022-03-16 05:09:50', 2),
(262, '2022-03-16 05:11:51', 2),
(263, '2022-03-16 05:14:02', 2),
(264, '2022-03-16 05:15:44', 2),
(265, '2022-03-16 05:17:42', 2),
(266, '2022-03-16 05:19:21', 2),
(267, '2022-03-16 05:20:07', 2),
(268, '2022-03-16 05:22:30', 2),
(269, '2022-03-16 05:25:52', 2),
(270, '2022-03-16 05:28:16', 2),
(271, '2022-03-16 05:30:33', 2),
(272, '2022-03-16 05:32:47', 2),
(273, '2022-03-16 05:35:10', 2),
(274, '2022-03-17 11:37:49', 2),
(275, '2022-03-17 11:38:22', 2),
(276, '2022-03-17 12:17:29', 1),
(277, '2022-03-17 12:18:57', 2),
(278, '2022-03-17 12:23:06', 2),
(279, '2022-03-17 12:24:49', 2),
(280, '2022-03-17 12:25:32', 2),
(281, '2022-03-18 08:10:58', 2),
(282, '2022-03-18 08:16:19', 2),
(283, '2022-03-18 08:17:25', 2),
(284, '2022-03-18 08:31:01', 2),
(285, '2022-03-18 08:31:39', 1),
(286, '2022-03-18 08:36:09', 2),
(287, '2022-03-18 08:36:24', 1),
(288, '2022-03-18 08:37:02', 2),
(289, '2022-03-18 09:47:25', 2),
(290, '2022-03-18 09:48:06', 2),
(291, '2022-03-18 09:51:46', 2),
(292, '2022-03-18 09:55:36', 2),
(293, '2022-03-18 09:56:45', 2),
(294, '2022-03-18 09:57:57', 2),
(295, '2022-03-18 09:58:55', 2),
(296, '2022-03-18 10:00:52', 2),
(297, '2022-03-18 10:02:34', 2);

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
(2, '2022-03-04 12:36:54', 1),
(3, '2022-03-04 12:39:37', 1),
(4, '2022-03-06 09:08:31', 2),
(5, '2022-03-06 09:09:01', 1),
(6, '2022-03-06 09:09:56', 2),
(7, '2022-03-06 09:10:06', 2),
(8, '2022-03-06 09:12:09', 1),
(9, '2022-03-06 09:12:52', 1),
(10, '2022-03-11 08:28:33', 2),
(11, '2022-03-11 08:29:15', 2),
(12, '2022-03-11 08:29:55', 2),
(13, '2022-03-11 08:31:19', 2),
(14, '2022-03-11 08:32:05', 2),
(15, '2022-03-17 12:16:23', 2),
(16, '2022-03-17 12:18:48', 1),
(17, '2022-03-18 08:30:57', 2),
(18, '2022-03-18 08:31:10', 2),
(19, '2022-03-18 08:34:22', 1),
(20, '2022-03-18 08:36:14', 2),
(21, '2022-03-18 08:36:57', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mst_employee`
--
ALTER TABLE `mst_employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indexes for table `mst_security`
--
ALTER TABLE `mst_security`
  ADD PRIMARY KEY (`id_security`),
  ADD KEY `FK_idEmployee` (`id_employee`);

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
-- AUTO_INCREMENT for table `mst_employee`
--
ALTER TABLE `mst_employee`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mst_security`
--
ALTER TABLE `mst_security`
  MODIFY `id_security` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `trn_login`
--
ALTER TABLE `trn_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT for table `trn_logout`
--
ALTER TABLE `trn_logout`
  MODIFY `id_logout` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mst_security`
--
ALTER TABLE `mst_security`
  ADD CONSTRAINT `FK_idEmployee` FOREIGN KEY (`id_employee`) REFERENCES `mst_employee` (`id_employee`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
