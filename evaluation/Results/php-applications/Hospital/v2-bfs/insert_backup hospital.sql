/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.6.2-MariaDB, for osx10.19 (arm64)
--
-- Host: localhost    Database: hms
-- ------------------------------------------------------
-- Server version	10.5.28-MariaDB-ubu2004

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `updationDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES
(1,'admin','Test@12345','30-10-2022 11:42:05 AM');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctorSpecialization` varchar(255) DEFAULT NULL,
  `doctorId` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `consultancyFees` int(11) DEFAULT NULL,
  `appointmentDate` varchar(255) DEFAULT NULL,
  `appointmentTime` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `userStatus` int(11) DEFAULT NULL,
  `doctorStatus` int(11) DEFAULT NULL,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_appointment_doctors` (`doctorId`),
  KEY `fk_appointment_users` (`userId`),
  CONSTRAINT `fk_appointment_doctors` FOREIGN KEY (`doctorId`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_appointment_users` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
INSERT INTO `appointment` VALUES
(1,'ENT',1,1,500,'2022-11-10','12:45 PM','2022-11-06 12:21:48',1,0,'2022-11-06 12:23:35'),
(2,'ENT',1,2,500,'2022-11-17','7:00 PM','2022-11-06 13:16:18',1,1,NULL);
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctors`
--

DROP TABLE IF EXISTS `doctors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specilization` varchar(255) DEFAULT NULL,
  `doctorName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `docFees` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `docEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctors`
--

