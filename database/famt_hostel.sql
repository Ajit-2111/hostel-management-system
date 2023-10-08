-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 08, 2023 at 07:31 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `famt_hostel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(300) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `reg_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `updation_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email`, `password`, `gender`, `mobile_no`, `type`, `reg_date`, `updation_date`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', 'male', '1234', 'admin', '2016-04-04 20:31:45', '2023-03-16');

-- --------------------------------------------------------

--
-- Table structure for table `adminlog`
--

CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL,
  `adminid` int(11) NOT NULL,
  `ip` varbinary(16) NOT NULL,
  `logintime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `course_code` varchar(255) NOT NULL,
  `course_sn` varchar(255) NOT NULL,
  `course_fn` varchar(255) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course_code`, `course_sn`, `course_fn`, `posting_date`) VALUES
(7, '1', 'Bachelor of Engineering', 'IT', '2016-04-11 19:35:19'),
(9, '2', 'Bachelor of Engineering', 'ELEC', '2023-03-17 14:26:30'),
(10, '3', 'Bachelor of Engineering', 'CHEM', '2023-03-17 14:27:20'),
(11, '4', 'Bachelor of Engineering', 'MCA', '2023-03-17 14:31:53'),
(12, '5', 'Bachelor of Engineering', 'EXTC', '2023-03-17 14:32:28'),
(13, '6', 'Bachelor of Engineering', 'Computer Science Engineering', '2023-03-17 14:32:54'),
(14, '7', 'Bachelor of Engineering', 'MECH', '2023-03-17 14:33:46');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `roomno` int(11) NOT NULL,
  `Building` varchar(100) NOT NULL,
  `seater` int(11) NOT NULL,
  `feespm` int(11) NOT NULL,
  `fpm` varchar(100) NOT NULL,
  `frn` varchar(100) NOT NULL DEFAULT '',
  `foodstatus` int(11) NOT NULL,
  `stayfrom` date DEFAULT NULL,
  `duration` int(11) NOT NULL,
  `course` varchar(500) NOT NULL,
  `semester` varchar(100) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `regno` varchar(100) NOT NULL,
  `firstName` varchar(500) NOT NULL,
  `middleName` varchar(500) NOT NULL DEFAULT ' ',
  `lastName` varchar(500) NOT NULL,
  `gender` varchar(250) NOT NULL,
  `contactno` bigint(11) NOT NULL,
  `emailid` varchar(500) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `egycontactno` bigint(11) NOT NULL,
  `guardianName` varchar(500) DEFAULT NULL,
  `guardianRelation` varchar(500) DEFAULT NULL,
  `guardianContactno` bigint(11) DEFAULT NULL,
  `corresAddress` varchar(500) DEFAULT NULL,
  `corresCIty` varchar(500) DEFAULT NULL,
  `corresState` varchar(500) DEFAULT NULL,
  `corresPincode` int(11) DEFAULT NULL,
  `pmntAddress` varchar(500) DEFAULT NULL,
  `pmntCity` varchar(500) DEFAULT NULL,
  `pmnatetState` varchar(500) DEFAULT NULL,
  `pmntPincode` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(500) DEFAULT NULL,
  `leaveapplication` varchar(255) DEFAULT NULL,
  `leaveapplicationstatus` varchar(255) DEFAULT '',
  `complaint` varchar(255) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `seater` int(11) NOT NULL,
  `Building` varchar(100) NOT NULL,
  `room_no` int(11) NOT NULL,
  `fees` int(11) NOT NULL,
  `posting_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `seater`, `Building`, `room_no`, `fees`, `posting_date`) VALUES
(9, 2, 'Krishna', 60, 24000, '2023-03-15 11:16:50'),
(10, 2, 'Krishna', 83, 24000, '2023-03-15 11:16:50'),
(11, 2, 'Krishna', 84, 24000, '2023-03-15 11:16:50'),
(12, 2, 'Krishna', 85, 24000, '2023-03-15 11:16:50'),
(13, 2, 'Krishna', 86, 24000, '2023-03-15 11:16:50'),
(14, 2, 'Krishna', 88, 24000, '2023-03-15 11:16:50'),
(15, 2, 'Krishna', 89, 24000, '2023-03-15 11:16:50'),
(16, 2, 'Sindhu', 56, 24000, '2023-03-15 11:16:50'),
(17, 2, 'Sindhu', 57, 24000, '2023-03-15 11:16:50'),
(18, 2, 'Sindhu', 59, 24000, '2023-03-15 11:16:50'),
(19, 2, 'Sindhu', 60, 24000, '2023-03-15 11:16:50'),
(20, 2, 'Sindhu', 61, 24000, '2023-03-15 11:16:50'),
(21, 2, 'Sindhu', 62, 24000, '2023-03-15 11:16:50'),
(22, 2, 'Sindhu', 63, 24000, '2023-03-15 11:16:50'),
(23, 2, 'Sindhu', 64, 24000, '2023-03-15 11:16:50'),
(24, 2, 'Sindhu', 65, 24000, '2023-03-15 11:16:50'),
(25, 2, 'Sindhu', 66, 24000, '2023-03-15 11:16:50'),
(26, 2, 'Krishna', 90, 24000, '2023-03-17 15:54:44'),
(27, 2, 'Janjira', 39, 24000, '2023-03-17 15:54:44'),
(28, 2, 'Janjira', 41, 24000, '2023-03-17 15:54:44'),
(29, 2, 'Janjira', 42, 24000, '2023-03-17 15:54:44'),
(30, 2, 'Raigad', 43, 24000, '2023-03-17 15:54:44'),
(31, 2, 'Raigad', 45, 24000, '2023-03-17 15:54:44'),
(32, 2, 'Jaigad', 51, 24000, '2023-03-17 15:54:44'),
(33, 2, 'Jaigad', 52, 24000, '2023-03-17 15:54:44'),
(34, 2, 'Jaigad', 53, 24000, '2023-03-17 15:54:44'),
(35, 2, 'Jaigad', 54, 24000, '2023-03-17 15:54:44'),
(37, 2, 'Saifalibld', 80, 24000, '2023-03-26 05:56:33');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `State` varchar(150) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `State`) VALUES
(1, 'Andaman and Nicobar Island (UT)'),
(2, 'Andhra Pradesh'),
(3, 'Arunachal Pradesh'),
(4, 'Assam'),
(5, 'Bihar'),
(6, 'Chandigarh (UT)'),
(7, 'Chhattisgarh'),
(8, 'Dadra and Nagar Haveli (UT)'),
(9, 'Daman and Diu (UT)'),
(10, 'Delhi (NCT)'),
(11, 'Goa'),
(12, 'Gujarat'),
(13, 'Haryana'),
(14, 'Himachal Pradesh'),
(15, 'Jammu and Kashmir'),
(16, 'Jharkhand'),
(17, 'Karnataka'),
(18, 'Kerala'),
(19, 'Lakshadweep (UT)'),
(20, 'Madhya Pradesh'),
(21, 'Maharashtra'),
(22, 'Manipur'),
(23, 'Meghalaya'),
(24, 'Mizoram'),
(25, 'Nagaland'),
(26, 'Odisha'),
(27, 'Puducherry (UT)'),
(28, 'Punjab'),
(29, 'Rajastha'),
(30, 'Sikkim'),
(31, 'Tamil Nadu'),
(32, 'Telangana'),
(33, 'Tripura'),
(34, 'Uttarakhand'),
(35, 'EPE'),
(36, 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `userregno` varchar(255) NOT NULL,
  `userIp` varbinary(100) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userId`, `userregno`, `userIp`, `city`, `country`, `loginTime`) VALUES
