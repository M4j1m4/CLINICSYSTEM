-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 28, 2024 at 02:11 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic_data`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` text NOT NULL,
  `verification_code` text NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `new_password` varchar(50) NOT NULL,
  `confirm_password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `name`, `password`, `email`, `verification_code`, `email_verified_at`, `new_password`, `confirm_password`) VALUES
(16, 'admin', '159263', 'abesamiskheni@gmail.com', '', '2024-12-28 20:52:41', '', ''),
(18, 'minad', '159263', '', '', NULL, '', ''),
(19, 'admin', '$2y$10$9Xqb9d9xqK4QX9UiOXS1tOjszl6nVXUOYC/yhALbNOb', 'abesamiskheni@gmail.com', '', '2024-12-28 21:04:54', '', ''),
(20, 'admin', '$2y$10$sJsK6Fn6HTshvCGBz6fqbO.V3DPrjln3RPCXarWvqpP', 'abesamiskheni@gmail.com', '', '2024-12-28 21:06:20', '', ''),
(21, 'admin', '$2y$10$Fxt6XvcVGI0kSiB2Jb.z4.p.fUBHFRtxkGN1IhAYhA0', 'abesamiskheni@gmail.com', '', '2024-12-28 21:07:16', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `consultations`
--

CREATE TABLE `consultations` (
  `ConsultationID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `TimeIn` time NOT NULL DEFAULT current_timestamp(),
  `TimeOut` time DEFAULT current_timestamp(),
  `SOAP` text DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `LastEditedBy` int(11) DEFAULT NULL,
  `Date` date NOT NULL DEFAULT current_timestamp(),
  `Subjective` text NOT NULL,
  `Objective` text NOT NULL,
  `Assessment` text NOT NULL,
  `Plan` text NOT NULL,
  `PlanDate` date NOT NULL DEFAULT current_timestamp(),
  `SavedBy` varchar(20) NOT NULL,
  `Name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `consultations`
--

INSERT INTO `consultations` (`ConsultationID`, `PatientID`, `TimeIn`, `TimeOut`, `SOAP`, `CreatedAt`, `UpdatedAt`, `LastEditedBy`, `Date`, `Subjective`, `Objective`, `Assessment`, `Plan`, `PlanDate`, `SavedBy`, `Name`) VALUES
(1, 1, '10:00:00', '10:30:00', 'Subjective: Fever\nObjective: High Temp\nAssessment: Possible Flu\nPlan: Rest & meds', '2024-12-04 15:14:17', '2024-12-04 15:14:17', 1, '2024-12-14', '', '', '', '', '2024-12-14', '', ''),
(2, 2, '11:00:00', '11:20:00', 'Subjective: Fatigue\nObjective: Normal vitals\nAssessment: Stress\nPlan: Rest', '2024-12-04 15:14:17', '2024-12-04 15:14:17', 2, '2024-12-14', '', '', '', '', '2024-12-14', '', ''),
(3, 7, '00:00:00', '00:00:00', NULL, '2024-12-14 23:21:36', '2024-12-14 23:21:36', NULL, '2024-12-14', 'dsadsa', 'dsadsadsa', 'dsadsad', 'dsadsadsad', '2024-12-22', 'Doc', ''),
(12, 6, '11:30:00', '11:30:00', NULL, '2024-12-15 11:30:36', '2024-12-15 11:30:36', NULL, '2024-12-15', 'sadsadsa', 'dasdsadasd', 'dasdsadasda', 'dasdadsadsa', '2024-12-19', 'Doc', ''),
(15, 1, '11:38:00', '12:38:00', NULL, '2024-12-15 11:39:00', '2024-12-15 11:39:00', NULL, '2024-12-15', 'cancer', 'cancer', 'cancer', '', '2024-12-19', 'Doc', ''),
(16, 1, '11:39:00', '12:39:00', NULL, '2024-12-15 11:39:38', '2024-12-15 11:39:38', NULL, '2024-12-15', 'cancer', 'cancer', 'cancer', 'cancer', '2024-12-20', 'Doc', ''),
(18, 2, '01:44:00', '12:45:00', NULL, '2024-12-15 11:44:47', '2024-12-15 11:44:47', NULL, '2024-12-05', 'dsadsad', 'dsadsadas', 'dsadsad', 'dsadsadsa', '2024-12-25', 'Doc', ''),
(19, 2, '17:21:00', '22:20:00', NULL, '2024-12-24 17:20:29', '2024-12-24 17:20:29', NULL, '2024-12-09', 'dsadas', 'dsadasd', 'dsadsad', 'xd123', '2024-12-27', 'Doc', '');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `PatientID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `MiddleInitial` varchar(10) NOT NULL,
  `Sex` char(1) DEFAULT NULL CHECK (`Sex` in ('M','F')),
  `DOB` date NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `ContactNumber` varchar(15) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `age` int(11) NOT NULL,
  `civil_status` varchar(20) NOT NULL,
  `emergency_number` varchar(15) NOT NULL,
  `guardian` varchar(50) NOT NULL,
  `height` varchar(10) NOT NULL,
  `weight` varchar(10) NOT NULL,
  `yearLevel` varchar(20) NOT NULL,
  `specialCases` varchar(20) NOT NULL,
  `Program` varchar(20) NOT NULL,
  `Student_Num` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`PatientID`, `FirstName`, `LastName`, `MiddleInitial`, `Sex`, `DOB`, `Address`, `ContactNumber`, `CreatedAt`, `UpdatedAt`, `age`, `civil_status`, `emergency_number`, `guardian`, `height`, `weight`, `yearLevel`, `specialCases`, `Program`, `Student_Num`, `email`) VALUES
