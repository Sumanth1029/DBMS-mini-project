-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2017 at 01:38 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `har`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `abc` ()  NO SQL
BEGIN
select * from vehicle_info WHERE availibility='YES';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` float NOT NULL,
  `name` varchar(30) NOT NULL,
  `location` varchar(20) NOT NULL,
  `no_of_people` int(2) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `occupation` varchar(20) NOT NULL,
  `room_id` varchar(10) NOT NULL,
  `no_of_days` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `avail` AFTER INSERT ON `customer` FOR EACH ROW BEGIN
update room set availibility='NO' where room_id in (select c.room_id from customer c where c.room_id=room_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discount_id` varchar(10) NOT NULL,
  `disc_per` decimal(3,0) NOT NULL,
  `room_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`discount_id`, `disc_per`, `room_id`) VALUES
('D1', '10', 'G-001'),
('D10', '5', 'S-202'),
('D11', '10', 'S-203'),
('D12', '5', 'S-204'),
('D2', '5', 'G-002'),
('D3', '10', 'G-003'),
('D4', '5', 'G-004'),
('D5', '10', 'F-101'),
('D6', '5', 'F-102'),
('D7', '10', 'F-103'),
('D8', '5', 'F-104'),
('D9', '10', 'S-201');

-- --------------------------------------------------------

--
-- Table structure for table `hotel_login`
--

CREATE TABLE `hotel_login` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hotel_login`
--

INSERT INTO `hotel_login` (`id`, `username`, `password`) VALUES
(1, 'sumanth', 'sumanth');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` varchar(10) NOT NULL,
  `floor` varchar(10) NOT NULL,
  `rclass` varchar(10) NOT NULL,
  `cost_day` int(6) NOT NULL,
  `availibility` varchar(3) NOT NULL,
  `max_people` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`room_id`, `floor`, `rclass`, `cost_day`, `availibility`, `max_people`) VALUES
('F-101', 'FIRST', 'AC', 4500, 'YES', 2),
('F-102', 'FIRST', 'NON-AC', 3500, 'YES', 2),
('F-103', 'FIRST', 'AC', 6500, 'YES', 4),
('F-104', 'FIRST', 'NON-AC', 5500, 'YES', 4),
('G-001', 'GROUND', 'AC', 4000, 'YES', 2),
('G-002', 'GROUND', 'NON-AC', 3000, 'YES', 2),
('G-003', 'GROUND', 'AC', 6000, 'YES', 4),
('G-004', 'GROUND', 'NON-AC', 5000, 'YES', 4),
('S-201', 'SECOND', 'AC', 5000, 'YES', 2),
('S-202', 'SECOND', 'NON-AC', 4000, 'YES', 2),
('S-203', 'SECOND', 'AC', 7000, 'YES', 4),
('S-204', 'SECOND', 'NON-AC', 5000, 'YES', 4);

-- --------------------------------------------------------

--
-- Table structure for table `room_booking_details`
--

CREATE TABLE `room_booking_details` (
  `book_id` float NOT NULL,
  `discount_id` varchar(10) NOT NULL,
  `amount` decimal(6,0) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `id_proof` varchar(30) NOT NULL,
  `date` varchar(50) NOT NULL,
  `cust_id` float NOT NULL,
  `room_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `v1`