(36, 186, 'TD-20-0212', 0x323430313a343930303a316338653a393538313a316330333a6537393a343435613a35613231, '', '', '2023-03-17 15:59:04'),
(37, 213, 'T-20-0153', 0x323430313a343930303a316338653a393538313a356334333a623761323a353332323a61396564, '', '', '2023-03-18 11:21:06'),
(38, 131, 'X-20-0068', 0x323430313a343930303a353139333a3730373a323736643a363132653a663633313a38313834, '', '', '2023-03-20 11:19:17'),
(39, 131, 'X-20-0068', 0x323430313a343930303a353139333a3730373a323736643a363132653a663633313a38313834, '', '', '2023-03-20 11:54:44'),
(40, 131, 'X-20-0068', 0x323430313a343930303a353139333a3730373a323736643a363132653a663633313a38313834, '', '', '2023-03-20 11:54:51'),
(41, 131, 'X-20-0068', 0x323430313a343930303a353266353a313765353a383161653a663839303a373737653a36393666, '', '', '2023-03-22 06:59:47'),
(42, 252, 'R-22-0131', 0x323430313a343930303a316338663a316535373a653434633a326563663a623339613a66393633, '', '', '2023-03-26 07:21:22'),
(43, 262, 'T-19-0130', 0x323430313a343930303a316338663a316535373a653434633a326563663a623339613a66393633, '', '', '2023-03-26 10:42:47'),
(44, 266, 'X-19-0011', 0x3138332e38372e3231312e3535, '', '', '2023-03-26 10:56:05'),
(45, 261, 'TD-20-01600', 0x323430313a343930303a316338663a316535373a653434633a326563663a623339613a66393633, '', '', '2023-03-26 11:03:54'),
(46, 266, 'X-19-0011', 0x3138332e38372e3231312e3535, '', '', '2023-03-26 11:30:53'),
(47, 266, 'X-19-0011', 0x323430313a343930303a353330303a383739643a333830323a636135343a323834623a31383862, '', '', '2023-03-26 11:54:07'),
(48, 266, 'X-19-0011', 0x323430313a343930303a316338663a316535373a653434633a326563663a623339613a66393633, '', '', '2023-03-26 12:03:48');

-- --------------------------------------------------------

--
-- Table structure for table `userregistration`
--

CREATE TABLE `userregistration` (
  `id` int(11) NOT NULL,
  `regNo` varchar(255) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `middleName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `contactNo` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(45) NOT NULL,
  `passUdateDate` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userregistration`
--
ALTER TABLE `userregistration`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=268;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `userregistration`
--
ALTER TABLE `userregistration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