(1, 'John', 'Doe', '', 'M', '1990-05-15', '123 Main St', '1234567890', '2024-12-04 15:04:54', '2024-12-21 16:26:03', 0, '', '', '', '', '', '', '', '', '21-14-212', ''),
(2, 'Jane', 'Smith', '', 'F', '1985-03-22', '456 Elm St', '0987654321', '2024-12-04 15:04:54', '2024-12-04 15:04:54', 0, '', '', '', '', '', '', '', '', '', ''),
(15, 'Khen', 'Abesamis', '', 'M', '0000-00-00', '', '9454595720', '2024-12-21 16:30:47', '2024-12-21 16:30:47', 21, 'Single', '', '', '200', '0', '4th Year', '', '', '21-14-001', 'abesamiskheni@gmail.com'),
(16, 'Khen', 'Abesamis', '', 'F', '0000-00-00', '', '9454595720', '2024-12-21 16:32:14', '2024-12-21 16:32:14', 21, 'Single', '', '', '200', '0', '4th Year', '', 'CBA', '21-14-001', 'abesamiskheni@gmail.com'),
(17, 'Linda ', 'Sugg', '', 'M', '0000-00-00', '', '9454595720', '2024-12-21 16:36:51', '2024-12-21 16:36:51', 21, 'Single', '', '', '122', '0', '2nd Year', 'PTB - Complied', 'CBA', '21-14-002', 'khenabesamis@gmail.com'),
(18, 'pusa', 'Lacy', '', 'F', '0000-00-00', '', '9454595720', '2024-12-23 20:39:04', '2024-12-23 20:39:04', 5, 'Single', '', '', '188', '0', '4th Year', 'For APL', 'CAS', '21-14-333', 'khenabesamis@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `patientspecialcases`
--

CREATE TABLE `patientspecialcases` (
  `PatientSpecialCaseID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `CaseID` int(11) NOT NULL,
  `AssignedAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patientspecialcases`
--

INSERT INTO `patientspecialcases` (`PatientSpecialCaseID`, `PatientID`, `CaseID`, `AssignedAt`) VALUES
(5, 1, 1, '2024-12-04 15:13:13'),
(6, 2, 3, '2024-12-04 15:13:13');

-- --------------------------------------------------------

--
-- Table structure for table `specialcases`
--

CREATE TABLE `specialcases` (
  `CaseID` int(11) NOT NULL,
  `CaseName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `specialcases`
--

INSERT INTO `specialcases` (`CaseID`, `CaseName`) VALUES
(1, 'Hepa B'),
(2, 'PWD'),
(3, 'Pregnant');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Role` varchar(30) NOT NULL,
  `CreatedAt` datetime DEFAULT current_timestamp(),
  `UpdatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `FirstName`, `LastName`, `Role`, `CreatedAt`, `UpdatedAt`) VALUES
(1, 'Rei', 'Monik', 'Doctor', '2024-12-04 15:06:15', '2024-12-04 15:06:15'),
(2, 'Larry', 'Kristie', 'Nurse', '2024-12-04 15:06:15', '2024-12-04 15:06:15');

-- --------------------------------------------------------

--
-- Table structure for table `staffaccount`
--

CREATE TABLE `staffaccount` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staffaccount`
--

INSERT INTO `staffaccount` (`id`, `username`, `password`) VALUES
(1, 'staff1', '159263');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consultations`
--
ALTER TABLE `consultations`
  ADD PRIMARY KEY (`ConsultationID`),
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `LastEditedBy` (`LastEditedBy`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`PatientID`);

--
-- Indexes for table `patientspecialcases`
--
ALTER TABLE `patientspecialcases`
  ADD PRIMARY KEY (`PatientSpecialCaseID`),
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `CaseID` (`CaseID`);

--
-- Indexes for table `specialcases`
--
ALTER TABLE `specialcases`
  ADD PRIMARY KEY (`CaseID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indexes for table `staffaccount`
--
ALTER TABLE `staffaccount`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `consultations`
--
ALTER TABLE `consultations`
  MODIFY `ConsultationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `patientspecialcases`
--
ALTER TABLE `patientspecialcases`
  MODIFY `PatientSpecialCaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `specialcases`
--
ALTER TABLE `specialcases`
  MODIFY `CaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staffaccount`
--
ALTER TABLE `staffaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `consultations`
--
ALTER TABLE `consultations`
  ADD CONSTRAINT `consultations_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  ADD CONSTRAINT `consultations_ibfk_2` FOREIGN KEY (`LastEditedBy`) REFERENCES `staff` (`StaffID`);

--
-- Constraints for table `patientspecialcases`
--
ALTER TABLE `patientspecialcases`
  ADD CONSTRAINT `patientspecialcases_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`),
  ADD CONSTRAINT `patientspecialcases_ibfk_2` FOREIGN KEY (`CaseID`) REFERENCES `specialcases` (`CaseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