-- (See below for the actual view)
--
CREATE TABLE `v1` (
`room_id` varchar(10)
,`floor` varchar(10)
,`rclass` varchar(10)
,`cost_day` int(6)
,`availibility` varchar(3)
,`max_people` int(2)
,`discount_id` varchar(10)
,`disc_per` decimal(3,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v2`
-- (See below for the actual view)
--
CREATE TABLE `v2` (
`cust_id` float
,`name` varchar(30)
,`location` varchar(20)
,`no_of_people` int(2)
,`gender` varchar(1)
,`phone` varchar(20)
,`occupation` varchar(20)
,`room_id` varchar(10)
,`no_of_days` int(6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v3`
-- (See below for the actual view)
--
CREATE TABLE `v3` (
`cust_id` float
,`name` varchar(30)
,`location` varchar(20)
,`no_of_people` int(2)
,`gender` varchar(1)
,`phone` varchar(20)
,`occupation` varchar(20)
,`room_id` varchar(10)
,`no_of_days` int(6)
,`id_proof` varchar(30)
,`date` varchar(50)
,`amount` decimal(6,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v4`
-- (See below for the actual view)
--
CREATE TABLE `v4` (
`name` varchar(30)
,`vehicle_id` float
,`vehicle_type` varchar(20)
,`vname` varchar(20)
,`deposit` decimal(5,0)
,`cost_km` decimal(3,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v5`
-- (See below for the actual view)
--
CREATE TABLE `v5` (
`book_id` float
,`name` varchar(30)
);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_booking_details`
--

CREATE TABLE `vehicle_booking_details` (
  `vehicle_id` float NOT NULL,
  `vehicle_type` varchar(20) NOT NULL,
  `vname` varchar(20) NOT NULL,
  `deposit` decimal(5,0) DEFAULT NULL,
  `cost_km` decimal(3,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_details`
--

CREATE TABLE `vehicle_details` (
  `vehicle_num` varchar(10) NOT NULL,
  `vehicle_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_details`
--

INSERT INTO `vehicle_details` (`vehicle_num`, `vehicle_type`) VALUES
('V1', 'HATCHBACK'),
('V4', 'MUV'),
('V2', 'SEDAN'),
('V3', 'SUV');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_info`
--

CREATE TABLE `vehicle_info` (
  `vehicle_type` varchar(20) NOT NULL,
  `vname` varchar(20) NOT NULL,
  `cost_km` decimal(5,0) NOT NULL,
  `availibility` varchar(5) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `deposit` decimal(5,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_info`
--

INSERT INTO `vehicle_info` (`vehicle_type`, `vname`, `cost_km`, `availibility`, `reg_no`, `deposit`) VALUES
('HATCHBACK', 'SWIFT', '8', 'YES', 'KA-01-S-1658', '2000'),
('SUV', 'THAR 4X4', '20', 'YES', 'KA-01-S-1812', '5500'),
('MUV', 'INNOVA', '20', 'ÝES', 'KA-01-S-2489', '6000'),
('SUV', 'SAFARI', '16', 'YES', 'KA-01-S-3242', '4500'),
('HATCHBACK', 'ALTO', '6', 'ÝES', 'KA-01-S-5252', '1500'),
('SUV', 'FORTUNER', '17', 'ÝES', 'KA-01-S-5654', '5000'),
('SEDAN', 'CIVIC', '12', 'ÝES', 'KA-01-S-6547', '3500'),
('SEDAN', 'CIAZ', '12', 'YES', 'KA-01-S-7827', '3500');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_login`
--

CREATE TABLE `vehicle_login` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle_login`
--

INSERT INTO `vehicle_login` (`id`, `username`, `password`) VALUES
(1, 'sachin', 'sachin');

-- --------------------------------------------------------

--
-- Structure for view `v1`
--
DROP TABLE IF EXISTS `v1`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v1`  AS  select `r`.`room_id` AS `room_id`,`r`.`floor` AS `floor`,`r`.`rclass` AS `rclass`,`r`.`cost_day` AS `cost_day`,`r`.`availibility` AS `availibility`,`r`.`max_people` AS `max_people`,`discount`.`discount_id` AS `discount_id`,`discount`.`disc_per` AS `disc_per` from (`room` `r` join `discount`) where (`r`.`room_id` = `discount`.`room_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `v2`
--
DROP TABLE IF EXISTS `v2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v2`  AS  select `customer`.`cust_id` AS `cust_id`,`customer`.`name` AS `name`,`customer`.`location` AS `location`,`customer`.`no_of_people` AS `no_of_people`,`customer`.`gender` AS `gender`,`customer`.`phone` AS `phone`,`customer`.`occupation` AS `occupation`,`customer`.`room_id` AS `room_id`,`customer`.`no_of_days` AS `no_of_days` from `customer` ;

-- --------------------------------------------------------

--
-- Structure for view `v3`
--
DROP TABLE IF EXISTS `v3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v3`  AS  select `c`.`cust_id` AS `cust_id`,`c`.`name` AS `name`,`c`.`location` AS `location`,`c`.`no_of_people` AS `no_of_people`,`c`.`gender` AS `gender`,`c`.`phone` AS `phone`,`c`.`occupation` AS `occupation`,`c`.`room_id` AS `room_id`,`c`.`no_of_days` AS `no_of_days`,`r`.`id_proof` AS `id_proof`,`r`.`date` AS `date`,`r`.`amount` AS `amount` from (`customer` `c` join `room_booking_details` `r`) where (`c`.`room_id` = `r`.`room_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `v4`
--
DROP TABLE IF EXISTS `v4`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v4`  AS  select `r`.`name` AS `name`,`v`.`vehicle_id` AS `vehicle_id`,`v`.`vehicle_type` AS `vehicle_type`,`v`.`vname` AS `vname`,`v`.`deposit` AS `deposit`,`v`.`cost_km` AS `cost_km` from (`room_booking_details` `r` join `vehicle_booking_details` `v`) where (`r`.`book_id` = `v`.`vehicle_id`) ;

-- --------------------------------------------------------

--
-- Structure for view `v5`
--
DROP TABLE IF EXISTS `v5`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v5`  AS  select `room_booking_details`.`book_id` AS `book_id`,`room_booking_details`.`name` AS `name` from `room_booking_details` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discount_id`),
  ADD KEY `disc_id` (`discount_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `hotel_login`
--
ALTER TABLE `hotel_login`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `room_booking_details`
--
ALTER TABLE `room_booking_details`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `cust_id` (`cust_id`),
  ADD KEY `disc_id` (`discount_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `book_id_2` (`book_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `vehicle_booking_details`
--
ALTER TABLE `vehicle_booking_details`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `vehicle_details`
--
ALTER TABLE `vehicle_details`
  ADD PRIMARY KEY (`vehicle_type`);

--
-- Indexes for table `vehicle_info`
--
ALTER TABLE `vehicle_info`
  ADD PRIMARY KEY (`reg_no`),
  ADD KEY `vehcie_type` (`vehicle_type`);

--
-- Indexes for table `vehicle_login`
--
ALTER TABLE `vehicle_login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` float NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;
--
-- AUTO_INCREMENT for table `hotel_login`
--
ALTER TABLE `hotel_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `room_booking_details`
--
ALTER TABLE `room_booking_details`
  MODIFY `book_id` float NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `vehicle_login`
--
ALTER TABLE `vehicle_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `roomid` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `room_discount` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room_booking_details`
--
ALTER TABLE `room_booking_details`
  ADD CONSTRAINT `customer` FOREIGN KEY (`cust_id`) REFERENCES `customer` (`cust_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `discount` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `room` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle_booking_details`
--
ALTER TABLE `vehicle_booking_details`
  ADD CONSTRAINT `book_id` FOREIGN KEY (`vehicle_id`) REFERENCES `room_booking_details` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicle_info`
--
ALTER TABLE `vehicle_info`
  ADD CONSTRAINT `vehicle-type` FOREIGN KEY (`vehicle_type`) REFERENCES `vehicle_details` (`vehicle_type`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