LOCK TABLES `doctors` WRITE;
/*!40000 ALTER TABLE `doctors` DISABLE KEYS */;
INSERT INTO `doctors` VALUES
(1,'ENT','Anuj kumar','A 123 XYZ Apartment Raj Nagar Ext Ghaziabad','500',142536250,'anujk123@test.com','f925916e2754e5e03f75dd58a5733251','2022-10-30 18:16:52','2022-11-06 13:20:17'),
(2,'Endocrinologists','Charu Dua','X 1212 ABC Apartment Laxmi Nagar New Delhi ','800',1231231230,'charudua12@test.com','f925916e2754e5e03f75dd58a5733251','2022-11-04 01:06:41',NULL);
/*!40000 ALTER TABLE `doctors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorslog`
--

DROP TABLE IF EXISTS `doctorslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctorslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_doctorslog_doctors` (`uid`),
  CONSTRAINT `fk_doctorslog_doctors` FOREIGN KEY (`uid`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctorslog`
--

LOCK TABLES `doctorslog` WRITE;
/*!40000 ALTER TABLE `doctorslog` DISABLE KEYS */;
INSERT INTO `doctorslog` VALUES
(20,NULL,'gfdgdf','::1\0\0\0\0\0\0\0\0\0\0\0\0\0','2022-11-04 01:02:16',NULL,0),
(21,2,'charudua12@test.com','::1\0\0\0\0\0\0\0\0\0\0\0\0\0','2022-11-06 11:59:40','06-11-2022 05:35:18 PM',1),
(22,2,'charudua12@test.com','::1\0\0\0\0\0\0\0\0\0\0\0\0\0','2022-11-06 12:06:37','06-11-2022 05:36:40 PM',1),
(23,2,'charudua12@test.com','::1\0\0\0\0\0\0\0\0\0\0\0\0\0','2022-11-06 12:08:56','06-11-2022 05:42:53 PM',1),
(24,1,'anujk123@test.com','::1\0\0\0\0\0\0\0\0\0\0\0\0\0','2022-11-06 12:23:18','06-11-2022 05:53:40 PM',1),
(25,2,'charudua12@test.com','::1\0\0\0\0\0\0\0\0\0\0\0\0\0','2022-11-06 13:16:53','06-11-2022 06:47:07 PM',1),
(26,1,'anujk123@test.com','::1\0\0\0\0\0\0\0\0\0\0\0\0\0','2022-11-06 13:17:33','06-11-2022 06:50:28 PM',1),
(27,1,'anujk123@test.com','192.168.144.1\0\0\0','2023-03-06 07:32:40','06-03-2023 01:02:48 PM',1),
(28,1,'anujk123@test.com','192.168.144.1\0\0\0','2023-03-06 07:38:07',NULL,1);
/*!40000 ALTER TABLE `doctorslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctorspecilization`
--

DROP TABLE IF EXISTS `doctorspecilization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctorspecilization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `specilization` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctorspecilization`
--

LOCK TABLES `doctorspecilization` WRITE;
/*!40000 ALTER TABLE `doctorspecilization` DISABLE KEYS */;
INSERT INTO `doctorspecilization` VALUES
(1,'Orthopedics','2022-10-30 18:09:46',NULL),
(2,'Internal Medicine','2022-10-30 18:09:57',NULL),
(3,'Obstetrics and Gynecology','2022-10-30 18:10:18',NULL),
(4,'Dermatology','2022-10-30 18:10:28',NULL),
(5,'Pediatrics','2022-10-30 18:10:37',NULL),
(6,'Radiology','2022-10-30 18:10:46',NULL),
(7,'General Surgery','2022-10-30 18:10:56',NULL),
(8,'Ophthalmology','2022-10-30 18:11:03',NULL),
(9,'Anesthesia','2022-10-30 18:11:15',NULL),
(10,'Pathology','2022-10-30 18:11:22',NULL),
(11,'ENT','2022-10-30 18:11:30',NULL),
(12,'Dental Care','2022-10-30 18:11:39',NULL),
(13,'Dermatologists','2022-10-30 18:12:02',NULL),
(14,'Endocrinologists','2022-10-30 18:12:10',NULL),
(15,'Neurologists','2022-10-30 18:12:30',NULL);
/*!40000 ALTER TABLE `doctorspecilization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontactus`
--

DROP TABLE IF EXISTS `tblcontactus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcontactus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(12) DEFAULT NULL,
  `message` mediumtext DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `LastupdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsRead` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontactus`
--

LOCK TABLES `tblcontactus` WRITE;
/*!40000 ALTER TABLE `tblcontactus` DISABLE KEYS */;
INSERT INTO `tblcontactus` VALUES
(1,'Anuj kumar','anujk30@test.com',1425362514,'This is for testing purposes.   This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.This is for testing purposes.','2022-10-30 16:52:03',NULL,NULL,NULL),
(2,'Anuj kumar','ak@gmail.com',1111122233,'This is for testing','2022-11-06 13:13:41','Contact the patient','2022-11-06 13:13:57',1);
/*!40000 ALTER TABLE `tblcontactus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmedicalhistory`
--

DROP TABLE IF EXISTS `tblmedicalhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblmedicalhistory` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PatientID` int(10) DEFAULT NULL,
  `BloodPressure` varchar(200) DEFAULT NULL,
  `BloodSugar` varchar(200) NOT NULL,
  `Weight` varchar(100) DEFAULT NULL,
  `Temperature` varchar(200) DEFAULT NULL,
  `MedicalPres` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `fk_tblmedicalhistory_tblpatient` (`PatientID`),
  CONSTRAINT `fk_tblmedicalhistory_tblpatient` FOREIGN KEY (`PatientID`) REFERENCES `tblpatient` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmedicalhistory`
--

LOCK TABLES `tblmedicalhistory` WRITE;
/*!40000 ALTER TABLE `tblmedicalhistory` DISABLE KEYS */;
INSERT INTO `tblmedicalhistory` VALUES
(1,1,'80/120','120','85','98','Test','2022-11-06 13:19:41');
/*!40000 ALTER TABLE `tblmedicalhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpage`
--

DROP TABLE IF EXISTS `tblpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpage` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `PageType` varchar(200) DEFAULT NULL,
  `PageTitle` varchar(200) DEFAULT NULL,
  `PageDescription` mediumtext DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `UpdationDate` timestamp NULL DEFAULT current_timestamp(),
  `OpenningTime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpage`
--

LOCK TABLES `tblpage` WRITE;
/*!40000 ALTER TABLE `tblpage` DISABLE KEYS */;
INSERT INTO `tblpage` VALUES
(1,'aboutus','About Us','<ul style=\"padding: 0px; margin-right: 0px; margin-bottom: 1.313em; margin-left: 1.655em;\" times=\"\" new=\"\" roman\";=\"\" font-size:=\"\" 14px;=\"\" text-align:=\"\" center;=\"\" background-color:=\"\" rgb(255,=\"\" 246,=\"\" 246);\"=\"\"><li style=\"text-align: left;\"><font color=\"#000000\">The Hospital Management System (HMS) is designed for Any Hospital to replace their existing manual, paper based system. The new system is to control the following information; patient information, room availability, staff and operating room schedules, and patient invoices. These services are to be provided in an efficient, cost effective manner, with the goal of reducing the time and resources currently required for such tasks.</font></li><li style=\"text-align: left;\"><font color=\"#000000\">A significant part of the operation of any hospital involves the acquisition, management and timely retrieval of great volumes of information. This information typically involves; patient personal information and medical history, staff information, room and ward scheduling, staff scheduling, operating theater scheduling and various facilities waiting lists. All of this information must be managed in an efficient and cost wise fashion so that an institution\'s resources may be effectively utilized HMS will automate the management of the hospital making it more efficient and error free. It aims at standardizing data, consolidating data ensuring data integrity and reducing inconsistencies.&nbsp;</font></li></ul>',NULL,NULL,'2020-05-20 07:21:52',NULL),
(2,'contactus','Contact Details','D-204, Hole Town South West, Delhi-110096,India','info@gmail.com',1122334455,'2020-05-20 07:24:07','9 am To 8 Pm');
/*!40000 ALTER TABLE `tblpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpatient`
--

DROP TABLE IF EXISTS `tblpatient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpatient` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `Docid` int(10) DEFAULT NULL,
  `PatientName` varchar(200) DEFAULT NULL,
  `PatientContno` bigint(10) DEFAULT NULL,
  `PatientEmail` varchar(200) DEFAULT NULL,
  `PatientGender` varchar(50) DEFAULT NULL,
  `PatientAdd` mediumtext DEFAULT NULL,
  `PatientAge` int(10) DEFAULT NULL,
  `PatientMedhis` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `fk_tblpatient_doctors` (`Docid`),
  CONSTRAINT `fk_tblpatient_doctors` FOREIGN KEY (`Docid`) REFERENCES `doctors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpatient`
--

LOCK TABLES `tblpatient` WRITE;
/*!40000 ALTER TABLE `tblpatient` DISABLE KEYS */;
INSERT INTO `tblpatient` VALUES
(1,1,'Amit Kumar',1231231230,'amitk@gmail.com','male','New Delhi india',35,'NA','2022-11-06 13:18:31',NULL);
/*!40000 ALTER TABLE `tblpatient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlog`
--

DROP TABLE IF EXISTS `userlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_userlog_users` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlog`
--

LOCK TABLES `userlog` WRITE;
/*!40000 ALTER TABLE `userlog` DISABLE KEYS */;
INSERT INTO `userlog` VALUES
(1,1,'johndoe12@test.com','::1\0\0\0\0\0\0\0\0\0\0\0\0\0','2022-11-06 12:14:11',NULL,1),
(2,1,'johndoe12@test.com','::1\0\0\0\0\0\0\0\0\0\0\0\0\0','2022-11-06 12:21:20','06-11-2022 05:53:00 PM',1),
(3,NULL,'amitk@gmail.com','::1\0\0\0\0\0\0\0\0\0\0\0\0\0','2022-11-06 13:15:43',NULL,0),
(4,2,'amitk@gmail.com','::1\0\0\0\0\0\0\0\0\0\0\0\0\0','2022-11-06 13:15:58','06-11-2022 06:50:46 PM',1),
(5,1,'johndoe12@test.com','192.168.144.1\0\0\0','2023-03-06 07:32:14','06-03-2023 01:02:22 PM',1),
(6,1,'johndoe12@test.com','192.168.144.1\0\0\0','2023-03-06 07:39:07',NULL,1);
/*!40000 ALTER TABLE `userlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullName` varchar(255) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,'John Doe','A 123 ABC Apartment GZB 201017','Ghaziabad','male','johndoe12@test.com','f925916e2754e5e03f75dd58a5733251','2022-11-06 12:13:56',NULL),
(2,'Amit kumar','new Delhi india','New Delhi','male','amitk@gmail.com','f925916e2754e5e03f75dd58a5733251','2022-11-06 13:15:32',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-03-04 18:49:41
