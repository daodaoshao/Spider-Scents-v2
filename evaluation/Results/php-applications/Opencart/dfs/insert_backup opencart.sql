/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.6.2-MariaDB, for osx10.19 (arm64)
--
-- Host: localhost    Database: opencart
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
-- Table structure for table `oc_address`
--

DROP TABLE IF EXISTS `oc_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(60) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `zone_id` int(11) DEFAULT NULL,
  `custom_field` text NOT NULL,
  `default` tinyint(1) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`),
  KEY `country_id` (`country_id`),
  KEY `zone_id` (`zone_id`),
  CONSTRAINT `oc_address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `oc_customer` (`customer_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `oc_address_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `oc_country` (`country_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `oc_address_ibfk_3` FOREIGN KEY (`zone_id`) REFERENCES `oc_zone` (`zone_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_address`
--

LOCK TABLES `oc_address` WRITE;
/*!40000 ALTER TABLE `oc_address` DISABLE KEYS */;
INSERT INTO `oc_address` VALUES
(1,0,'a','a','a','a','a','a','a',0,0,'a',0),
(2,2,'c','c','c','c','c','c','c',2,2,'c',2);
/*!40000 ALTER TABLE `oc_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_address_format`
--

DROP TABLE IF EXISTS `oc_address_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_address_format` (
  `address_format_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `address_format` text NOT NULL,
  PRIMARY KEY (`address_format_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_address_format`
--

LOCK TABLES `oc_address_format` WRITE;
/*!40000 ALTER TABLE `oc_address_format` DISABLE KEYS */;
INSERT INTO `oc_address_format` VALUES
(1,'Address Format','{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}');
/*!40000 ALTER TABLE `oc_address_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_api`
--

DROP TABLE IF EXISTS `oc_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_api`
--

LOCK TABLES `oc_api` WRITE;
/*!40000 ALTER TABLE `oc_api` DISABLE KEYS */;
INSERT INTO `oc_api` VALUES
(1,'Default','cfd42e7a40dea2d96363c99428be8c9b4b4cfee2fabeace16284e23282d9c4a9491464cd0dd468e5dbb54eeb6612b190c2908dc7f3c07d8af9fd1186aeee73928f57248604e75ea8bb70a93b1fe11d863654edd487e63eac260ba616b3b8aa9cc15edde7f1d611b02f0a6f8077a050aedf9182a2f6222b7436f5b82857173b9e',1,'2023-03-01 21:40:34','2023-03-01 21:40:34');
/*!40000 ALTER TABLE `oc_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_api_ip`
--

DROP TABLE IF EXISTS `oc_api_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) DEFAULT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`),
  KEY `api_id` (`api_id`),
  CONSTRAINT `oc_api_ip_ibfk_1` FOREIGN KEY (`api_id`) REFERENCES `oc_api` (`api_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_api_ip`
--

LOCK TABLES `oc_api_ip` WRITE;
/*!40000 ALTER TABLE `oc_api_ip` DISABLE KEYS */;
INSERT INTO `oc_api_ip` VALUES
(1,0,'a'),
(2,2,'c');
/*!40000 ALTER TABLE `oc_api_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_api_session`
--

DROP TABLE IF EXISTS `oc_api_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) DEFAULT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`),
  KEY `api_id` (`api_id`),
  CONSTRAINT `oc_api_session_ibfk_1` FOREIGN KEY (`api_id`) REFERENCES `oc_api` (`api_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_api_session`
--

LOCK TABLES `oc_api_session` WRITE;
/*!40000 ALTER TABLE `oc_api_session` DISABLE KEYS */;
INSERT INTO `oc_api_session` VALUES
(1,0,'a','a','1970-01-01 00:00:01','1970-01-01 00:00:01'),
(2,2,'c','c','1970-01-01 00:00:03','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_api_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_attribute`
--

DROP TABLE IF EXISTS `oc_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`),
  KEY `attribute_group_id` (`attribute_group_id`),
  CONSTRAINT `oc_attribute_ibfk_1` FOREIGN KEY (`attribute_group_id`) REFERENCES `oc_attribute_group` (`attribute_group_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_attribute`
--

LOCK TABLES `oc_attribute` WRITE;
/*!40000 ALTER TABLE `oc_attribute` DISABLE KEYS */;
INSERT INTO `oc_attribute` VALUES
(1,6,1),
(2,6,5),
(3,6,3),
(4,3,1),
(5,3,2),
(6,3,3),
(7,3,4),
(8,3,5),
(9,3,6),
(10,3,7),
(11,3,8);
/*!40000 ALTER TABLE `oc_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_attribute_description`
--

DROP TABLE IF EXISTS `oc_attribute_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_attribute_description`
--

LOCK TABLES `oc_attribute_description` WRITE;
/*!40000 ALTER TABLE `oc_attribute_description` DISABLE KEYS */;
INSERT INTO `oc_attribute_description` VALUES
(1,1,'Description'),
(2,1,'No. of Cores'),
(3,1,'Clockspeed'),
(4,1,'test 1'),
(5,1,'test 2'),
(6,1,'test 3'),
(7,1,'test 4'),
(8,1,'test 5'),
(9,1,'test 6'),
(10,1,'test 7'),
(11,1,'test 8');
/*!40000 ALTER TABLE `oc_attribute_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_attribute_group`
--

DROP TABLE IF EXISTS `oc_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_attribute_group`
--

LOCK TABLES `oc_attribute_group` WRITE;
/*!40000 ALTER TABLE `oc_attribute_group` DISABLE KEYS */;
INSERT INTO `oc_attribute_group` VALUES
(3,2),
(4,1),
(5,3),
(6,4);
/*!40000 ALTER TABLE `oc_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_attribute_group_description`
--

DROP TABLE IF EXISTS `oc_attribute_group_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_attribute_group_description`
--

LOCK TABLES `oc_attribute_group_description` WRITE;
/*!40000 ALTER TABLE `oc_attribute_group_description` DISABLE KEYS */;
INSERT INTO `oc_attribute_group_description` VALUES
(3,1,'Memory'),
(4,1,'Technical'),
(5,1,'Motherboard'),
(6,1,'Processor');
/*!40000 ALTER TABLE `oc_attribute_group_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_banner`
--

DROP TABLE IF EXISTS `oc_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_banner`
--

LOCK TABLES `oc_banner` WRITE;
/*!40000 ALTER TABLE `oc_banner` DISABLE KEYS */;
INSERT INTO `oc_banner` VALUES
(6,'HP Products',1),
(7,'Home Page Slideshow',1),
(8,'Manufacturers',1);
/*!40000 ALTER TABLE `oc_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_banner_image`
--

DROP TABLE IF EXISTS `oc_banner_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`banner_image_id`),
  KEY `banner_id` (`banner_id`),
  KEY `language_id` (`language_id`),
  CONSTRAINT `oc_banner_image_ibfk_1` FOREIGN KEY (`banner_id`) REFERENCES `oc_banner` (`banner_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `oc_banner_image_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `oc_language` (`language_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_banner_image`
--

LOCK TABLES `oc_banner_image` WRITE;
/*!40000 ALTER TABLE `oc_banner_image` DISABLE KEYS */;
INSERT INTO `oc_banner_image` VALUES
(79,7,1,'iPhone 6','index.php?route=product/product&amp;path=57&amp;product_id=49','catalog/demo/banners/iPhone6.jpg',0),
(80,7,1,'MacBookAir','','catalog/demo/banners/MacBookAir.jpg',0),
(87,6,1,'HP Banner','index.php?route=product/manufacturer|info&amp;manufacturer_id=7','catalog/demo/compaq_presario.jpg',0),
(88,8,1,'Harley Davidson','','catalog/demo/manufacturer/harley.png',0),
(89,8,1,'Dell','','catalog/demo/manufacturer/dell.png',0),
(90,8,1,'Disney','','catalog/demo/manufacturer/disney.png',0),
(91,8,1,'Coca Cola','','catalog/demo/manufacturer/cocacola.png',0),
(92,8,1,'Burger King','','catalog/demo/manufacturer/burgerking.png',0),
(93,8,1,'Canon','','catalog/demo/manufacturer/canon.png',0),
(94,8,1,'NFL','','catalog/demo/manufacturer/nfl.png',0),
(95,8,1,'RedBull','','catalog/demo/manufacturer/redbull.png',0),
(96,8,1,'Sony','','catalog/demo/manufacturer/sony.png',0),
(97,8,1,'Starbucks','','catalog/demo/manufacturer/starbucks.png',0),
(98,8,1,'Nintendo','','catalog/demo/manufacturer/nintendo.png',0);
/*!40000 ALTER TABLE `oc_banner_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cart`
--

DROP TABLE IF EXISTS `oc_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `subscription_plan_id` int(11) DEFAULT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`subscription_plan_id`),
  KEY `customer_id` (`customer_id`),
  KEY `product_id` (`product_id`),
  KEY `subscription_plan_id` (`subscription_plan_id`),
  CONSTRAINT `oc_cart_ibfk_1` FOREIGN KEY (`api_id`) REFERENCES `oc_api` (`api_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `oc_cart_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `oc_customer` (`customer_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `oc_cart_ibfk_3` FOREIGN KEY (`product_id`) REFERENCES `oc_product` (`product_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `oc_cart_ibfk_4` FOREIGN KEY (`subscription_plan_id`) REFERENCES `oc_subscription_plan` (`subscription_plan_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cart`
--

LOCK TABLES `oc_cart` WRITE;
/*!40000 ALTER TABLE `oc_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `oc_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_category`
--

DROP TABLE IF EXISTS `oc_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `oc_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `oc_category` (`category_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category`
--

LOCK TABLES `oc_category` WRITE;
/*!40000 ALTER TABLE `oc_category` DISABLE KEYS */;
INSERT INTO `oc_category` VALUES
(17,'',0,1,1,4,1,'2009-01-03 21:08:57','2011-05-30 12:15:11'),
(18,'catalog/demo/hp_2.jpg',0,1,0,2,1,'2009-01-05 21:49:15','2011-05-30 12:13:55'),
(20,'catalog/demo/compaq_presario.jpg',0,1,1,1,1,'2009-01-05 21:49:43','2011-07-16 02:14:42'),
(24,'',0,1,1,5,1,'2009-01-20 02:36:26','2011-05-30 12:15:18'),
(25,'',0,1,1,3,1,'2009-01-31 01:04:25','2011-05-30 12:14:55'),
(26,'',20,0,0,1,1,'2009-01-31 01:55:14','2010-08-22 06:31:45'),
(27,'',20,0,0,2,1,'2009-01-31 01:55:34','2010-08-22 06:32:15'),
(28,'',25,0,0,1,1,'2009-02-02 13:11:12','2010-08-22 06:32:46'),
(29,'',25,0,0,1,1,'2009-02-02 13:11:37','2010-08-22 06:32:39'),
(30,'',25,0,0,1,1,'2009-02-02 13:11:59','2010-08-22 06:33:00'),
(31,'',25,0,0,1,1,'2009-02-03 14:17:24','2010-08-22 06:33:06'),
(32,'',25,0,0,1,1,'2009-02-03 14:17:34','2010-08-22 06:33:12'),
(33,'',0,1,1,6,1,'2009-02-03 14:17:55','2011-05-30 12:15:25'),
(34,'catalog/demo/ipod_touch_4.jpg',0,1,4,7,1,'2009-02-03 14:18:11','2011-05-30 12:15:31'),
(35,'',28,0,0,0,1,'2010-09-17 10:06:48','2010-09-18 14:02:42'),
(36,'',28,0,0,0,1,'2010-09-17 10:07:13','2010-09-18 14:02:55'),
(37,'',34,0,0,0,1,'2010-09-18 14:03:39','2011-04-22 01:55:08'),
(38,'',34,0,0,0,1,'2010-09-18 14:03:51','2010-09-18 14:03:51'),
(39,'',34,0,0,0,1,'2010-09-18 14:04:17','2011-04-22 01:55:20'),
(40,'',34,0,0,0,1,'2010-09-18 14:05:36','2010-09-18 14:05:36'),
(41,'',34,0,0,0,1,'2010-09-18 14:05:49','2011-04-22 01:55:30'),
(42,'',34,0,0,0,1,'2010-09-18 14:06:34','2010-11-07 20:31:04'),
(43,'',34,0,0,0,1,'2010-09-18 14:06:49','2011-04-22 01:55:40'),
(44,'',34,0,0,0,1,'2010-09-21 15:39:21','2010-11-07 20:30:55'),
(45,'',18,0,0,0,1,'2010-09-24 18:29:16','2011-04-26 08:52:11'),
(46,'',18,0,0,0,1,'2010-09-24 18:29:31','2011-04-26 08:52:23'),
(47,'',34,0,0,0,1,'2010-11-07 11:13:16','2010-11-07 11:13:16'),
(48,'',34,0,0,0,1,'2010-11-07 11:13:33','2010-11-07 11:13:33'),
(49,'',34,0,0,0,1,'2010-11-07 11:14:04','2010-11-07 11:14:04'),
(50,'',34,0,0,0,1,'2010-11-07 11:14:23','2011-04-22 01:16:01'),
(51,'',34,0,0,0,1,'2010-11-07 11:14:38','2011-04-22 01:16:13'),
(52,'',34,0,0,0,1,'2010-11-07 11:16:09','2011-04-22 01:54:57'),
(53,'',34,0,0,0,1,'2010-11-07 11:28:53','2011-04-22 01:14:36'),
(54,'',34,0,0,0,1,'2010-11-07 11:29:16','2011-04-22 01:16:50'),
(55,'',34,0,0,0,1,'2010-11-08 10:31:32','2010-11-08 10:31:32'),
(56,'',34,0,0,0,1,'2010-11-08 10:31:50','2011-04-22 01:16:37'),
(57,'',0,1,1,3,1,'2011-04-26 08:53:16','2011-05-30 12:15:05'),
(58,'',52,0,0,0,1,'2011-05-08 13:44:16','2011-05-08 13:44:16');
/*!40000 ALTER TABLE `oc_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_category_description`
--

DROP TABLE IF EXISTS `oc_category_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_description`
--

LOCK TABLES `oc_category_description` WRITE;
/*!40000 ALTER TABLE `oc_category_description` DISABLE KEYS */;
INSERT INTO `oc_category_description` VALUES
(17,1,'Software','','Software','',''),
(18,1,'Laptops &amp; Notebooks','&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n','Laptops &amp; Notebooks','',''),
(20,1,'Desktops','&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n','Desktops','Example of category description',''),
(24,1,'Phones &amp; PDAs','','Phones &amp; PDAs','',''),
(25,1,'Components','','Components','',''),
(26,1,'PC','','PC','',''),
(27,1,'Mac','','Mac','',''),
(28,1,'Monitors','','Monitors','',''),
(29,1,'Mice and Trackballs','','Mice and Trackballs','',''),
(30,1,'Printers','','Printers','',''),
(31,1,'Scanners','','Scanners','',''),
(32,1,'Web Cameras','','Web Cameras','',''),
(33,1,'Cameras','','Cameras','',''),
(34,1,'MP3 Players','&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n','MP3 Players','',''),
(35,1,'test 1','','test 1','',''),
(36,1,'test 2','','test 2','',''),
(37,1,'test 5','','test 5','',''),
(38,1,'test 4','','test 4','',''),
(39,1,'test 6','','test 6','',''),
(40,1,'test 7','','test 7','',''),
(41,1,'test 8','','test 8','',''),
(42,1,'test 9','','test 9','',''),
(43,1,'test 11','','test 11','',''),
(44,1,'test 12','','test 12','',''),
(45,1,'Windows','','Windows','',''),
(46,1,'Macs','','Macs','',''),
(47,1,'test 15','','test 15','',''),
(48,1,'test 16','','test 16','',''),
(49,1,'test 17','','test 17','',''),
(50,1,'test 18','','test 18','',''),
(51,1,'test 19','','test 19','',''),
(52,1,'test 20','','test 20','',''),
(53,1,'test 21','','test 21','',''),
(54,1,'test 22','','test 22','',''),
(55,1,'test 23','','test 23','',''),
(56,1,'test 24','','test 24','',''),
(57,1,'Tablets','','Tablets','',''),
(58,1,'test 25','','test 25','','');
/*!40000 ALTER TABLE `oc_category_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_category_filter`
--

DROP TABLE IF EXISTS `oc_category_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_filter`
--

LOCK TABLES `oc_category_filter` WRITE;
/*!40000 ALTER TABLE `oc_category_filter` DISABLE KEYS */;
INSERT INTO `oc_category_filter` VALUES
(0,0),
(1,1),
(2,2);
/*!40000 ALTER TABLE `oc_category_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_category_path`
--

DROP TABLE IF EXISTS `oc_category_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_path`
--

LOCK TABLES `oc_category_path` WRITE;
/*!40000 ALTER TABLE `oc_category_path` DISABLE KEYS */;
INSERT INTO `oc_category_path` VALUES
(17,17,0),
(18,18,0),
(20,20,0),
(24,24,0),
(25,25,0),
(26,20,0),
(26,26,1),
(27,20,0),
(27,27,1),
(28,25,0),
(28,28,1),
(29,25,0),
(29,29,1),
(30,25,0),
(30,30,1),
(31,25,0),
(31,31,1),
(32,25,0),
(32,32,1),
(33,33,0),
(34,34,0),
(35,25,0),
(35,28,1),
(35,35,2),
(36,25,0),
(36,28,1),
(36,36,2),
(37,34,0),
(37,37,1),
(38,34,0),
(38,38,1),
(39,34,0),
(39,39,1),
(40,34,0),
(40,40,1),
(41,34,0),
(41,41,1),
(42,34,0),
(42,42,1),
(43,34,0),
(43,43,1),
(44,34,0),
(44,44,1),
(45,18,0),
(45,45,1),
(46,18,0),
(46,46,1),
(47,34,0),
(47,47,1),
(48,34,0),
(48,48,1),
(49,34,0),
(49,49,1),
(50,34,0),
(50,50,1),
(51,34,0),
(51,51,1),
(52,34,0),
(52,52,1),
(53,34,0),
(53,53,1),
(54,34,0),
(54,54,1),
(55,34,0),
(55,55,1),
(56,34,0),
(56,56,1),
(57,57,0),
(58,34,0),
(58,52,1),
(58,58,2);
/*!40000 ALTER TABLE `oc_category_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_category_to_layout`
--

DROP TABLE IF EXISTS `oc_category_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_to_layout`
--

LOCK TABLES `oc_category_to_layout` WRITE;
/*!40000 ALTER TABLE `oc_category_to_layout` DISABLE KEYS */;
INSERT INTO `oc_category_to_layout` VALUES
(0,0,0),
(1,1,1),
(2,2,2);
/*!40000 ALTER TABLE `oc_category_to_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_category_to_store`
--

DROP TABLE IF EXISTS `oc_category_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_category_to_store`
--

LOCK TABLES `oc_category_to_store` WRITE;
/*!40000 ALTER TABLE `oc_category_to_store` DISABLE KEYS */;
INSERT INTO `oc_category_to_store` VALUES
(17,0),
(18,0),
(20,0),
(24,0),
(25,0),
(26,0),
(27,0),
(28,0),
(29,0),
(30,0),
(31,0),
(32,0),
(33,0),
(34,0),
(35,0),
(36,0),
(37,0),
(38,0),
(39,0),
(40,0),
(41,0),
(42,0),
(43,0),
(44,0),
(45,0),
(46,0),
(47,0),
(48,0),
(49,0),
(50,0),
(51,0),
(52,0),
(53,0),
(54,0),
(55,0),
(56,0),
(57,0),
(58,0);
/*!40000 ALTER TABLE `oc_category_to_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_country`
--

DROP TABLE IF EXISTS `oc_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format_id` int(11) NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_country`
--

LOCK TABLES `oc_country` WRITE;
/*!40000 ALTER TABLE `oc_country` DISABLE KEYS */;
INSERT INTO `oc_country` VALUES
(1,'Afghanistan','AF','AFG',1,0,1),
(2,'Albania','AL','ALB',1,0,1),
(3,'Algeria','DZ','DZA',1,0,1),
(4,'American Samoa','AS','ASM',1,0,1),
(5,'Andorra','AD','AND',1,0,1),
(6,'Angola','AO','AGO',1,0,1),
(7,'Anguilla','AI','AIA',1,0,1),
(8,'Antarctica','AQ','ATA',1,0,1),
(9,'Antigua and Barbuda','AG','ATG',1,0,1),
(10,'Argentina','AR','ARG',1,0,1),
(11,'Armenia','AM','ARM',1,0,1),
(12,'Aruba','AW','ABW',1,0,1),
(13,'Australia','AU','AUS',1,0,1),
(14,'Austria','AT','AUT',1,0,1),
(15,'Azerbaijan','AZ','AZE',1,0,1),
(16,'Bahamas','BS','BHS',1,0,1),
(17,'Bahrain','BH','BHR',1,0,1),
(18,'Bangladesh','BD','BGD',1,0,1),
(19,'Barbados','BB','BRB',1,0,1),
(20,'Belarus','BY','BLR',1,0,1),
(21,'Belgium','BE','BEL',1,0,1),
(22,'Belize','BZ','BLZ',1,0,1),
(23,'Benin','BJ','BEN',1,0,1),
(24,'Bermuda','BM','BMU',1,0,1),
(25,'Bhutan','BT','BTN',1,0,1),
(26,'Bolivia','BO','BOL',1,0,1),
(27,'Bosnia and Herzegovina','BA','BIH',1,0,1),
(28,'Botswana','BW','BWA',1,0,1),
(29,'Bouvet Island','BV','BVT',1,0,1),
(30,'Brazil','BR','BRA',1,0,1),
(31,'British Indian Ocean Territory','IO','IOT',1,0,1),
(32,'Brunei Darussalam','BN','BRN',1,0,1),
(33,'Bulgaria','BG','BGR',1,0,1),
(34,'Burkina Faso','BF','BFA',1,0,1),
(35,'Burundi','BI','BDI',1,0,1),
(36,'Cambodia','KH','KHM',1,0,1),
(37,'Cameroon','CM','CMR',1,0,1),
(38,'Canada','CA','CAN',1,0,1),
(39,'Cape Verde','CV','CPV',1,0,1),
(40,'Cayman Islands','KY','CYM',1,0,1),
(41,'Central African Republic','CF','CAF',1,0,1),
(42,'Chad','TD','TCD',1,0,1),
(43,'Chile','CL','CHL',1,0,1),
(44,'China','CN','CHN',1,0,1),
(45,'Christmas Island','CX','CXR',1,0,1),
(46,'Cocos (Keeling) Islands','CC','CCK',1,0,1),
(47,'Colombia','CO','COL',1,0,1),
(48,'Comoros','KM','COM',1,0,1),
(49,'Congo','CG','COG',1,0,1),
(50,'Cook Islands','CK','COK',1,0,1),
(51,'Costa Rica','CR','CRI',1,0,1),
(52,'Cote D\'Ivoire','CI','CIV',1,0,1),
(53,'Croatia','HR','HRV',1,0,1),
(54,'Cuba','CU','CUB',1,0,1),
(55,'Cyprus','CY','CYP',1,0,1),
(56,'Czech Republic','CZ','CZE',1,0,1),
(57,'Denmark','DK','DNK',1,0,1),
(58,'Djibouti','DJ','DJI',1,0,1),
(59,'Dominica','DM','DMA',1,0,1),
(60,'Dominican Republic','DO','DOM',1,0,1),
(61,'East Timor','TL','TLS',1,0,1),
(62,'Ecuador','EC','ECU',1,0,1),
(63,'Egypt','EG','EGY',1,0,1),
(64,'El Salvador','SV','SLV',1,0,1),
(65,'Equatorial Guinea','GQ','GNQ',1,0,1),
(66,'Eritrea','ER','ERI',1,0,1),
(67,'Estonia','EE','EST',1,0,1),
(68,'Ethiopia','ET','ETH',1,0,1),
(69,'Falkland Islands (Malvinas)','FK','FLK',1,0,1),
(70,'Faroe Islands','FO','FRO',1,0,1),
(71,'Fiji','FJ','FJI',1,0,1),
(72,'Finland','FI','FIN',1,0,1),
(74,'France, Metropolitan','FR','FRA',1,1,1),
(75,'French Guiana','GF','GUF',1,0,1),
(76,'French Polynesia','PF','PYF',1,0,1),
(77,'French Southern Territories','TF','ATF',1,0,1),
(78,'Gabon','GA','GAB',1,0,1),
(79,'Gambia','GM','GMB',1,0,1),
(80,'Georgia','GE','GEO',1,0,1),
(81,'Germany','DE','DEU',1,1,1),
(82,'Ghana','GH','GHA',1,0,1),
(83,'Gibraltar','GI','GIB',1,0,1),
(84,'Greece','GR','GRC',1,0,1),
(85,'Greenland','GL','GRL',1,0,1),
(86,'Grenada','GD','GRD',1,0,1),
(87,'Guadeloupe','GP','GLP',1,0,1),
(88,'Guam','GU','GUM',1,0,1),
(89,'Guatemala','GT','GTM',1,0,1),
(90,'Guinea','GN','GIN',1,0,1),
(91,'Guinea-Bissau','GW','GNB',1,0,1),
(92,'Guyana','GY','GUY',1,0,1),
(93,'Haiti','HT','HTI',1,0,1),
(94,'Heard and Mc Donald Islands','HM','HMD',1,0,1),
(95,'Honduras','HN','HND',1,0,1),
(96,'Hong Kong','HK','HKG',1,0,1),
(97,'Hungary','HU','HUN',1,0,1),
(98,'Iceland','IS','ISL',1,0,1),
(99,'India','IN','IND',1,0,1),
(100,'Indonesia','ID','IDN',1,0,1),
(101,'Iran (Islamic Republic of)','IR','IRN',1,0,1),
(102,'Iraq','IQ','IRQ',1,0,1),
(103,'Ireland','IE','IRL',1,0,1),
(104,'Israel','IL','ISR',1,0,1),
(105,'Italy','IT','ITA',1,0,1),
(106,'Jamaica','JM','JAM',1,0,1),
(107,'Japan','JP','JPN',1,0,1),
(108,'Jordan','JO','JOR',1,0,1),
(109,'Kazakhstan','KZ','KAZ',1,0,1),
(110,'Kenya','KE','KEN',1,0,1),
(111,'Kiribati','KI','KIR',1,0,1),
(112,'North Korea','KP','PRK',1,0,1),
(113,'South Korea','KR','KOR',1,0,1),
(114,'Kuwait','KW','KWT',1,0,1),
(115,'Kyrgyzstan','KG','KGZ',1,0,1),
(116,'Lao People\'s Democratic Republic','LA','LAO',1,0,1),
(117,'Latvia','LV','LVA',1,0,1),
(118,'Lebanon','LB','LBN',1,0,1),
(119,'Lesotho','LS','LSO',1,0,1),
(120,'Liberia','LR','LBR',1,0,1),
(121,'Libyan Arab Jamahiriya','LY','LBY',1,0,1),
(122,'Liechtenstein','LI','LIE',1,0,1),
(123,'Lithuania','LT','LTU',1,0,1),
(124,'Luxembourg','LU','LUX',1,0,1),
(125,'Macau','MO','MAC',1,0,1),
(126,'FYROM','MK','MKD',1,0,1),
(127,'Madagascar','MG','MDG',1,0,1),
(128,'Malawi','MW','MWI',1,0,1),
(129,'Malaysia','MY','MYS',1,0,1),
(130,'Maldives','MV','MDV',1,0,1),
(131,'Mali','ML','MLI',1,0,1),
(132,'Malta','MT','MLT',1,0,1),
(133,'Marshall Islands','MH','MHL',1,0,1),
(134,'Martinique','MQ','MTQ',1,0,1),
(135,'Mauritania','MR','MRT',1,0,1),
(136,'Mauritius','MU','MUS',1,0,1),
(137,'Mayotte','YT','MYT',1,0,1),
(138,'Mexico','MX','MEX',1,0,1),
(139,'Micronesia, Federated States of','FM','FSM',1,0,1),
(140,'Moldova, Republic of','MD','MDA',1,0,1),
(141,'Monaco','MC','MCO',1,0,1),
(142,'Mongolia','MN','MNG',1,0,1),
(143,'Montserrat','MS','MSR',1,0,1),
(144,'Morocco','MA','MAR',1,0,1),
(145,'Mozambique','MZ','MOZ',1,0,1),
(146,'Myanmar','MM','MMR',1,0,1),
(147,'Namibia','NA','NAM',1,0,1),
(148,'Nauru','NR','NRU',1,0,1),
(149,'Nepal','NP','NPL',1,0,1),
(150,'Netherlands','NL','NLD',1,0,1),
(151,'Netherlands Antilles','AN','ANT',1,0,1),
(152,'New Caledonia','NC','NCL',1,0,1),
(153,'New Zealand','NZ','NZL',1,0,1),
(154,'Nicaragua','NI','NIC',1,0,1),
(155,'Niger','NE','NER',1,0,1),
(156,'Nigeria','NG','NGA',1,0,1),
(157,'Niue','NU','NIU',1,0,1),
(158,'Norfolk Island','NF','NFK',1,0,1),
(159,'Northern Mariana Islands','MP','MNP',1,0,1),
(160,'Norway','NO','NOR',1,0,1),
(161,'Oman','OM','OMN',1,0,1),
(162,'Pakistan','PK','PAK',1,0,1),
(163,'Palau','PW','PLW',1,0,1),
(164,'Panama','PA','PAN',1,0,1),
(165,'Papua New Guinea','PG','PNG',1,0,1),
(166,'Paraguay','PY','PRY',1,0,1),
(167,'Peru','PE','PER',1,0,1),
(168,'Philippines','PH','PHL',1,0,1),
(169,'Pitcairn','PN','PCN',1,0,1),
(170,'Poland','PL','POL',1,0,1),
(171,'Portugal','PT','PRT',1,0,1),
(172,'Puerto Rico','PR','PRI',1,0,1),
(173,'Qatar','QA','QAT',1,0,1),
(174,'Reunion','RE','REU',1,0,1),
(175,'România','RO','ROM',1,0,1),
(176,'Russian Federation','RU','RUS',1,0,1),
(177,'Rwanda','RW','RWA',1,0,1),
(178,'Saint Kitts and Nevis','KN','KNA',1,0,1),
(179,'Saint Lucia','LC','LCA',1,0,1),
(180,'Saint Vincent and the Grenadines','VC','VCT',1,0,1),
(181,'Samoa','WS','WSM',1,0,1),
(182,'San Marino','SM','SMR',1,0,1),
(183,'Sao Tome and Principe','ST','STP',1,0,1),
(184,'Saudi Arabia','SA','SAU',1,0,1),
(185,'Senegal','SN','SEN',1,0,1),
(186,'Seychelles','SC','SYC',1,0,1),
(187,'Sierra Leone','SL','SLE',1,0,1),
(188,'Singapore','SG','SGP',1,0,1),
(189,'Slovak Republic','SK','SVK',1,0,1),
(190,'Slovenia','SI','SVN',1,0,1),
(191,'Solomon Islands','SB','SLB',1,0,1),
(192,'Somalia','SO','SOM',1,0,1),
(193,'South Africa','ZA','ZAF',1,0,1),
(194,'South Georgia &amp; South Sandwich Islands','GS','SGS',1,0,1),
(195,'Spain','ES','ESP',1,0,1),
(196,'Sri Lanka','LK','LKA',1,0,1),
(197,'St. Helena','SH','SHN',1,0,1),
(198,'St. Pierre and Miquelon','PM','SPM',1,0,1),
(199,'Sudan','SD','SDN',1,0,1),
(200,'Suriname','SR','SUR',1,0,1),
(201,'Svalbard and Jan Mayen Islands','SJ','SJM',1,0,1),
(202,'Swaziland','SZ','SWZ',1,0,1),
(203,'Sweden','SE','SWE',1,1,1),
(204,'Switzerland','CH','CHE',1,0,1),
(205,'Syrian Arab Republic','SY','SYR',1,0,1),
(206,'Taiwan','TW','TWN',1,0,1),
(207,'Tajikistan','TJ','TJK',1,0,1),
(208,'Tanzania, United Republic of','TZ','TZA',1,0,1),
(209,'Thailand','TH','THA',1,0,1),
(210,'Togo','TG','TGO',1,0,1),
(211,'Tokelau','TK','TKL',1,0,1),
(212,'Tonga','TO','TON',1,0,1),
(213,'Trinidad and Tobago','TT','TTO',1,0,1),
(214,'Tunisia','TN','TUN',1,0,1),
(215,'Turkey','TR','TUR',1,0,1),
(216,'Turkmenistan','TM','TKM',1,0,1),
(217,'Turks and Caicos Islands','TC','TCA',1,0,1),
(218,'Tuvalu','TV','TUV',1,0,1),
(219,'Uganda','UG','UGA',1,0,1),
(220,'Ukraine','UA','UKR',1,0,1),
(221,'United Arab Emirates','AE','ARE',1,0,1),
(222,'United Kingdom','GB','GBR',1,1,1),
(223,'United States','US','USA',1,0,1),
(224,'United States Minor Outlying Islands','UM','UMI',1,0,1),
(225,'Uruguay','UY','URY',1,0,1),
(226,'Uzbekistan','UZ','UZB',1,0,1),
(227,'Vanuatu','VU','VUT',1,0,1),
(228,'Vatican City State (Holy See)','VA','VAT',1,0,1),
(229,'Venezuela','VE','VEN',1,0,1),
(230,'Viet Nam','VN','VNM',1,0,1),
(231,'Virgin Islands (British)','VG','VGB',1,0,1),
(232,'Virgin Islands (U.S.)','VI','VIR',1,0,1),
(233,'Wallis and Futuna Islands','WF','WLF',1,0,1),
(234,'Western Sahara','EH','ESH',1,0,1),
(235,'Yemen','YE','YEM',1,0,1),
(237,'Democratic Republic of Congo','CD','COD',1,0,1),
(238,'Zambia','ZM','ZMB',1,0,1),
(239,'Zimbabwe','ZW','ZWE',1,0,1),
(242,'Montenegro','ME','MNE',1,0,1),
(243,'Serbia','RS','SRB',1,0,1),
(244,'Aaland Islands','AX','ALA',1,0,1),
(245,'Bonaire, Sint Eustatius and Saba','BQ','BES',1,0,1),
(246,'Curacao','CW','CUW',1,0,1),
(247,'Palestinian Territory, Occupied','PS','PSE',1,0,1),
(248,'South Sudan','SS','SSD',1,0,1),
(249,'St. Barthelemy','BL','BLM',1,0,1),
(250,'St. Martin (French part)','MF','MAF',1,0,1),
(251,'Canary Islands','IC','ICA',1,0,1),
(252,'Ascension Island (British)','AC','ASC',1,0,1),
(253,'Kosovo, Republic of','XK','UNK',1,0,1),
(254,'Isle of Man','IM','IMN',1,0,1),
(255,'Tristan da Cunha','TA','SHN',1,0,1),
(256,'Guernsey','GG','GGY',1,0,1),
(257,'Jersey','JE','JEY',1,0,1);
/*!40000 ALTER TABLE `oc_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_coupon`
--

DROP TABLE IF EXISTS `oc_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_coupon`
--

LOCK TABLES `oc_coupon` WRITE;
/*!40000 ALTER TABLE `oc_coupon` DISABLE KEYS */;
INSERT INTO `oc_coupon` VALUES
(4,'-10% Discount','2222','P',10.0000,0,0,0.0000,'2014-01-01','2020-01-01',10,'10',0,'2009-01-27 13:55:03'),
(5,'Free Shipping','3333','P',0.0000,0,1,100.0000,'2014-01-01','2014-02-01',10,'10',0,'2009-03-14 21:13:53'),
(6,'-10.00 Discount','1111','F',10.0000,0,0,10.0000,'2014-01-01','2020-01-01',100000,'10000',0,'2009-03-14 21:15:18');
/*!40000 ALTER TABLE `oc_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_coupon_category`
--

DROP TABLE IF EXISTS `oc_coupon_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_coupon_category`
--

LOCK TABLES `oc_coupon_category` WRITE;
/*!40000 ALTER TABLE `oc_coupon_category` DISABLE KEYS */;
INSERT INTO `oc_coupon_category` VALUES
(0,0),
(1,1),
(2,2);
/*!40000 ALTER TABLE `oc_coupon_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_coupon_history`
--

DROP TABLE IF EXISTS `oc_coupon_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_coupon_history`
--

LOCK TABLES `oc_coupon_history` WRITE;
/*!40000 ALTER TABLE `oc_coupon_history` DISABLE KEYS */;
INSERT INTO `oc_coupon_history` VALUES
(1,0,0,0,0.0000,'1970-01-01 00:00:01'),
(2,2,2,2,2.0000,'1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_coupon_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_coupon_product`
--

DROP TABLE IF EXISTS `oc_coupon_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_coupon_product`
--

LOCK TABLES `oc_coupon_product` WRITE;
/*!40000 ALTER TABLE `oc_coupon_product` DISABLE KEYS */;
INSERT INTO `oc_coupon_product` VALUES
(1,0,0),
(2,2,2);
/*!40000 ALTER TABLE `oc_coupon_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_cron`
--

DROP TABLE IF EXISTS `oc_cron`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_cron` (
  `cron_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `cycle` varchar(12) NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`cron_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_cron`
--

LOCK TABLES `oc_cron` WRITE;
/*!40000 ALTER TABLE `oc_cron` DISABLE KEYS */;
INSERT INTO `oc_cron` VALUES
(1,'currency','','day','cron/currency',1,'2014-09-25 14:40:00','2014-09-25 14:40:00'),
(2,'gdpr','','day','cron/gdpr',1,'2014-09-25 14:40:00','2014-09-25 14:40:00'),
(3,'subscription','','day','cron/subscription',1,'2014-09-25 14:40:00','2014-09-25 14:40:00');
/*!40000 ALTER TABLE `oc_cron` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_currency`
--

DROP TABLE IF EXISTS `oc_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` double(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_currency`
--

LOCK TABLES `oc_currency` WRITE;
/*!40000 ALTER TABLE `oc_currency` DISABLE KEYS */;
INSERT INTO `oc_currency` VALUES
(1,'Pound Sterling','GBP','£','','2',0.61250001,1,'2014-09-25 14:40:00'),
(2,'US Dollar','USD','$','','2',1.00000000,1,'2014-09-25 14:40:00'),
(3,'Euro','EUR','','€','2',0.78460002,1,'2014-09-25 14:40:00'),
(4,'Hong Kong Dollar','HKD','HK$','','2',7.82224000,0,'2018-02-16 12:00:00'),
(5,'Indian Rupee','INR','₹','','2',64.40000000,0,'2018-02-16 12:00:00'),
(6,'Russian Ruble','RUB','','₽','2',56.40360000,0,'2018-02-16 12:00:00'),
(7,'Chinese Yuan Renminbi','CNY','¥','','2',6.34510000,0,'2018-02-16 12:00:00'),
(8,'Australian Dollar','AUD','$','','2',1.26544000,0,'2018-02-16 12:00:00');
/*!40000 ALTER TABLE `oc_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_custom_field`
--

DROP TABLE IF EXISTS `oc_custom_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field`
--

LOCK TABLES `oc_custom_field` WRITE;
/*!40000 ALTER TABLE `oc_custom_field` DISABLE KEYS */;
INSERT INTO `oc_custom_field` VALUES
(1,'select','','','account',0,1),
(2,'radio','','','account',0,2),
(3,'checkbox','','','account',0,3),
(4,'text','','','account',0,4),
(5,'textarea','','','account',0,5),
(6,'file','','','account',0,6),
(7,'date','','','account',0,7),
(8,'time','','','account',0,8),
(9,'datetime','','','account',0,9),
(11,'checkbox','','','address',0,3),
(12,'time','','','address',0,8),
(13,'date','','','address',0,7),
(14,'datetime','','','address',0,9),
(15,'file','','','address',0,6),
(16,'radio','','','address',0,2),
(17,'select','','','address',0,1),
(18,'text','','','address',0,4),
(19,'textarea','','','address',0,5),
(20,'checkbox','','','affiliate',0,3),
(21,'date','','','affiliate',0,8),
(22,'datetime','','','affiliate',0,9),
(23,'file','','','affiliate',0,6),
(24,'radio','','','affiliate',0,2),
(25,'select','','','affiliate',0,1),
(26,'text','','','affiliate',0,4),
(27,'textarea','','','affiliate',0,5),
(28,'time','','','affiliate',0,8);
/*!40000 ALTER TABLE `oc_custom_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_custom_field_customer_group`
--

DROP TABLE IF EXISTS `oc_custom_field_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field_customer_group`
--

LOCK TABLES `oc_custom_field_customer_group` WRITE;
/*!40000 ALTER TABLE `oc_custom_field_customer_group` DISABLE KEYS */;
INSERT INTO `oc_custom_field_customer_group` VALUES
(1,1,1),
(2,1,1),
(3,1,1),
(4,1,1),
(5,1,1),
(6,1,1),
(7,1,1),
(8,1,1),
(9,1,1),
(11,1,1),
(12,1,1),
(13,1,1),
(14,1,1),
(15,1,1),
(16,1,1),
(17,1,1),
(18,1,1),
(19,1,1),
(20,1,1),
(21,1,1),
(22,1,1),
(23,1,1),
(24,1,1),
(25,1,1),
(26,1,1),
(27,1,1),
(28,1,1);
/*!40000 ALTER TABLE `oc_custom_field_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_custom_field_description`
--

DROP TABLE IF EXISTS `oc_custom_field_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field_description`
--

LOCK TABLES `oc_custom_field_description` WRITE;
/*!40000 ALTER TABLE `oc_custom_field_description` DISABLE KEYS */;
INSERT INTO `oc_custom_field_description` VALUES
(1,1,'Select'),
(2,1,'Radio'),
(3,1,'Checkbox'),
(4,1,'Text'),
(5,1,'Textarea'),
(6,1,'File'),
(7,1,'Date'),
(8,1,'Time'),
(9,1,'Date &amp; Time'),
(11,1,'Checkbox'),
(12,1,'Time'),
(13,1,'Date'),
(14,1,'Date &amp; Time'),
(15,1,'File'),
(16,1,'Radio'),
(17,1,'Select'),
(18,1,'Text'),
(19,1,'Textarea'),
(20,1,'Checkbox'),
(21,1,'Date'),
(22,1,'Date &amp; Time'),
(23,1,'File'),
(24,1,'Radio'),
(25,1,'Select'),
(26,1,'Text'),
(27,1,'Textarea'),
(28,1,'Time');
/*!40000 ALTER TABLE `oc_custom_field_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_custom_field_value`
--

DROP TABLE IF EXISTS `oc_custom_field_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field_value`
--

LOCK TABLES `oc_custom_field_value` WRITE;
/*!40000 ALTER TABLE `oc_custom_field_value` DISABLE KEYS */;
INSERT INTO `oc_custom_field_value` VALUES
(1,1,1),
(2,1,2),
(3,1,3),
(4,2,1),
(5,2,2),
(6,2,3),
(7,3,1),
(8,3,2),
(9,3,3),
(20,11,1),
(21,11,2),
(22,11,3),
(32,16,1),
(33,16,2),
(34,16,3),
(35,17,1),
(36,17,2),
(37,17,3),
(38,20,1),
(39,20,2),
(40,20,3),
(41,24,1),
(42,24,2),
(43,24,3),
(44,25,0),
(45,25,0),
(46,25,0);
/*!40000 ALTER TABLE `oc_custom_field_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_custom_field_value_description`
--

DROP TABLE IF EXISTS `oc_custom_field_value_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_custom_field_value_description`
--

LOCK TABLES `oc_custom_field_value_description` WRITE;
/*!40000 ALTER TABLE `oc_custom_field_value_description` DISABLE KEYS */;
INSERT INTO `oc_custom_field_value_description` VALUES
(1,1,1,'Test 1'),
(2,1,1,'test 2'),
(3,1,1,'Test 3'),
(4,1,2,'Test 1'),
(5,1,2,'Test 2'),
(6,1,2,'Test 3'),
(7,1,3,'Test 1'),
(8,1,3,'Test 2'),
(9,1,3,'Test 3'),
(20,1,11,'Test 1'),
(21,1,11,'Test 2'),
(22,1,11,'Test 3'),
(32,1,16,'Test 1'),
(33,1,16,'Test 2'),
(34,1,16,'Test 3'),
(35,1,17,'Test 1'),
(36,1,17,'Test 2'),
(37,1,17,'Test 3'),
(38,1,20,'Test 1'),
(39,1,20,'Test 2'),
(40,1,20,'Test 3'),
(41,1,24,'Test 1'),
(42,1,24,'Test 2'),
(43,1,24,'Test 3'),
(44,1,25,'Test 1'),
(45,1,25,'Test 2'),
(46,1,25,'Test 3');
/*!40000 ALTER TABLE `oc_custom_field_value_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer`
--

DROP TABLE IF EXISTS `oc_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `custom_field` text NOT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT 0,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer`
--

LOCK TABLES `oc_customer` WRITE;
/*!40000 ALTER TABLE `oc_customer` DISABLE KEYS */;
INSERT INTO `oc_customer` VALUES
(1,0,0,0,'a','a','a','a','a','a',0,'a',0,0,'a','a','1970-01-01 00:00:01'),
(2,2,2,2,'c','c','c','c','c','c',2,'c',2,2,'c','c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_activity`
--

DROP TABLE IF EXISTS `oc_customer_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_activity`
--

LOCK TABLES `oc_customer_activity` WRITE;
/*!40000 ALTER TABLE `oc_customer_activity` DISABLE KEYS */;
INSERT INTO `oc_customer_activity` VALUES
(1,0,'a','a','a','1970-01-01 00:00:01'),
(2,2,'c','c','c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_customer_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_affiliate`
--

DROP TABLE IF EXISTS `oc_customer_affiliate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(60) NOT NULL,
  `website` varchar(255) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT 0.00,
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `custom_field` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_affiliate`
--

LOCK TABLES `oc_customer_affiliate` WRITE;
/*!40000 ALTER TABLE `oc_customer_affiliate` DISABLE KEYS */;
INSERT INTO `oc_customer_affiliate` VALUES
(0,'a','a','a',0.00,'a','a','a','a','a','a','a','a','a','a',0,'1970-01-01 00:00:01'),
(1,'b','b','b',1.00,'b','b','b','b','b','b','b','b','b','b',1,'1970-01-01 00:00:02'),
(2,'c','c','c',2.00,'c','c','c','c','c','c','c','c','c','c',2,'1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_customer_affiliate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_affiliate_report`
--

DROP TABLE IF EXISTS `oc_customer_affiliate_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_affiliate_report` (
  `customer_affiliate_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `country` varchar(2) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_affiliate_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_affiliate_report`
--

LOCK TABLES `oc_customer_affiliate_report` WRITE;
/*!40000 ALTER TABLE `oc_customer_affiliate_report` DISABLE KEYS */;
INSERT INTO `oc_customer_affiliate_report` VALUES
(1,0,0,'a','a','1970-01-01 00:00:01'),
(2,2,2,'c','c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_customer_affiliate_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_approval`
--

DROP TABLE IF EXISTS `oc_customer_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_approval` (
  `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `type` varchar(9) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_approval_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_approval`
--

LOCK TABLES `oc_customer_approval` WRITE;
/*!40000 ALTER TABLE `oc_customer_approval` DISABLE KEYS */;
INSERT INTO `oc_customer_approval` VALUES
(1,0,'a','1970-01-01 00:00:01'),
(2,2,'c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_customer_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_group`
--

DROP TABLE IF EXISTS `oc_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_group`
--

LOCK TABLES `oc_customer_group` WRITE;
/*!40000 ALTER TABLE `oc_customer_group` DISABLE KEYS */;
INSERT INTO `oc_customer_group` VALUES
(1,0,1);
/*!40000 ALTER TABLE `oc_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_group_description`
--

DROP TABLE IF EXISTS `oc_customer_group_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_group_description`
--

LOCK TABLES `oc_customer_group_description` WRITE;
/*!40000 ALTER TABLE `oc_customer_group_description` DISABLE KEYS */;
INSERT INTO `oc_customer_group_description` VALUES
(1,1,'Default','test');
/*!40000 ALTER TABLE `oc_customer_group_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_history`
--

DROP TABLE IF EXISTS `oc_customer_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_history`
--

LOCK TABLES `oc_customer_history` WRITE;
/*!40000 ALTER TABLE `oc_customer_history` DISABLE KEYS */;
INSERT INTO `oc_customer_history` VALUES
(1,0,'a','1970-01-01 00:00:01'),
(2,2,'c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_customer_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_ip`
--

DROP TABLE IF EXISTS `oc_customer_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `country` varchar(2) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_ip`
--

LOCK TABLES `oc_customer_ip` WRITE;
/*!40000 ALTER TABLE `oc_customer_ip` DISABLE KEYS */;
INSERT INTO `oc_customer_ip` VALUES
(1,0,0,'a','a','1970-01-01 00:00:01'),
(2,2,2,'c','c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_customer_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_login`
--

DROP TABLE IF EXISTS `oc_customer_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_login`
--

LOCK TABLES `oc_customer_login` WRITE;
/*!40000 ALTER TABLE `oc_customer_login` DISABLE KEYS */;
INSERT INTO `oc_customer_login` VALUES
(1,'a','a',0,'1970-01-01 00:00:01','1970-01-01 00:00:01'),
(2,'c','c',2,'1970-01-01 00:00:03','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_customer_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_online`
--

DROP TABLE IF EXISTS `oc_customer_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_online`
--

LOCK TABLES `oc_customer_online` WRITE;
/*!40000 ALTER TABLE `oc_customer_online` DISABLE KEYS */;
INSERT INTO `oc_customer_online` VALUES
('a',0,'a','a','1970-01-01 00:00:01'),
('b',1,'b','b','1970-01-01 00:00:02'),
('c',2,'c','c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_customer_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_payment`
--

DROP TABLE IF EXISTS `oc_customer_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_payment` (
  `customer_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `image` varchar(255) NOT NULL,
  `type` varchar(64) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `code` varchar(32) NOT NULL,
  `token` varchar(96) NOT NULL,
  `date_expire` date NOT NULL,
  `default` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_payment_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_payment`
--

LOCK TABLES `oc_customer_payment` WRITE;
/*!40000 ALTER TABLE `oc_customer_payment` DISABLE KEYS */;
INSERT INTO `oc_customer_payment` VALUES
(1,0,'a','a','a','a','a','a','1970-01-01',0,0,'1970-01-01 00:00:01'),
(2,2,'c','c','c','c','c','c','1970-01-01',2,2,'1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_customer_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_reward`
--

DROP TABLE IF EXISTS `oc_customer_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `order_id` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_reward`
--

LOCK TABLES `oc_customer_reward` WRITE;
/*!40000 ALTER TABLE `oc_customer_reward` DISABLE KEYS */;
INSERT INTO `oc_customer_reward` VALUES
(1,0,0,'a',0,'1970-01-01 00:00:01'),
(2,2,2,'c',2,'1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_customer_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_search`
--

DROP TABLE IF EXISTS `oc_customer_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_search_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_search`
--

LOCK TABLES `oc_customer_search` WRITE;
/*!40000 ALTER TABLE `oc_customer_search` DISABLE KEYS */;
INSERT INTO `oc_customer_search` VALUES
(1,0,0,0,'a',0,0,0,0,'a','1970-01-01 00:00:01'),
(2,2,2,2,'c',2,2,2,2,'c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_customer_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_transaction`
--

DROP TABLE IF EXISTS `oc_customer_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_transaction`
--

LOCK TABLES `oc_customer_transaction` WRITE;
/*!40000 ALTER TABLE `oc_customer_transaction` DISABLE KEYS */;
INSERT INTO `oc_customer_transaction` VALUES
(1,0,0,'a',0.0000,'1970-01-01 00:00:01'),
(2,2,2,'c',2.0000,'1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_customer_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_customer_wishlist`
--

DROP TABLE IF EXISTS `oc_customer_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_customer_wishlist`
--

LOCK TABLES `oc_customer_wishlist` WRITE;
/*!40000 ALTER TABLE `oc_customer_wishlist` DISABLE KEYS */;
INSERT INTO `oc_customer_wishlist` VALUES
(0,0,'1970-01-01 00:00:01'),
(1,1,'1970-01-01 00:00:02'),
(2,2,'1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_customer_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_download`
--

DROP TABLE IF EXISTS `oc_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_download`
--

LOCK TABLES `oc_download` WRITE;
/*!40000 ALTER TABLE `oc_download` DISABLE KEYS */;
INSERT INTO `oc_download` VALUES
(1,'a','a','1970-01-01 00:00:01'),
(2,'c','c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_download_description`
--

DROP TABLE IF EXISTS `oc_download_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_download_description`
--

LOCK TABLES `oc_download_description` WRITE;
/*!40000 ALTER TABLE `oc_download_description` DISABLE KEYS */;
INSERT INTO `oc_download_description` VALUES
(0,0,'a'),
(1,1,'b'),
(2,2,'c');
/*!40000 ALTER TABLE `oc_download_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_download_report`
--

DROP TABLE IF EXISTS `oc_download_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_download_report` (
  `download_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `download_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `country` varchar(2) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_download_report`
--

LOCK TABLES `oc_download_report` WRITE;
/*!40000 ALTER TABLE `oc_download_report` DISABLE KEYS */;
INSERT INTO `oc_download_report` VALUES
(1,0,0,'a','a','1970-01-01 00:00:01'),
(2,2,2,'c','c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_download_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_event`
--

DROP TABLE IF EXISTS `oc_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(3) NOT NULL DEFAULT 1,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_event`
--

LOCK TABLES `oc_event` WRITE;
/*!40000 ALTER TABLE `oc_event` DISABLE KEYS */;
INSERT INTO `oc_event` VALUES
(1,'activity_customer_add','','catalog/model/account/customer/addCustomer/after','event/activity|addCustomer',1,1),
(2,'activity_customer_edit','','catalog/model/account/customer/editCustomer/after','event/activity|editCustomer',1,1),
(3,'activity_customer_password','','catalog/model/account/customer/editPassword/after','event/activity|editPassword',1,1),
(4,'activity_customer_forgotten','','catalog/model/account/customer/editCode/after','event/activity|forgotten',1,1),
(5,'activity_customer_login','','catalog/model/account/customer/deleteLoginAttempts/after','event/activity|login',1,1),
(6,'activity_customer_transaction','','catalog/model/account/customer/addTransaction/after','event/activity|addTransaction',1,1),
(7,'activity_address_add','','catalog/model/account/address/addAddress/after','event/activity|addAddress',1,1),
(8,'activity_address_edit','','catalog/model/account/address/editAddress/after','event/activity|editAddress',1,1),
(9,'activity_address_delete','','catalog/model/account/address/deleteAddress/after','event/activity|deleteAddress',1,1),
(10,'activity_affiliate_add','','catalog/model/account/affiliate/addAffiliate/after','event/activity|addAffiliate',1,1),
(11,'activity_affiliate_edit','','catalog/model/account/affiliate/editAffiliate/after','event/activity|editAffiliate',1,1),
(12,'activity_order_add','','catalog/model/checkout/order/addHistory/before','event/activity|addHistory',1,1),
(13,'activity_return_add','','catalog/model/account/returns/addReturn/after','event/activity|addReturn',1,1),
(14,'mail_customer_transaction','','catalog/model/account/customer/addTransaction/after','mail/transaction',1,1),
(15,'mail_customer_forgotten','','catalog/model/account/customer/editCode/after','mail/forgotten',1,1),
(16,'mail_customer_add','','catalog/model/account/customer/addCustomer/after','mail/register',1,1),
(17,'mail_customer_alert','','catalog/model/account/customer/addCustomer/after','mail/register|alert',1,1),
(18,'mail_affiliate_add','','catalog/model/account/affiliate/addAffiliate/after','mail/affiliate',1,1),
(19,'mail_affiliate_alert','','catalog/model/account/affiliate/addAffiliate/after','mail/affiliate|alert',1,1),
(20,'mail_order_alert','','catalog/model/checkout/order/addHistory/before','mail/order|alert',1,1),
(21,'mail_order_add','','catalog/model/checkout/order/addHistory/before','mail/order',1,1),
(22,'mail_gdpr','','catalog/model/account/gdpr/addGdpr/after','mail/gdpr',1,1),
(23,'mail_voucher','','catalog/model/checkout/order/addHistory/after','mail/voucher',1,1),
(24,'mail_review','','catalog/model/catalog/review/addReview/after','mail/review',1,1),
(25,'statistics_review_add','','catalog/model/catalog/review/addReview/after','event/statistics|addReview',1,1),
(26,'statistics_return_add','','catalog/model/account/returns/addReturn/after','event/statistics|addReturn',1,1),
(27,'statistics_return_delete','','admin/model/sale/returns/deleteReturn/after','event/statistics|deleteReturn',1,1),
(28,'statistics_order_history','','catalog/model/checkout/order/addHistory/before','event/statistics|addHistory',1,1),
(29,'subscription','','catalog/model/checkout/subscription/addSubscription/after','mail/subscription',1,1),
(30,'admin_currency_add','','admin/model/localisation/currency/addCurrency/after','event/currency',1,1),
(31,'admin_currency_edit','','admin/model/localisation/currency/editCurrency/after','event/currency',1,1),
(32,'admin_currency_setting','','admin/model/setting/setting/editSetting/after','event/currency',1,1),
(33,'admin_mail_gdpr','','admin/model/customer/gdpr/editStatus/after','mail/gdpr',1,1),
(34,'admin_mail_affiliate_approve','','admin/model/customer/customer_approval/approveAffiliate/after','mail/affiliate|approve',1,1),
(35,'admin_mail_affiliate_deny','','admin/model/customer/customer_approval/denyAffiliate/after','mail/affiliate|deny',1,1),
(36,'admin_mail_customer_approve','','admin/model/customer/customer_approval/approveCustomer/after','mail/customer|approve',1,1),
(37,'admin_mail_customer_deny','','admin/model/customer/customer_approval/denyCustomer/after','mail/customer|deny',1,1),
(38,'admin_mail_customer_transaction','','admin/model/customer/customer/addTransaction/after','mail/transaction',1,1),
(39,'admin_mail_reward','','admin/model/customer/customer/addReward/after','mail/reward',1,1),
(40,'admin_mail_return','','admin/model/sale/returns/addHistory/after','mail/returns',1,1),
(41,'admin_mail_user_forgotten','','admin/model/user/user/editCode/after','mail/forgotten',1,1),
(42,'admin_mail_user_authorize','','admin/controller/common/authorize|send/after','mail/authorize',1,1),
(43,'admin_mail_user_authorize_reset','','admin/model/user/user/editCode/after','mail/authorize|reset',1,1);
/*!40000 ALTER TABLE `oc_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_extension`
--

DROP TABLE IF EXISTS `oc_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(128) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_extension`
--

LOCK TABLES `oc_extension` WRITE;
/*!40000 ALTER TABLE `oc_extension` DISABLE KEYS */;
INSERT INTO `oc_extension` VALUES
(1,'opencart','payment','cod'),
(2,'opencart','total','shipping'),
(3,'opencart','total','sub_total'),
(4,'opencart','total','tax'),
(5,'opencart','total','total'),
(6,'opencart','module','banner'),
(8,'opencart','total','credit'),
(9,'opencart','shipping','flat'),
(10,'opencart','total','handling'),
(11,'opencart','total','low_order_fee'),
(12,'opencart','total','coupon'),
(13,'opencart','module','category'),
(14,'opencart','module','account'),
(15,'opencart','total','reward'),
(16,'opencart','total','voucher'),
(17,'opencart','payment','free_checkout'),
(18,'opencart','module','featured'),
(20,'opencart','theme','basic'),
(21,'opencart','dashboard','activity'),
(22,'opencart','dashboard','sale'),
(23,'opencart','dashboard','recent'),
(24,'opencart','dashboard','order'),
(25,'opencart','dashboard','online'),
(26,'opencart','dashboard','map'),
(27,'opencart','dashboard','customer'),
(28,'opencart','dashboard','chart'),
(29,'opencart','report','sale_coupon'),
(31,'opencart','report','customer_search'),
(32,'opencart','report','customer_transaction'),
(33,'opencart','report','product_purchased'),
(34,'opencart','report','product_viewed'),
(35,'opencart','report','sale_return'),
(36,'opencart','report','sale_order'),
(37,'opencart','report','sale_shipping'),
(38,'opencart','report','sale_tax'),
(39,'opencart','report','customer_activity'),
(40,'opencart','report','customer_order'),
(41,'opencart','report','customer_reward'),
(42,'opencart','currency','ecb'),
(43,'opencart','report','marketing');
/*!40000 ALTER TABLE `oc_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_extension_install`
--

DROP TABLE IF EXISTS `oc_extension_install`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_extension_install` (
  `extension_install_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `extension_download_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`extension_install_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_extension_install`
--

LOCK TABLES `oc_extension_install` WRITE;
/*!40000 ALTER TABLE `oc_extension_install` DISABLE KEYS */;
INSERT INTO `oc_extension_install` VALUES
(1,0,0,'OpenCart Default Extensions','opencart','1.0','OpenCart Ltd','http://www.opencart.com',1,'2020-08-29 15:35:39');
/*!40000 ALTER TABLE `oc_extension_install` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_extension_path`
--

DROP TABLE IF EXISTS `oc_extension_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_extension_path` (
  `extension_path_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`extension_path_id`),
  KEY `path` (`path`)
) ENGINE=InnoDB AUTO_INCREMENT=360 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_extension_path`
--

LOCK TABLES `oc_extension_path` WRITE;
/*!40000 ALTER TABLE `oc_extension_path` DISABLE KEYS */;
INSERT INTO `oc_extension_path` VALUES
(1,1,'opencart'),
(2,1,'opencart/admin'),
(3,1,'opencart/admin/controller'),
(4,1,'opencart/admin/controller/analytics'),
(5,1,'opencart/admin/controller/analytics/index.html'),
(6,1,'opencart/admin/controller/captcha'),
(7,1,'opencart/admin/controller/captcha/basic.php'),
(8,1,'opencart/admin/controller/currency'),
(9,1,'opencart/admin/controller/currency/ecb.php'),
(10,1,'opencart/admin/controller/currency/fixer.php'),
(11,1,'opencart/admin/controller/dashboard'),
(12,1,'opencart/admin/controller/dashboard/activity.php'),
(13,1,'opencart/admin/controller/dashboard/chart.php'),
(14,1,'opencart/admin/controller/dashboard/customer.php'),
(15,1,'opencart/admin/controller/dashboard/map.php'),
(16,1,'opencart/admin/controller/dashboard/online.php'),
(17,1,'opencart/admin/controller/dashboard/order.php'),
(18,1,'opencart/admin/controller/dashboard/recent.php'),
(19,1,'opencart/admin/controller/dashboard/sale.php'),
(20,1,'opencart/admin/controller/feed'),
(21,1,'opencart/admin/controller/feed/index.html'),
(22,1,'opencart/admin/controller/fraud'),
(23,1,'opencart/admin/controller/fraud/ip.php'),
(24,1,'opencart/admin/controller/module'),
(25,1,'opencart/admin/controller/module/account.php'),
(26,1,'opencart/admin/controller/module/banner.php'),
(27,1,'opencart/admin/controller/module/bestseller.php'),
(28,1,'opencart/admin/controller/module/category.php'),
(29,1,'opencart/admin/controller/module/featured.php'),
(30,1,'opencart/admin/controller/module/filter.php'),
(31,1,'opencart/admin/controller/module/html.php'),
(32,1,'opencart/admin/controller/module/information.php'),
(33,1,'opencart/admin/controller/module/latest.php'),
(34,1,'opencart/admin/controller/module/special.php'),
(35,1,'opencart/admin/controller/module/store.php'),
(36,1,'opencart/admin/controller/payment'),
(37,1,'opencart/admin/controller/payment/bank_transfer.php'),
(38,1,'opencart/admin/controller/payment/cheque.php'),
(39,1,'opencart/admin/controller/payment/cod.php'),
(40,1,'opencart/admin/controller/payment/free_checkout.php'),
(41,1,'opencart/admin/controller/report'),
(42,1,'opencart/admin/controller/report/customer_activity.php'),
(43,1,'opencart/admin/controller/report/customer_order.php'),
(44,1,'opencart/admin/controller/report/customer_reward.php'),
(45,1,'opencart/admin/controller/report/customer_search.php'),
(46,1,'opencart/admin/controller/report/customer_transaction.php'),
(47,1,'opencart/admin/controller/report/marketing.php'),
(48,1,'opencart/admin/controller/report/product_purchased.php'),
(49,1,'opencart/admin/controller/report/product_viewed.php'),
(50,1,'opencart/admin/controller/report/sale_coupon.php'),
(51,1,'opencart/admin/controller/report/sale_order.php'),
(52,1,'opencart/admin/controller/report/sale_return.php'),
(53,1,'opencart/admin/controller/report/sale_shipping.php'),
(54,1,'opencart/admin/controller/report/sale_tax.php'),
(55,1,'opencart/admin/controller/shipping'),
(56,1,'opencart/admin/controller/shipping/flat.php'),
(57,1,'opencart/admin/controller/shipping/free.php'),
(58,1,'opencart/admin/controller/shipping/item.php'),
(59,1,'opencart/admin/controller/shipping/pickup.php'),
(60,1,'opencart/admin/controller/shipping/weight.php'),
(61,1,'opencart/admin/controller/theme'),
(62,1,'opencart/admin/controller/theme/basic.php'),
(63,1,'opencart/admin/controller/total'),
(64,1,'opencart/admin/controller/total/coupon.php'),
(65,1,'opencart/admin/controller/total/credit.php'),
(66,1,'opencart/admin/controller/total/handling.php'),
(67,1,'opencart/admin/controller/total/low_order_fee.php'),
(68,1,'opencart/admin/controller/total/reward.php'),
(69,1,'opencart/admin/controller/total/shipping.php'),
(70,1,'opencart/admin/controller/total/sub_total.php'),
(71,1,'opencart/admin/controller/total/tax.php'),
(72,1,'opencart/admin/controller/total/total.php'),
(73,1,'opencart/admin/controller/total/voucher.php'),
(74,1,'opencart/admin/language'),
(75,1,'opencart/admin/language/en-gb'),
(76,1,'opencart/admin/language/en-gb/captcha'),
(77,1,'opencart/admin/language/en-gb/captcha/basic.php'),
(78,1,'opencart/admin/language/en-gb/currency'),
(79,1,'opencart/admin/language/en-gb/currency/ecb.php'),
(80,1,'opencart/admin/language/en-gb/currency/fixer.php'),
(81,1,'opencart/admin/language/en-gb/dashboard'),
(82,1,'opencart/admin/language/en-gb/dashboard/activity.php'),
(83,1,'opencart/admin/language/en-gb/dashboard/chart.php'),
(84,1,'opencart/admin/language/en-gb/dashboard/customer.php'),
(85,1,'opencart/admin/language/en-gb/dashboard/map.php'),
(86,1,'opencart/admin/language/en-gb/dashboard/online.php'),
(87,1,'opencart/admin/language/en-gb/dashboard/order.php'),
(88,1,'opencart/admin/language/en-gb/dashboard/recent.php'),
(89,1,'opencart/admin/language/en-gb/dashboard/sale.php'),
(90,1,'opencart/admin/language/en-gb/fraud'),
(91,1,'opencart/admin/language/en-gb/fraud/ip.php'),
(92,1,'opencart/admin/language/en-gb/module'),
(93,1,'opencart/admin/language/en-gb/module/account.php'),
(94,1,'opencart/admin/language/en-gb/module/banner.php'),
(95,1,'opencart/admin/language/en-gb/module/bestseller.php'),
(96,1,'opencart/admin/language/en-gb/module/category.php'),
(97,1,'opencart/admin/language/en-gb/module/featured.php'),
(98,1,'opencart/admin/language/en-gb/module/filter.php'),
(99,1,'opencart/admin/language/en-gb/module/html.php'),
(100,1,'opencart/admin/language/en-gb/module/information.php'),
(101,1,'opencart/admin/language/en-gb/module/latest.php'),
(102,1,'opencart/admin/language/en-gb/module/special.php'),
(103,1,'opencart/admin/language/en-gb/module/store.php'),
(104,1,'opencart/admin/language/en-gb/payment'),
(105,1,'opencart/admin/language/en-gb/payment/bank_transfer.php'),
(106,1,'opencart/admin/language/en-gb/payment/cheque.php'),
(107,1,'opencart/admin/language/en-gb/payment/cod.php'),
(108,1,'opencart/admin/language/en-gb/payment/free_checkout.php'),
(109,1,'opencart/admin/language/en-gb/report'),
(110,1,'opencart/admin/language/en-gb/report/customer_activity.php'),
(111,1,'opencart/admin/language/en-gb/report/customer_order.php'),
(112,1,'opencart/admin/language/en-gb/report/customer_reward.php'),
(113,1,'opencart/admin/language/en-gb/report/customer_search.php'),
(114,1,'opencart/admin/language/en-gb/report/customer_transaction.php'),
(115,1,'opencart/admin/language/en-gb/report/marketing.php'),
(116,1,'opencart/admin/language/en-gb/report/product_purchased.php'),
(117,1,'opencart/admin/language/en-gb/report/product_viewed.php'),
(118,1,'opencart/admin/language/en-gb/report/sale_coupon.php'),
(119,1,'opencart/admin/language/en-gb/report/sale_order.php'),
(120,1,'opencart/admin/language/en-gb/report/sale_return.php'),
(121,1,'opencart/admin/language/en-gb/report/sale_shipping.php'),
(122,1,'opencart/admin/language/en-gb/report/sale_tax.php'),
(123,1,'opencart/admin/language/en-gb/shipping'),
(124,1,'opencart/admin/language/en-gb/shipping/flat.php'),
(125,1,'opencart/admin/language/en-gb/shipping/free.php'),
(126,1,'opencart/admin/language/en-gb/shipping/item.php'),
(127,1,'opencart/admin/language/en-gb/shipping/pickup.php'),
(128,1,'opencart/admin/language/en-gb/shipping/weight.php'),
(129,1,'opencart/admin/language/en-gb/theme'),
(130,1,'opencart/admin/language/en-gb/theme/basic.php'),
(131,1,'opencart/admin/language/en-gb/total'),
(132,1,'opencart/admin/language/en-gb/total/coupon.php'),
(133,1,'opencart/admin/language/en-gb/total/credit.php'),
(134,1,'opencart/admin/language/en-gb/total/handling.php'),
(135,1,'opencart/admin/language/en-gb/total/low_order_fee.php'),
(136,1,'opencart/admin/language/en-gb/total/reward.php'),
(137,1,'opencart/admin/language/en-gb/total/shipping.php'),
(138,1,'opencart/admin/language/en-gb/total/sub_total.php'),
(139,1,'opencart/admin/language/en-gb/total/tax.php'),
(140,1,'opencart/admin/language/en-gb/total/total.php'),
(141,1,'opencart/admin/language/en-gb/total/voucher.php'),
(142,1,'opencart/admin/model'),
(143,1,'opencart/admin/model/dashboard'),
(144,1,'opencart/admin/model/dashboard/map.php'),
(145,1,'opencart/admin/model/fraud'),
(146,1,'opencart/admin/model/fraud/ip.php'),
(147,1,'opencart/admin/model/payment'),
(148,1,'opencart/admin/model/report'),
(149,1,'opencart/admin/model/report/activity.php'),
(150,1,'opencart/admin/model/report/coupon.php'),
(151,1,'opencart/admin/model/report/customer.php'),
(152,1,'opencart/admin/model/report/customer_transaction.php'),
(153,1,'opencart/admin/model/report/marketing.php'),
(154,1,'opencart/admin/model/report/product.php'),
(155,1,'opencart/admin/model/report/returns.php'),
(156,1,'opencart/admin/model/report/sale.php'),
(157,1,'opencart/admin/view'),
(158,1,'opencart/admin/view/template'),
(159,1,'opencart/admin/view/template/captcha'),
(160,1,'opencart/admin/view/template/captcha/basic.twig'),
(161,1,'opencart/admin/view/template/currency'),
(162,1,'opencart/admin/view/template/currency/ecb.twig'),
(163,1,'opencart/admin/view/template/currency/fixer.twig'),
(164,1,'opencart/admin/view/template/dashboard'),
(165,1,'opencart/admin/view/template/dashboard/activity_form.twig'),
(166,1,'opencart/admin/view/template/dashboard/activity_info.twig'),
(167,1,'opencart/admin/view/template/dashboard/chart_form.twig'),
(168,1,'opencart/admin/view/template/dashboard/chart_info.twig'),
(169,1,'opencart/admin/view/template/dashboard/customer_form.twig'),
(170,1,'opencart/admin/view/template/dashboard/customer_info.twig'),
(171,1,'opencart/admin/view/template/dashboard/map_form.twig'),
(172,1,'opencart/admin/view/template/dashboard/map_info.twig'),
(173,1,'opencart/admin/view/template/dashboard/online_form.twig'),
(174,1,'opencart/admin/view/template/dashboard/online_info.twig'),
(175,1,'opencart/admin/view/template/dashboard/order_form.twig'),
(176,1,'opencart/admin/view/template/dashboard/order_info.twig'),
(177,1,'opencart/admin/view/template/dashboard/recent_form.twig'),
(178,1,'opencart/admin/view/template/dashboard/recent_info.twig'),
(179,1,'opencart/admin/view/template/dashboard/sale_form.twig'),
(180,1,'opencart/admin/view/template/dashboard/sale_info.twig'),
(181,1,'opencart/admin/view/template/fraud'),
(182,1,'opencart/admin/view/template/fraud/ip.twig'),
(183,1,'opencart/admin/view/template/fraud/ip_ip.twig'),
(184,1,'opencart/admin/view/template/module'),
(185,1,'opencart/admin/view/template/module/account.twig'),
(186,1,'opencart/admin/view/template/module/banner.twig'),
(187,1,'opencart/admin/view/template/module/bestseller.twig'),
(188,1,'opencart/admin/view/template/module/category.twig'),
(189,1,'opencart/admin/view/template/module/featured.twig'),
(190,1,'opencart/admin/view/template/module/filter.twig'),
(191,1,'opencart/admin/view/template/module/html.twig'),
(192,1,'opencart/admin/view/template/module/information.twig'),
(193,1,'opencart/admin/view/template/module/latest.twig'),
(194,1,'opencart/admin/view/template/module/special.twig'),
(195,1,'opencart/admin/view/template/module/store.twig'),
(196,1,'opencart/admin/view/template/payment'),
(197,1,'opencart/admin/view/template/payment/bank_transfer.twig'),
(198,1,'opencart/admin/view/template/payment/cheque.twig'),
(199,1,'opencart/admin/view/template/payment/cod.twig'),
(200,1,'opencart/admin/view/template/payment/free_checkout.twig'),
(201,1,'opencart/admin/view/template/report'),
(202,1,'opencart/admin/view/template/report/customer_activity.twig'),
(203,1,'opencart/admin/view/template/report/customer_activity_form.twig'),
(204,1,'opencart/admin/view/template/report/customer_order.twig'),
(205,1,'opencart/admin/view/template/report/customer_order_form.twig'),
(206,1,'opencart/admin/view/template/report/customer_reward.twig'),
(207,1,'opencart/admin/view/template/report/customer_reward_form.twig'),
(208,1,'opencart/admin/view/template/report/customer_search.twig'),
(209,1,'opencart/admin/view/template/report/customer_search_form.twig'),
(210,1,'opencart/admin/view/template/report/customer_transaction.twig'),
(211,1,'opencart/admin/view/template/report/customer_transaction_form.twig'),
(212,1,'opencart/admin/view/template/report/marketing.twig'),
(213,1,'opencart/admin/view/template/report/marketing_form.twig'),
(214,1,'opencart/admin/view/template/report/product_purchased.twig'),
(215,1,'opencart/admin/view/template/report/product_purchased_form.twig'),
(216,1,'opencart/admin/view/template/report/product_viewed.twig'),
(217,1,'opencart/admin/view/template/report/product_viewed_form.twig'),
(218,1,'opencart/admin/view/template/report/sale_coupon.twig'),
(219,1,'opencart/admin/view/template/report/sale_coupon_form.twig'),
(220,1,'opencart/admin/view/template/report/sale_order.twig'),
(221,1,'opencart/admin/view/template/report/sale_order_form.twig'),
(222,1,'opencart/admin/view/template/report/sale_return.twig'),
(223,1,'opencart/admin/view/template/report/sale_return_form.twig'),
(224,1,'opencart/admin/view/template/report/sale_shipping.twig'),
(225,1,'opencart/admin/view/template/report/sale_shipping_form.twig'),
(226,1,'opencart/admin/view/template/report/sale_tax.twig'),
(227,1,'opencart/admin/view/template/report/sale_tax_form.twig'),
(228,1,'opencart/admin/view/template/shipping'),
(229,1,'opencart/admin/view/template/shipping/flat.twig'),
(230,1,'opencart/admin/view/template/shipping/free.twig'),
(231,1,'opencart/admin/view/template/shipping/item.twig'),
(232,1,'opencart/admin/view/template/shipping/pickup.twig'),
(233,1,'opencart/admin/view/template/shipping/weight.twig'),
(234,1,'opencart/admin/view/template/theme'),
(235,1,'opencart/admin/view/template/theme/basic.twig'),
(236,1,'opencart/admin/view/template/total'),
(237,1,'opencart/admin/view/template/total/coupon.twig'),
(238,1,'opencart/admin/view/template/total/credit.twig'),
(239,1,'opencart/admin/view/template/total/handling.twig'),
(240,1,'opencart/admin/view/template/total/low_order_fee.twig'),
(241,1,'opencart/admin/view/template/total/reward.twig'),
(242,1,'opencart/admin/view/template/total/shipping.twig'),
(243,1,'opencart/admin/view/template/total/sub_total.twig'),
(244,1,'opencart/admin/view/template/total/tax.twig'),
(245,1,'opencart/admin/view/template/total/total.twig'),
(246,1,'opencart/admin/view/template/total/voucher.twig'),
(247,1,'opencart/catalog'),
(248,1,'opencart/catalog/controller'),
(249,1,'opencart/catalog/controller/captcha'),
(250,1,'opencart/catalog/controller/captcha/basic.php'),
(251,1,'opencart/catalog/controller/module'),
(252,1,'opencart/catalog/controller/module/account.php'),
(253,1,'opencart/catalog/controller/module/banner.php'),
(254,1,'opencart/catalog/controller/module/bestseller.php'),
(255,1,'opencart/catalog/controller/module/category.php'),
(256,1,'opencart/catalog/controller/module/featured.php'),
(257,1,'opencart/catalog/controller/module/filter.php'),
(258,1,'opencart/catalog/controller/module/html.php'),
(259,1,'opencart/catalog/controller/module/information.php'),
(260,1,'opencart/catalog/controller/module/latest.php'),
(261,1,'opencart/catalog/controller/module/special.php'),
(262,1,'opencart/catalog/controller/module/store.php'),
(263,1,'opencart/catalog/controller/payment'),
(264,1,'opencart/catalog/controller/payment/bank_transfer.php'),
(265,1,'opencart/catalog/controller/payment/cheque.php'),
(266,1,'opencart/catalog/controller/payment/cod.php'),
(267,1,'opencart/catalog/controller/payment/free_checkout.php'),
(268,1,'opencart/catalog/controller/total'),
(269,1,'opencart/catalog/controller/total/coupon.php'),
(270,1,'opencart/catalog/controller/total/reward.php'),
(271,1,'opencart/catalog/controller/total/shipping.php'),
(272,1,'opencart/catalog/controller/total/voucher.php'),
(273,1,'opencart/catalog/language'),
(274,1,'opencart/catalog/language/en-gb'),
(275,1,'opencart/catalog/language/en-gb/captcha'),
(276,1,'opencart/catalog/language/en-gb/captcha/basic.php'),
(277,1,'opencart/catalog/language/en-gb/module'),
(278,1,'opencart/catalog/language/en-gb/module/account.php'),
(279,1,'opencart/catalog/language/en-gb/module/bestseller.php'),
(280,1,'opencart/catalog/language/en-gb/module/category.php'),
(281,1,'opencart/catalog/language/en-gb/module/featured.php'),
(282,1,'opencart/catalog/language/en-gb/module/filter.php'),
(283,1,'opencart/catalog/language/en-gb/module/information.php'),
(284,1,'opencart/catalog/language/en-gb/module/latest.php'),
(285,1,'opencart/catalog/language/en-gb/module/special.php'),
(286,1,'opencart/catalog/language/en-gb/module/store.php'),
(287,1,'opencart/catalog/language/en-gb/payment'),
(288,1,'opencart/catalog/language/en-gb/payment/bank_transfer.php'),
(289,1,'opencart/catalog/language/en-gb/payment/cheque.php'),
(290,1,'opencart/catalog/language/en-gb/payment/cod.php'),
(291,1,'opencart/catalog/language/en-gb/payment/free_checkout.php'),
(292,1,'opencart/catalog/language/en-gb/shipping'),
(293,1,'opencart/catalog/language/en-gb/shipping/flat.php'),
(294,1,'opencart/catalog/language/en-gb/shipping/free.php'),
(295,1,'opencart/catalog/language/en-gb/shipping/item.php'),
(296,1,'opencart/catalog/language/en-gb/shipping/pickup.php'),
(297,1,'opencart/catalog/language/en-gb/shipping/weight.php'),
(298,1,'opencart/catalog/language/en-gb/total'),
(299,1,'opencart/catalog/language/en-gb/total/coupon.php'),
(300,1,'opencart/catalog/language/en-gb/total/credit.php'),
(301,1,'opencart/catalog/language/en-gb/total/handling.php'),
(302,1,'opencart/catalog/language/en-gb/total/low_order_fee.php'),
(303,1,'opencart/catalog/language/en-gb/total/reward.php'),
(304,1,'opencart/catalog/language/en-gb/total/shipping.php'),
(305,1,'opencart/catalog/language/en-gb/total/sub_total.php'),
(306,1,'opencart/catalog/language/en-gb/total/total.php'),
(307,1,'opencart/catalog/language/en-gb/total/voucher.php'),
(308,1,'opencart/catalog/model'),
(309,1,'opencart/catalog/model/fraud'),
(310,1,'opencart/catalog/model/fraud/ip.php'),
(311,1,'opencart/catalog/model/payment'),
(312,1,'opencart/catalog/model/payment/bank_transfer.php'),
(313,1,'opencart/catalog/model/payment/cheque.php'),
(314,1,'opencart/catalog/model/payment/cod.php'),
(315,1,'opencart/catalog/model/payment/free_checkout.php'),
(316,1,'opencart/catalog/model/shipping'),
(317,1,'opencart/catalog/model/shipping/flat.php'),
(318,1,'opencart/catalog/model/shipping/free.php'),
(319,1,'opencart/catalog/model/shipping/item.php'),
(320,1,'opencart/catalog/model/shipping/pickup.php'),
(321,1,'opencart/catalog/model/shipping/weight.php'),
(322,1,'opencart/catalog/model/total'),
(323,1,'opencart/catalog/model/total/coupon.php'),
(324,1,'opencart/catalog/model/total/credit.php'),
(325,1,'opencart/catalog/model/total/handling.php'),
(326,1,'opencart/catalog/model/total/low_order_fee.php'),
(327,1,'opencart/catalog/model/total/reward.php'),
(328,1,'opencart/catalog/model/total/shipping.php'),
(329,1,'opencart/catalog/model/total/sub_total.php'),
(330,1,'opencart/catalog/model/total/tax.php'),
(331,1,'opencart/catalog/model/total/total.php'),
(332,1,'opencart/catalog/model/total/voucher.php'),
(333,1,'opencart/catalog/view'),
(334,1,'opencart/catalog/view/template'),
(335,1,'opencart/catalog/view/template/captcha'),
(336,1,'opencart/catalog/view/template/captcha/basic.twig'),
(337,1,'opencart/catalog/view/template/module'),
(338,1,'opencart/catalog/view/template/module/account.twig'),
(339,1,'opencart/catalog/view/template/module/banner.twig'),
(340,1,'opencart/catalog/view/template/module/bestseller.twig'),
(341,1,'opencart/catalog/view/template/module/category.twig'),
(342,1,'opencart/catalog/view/template/module/featured.twig'),
(343,1,'opencart/catalog/view/template/module/filter.twig'),
(344,1,'opencart/catalog/view/template/module/html.twig'),
(345,1,'opencart/catalog/view/template/module/information.twig'),
(346,1,'opencart/catalog/view/template/module/latest.twig'),
(347,1,'opencart/catalog/view/template/module/special.twig'),
(348,1,'opencart/catalog/view/template/module/store.twig'),
(349,1,'opencart/catalog/view/template/payment'),
(350,1,'opencart/catalog/view/template/payment/bank_transfer.twig'),
(351,1,'opencart/catalog/view/template/payment/cheque.twig'),
(352,1,'opencart/catalog/view/template/payment/cod.twig'),
(353,1,'opencart/catalog/view/template/payment/free_checkout.twig'),
(354,1,'opencart/catalog/view/template/total'),
(355,1,'opencart/catalog/view/template/total/coupon.twig'),
(356,1,'opencart/catalog/view/template/total/reward.twig'),
(357,1,'opencart/catalog/view/template/total/shipping.twig'),
(358,1,'opencart/catalog/view/template/total/voucher.twig'),
(359,1,'opencart/install.json');
/*!40000 ALTER TABLE `oc_extension_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filter`
--

DROP TABLE IF EXISTS `oc_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filter`
--

LOCK TABLES `oc_filter` WRITE;
/*!40000 ALTER TABLE `oc_filter` DISABLE KEYS */;
INSERT INTO `oc_filter` VALUES
(1,0,0),
(2,2,2);
/*!40000 ALTER TABLE `oc_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filter_description`
--

DROP TABLE IF EXISTS `oc_filter_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filter_description`
--

LOCK TABLES `oc_filter_description` WRITE;
/*!40000 ALTER TABLE `oc_filter_description` DISABLE KEYS */;
INSERT INTO `oc_filter_description` VALUES
(0,0,0,'a'),
(1,1,1,'b'),
(2,2,2,'c');
/*!40000 ALTER TABLE `oc_filter_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filter_group`
--

DROP TABLE IF EXISTS `oc_filter_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filter_group`
--

LOCK TABLES `oc_filter_group` WRITE;
/*!40000 ALTER TABLE `oc_filter_group` DISABLE KEYS */;
INSERT INTO `oc_filter_group` VALUES
(1,0),
(2,2);
/*!40000 ALTER TABLE `oc_filter_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_filter_group_description`
--

DROP TABLE IF EXISTS `oc_filter_group_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_filter_group_description`
--

LOCK TABLES `oc_filter_group_description` WRITE;
/*!40000 ALTER TABLE `oc_filter_group_description` DISABLE KEYS */;
INSERT INTO `oc_filter_group_description` VALUES
(0,0,'a'),
(1,1,'b'),
(2,2,'c');
/*!40000 ALTER TABLE `oc_filter_group_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_gdpr`
--

DROP TABLE IF EXISTS `oc_gdpr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_gdpr` (
  `gdpr_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `code` varchar(40) NOT NULL,
  `email` varchar(96) NOT NULL,
  `action` varchar(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`gdpr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_gdpr`
--

LOCK TABLES `oc_gdpr` WRITE;
/*!40000 ALTER TABLE `oc_gdpr` DISABLE KEYS */;
INSERT INTO `oc_gdpr` VALUES
(1,0,0,'a','a','a',0,'1970-01-01 00:00:01'),
(2,2,2,'c','c','c',2,'1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_gdpr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_geo_zone`
--

DROP TABLE IF EXISTS `oc_geo_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_geo_zone`
--

LOCK TABLES `oc_geo_zone` WRITE;
/*!40000 ALTER TABLE `oc_geo_zone` DISABLE KEYS */;
INSERT INTO `oc_geo_zone` VALUES
(3,'UK VAT Zone','UK VAT','2009-01-06 23:26:25','2010-02-26 22:33:24'),
(4,'UK Shipping','UK Shipping Zones','2009-06-23 01:14:53','2010-12-15 15:18:13');
/*!40000 ALTER TABLE `oc_geo_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_information`
--

DROP TABLE IF EXISTS `oc_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT 0,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_information`
--

LOCK TABLES `oc_information` WRITE;
/*!40000 ALTER TABLE `oc_information` DISABLE KEYS */;
INSERT INTO `oc_information` VALUES
(1,1,3,1),
(2,1,1,1),
(3,1,4,1),
(4,1,2,1);
/*!40000 ALTER TABLE `oc_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_information_description`
--

DROP TABLE IF EXISTS `oc_information_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_information_description`
--

LOCK TABLES `oc_information_description` WRITE;
/*!40000 ALTER TABLE `oc_information_description` DISABLE KEYS */;
INSERT INTO `oc_information_description` VALUES
(1,1,'About Us','&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n','About Us','',''),
(2,1,'Terms &amp; Conditions','&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n','Terms &amp; Conditions','',''),
(3,1,'Privacy Policy','&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n','Privacy Policy','',''),
(4,1,'Delivery Information','&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n','Delivery Information','','');
/*!40000 ALTER TABLE `oc_information_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_information_to_layout`
--

DROP TABLE IF EXISTS `oc_information_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_information_to_layout`
--

LOCK TABLES `oc_information_to_layout` WRITE;
/*!40000 ALTER TABLE `oc_information_to_layout` DISABLE KEYS */;
INSERT INTO `oc_information_to_layout` VALUES
(0,0,0),
(1,1,1),
(2,2,2);
/*!40000 ALTER TABLE `oc_information_to_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_information_to_store`
--

DROP TABLE IF EXISTS `oc_information_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_information_to_store`
--

LOCK TABLES `oc_information_to_store` WRITE;
/*!40000 ALTER TABLE `oc_information_to_store` DISABLE KEYS */;
INSERT INTO `oc_information_to_store` VALUES
(1,0),
(2,0),
(3,0),
(4,0);
/*!40000 ALTER TABLE `oc_information_to_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_language`
--

DROP TABLE IF EXISTS `oc_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_language`
--

LOCK TABLES `oc_language` WRITE;
/*!40000 ALTER TABLE `oc_language` DISABLE KEYS */;
INSERT INTO `oc_language` VALUES
(1,'English','en-gb','en-gb,en','',1,1);
/*!40000 ALTER TABLE `oc_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_layout`
--

DROP TABLE IF EXISTS `oc_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_layout`
--

LOCK TABLES `oc_layout` WRITE;
/*!40000 ALTER TABLE `oc_layout` DISABLE KEYS */;
INSERT INTO `oc_layout` VALUES
(1,'Home'),
(2,'Product'),
(3,'Category'),
(4,'Default'),
(5,'Manufacturer'),
(6,'Account'),
(7,'Checkout'),
(8,'Contact'),
(9,'Sitemap'),
(10,'Affiliate'),
(11,'Information'),
(12,'Compare'),
(13,'Search');
/*!40000 ALTER TABLE `oc_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_layout_module`
--

DROP TABLE IF EXISTS `oc_layout_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_layout_module`
--

LOCK TABLES `oc_layout_module` WRITE;
/*!40000 ALTER TABLE `oc_layout_module` DISABLE KEYS */;
INSERT INTO `oc_layout_module` VALUES
(1,10,'opencart.account','column_right',1),
(2,6,'opencart.account','column_right',1),
(3,1,'opencart.banner.3','content_top',1),
(4,1,'opencart.featured.2','content_top',2),
(5,1,'opencart.banner.4','content_bottom',1),
(6,3,'opencart.category','column_left',1),
(7,3,'opencart.banner.1','column_left',2);
/*!40000 ALTER TABLE `oc_layout_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_layout_route`
--

DROP TABLE IF EXISTS `oc_layout_route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_layout_route`
--

LOCK TABLES `oc_layout_route` WRITE;
/*!40000 ALTER TABLE `oc_layout_route` DISABLE KEYS */;
INSERT INTO `oc_layout_route` VALUES
(1,6,0,'account/%'),
(2,6,0,'information/gdpr'),
(3,10,0,'affiliate/%'),
(4,3,0,'product/category'),
(5,1,0,'common/home'),
(6,2,0,'product/product'),
(7,11,0,'information/information'),
(8,7,0,'checkout/%'),
(9,8,0,'information/contact'),
(10,9,0,'information/sitemap'),
(11,4,0,''),
(12,5,0,'product/manufacturer'),
(13,12,0,'product/compare'),
(14,13,0,'product/search');
/*!40000 ALTER TABLE `oc_layout_route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_length_class`
--

DROP TABLE IF EXISTS `oc_length_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_length_class`
--

LOCK TABLES `oc_length_class` WRITE;
/*!40000 ALTER TABLE `oc_length_class` DISABLE KEYS */;
INSERT INTO `oc_length_class` VALUES
(1,1.00000000),
(2,10.00000000),
(3,0.39370000);
/*!40000 ALTER TABLE `oc_length_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_length_class_description`
--

DROP TABLE IF EXISTS `oc_length_class_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_length_class_description`
--

LOCK TABLES `oc_length_class_description` WRITE;
/*!40000 ALTER TABLE `oc_length_class_description` DISABLE KEYS */;
INSERT INTO `oc_length_class_description` VALUES
(1,1,'Centimeter','cm'),
(2,1,'Millimeter','mm'),
(3,1,'Inch','in');
/*!40000 ALTER TABLE `oc_length_class_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_location`
--

DROP TABLE IF EXISTS `oc_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) NOT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_location`
--

LOCK TABLES `oc_location` WRITE;
/*!40000 ALTER TABLE `oc_location` DISABLE KEYS */;
INSERT INTO `oc_location` VALUES
(1,'a','a','a','a','a','a','a'),
(2,'c','c','c','c','c','c','c');
/*!40000 ALTER TABLE `oc_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_manufacturer`
--

DROP TABLE IF EXISTS `oc_manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_manufacturer`
--

LOCK TABLES `oc_manufacturer` WRITE;
/*!40000 ALTER TABLE `oc_manufacturer` DISABLE KEYS */;
INSERT INTO `oc_manufacturer` VALUES
(5,'HTC','catalog/demo/htc_logo.jpg',0),
(6,'Palm','catalog/demo/palm_logo.jpg',0),
(7,'Hewlett-Packard','catalog/demo/hp_logo.jpg',0),
(8,'Apple','catalog/demo/apple_logo.jpg',0),
(9,'Canon','catalog/demo/canon_logo.jpg',0),
(10,'Sony','catalog/demo/sony_logo.jpg',0);
/*!40000 ALTER TABLE `oc_manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_manufacturer_to_layout`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_manufacturer_to_layout` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_manufacturer_to_layout`
--

LOCK TABLES `oc_manufacturer_to_layout` WRITE;
/*!40000 ALTER TABLE `oc_manufacturer_to_layout` DISABLE KEYS */;
INSERT INTO `oc_manufacturer_to_layout` VALUES
(0,0,0),
(1,1,1),
(2,2,2);
/*!40000 ALTER TABLE `oc_manufacturer_to_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_manufacturer_to_store`
--

DROP TABLE IF EXISTS `oc_manufacturer_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_manufacturer_to_store`
--

LOCK TABLES `oc_manufacturer_to_store` WRITE;
/*!40000 ALTER TABLE `oc_manufacturer_to_store` DISABLE KEYS */;
INSERT INTO `oc_manufacturer_to_store` VALUES
(5,0),
(6,0),
(7,0),
(8,0),
(9,0),
(10,0);
/*!40000 ALTER TABLE `oc_manufacturer_to_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_marketing`
--

DROP TABLE IF EXISTS `oc_marketing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_marketing`
--

LOCK TABLES `oc_marketing` WRITE;
/*!40000 ALTER TABLE `oc_marketing` DISABLE KEYS */;
INSERT INTO `oc_marketing` VALUES
(1,'a','a','a',0,'1970-01-01 00:00:01'),
(2,'c','c','c',2,'1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_marketing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_marketing_report`
--

DROP TABLE IF EXISTS `oc_marketing_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_marketing_report` (
  `marketing_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `marketing_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `country` varchar(2) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_marketing_report`
--

LOCK TABLES `oc_marketing_report` WRITE;
/*!40000 ALTER TABLE `oc_marketing_report` DISABLE KEYS */;
INSERT INTO `oc_marketing_report` VALUES
(1,0,0,'a','a','1970-01-01 00:00:01'),
(2,2,2,'c','c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_marketing_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_module`
--

DROP TABLE IF EXISTS `oc_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_module`
--

LOCK TABLES `oc_module` WRITE;
/*!40000 ALTER TABLE `oc_module` DISABLE KEYS */;
INSERT INTO `oc_module` VALUES
(1,'Category Banner','opencart.banner','{\"name\":\"Category Banner\",\"banner_id\":\"6\",\"effect\":\"fade\",\"items\":\"1\",\"controls\":\"0\",\"indicators\":\"0\",\"interval\":\"5000\",\"width\":\"200\",\"height\":\"180\",\"status\":\"1\"}'),
(2,'Featured','opencart.featured','{\"name\":\"Featured\",\"product_name\":\"\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"axis\":\"horizontal\",\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(3,'Homepage Slideshow','opencart.banner','{\"name\":\"Homepage Slideshow\",\"banner_id\":\"7\",\"effect\":\"slide\",\"items\":\"1\",\"controls\":\"1\",\"indicators\":\"1\",\"interval\":\"5000\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}'),
(4,'Homepage Manufacturers','opencart.banner','{\"name\":\"Homepage Manufacturers\",\"banner_id\":\"8\",\"effect\":\"slide\",\"items\":\"5\",\"controls\":\"1\",\"indicators\":\"1\",\"interval\":\"5000\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}');
/*!40000 ALTER TABLE `oc_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_notification`
--

DROP TABLE IF EXISTS `oc_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `status` tinyint(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_notification`
--

LOCK TABLES `oc_notification` WRITE;
/*!40000 ALTER TABLE `oc_notification` DISABLE KEYS */;
INSERT INTO `oc_notification` VALUES
(1,'a','a',0,'1970-01-01 00:00:01'),
(2,'c','c',2,'1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_option`
--

DROP TABLE IF EXISTS `oc_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_option`
--

LOCK TABLES `oc_option` WRITE;
/*!40000 ALTER TABLE `oc_option` DISABLE KEYS */;
INSERT INTO `oc_option` VALUES
(1,'radio',1),
(2,'checkbox',2),
(4,'text',3),
(5,'select',4),
(6,'textarea',5),
(7,'file',6),
(8,'date',7),
(9,'time',8),
(10,'datetime',9),
(11,'select',10),
(12,'date',11);
/*!40000 ALTER TABLE `oc_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_option_description`
--

DROP TABLE IF EXISTS `oc_option_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_option_description`
--

LOCK TABLES `oc_option_description` WRITE;
/*!40000 ALTER TABLE `oc_option_description` DISABLE KEYS */;
INSERT INTO `oc_option_description` VALUES
(1,1,'Radio'),
(2,1,'Checkbox'),
(4,1,'Text'),
(5,1,'Select'),
(6,1,'Textarea'),
(7,1,'File'),
(8,1,'Date'),
(9,1,'Time'),
(10,1,'Date &amp; Time'),
(11,1,'Size'),
(12,1,'Delivery Date');
/*!40000 ALTER TABLE `oc_option_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_option_value`
--

DROP TABLE IF EXISTS `oc_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_option_value`
--

LOCK TABLES `oc_option_value` WRITE;
/*!40000 ALTER TABLE `oc_option_value` DISABLE KEYS */;
INSERT INTO `oc_option_value` VALUES
(23,2,'',1),
(24,2,'',2),
(31,1,'',2),
(32,1,'',1),
(39,5,'',1),
(40,5,'',2),
(41,5,'',3),
(42,5,'',4),
(43,1,'',3),
(44,2,'',3),
(45,2,'',4),
(46,11,'',1),
(47,11,'',2),
(48,11,'',3);
/*!40000 ALTER TABLE `oc_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_option_value_description`
--

DROP TABLE IF EXISTS `oc_option_value_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_option_value_description`
--

LOCK TABLES `oc_option_value_description` WRITE;
/*!40000 ALTER TABLE `oc_option_value_description` DISABLE KEYS */;
INSERT INTO `oc_option_value_description` VALUES
(23,1,2,'Checkbox 1'),
(24,1,2,'Checkbox 2'),
(31,1,1,'Medium'),
(32,1,1,'Small'),
(39,1,5,'Red'),
(40,1,5,'Blue'),
(41,1,5,'Green'),
(42,1,5,'Yellow'),
(43,1,1,'Large'),
(44,1,2,'Checkbox 3'),
(45,1,2,'Checkbox 4'),
(46,1,11,'Small'),
(47,1,11,'Medium'),
(48,1,11,'Large');
/*!40000 ALTER TABLE `oc_option_value_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order`
--

DROP TABLE IF EXISTS `oc_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(100) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT 0,
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) NOT NULL DEFAULT 0,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(60) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `order_status_id` int(11) NOT NULL DEFAULT 0,
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `language_code` varchar(5) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT 1.00000000,
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order`
--

LOCK TABLES `oc_order` WRITE;
/*!40000 ALTER TABLE `oc_order` DISABLE KEYS */;
INSERT INTO `oc_order` VALUES
(1,'a',0,'a',0,'a','a',0,0,'a','a','a','a','a','a','a','a','a','a','a','a','a',0,'a',0,'a','a','a','a','a','a','a','a','a','a','a','a',0,'a',0,'a','a','a','a','a',0.0000,0,0,0.0000,0,'a',0,'a',0,'a',0.00000000,'a','a','a','a','1970-01-01 00:00:01','1970-01-01 00:00:01'),
(2,'c',2,'c',2,'c','c',2,2,'c','c','c','c','c','c','c','c','c','c','c','c','c',2,'c',2,'c','c','c','c','c','c','c','c','c','c','c','c',2,'c',2,'c','c','c','c','c',2.0000,2,2,2.0000,2,'c',2,'c',2,'c',2.00000000,'c','c','c','c','1970-01-01 00:00:03','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order_history`
--

DROP TABLE IF EXISTS `oc_order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_history`
--

LOCK TABLES `oc_order_history` WRITE;
/*!40000 ALTER TABLE `oc_order_history` DISABLE KEYS */;
INSERT INTO `oc_order_history` VALUES
(1,0,0,0,'a','1970-01-01 00:00:01'),
(2,2,2,2,'c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order_option`
--

DROP TABLE IF EXISTS `oc_order_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_option`
--

LOCK TABLES `oc_order_option` WRITE;
/*!40000 ALTER TABLE `oc_order_option` DISABLE KEYS */;
INSERT INTO `oc_order_option` VALUES
(1,0,0,0,0,'a','a','a'),
(2,2,2,2,2,'c','c','c');
/*!40000 ALTER TABLE `oc_order_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order_product`
--

DROP TABLE IF EXISTS `oc_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `master_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `tax` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_product`
--

LOCK TABLES `oc_order_product` WRITE;
/*!40000 ALTER TABLE `oc_order_product` DISABLE KEYS */;
INSERT INTO `oc_order_product` VALUES
(1,0,0,0,'a','a',0,0.0000,0.0000,0.0000,0),
(2,2,2,2,'c','c',2,2.0000,2.0000,2.0000,2);
/*!40000 ALTER TABLE `oc_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order_status`
--

DROP TABLE IF EXISTS `oc_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_status`
--

LOCK TABLES `oc_order_status` WRITE;
/*!40000 ALTER TABLE `oc_order_status` DISABLE KEYS */;
INSERT INTO `oc_order_status` VALUES
(1,1,'Pending'),
(2,1,'Processing'),
(3,1,'Shipped'),
(5,1,'Complete'),
(7,1,'Canceled'),
(8,1,'Denied'),
(9,1,'Canceled Reversal'),
(10,1,'Failed'),
(11,1,'Refunded'),
(12,1,'Reversed'),
(13,1,'Chargeback'),
(14,1,'Expired'),
(15,1,'Processed'),
(16,1,'Voided');
/*!40000 ALTER TABLE `oc_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order_total`
--

DROP TABLE IF EXISTS `oc_order_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_total`
--

LOCK TABLES `oc_order_total` WRITE;
/*!40000 ALTER TABLE `oc_order_total` DISABLE KEYS */;
INSERT INTO `oc_order_total` VALUES
(1,0,'a','a','a',0.0000,0),
(2,2,'c','c','c',2.0000,2);
/*!40000 ALTER TABLE `oc_order_total` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_order_voucher`
--

DROP TABLE IF EXISTS `oc_order_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_order_voucher`
--

LOCK TABLES `oc_order_voucher` WRITE;
/*!40000 ALTER TABLE `oc_order_voucher` DISABLE KEYS */;
INSERT INTO `oc_order_voucher` VALUES
(1,0,0,'a','a','a','a','a','a',0,'a',0.0000),
(2,2,2,'c','c','c','c','c','c',2,'c',2.0000);
/*!40000 ALTER TABLE `oc_order_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product`
--

DROP TABLE IF EXISTS `oc_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `master_id` int(11) NOT NULL DEFAULT 0,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `variant` text NOT NULL DEFAULT '',
  `override` text NOT NULL DEFAULT '',
  `quantity` int(4) NOT NULL DEFAULT 0,
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `points` int(8) NOT NULL DEFAULT 0,
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `weight_class_id` int(11) NOT NULL DEFAULT 0,
  `length` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `width` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `height` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  `length_class_id` int(11) NOT NULL DEFAULT 0,
  `subtract` tinyint(1) NOT NULL DEFAULT 1,
  `minimum` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product`
--

LOCK TABLES `oc_product` WRITE;
/*!40000 ALTER TABLE `oc_product` DISABLE KEYS */;
INSERT INTO `oc_product` VALUES
(28,0,'Product 1','','','','','','','','','',939,7,'catalog/demo/htc_touch_hd_1.jpg',5,1,100.0000,200,9,'2009-02-03',146.40000000,2,0.00000000,0.00000000,0.00000000,1,1,1,0,1,'2009-02-03 16:06:50','2011-09-30 01:05:39'),
(29,0,'Product 2','','','','','','','','','',999,6,'catalog/demo/palm_treo_pro_1.jpg',6,1,279.9900,0,9,'2009-02-03',133.00000000,2,0.00000000,0.00000000,0.00000000,3,1,1,0,1,'2009-02-03 16:42:17','2011-09-30 01:06:08'),
(30,0,'Product 3','','','','','','','','','',7,6,'catalog/demo/canon_eos_5d_1.jpg',9,1,100.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,'2009-02-03 16:59:00','2011-09-30 01:05:23'),
(31,0,'Product 4','','','','','','','','','',1000,6,'catalog/demo/nikon_d300_1.jpg',0,1,80.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,3,1,1,0,1,'2009-02-03 17:00:10','2011-09-30 01:06:00'),
(32,0,'Product 5','','','','','','','','','',999,6,'catalog/demo/ipod_touch_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,'2009-02-03 17:07:26','2011-09-30 01:07:22'),
(33,0,'Product 6','','','','','','','','','',1000,6,'catalog/demo/samsung_syncmaster_941bw.jpg',0,1,200.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,'2009-02-03 17:08:31','2011-09-30 01:06:29'),
(34,0,'Product 7','','','','','','','','','',1000,6,'catalog/demo/ipod_shuffle_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,'2009-02-03 18:07:54','2011-09-30 01:07:17'),
(35,0,'Product 8','','','','','','','','','',1000,5,'',0,0,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,'2009-02-03 18:08:31','2011-09-30 01:06:17'),
(36,0,'Product 9','','','','','','','','','',994,6,'catalog/demo/ipod_nano_1.jpg',8,0,100.0000,100,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,'2009-02-03 18:09:19','2011-09-30 01:07:12'),
(40,0,'product 11','','','','','','','','','',970,5,'catalog/demo/iphone_1.jpg',8,1,101.0000,0,9,'2009-02-03',10.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,'2009-02-03 21:07:12','2011-09-30 01:06:53'),
(41,0,'Product 14','','','','','','','','','',977,5,'catalog/demo/imac_1.jpg',8,1,100.0000,0,9,'2009-02-03',5.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,0,1,'2009-02-03 21:07:26','2011-09-30 01:06:44'),
(42,0,'Product 15','','','','','','','','','',990,5,'catalog/demo/apple_cinema_30.jpg',8,1,100.0000,400,9,'2009-02-04',12.50000000,1,1.00000000,2.00000000,3.00000000,1,1,2,0,1,'2009-02-03 21:07:37','2011-09-30 00:46:19'),
(43,0,'Product 16','','','','','','','','','',929,5,'catalog/demo/macbook_1.jpg',8,0,500.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,'2009-02-03 21:07:49','2011-09-30 01:05:46'),
(44,0,'Product 17','','','','','','','','','',1000,5,'catalog/demo/macbook_air_1.jpg',8,1,1000.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,'2009-02-03 21:08:00','2011-09-30 01:05:53'),
(45,0,'Product 18','','','','','','','','','',998,5,'catalog/demo/macbook_pro_1.jpg',8,1,2000.0000,0,100,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,'2009-02-03 21:08:17','2011-09-15 22:22:01'),
(46,0,'Product 19','','','','','','','','','',1000,5,'catalog/demo/sony_vaio_1.jpg',10,1,1000.0000,0,9,'2009-02-03',0.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,'2009-02-03 21:08:29','2011-09-30 01:06:39'),
(47,0,'Product 21','','','','','','','','','',1000,5,'catalog/demo/hp_1.jpg',7,1,100.0000,400,9,'2009-02-03',1.00000000,1,0.00000000,0.00000000,0.00000000,1,0,1,0,1,'2009-02-03 21:08:40','2011-09-30 01:05:28'),
(48,0,'product 20','test 1','','','','','','test 2','','',995,5,'catalog/demo/ipod_classic_1.jpg',8,1,100.0000,0,9,'2009-02-08',1.00000000,1,0.00000000,0.00000000,0.00000000,2,1,1,0,1,'2009-02-08 17:21:51','2011-09-30 01:07:06'),
(49,0,'SAM1','','','','','','','','','',0,8,'catalog/demo/samsung_tab_1.jpg',0,1,199.9900,0,9,'2011-04-25',0.00000000,1,0.00000000,0.00000000,0.00000000,1,1,1,1,1,'2011-04-26 08:57:34','2011-09-30 01:06:23');
/*!40000 ALTER TABLE `oc_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_attribute`
--

DROP TABLE IF EXISTS `oc_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_attribute`
--

LOCK TABLES `oc_product_attribute` WRITE;
/*!40000 ALTER TABLE `oc_product_attribute` DISABLE KEYS */;
INSERT INTO `oc_product_attribute` VALUES
(42,3,1,'100mhz'),
(43,2,1,'1'),
(43,4,1,'8gb'),
(47,2,1,'4'),
(47,4,1,'16GB');
/*!40000 ALTER TABLE `oc_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_description`
--

DROP TABLE IF EXISTS `oc_product_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_description`
--

LOCK TABLES `oc_product_description` WRITE;
/*!40000 ALTER TABLE `oc_product_description` DISABLE KEYS */;
INSERT INTO `oc_product_description` VALUES
(28,1,'HTC Touch HD','&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','	 HTC Touch HD','',''),
(29,1,'Palm Treo Pro','&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','Palm Treo Pro','',''),
(30,1,'Canon EOS 5D','&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n','','sdf','',''),
(31,1,'Nikon D300','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','Nikon D300','',''),
(32,1,'iPod Touch','&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n','','	 iPod Touch','',''),
(33,1,'Samsung SyncMaster 941BW','&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n','','Samsung SyncMaster 941BW','',''),
(34,1,'iPod Shuffle','&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','iPod Shuffle','',''),
(35,1,'Product 8','&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n','','Product 8','',''),
(36,1,'iPod Nano','&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','iPod Nano','',''),
(40,1,'iPhone','&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n','','iPhone','',''),
(41,1,'iMac','&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n','','iMac','',''),
(42,1,'Apple Cinema 30&quot;','&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n','','Apple Cinema 30','',''),
(43,1,'MacBook','&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n','','MacBook','',''),
(44,1,'MacBook Air','&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n','','MacBook Air','',''),
(45,1,'MacBook Pro','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','MacBook Pro','',''),
(46,1,'Sony VAIO','&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n','','Sony VAIO','',''),
(47,1,'HP LP3065','&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n','','HP LP3065','',''),
(48,1,'iPod Classic','&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;','','iPod Classic','',''),
(49,1,'Samsung Galaxy Tab 10.1','&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n','','Samsung Galaxy Tab 10.1','','');
/*!40000 ALTER TABLE `oc_product_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_discount`
--

DROP TABLE IF EXISTS `oc_product_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT 0,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=441 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_discount`
--

LOCK TABLES `oc_product_discount` WRITE;
/*!40000 ALTER TABLE `oc_product_discount` DISABLE KEYS */;
INSERT INTO `oc_product_discount` VALUES
(438,42,1,10,1,88.0000,'0000-00-00','0000-00-00'),
(439,42,1,20,1,77.0000,'0000-00-00','0000-00-00'),
(440,42,1,30,1,66.0000,'0000-00-00','0000-00-00');
/*!40000 ALTER TABLE `oc_product_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_filter`
--

DROP TABLE IF EXISTS `oc_product_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_filter`
--

LOCK TABLES `oc_product_filter` WRITE;
/*!40000 ALTER TABLE `oc_product_filter` DISABLE KEYS */;
INSERT INTO `oc_product_filter` VALUES
(0,0),
(1,1),
(2,2);
/*!40000 ALTER TABLE `oc_product_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_image`
--

DROP TABLE IF EXISTS `oc_product_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2352 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_image`
--

LOCK TABLES `oc_product_image` WRITE;
/*!40000 ALTER TABLE `oc_product_image` DISABLE KEYS */;
INSERT INTO `oc_product_image` VALUES
(1968,43,'catalog/demo/macbook_3.jpg',0),
(1969,43,'catalog/demo/macbook_2.jpg',0),
(1970,43,'catalog/demo/macbook_4.jpg',0),
(1971,43,'catalog/demo/macbook_5.jpg',0),
(1972,44,'catalog/demo/macbook_air_3.jpg',0),
(1973,44,'catalog/demo/macbook_air_2.jpg',0),
(1974,44,'catalog/demo/macbook_air_4.jpg',0),
(1975,45,'catalog/demo/macbook_pro_4.jpg',0),
(1976,45,'catalog/demo/macbook_pro_3.jpg',0),
(1977,45,'catalog/demo/macbook_pro_2.jpg',0),
(1978,40,'catalog/demo/iphone_4.jpg',0),
(1979,40,'catalog/demo/iphone_3.jpg',0),
(1980,40,'catalog/demo/iphone_5.jpg',0),
(1981,40,'catalog/demo/iphone_2.jpg',0),
(1982,40,'catalog/demo/iphone_6.jpg',0),
(1983,31,'catalog/demo/nikon_d300_5.jpg',0),
(1984,31,'catalog/demo/nikon_d300_4.jpg',0),
(1985,31,'catalog/demo/nikon_d300_2.jpg',0),
(1986,31,'catalog/demo/nikon_d300_3.jpg',0),
(1987,29,'catalog/demo/palm_treo_pro_2.jpg',0),
(1988,29,'catalog/demo/palm_treo_pro_3.jpg',0),
(1989,48,'catalog/demo/ipod_classic_2.jpg',0),
(1990,48,'catalog/demo/ipod_classic_3.jpg',0),
(1991,48,'catalog/demo/ipod_classic_4.jpg',0),
(1992,46,'catalog/demo/sony_vaio_3.jpg',0),
(1993,46,'catalog/demo/sony_vaio_2.jpg',0),
(1994,46,'catalog/demo/sony_vaio_4.jpg',0),
(1995,46,'catalog/demo/sony_vaio_5.jpg',0),
(1998,36,'catalog/demo/ipod_nano_3.jpg',0),
(1999,36,'catalog/demo/ipod_nano_2.jpg',0),
(2000,36,'catalog/demo/ipod_nano_4.jpg',0),
(2001,36,'catalog/demo/ipod_nano_5.jpg',0),
(2002,34,'catalog/demo/ipod_shuffle_3.jpg',0),
(2003,34,'catalog/demo/ipod_shuffle_2.jpg',0),
(2004,34,'catalog/demo/ipod_shuffle_4.jpg',0),
(2005,34,'catalog/demo/ipod_shuffle_5.jpg',0),
(2006,32,'catalog/demo/ipod_touch_4.jpg',0),
(2007,32,'catalog/demo/ipod_touch_3.jpg',0),
(2008,32,'catalog/demo/ipod_touch_2.jpg',0),
(2009,32,'catalog/demo/ipod_touch_5.jpg',0),
(2010,32,'catalog/demo/ipod_touch_6.jpg',0),
(2011,32,'catalog/demo/ipod_touch_7.jpg',0),
(2034,28,'catalog/demo/htc_touch_hd_3.jpg',0),
(2035,28,'catalog/demo/htc_touch_hd_2.jpg',0),
(2313,42,'catalog/demo/canon_eos_5d_2.jpg',0),
(2314,42,'catalog/demo/canon_eos_5d_1.jpg',0),
(2315,42,'catalog/demo/compaq_presario.jpg',0),
(2316,42,'catalog/demo/hp_1.jpg',0),
(2317,42,'catalog/demo/canon_logo.jpg',0),
(2320,47,'catalog/demo/hp_2.jpg',0),
(2321,47,'catalog/demo/hp_3.jpg',0),
(2322,49,'catalog/demo/samsung_tab_2.jpg',0),
(2323,49,'catalog/demo/samsung_tab_3.jpg',0),
(2324,49,'catalog/demo/samsung_tab_4.jpg',0),
(2325,49,'catalog/demo/samsung_tab_5.jpg',0),
(2326,49,'catalog/demo/samsung_tab_6.jpg',0),
(2327,49,'catalog/demo/samsung_tab_7.jpg',0),
(2344,30,'catalog/demo/canon_eos_5d_3.jpg',0),
(2345,30,'catalog/demo/canon_eos_5d_2.jpg',0),
(2350,41,'catalog/demo/imac_2.jpg',0),
(2351,41,'catalog/demo/imac_3.jpg',0);
/*!40000 ALTER TABLE `oc_product_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_option`
--

DROP TABLE IF EXISTS `oc_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_option`
--

LOCK TABLES `oc_product_option` WRITE;
/*!40000 ALTER TABLE `oc_product_option` DISABLE KEYS */;
INSERT INTO `oc_product_option` VALUES
(208,42,4,'test',1),
(209,42,6,'',1),
(217,42,5,'',1),
(218,42,1,'',1),
(219,42,8,'2011-02-20',1),
(220,42,10,'2011-02-20 22:25',1),
(221,42,9,'22:25',1),
(222,42,7,'',1),
(223,42,2,'',1),
(224,35,11,'',1),
(225,47,12,'2011-04-22',1),
(226,30,5,'',1);
/*!40000 ALTER TABLE `oc_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_option_value`
--

DROP TABLE IF EXISTS `oc_product_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_option_value`
--

LOCK TABLES `oc_product_option_value` WRITE;
/*!40000 ALTER TABLE `oc_product_option_value` DISABLE KEYS */;
INSERT INTO `oc_product_option_value` VALUES
(1,217,42,5,41,100,0,1.0000,'+',0,'+',1.00000000,'+'),
(2,217,42,5,42,200,1,2.0000,'+',0,'+',2.00000000,'+'),
(3,217,42,5,40,300,0,3.0000,'+',0,'+',3.00000000,'+'),
(4,217,42,5,39,92,1,4.0000,'+',0,'+',4.00000000,'+'),
(5,218,42,1,32,96,1,10.0000,'+',1,'+',10.00000000,'+'),
(6,218,42,1,31,146,1,20.0000,'+',2,'-',20.00000000,'+'),
(7,218,42,1,43,300,1,30.0000,'+',3,'+',30.00000000,'+'),
(8,223,42,2,23,48,1,10.0000,'+',0,'+',10.00000000,'+'),
(9,223,42,2,24,194,1,20.0000,'+',0,'+',20.00000000,'+'),
(10,223,42,2,44,2696,1,30.0000,'+',0,'+',30.00000000,'+'),
(11,223,42,2,45,3998,1,40.0000,'+',0,'+',40.00000000,'+'),
(12,224,35,11,46,0,1,5.0000,'+',0,'+',0.00000000,'+'),
(13,224,35,11,47,10,1,10.0000,'+',0,'+',0.00000000,'+'),
(14,224,35,11,48,15,1,15.0000,'+',0,'+',0.00000000,'+'),
(15,226,30,5,39,2,1,0.0000,'+',0,'+',0.00000000,'+'),
(16,226,30,5,40,5,1,0.0000,'+',0,'+',0.00000000,'+');
/*!40000 ALTER TABLE `oc_product_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_related`
--

DROP TABLE IF EXISTS `oc_product_related`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_related`
--

LOCK TABLES `oc_product_related` WRITE;
/*!40000 ALTER TABLE `oc_product_related` DISABLE KEYS */;
INSERT INTO `oc_product_related` VALUES
(40,42),
(41,42),
(42,40),
(42,41);
/*!40000 ALTER TABLE `oc_product_related` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_report`
--

DROP TABLE IF EXISTS `oc_product_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_report` (
  `product_report_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(40) NOT NULL,
  `country` varchar(2) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`product_report_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_report`
--

LOCK TABLES `oc_product_report` WRITE;
/*!40000 ALTER TABLE `oc_product_report` DISABLE KEYS */;
INSERT INTO `oc_product_report` VALUES
(1,0,0,'a','a','1970-01-01 00:00:01'),
(2,2,2,'c','c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_product_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_reward`
--

DROP TABLE IF EXISTS `oc_product_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT 0,
  `customer_group_id` int(11) NOT NULL DEFAULT 0,
  `points` int(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_reward_id`)
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_reward`
--

LOCK TABLES `oc_product_reward` WRITE;
/*!40000 ALTER TABLE `oc_product_reward` DISABLE KEYS */;
INSERT INTO `oc_product_reward` VALUES
(329,43,1,600),
(331,44,1,700),
(333,45,1,800),
(335,40,1,0),
(337,31,1,0),
(339,29,1,0),
(343,48,1,0),
(345,33,1,0),
(347,46,1,0),
(351,36,1,0),
(353,34,1,0),
(355,32,1,0),
(379,28,1,400),
(425,35,1,0),
(515,42,1,100),
(519,47,1,300),
(521,49,1,1000),
(539,30,1,200),
(545,41,1,0);
/*!40000 ALTER TABLE `oc_product_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_special`
--

DROP TABLE IF EXISTS `oc_product_special`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1,
  `price` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=440 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_special`
--

LOCK TABLES `oc_product_special` WRITE;
/*!40000 ALTER TABLE `oc_product_special` DISABLE KEYS */;
INSERT INTO `oc_product_special` VALUES
(419,42,1,1,90.0000,'0000-00-00','0000-00-00'),
(438,30,1,1,80.0000,'0000-00-00','0000-00-00'),
(439,30,1,2,90.0000,'0000-00-00','0000-00-00');
/*!40000 ALTER TABLE `oc_product_special` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_subscription`
--

DROP TABLE IF EXISTS `oc_product_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_subscription` (
  `product_id` int(11) NOT NULL,
  `subscription_plan_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`subscription_plan_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_subscription`
--

LOCK TABLES `oc_product_subscription` WRITE;
/*!40000 ALTER TABLE `oc_product_subscription` DISABLE KEYS */;
INSERT INTO `oc_product_subscription` VALUES
(0,0,0),
(1,1,1),
(2,2,2);
/*!40000 ALTER TABLE `oc_product_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_to_category`
--

DROP TABLE IF EXISTS `oc_product_to_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_to_category`
--

LOCK TABLES `oc_product_to_category` WRITE;
/*!40000 ALTER TABLE `oc_product_to_category` DISABLE KEYS */;
INSERT INTO `oc_product_to_category` VALUES
(28,20),
(28,24),
(29,20),
(29,24),
(30,20),
(30,33),
(31,33),
(32,34),
(33,20),
(33,28),
(34,34),
(35,20),
(36,34),
(40,20),
(40,24),
(41,27),
(42,20),
(42,28),
(43,18),
(43,20),
(44,18),
(44,20),
(45,18),
(46,18),
(46,20),
(47,18),
(47,20),
(48,20),
(48,34),
(49,57);
/*!40000 ALTER TABLE `oc_product_to_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_to_download`
--

DROP TABLE IF EXISTS `oc_product_to_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_to_download`
--

LOCK TABLES `oc_product_to_download` WRITE;
/*!40000 ALTER TABLE `oc_product_to_download` DISABLE KEYS */;
INSERT INTO `oc_product_to_download` VALUES
(0,0),
(1,1),
(2,2);
/*!40000 ALTER TABLE `oc_product_to_download` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_to_layout`
--

DROP TABLE IF EXISTS `oc_product_to_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_to_layout`
--

LOCK TABLES `oc_product_to_layout` WRITE;
/*!40000 ALTER TABLE `oc_product_to_layout` DISABLE KEYS */;
INSERT INTO `oc_product_to_layout` VALUES
(0,0,0),
(1,1,1),
(2,2,2);
/*!40000 ALTER TABLE `oc_product_to_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_to_store`
--

DROP TABLE IF EXISTS `oc_product_to_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_to_store`
--

LOCK TABLES `oc_product_to_store` WRITE;
/*!40000 ALTER TABLE `oc_product_to_store` DISABLE KEYS */;
INSERT INTO `oc_product_to_store` VALUES
(28,0),
(29,0),
(30,0),
(31,0),
(32,0),
(33,0),
(34,0),
(35,0),
(36,0),
(40,0),
(41,0),
(42,0),
(43,0),
(44,0),
(45,0),
(46,0),
(47,0),
(48,0),
(49,0);
/*!40000 ALTER TABLE `oc_product_to_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_product_viewed`
--

DROP TABLE IF EXISTS `oc_product_viewed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_product_viewed` (
  `product_id` int(11) NOT NULL,
  `viewed` int(11) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_product_viewed`
--

LOCK TABLES `oc_product_viewed` WRITE;
/*!40000 ALTER TABLE `oc_product_viewed` DISABLE KEYS */;
INSERT INTO `oc_product_viewed` VALUES
(0,0),
(1,1),
(2,2);
/*!40000 ALTER TABLE `oc_product_viewed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_return`
--

DROP TABLE IF EXISTS `oc_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return`
--

LOCK TABLES `oc_return` WRITE;
/*!40000 ALTER TABLE `oc_return` DISABLE KEYS */;
INSERT INTO `oc_return` VALUES
(1,0,0,0,'a','a','a','a','a','a',0,0,0,0,0,'a','1970-01-01','1970-01-01 00:00:01','1970-01-01 00:00:01'),
(2,2,2,2,'c','c','c','c','c','c',2,2,2,2,2,'c','1970-01-01','1970-01-01 00:00:03','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_return_action`
--

DROP TABLE IF EXISTS `oc_return_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return_action`
--

LOCK TABLES `oc_return_action` WRITE;
/*!40000 ALTER TABLE `oc_return_action` DISABLE KEYS */;
INSERT INTO `oc_return_action` VALUES
(1,1,'Refunded'),
(2,1,'Credit Issued'),
(3,1,'Replacement Sent');
/*!40000 ALTER TABLE `oc_return_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_return_history`
--

DROP TABLE IF EXISTS `oc_return_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return_history`
--

LOCK TABLES `oc_return_history` WRITE;
/*!40000 ALTER TABLE `oc_return_history` DISABLE KEYS */;
INSERT INTO `oc_return_history` VALUES
(1,0,0,0,'a','1970-01-01 00:00:01'),
(2,2,2,2,'c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_return_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_return_reason`
--

DROP TABLE IF EXISTS `oc_return_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return_reason`
--

LOCK TABLES `oc_return_reason` WRITE;
/*!40000 ALTER TABLE `oc_return_reason` DISABLE KEYS */;
INSERT INTO `oc_return_reason` VALUES
(1,1,'Dead On Arrival'),
(2,1,'Received Wrong Item'),
(3,1,'Order Error'),
(4,1,'Faulty, please supply details'),
(5,1,'Other, please supply details');
/*!40000 ALTER TABLE `oc_return_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_return_status`
--

DROP TABLE IF EXISTS `oc_return_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_return_status`
--

LOCK TABLES `oc_return_status` WRITE;
/*!40000 ALTER TABLE `oc_return_status` DISABLE KEYS */;
INSERT INTO `oc_return_status` VALUES
(1,1,'Pending'),
(2,1,'Awaiting Products'),
(3,1,'Complete');
/*!40000 ALTER TABLE `oc_return_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_review`
--

DROP TABLE IF EXISTS `oc_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_review`
--

LOCK TABLES `oc_review` WRITE;
/*!40000 ALTER TABLE `oc_review` DISABLE KEYS */;
INSERT INTO `oc_review` VALUES
(1,0,0,'a','a',0,0,'1970-01-01 00:00:01','1970-01-01 00:00:01'),
(2,2,2,'c','c',2,2,'1970-01-01 00:00:03','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_seo_url`
--

DROP TABLE IF EXISTS `oc_seo_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_seo_url` (
  `seo_url_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`seo_url_id`),
  KEY `keyword` (`keyword`),
  KEY `query` (`key`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_seo_url`
--

LOCK TABLES `oc_seo_url` WRITE;
/*!40000 ALTER TABLE `oc_seo_url` DISABLE KEYS */;
INSERT INTO `oc_seo_url` VALUES
(1,0,1,'product_id','47','hp-lp3065',1),
(2,0,1,'product_id','48','ipod-classic',1),
(3,0,1,'product_id','28','htc-touch-hd',1),
(4,0,1,'product_id','43','macbook',1),
(5,0,1,'product_id','44','macbook-air',1),
(6,0,1,'product_id','45','macbook-pro',1),
(7,0,1,'product_id','30','canon-eos-5d',1),
(8,0,1,'product_id','31','nikon-d300',1),
(9,0,1,'product_id','29','palm-treo-pro',1),
(10,0,1,'product_id','35','product-8',1),
(11,0,1,'product_id','49','samsung-galaxy-tab-10-1',1),
(12,0,1,'product_id','33','samsung-syncmaster-941bw',1),
(13,0,1,'product_id','46','sony-vaio',1),
(14,0,1,'product_id','41','imac',1),
(15,0,1,'product_id','40','iphone',1),
(16,0,1,'product_id','36','ipod-nano',1),
(17,0,1,'product_id','34','ipod-shuffle',1),
(18,0,1,'product_id','32','ipod-touch',1),
(19,0,1,'product_id','50','apple-4',1),
(20,0,1,'product_id','42','apple-cinema',1),
(21,0,1,'manufacturer_id','5','htc',0),
(22,0,1,'manufacturer_id','7','hewlett-packard',0),
(23,0,1,'manufacturer_id','6','palm',0),
(24,0,1,'manufacturer_id','10','sony',0),
(25,0,1,'manufacturer_id','9','canon',0),
(26,0,1,'manufacturer_id','8','apple',0),
(27,0,1,'path','30','printer',0),
(28,0,1,'path','20_27','desktops/mac',0),
(29,0,1,'path','20_26','desktops/pc',0),
(30,0,1,'path','25','component',0),
(31,0,1,'path','25_29','component/mouse',0),
(32,0,1,'path','25_33','component/cameras',0),
(33,0,1,'path','25_28','component/monitor',0),
(34,0,1,'path','25_28_35','component/monitor/test-1',0),
(35,0,1,'path','25_28_36','component/monitor/test-2',0),
(36,0,1,'path','25_30','component/printers',0),
(37,0,1,'path','25_31','component/scanner',0),
(38,0,1,'path','25_32','component/web-camera',0),
(39,0,1,'path','20','desktops',0),
(40,0,1,'path','18','laptop-notebook',0),
(41,0,1,'path','18_46','laptop-notebook/macs',0),
(42,0,1,'path','18_45','laptop-notebook/windows',0),
(43,0,1,'path','34','mp3-players',0),
(44,0,1,'path','34_43','mp3-players/test-11',0),
(45,0,1,'path','34_44','mp3-players/test-12',0),
(46,0,1,'path','34_47','mp3-players/test-15',0),
(47,0,1,'path','34_48','mp3-players/test-16',0),
(48,0,1,'path','34_49','mp3-players/test-17',0),
(49,0,1,'path','34_50','mp3-players/test-18',0),
(50,0,1,'path','34_51','mp3-players/test-19',0),
(51,0,1,'path','34_52','mp3-players/test-20',0),
(52,0,1,'path','34_52_58','mp3-players/test-20/test-25',0),
(53,0,1,'path','34_53','mp3-players/test-21',0),
(54,0,1,'path','34_54','mp3-players/test-22',0),
(55,0,1,'path','34_55','mp3-players/test-23',0),
(56,0,1,'path','34_56','mp3-players/test-24',0),
(57,0,1,'path','34_38','mp3-players/test-4',0),
(58,0,1,'path','34_37','mp3-players/test-5',0),
(59,0,1,'path','34_39','mp3-players/test-6',0),
(60,0,1,'path','34_40','mp3-players/test-7',0),
(61,0,1,'path','34_41','mp3-players/test-8',0),
(62,0,1,'path','34_42','mp3-players/test-9',0),
(63,0,1,'path','24','smartphone',0),
(64,0,1,'path','17','software',0),
(65,0,1,'path','57','tablet',0),
(66,0,1,'information_id','1','about-us',0),
(67,0,1,'information_id','2','terms',0),
(68,0,1,'information_id','4','delivery',0),
(69,0,1,'information_id','3','privacy',0),
(70,0,1,'language','en-gb','en-gb',-2),
(71,0,1,'route','information/information|info','info',0),
(72,0,1,'route','information/information','information',-1),
(73,0,1,'route','product/product','product',-1),
(74,0,1,'route','product/category','catalog',-1),
(75,0,1,'route','product/manufacturer','brands',-1);
/*!40000 ALTER TABLE `oc_seo_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_session`
--

DROP TABLE IF EXISTS `oc_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` datetime NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_session`
--

LOCK TABLES `oc_session` WRITE;
/*!40000 ALTER TABLE `oc_session` DISABLE KEYS */;
INSERT INTO `oc_session` VALUES
('00188fdd9e354d4c365ce75ff3','{\"currency\":\"USD\"}','2025-03-24 12:13:08'),
('0047b0173418dae6e83863231a','{\"currency\":\"USD\"}','2025-03-24 12:14:02'),
('007ae03a7e88749590ac6170a7','{\"login_token\":\"1729e2825c8d5526078d2c545f2c0f3b\"}','2025-03-24 12:13:44'),
('00814e899f55570bc25d0a76f7','{\"currency\":\"USD\"}','2025-03-24 12:14:11'),
('00f97ec1a37a9fa8c5671ebdae','{\"login_token\":\"42950b5639b86fdf0621ad8e83cebeb3\"}','2025-03-24 12:13:36'),
('01005fa553c470dafa6e5143b7','{\"currency\":\"USD\"}','2025-03-24 12:13:40'),
('01539aa4b94574cdccb3ff6572','{\"login_token\":\"99d22401ae4167d65c0cdd0cc16cfe78\"}','2025-03-24 12:14:01'),
('017301aefc8d8c4eeae27be8d3','{\"login_token\":\"0493365e442f3c2944ef065f255e4000\"}','2025-03-24 12:14:38'),
('01755320ed6db1d11d6d84151c','{\"login_token\":\"ce827fce5b18331544d556bc1dfb3713\"}','2025-03-24 12:13:35'),
('017cae3caf73afc334136c173c','{\"currency\":\"USD\"}','2025-03-24 12:14:22'),
('018eb1eb1a04dcfd8e3e7c58d9','{\"currency\":\"USD\"}','2025-03-24 12:14:05'),
('0215c04854226c2a29c08f83fb','{\"currency\":\"USD\"}','2025-03-24 12:14:14'),
('022726b7b228b2f8a3e7dd63ee','{\"login_token\":\"907a96b9ed4c8df56a96bbf8fb981f91\"}','2025-03-24 12:14:40'),
('027142796f35b085c6f8db144a','{\"login_token\":\"80a1d1ed04e89c68542dbee10466070b\"}','2025-03-24 12:13:07'),
('028a84facaa6f1b5c37e08d72f','{\"currency\":\"USD\"}','2025-03-24 12:13:30'),
('029b80e3e3e6542f182a5870c7','{\"currency\":\"USD\"}','2025-03-24 12:13:55'),
('02a8d1380a72c51b9a25033055','{\"currency\":\"USD\"}','2025-03-24 12:13:35'),
('02b17be9332bb614396ab3e90b','{\"currency\":\"USD\"}','2025-03-24 12:13:23'),
('02cdec05aba079a4462159888b','{\"currency\":\"USD\"}','2025-03-24 12:12:55'),
('02d2e10f9bfc553eccb0a34e21','{\"login_token\":\"6f08049a10c9783c4e14369b241b9861\"}','2025-03-24 12:12:58'),
('02d9371a30e2c8784038b49fb1','{\"login_token\":\"81285ac9e4fcea6e1f32495a26688bbe\"}','2025-03-24 12:13:46'),
('02fa6b8aba832033b1cccd0fcf','{\"login_token\":\"9e67317b66e508cc9ddab1aa26df8ba1\"}','2025-03-24 12:13:56'),
('034d1f7d48a28579a83e322859','{\"login_token\":\"d0f440da66441d634ecd8cb3da85d119\"}','2025-03-24 12:13:39'),
('03e2467f373b4dbbf906881491','{\"currency\":\"USD\"}','2025-03-24 12:13:08'),
('03f7c5ae268e2b5e4af7562dff','{\"currency\":\"USD\"}','2025-03-24 12:13:03'),
('03fac1f570f0f2842b25f3f85a','{\"login_token\":\"07ef6c69c019edde157fec70b13ba84d\"}','2025-03-24 12:14:23'),
('045a5b83495639f067a988085d','{\"login_token\":\"5bf1c104c474929c293d0b46995d23a1\"}','2025-03-24 12:13:14'),
('046aa9f5e34632595cb28c4a4a','{\"currency\":\"USD\"}','2025-03-24 12:12:59'),
('047bf46c35bc4a26249c64c5ea','{\"login_token\":\"0da20b9894ddc1895bba8ae9d99108df\"}','2025-03-24 12:14:41'),
('047fbe8cdf97227b852680a7d5','{\"login_token\":\"8ea11b28cec4ed59984bdf305f86450d\"}','2025-03-24 12:14:24'),
('04ad764750d3f07d0efcb01979','{\"currency\":\"USD\"}','2025-03-24 12:13:31'),
('04c5a0bdeb065ef3809d7c03d1','{\"login_token\":\"e3e649c3b7fa7a735ac40fb7acd83997\"}','2025-03-24 12:13:50'),
('04df1bc4557221671866a3472d','{\"login_token\":\"416e52837c870ae49fa39b902e49ae17\"}','2025-03-24 12:14:41'),
('04fff592b290efda82b2d7490b','{\"currency\":\"USD\"}','2025-03-24 12:14:25'),
('0549865dbba6bd9558eb2bbccc','{\"currency\":\"USD\"}','2025-03-24 12:14:37'),
('0570b41840bcf808bbd010ccfb','{\"currency\":\"USD\"}','2025-03-24 12:13:12'),
('0589c4aa3ee3c91a206ea9e2fc','{\"currency\":\"USD\"}','2025-03-24 12:14:31'),
('058df08892151ee8f73a5afc3e','{\"currency\":\"USD\"}','2025-03-24 12:13:28'),
('05ca47aa8da33e4ae49307b854','{\"login_token\":\"9a41e8dad08da89c0f258e322db0997d\"}','2025-03-24 12:13:12'),
('05f0b7ec65d4fde7a3e9abb30a','{\"login_token\":\"a8ad3aeb019c22c90592859aac3ceac3\"}','2025-03-24 12:13:31'),
('05fa3fdc4205839fc6d442182d','{\"currency\":\"USD\"}','2025-03-24 12:14:33'),
('0648dd002d699d9126b883e36a','{\"login_token\":\"fb9a2082284fb3c7777d4c1d7f82d852\"}','2025-03-24 12:14:09'),
('064df7f95fdcfc15e526545a25','{\"login_token\":\"a61717bfbb9f2ff0ce9903104b1aca9e\"}','2025-03-24 12:14:09'),
('06588abbd519614f7d6bc1804c','{\"login_token\":\"281a3cbf3487bd27c00527f56bad013b\"}','2025-03-24 12:13:37'),
('06b721609dc62675591843e898','{\"currency\":\"USD\"}','2025-03-24 12:14:45'),
('06bbdb80aaf0c688cea36799e0','{\"login_token\":\"774a7006a621161f0ae2391113ae6465\"}','2025-03-24 12:14:35'),
('06c7e04841925f7107d7aa04ef','{\"login_token\":\"5cf314fe26d1e5594357631f4ac0bbd2\"}','2025-03-24 12:14:34'),
('06c81a6c9657cc1899035f604c','{\"currency\":\"USD\"}','2025-03-24 12:13:35'),
('0748a853fcb8709dab39f5ef6f','{\"login_token\":\"3c9a0680e5f8adc0be16e86b7c52b5bc\"}','2025-03-24 12:14:04'),
('074db62d6f53abe5be715bf5dd','{\"login_token\":\"c63aed7eda5feebe2ecddde9ccf557d7\"}','2025-03-24 12:12:53'),
('0755924c43913281c3e14756e2','{\"currency\":\"USD\"}','2025-03-24 12:13:13'),
('0783ae0e21bde64e2594dc0185','{\"currency\":\"USD\"}','2025-03-24 12:13:36'),
('078e40fbc301aeaeab4274d516','{\"login_token\":\"ce6c20415382117672992d2f7711d063\"}','2025-03-24 12:12:58'),
('07a8f7cea34da2fc65e843ee31','{\"currency\":\"USD\"}','2025-03-24 12:14:36'),
('07e07e287cfb04afe6ff1811a3','{\"currency\":\"USD\"}','2025-03-24 12:12:53'),
('081ab8e57358c948d8f9e18498','{\"currency\":\"USD\"}','2025-03-24 12:13:00'),
('0858b86e492881ed9ae2e3d87c','{\"login_token\":\"dd243eba87c83b02d3508f41a39bbc23\"}','2025-03-24 12:14:45'),
('0863aa3737a548e455e86286ad','{\"login_token\":\"4d82818a1a3cd4b347fbfd3134dc72f0\"}','2025-03-24 12:14:10'),
('08826af4da5a851d103fafce56','{\"login_token\":\"06779588e2ef9cf7310835e4335c8509\"}','2025-03-24 12:13:39'),
('08b3bd0d334c0d3250722c2582','{\"currency\":\"USD\"}','2025-03-24 12:14:31'),
('08c2e676149132dc1b570b3647','{\"currency\":\"USD\"}','2025-03-24 12:14:05'),
('08c3f1ed1d7877197ea0ec82de','{\"currency\":\"USD\"}','2025-03-24 12:13:57'),
('08db936624acfb7cded606d2e0','{\"currency\":\"USD\"}','2025-03-24 12:13:25'),
('08f50b30b5b628102a93e3f28a','{\"login_token\":\"a536ab65254d0edc599b42101b9dadae\"}','2025-03-24 12:13:18'),
('08f9bc85a75ae748b6fa4ed11e','{\"login_token\":\"24d1d69d17fe3c1b49e6f8f609a0300d\"}','2025-03-24 12:13:56'),
('09223e93eab690d0a606a10b57','{\"login_token\":\"e0406e33d765e5de9f4d28559cd6f249\"}','2025-03-24 12:14:14'),
('09335755bc050ac68e76e6ce63','{\"currency\":\"USD\"}','2025-03-24 12:13:51'),
('0934ccf8f4d6e9b13bea9a99d3','{\"currency\":\"USD\"}','2025-03-24 12:13:19'),
('09621ad961635f86e480db987c','{\"currency\":\"USD\"}','2025-03-24 12:13:54'),
('096bd279ff54d5137ac236431b','{\"currency\":\"USD\"}','2025-03-24 12:12:52'),
('096fcd76a3b5307b4f0ac5fd8e','{\"login_token\":\"0b24ceb08d7facd67395eb4ccd657106\"}','2025-03-24 12:14:33'),
('096fe38827509ef4e064c50e60','{\"currency\":\"USD\"}','2025-03-24 12:13:48'),
('097c04368999d7a67df6f1478d','{\"login_token\":\"82ba2898aa9004f2644b7aacc1cf6d53\"}','2025-03-24 12:13:11'),
('09941c823c45123ea08625aa96','{\"login_token\":\"4fd67c9a42a644a1a1d607bc013904dc\"}','2025-03-24 12:13:48'),
('09a2fae100991f35c6db9a457c','{\"login_token\":\"622f45c75733a1d408ef7f527fdaa614\"}','2025-03-24 12:13:16'),
('09cd910a03470443e6417634c1','{\"currency\":\"USD\"}','2025-03-24 12:14:07'),
('0a1166a4000ff255758011d767','{\"login_token\":\"b35ef4a6d341741943b11368dcdd2905\"}','2025-03-24 12:13:52'),
('0a3588fa4320ce0b604c7e5be2','{\"login_token\":\"4e4a59287514cbc47af00e16df38d3b9\"}','2025-03-24 12:14:23'),
('0a45f7d67b55545a4b69565cc9','{\"currency\":\"USD\"}','2025-03-24 12:13:27'),
('0a6f911bb50df2cd4f07f881b2','{\"login_token\":\"6906917d50e7c732bee1e228bf8e89ae\"}','2025-03-24 12:13:50'),
('0a77bbf90a530e2a8a1d16f1c1','{\"currency\":\"USD\"}','2025-03-24 12:13:15'),
('0a7cd8f6c36da42d4226a251c0','{\"login_token\":\"326224fd15c8db3dcf5ec2adf6cf248b\"}','2025-03-24 12:14:06'),
('0a98ef98f8fadc15b701240853','{\"currency\":\"USD\"}','2025-03-24 12:13:56'),
('0ad84ba05ba4c05715a1b42741','{\"currency\":\"USD\"}','2025-03-24 12:14:21'),
('0ae6a72b76a126966c0778c514','{\"currency\":\"USD\"}','2025-03-24 12:13:09'),
('0ae734bded8ad1186551d00fe7','{\"currency\":\"USD\"}','2025-03-24 12:14:09'),
('0b004c4c7e67a974525e35d49a','{\"currency\":\"USD\"}','2025-03-24 12:14:26'),
('0b0185f6fd045ef4ec4a4b76e8','{\"currency\":\"USD\"}','2025-03-24 12:13:44'),
('0b2203e9ffc4eac9420c81d521','{\"login_token\":\"69b8bdc6f9a6600d7bfe0e4089b7f4e8\"}','2025-03-24 12:13:24'),
('0b26fe690072dcecefb351e5da','{\"currency\":\"USD\"}','2025-03-24 12:14:25'),
('0b90792564eb80f5145aca7630','{\"login_token\":\"d271814d9332245955a3dd68dec5b3f4\"}','2025-03-24 12:12:53'),
('0bb0dcc68493ebd978508a3058','{\"login_token\":\"ce0f7d4914828f0239d3c5faa8f29933\"}','2025-03-24 12:13:32'),
('0bb4d5cbacee21d40cd94ee115','{\"currency\":\"USD\"}','2025-03-24 12:13:50'),
('0bb84fece83fb47a9b63b5f3f4','{\"login_token\":\"bfffa0aac26c28a968f06875968aa5d8\"}','2025-03-24 12:14:07'),
('0bd4798c84b68a51c93e5f4eb4','{\"login_token\":\"62b17cd76ea881268355e83caf86cb60\"}','2025-03-24 12:14:18'),
('0bdbeac2acd47f4c190117b960','{\"login_token\":\"d149121dc527f02bda8e552243070563\"}','2025-03-24 12:14:38'),
('0bdcc3e6c816e7c681173a5a0f','{\"login_token\":\"fe330c0a7547b08e35d320ff603e9293\"}','2025-03-24 12:13:22'),
('0bdfd105bfe4d5ba6746cd6079','{\"login_token\":\"a338b21333767510cc243360a512d697\"}','2025-03-24 12:12:55'),
('0beab3bec0903950df740cf11d','{\"currency\":\"USD\"}','2025-03-24 12:13:50'),
('0bf8dbbccbc921cd9aa4906545','{\"login_token\":\"845f087998a2f5004153c2f7379a84b1\"}','2025-03-24 12:13:05'),
('0bfaa28c2d0d9a669f398627e9','{\"currency\":\"USD\"}','2025-03-24 12:13:08'),
('0c369e3a20336d1b9ed69168c9','{\"currency\":\"USD\"}','2025-03-24 12:13:51'),
('0c61021230b944fd7d84d6341b','{\"currency\":\"USD\"}','2025-03-24 12:14:19'),
('0c9102909f4d9af9e1d7700e04','{\"login_token\":\"700a6bd2bff638ba850ea40c744f6e03\"}','2025-03-24 12:13:51'),
('0ca6764ad9722872cfb13a0c56','{\"login_token\":\"888d2abf3bc757d7250ca0f86d4ef2f6\"}','2025-03-24 12:14:09'),
('0ce0f3f46ad8011ef88b334398','{\"currency\":\"USD\"}','2025-03-24 12:13:42'),
('0cea984ceafafa35dc5ad24414','{\"login_token\":\"20b16b82d50636b0b09df9e0fdefb5d2\"}','2025-03-24 12:13:29'),
('0d0c194a1bf3cc68539e2568d0','{\"login_token\":\"5245e67b3a58ca1c16430baf30a22159\"}','2025-03-24 12:14:02'),
('0d161917545d509f0d1533d67d','{\"currency\":\"USD\"}','2025-03-24 12:13:56'),
('0d1db1e9baf83f25ed33900f45','{\"currency\":\"USD\"}','2025-03-24 12:13:38'),
('0d3502e355db92873fa79dc3d2','{\"login_token\":\"49b5e786a54231465a6874edbe6f409c\"}','2025-03-24 12:13:15'),
('0d3e4f9c87ad52e1c4bc675213','{\"currency\":\"USD\"}','2025-03-24 12:14:07'),
('0d6557d22e69ddde3f9d002bad','{\"login_token\":\"3daa736ea9703da62655d28aba2a5f0f\"}','2025-03-24 12:13:34'),
('0d70612b04e519a6e904c1796c','{\"login_token\":\"27c418d00eea5ee0a7a7b82da13e9523\"}','2025-03-24 12:13:24'),
('0d798bf0e1f0ed2b496979ddb5','{\"currency\":\"USD\"}','2025-03-24 12:12:52'),
('0d9fd8d73220f941e446a86571','{\"login_token\":\"d6dae1a47649101003b94966026feb35\"}','2025-03-24 12:13:02'),
('0dba83cd54bb02caad613ccc56','{\"currency\":\"USD\"}','2025-03-24 12:14:14'),
('0dc8af06acb98c8b68493cc80f','{\"login_token\":\"e17fb8d5a82471c6704062398f74c818\"}','2025-03-24 12:14:23'),
('0dd651deabea043db274368d40','{\"login_token\":\"f936a6c323fc357c9fd5155f378bc626\"}','2025-03-24 12:13:44'),
('0ddc381b32d26a498381f56898','{\"currency\":\"USD\"}','2025-03-24 12:13:46'),
('0ddc98aa8dffe31fb30189eac7','{\"currency\":\"USD\"}','2025-03-24 12:13:18'),
('0e0bf92593ab6deadccd1b4beb','{\"login_token\":\"cbf9d4bca528c6b0af6b1a76e8572db7\"}','2025-03-24 12:14:39'),
('0e1564c2d01c2ae360a5629508','{\"login_token\":\"9f9ef4b872368a214bc26250df26aab1\"}','2025-03-24 12:14:15'),
('0e4f546ef1ee6250960fd351af','{\"currency\":\"USD\"}','2025-03-24 12:13:20'),
('0e67ef2f7071f582e1425e107b','{\"currency\":\"USD\"}','2025-03-24 12:13:46'),
('0e7f5ed7b7ae490dc053e0c3db','{\"currency\":\"USD\"}','2025-03-24 12:14:09'),
('0e93590e16f92b9978a0cc707a','{\"currency\":\"USD\"}','2025-03-24 12:14:05'),
('0eadb0697ae703be4e0444c8bd','{\"currency\":\"USD\"}','2025-03-24 12:13:45'),
('0ebc0483da49d4d07c79e0ab69','{\"login_token\":\"c0d2e312224d09cca0ffd9c3d648d316\"}','2025-03-24 12:13:48'),
('0ec3ec999f3a3aa8e69b76d7fa','{\"currency\":\"USD\"}','2025-03-24 12:13:18'),
('0eec1bcf45230ac2038aee03e9','{\"login_token\":\"fb475f8461391e3c7ed820397b4b19ce\"}','2025-03-24 12:14:34'),
('0ef7f9e7a97bbd704aa37b8548','{\"login_token\":\"08595a59c359fd9a1d6688ca522389ed\"}','2025-03-24 12:14:08'),
('0ef9b01404db29a58d1c025e88','{\"currency\":\"USD\"}','2025-03-24 12:14:02'),
('0efcef0d11d4f0f5ebfbe27e4b','{\"login_token\":\"f27c2d913c91652c284a0c3e6ab92097\"}','2025-03-24 12:13:56'),
('0f27f82b7e788c2de68cf620e9','{\"currency\":\"USD\"}','2025-03-24 12:12:59'),
('0f632163cec8a6b8387259eb12','{\"login_token\":\"05b647907fb433a3c79e83f2199f5bae\"}','2025-03-24 12:14:37'),
('0f65d9b636685e1ad644f959a4','{\"login_token\":\"563db3ab5dae12344a26e8bff0c37c4b\"}','2025-03-24 12:14:18'),
('0f91175914d1e0e433eeb30bbd','{\"login_token\":\"4fa740f47ca92af307e92775de113084\"}','2025-03-24 12:12:53'),
('0f99432ef6e64ccdde95ab0a7f','{\"currency\":\"USD\"}','2025-03-24 12:14:15'),
('0fa3cceafa84aa05f9eba43551','{\"currency\":\"USD\"}','2025-03-24 12:13:26'),
('0fb35d67378a6b8d70d0cc3518','{\"currency\":\"USD\"}','2025-03-24 12:14:08'),
('0fe2e2325e2f43a8ccd2fccab7','{\"currency\":\"USD\"}','2025-03-24 12:12:53'),
('0fe511318e68cae62a8bc01eb6','{\"login_token\":\"808df12cc112d128c23814caa63bdbc6\"}','2025-03-24 12:13:25'),
('0ff16c3b7d39a94fcb0596f183','{\"currency\":\"USD\"}','2025-03-24 12:13:48'),
('0ffd3f2624550996500cd2de48','{\"login_token\":\"b2891b933e7cc38b04cd23598313f212\"}','2025-03-24 12:14:44'),
('100479a50264a120193e8642c9','{\"currency\":\"USD\"}','2025-03-24 12:14:35'),
('10094d56b0fc64816c3abb11bb','{\"currency\":\"USD\"}','2025-03-24 12:14:22'),
('10298c6042838a2ceac41e5b46','{\"currency\":\"USD\"}','2025-03-24 12:14:10'),
('1034f636d75164cacd48eaa3c8','{\"login_token\":\"1b4cd849ebb72b96d85dbdd96db64d08\"}','2025-03-24 12:14:02'),
('1044d400ee16ca84ab2ced7744','{\"login_token\":\"b21211715c320348433347b9758cc97d\"}','2025-03-24 12:13:34'),
('1058e7c138eb2c3ce3804567c6','{\"login_token\":\"c86d558ac8f056063e6fee2244721ae9\"}','2025-03-24 12:13:28'),
('105dc5f957242d92216922a82d','{\"currency\":\"USD\"}','2025-03-24 12:13:53'),
('108ce3f7d7aed7a47d2ef7e542','{\"login_token\":\"dea13cdf03c9aac209da54c324936eab\"}','2025-03-24 12:13:23'),
('1095be23d4ac11a799d60acda8','{\"currency\":\"USD\"}','2025-03-24 12:13:19'),
('10c556926c394bb6f7bae9a71a','{\"currency\":\"USD\"}','2025-03-24 12:12:51'),
('10fad3ed96fa91a2c38f7f1b68','{\"currency\":\"USD\"}','2025-03-24 12:14:28'),
('11003b29c30f9c87afa7c3aba0','{\"login_token\":\"3f55e2212c4ed14dbe7d7662ebb1f55f\"}','2025-03-24 12:13:26'),
('112cc385417de709000935dec5','{\"currency\":\"USD\"}','2025-03-24 12:14:11'),
('1141d3b1e9987ed44b5870836c','{\"currency\":\"USD\"}','2025-03-24 12:13:52'),
('1143d8c67108a07ef6f52e91a5','{\"login_token\":\"ef9043c86321e77fdb450be103fa1695\"}','2025-03-24 12:12:50'),
('114b61909d05786c6d7782f68c','{\"login_token\":\"194e058fcfba2a65b55cae6742115ce5\"}','2025-03-24 12:14:10'),
('114febdc49388842d192a64175','{\"currency\":\"USD\"}','2025-03-24 12:14:32'),
('11579714cf0826a8ae212d1877','{\"login_token\":\"05894b232368774b54df8f7d320d5e41\"}','2025-03-24 12:13:39'),
('116d4b50188759bce99fb24337','{\"login_token\":\"94bf334208da5860cc8f079bf8b567d1\"}','2025-03-24 12:14:25'),
('1174150482624e3726aff3f09d','{\"login_token\":\"6182c3030efac45060aee518da62425e\"}','2025-03-24 12:12:57'),
('117b78ee14df0199c694f14ab6','{\"currency\":\"USD\"}','2025-03-24 12:13:48'),
('117e4410e38c8bec77dcfb72c7','{\"login_token\":\"a7847cf7aa75437505849cece5df302f\"}','2025-03-24 12:13:19'),
('119329b9b252d9475afa58c071','{\"login_token\":\"200f9fa9aa9e3072af0d1d75bf63a156\"}','2025-03-24 12:14:09'),
('11a8a8abc9c521e26c4e1d8444','{\"currency\":\"USD\"}','2025-03-24 12:13:30'),
('11daf7f373cb711da91b90ccf3','{\"currency\":\"USD\"}','2025-03-24 12:13:05'),
('11dcc7ee818809e632dd131a85','{\"login_token\":\"2b82a20bcd794d38e8e68d9eea1e260c\"}','2025-03-24 12:13:37'),
('12056d76b7095562ed0679f881','{\"login_token\":\"95233b383661db19ad2a8cf4c915572b\"}','2025-03-24 12:14:35'),
('1234e4fabc07c01151b1cb9b77','{\"login_token\":\"b2a79577534980b323326196b16a4f22\"}','2025-03-24 12:14:17'),
('1282ebe3ef0359f9353b09f8ae','{\"login_token\":\"d157db8d49966813d61462bb834fabae\"}','2025-03-24 12:13:40'),
('128a3358e095c04508ac177c91','{\"currency\":\"USD\"}','2025-03-24 12:13:08'),
('12929b93485eb335b400496c1b','{\"currency\":\"USD\"}','2025-03-24 12:14:42'),
('129aa3c8ccbe62b4323d5ecf82','{\"login_token\":\"9cbbbc5f71aa0f3d10c227f1d94e2701\"}','2025-03-24 12:12:52'),
('12adafd3391cab6f43b20bdc66','{\"currency\":\"USD\"}','2025-03-24 12:13:45'),
('12b5aa16dfa9edad17c37a6669','{\"login_token\":\"e2bac94f8ddc81de2408688a6ec56ad6\"}','2025-03-24 12:13:52'),
('12b9c780206dca9330a6166eaf','{\"currency\":\"USD\"}','2025-03-24 12:14:23'),
('12bb38be26f4659b0d8cda713b','{\"currency\":\"USD\"}','2025-03-24 12:13:04'),
('1329c5187b0ea7fb8cf572e1ac','{\"currency\":\"USD\"}','2025-03-24 12:14:12'),
('132b54cf2b9fc9e8dbdc0a365f','{\"currency\":\"USD\"}','2025-03-24 12:14:24'),
('133f9d269316313165d8726a0f','{\"currency\":\"USD\"}','2025-03-24 12:13:27'),
('1387a862b2181159be1eb84151','{\"currency\":\"USD\"}','2025-03-24 12:14:02'),
('13b52387316e1a839960d2b436','{\"currency\":\"USD\"}','2025-03-24 12:13:32'),
('13bf0d3795ac06765d310626aa','{\"login_token\":\"b3042ccbca7c70dfb02858ed53561523\"}','2025-03-24 12:14:37'),
('13d302fc442a0e5c05307b1d78','{\"login_token\":\"7fb05b4e00581e60400f552f4cd70cb2\"}','2025-03-24 12:14:20'),
('13de105c52574d5ba992ed33ef','{\"currency\":\"USD\"}','2025-03-24 12:14:13'),
('13e618858c9c78f737c6334fa8','{\"currency\":\"USD\"}','2025-03-24 12:14:30'),
('14173ed9964291e82b7458a373','{\"currency\":\"USD\"}','2025-03-24 12:14:02'),
('141e7cac216e68f78c3a207b83','{\"login_token\":\"bbcacd1198af5dfaf57b25f525a80f90\"}','2025-03-24 12:13:13'),
('144abfca2d99c09b1dd8f72383','{\"currency\":\"USD\"}','2025-03-24 12:13:47'),
('145311c80e889b3ef19a4659ad','{\"login_token\":\"31d770810e161d9588eba30a86c4bd01\"}','2025-03-24 12:13:48'),
('148ad2ab0b63b60b538f1bcb32','{\"login_token\":\"50893a4732040f7fe0e0fea3d449f765\"}','2025-03-24 12:13:28'),
('14c0bceb9750ec138c18f6a995','{\"currency\":\"USD\"}','2025-03-24 12:13:00'),
('14cbf1554c7da95664359fbca8','{\"currency\":\"USD\"}','2025-03-24 12:14:09'),
('1529a877eeeea0b1f05c6ef637','{\"login_token\":\"d09d5f3caef0e28107e1c883aaf5c74b\"}','2025-03-24 12:13:33'),
('1539c9761be680e2d55d798d38','{\"login_token\":\"900d92c48d16bcae498a0697b63a0b78\"}','2025-03-24 12:13:58'),
('153ce2525300bd962899a3b01d','{\"currency\":\"USD\"}','2025-03-24 12:13:19'),
('1573c11ae522639790a95a6cc9','{\"currency\":\"USD\"}','2025-03-24 12:13:44'),
('158a314ecf1680773c7b25002c','{\"login_token\":\"2b6f656e0137b1667e44adb411ac4d19\"}','2025-03-24 12:12:53'),
('15b3d5735840371f39f707a25f','{\"login_token\":\"f02f62b9c5da83727b482e6fc73e8bb0\"}','2025-03-24 12:12:56'),
('15c5109a226404d95440c1169b','{\"login_token\":\"1ea29c2b4c6fb1e7a8fabd4772dfef9d\"}','2025-03-24 12:13:06'),
('15c95da8316b3b612e734f0464','{\"currency\":\"USD\"}','2025-03-24 12:14:00'),
('15dc308b5f31f4951364a07aa8','{\"login_token\":\"bc9bfa601734bfe476f4ac20690c1fc5\"}','2025-03-24 12:14:38'),
('15fb5a7aae3aacffb9c80e9673','{\"currency\":\"USD\"}','2025-03-24 12:13:08'),
('1615505cb2f2c25753613d1a9d','{\"currency\":\"USD\"}','2025-03-24 12:13:02'),
('16209a5a4e4884571485ae2454','{\"currency\":\"USD\"}','2025-03-24 12:14:17'),
('16534e3b63d18b279b7d35a027','{\"currency\":\"USD\"}','2025-03-24 12:13:43'),
('16612c7a2f2ce343e224218cd2','{\"currency\":\"USD\"}','2025-03-24 12:13:38'),
('1684b538c3827d55b22e5ceee9','{\"login_token\":\"5b4d213ecc47d729beb84db8bc13bebc\"}','2025-03-24 12:13:42'),
('1699e9b915407fd1e7eb1664f1','{\"login_token\":\"9d7c3a0a477ab02c6004540612086c86\"}','2025-03-24 12:14:16'),
('16afcf26924609cc106c5c847a','{\"currency\":\"USD\"}','2025-03-24 12:13:10'),
('177b7e78b1d32173cee74c31c2','{\"login_token\":\"9685e9ced5de20b17e0cb52fed217555\"}','2025-03-24 12:13:29'),
('177d4c886a317727b0a48211d8','{\"currency\":\"USD\"}','2025-03-24 12:14:29'),
('178d15999fa81f4dec6a2d916c','{\"currency\":\"USD\"}','2025-03-24 12:13:53'),
('17d6c936308dbe42d801eb5e77','{\"login_token\":\"2db2c99612577ea750f6f8e2cb524546\"}','2025-03-24 12:14:01'),
('17e3d260e2c2630e1476c79811','{\"currency\":\"USD\"}','2025-03-24 12:13:29'),
('17f4dc8b0a3aca2f00fa5e6ade','{\"login_token\":\"008abe3939efddecf8a4de350286106d\"}','2025-03-24 12:12:56'),
('18132d41dfea0f4a948fbcb900','{\"login_token\":\"98c20bc678c5004ac82d03e9863211f9\"}','2025-03-24 12:14:40'),
('181632165ee6766ee8fd8858bf','{\"login_token\":\"0326d75df88f6229b06edf6f4bb7f664\"}','2025-03-24 12:13:44'),
('18217b9da6d7a04176e03c18ed','{\"currency\":\"USD\"}','2025-03-24 12:14:43'),
('185af95129785ff90cb4a8c12b','{\"currency\":\"USD\"}','2025-03-24 12:13:22'),
('186164f341aa42d6f1470c92fb','{\"currency\":\"USD\"}','2025-03-24 12:13:58'),
('18770a519d3175d6058848f1b2','{\"login_token\":\"115bf20c58f295fa67d2bf67502f1e2a\"}','2025-03-24 12:13:13'),
('188f4352f31831d71bfacd8eec','{\"currency\":\"USD\"}','2025-03-24 12:14:26'),
('18e1ed40e391404040e927f73c','{\"currency\":\"USD\"}','2025-03-24 12:14:20'),
('18f10d9a27c6f68bcf49418f25','{\"login_token\":\"b9eb10c715455930f102e69242ae8475\"}','2025-03-24 12:14:12'),
('1904ece2d627eea82f7765e3c5','{\"login_token\":\"cc1dd5ff12b0207b89240885133d8601\"}','2025-03-24 12:13:03'),
('19177783dcd6b374b32eb1cf36','{\"login_token\":\"0b85457b33ec125133ee4837e4ef78f9\"}','2025-03-24 12:13:56'),
('198a0f2c0af7b24eed6764a319','{\"currency\":\"USD\"}','2025-03-24 12:14:24'),
('198d49be123adbfd5684ad18ec','{\"currency\":\"USD\"}','2025-03-24 12:14:12'),
('19913ee604bf9b257ba77da013','{\"currency\":\"USD\"}','2025-03-24 12:14:46'),
('1996c54cc70e6949182b6e6e6d','{\"login_token\":\"df83da4a609691f110e9f1e7fcd0487d\"}','2025-03-24 12:13:27'),
('199a08b291eece960da6b9aeb9','{\"currency\":\"USD\"}','2025-03-24 12:14:10'),
('19a615e4974e819fbd6f9f7635','{\"login_token\":\"1d07c363d8fec341ff8523a92122cf30\"}','2025-03-24 12:14:10'),
('19e0a636470e396caded4ff400','{\"login_token\":\"386d33a9e9d8f0b659c9a05f7286fdce\"}','2025-03-24 12:13:10'),
('1a1127e8c7c6c5c558e0e95e25','{\"login_token\":\"855d397dfbb6b9b5a285d48d194afbe8\"}','2025-03-24 12:14:38'),
('1a1e12896dbb3544135415c9ee','{\"login_token\":\"a5e4b152777925086778bc1c62039302\"}','2025-03-24 12:14:26'),
('1a37160b854ccdb350268779f2','{\"currency\":\"USD\"}','2025-03-24 12:14:37'),
('1aa0c2857ec4c6671f8556f9df','{\"login_token\":\"021fefbcd0edf24c60fd810342235372\"}','2025-03-24 12:13:31'),
('1abfede275f8c350e5330889cc','{\"currency\":\"USD\"}','2025-03-24 12:14:19'),
('1acfe5dda9b978811695d8fb27','{\"currency\":\"USD\"}','2025-03-24 12:13:56'),
('1ad6d9cbc6ca6c2ef56a1e325a','{\"currency\":\"USD\"}','2025-03-24 12:14:05'),
('1aec0c20c08e5f3ee4fbd54bda','{\"currency\":\"USD\"}','2025-03-24 12:14:00'),
('1af7c09f3308bb3ae7081259e0','{\"currency\":\"USD\"}','2025-03-24 12:13:24'),
('1b44011c0aff1174dd940dc7e7','{\"login_token\":\"7d38321233448dfd15126bd626679eaa\"}','2025-03-24 12:14:39'),
('1b651c7df371aba3fb2a4b152c','{\"login_token\":\"74b14af71e12d02b6783c2d2730b2b10\"}','2025-03-24 12:13:48'),
('1b774d76f1c48cfe11cc84551a','{\"currency\":\"USD\"}','2025-03-24 12:13:04'),
('1b7ae580dd979fadcdf6b8c523','{\"login_token\":\"56407942086fce46ab6d04fe1a593feb\"}','2025-03-24 12:14:36'),
('1b889b47936fb7579fab807527','{\"currency\":\"USD\"}','2025-03-24 12:13:01'),
('1ba17dd0cbcc6fb3450b25d337','{\"login_token\":\"8db5dc6877ecbdd5cfba257e7830e240\"}','2025-03-24 12:13:28'),
('1bd6c586b182fa25392628052d','{\"currency\":\"USD\"}','2025-03-24 12:13:09'),
('1be65c7de7ffb53138c6203cd2','{\"currency\":\"USD\"}','2025-03-24 12:13:31'),
('1c225b593feeae03291f6c2f4c','{\"currency\":\"USD\"}','2025-03-24 12:12:55'),
('1c22797c09ae8f7b5f30fb9818','{\"login_token\":\"112ea1d8d9d684ae876a18104522c6ce\"}','2025-03-24 12:14:25'),
('1c28c7ac9aadbca91fc054a0b6','{\"currency\":\"USD\"}','2025-03-24 12:14:10'),
('1c861607c04158903b3f233493','{\"login_token\":\"e320a8c03af1a4434004484c852799fc\"}','2025-03-24 12:14:01'),
('1c9c7b9e5f4ca2c282af74fc19','{\"currency\":\"USD\"}','2025-03-24 12:13:41'),
('1caf7f747ae7fddf1a4077bb1e','{\"currency\":\"USD\"}','2025-03-24 12:13:22'),
('1cb7da49948e4206283045f945','{\"currency\":\"USD\"}','2025-03-24 12:14:36'),
('1cdc2f0b85bdd6ed55e0b5b972','{\"currency\":\"USD\"}','2025-03-24 12:13:02'),
('1d13f0c973a64b6fde98ad53ad','{\"login_token\":\"7b5de9f52fca6e3da0880f379a0bd888\"}','2025-03-24 12:14:33'),
('1d186bdd0cdf5739c82ead0c61','{\"currency\":\"USD\"}','2025-03-24 12:13:17'),
('1d1886eb14b6f725ed7dc38dd7','{\"login_token\":\"c69f34a897abf0f028d0a32f6771d5bf\"}','2025-03-24 12:14:39'),
('1d263e001b674486d4d55c34a9','{\"currency\":\"USD\"}','2025-03-24 12:13:32'),
('1d59a81591d10c868097f2c934','{\"currency\":\"USD\"}','2025-03-24 12:14:21'),
('1d5a34d8c6d2dfae5fdcd63b19','{\"login_token\":\"bbda452d15d7e5643f41ae2bddd57280\"}','2025-03-24 12:14:33'),
('1d6da91ade53e6576dd89a70d6','{\"login_token\":\"6caad3d96cc7d7696d283f006ff1f9f0\"}','2025-03-24 12:14:37'),
('1d89ae94c7a7840ec919cfa214','{\"currency\":\"USD\"}','2025-03-24 12:14:32'),
('1d8a9df68982cc43607d2e6bda','{\"login_token\":\"a22a4ffe6f7cd2dc79705f9a7a1e96b0\"}','2025-03-24 12:14:44'),
('1dc5bf37b2319c441278db2ab6','{\"login_token\":\"ffe19d10ea31e9fb13d9b1da22a43651\"}','2025-03-24 12:13:48'),
('1dd49033c783abbe730e477dc1','{\"currency\":\"USD\"}','2025-03-24 12:12:58'),
('1df49447c1c9e5c9bd5a665888','{\"login_token\":\"16c2c808e4264ca16d54e983a9ccc348\"}','2025-03-24 12:13:19'),
('1e2a68fa7db032902c5c6ed96d','{\"currency\":\"USD\"}','2025-03-24 12:14:31'),
('1e34f58eeca40d2b1748908e32','{\"currency\":\"USD\"}','2025-03-24 12:12:56'),
('1e39cc8f6c52f4bd4e12d171cb','{\"login_token\":\"a346331f6424ab6cd4e383e509b03869\"}','2025-03-24 12:14:33'),
('1e536d3ae7c57d65f411e4034f','{\"login_token\":\"66aa71f12b2607c306a1d5ffd3f945ca\"}','2025-03-24 12:14:12'),
('1e74ccd1a3f6948343a0481d17','{\"login_token\":\"dcf4ff20cb175fe456e396222a024223\"}','2025-03-24 12:13:14'),
('1ecfe504bf0ba447487e1a144c','{\"currency\":\"USD\"}','2025-03-24 12:13:01'),
('1ef400a3fcf04ff46a54d2a4d1','{\"currency\":\"USD\"}','2025-03-24 12:14:37'),
('1efdc56c8a05f7416a4109b1db','{\"login_token\":\"fb75ef35274e7ee4250364370c76ed24\"}','2025-03-24 12:13:15'),
('1effde8645a9ac592c77bd5ffe','{\"login_token\":\"0052eb5f04723325387a8170b7d6cd02\"}','2025-03-24 12:15:10'),
('1f02e73a0e8244d3f1042fe226','{\"login_token\":\"a5bd74b3c3d7f52e067e50374846a6d1\"}','2025-03-24 12:13:10'),
('1f4e7eee269ae78bd3c9658dbf','{\"login_token\":\"00143f2aaa5ebc77126d773ad6ed6321\"}','2025-03-24 12:12:57'),
('1f4fa15034c79193edc26ea5ef','{\"login_token\":\"bded02ed6d8c0057479c6e7e05366b29\"}','2025-03-24 12:13:19'),
('1f72a62c84644df9fb1be41c35','{\"login_token\":\"b0536acfe841765b143fd72de15646b4\"}','2025-03-24 12:13:35'),
('1f7e9f4f615084a65d7567d2b5','{\"currency\":\"USD\"}','2025-03-24 12:13:33'),
('1f88a4a4e699a177a02df964d9','{\"login_token\":\"36c8c77b4dea38ce551551c85257ec25\"}','2025-03-24 12:12:59'),
('1f8c223d1c2bb45183722e2920','{\"login_token\":\"376634897724ca01451f0ea2a66c8309\"}','2025-03-24 12:13:04'),
('1f969757dc9db9808f8d20e40f','{\"currency\":\"USD\"}','2025-03-24 12:12:55'),
('1fb7b066faf6d88dbe3f0d2898','{\"currency\":\"USD\"}','2025-03-24 12:13:40'),
('1fbc8f7bed8663eb6441df618a','{\"login_token\":\"0ff4239f1ceee637e9cc481d62593ad5\"}','2025-03-24 12:13:28'),
('1fcc1abdfe2f3f8639cfd1a8e0','{\"currency\":\"USD\"}','2025-03-24 12:13:31'),
('1fd93a378a6211259f62ad9d95','{\"login_token\":\"eccf9843a9c60868ffcd085896068de1\"}','2025-03-24 12:13:51'),
('1feb4c9fee59961f7a6a0f668a','{\"currency\":\"USD\"}','2025-03-24 12:13:37'),
('202cf491249aa71128000f2965','{\"currency\":\"USD\"}','2025-03-24 12:13:07'),
('203e642e9d525131361a1f9029','{\"login_token\":\"b1fe59f167d96dfd73f615aa4632c2b1\"}','2025-03-24 12:13:27'),
('2043321a89e34486edc62933ff','{\"currency\":\"USD\"}','2025-03-24 12:13:01'),
('206eae17c78e4a0171a53577d4','{\"login_token\":\"119d911f8c3a5ff4c48e6fbe5d01ecae\"}','2025-03-24 12:13:15'),
('2087745134c629eab5baca3c5c','{\"currency\":\"USD\"}','2025-03-24 12:14:01'),
('209fceb9cafeec232c969b5f22','{\"currency\":\"USD\"}','2025-03-24 12:13:23'),
('20b2763fd2e3b8e8a35ef4a15f','{\"currency\":\"USD\"}','2025-03-24 12:13:27'),
('20bb9db5badcbab2d4edfd4392','{\"currency\":\"USD\"}','2025-03-24 12:13:18'),
('20d8e2f892999c0f4bf190667d','{\"currency\":\"USD\"}','2025-03-24 12:14:30'),
('20feb479bbe4ac74bd24aa19a1','{\"currency\":\"USD\"}','2025-03-24 12:12:54'),
('210064ec229647d16f1c948d76','{\"login_token\":\"5f02d8c31be2d6fc4fc0afb115419693\"}','2025-03-24 12:14:35'),
('211ede91ff66658c677c158f53','{\"currency\":\"USD\"}','2025-03-24 12:14:27'),
('2133db099912cfad745ed25cbf','{\"currency\":\"USD\"}','2025-03-24 12:14:40'),
('213f34ed2088ae6cfe9a67ec8f','{\"login_token\":\"b51d0be4cabc39f0687b6308e4b6c3bb\"}','2025-03-24 12:13:38'),
('214d4748d64761a4b77200c8f9','{\"login_token\":\"b0dd6e5c91b16cf5af2653fea284dcd6\"}','2025-03-24 12:14:37'),
('21724b30d9380484a4d4a2c16d','{\"currency\":\"USD\"}','2025-03-24 12:13:15'),
('217ccf100831f49947d4fa86f1','{\"login_token\":\"572f2c74a638b3710ba208a13314d084\"}','2025-03-24 12:14:18'),
('219c8de7ca5213b11ee0e86925','{\"login_token\":\"3a9c142be09faaf4ed04893b9ee564fd\"}','2025-03-24 12:14:03'),
('21c245f88a72422fa254ece801','{\"currency\":\"USD\"}','2025-03-24 12:13:04'),
('21c54a75ad6ae88dd1a4d8723e','{\"login_token\":\"4e5cef354ad566e44c6563554ddbaa94\"}','2025-03-24 12:14:39'),
('21dd7ee43210470b7fb00124a5','{\"login_token\":\"8fd0f419b1231d70ca8fbe3fc8083559\"}','2025-03-24 12:13:54'),
('21f79f3f390806f75fc543c60c','{\"login_token\":\"4d083462ef9e8acd53e2093016fa4701\"}','2025-03-24 12:13:44'),
('21fc9b8be1f90c707ee041210c','{\"login_token\":\"421f8fa66672918b52ef58b753368f5f\"}','2025-03-24 12:13:20'),
('21fd73599734a8169c5073d3ab','{\"login_token\":\"aa17e94b9a13cb78e8e7e4eda919ef1e\"}','2025-03-24 12:13:35'),
('21ff9585a7cbae8988cdfdd9d8','{\"currency\":\"USD\"}','2025-03-24 12:14:43'),
('22209738a27559d5d670452b73','{\"login_token\":\"a307f36eaee09ca55d9e94ef96c97e80\"}','2025-03-24 12:14:01'),
('223ab54fa78bbf1f5d345f5a7e','{\"login_token\":\"d6c68e0b243bcbc30016cb5f7109aa3c\"}','2025-03-24 12:15:10'),
('226fe0e1d342d1b973a1e77839','{\"currency\":\"USD\"}','2025-03-24 12:14:20'),
('22a9bb50876ddc5f06d4157b84','{\"currency\":\"USD\"}','2025-03-24 12:13:01'),
('22d28c783d845a63196bac45db','{\"currency\":\"USD\"}','2025-03-24 12:14:19'),
('22ff16dad54fe163a7dab0a9ea','{\"login_token\":\"78eb1747924e248667ed8124a436e63a\"}','2025-03-24 12:14:05'),
('23106a0f34b0be346bba4f96ea','{\"currency\":\"USD\"}','2025-03-24 12:13:45'),
('23118fa0d59267908b3682e9d1','{\"currency\":\"USD\"}','2025-03-24 12:14:11'),
('234faa67eb062e379e5348ebf0','{\"login_token\":\"9bfae72b51ea5fd47f460e7cc78ce577\"}','2025-03-24 12:13:17'),
('2373c3a4eea1e5f63743424ce8','{\"login_token\":\"328611a573a7438c0d8917961a2ea718\"}','2025-03-24 12:13:46'),
('23abaa37916f5ec7f1ff895d15','{\"login_token\":\"14f84b0308a8b1d3a7536a317437bf99\"}','2025-03-24 12:13:33'),
('23b1924bd41d0a9370b01128fc','{\"currency\":\"USD\"}','2025-03-24 12:14:35'),
('23b63d939fa499d8b9ebba1217','{\"currency\":\"USD\"}','2025-03-24 12:13:05'),
('23d6aa77376ca1d3c1c315c64b','{\"login_token\":\"39081efa5b917d3d694ed1fd3493afb7\"}','2025-03-24 12:13:40'),
('23d95aec4ce366d1a279016327','{\"currency\":\"USD\"}','2025-03-24 12:14:01'),
('23fca0e6b432deb42d0d92dab2','{\"currency\":\"USD\"}','2025-03-24 12:13:01'),
('2405b4209aa904fc83f2e80295','{\"currency\":\"USD\"}','2025-03-24 12:13:21'),
('2411cf5ab05c241b3f7bc83ebe','{\"currency\":\"USD\"}','2025-03-24 12:14:04'),
('244009143b7e28c27d2fac277c','{\"login_token\":\"b94a078faafdf602c27c5d31dad82c30\"}','2025-03-24 12:13:31'),
('246841daab83d72d06955f77f4','{\"login_token\":\"ea3235f647668f563a8c83efa29c01c0\"}','2025-03-24 12:13:37'),
('2496ec4c16525988b7c68625a8','{\"login_token\":\"d22e6374e3be4d6b0dc6d2ec75870b0c\"}','2025-03-24 12:13:09'),
('2497e7c43aee41b4c960cb2067','{\"login_token\":\"59b925d4a4ac7e1ea54a8f0012483da7\"}','2025-03-24 12:13:06'),
('24d7898e8703e3f6d65179ba86','{\"login_token\":\"0c1b2680880ff60ab8d9161f44a2c5ac\"}','2025-03-24 12:14:06'),
('24db613d02a3d0a3fdb1f6b803','{\"login_token\":\"90564208372b77c88b6d72d716f56601\"}','2025-03-24 12:14:46'),
('24f8a918e42457084e392daba0','{\"currency\":\"USD\"}','2025-03-24 12:13:05'),
('25140ddcbc7962c75210e798b1','{\"login_token\":\"044492cc1e95b8f9bf0305874670e27f\"}','2025-03-24 12:13:45'),
('253af36be5a17d690ed4eb02c8','{\"currency\":\"USD\"}','2025-03-24 12:12:52'),
('254b9878f50cd0c15279a7efe3','{\"login_token\":\"25797121d1cf652783d719953d3e06d5\"}','2025-03-24 12:14:44'),
('2553141d23279b4b4083fa7568','{\"login_token\":\"f9e9a5c21e362a96a537b5aa6fe2a29d\"}','2025-03-24 12:13:23'),
('255bce01cec4e48b0e52713a77','{\"currency\":\"USD\"}','2025-03-24 12:13:43'),
('2560aa871b1f01d4c95c002424','{\"login_token\":\"879611ab3b6961b7515142eda422c505\"}','2025-03-24 12:13:27'),
('25679bf06806d60338881df2ab','{\"currency\":\"USD\"}','2025-03-24 12:13:12'),
('25aba8466db8a303cb2569ea80','{\"login_token\":\"3e0f2767d507af09f1910b18a586c732\"}','2025-03-24 12:13:55'),
('25b492746514f1e1162ea3ca27','{\"currency\":\"USD\"}','2025-03-24 12:13:41'),
('25f292b4a57ca57e8b83ca456b','{\"login_token\":\"b9f4dd9b208e6121ed0ef87915f9329b\"}','2025-03-24 12:13:41'),
('2622cee4bc5a7dc4da4d2ebecc','{\"login_token\":\"f69bc3c82b92646f08c767049421a901\"}','2025-03-24 12:14:36'),
('262c7b0f99ca355e1f371df1b5','{\"login_token\":\"db59c4f7492a721aa394e778af5a11b2\"}','2025-03-24 12:13:49'),
('265bf3f1c0988669dcc34887a9','{\"login_token\":\"7f5c29ae85e19fcb2b6752b902040848\"}','2025-03-24 12:13:15'),
('2667f6fede533c413dda755265','{\"login_token\":\"5a640ca70da3f24a5b6967edb2c92ba5\"}','2025-03-24 12:14:37'),
('267748128a82d166d6ed9de7b6','{\"currency\":\"USD\"}','2025-03-24 12:13:52'),
('268108fabfb3b9c2cdec73731f','{\"currency\":\"USD\"}','2025-03-24 12:14:17'),
('268c86fe5ee28ca6233d7c234c','{\"login_token\":\"0ca876009087a6ebc6167340d34bb68b\"}','2025-03-24 12:13:01'),
('269d9e2660b8fae0fcf8d9cd89','{\"login_token\":\"76b5866b3d60aa8d1c9d0f08eaaf1291\"}','2025-03-24 12:13:32'),
('26a31b4b6c3b2d42ebb33209e7','{\"currency\":\"USD\"}','2025-03-24 12:13:00'),
('26ac714af8cbd9cb1b7692b827','{\"currency\":\"USD\"}','2025-03-24 12:13:50'),
('26b6c7201576bc7a0fff53beee','{\"currency\":\"USD\"}','2025-03-24 12:13:39'),
('26d9fe0a364f7a1185f817f0bc','{\"currency\":\"USD\"}','2025-03-24 12:14:25'),
('26dc8eb035e37a1a9ba7d3b97f','{\"login_token\":\"7d3f773efebeade55eb493779b4acd9b\"}','2025-03-24 12:14:21'),
('27526d786324be653d86f8e271','{\"currency\":\"USD\"}','2025-03-24 12:12:54'),
('275ecb31be2dfe2e73ac0a0783','{\"currency\":\"USD\"}','2025-03-24 12:14:39'),
('27673e2d51aa2009acc6ac1217','{\"currency\":\"USD\"}','2025-03-24 12:14:42'),
('27ad6723fa86060930ea9e2b73','{\"currency\":\"USD\"}','2025-03-24 12:13:39'),
('27bb6001e26fb9f8e96fc7f5ae','{\"login_token\":\"d5e7f595e98d6d88ba99f0b6b84227e9\"}','2025-03-24 12:13:03'),
('27c1409b63b850e37af57bbfd5','{\"currency\":\"USD\"}','2025-03-24 12:13:25'),
('27de0489c0bcd9cc2cd5cec16e','{\"currency\":\"USD\"}','2025-03-24 12:14:19'),
('28075ab819a4725a3150e2b1ef','{\"login_token\":\"53dcde231c582cb1d6e74c53dc9b82ff\"}','2025-03-24 12:13:46'),
('281f8122c4c83d63aec5d63c15','{\"currency\":\"USD\"}','2025-03-24 12:13:14'),
('28898dfdcc2f791e8e18e8f27f','{\"currency\":\"USD\"}','2025-03-24 12:14:35'),
('28c1dc481b577d44f72360f7f8','{\"currency\":\"USD\"}','2025-03-24 12:13:37'),
('28f1ccfe6571572986c4a00760','{\"currency\":\"USD\"}','2025-03-24 12:13:51'),
('28fcd190ab7d03041e2f1225b5','{\"currency\":\"USD\"}','2025-03-24 12:13:34'),
('29062d5d6e7d662068aefcbbca','{\"currency\":\"USD\"}','2025-03-24 12:14:00'),
('290669aa353e3a07192e3b91c9','{\"currency\":\"USD\"}','2025-03-24 12:14:18'),
('2993bd00a0b396edde6b44dce6','{\"currency\":\"USD\"}','2025-03-24 12:13:19'),
('299e47300bca87608e1c8e2a67','{\"currency\":\"USD\"}','2025-03-24 12:14:44'),
('29af96689be210cf098e5d00ad','{\"currency\":\"USD\"}','2025-03-24 12:14:32'),
('29b61497b7b7fd91c32c8c549b','{\"login_token\":\"533024ef5781387d95b3fbd1c55f0b9b\"}','2025-03-24 12:14:07'),
('29ce9c52442f630b15f1a1197a','{\"login_token\":\"bc4b97a167cadad6c268b7f1b08cc5f3\"}','2025-03-24 12:14:21'),
('29dad2aae777ed7e5029c31a23','{\"login_token\":\"c4569301bb04fdc85122efe11746fc6e\"}','2025-03-24 12:14:36'),
('29f743fa16ad7add929e3158b9','{\"currency\":\"USD\"}','2025-03-24 12:13:33'),
('2a076131fcde3c4afc12f8b162','{\"login_token\":\"6def513d77b4212c33f4bac8c2fe9deb\"}','2025-03-24 12:13:45'),
('2a09d60d0fd922a223293dfbcf','{\"login_token\":\"36a14654829f1ba75569dca1bed1b29d\"}','2025-03-24 12:14:00'),
('2a19bb6d9526403a90c1ed8497','{\"login_token\":\"a560576e576f4fcb324a40bcf3b5dc5a\"}','2025-03-24 12:13:51'),
('2a35f19aae8055960f7ecc39f1','{\"login_token\":\"cdfa3a574df28ac31ac4ef5ce704cc02\"}','2025-03-24 12:14:08'),
('2a4567bf7166fd521e965be056','{\"currency\":\"USD\"}','2025-03-24 12:13:24'),
('2a4c1caaaa3733c853f739c5e8','{\"currency\":\"USD\"}','2025-03-24 12:14:25'),
('2a55b8288c57db909013b7074e','{\"login_token\":\"6ebed285d375aae938a655ec1f85b9f9\"}','2025-03-24 12:13:30'),
('2aa28de375b7c73901588c0af2','{\"currency\":\"USD\"}','2025-03-24 12:14:30'),
('2aeabc936e42e70159572b3959','{\"login_token\":\"979b2d731a4478fbeee9e86d005dbf7c\"}','2025-03-24 12:12:54'),
('2afe94776c70002d3c90379575','{\"currency\":\"USD\"}','2025-03-24 12:13:11'),
('2b327e25bb3cd023405d4f8192','{\"login_token\":\"b0a91425f18b7767fc6bfc1140008bd3\"}','2025-03-24 12:14:10'),
('2b33a6d76d81d1fcb51acbed11','{\"login_token\":\"469090722829a663c3823debdee9d3c3\"}','2025-03-24 12:13:29'),
('2b523e5fb1aea509ba12a9acc4','{\"currency\":\"USD\"}','2025-03-24 12:13:05'),
('2b9acf62aed639ccc6377d6611','{\"login_token\":\"e756b46ce41b908d89bf3d87e848ce68\"}','2025-03-24 12:14:40'),
('2bb4db76edb5a95b043b203b81','{\"login_token\":\"34f8484d1ef35a6ec161f719aab38731\"}','2025-03-24 12:14:30'),
('2bd17acb1364034a55610baf8a','{\"currency\":\"USD\"}','2025-03-24 12:13:57'),
('2be0eb39833d82bb7d914b9a3c','{\"login_token\":\"ffd9ea9f97481b02added56314f338d9\"}','2025-03-24 12:14:33'),
('2c0bc7be7e84752e7415ebb212','{\"currency\":\"USD\"}','2025-03-24 12:12:59'),
('2c22016fb495aab4f78e4fd353','{\"currency\":\"USD\"}','2025-03-24 12:13:37'),
('2c477f4e21d1e73d40a0cf30d5','{\"currency\":\"USD\"}','2025-03-24 12:13:51'),
('2c490e1cd643af1f72dbf0b716','{\"currency\":\"USD\"}','2025-03-24 12:14:20'),
('2c7df9058fc25a0b71a16ae4f7','{\"login_token\":\"511290f0a8a59f619569184f62075622\"}','2025-03-24 12:13:12'),
('2c8c6ea8f9d27dffff23604cea','{\"login_token\":\"28baad5b7bc8d375c8123c1aa30b3d4c\"}','2025-03-24 12:13:21'),
('2c912fc746844c579d0b486c90','{\"login_token\":\"06eb033fc4de8d194680e3b4c6726c78\"}','2025-03-24 12:14:25'),
('2ca56499428d3802694424ef60','{\"login_token\":\"2bd0c673db3d15664b89b895fe7c24d3\"}','2025-03-24 12:13:22'),
('2cc3379e6e1a6d255f9444abb1','{\"currency\":\"USD\"}','2025-03-24 12:13:41'),
('2ccbd593ea327ed35c8bcc35b1','{\"login_token\":\"763188d8b270e2ad520f564566b985c0\"}','2025-03-24 12:14:06'),
('2ce21525147442e202de8d443c','{\"currency\":\"USD\"}','2025-03-24 12:14:14'),
('2cff88bf4547ff6db23c1b7730','{\"currency\":\"USD\"}','2025-03-24 12:13:56'),
('2d02897456be7a1356545a5109','{\"login_token\":\"18508389b4e9ca94ead73f9f1a4e7d67\"}','2025-03-24 12:13:11'),
('2d0e4c1a64a9766626a99d7f60','{\"login_token\":\"fd3b11356fc41892110ffd4ed89ca931\"}','2025-03-24 12:14:40'),
('2d3f268f9a143ab6ca064176f6','{\"currency\":\"USD\"}','2025-03-24 12:14:12'),
('2d7722f01592c70b3155e3a3be','{\"currency\":\"USD\"}','2025-03-24 12:14:38'),
('2daaf737984719971d50725e3e','{\"currency\":\"USD\"}','2025-03-24 12:12:56'),
('2db2d2850bc97169652397982f','{\"currency\":\"USD\"}','2025-03-24 12:13:28'),
('2db2d8145720776f1f421a1b4b','{\"currency\":\"USD\"}','2025-03-24 12:14:01'),
('2e3a5f4f1192b5d830c78395df','{\"login_token\":\"90ea7757797c0aa40de0dc5db5d2acfc\"}','2025-03-24 12:13:47'),
('2e674d140c5d2b716abfbb3ba5','{\"login_token\":\"4e85a5de86073191003ba334f7268865\"}','2025-03-24 12:13:09'),
('2ea79670da5d035ff8da5c1da3','{\"currency\":\"USD\"}','2025-03-24 12:14:36'),
('2efd378194673b88f76f71cb32','{\"login_token\":\"b563fa6d2fa63768d57f2364d3bcfcbd\"}','2025-03-24 12:12:51'),
('2f34a052ebc22e15772d70ad5a','{\"currency\":\"USD\"}','2025-03-24 12:13:02'),
('2f5c257358a60ff2ce4ad2970a','{\"login_token\":\"b65df04ab0f20447c54fba898b144ffb\"}','2025-03-24 12:13:54'),
('2f8758be30d221af3f2c8edb28','{\"login_token\":\"b2754722c29fb20fbe42a19678bd5600\"}','2025-03-24 12:13:32'),
('2fadd0046509e9e26f1f2fefd2','{\"currency\":\"USD\"}','2025-03-24 12:13:03'),
('2fbd162e1170b1daa132826736','{\"login_token\":\"53c4282c37d1014afac992de47e2f082\"}','2025-03-24 12:13:07'),
('2fbeeb869ed8b9618efb47a583','{\"login_token\":\"60ed36179ff35403c53775cd317be9bb\"}','2025-03-24 12:13:55'),
('2fbfc4771c472d4df12cf0bcc4','{\"login_token\":\"4ab04264c68fce9b00935d1f02423c6a\"}','2025-03-24 12:13:04'),
('2ff6bb88455311ce8140c45d21','{\"login_token\":\"611f94c3faaf712ae7a4525274a7137f\"}','2025-03-24 12:13:15'),
('2fff2786c46d5cd6fe35165cca','{\"login_token\":\"4c1b1537992ef0a3c82f0547777322da\"}','2025-03-24 12:14:36'),
('3001216889a246a28489771108','{\"currency\":\"USD\"}','2025-03-24 12:14:42'),
('301203783f26a5fee56e194b9a','{\"login_token\":\"a208e3e97b427c3cb30198c0d05f76d7\"}','2025-03-24 12:13:24'),
('3015ce01e47986740965162728','{\"login_token\":\"a20971abac9939ead1425a690d26199a\"}','2025-03-24 12:13:15'),
('301a5e9ef3c8d32ec3f614d901','{\"currency\":\"USD\"}','2025-03-24 12:13:58'),
('304924e6c17577ddb0544ebac7','{\"currency\":\"USD\"}','2025-03-24 12:13:16'),
('305163ec8cb91e41f946606273','{\"currency\":\"USD\"}','2025-03-24 12:13:07'),
('307a44710c7f004be20306fc61','{\"currency\":\"USD\"}','2025-03-24 12:12:53'),
('30a333e2d2f39a43ef8232088a','{\"login_token\":\"26ceab78ffcc5dd126daf7b4c24113f8\"}','2025-03-24 12:14:41'),
('30dd5a81c9bbd82f77b9719485','{\"currency\":\"USD\"}','2025-03-24 12:13:13'),
('30dff2c520e199c1a460a185cd','{\"currency\":\"USD\"}','2025-03-24 12:14:18'),
('30e239adbc4eaeae23cdcded85','{\"currency\":\"USD\"}','2025-03-24 12:14:34'),
('3112368902d5fdbb7884030441','{\"currency\":\"USD\"}','2025-03-24 12:13:07'),
('313a195e111bdf8cd627b0b21f','{\"login_token\":\"7642ab4e3c283ffcf834159bd3f76491\"}','2025-03-24 12:14:17'),
('315630dcea6348a50c34595a6b','{\"login_token\":\"5e918e48e594344ae4cf43a677736866\"}','2025-03-24 12:14:32'),
('315db8ae54d54866350905255b','{\"currency\":\"USD\"}','2025-03-24 12:13:39'),
('31e99e85ed2c5180a121893548','{\"currency\":\"USD\"}','2025-03-24 12:12:58'),
('324050cf225f2f9f2cd1877423','{\"currency\":\"USD\"}','2025-03-24 12:13:40'),
('326b8a332fa3e57e98078bf7f2','{\"login_token\":\"2d726690875731c7baf352904eae04fa\"}','2025-03-24 12:14:13'),
('327499cc77d120cc8712e71e39','{\"login_token\":\"d38136c44bcb0c84ac3a021da0ec6464\"}','2025-03-24 12:13:52'),
('33520217243f9425029025f360','{\"currency\":\"USD\"}','2025-03-24 12:14:25'),
('33e01eb1d6806e4628564bbe23','{\"currency\":\"USD\"}','2025-03-24 12:13:18'),
('3437ba7dfa31376b1e72a45754','{\"login_token\":\"e25b5d444eda503a2b4f7b72fb562a88\"}','2025-03-24 12:13:34'),
('34527535f6cc2a3e06d7a0919b','{\"currency\":\"USD\"}','2025-03-24 12:14:23'),
('3482b40cca481f296fc3d00c7f','{\"login_token\":\"c5247689953fa2b95a4ce86a58f7b0f3\"}','2025-03-24 12:14:28'),
('348b1b0ee3995fadb586a0e5c0','{\"currency\":\"USD\"}','2025-03-24 12:13:32'),
('348f30ea9483719a7fc14760be','{\"login_token\":\"593a158a54c3fd04d95d94b8298e8240\"}','2025-03-24 12:13:37'),
('349144465a8e17e438cbcb05ac','{\"currency\":\"USD\"}','2025-03-24 12:13:40'),
('34ac16bd8f646787b14627dff2','{\"login_token\":\"f1e1679aaf03a4fc85ec2821ee9bd6dc\"}','2025-03-24 12:14:28'),
('34dc26977632ee55e9beff9f26','{\"currency\":\"USD\"}','2025-03-24 12:13:30'),
('34e255bda0b6364f054f9bc754','{\"login_token\":\"f2c3192963ee89c0dd753c35469d421f\"}','2025-03-24 12:14:33'),
('3522171f125fc21ef394a03cdf','{\"currency\":\"USD\"}','2025-03-24 12:13:55'),
('3525e76ab874da883210d21b84','{\"login_token\":\"f830cf2cc9e96ef83de4d7f4ed6815b5\"}','2025-03-24 12:13:34'),
('3557df08662416caab8078a69b','{\"currency\":\"USD\"}','2025-03-24 12:13:02'),
('357f448782ae29dc06c2918036','{\"login_token\":\"0b45ea3d4aa4122580d1febcb616275d\"}','2025-03-24 12:13:54'),
('358cfb2b8d0867701cba92fdd6','{\"currency\":\"USD\"}','2025-03-24 12:13:17'),
('358d88b24105562c695d31b05b','{\"currency\":\"USD\"}','2025-03-24 12:13:26'),
('35a62607be93d6137ed530d026','{\"login_token\":\"802f85c91cb467b647b983dc4a61bf57\"}','2025-03-24 12:13:25'),
('35a9fa71616147d8c7af8e1956','{\"currency\":\"USD\"}','2025-03-24 12:14:38'),
('35ab8d663b3c7666cfc899ddb0','{\"currency\":\"USD\"}','2025-03-24 12:12:52'),
('35b18a0de745622b788830d9ca','{\"login_token\":\"ddb1f8c29bef389164c7eabddd77b8e1\"}','2025-03-24 12:14:12'),
('35f75c0d45fbc93c90738ebe8a','{\"currency\":\"USD\"}','2025-03-24 12:14:07'),
('360e109433cba900e91e286d99','{\"currency\":\"USD\"}','2025-03-24 12:14:26'),
('360e5592d76a76871063036ad1','{\"currency\":\"USD\"}','2025-03-24 12:13:51'),
('362c65822a60f3bb08e477be62','{\"currency\":\"USD\"}','2025-03-24 12:13:46'),
('36358ca50ef54fae8cebb50618','{\"currency\":\"USD\"}','2025-03-24 12:14:16'),
('364a3239c24afbef84bf06f5b8','{\"currency\":\"USD\"}','2025-03-24 12:13:52'),
('36684c9f5c7492e59fedd7ec1c','{\"login_token\":\"89a71a1c464318d665a2ab2f2564182d\"}','2025-03-24 12:15:10'),
('3669e6a02c80d90b7d8cb441a5','{\"currency\":\"USD\"}','2025-03-24 12:14:14'),
('3693e1847bbef8d54fa41a5f6c','{\"login_token\":\"fac54bde64b89ccf2cb2e144656d183a\"}','2025-03-24 12:13:56'),
('36bac9e2f6787e798c42f0971d','{\"currency\":\"USD\"}','2025-03-24 12:13:33'),
('36e23d057e31054c101aff6c3d','{\"currency\":\"USD\"}','2025-03-24 12:14:22'),
('36edea6fa40d6587f49a028fb1','{\"login_token\":\"a4928e4295efb2288377eac65040546c\"}','2025-03-24 12:13:33'),
('37402ca2241a7144306a0803f2','{\"login_token\":\"3b39344ba996ada14e97f589354e940f\"}','2025-03-24 12:13:56'),
('3763f242055610b8e52e07c2d9','{\"login_token\":\"df2258eefb83af3fa7d6abe6f7f6df29\"}','2025-03-24 12:14:43'),
('37667839c867bcb41d5f90273b','{\"currency\":\"USD\"}','2025-03-24 12:12:52'),
('3790ef0dc8433b59499afb166c','{\"login_token\":\"e34d802813d4c2698e0a9b0562a21647\"}','2025-03-24 12:14:00'),
('37b8ea45d8b5fcdf0d65aa3177','{\"currency\":\"USD\"}','2025-03-24 12:13:44'),
('37c37a82fe64ceecc51e8b0879','{\"login_token\":\"134026365d6d6564d91429969e443255\"}','2025-03-24 12:13:49'),
('37ea1915a3e5f04aead20ac555','{\"currency\":\"USD\"}','2025-03-24 12:14:01'),
('37eb12a7dec4cd46b802caf0c4','{\"currency\":\"USD\"}','2025-03-24 12:13:56'),
('37eddbcfafea149bf63d4e672c','{\"login_token\":\"c9a1c0c30afc77721c706a2740e4c83d\"}','2025-03-24 12:13:11'),
('37fb342f54d683d2b003dc6e03','{\"currency\":\"USD\"}','2025-03-24 12:13:58'),
('37fe0d779f8277e5b2892e9126','{\"currency\":\"USD\"}','2025-03-24 12:13:29'),
('37ff91d22d8d3a856f8cdd68a9','{\"currency\":\"USD\"}','2025-03-24 12:12:57'),
('3810f7952784d437134bf54037','{\"currency\":\"USD\"}','2025-03-24 12:14:09'),
('381ff4480ab04316e3fffadccd','{\"currency\":\"USD\"}','2025-03-24 12:13:30'),
('382ab00e9fa5ec1edc680b02f9','{\"currency\":\"USD\"}','2025-03-24 12:13:10'),
('387413a9da4be4e6bc3cd20b70','{\"currency\":\"USD\"}','2025-03-24 12:13:16'),
('388f08ddbd99db7ac263b017d2','{\"login_token\":\"268d19fc8d3dbe61ee44985037edf444\"}','2025-03-24 12:13:41'),
('38a5b7c1e4e51bd5f2a480c1e1','{\"currency\":\"USD\"}','2025-03-24 12:13:45'),
('38aec77cf55aa1386cb6830512','{\"currency\":\"USD\"}','2025-03-24 12:14:45'),
('38b860a08b4cbcdbe92f90c065','{\"currency\":\"USD\"}','2025-03-24 12:14:15'),
('38d8a1c1197f6ed1ad44168e27','{\"currency\":\"USD\"}','2025-03-24 12:14:15'),
('38e8c5afdc303efdd14358e5e9','{\"login_token\":\"3188d1f6abdc304c34fc57b747d21a0b\"}','2025-03-24 12:14:03'),
('38fcbd5e7e5d51544ead723318','{\"currency\":\"USD\"}','2025-03-24 12:13:36'),
('39021881abf8e3f7abb8349d6c','{\"login_token\":\"50b8a00d667832ed5561dd62ffa41bf2\"}','2025-03-24 12:13:38'),
('3919ad1a7aef347b3907e986b4','{\"login_token\":\"170c8e72664f546942b403406c76a8c2\"}','2025-03-24 12:14:23'),
('391ef7275fbec2b964eb1813d0','{\"currency\":\"USD\"}','2025-03-24 12:13:47'),
('393fd2ba872ca67764cb1bde6f','{\"currency\":\"USD\"}','2025-03-24 12:14:45'),
('39858d2d3c5b17c2d3c2fa82c6','{\"currency\":\"USD\"}','2025-03-24 12:13:00'),
('39af6a49870f9658258bd4e579','{\"currency\":\"USD\"}','2025-03-24 12:14:00'),
('3a005ea04348799b77f1be1903','{\"currency\":\"USD\"}','2025-03-24 12:12:52'),
('3a02dac4843c3c532802a3827b','{\"currency\":\"USD\"}','2025-03-24 12:13:14'),
('3a0c997b420d44efd5f59cb646','{\"currency\":\"USD\"}','2025-03-24 12:13:13'),
('3a69579a4f14ccca0a26b3cf8a','{\"currency\":\"USD\"}','2025-03-24 12:14:07'),
('3afbecb26a56ee5a1aae027454','{\"login_token\":\"8295a2620dc620ade97b6429dc7cea40\"}','2025-03-24 12:14:22'),
('3b176ef4e1d1a5b8d1f88645cf','{\"currency\":\"USD\"}','2025-03-24 12:13:21'),
('3b2f5192e94a4f12f2f1ca88cf','{\"login_token\":\"be9db1991eeadec533407ffb525814f5\"}','2025-03-24 12:14:19'),
('3b69d81fa0ad621185f5aa228a','{\"login_token\":\"a54a96b7470d618a79baedf9cfe86860\"}','2025-03-24 12:14:24'),
('3b749dda051c441e15e9838a1c','{\"login_token\":\"091b80a085c88ed5b4b18e6184f45ac5\"}','2025-03-24 12:14:15'),
('3b9f6645488870d6f4b796f1a1','{\"currency\":\"USD\"}','2025-03-24 12:14:41'),
('3be2bec371096afb43f02b0ae5','{\"login_token\":\"3b5e38555a69339fc42068285a94130c\"}','2025-03-24 12:13:24'),
('3c17042b85540fcb02786badf2','{\"login_token\":\"e4b78aa5a8712dc0f6a9029ce7b6efe3\"}','2025-03-24 12:12:59'),
('3c4284c3d2e66c22c70f5178fe','{\"login_token\":\"5f898f577af39d6de4278e5081e445e3\"}','2025-03-24 12:13:26'),
('3c4c997548b7694ce35121c19e','{\"login_token\":\"6b743216b4fb811915a0d4e39ae42541\"}','2025-03-24 12:14:11'),
('3ce34b3a7666220e003ca3b108','{\"login_token\":\"946df943be519789397cb010f538f33f\"}','2025-03-24 12:14:24'),
('3cf092d9399e0af12a9e4526a9','{\"login_token\":\"ba3a60d4bd6c37737d15648b60d1bbf2\"}','2025-03-24 12:12:55'),
('3cf57b804c36a8a0c25296cca7','{\"login_token\":\"03f7971b5e0aac17a9409a4cd4c468be\"}','2025-03-24 12:13:12'),
('3d1edd89809398a6a80e47e20f','{\"currency\":\"USD\"}','2025-03-24 12:14:42'),
('3d37caf88ced75efd320e7ec8e','{\"login_token\":\"7dd597d9eca9a210ddf9d82f0f72be24\"}','2025-03-24 12:14:01'),
('3d523989c7c22b7def36e5b151','{\"currency\":\"USD\"}','2025-03-24 12:13:34'),
('3d61b630b9fcad3e23f33b1891','{\"login_token\":\"493a2dda35138e14ee18a08dedf7704b\"}','2025-03-24 12:13:34'),
('3d6b336e8e4388b811afcc3f02','{\"currency\":\"USD\"}','2025-03-24 12:14:39'),
('3d7f08059b2ca8daadbe980230','{\"login_token\":\"bb8cd106e9ee5de88749a5f4e5984238\"}','2025-03-24 12:14:24'),
('3dc6484b94247a2db0cc853fff','{\"currency\":\"USD\"}','2025-03-24 12:12:51'),
('3dc71f53402b480b89f92445a7','{\"currency\":\"USD\"}','2025-03-24 12:13:42'),
('3e022648af97f32e0e802c160b','{\"login_token\":\"0dea2df97fc47cdfc4cf295dfecd4d63\"}','2025-03-24 12:14:29'),
('3e459f0ee7c95509f66ba72d32','{\"login_token\":\"fef3653ea1846e08ad739e42dd2b19b5\"}','2025-03-24 12:13:53'),
('3e576a231004de6cd63042cd78','{\"currency\":\"USD\"}','2025-03-24 12:13:44'),
('3e5cddaf2de82297f61045794b','{\"login_token\":\"cafe0dec216819a88759c499d1fcbe20\"}','2025-03-24 12:13:13'),
('3e6a54691b0e7e00cb1235e74c','{\"login_token\":\"ec12ad17fb3a5df0523641163c42366a\"}','2025-03-24 12:14:16'),
('3e9b5868a7fa9321e5c599e946','{\"login_token\":\"e5c5df8ab512feea89d0aad9e9516c84\"}','2025-03-24 12:13:03'),
('3ea6f1c10dd582821832f08e6b','{\"currency\":\"USD\"}','2025-03-24 12:13:26'),
('3ebc9468feeef3bbba576f0f73','{\"currency\":\"USD\"}','2025-03-24 12:14:18'),
('3efa27f0f14352d3e99bde7395','{\"currency\":\"USD\"}','2025-03-24 12:14:26'),
('3f1ac75a00d49aa506bba94995','{\"currency\":\"USD\"}','2025-03-24 12:14:09'),
('3f1d0764eae8425ad30f0d8f88','{\"currency\":\"USD\"}','2025-03-24 12:13:25'),
('3f3906eaadac07fc89aec83dbf','{\"currency\":\"USD\"}','2025-03-24 12:13:55'),
('3f50d1bc22ec2071b884415dd1','{\"currency\":\"USD\"}','2025-03-24 12:14:01'),
('3f8e953a366fad84c20ef5577d','{\"login_token\":\"abe8e4fa11a4613cd1bbe2eead523fa6\"}','2025-03-24 12:13:21'),
('3fb0667454c3c9f8839b9c3c8a','{\"currency\":\"USD\"}','2025-03-24 12:14:00'),
('3fef03c0808bbcea9660066f7c','{\"currency\":\"USD\"}','2025-03-24 12:14:03'),
('400cedb48759f480692138a56f','{\"login_token\":\"4ed576c507e29ff2ba14dd9ce6cacc29\"}','2025-03-24 12:13:12'),
('400d66d4918c61d060a07f3083','{\"login_token\":\"4169ce4d217a65d70617d9e5a3a5eb83\"}','2025-03-24 12:14:01'),
('4050775222fbc57d7027ce1086','{\"currency\":\"USD\"}','2025-03-24 12:14:07'),
('40c7090583bb7754612779e904','{\"login_token\":\"41f79c5b7f668c21cb0109afcbca2f7b\"}','2025-03-24 12:13:45'),
('40d60a956799b6c5e8f599e471','{\"currency\":\"USD\"}','2025-03-24 12:14:22'),
('40dee1b593aea4690509f60182','{\"login_token\":\"d981c0a7e8763c34b404d604fdbfe742\"}','2025-03-24 12:14:18'),
('4101c94eed4649ea53feec0ba8','{\"currency\":\"USD\"}','2025-03-24 12:14:17'),
('4114d110d2736b979e9025b342','{\"login_token\":\"343687378eaf03afe1c00e7b358aa1eb\"}','2025-03-24 12:14:34'),
('412b9ff0db17975b75148ab0af','{\"currency\":\"USD\"}','2025-03-24 12:13:59'),
('4146e008d55bed89c9857a3622','{\"currency\":\"USD\"}','2025-03-24 12:13:36'),
('417caed6ee8ccc7adea3d3f07c','{\"currency\":\"USD\"}','2025-03-24 12:14:14'),
('419acdf555e4bbf6304b8b4a44','{\"currency\":\"USD\"}','2025-03-24 12:14:37'),
('419e54649aac1c90b7fc83a0d8','{\"login_token\":\"2581ff692799293881a7ebf713048e03\"}','2025-03-24 12:14:16'),
('41c1a9fe6ccb7718f44c57a763','{\"currency\":\"USD\"}','2025-03-24 12:14:37'),
('41cc90cde9cc30f6c981e3d95d','{\"login_token\":\"dba6f65ae44e0ecb1a1e7ed29091e0fc\"}','2025-03-24 12:14:42'),
('41df8c61dde649f94114ea584a','{\"login_token\":\"19541cda8aa5d2b9e282c91ba16725b4\"}','2025-03-24 12:13:48'),
('42007d3a043a7764f37f886e8d','{\"currency\":\"USD\"}','2025-03-24 12:13:46'),
('420335093ce0783ca20edb7f7d','{\"login_token\":\"096e790785fe4b420d8485b32bda1c1c\"}','2025-03-24 12:14:25'),
('421b779365c21933e6d8fc7bb6','{\"currency\":\"USD\"}','2025-03-24 12:14:10'),
('42318658a90ba3ba9758511c69','{\"login_token\":\"d69299a545273eabb46cdeb955be52dc\"}','2025-03-24 12:12:58'),
('424480cb7713547cedea487a49','{\"currency\":\"USD\"}','2025-03-24 12:13:32'),
('426193d7e78febc0d0d48689f0','{\"currency\":\"USD\"}','2025-03-24 12:13:22'),
('42b39866f68d221ff10f55f734','{\"login_token\":\"3b4b695d89634efacdf401b089ee2aab\"}','2025-03-24 12:12:51'),
('42dd7fc3bc91963597babadcd9','{\"currency\":\"USD\"}','2025-03-24 12:12:53'),
('4329ded56952302e153dfa7f01','{\"login_token\":\"149fe4e093be385f7a6badb4f7e0573f\"}','2025-03-24 12:14:42'),
('43f8592c29e989607a4c0108d1','{\"currency\":\"USD\"}','2025-03-24 12:13:33'),
('43fbb06f91c5739d7b61c0df83','{\"currency\":\"USD\"}','2025-03-24 12:14:43'),
('4412427c06d735eb639985bf61','{\"login_token\":\"9c35605c8116b25a602fdda6f8d14ed9\"}','2025-03-24 12:14:03'),
('44313ec849356a685542c93a85','{\"currency\":\"USD\"}','2025-03-24 12:13:49'),
('449ddaa583ff1731f0a695c302','{\"login_token\":\"90a2e833cfb2b04e452692305c74f329\"}','2025-03-24 12:14:29'),
('44a7b21a0a81f3237f5d6488d4','{\"login_token\":\"cdef8beb80018631a7883ec43704982a\"}','2025-03-24 12:12:53'),
('44b3e737f9d60506a4bff3bf36','{\"login_token\":\"1d8a7ab270e2d4742de3ce85841cc558\"}','2025-03-24 12:13:51'),
('44ca83647dfe1341e26ed6be51','{\"login_token\":\"f5c2888e9cc96aaf7fd7f0b31f589c05\"}','2025-03-24 12:13:20'),
('44df30a2690c77d045774eaa48','{\"login_token\":\"3d9978f0e64c30ef7d4a461a42e2f00b\"}','2025-03-24 12:13:49'),
('44e16787a3b9397ee08e545d6d','{\"login_token\":\"4b6bdce14299d0d373d7d4b7177c4a39\"}','2025-03-24 12:14:08'),
('44e3e1cc686007d1f77b2fa859','{\"currency\":\"USD\"}','2025-03-24 12:14:17'),
('4517bedcc5478d4ee3c6d5d6d4','{\"login_token\":\"1267b988bff1eb1741935b21631ab731\"}','2025-03-24 12:14:26'),
('45282a93682dec3da201e016a4','{\"login_token\":\"bfa9619ec9b0825fe098bff7821ade1f\"}','2025-03-24 12:14:15'),
('4536bfff63e9419cf14ad9e0e1','{\"currency\":\"USD\"}','2025-03-24 12:13:09'),
('4545a1511dfd1391e2dae4c5a5','{\"login_token\":\"322271096bcf96e1465ad260c9630dc5\"}','2025-03-24 12:14:21'),
('4554f9206a054c040d6aa68bee','{\"currency\":\"USD\"}','2025-03-24 12:13:26'),
('458800eeb1b766c7eef9aba48e','{\"currency\":\"USD\"}','2025-03-24 12:13:03'),
('45b64febda6ff1f48271077b6b','{\"currency\":\"USD\"}','2025-03-24 12:13:36'),
('45cac662e0519680e59da6251f','{\"currency\":\"USD\"}','2025-03-24 12:14:45'),
('45dc1c55a30e79f18ed08ae43e','{\"currency\":\"USD\"}','2025-03-24 12:14:42'),
('45ffa0d8013b3aa67e83c95cb0','{\"login_token\":\"16c781d145e62662c86210387fc84ddb\"}','2025-03-24 12:13:30'),
('460b1b1a24dd0e60985d64a8eb','{\"currency\":\"USD\"}','2025-03-24 12:15:10'),
('460bc2ff75e44be5f06c7d27b0','{\"login_token\":\"1b3719a6c91986a92e22047d52504942\"}','2025-03-24 12:13:22'),
('461db96e538d67a9135435328c','{\"currency\":\"USD\"}','2025-03-24 12:13:16'),
('4631e31f7f5f597d1933a39fdf','{\"currency\":\"USD\"}','2025-03-24 12:14:32'),
('464357f7ddd64972f83161706c','{\"currency\":\"USD\"}','2025-03-24 12:12:57'),
('464ba2d724179533cb08cb1d43','{\"currency\":\"USD\"}','2025-03-24 12:13:25'),
('4691b7d0e24a7c7f9752e4be46','{\"currency\":\"USD\"}','2025-03-24 12:14:06'),
('46a1f455a56eb6304f55b97963','{\"login_token\":\"5afbfbf3b98f84145de3a20355fb4f4e\"}','2025-03-24 12:13:05'),
('46c36a01482d4e8bbca0a7b87f','{\"currency\":\"USD\"}','2025-03-24 12:13:47'),
('46cc466621c8d4c3d0a4bf4ef4','{\"currency\":\"USD\"}','2025-03-24 12:14:41'),
('46d2b01c5480e99ebfa2598330','{\"login_token\":\"ab85a61ec6d26d6890a647a01714fab0\"}','2025-03-24 12:14:35'),
('46f2767c6f38181c04b2c9c34c','{\"login_token\":\"9d2a3e519e6de347140edf94155873ae\"}','2025-03-24 12:14:03'),
('4724118b524acf661085a6aad5','{\"currency\":\"USD\"}','2025-03-24 12:13:16'),
('47571f6b62f0258d5146c9d9dd','{\"login_token\":\"b8001417dff73fb15538c2551b2d43b5\"}','2025-03-24 12:13:55'),
('477af2169ce207678729753d90','{\"login_token\":\"dc15dcb2ffdaa52aba93bd171ebde1e2\"}','2025-03-24 12:13:13'),
('47a04262370c6a5a715e8f3f0c','{\"login_token\":\"9003273f90d0a935c3e252cf984fecaa\"}','2025-03-24 12:13:39'),
('47b387fd7ec973249eaf091932','{\"login_token\":\"f5ea63f222782d0dc7b4de9f24b6a49e\"}','2025-03-24 12:12:58'),
('47d2a59dad8e760130913ed1cd','{\"login_token\":\"f02a9059c46d4b1e79ad8c8ced8e7524\"}','2025-03-24 12:14:14'),
('47d5ae110487c1aa30020c12f9','{\"currency\":\"USD\"}','2025-03-24 12:12:55'),
('47e9f5ebbc886ecdfcb01beb95','{\"currency\":\"USD\"}','2025-03-24 12:13:16'),
('480a046f5669e362d76e561ffa','{\"login_token\":\"e179aceaefc9305906f59f5bdcb42073\"}','2025-03-24 12:13:20'),
('481ba8686f9e69821ccf7e317e','{\"login_token\":\"75123134e991c507d776a728c52ce6d6\"}','2025-03-24 12:12:51'),
('4820a3c4c76cff906c3acc85c7','{\"currency\":\"USD\"}','2025-03-24 12:13:01'),
('48343f06fa9587e053faaefc42','{\"currency\":\"USD\"}','2025-03-24 12:12:57'),
('484f12eabcd82bc77fcdd58c61','{\"login_token\":\"6b8ac9c9daa0e8be59547c4c78a98479\"}','2025-03-24 12:13:49'),
('487177ec24544486da03ac2599','{\"currency\":\"USD\"}','2025-03-24 12:14:26'),
('48c5270949f0cbda3e7b488b18','{\"login_token\":\"22759c45aefb135377617ea0e8707ede\"}','2025-03-24 12:14:41'),
('49220d454ff5a80011b156ad0c','{\"currency\":\"USD\"}','2025-03-24 12:14:05'),
('4924feffa8343bfcf71894418c','{\"currency\":\"USD\"}','2025-03-24 12:14:33'),
('4925714541103c67e48714703e','{\"currency\":\"USD\"}','2025-03-24 12:14:12'),
('494ce2a5adb4e3a25b63d2836a','{\"login_token\":\"1e53b26a1aa2d584f9e36d7f39a61f00\"}','2025-03-24 12:14:30'),
('495d0398083b70d2891eeb7635','{\"currency\":\"USD\"}','2025-03-24 12:13:25'),
('4968d23dd698796020b7ed6a48','{\"currency\":\"USD\"}','2025-03-24 12:13:57'),
('49a033460a052b13f29a3fe859','{\"login_token\":\"4c46d287f8c7d6146db557dc4368acc1\"}','2025-03-24 12:13:59'),
('49a2bea44028450328b5fde701','{\"login_token\":\"09c98753ed041360d0029acf33842653\"}','2025-03-24 12:13:25'),
('49a6135aa7178f36ab27ec176a','{\"login_token\":\"5b2bcdef7fa713559b582f8a390d7d08\"}','2025-03-24 12:13:06'),
('49cc163fde1362accb522eb2d9','{\"login_token\":\"85dd64e64b653cf9877b73d626ec5feb\"}','2025-03-24 12:14:27'),
('49df035448727387e4dfe3d976','{\"currency\":\"USD\"}','2025-03-24 12:13:06'),
('4a0f01d04edb595cff3ebac558','{\"login_token\":\"03c3e4d21a769b26366fc9028ff65278\"}','2025-03-24 12:14:16'),
('4a34eeb36b22c8776865a4eb9c','{\"currency\":\"USD\"}','2025-03-24 12:13:22'),
('4a49931ae4d42be127b362485b','{\"login_token\":\"37436e3ec476a5f13666f87ac7f31339\"}','2025-03-24 12:14:19'),
('4a86ac8e51846af182400470d7','{\"login_token\":\"c9c6145094f274c073acc224c5accd28\"}','2025-03-24 12:14:40'),
('4aa12e744f8429cff3ef624c84','{\"currency\":\"USD\"}','2025-03-24 12:13:14'),
('4aadfbe4c3b8edc77b6fde138a','{\"login_token\":\"19102c5ba78a749556467ebe33346244\"}','2025-03-24 12:13:13'),
('4ab27c2cc0a629f5e6eab64d1e','{\"currency\":\"USD\"}','2025-03-24 12:12:59'),
('4b5eb130bcc5fe82337da65a73','{\"currency\":\"USD\"}','2025-03-24 12:13:20'),
('4b69abc31c4e265739164ff1dc','{\"login_token\":\"ec33782b16b9a74fe3b1f5699ef4e06b\"}','2025-03-24 12:13:05'),
('4b6d31826f9086794ef1524e4b','{\"currency\":\"USD\"}','2025-03-24 12:14:43'),
('4b7232de62300fa517d7aa27d2','{\"login_token\":\"80bee74050873ea665fcec74e53d2431\"}','2025-03-24 12:14:09'),
('4b9528e49aaf0d9b8be5251302','{\"currency\":\"USD\"}','2025-03-24 12:13:20'),
('4bb5a194c552b1d2017bf99985','{\"login_token\":\"9e9fbb77814e433640dbf1c616890cb3\"}','2025-03-24 12:13:49'),
('4bb95cc49a0c06427198beae53','{\"login_token\":\"7f75d388b6a787b7e40c9e3dbfffae7b\"}','2025-03-24 12:14:00'),
('4c18117102b52e3d55908c0374','{\"currency\":\"USD\"}','2025-03-24 12:14:39'),
('4c728af432930d035e3ca34788','{\"login_token\":\"6c4be8db02488a15ea9025511739c4a5\"}','2025-03-24 12:13:54'),
('4c7ddab1d294f21cec6a8bfc36','{\"login_token\":\"5dbbce23641adad4a4ac85bdbb1bb184\"}','2025-03-24 12:12:52'),
('4c7fa6525429aaeedcb13411d4','{\"login_token\":\"867026637a362b9008d19e8cecc5e156\"}','2025-03-24 12:14:12'),
('4c94a76d820238bc205c1eeba4','{\"currency\":\"USD\"}','2025-03-24 12:13:59'),
('4c9803abbfc2cf67eaae6e6487','{\"currency\":\"USD\"}','2025-03-24 12:13:16'),
('4c9c753fd731c1cfdb7ea95853','{\"login_token\":\"3c343000d54884c5b201b38992fa63b5\"}','2025-03-24 12:14:21'),
('4ca69104fe98341bb04e010285','{\"currency\":\"USD\"}','2025-03-24 12:14:15'),
('4cbd2ab0bda31ac1b931991a0c','{\"login_token\":\"edefe3cb3292d752bd820fed7019b5c2\"}','2025-03-24 12:12:55'),
('4cd02f02e00efd24fca0ec2635','{\"login_token\":\"a666275564fc1bc0b96119ce3f545001\"}','2025-03-24 12:14:46'),
('4cf52d45a6e9d9a1abbf1baccd','{\"login_token\":\"143ad402bb1c1390ffdd14e587d07ded\"}','2025-03-24 12:13:01'),
('4d12a9dde90e345142a459995e','{\"login_token\":\"7c8a1e15d26fead5f48a43868b69e7f6\"}','2025-03-24 12:13:55'),
('4d280b99985386d2ded96947f7','{\"login_token\":\"24ef0d92cfe9ff92b6b55a592e1889eb\"}','2025-03-24 12:13:06'),
('4d49a5818e423bf345584050ae','{\"currency\":\"USD\"}','2025-03-24 12:12:55'),
('4d4a731d26bce090e97fcae646','{\"currency\":\"USD\"}','2025-03-24 12:14:18'),
('4d4f8e6bb6d3295694cf0adbe1','{\"login_token\":\"fba3129e32ae562eec0e739f244c3830\"}','2025-03-24 12:14:11'),
('4d5379cafa70149ae4386cc0f9','{\"login_token\":\"b97031c968b53199ea5d5891e7d35d87\"}','2025-03-24 12:14:44'),
('4d6c6ae0afc8a4a7c0e58c19eb','{\"currency\":\"USD\"}','2025-03-24 12:13:33'),
('4d91504cc392d1ebfbd78a1506','{\"currency\":\"USD\"}','2025-03-24 12:13:24'),
('4da4fa10e4d68c5228d8689e21','{\"login_token\":\"336c8823ec6cce579ef2a1037b6950d0\"}','2025-03-24 12:14:13'),
('4dce3e276019851c520204a9c8','{\"currency\":\"USD\"}','2025-03-24 12:13:52'),
('4e2a6fc412bddb6eaba9590b50','{\"currency\":\"USD\"}','2025-03-24 12:13:26'),
('4e77abcdfe41564e8b45916311','{\"login_token\":\"1c4b9afade655cae730c698e1b0c42be\"}','2025-03-24 12:13:57'),
('4e7c1ccf9cb39ab46629e3744c','{\"login_token\":\"98b211d539af4ef5bbb44c5fac403571\"}','2025-03-24 12:12:55'),
('4e8f9564f006d908defa99ca14','{\"login_token\":\"88fdc08333e39c232409ccfe1a6752d5\"}','2025-03-24 12:12:57'),
('4efbb5ab576b4a64f5bf0d899c','{\"login_token\":\"b09b25645884d7d55758139a809e8e9d\"}','2025-03-24 12:13:09'),
('4f027fab7c898e418046704773','{\"login_token\":\"a771a7ae76642de79bdf5a5dc8288bd5\"}','2025-03-24 12:13:28'),
('4f03e1e84288e4fa9140020da1','{\"login_token\":\"ec01dbccc2071d95124d1c844df30f42\"}','2025-03-24 12:13:14'),
('4f15db61fb5fd4abdcf32e3c99','{\"login_token\":\"708e81de790e2d002b1dd28ae1eb779b\"}','2025-03-24 12:14:10'),
('4f26312d9c8c28b2dd6641c665','{\"currency\":\"USD\"}','2025-03-24 12:13:08'),
('4f87eb3482bc7d0c8eb48587ae','{\"login_token\":\"3d4b10751d3aaaf3d9b63c4670054343\"}','2025-03-24 12:13:45'),
('4fa4266d7a48ebd1cd5a28d233','{\"currency\":\"USD\"}','2025-03-24 12:14:08'),
('4fb0e4b3145a3c706658a29d26','{\"currency\":\"USD\"}','2025-03-24 12:14:25'),
('4ff95ebc16a4e6e8a700b3bde2','{\"login_token\":\"066f969ce15f5c71a5cf86d6735ba1d6\"}','2025-03-24 12:14:23'),
('501a31878c1da195510b0166bb','{\"login_token\":\"1575f1efd9c4ca74f7342150175f915e\"}','2025-03-24 12:14:02'),
('502a488cf6ab22bcc55b71bf66','{\"login_token\":\"04213a3232cba834934f23bdf5d2aa3a\"}','2025-03-24 12:13:07'),
('505a879dd6a0d6e4593fb879c9','{\"login_token\":\"adf11c076d4c54cef0ffe8efe351305a\"}','2025-03-24 12:14:13'),
('507d792049f1d3db503ce01745','{\"login_token\":\"a69e37c407ecf86a525d3b8223bb3e67\"}','2025-03-24 12:13:38'),
('5118a400c6f931f001f667aead','{\"currency\":\"USD\"}','2025-03-24 12:14:14'),
('51534da4ad42df32657c2c24e8','{\"login_token\":\"6f33f987381163bb3e72db9f78be3036\"}','2025-03-24 12:13:52'),
('51568fbb99ddc2824af015df95','{\"login_token\":\"079a12233676ea7d2921d3315c65e704\"}','2025-03-24 12:14:17'),
('5161489b4a1fe043b3757ffc4a','{\"login_token\":\"8b0c5ff767be3fb43ec4975e08065ebc\"}','2025-03-24 12:14:15'),
('516a725cb4756f4c3b88eff074','{\"currency\":\"USD\"}','2025-03-24 12:14:12'),
('517f2054f7011fcf52ed495284','{\"login_token\":\"4d66e9b418ae071ea225d8ae8007659d\"}','2025-03-24 12:12:52'),
('518b7e04610a66b4e4892ab470','{\"login_token\":\"cbebbcbdb74cb4131bd4040d024bd1e5\"}','2025-03-24 12:13:59'),
('51916dd59ed36cf1e83ff5c775','{\"currency\":\"USD\"}','2025-03-24 12:13:58'),
('5202cc5c52dfbaea6a9614bfa8','{\"currency\":\"USD\"}','2025-03-24 12:14:09'),
('522af995f41184447a0c2bbb58','{\"currency\":\"USD\"}','2025-03-24 12:14:04'),
('52858b9552e538176fa09ac4b6','{\"login_token\":\"1d0b4f4256a62c4f76df72336e936785\"}','2025-03-24 12:12:59'),
('5286b8b64fbf2c29ded422d7c0','{\"currency\":\"USD\"}','2025-03-24 12:14:22'),
('529b43f43f9db9239e19eb12a7','{\"login_token\":\"19785b75dfa008df927a3a98ffe5f90f\"}','2025-03-24 12:13:30'),
('52d1658f157dfdff0a6808f38a','{\"login_token\":\"a93c8537d7d48fffd88b5d5acc45bb3f\"}','2025-03-24 12:12:53'),
('52f52b2777860e6ebcf0a43486','{\"login_token\":\"06b04f287ab2407060c2b42127351761\"}','2025-03-24 12:14:30'),
('52f98247ab2d13d5fecbb1bfe8','{\"currency\":\"USD\"}','2025-03-24 12:13:10'),
('52fedfd579b53d96685132e475','{\"login_token\":\"9ad5ff2305cbcaa2b9f5154dff5c4e3d\"}','2025-03-24 12:13:09'),
('530f2502854084d4ef30ba3532','{\"login_token\":\"6db95f86a38a9bb8c1ef10a4ec50806c\"}','2025-03-24 12:12:56'),
('5330c89e716a51cb4db16fe087','{\"currency\":\"USD\"}','2025-03-24 12:13:08'),
('53a7456043ba53efd87d7725c8','{\"currency\":\"USD\"}','2025-03-24 12:13:41'),
('53be34c2d8b679db10c04defc3','{\"currency\":\"USD\"}','2025-03-24 12:14:38'),
('53c2331f33ed29bb221a32e2df','{\"login_token\":\"24847313c7e5ed56878904d9cc17649d\"}','2025-03-24 12:14:29'),
('53f9bd4f847c4ed455185c2739','{\"currency\":\"USD\"}','2025-03-24 12:13:40'),
('543136dd541a1096aaf7ccde46','{\"login_token\":\"15cb4d9e59142f571e636bee7e1ed277\"}','2025-03-24 12:12:52'),
('5431cc4abfbe90ec62a7bc4052','{\"login_token\":\"c441459748c0262cf72136c40a1f5696\"}','2025-03-24 12:13:24'),
('54605728ecb32cf37bccb89039','{\"login_token\":\"eb0663172f42ad96936d670bc6ec1360\"}','2025-03-24 12:14:24'),
('54bd89093ca0e1e51f3429138f','{\"login_token\":\"0f7e495aa921d5f8eebe3ca5eb419529\"}','2025-03-24 12:14:05'),
('54fc367dcd12fc6b1c5a611779','{\"currency\":\"USD\"}','2025-03-24 12:14:02'),
('553c896ba9c6056f798bd214f1','{\"login_token\":\"db8deaf6476c18a5d315cbb0209b5a92\"}','2025-03-24 12:13:10'),
('555058f97328345f051e2793b1','{\"currency\":\"USD\"}','2025-03-24 12:14:35'),
('5555d548e02dba2d7be9d5560b','{\"login_token\":\"7fafcceebfee7a7c9591b7b88f172cd6\"}','2025-03-24 12:13:27'),
('559a719103351055d4c47deaf4','{\"login_token\":\"08f3a1960a90b103600587581ce08708\"}','2025-03-24 12:13:25'),
('55a4f37a09f9ff0fd9c94852c1','{\"currency\":\"USD\"}','2025-03-24 12:14:06'),
('55c5cab8a17515ed1b5a11d354','{\"currency\":\"USD\"}','2025-03-24 12:13:53'),
('55ea43299e73a8deae4065ad55','{\"login_token\":\"8fb0e57110f3d09082aafdf36def4228\"}','2025-03-24 12:14:38'),
('55f2af14cf97b6506fdad1fe71','{\"login_token\":\"0d52fe311bb41645cfb31d421b82b2db\"}','2025-03-24 12:14:16'),
('55f3e6650750e98520e6c58e43','{\"login_token\":\"09ca24d044f7859f8edfec4dc4d7e3bd\"}','2025-03-24 12:13:52'),
('55f8903ad5ca202572eb8d84c1','{\"currency\":\"USD\"}','2025-03-24 12:14:10'),
('5619742ce7b8842bc6e8e2f46c','{\"login_token\":\"1bdca1217b49fe089b5d4431c907ee90\"}','2025-03-24 12:13:57'),
('56379771810db0f45587a160cd','{\"currency\":\"USD\"}','2025-03-24 12:14:02'),
('564c1723123726a11217fe7cef','{\"login_token\":\"d517b3cf017d20fb6510773045ea5e89\"}','2025-03-24 12:13:19'),
('5686676ae68c9ebb646001f644','{\"login_token\":\"90b3b9a27b484c2585d66a26b1615dbd\"}','2025-03-24 12:12:56'),
('56e62c8f80019783956e904f04','{\"currency\":\"USD\"}','2025-03-24 12:12:50'),
('571d1676a53bb7e7659f9f409b','{\"login_token\":\"a74840a35ba106620a730128863990a1\"}','2025-03-24 12:14:39'),
('5785f6fd899c7f16cd6a3b23b1','{\"currency\":\"USD\"}','2025-03-24 12:13:15'),
('579ecc4022aacd398f6035bfaa','{\"currency\":\"USD\"}','2025-03-24 12:14:11'),
('57e8bcfd2d2ade0b8d948a0545','{\"currency\":\"USD\"}','2025-03-24 12:14:23'),
('5803ea92d337f57a491dc2d8a6','{\"login_token\":\"855587990b444148a4440b819c6307e4\"}','2025-03-24 12:14:21'),
('58c753bc6f5d40cb414e042d67','{\"currency\":\"USD\"}','2025-03-24 12:13:59'),
('58cfc8bcb729d5327f62f3fdfe','{\"login_token\":\"211c32d67672575db087745a2b003891\"}','2025-03-24 12:14:31'),
('58df6d567b96f8f896c518de78','{\"currency\":\"USD\"}','2025-03-24 12:12:57'),
('593dc558ef09ba692566e70c38','{\"currency\":\"USD\"}','2025-03-24 12:13:32'),
('594ec51882f8797817bf10c58c','{\"login_token\":\"ae4b26e8a7e8553321ff8c391ef79256\"}','2025-03-24 12:13:58'),
('5959d8eccefa58121c54b894b8','{\"currency\":\"USD\"}','2025-03-24 12:13:00'),
('59816cd38b4aadb639a1fabe22','{\"login_token\":\"979a6db91cb512bf713456896571c5b8\"}','2025-03-24 12:14:20'),
('598e9717c39d03f12303c5d541','{\"currency\":\"USD\"}','2025-03-24 12:13:34'),
('598fb8c83edc54d842e8d9513b','{\"currency\":\"USD\"}','2025-03-24 12:14:30'),
('59bcc35c3965695d42c1702d25','{\"currency\":\"USD\"}','2025-03-24 12:14:03'),
('59d62836e8ba99a6f36c8205f4','{\"currency\":\"USD\"}','2025-03-24 12:14:35'),
('59f1e9c0cb4d749b15f96aa571','{\"currency\":\"USD\"}','2025-03-24 12:13:43'),
('5a045286fc08a40895cb076649','{\"login_token\":\"1354930c128254ab68ffb34a9ba0f585\"}','2025-03-24 12:14:11'),
('5a311cf515bc41b51fe60bfc0a','{\"login_token\":\"1d29976e6b3a81962c19850b8758a11d\"}','2025-03-24 12:14:24'),
('5a5205b1a0a7cf4d27bd5022e1','{\"currency\":\"USD\"}','2025-03-24 12:13:37'),
('5a594033a16a95b5b3a746b752','{\"currency\":\"USD\"}','2025-03-24 12:14:06'),
('5a5ddc9efa593069c432854568','{\"login_token\":\"080bdccf09765dc92bd45521298b929e\"}','2025-03-24 12:13:09'),
('5a6587a6a57a8449f17fd05702','{\"currency\":\"USD\"}','2025-03-24 12:13:39'),
('5a95d159b3f9e7c2e7f29a8c2f','{\"currency\":\"USD\"}','2025-03-24 12:12:53'),
('5ad8df667358a93e025f9347dd','{\"login_token\":\"ea4314a449ec9444ac2b26caa10c178e\"}','2025-03-24 12:13:10'),
('5af33a5bd30b818a7a396efc7e','{\"login_token\":\"d08a02d30429fe876d772dd64d903dc2\"}','2025-03-24 12:14:05'),
('5b0505070f53da10e82d16ef59','{\"currency\":\"USD\"}','2025-03-24 12:14:06'),
('5b40271d1a0eb52065d2f87c42','{\"currency\":\"USD\"}','2025-03-24 12:14:14'),
('5b59607e53b6bf0884005b4535','{\"currency\":\"USD\"}','2025-03-24 12:13:10'),
('5b75f7fefa76af4aff24e6fcb0','{\"login_token\":\"933dd6d30d60f61c0dab46ac87d369b9\"}','2025-03-24 12:14:06'),
('5bb1477eaa61bcc09e02fe18a8','{\"login_token\":\"44f9a59203bd5176ac34d90de0449972\"}','2025-03-24 12:13:08'),
('5bbaf1ec0992d39b6c063fc68c','{\"login_token\":\"a331caab296d9af52c042a3523610711\"}','2025-03-24 12:14:17'),
('5bebb32dc9ff3dc7bdd9855191','{\"currency\":\"USD\"}','2025-03-24 12:14:24'),
('5c0aac6024db3095fab5378409','{\"login_token\":\"aaedee0e22b3f93b0e01dc8b701f5b27\"}','2025-03-24 12:13:40'),
('5c20daf28fed3b42a76143157d','{\"login_token\":\"b0577d38ea3f9d9c3d7d015881cd022b\"}','2025-03-24 12:14:44'),
('5c4546b8e24c464bd2a26a5385','{\"login_token\":\"fab1705a5a8daa57fc479db6be531def\"}','2025-03-24 12:14:10'),
('5c5860f837c1b80cb935478bfb','{\"login_token\":\"0aa7cc2b5d2cd4efd843db94e268bd9c\"}','2025-03-24 12:13:16'),
('5c5caf8b7075aafb25bf47cc62','{\"login_token\":\"b9ea5ae0b4b6e395ce6dacab74f3f636\"}','2025-03-24 12:13:59'),
('5c60edd43af93930028eb3b4d8','{\"login_token\":\"aadd6b88d3f61373cb20ec89a8156a25\"}','2025-03-24 12:13:41'),
('5c839d6eb8f17cea21c78f04e6','{\"currency\":\"USD\"}','2025-03-24 12:13:27'),
('5ccbcda9e0d5d9a3673a050b1f','{\"currency\":\"USD\"}','2025-03-24 12:14:33'),
('5ceeca143d7d794eaac8ff1ce1','{\"login_token\":\"8bfd08cddd2f769ca3bf857ecfa23591\"}','2025-03-24 12:12:55'),
('5d0a68799f001032976cc944ae','{\"login_token\":\"787977c4ea11c7b0381b24950b1d8222\"}','2025-03-24 12:13:07'),
('5d0ba1d3f13a0edea707f8357c','{\"currency\":\"USD\"}','2025-03-24 12:14:28'),
('5d826413c98b97717459bf3d35','{\"currency\":\"USD\"}','2025-03-24 12:12:55'),
('5d949e15a5b5865b4f53ff3c1a','{\"login_token\":\"7b783ce65229ef35e0ad204f35c204fe\"}','2025-03-24 12:12:57'),
('5dcfaee3bbce059e6f4f96c58a','{\"currency\":\"USD\"}','2025-03-24 12:13:49'),
('5ddbc3255598edc34470ed89d3','{\"currency\":\"USD\"}','2025-03-24 12:14:38'),
('5df3132330393b3b3af7c6eda6','{\"login_token\":\"d9a53b626212e6459f3ca759d764caae\"}','2025-03-24 12:13:32'),
('5e0364fce63cc39efd6af8d0ce','{\"currency\":\"USD\"}','2025-03-24 12:13:08'),
('5e0371c995b06edb839a9d37f3','{\"login_token\":\"cf6d01444cdd5c071db4d371724c1c6f\"}','2025-03-24 12:14:22'),
('5e3bdd7572c0460668559165b6','{\"currency\":\"USD\"}','2025-03-24 12:13:20'),
('5e4ca916e105feb438ea35a7a6','{\"currency\":\"USD\"}','2025-03-24 12:14:45'),
('5e77827087393fbf6c67bc4631','{\"login_token\":\"184d93d7952f68737fbdf7be052b19ad\"}','2025-03-24 12:13:42'),
('5ec2568565baeaa04526072f21','{\"login_token\":\"35f9c001a1f61369bc695454ffb97b84\"}','2025-03-24 12:13:00'),
('5ecc5e2c3311f4bfab5fd1a0a3','{\"currency\":\"USD\"}','2025-03-24 12:13:35'),
('5ef97bdcc4d56080a9d11fd314','{\"currency\":\"USD\"}','2025-03-24 12:14:03'),
('5f30faeb1fef34ff53d695fea4','{\"login_token\":\"090d1eeea029d26e03812c5cea8782ec\"}','2025-03-24 12:14:43'),
('5f327f38ebc83ab2336844c3eb','{\"login_token\":\"73b8875c9ac9f2fb1e0b152b6d79d894\"}','2025-03-24 12:14:30'),
('5f9e50a5b814c8bf0f9d19c297','{\"currency\":\"USD\"}','2025-03-24 12:13:19'),
('5fcd6b2aa1a5ebeb5aac4ce3e7','{\"login_token\":\"e460f5afb77ea0df5a830bfd4bdd5836\"}','2025-03-24 12:13:43'),
('5fd6587979a5bd021d3776fb29','{\"login_token\":\"1815d2744846f68734cd701c7eb2caeb\"}','2025-03-24 12:14:25'),
('5fda474edc53afb523d327f1d5','{\"login_token\":\"6fd752246841f18e2766913938b97fd5\"}','2025-03-24 12:14:17'),
('5fec189d8ad388be0b309a5425','{\"currency\":\"USD\"}','2025-03-24 12:14:12'),
('5ff7eb647f957e4cbad4d5fb8e','{\"login_token\":\"50392a26840fa4afffe00c240253cc1e\"}','2025-03-24 12:14:27'),
('5ff974889d886fb1ff58137685','{\"login_token\":\"7bb3fc22c6b95b795e3ea38f343c371d\"}','2025-03-24 12:12:56'),
('6013b4c8ff2658652bbb24087d','{\"currency\":\"USD\"}','2025-03-24 12:14:21'),
('605ff21de13cbad2bd375f7559','{\"currency\":\"USD\"}','2025-03-24 12:13:34'),
('6092b4a29273ef7dedc72fb8df','{\"currency\":\"USD\"}','2025-03-24 12:13:13'),
('609836272c12efcc5e2b96b617','{\"login_token\":\"a93fa81a6df53aaaacef96ecea6d79be\"}','2025-03-24 12:14:38'),
('60b8517f78c6cb342be512b46f','{\"login_token\":\"9967cd76461788ae5330186869ce63a2\"}','2025-03-24 12:14:06'),
('60d4c112d07f2398ddeb1aefb4','{\"login_token\":\"72c483208d9278dca3c204f3e36d187c\"}','2025-03-24 12:14:12'),
('6102e555754c40b995dff5dc2b','{\"currency\":\"USD\"}','2025-03-24 12:13:02'),
('6152c9fa489666ff6cb45804ba','{\"login_token\":\"5a18492aec7043ca821d3f451b74246e\"}','2025-03-24 12:12:58'),
('6170d673952559af0286a07957','{\"currency\":\"USD\"}','2025-03-24 12:13:43'),
('617c3c81165979eba4482b96ca','{\"currency\":\"USD\"}','2025-03-24 12:13:42'),
('61a4e5a9bfa07b738f46f4fbdf','{\"login_token\":\"ebec938f6c0ad7d4e25c909ab9c83cd6\"}','2025-03-24 12:12:54'),
('61a7ed24039486b1f914edde56','{\"login_token\":\"1cf1b5c5dfc953ea3e11bb7db5327c52\"}','2025-03-24 12:13:46'),
('61c2559d7b2ff43076da995d64','{\"currency\":\"USD\"}','2025-03-24 12:13:24'),
('61cbe7c1a87ae0faef048ab90a','{\"currency\":\"USD\"}','2025-03-24 12:12:57'),
('6201c0ba5ca2e3d7edf818afdf','{\"login_token\":\"2045b76a8bd96d15c8dbfa6a01209023\"}','2025-03-24 12:14:27'),
('623cd01afbf6ddf74fa1510ff3','{\"currency\":\"USD\"}','2025-03-24 12:14:03'),
('625c6dc78b9419f9db37465eb0','{\"login_token\":\"62210acc7da363cc292e46a8d4344644\"}','2025-03-24 12:13:21'),
('62b77f2e9fe8734db9873a45bf','{\"login_token\":\"d7ed87f4613719f9dee071af4836f5af\"}','2025-03-24 12:12:59'),
('62c179997d8ed4c0f8d260a98d','{\"login_token\":\"3d7baf957ddabd67c2e7a750147664e3\"}','2025-03-24 12:13:46'),
('62c3305f5636d8e40d43e6adf7','{\"login_token\":\"bc22d05364864150a0d1149d73f3cbdb\"}','2025-03-24 12:13:45'),
('62e5b1cf2a7c19209d32a0414d','{\"login_token\":\"cee4617a000d834fa620d35681ff97d8\"}','2025-03-24 12:14:03'),
('62ed3099da6958f9ca3da18603','{\"login_token\":\"d7fedca7c88c60c53bd9bf97c1db077b\"}','2025-03-24 12:14:29'),
('631e6193527b8c86b745eb3391','{\"currency\":\"USD\"}','2025-03-24 12:12:53'),
('634f98bd93d402c3b129da99cf','{\"currency\":\"USD\"}','2025-03-24 12:13:13'),
('63910df5035316131eaed14c5c','{\"login_token\":\"f2af7f2fc80c92ec7a0934bc554aa20e\"}','2025-03-24 12:13:42'),
('63d8ca1de8e49d6982a644a3eb','{\"login_token\":\"18be4d5a9def0b2eb6051c61b49671d3\"}','2025-03-24 12:14:26'),
('64080b24f94f2ac98bcb46d793','{\"currency\":\"USD\"}','2025-03-24 12:14:07'),
('64120fea3815b2eac6585b2523','{\"login_token\":\"0e06b96b926258c7bf9909b2cb36dc3f\"}','2025-03-24 12:14:00'),
('641ce0756f75fb2da6ab830a10','{\"currency\":\"USD\"}','2025-03-24 12:13:42'),
('64474c6c86038a3b273c1bb4c1','{\"currency\":\"USD\"}','2025-03-24 12:12:51'),
('6467d72925b8cb26c1b6e79ee9','{\"login_token\":\"f38c9372d94fc5aebf830db58122ad2f\"}','2025-03-24 12:13:25'),
('64c518013fbcdeddfb654cb534','{\"login_token\":\"9f58a7a7efaa92b67086d543b716fc02\"}','2025-03-24 12:12:52'),
('64e4dbaf658123e64e310325b5','{\"login_token\":\"63780f1e4cd87ca954058c3f4eeaef3b\"}','2025-03-24 12:13:17'),
('6505af4183e649b6a18fcaf8d4','{\"login_token\":\"458f968abd09a7277eef16cb045f9960\"}','2025-03-24 12:13:56'),
('652fc7a56f555da8c11eda877e','{\"currency\":\"USD\"}','2025-03-24 12:14:30'),
('65448ce72611897643f33cf253','{\"login_token\":\"c14ad2ccc21189433f0718a1a4fc4c42\"}','2025-03-24 12:13:54'),
('655de21191703e13fcf51e1cae','{\"login_token\":\"f653d288f3c0f54eaf2ec4474904a31b\"}','2025-03-24 12:13:41'),
('65893ef8207cf0f1b5d06ec91f','{\"currency\":\"USD\"}','2025-03-24 12:13:22'),
('658c7b3862c553b927c16fbc1f','{\"login_token\":\"15da482632011f9d4c0458f89f88c794\"}','2025-03-24 12:14:43'),
('65a80c7eb939d6a1e631cab091','{\"currency\":\"USD\"}','2025-03-24 12:13:24'),
('65b4da3de75d9bc3cd2a482f12','{\"currency\":\"USD\"}','2025-03-24 12:13:49'),
('65c4aeb1156683c4173114a2e5','{\"currency\":\"USD\"}','2025-03-24 12:14:38'),
('661a80d831e8c4c48ebfeb9d5a','{\"currency\":\"USD\"}','2025-03-24 12:14:25'),
('6639f3f08f6d7c567e4c6b5374','{\"login_token\":\"b2b44b1eb15a90512d7d03a2d64ce0e4\"}','2025-03-24 12:13:16'),
('6647eb8058f9af463a4e0a9ab8','{\"currency\":\"USD\"}','2025-03-24 12:13:51'),
('66599d54a608fa4ff1afc77316','{\"currency\":\"USD\"}','2025-03-24 12:13:38'),
('66afcd325223f12dfb68797d11','{\"currency\":\"USD\"}','2025-03-24 12:14:12'),
('66b674ceb3412035d12f3b9c20','{\"currency\":\"USD\"}','2025-03-24 12:13:51'),
('66cc6b0e0f3e13c2e490def428','{\"login_token\":\"b041efd50c4d2e98cf5c4873b10af397\"}','2025-03-24 12:13:08'),
('66fda0f2d73ead8f38a2186b9a','{\"login_token\":\"daf49654329acb9f424dab793aa1ed95\"}','2025-03-24 12:13:38'),
('67059e246b5e4ecb1ce3fac642','{\"currency\":\"USD\"}','2025-03-24 12:13:29'),
('6715473a77c2ef742b47dafe6a','{\"currency\":\"USD\"}','2025-03-24 12:14:03'),
('6776d4917508eb898892b61bf6','{\"login_token\":\"fd40043220af00899cb42b8b7ba7c5d0\"}','2025-03-24 12:13:17'),
('678d850b17117d77abf6bf71d7','{\"login_token\":\"e795f52cd09e0a4e8b65d97d816ecddd\"}','2025-03-24 12:14:20'),
('678ee31d73c1ae1d59288a8f96','{\"login_token\":\"b1c4c7323f98b54ebdfd37ae59b46066\"}','2025-03-24 12:14:36'),
('67c43056e59fdcc5d7261e19cf','{\"currency\":\"USD\"}','2025-03-24 12:14:36'),
('67c86bf7b7d53536e007a399d7','{\"login_token\":\"5b93e9be4dbe1c0833b935d139a4e433\"}','2025-03-24 12:14:12'),
('67e71bf777fed189ca5816b2a6','{\"login_token\":\"d715a031f5111dcf8c7a0674ceedb4c1\"}','2025-03-24 12:13:24'),
('67ed87bc132db89d50bc529317','{\"currency\":\"USD\"}','2025-03-24 12:14:32'),
('67fa06f2df095018c69f5eb03a','{\"currency\":\"USD\"}','2025-03-24 12:14:19'),
('681a2ff1a51205bbd210d51e01','{\"currency\":\"USD\"}','2025-03-24 12:12:54'),
('68c479f9776780b36256bad7eb','{\"currency\":\"USD\"}','2025-03-24 12:13:06'),
('68ca6784052e7f70deb7d436ac','{\"login_token\":\"0dad501c42a6867974cff0c767f49013\"}','2025-03-24 12:14:20'),
('68cd328f202e199bbab7ac17d2','{\"login_token\":\"552db64babcd4e11f8733ef68e4ca170\"}','2025-03-24 12:13:27'),
('68ddea5ab0b9f02082cbb17975','{\"currency\":\"USD\"}','2025-03-24 12:14:02'),
('68e57793e53d04d2b2f87a7f10','{\"currency\":\"USD\"}','2025-03-24 12:13:25'),
('68fe0c55eb0b73efdd7e03bf15','{\"login_token\":\"c53e6a6b2b1a511964060977dc163c3e\"}','2025-03-24 12:13:04'),
('690410cb25b98fcee55b3ee710','{\"login_token\":\"f34e065e17d7bed0bccfaca61793daee\"}','2025-03-24 12:13:29'),
('6919760d948bb1825f4d819a04','{\"currency\":\"USD\"}','2025-03-24 12:13:06'),
('691a31cfe6d3d22eed04385b28','{\"login_token\":\"0e4558ebaf41857c46b40df5c4a1a045\"}','2025-03-24 12:13:55'),
('692f21dabcdbb99a769619a7d4','{\"currency\":\"USD\"}','2025-03-24 12:12:54'),
('693616091b0238961c58115571','{\"login_token\":\"a15929ca9624f034afa520826b1b99c3\"}','2025-03-24 12:13:09'),
('696475770bba9e3be07c121af0','{\"login_token\":\"8ed2aa147215357181f65a16ee7f643b\"}','2025-03-24 12:12:54'),
('697cfebe060a4cedbcf6a77604','{\"currency\":\"USD\"}','2025-03-24 12:13:49'),
('698492383073171da87c192a16','{\"login_token\":\"ce680beceea93fba787962ae213da26c\"}','2025-03-24 12:13:53'),
('698b57f2d29a9f6165ad6cdcea','{\"login_token\":\"5b9f7be19663b2ec94a0b6f98439e7c2\"}','2025-03-24 12:13:42'),
('699b393b1030695f3598add3d7','{\"login_token\":\"9746d71b8b626af04ad532cf42c24308\"}','2025-03-24 12:14:15'),
('69b61adfefeb2646a642b99785','{\"login_token\":\"8ecfcdfd6c7561ffb27b38f5503729b5\"}','2025-03-24 12:12:56'),
('69be16ac697caa7b80259b9e9a','{\"login_token\":\"03da2064890c5b96b9f4a5ef771ab6ba\"}','2025-03-24 12:14:11'),
('69d322c8fd4aec0adaa43e950e','{\"login_token\":\"216b544f01b46a6f64ac21861e337c91\"}','2025-03-24 12:14:39'),
('69d4158add2c9d7499299c663a','{\"login_token\":\"f39f074b3ce8eb44a6c27a5fc51792fd\"}','2025-03-24 12:12:59'),
('69dfcba567bbecd195c0edeb81','{\"login_token\":\"b63b43ea0e2329cedc931a2e05455133\"}','2025-03-24 12:13:54'),
('6a028cf6edba12690e15842f73','{\"login_token\":\"5b03bf6f4a55e5b38a2bd15e28f58805\"}','2025-03-24 12:13:46'),
('6a17f07cf103012dc65de5a1af','{\"login_token\":\"99f0ae24f6e9bb814cd39af7c5533237\"}','2025-03-24 12:13:12'),
('6a28bfd3da6675923eb67f216b','{\"login_token\":\"e6dae9ec42d0730c7e0684b66f5fe287\"}','2025-03-24 12:13:33'),
('6a5f52e64b891a5fa1e2df1806','{\"login_token\":\"78e66d7a1e9627d58b09ed16d9d4407e\"}','2025-03-24 12:13:22'),
('6aad38feea74547593dbde762d','{\"login_token\":\"ae0e65bd6ee57dbb360d64db71c9e7b5\"}','2025-03-24 12:13:21'),
('6ab9d3656ea23977c4ad2e5bc7','{\"login_token\":\"eebc63a33f8ad9a55dccdcac17f5fae5\"}','2025-03-24 12:13:26'),
('6ae05244346524bd9b8b633b23','{\"currency\":\"USD\"}','2025-03-24 12:14:02'),
('6aec6308c69add6370713152da','{\"login_token\":\"d499859175ab66e9a27e91e27dc2cc29\"}','2025-03-24 12:13:31'),
('6aed8fe1974f8653687b96a587','{\"login_token\":\"63e99edec664f5336211414aef44ca20\"}','2025-03-24 12:13:21'),
('6af0e4cf9640ce5ee321c824a7','{\"login_token\":\"8d682eb72734787485ac9c237ef2bafe\"}','2025-03-24 12:13:30'),
('6b2ba2b19e0b939b693d2cf0a5','{\"currency\":\"USD\"}','2025-03-24 12:13:20'),
('6b66e85ff8b03c41554ff37584','{\"login_token\":\"8f3e03cd78b0621063e5722205c4e777\"}','2025-03-24 12:14:29'),
('6b674d02dd3d1ba19cab216210','{\"login_token\":\"f426ea73c6565c98b9a202fbccfbe50e\"}','2025-03-24 12:14:05'),
('6b7d04e8ab7324a68437b6f701','{\"currency\":\"USD\"}','2025-03-24 12:12:52'),
('6b89f20b7005cc6838842dcbbc','{\"login_token\":\"2f707b7ddae1f6eab491c21dc8019c48\"}','2025-03-24 12:14:28'),
('6b9ae31be782bccaad9a805c29','{\"login_token\":\"6f8c30615e7a422562a22dd8e4bc52d1\"}','2025-03-24 12:14:24'),
('6bb2881dbef9b065f62eb10550','{\"currency\":\"USD\"}','2025-03-24 12:14:33'),
('6bb3e2654bcaf9ecc5318141d8','{\"currency\":\"USD\"}','2025-03-24 12:13:54'),
('6be53969591e2d92b5c7ea1efe','{\"currency\":\"USD\"}','2025-03-24 12:14:34'),
('6bf3d7a032d7b87f3268c0e60a','{\"currency\":\"USD\"}','2025-03-24 12:14:05'),
('6bf950f41416622da4c1f0745a','{\"currency\":\"USD\"}','2025-03-24 12:14:13'),
('6c001ecb9532795989972e7400','{\"login_token\":\"c64cec30a15e8b6e3413e90a8dcc4682\"}','2025-03-24 12:13:30'),
('6c239cbfc09c3c29c5031416d3','{\"currency\":\"USD\"}','2025-03-24 12:14:01'),
('6c32a3b85b53871e84d85c6fa0','{\"login_token\":\"c57f1b9fb7c4baaa36e2b28d8fcc48e1\"}','2025-03-24 12:14:43'),
('6c34377de4ec4a21631835a4dd','{\"login_token\":\"583c9e5de1ce0d56f2e268937ee2b3d2\"}','2025-03-24 12:13:42'),
('6c4c41f535fe4b2fe9d092f26e','{\"currency\":\"USD\"}','2025-03-24 12:13:50'),
('6c56d0abe64987864a25afa40e','{\"login_token\":\"1596de9a52de64e2e2eb28da62251ddd\"}','2025-03-24 12:14:26'),
('6c5f58bb0b0204ac820535a700','{\"login_token\":\"77a68d4172cca76dc501425f8dfe3c34\"}','2025-03-24 12:13:11'),
('6c75ac4dc05969d70108a33922','{\"currency\":\"USD\"}','2025-03-24 12:14:37'),
('6c89dbdbcb5392e4964bfc3d43','{\"login_token\":\"4e06539ba7a2189e5722ad626dc45793\"}','2025-03-24 12:14:44'),
('6c9e5fd0ea32b2e355bec05bf8','{\"currency\":\"USD\"}','2025-03-24 12:13:39'),
('6caa2806ced69dd9d4252262f6','{\"currency\":\"USD\"}','2025-03-24 12:14:22'),
('6ccb513a788372adddf14ee0d6','{\"currency\":\"USD\"}','2025-03-24 12:13:07'),
('6cce0e33fae0c6102ab21b44e7','{\"currency\":\"USD\"}','2025-03-24 12:14:35'),
('6d2bcf03cf1da623b525f7c87f','{\"login_token\":\"cc11402218e82f0dd4857c8dcbbbd2bd\"}','2025-03-24 12:12:52'),
('6d3c1029fafb4b93aa24356565','{\"login_token\":\"f637c7544682cdf012586db793886f6b\"}','2025-03-24 12:14:05'),
('6d47dcef303b8881c835730ab2','{\"login_token\":\"49c4cfc47e89086a3183845b1b6db33b\"}','2025-03-24 12:13:55'),
('6d7315627d6220b71e421667e0','{\"currency\":\"USD\"}','2025-03-24 12:13:56'),
('6d986d995d742844aa312d1382','{\"login_token\":\"39b04286f27e1bdb3c93d83611d546b0\"}','2025-03-24 12:13:22'),
('6dd4a0a1cfcdbd4036d2874d86','{\"login_token\":\"910eaf4629fe06736652ceb5560de034\"}','2025-03-24 12:14:11'),
('6dd4a22dadf8cd640921f07678','{\"currency\":\"USD\"}','2025-03-24 12:14:03'),
('6e199a8b588bc9edeaa1e13ee3','{\"currency\":\"USD\"}','2025-03-24 12:13:55'),
('6e1e8508ae54c4afcf91572686','{\"login_token\":\"3c02dfd51a475c9d0892ffbeac8f23fb\"}','2025-03-24 12:14:16'),
('6e8496f43ecb7cffa8c4165334','{\"login_token\":\"967631f6bf83029b3635059ab948cebb\"}','2025-03-24 12:13:57'),
('6e9b4e7478f130936bbe8c42de','{\"currency\":\"USD\"}','2025-03-24 12:14:05'),
('6ebb101d5dbba3c37ac057affb','{\"currency\":\"USD\"}','2025-03-24 12:14:07'),
('6ec206ebef5b7b8af103203cad','{\"currency\":\"USD\"}','2025-03-24 12:14:34'),
('6ec2097a7a6804934bbe65f877','{\"currency\":\"USD\"}','2025-03-24 12:13:33'),
('6ef97111d7dbb827b713f212bf','{\"login_token\":\"e8962a9ce64b582398b0d52b8690717c\"}','2025-03-24 12:13:45'),
('6f20e7a7bd5f533f7b71b4bbf6','{\"login_token\":\"c8574372d1e82fcc2f975aee87a11b8e\"}','2025-03-24 12:14:02'),
('6f3633f2f52bc211191fae8add','{\"currency\":\"USD\"}','2025-03-24 12:13:40'),
('6f750bc7857b55cddbaae46a50','{\"login_token\":\"ec52c8159f69ecb160a009b329382404\"}','2025-03-24 12:13:16'),
('6f7fbe65c03fa51c6531b80250','{\"login_token\":\"b937235e64499f5ef412c91ce72ecbef\"}','2025-03-24 12:13:27'),
('6f8fc1d53ec30da5745f284daa','{\"currency\":\"USD\"}','2025-03-24 12:14:27'),
('6fe808c92584fde5c7ddf9c7a5','{\"currency\":\"USD\"}','2025-03-24 12:14:11'),
('6ffb59b2611ce95287e081b527','{\"login_token\":\"bbb4638f612bec64f288b6d521d53eb4\"}','2025-03-24 12:14:18'),
('7037862c11de73d27e3d501e70','{\"currency\":\"USD\"}','2025-03-24 12:14:36'),
('705974d956c7f65acbb5d24f22','{\"login_token\":\"db989dfaedc87fdc2b32741e28a7c6f9\"}','2025-03-24 12:13:53'),
('7068e1eacb1c38843a20563322','{\"login_token\":\"2d4cc9bbdb6737f9f5cf41452a510659\"}','2025-03-24 12:12:59'),
('7077d7e627fcae64bddb5d1584','{\"currency\":\"USD\"}','2025-03-24 12:13:28'),
('70bb877f8d0228caa76faebe1f','{\"login_token\":\"ce8417d8dadc7538d3e9cd83ca31c839\"}','2025-03-24 12:12:52'),
('70ce3b1ad3bf3b324e31ac9916','{\"currency\":\"USD\"}','2025-03-24 12:13:54'),
('70e50416b02e8eaa28ac1238f5','{\"currency\":\"USD\"}','2025-03-24 12:14:04'),
('70fc26f7e9663df18087e00dfb','{\"currency\":\"USD\"}','2025-03-24 12:14:04'),
('7125341bb63e0fbfd6cf4adee5','{\"currency\":\"USD\"}','2025-03-24 12:12:50'),
('712d8f39b8ea64b6c6af5e0295','{\"currency\":\"USD\"}','2025-03-24 12:12:51'),
('713d92dc95bfd3b43074c0f0cf','{\"currency\":\"USD\"}','2025-03-24 12:14:18'),
('7154c52e994ee9607cffb262ca','{\"login_token\":\"440de112204e12f0bf5fb642094a11c6\"}','2025-03-24 12:12:52'),
('7172f98d1bdebbd35c499c30ec','{\"login_token\":\"2229a5b454ec18bcc0404859ed6d403d\"}','2025-03-24 12:13:23'),
('71c3598cf251745d6066255bcc','{\"currency\":\"USD\"}','2025-03-24 12:14:17'),
('71c77c8dcfa58e12688af34baa','{\"currency\":\"USD\"}','2025-03-24 12:14:38'),
('71dd76a0ad5159e5467ddaef21','{\"currency\":\"USD\"}','2025-03-24 12:12:56'),
('72087a0d89f570c717804a4ca9','{\"currency\":\"USD\"}','2025-03-24 12:14:40'),
('720b490e639a28571786b2952e','{\"login_token\":\"b4f021cea4f2ff0318db82eff8f79b97\"}','2025-03-24 12:13:53'),
('72134ba7b14447dbdb759d0eb6','{\"currency\":\"USD\"}','2025-03-24 12:13:15'),
('7216e2904e90c86cfbd0e4ac39','{\"login_token\":\"87737b26eb765b2603d1b64e60e6e4d0\"}','2025-03-24 12:14:04'),
('721a7618cda6c73107662d53e1','{\"login_token\":\"c2dc0fe108c9a8977f38a14781d15559\"}','2025-03-24 12:14:33'),
('7230024520f06d0e8892d0615e','{\"currency\":\"USD\"}','2025-03-24 12:13:28'),
('725cf81f8c7776b76b95dc2064','{\"login_token\":\"36c45fbaf442a400a125a003e4aa003e\"}','2025-03-24 12:13:29'),
('72685d7c3c8fd33f24a23abb89','{\"currency\":\"USD\"}','2025-03-24 12:14:15'),
('726a3ae37bd093cff39fe9f836','{\"login_token\":\"a1c8eabf7aab70e9dbfff24715298f72\"}','2025-03-24 12:14:13'),
('728ce49f94d45cce32f543bdb0','{\"currency\":\"USD\"}','2025-03-24 12:14:33'),
('7305bd5046d99f83eed5343661','{\"currency\":\"USD\"}','2025-03-24 12:13:58'),
('7383a961ddacc6f57d59643684','{\"login_token\":\"5bbaedf4ad6341d004e52441979275db\"}','2025-03-24 12:13:13'),
('738d8f02385fd14144bbd25f46','{\"currency\":\"USD\"}','2025-03-24 12:13:48'),
('738ffd738d6ce3a0153ca2990c','{\"login_token\":\"487d2d077a65e275f99845342aeda5fb\"}','2025-03-24 12:13:47'),
('73bb902af14488afea16e4da25','{\"login_token\":\"3273923b8ffed5fc31808cf5dccf8f9e\"}','2025-03-24 12:14:20'),
('73d0dbd945ece7900ad2298606','{\"login_token\":\"8c65030d0cab9961b1a7149e7d54934a\"}','2025-03-24 12:14:27'),
('73f9fdef42e9593452a0168456','{\"currency\":\"USD\"}','2025-03-24 12:14:34'),
('73fcd77669464bfd6650edcdbd','{\"login_token\":\"c99a5d07d6b0c68f33a4056f721cc8ff\"}','2025-03-24 12:14:19'),
('74331ae1a79ff93bb3aa8d64db','{\"login_token\":\"e870b2e01e70839601de1472e8407308\"}','2025-03-24 12:14:25'),
('7441173b43e8ece49ec9106d54','{\"currency\":\"USD\"}','2025-03-24 12:14:22'),
('7460e8dbc6e4e5322320659a70','{\"currency\":\"USD\"}','2025-03-24 12:14:22'),
('74649e818a2dfe595efb0be416','{\"currency\":\"USD\"}','2025-03-24 12:14:34'),
('746cb4db6958d4948cc109973d','{\"login_token\":\"a85663775979c80e98ec4aef10dbf70a\"}','2025-03-24 12:12:56'),
('748cb3801a93209774f33c2793','{\"login_token\":\"9714dfe6f0e56d8a1fc102548f88ab92\"}','2025-03-24 12:14:41'),
('74b09cce1edb6503a7e1d38b25','{\"currency\":\"USD\"}','2025-03-24 12:13:12'),
('74c03be7191dd31c218534ca0c','{\"login_token\":\"580ac23bc3b05758df4f8d9739fb24d7\"}','2025-03-24 12:14:21'),
('752fff613eecbb0d3cacb1b412','{\"currency\":\"USD\"}','2025-03-24 12:14:12'),
('753c33637d7b9a53d70d0c4e99','{\"login_token\":\"affa35cefd382627f2625776877642d5\"}','2025-03-24 12:13:58'),
('757c404102c7a71fe4b95acd35','{\"login_token\":\"d6629d0105916b30a2897dfcde60ae62\"}','2025-03-24 12:14:18'),
('7604f7f7ff3fa3359ea80e2862','{\"currency\":\"USD\"}','2025-03-24 12:13:22'),
('761a9c2836ddf875f7c9a5d379','{\"currency\":\"USD\"}','2025-03-24 12:14:02'),
('76450d46c34651b51d96986d21','{\"login_token\":\"b8dc3b3305428925a24c24864cd75e62\"}','2025-03-24 12:14:12'),
('764780ae75c2224710bffd5a6a','{\"currency\":\"USD\"}','2025-03-24 12:13:13'),
('764f92647e7764c12f2c4a3e88','{\"currency\":\"USD\"}','2025-03-24 12:13:46'),
('768cacd1335f21e027690b5c0d','{\"login_token\":\"4e14595f80d0dc6986f48ef9913f3dac\"}','2025-03-24 12:13:21'),
('7691841c3684ef7e9469617def','{\"login_token\":\"52a931c75901d494c8b35f2b6921d3f5\"}','2025-03-24 12:13:03'),
('771c461298cde17744a48fdab3','{\"currency\":\"USD\"}','2025-03-24 12:13:40'),
('77477662e5b43c9eca3ac94415','{\"currency\":\"USD\"}','2025-03-24 12:14:27'),
('774a3f0dfefef3575f8bf7ca66','{\"currency\":\"USD\"}','2025-03-24 12:13:55'),
('7761f61791b145e70095240447','{\"currency\":\"USD\"}','2025-03-24 12:12:59'),
('776a8aa476819777911251a46f','{\"login_token\":\"1d613a3369b4cde8f3ca33de7084f779\"}','2025-03-24 12:12:52'),
('7771863603a826bb0b880a5e4a','{\"login_token\":\"bc8ca6d58f205b4d53da6bb3ba2923e9\"}','2025-03-24 12:13:52'),
('77ee79272e1a95762768d53008','{\"login_token\":\"092e0edc6973844738c746bf01f921ed\"}','2025-03-24 12:14:21'),
('7828f29478e865c0a823b053f9','{\"login_token\":\"bdfed7155bb046520a38bd27ad3785d1\"}','2025-03-24 12:13:33'),
('78534f17718e3dcc67712adba9','{\"login_token\":\"8e024be4391dc859474a4bd434a49fc9\"}','2025-03-24 12:13:44'),
('78645f0a05c591b1badb851150','{\"currency\":\"USD\"}','2025-03-24 12:12:58'),
('78b63d6a09ab575a21585838a1','{\"currency\":\"USD\"}','2025-03-24 12:13:11'),
('78bcc1f14db25adc95148ac92d','{\"currency\":\"USD\"}','2025-03-24 12:14:35'),
('78c1aa9d67cd4649be5ab652b4','{\"currency\":\"USD\"}','2025-03-24 12:14:28'),
('78f158f706083e035566f296b9','{\"currency\":\"USD\"}','2025-03-24 12:14:01'),
('79574b10abf734c5b82282fef1','{\"login_token\":\"932e60c0dd6b1b08d9549cbb4b9568a9\"}','2025-03-24 12:13:50'),
('79823d66c92598d4fe59e9758b','{\"login_token\":\"9f3783cc381cd795713b9eb8c812f0de\"}','2025-03-24 12:13:38'),
('79f3d53fca81caff07897fb870','{\"currency\":\"USD\"}','2025-03-24 12:13:55'),
('7a04e30bfc932006d95f8e2670','{\"currency\":\"USD\"}','2025-03-24 12:14:08'),
('7a06761704d97ddfbbc1acf6dc','{\"currency\":\"USD\"}','2025-03-24 12:14:31'),
('7a2f5cbbb8ad4b93fab67cd72d','{\"currency\":\"USD\"}','2025-03-24 12:13:09'),
('7aa44522161d3bc24b4a59b15f','{\"currency\":\"USD\"}','2025-03-24 12:13:35'),
('7ae5c0d037dda4ad03cf489771','{\"login_token\":\"e36a9a0470f0fa280ee2f5aa25220d4d\"}','2025-03-24 12:13:26'),
('7af1a85b4660914bffa134affe','{\"login_token\":\"5e0c5b3c1d658c1a7819c4dc19b06e44\"}','2025-03-24 12:13:03'),
('7b04742128b28096736db0a7db','{\"currency\":\"USD\"}','2025-03-24 12:13:37'),
('7b1c88a488df002036d4479fdb','{\"currency\":\"USD\"}','2025-03-24 12:13:02'),
('7b2433edbf3101ffbb7d4613ee','{\"currency\":\"USD\"}','2025-03-24 12:14:37'),
('7b5f02e42ca02e0f0093451142','{\"currency\":\"USD\"}','2025-03-24 12:14:09'),
('7b6a7e2fa1c85fa0a2c83a9381','{\"currency\":\"USD\"}','2025-03-24 12:14:16'),
('7b8c6845995d3ecedc2a27cf7d','{\"login_token\":\"87ff5e295e40ccb099f43ffc7df2c9a3\"}','2025-03-24 12:14:39'),
('7bb2e4618f9f38c82b23745f00','{\"login_token\":\"4619befbaa1de8c9dbd1ad6a69deed46\"}','2025-03-24 12:14:19'),
('7bbbe54fef8d7e8edb0f669212','{\"login_token\":\"f42563717dee9f4e076d4d1bfa41e571\"}','2025-03-24 12:14:01'),
('7bcd06a0c6fc47940b4b5872d4','{\"currency\":\"USD\"}','2025-03-24 12:14:36'),
('7be5758d3c43fc88c54627ba2d','{\"login_token\":\"c68ed524bd41ea0a11b8ddd13c7308c0\"}','2025-03-24 12:14:27'),
('7bf4e2922c37ea7b6598485a70','{\"currency\":\"USD\"}','2025-03-24 12:13:28'),
('7c1ef30c6fca3a1644538db63b','{\"currency\":\"USD\"}','2025-03-24 12:13:01'),
('7c29a84ec3f6cb366e77b88a9a','{\"currency\":\"USD\"}','2025-03-24 12:13:58'),
('7c2aec11695e3bed91bc2212c3','{\"login_token\":\"30c3f0e4fa4acd1bffa0f1da5f02baf3\"}','2025-03-24 12:13:41'),
('7c3e13363427e2f993dfba84bd','{\"login_token\":\"882a0b52489ef32c062ce5a11b63fcc4\"}','2025-03-24 12:13:21'),
('7c7b9f00e928bae54f8d94fc55','{\"login_token\":\"d59c33b8112068d488e8f04208433eba\"}','2025-03-24 12:13:16'),
('7c83a980e87f48b76d68df8b42','{\"currency\":\"USD\"}','2025-03-24 12:13:07'),
('7c9276d486ceb749014b82fbfa','{\"login_token\":\"74a4d7dc04d3971a4f9695ba296c1cd0\"}','2025-03-24 12:14:34'),
('7cdb6456ab25ed3cb911ee755e','{\"currency\":\"USD\"}','2025-03-24 12:14:40'),
('7d00c0defc0b0364eff5aca7d3','{\"currency\":\"USD\"}','2025-03-24 12:14:00'),
('7d3d6790404adb8c305dd7c774','{\"currency\":\"USD\"}','2025-03-24 12:13:05'),
('7da50f0e46ad629c4457b5dfa6','{\"login_token\":\"fedf18eefb48f5c94bfa15f5deeda995\"}','2025-03-24 12:14:30'),
('7da7f182d01776d14b3ed04d5f','{\"currency\":\"USD\"}','2025-03-24 12:14:27'),
('7de32e4a0f69329d6c396cea21','{\"login_token\":\"90c3805b3ff97bee29c54c1f331c3680\"}','2025-03-24 12:13:01'),
('7de7cf19a4ab64a6c5953a9bae','{\"login_token\":\"b58ddeb18fc7f328340de6d19a5ef9f2\"}','2025-03-24 12:13:37'),
('7e0828c0d47b6e3570b1f22bb9','{\"login_token\":\"c8ccf229d8a244f0bfc7a9e6705a6a40\"}','2025-03-24 12:13:10'),
('7e2358738b1bb13b3cb24478c8','{\"login_token\":\"45e34196828f30ed330ba26748c38abf\"}','2025-03-24 12:14:09'),
('7e2aaf794477b1835242067f90','{\"currency\":\"USD\"}','2025-03-24 12:12:51'),
('7e38fd7d40c123abe6880ea95d','{\"currency\":\"USD\"}','2025-03-24 12:12:51'),
('7e3b98c877602ebd4ecb51245e','{\"login_token\":\"842192206a6b36cfdc64bd219b45c386\"}','2025-03-24 12:13:53'),
('7ec96f5a98c1be922f1031f43e','{\"currency\":\"USD\"}','2025-03-24 12:13:05'),
('7ed9e437035991f9eaff84001d','{\"currency\":\"USD\"}','2025-03-24 12:14:29'),
('7edd9f05bb4d41ddf8724c37d2','{\"login_token\":\"710c3a8f7f8223314dc71da0cc2f00f1\"}','2025-03-24 12:14:12'),
('7ee113e83eae06a59fe18e7227','{\"currency\":\"USD\"}','2025-03-24 12:14:11'),
('7f3ecfb6424378cbd800ff3efd','{\"currency\":\"USD\"}','2025-03-24 12:13:07'),
('7f4aaa40c0144360fd1fef86ae','{\"currency\":\"USD\"}','2025-03-24 12:13:18'),
('7f6e90a2f9ddc8ffbe5d2dd687','{\"currency\":\"USD\"}','2025-03-24 12:14:28'),
('7f821bfd133db78587f6e937de','{\"currency\":\"USD\"}','2025-03-24 12:13:33'),
('7f8dfb6b4415ae8115fb19a157','{\"login_token\":\"89e1bf639c75efced67b056c752bdd76\"}','2025-03-24 12:13:45'),
('7fd9cc7c8f2c4996ff638af5ba','{\"currency\":\"USD\"}','2025-03-24 12:14:38'),
('7fdeb1e8756a98f02b5c465feb','{\"login_token\":\"571fe8757983bdd259a777bfdbf11f2c\"}','2025-03-24 12:13:01'),
('7fe63afa68d06b91a0e29c1ed7','{\"currency\":\"USD\"}','2025-03-24 12:14:40'),
('8054e8a52221731fcd154922ba','{\"currency\":\"USD\"}','2025-03-24 12:12:56'),
('807576811e381621eb031cf17a','{\"login_token\":\"d948bd51ab0aa25550380029f626c7ff\"}','2025-03-24 12:13:25'),
('807dcd97cc882c893e7d47c438','{\"login_token\":\"453acb41b3530c4c8b7ae214be3b70e3\"}','2025-03-24 12:13:19'),
('80b3fcad39f7d79d972c5fbd0c','{\"currency\":\"USD\"}','2025-03-24 12:14:29'),
('80b846b6c8da513ba0740cea61','{\"currency\":\"USD\"}','2025-03-24 12:13:40'),
('80b9ba32b146be43d84687d620','{\"login_token\":\"6c50cc90368578b798f12fa052719226\"}','2025-03-24 12:12:56'),
('80dd385db1ee48e14ccf49e070','{\"login_token\":\"5e4cd11aee5561b027243cc2316b49b9\"}','2025-03-24 12:14:00'),
('813a630abc253f6b3347fcd336','{\"currency\":\"USD\"}','2025-03-24 12:13:17'),
('81451b62f98e9b240506fa8de3','{\"login_token\":\"67ae9e8f3f2bfec69e78370ce8a8b99b\"}','2025-03-24 12:13:12'),
('81519e2229052d1cfee443cc54','{\"currency\":\"USD\"}','2025-03-24 12:13:57'),
('817ed757d40bd6e1bb8258b9db','{\"login_token\":\"73db0c63dea5fce01a297e29bcc05984\"}','2025-03-24 12:14:07'),
('81bea5e62fbdef27652ce75c7a','{\"currency\":\"USD\"}','2025-03-24 12:14:37'),
('81c24b51ef5e616b6101f79e7d','{\"currency\":\"USD\"}','2025-03-24 12:13:07'),
('81f53d01d6ed7a30e04cbc0978','{\"login_token\":\"e1d7e822c191731e38f509805471d14a\"}','2025-03-24 12:12:57'),
('81fd743c33facd66cadb04fc78','{\"login_token\":\"de56371870c3e71040bfbaa7388039ce\"}','2025-03-24 12:13:26'),
('82209bc5766a56b1448fe1cea8','{\"login_token\":\"7356a4b5f458c7b826fc8aa7f756a2e5\"}','2025-03-24 12:12:50'),
('823a27935a45fc8ecbfb21982d','{\"currency\":\"USD\"}','2025-03-24 12:14:21'),
('823baa5890f9a12e7044a70182','{\"currency\":\"USD\"}','2025-03-24 12:14:39'),
('823fb2c659ee39cd32573a2a7d','{\"currency\":\"USD\"}','2025-03-24 12:13:14'),
('824fdc96a2ac983f1b3e678ca9','{\"login_token\":\"0495d0ba1de6cfbf7e968aab3d8adbff\"}','2025-03-24 12:13:46'),
('825659a8a74092303873f7304a','{\"currency\":\"USD\"}','2025-03-24 12:14:33'),
('82566754624f4f1d45ab155fe1','{\"currency\":\"USD\"}','2025-03-24 12:14:17'),
('8261b68972ff69d57cd33bfdf3','{\"login_token\":\"e05abdcee218c3fb5fa15e5e2800dcfd\"}','2025-03-24 12:14:32'),
('829528b6ee23f117beb446dae7','{\"currency\":\"USD\"}','2025-03-24 12:13:18'),
('82c7c1c84a93645bedb6a6da70','{\"login_token\":\"d16e51229e54d2bf486956a6c066cae1\"}','2025-03-24 12:14:43'),
('830d9d70ca76bd82458e154490','{\"currency\":\"USD\"}','2025-03-24 12:13:57'),
('831e0fbe0e070f8950647b1cac','{\"login_token\":\"b27e984999572ae48507d67ce21f9199\"}','2025-03-24 12:14:10'),
('831f24df7d93c236439c981f52','{\"currency\":\"USD\"}','2025-03-24 12:13:54'),
('833486bf7fa30a7f634b0e53f6','{\"currency\":\"USD\"}','2025-03-24 12:14:33'),
('833b6d8e9ad066b02aa6e5b9a7','{\"login_token\":\"876131ee4f2c8f1a1d468a016da105bd\"}','2025-03-24 12:13:00'),
('837ba2fad15da6d31525fbfe46','{\"login_token\":\"304c995f64ea59814281886ee3142a90\"}','2025-03-24 12:14:13'),
('838b7f849cd3f6cdbe559bfbf3','{\"login_token\":\"bbab2c9d22dac42b631081047fc36b17\"}','2025-03-24 12:13:13'),
('83a51d9c53a770e453bdae4f4a','{\"currency\":\"USD\"}','2025-03-24 12:13:22'),
('83e8bc0795281ce2ad62637146','{\"login_token\":\"47393a08363085f82bf79f61f0ff58b6\"}','2025-03-24 12:14:40'),
('83f99f0cc0683f802d70888737','{\"currency\":\"USD\"}','2025-03-24 12:13:36'),
('842511ac061b2841a3f2e2a911','{\"login_token\":\"ed82d5c451719e3b439773722292e504\"}','2025-03-24 12:14:22'),
('844c8cee40e78a76b7f6fd757e','{\"currency\":\"USD\"}','2025-03-24 12:13:38'),
('844ced173df3d30ffc22fe9a9c','{\"currency\":\"USD\"}','2025-03-24 12:14:24'),
('84506ff875c66c509495bb69aa','{\"login_token\":\"809923a5d7048bbc92d1b615d27536c6\"}','2025-03-24 12:14:18'),
('84e8d8d883bbf975f8f02f89a2','{\"currency\":\"USD\"}','2025-03-24 12:13:55'),
('84eb3697ac81b0561cd5a8017c','{\"currency\":\"USD\"}','2025-03-24 12:13:47'),
('85693a13ac398471945d610248','{\"currency\":\"USD\"}','2025-03-24 12:13:52'),
('857e54c54b16f5094ffb0dc561','{\"login_token\":\"a126d8140a1fe39c54aad3afc890efd6\"}','2025-03-24 12:12:56'),
('85a9dd65184bfb172c80925cf0','{\"currency\":\"USD\"}','2025-03-24 12:13:34'),
('85afd13e504642839e33ffb00b','{\"login_token\":\"883ffc7da527d92fd6020a6d394c745d\"}','2025-03-24 12:14:18'),
('85cb4961206e9757a1deaeca50','{\"currency\":\"USD\"}','2025-03-24 12:14:12'),
('85dce7a336bbe0f7d6ec582e7f','{\"currency\":\"USD\"}','2025-03-24 12:14:10'),
('8627eadf472bdcac5b88c92cd7','{\"currency\":\"USD\"}','2025-03-24 12:13:38'),
('86315a44eabc15419095153ba2','{\"currency\":\"USD\"}','2025-03-24 12:14:31'),
('8637eacfda48c9135b9603ab55','{\"login_token\":\"a541d78d17b47e02a5ed2146e9150389\"}','2025-03-24 12:13:42'),
('8649e45fb229e9c63dc55929be','{\"login_token\":\"959b344e306c17625d8f8bb3d0a61c5d\"}','2025-03-24 12:14:24'),
('865bac25cab9eb87a0ce6dfdc4','{\"login_token\":\"661e7a4334b6c4668fbb30d2e5464eee\"}','2025-03-24 12:13:14'),
('867b3976354c3add28e27b2ff9','{\"currency\":\"USD\"}','2025-03-24 12:13:27'),
('8681864a1746201bb54c9188f3','{\"currency\":\"USD\"}','2025-03-24 12:14:28'),
('86a43775c38500babf72aa1d92','{\"login_token\":\"2d6ecc0b55475761dc428d505f19a58e\"}','2025-03-24 12:13:13'),
('86aa8691a1be7617b38590dc36','{\"currency\":\"USD\"}','2025-03-24 12:13:59'),
('86aaca678c9fa6cb1f20b6bdc4','{\"currency\":\"USD\"}','2025-03-24 12:14:42'),
('86f1a37bc2cab8bff695940104','{\"currency\":\"USD\"}','2025-03-24 12:13:03'),
('8706336b6dd3a94fd262414db2','{\"currency\":\"USD\"}','2025-03-24 12:13:13'),
('8708be1a93ccbc15be79291202','{\"login_token\":\"271c5c83ba2329d581cf01444c90e113\"}','2025-03-24 12:14:27'),
('870f171bc598b4a66b82c3b0a8','{\"login_token\":\"568607ca483baaf1100b3532f3ead00a\"}','2025-03-24 12:13:23'),
('8720238c63767360e63b1ba250','{\"login_token\":\"3fbbd5e0de8e7554d9bee35d97a77ed7\"}','2025-03-24 12:13:29'),
('873c825a81c38102862826df6d','{\"currency\":\"USD\"}','2025-03-24 12:12:53'),
('879e81bad61ea9ff9ac9dfb98e','{\"currency\":\"USD\"}','2025-03-24 12:13:17'),
('87a4a3db96bece8e340c77b198','{\"currency\":\"USD\"}','2025-03-24 12:14:43'),
('87a9b4be5faccb76938de7d7e7','{\"login_token\":\"49e9a479f27073aa6b33e1d0e624009e\"}','2025-03-24 12:13:42'),
('87d315448ff6be5d859e541ee8','{\"currency\":\"USD\"}','2025-03-24 12:13:54'),
('87ede6771fd25bd3c71298ba30','{\"login_token\":\"034d1c8b9af382c6953b347e0076bbe8\"}','2025-03-24 12:13:39'),
('87fafd12816ab46f5e1896c9b7','{\"login_token\":\"fc9671da2b7bbc94d6bd33a10ebb0b6b\"}','2025-03-24 12:13:07'),
('87ff149dfa268e919401997959','{\"currency\":\"USD\"}','2025-03-24 12:12:55'),
('880775e6b877cb80f85c717c9b','{\"login_token\":\"cf9e53c69041881049912aca77320b88\"}','2025-03-24 12:14:04'),
('8842f66188a99bced6ef1460de','{\"login_token\":\"bd6c12a6da74c95bf720691ee7f067af\"}','2025-03-24 12:13:22'),
('8866d15ec25a632f2d1188f670','{\"login_token\":\"1db93183b6930518f11223549dd408bb\"}','2025-03-24 12:14:28'),
('88832acb9a6cb164c9ed657e70','{\"currency\":\"USD\"}','2025-03-24 12:13:06'),
('8888ad9531d12d03a1c9305ed0','{\"currency\":\"USD\"}','2025-03-24 12:14:42'),
('88b0cf743091d0da748ee3f647','{\"currency\":\"USD\"}','2025-03-24 12:13:36'),
('88e8c6b0ffca1ad4a0f7a71f50','{\"currency\":\"USD\"}','2025-03-24 12:14:39'),
('88fb579b5f7e5e357f6d913ff7','{\"currency\":\"USD\"}','2025-03-24 12:13:27'),
('891b439cb85354b1b42fad5837','{\"currency\":\"USD\"}','2025-03-24 12:13:05'),
('8922debba35fb3721177ece757','{\"currency\":\"USD\"}','2025-03-24 12:13:42'),
('892eb5fd6173e1cdb0ae34d218','{\"login_token\":\"c470b71cdf9b66a4e91212c60f742b6c\"}','2025-03-24 12:13:01'),
('896a4001f3c016826421e11bce','{\"login_token\":\"014412595eb54368d3205c3b16c84714\"}','2025-03-24 12:13:37'),
('898764bfbde9fe9ed7a4ddb317','{\"currency\":\"USD\"}','2025-03-24 12:14:45'),
('89c450a26829cb44907a52e0d8','{\"currency\":\"USD\"}','2025-03-24 12:14:24'),
('89c868510762f14c79eac18650','{\"login_token\":\"1f49fa6249cc544a6f3718139db0c1b2\"}','2025-03-24 12:13:00'),
('89e958d0c5087bf8726e1c45b6','{\"login_token\":\"c4969ab9862ab021232fb34dae25fd3c\"}','2025-03-24 12:14:01'),
('8a0bbe2dc243dc70f678302867','{\"login_token\":\"3d9aaf9acc5fd5bc9d409da0524a0ee5\"}','2025-03-24 12:14:20'),
('8a23d1e3041348802e5fef364b','{\"login_token\":\"8abab55aa280c634dd338c089824b257\"}','2025-03-24 12:14:05'),
('8a27c0a95777cc60269cfd9fcb','{\"currency\":\"USD\"}','2025-03-24 12:13:31'),
('8a3e5f3a165eb65933ddf9d926','{\"login_token\":\"da9beee871f9252d8341f05b01b1023a\"}','2025-03-24 12:12:51'),
('8a76f5b0cdeda5982d2e6a517b','{\"login_token\":\"c4ef49d2adeb37135c981d97aa04f154\"}','2025-03-24 12:13:43'),
('8a92d96ce6f168d62515074e03','{\"login_token\":\"98e820e79a64e9d6aeb93c4941b97484\"}','2025-03-24 12:13:18'),
('8ab122f387ea0cb21b00154239','{\"login_token\":\"d5fdff4d2983b91cac4319a12ecf21de\"}','2025-03-24 12:13:42'),
('8aec0e05fb72cb08aabfd22e57','{\"login_token\":\"f160558a7e5b2c453a1edfc521b6d447\"}','2025-03-24 12:13:19'),
('8b1fbd6a06a87375bbaa6abd8a','{\"login_token\":\"5169437190b8bfa7c1a8633cd5ae6cd3\"}','2025-03-24 12:13:35'),
('8b45a7f09e7ac252654310b0e6','{\"currency\":\"USD\"}','2025-03-24 12:13:21'),
('8b47df4a63d5cef5bad1694ae6','{\"login_token\":\"d48054125faab3e4aee8f442955dd0db\"}','2025-03-24 12:13:46'),
('8b481981b64a25aaede6262b9a','{\"currency\":\"USD\"}','2025-03-24 12:14:24'),
('8b806507c7c7c2092fda559c50','{\"login_token\":\"58f1b7f280ec624a8cf29cbb7a172bb1\"}','2025-03-24 12:14:04'),
('8b8548377b2fa72e9b444bf51f','{\"login_token\":\"c7b817cca53879b2337b77d08bbe98be\"}','2025-03-24 12:12:55'),
('8b92caae54f402191dccbdb303','{\"login_token\":\"4e3d22950e8e8ba899100420bfc656e8\"}','2025-03-24 12:14:35'),
('8bb42abd56e9d851c711001e30','{\"currency\":\"USD\"}','2025-03-24 12:14:44'),
('8c1187c4299d47b409401b4f98','{\"login_token\":\"a8a3aca969c01ebdf6bffe09e94848f7\"}','2025-03-24 12:13:13'),
('8c142c1958bf6bb6568dda2e5f','{\"login_token\":\"789d1a496616032aa02dcd192d1e0eef\"}','2025-03-24 12:13:33'),
('8c297401126a5fa2ba7d25fcb2','{\"currency\":\"USD\"}','2025-03-24 12:14:08'),
('8c3eae8d3d134133247367ecdb','{\"login_token\":\"cefcf28a6df780c175c95c3a77f8c345\"}','2025-03-24 12:13:58'),
('8c567ea6c695325a03376c9c8c','{\"login_token\":\"377f069c70be48a4a7d559e533dbb33e\"}','2025-03-24 12:13:43'),
('8c77a35d35e2c4f1e799fa3104','{\"login_token\":\"8e2ee6ea652f4675273f306107351166\"}','2025-03-24 12:13:00'),
('8c7e838f222ce1d0305a998128','{\"currency\":\"USD\"}','2025-03-24 12:14:09'),
('8cb5891da9360e77d7f905dd4e','{\"login_token\":\"da44df71c6934625374249b438bf3afb\"}','2025-03-24 12:14:27'),
('8cd2f1aa251b6aa8dd7ddd5ecc','{\"login_token\":\"c3f17ebfa196781ab63e8d74bd6e6e90\"}','2025-03-24 12:14:22'),
('8ce0545ecab9f3fb66453aa5cd','{\"currency\":\"USD\"}','2025-03-24 12:13:50'),
('8ce5f61b58af4b40b7150f826a','{\"currency\":\"USD\"}','2025-03-24 12:13:35'),
('8cf95a04471cd539fddb9b5d33','{\"currency\":\"USD\"}','2025-03-24 12:14:28'),
('8d16fad9dbe69ad1e49bf75b3f','{\"login_token\":\"6316c4a1b0d9c20e63a626f43207d609\"}','2025-03-24 12:13:14'),
('8d6cd627c8d89fe5624e259744','{\"login_token\":\"71efa4b08a3aed36f61abd9df008eabc\"}','2025-03-24 12:14:36'),
('8da771e3b5cbfc756e6fe2a04b','{\"login_token\":\"2336ed8b8c0816aa7f63fb4bfbc0fad1\"}','2025-03-24 12:13:29'),
('8dd70224cd6e5671bd0f17e1f4','{\"login_token\":\"cddd35fadbe350dde256ebc1902cb509\"}','2025-03-24 12:12:53'),
('8decdfddae1f8fa7cba8a74ffb','{\"currency\":\"USD\"}','2025-03-24 12:13:02'),
('8e0539878361bbe7e47260cd98','{\"login_token\":\"5f233dfc6195a53e55f9a939f5ae8a13\"}','2025-03-24 12:14:25'),
('8e19a2604efc878d5845dab1ec','{\"login_token\":\"74b20a32c7b28f8ee24c2794ba9c14eb\"}','2025-03-24 12:13:02'),
('8e1ffe57fb4d194b577ed933ad','{\"login_token\":\"66f4c64ccfbfb1ff8a27bb14cad83a94\"}','2025-03-24 12:13:02'),
('8e231df0f83196a9306792b3a3','{\"login_token\":\"d8beec3d35c7241822ba1ada0356b812\"}','2025-03-24 12:13:34'),
('8e262ac01ef655548ef43bd0e7','{\"currency\":\"USD\"}','2025-03-24 12:14:20'),
('8e41b8f7456eba970bd6998325','{\"currency\":\"USD\"}','2025-03-24 12:14:39'),
('8e4cf1e5f47815e03d43612f54','{\"currency\":\"USD\"}','2025-03-24 12:12:57'),
('8e72045a1af309cb118b6b3b4b','{\"currency\":\"USD\"}','2025-03-24 12:14:04'),
('8ea411d7caafed554b9e5e1bd5','{\"currency\":\"USD\"}','2025-03-24 12:13:11'),
('8ed576ed15808a61d8f5237f3b','{\"currency\":\"USD\"}','2025-03-24 12:13:45'),
('8ed9122c1927781d9f1450ec87','{\"currency\":\"USD\"}','2025-03-24 12:13:24'),
('8f156c7cf9be7cbbae16f1f368','{\"login_token\":\"4826905909c4ad6425edad4aa8ffee88\"}','2025-03-24 12:13:39'),
('8f2012821800584bdea639cf97','{\"login_token\":\"341719f3d2c3fff2d3b204d5cbdaa407\"}','2025-03-24 12:14:07'),
('8f324d686515d7a1c3ba0d9f76','{\"login_token\":\"5876551ed3e2ca5caa5e067c38e12bb1\"}','2025-03-24 12:14:13'),
('8f328c6bdd76ddf5c797b0fe64','{\"login_token\":\"33249f110057172b0fcfe70007c5f54e\"}','2025-03-24 12:13:36'),
('8f618fbaff248bcaa9eba28b68','{\"login_token\":\"f198541ed68451a1ecd07c41ecbec8c3\"}','2025-03-24 12:13:26'),
('8f689028897e2745097c204358','{\"login_token\":\"7b52b8f46699f33e3f7ada9d328d00e1\"}','2025-03-24 12:13:23'),
('8f7e2d13b0277c82f925e90950','{\"currency\":\"USD\"}','2025-03-24 12:13:00'),
('8fac09d7699c06af8686fdbd99','{\"currency\":\"USD\"}','2025-03-24 12:13:41'),
('8fb7a0c23fe6f42137189a014f','{\"currency\":\"USD\"}','2025-03-24 12:13:03'),
('8fb8ca1a4954b94697e067b8cb','{\"login_token\":\"64df0e221bb96cd2b51773b6e49cbdc0\"}','2025-03-24 12:13:49'),
('8fd9cde896595e33b6a41c8f41','{\"currency\":\"USD\"}','2025-03-24 12:12:58'),
('8fde5fb666375cb658fe1d0146','{\"login_token\":\"618403fa4afdf137e6a04cddfa2d867b\"}','2025-03-24 12:14:20'),
('8ff47ea836ad938d98e8203cbe','{\"login_token\":\"d76a78fe6ef86a12f525c8da58bbed33\"}','2025-03-24 12:14:42'),
('902dadc1c26d80e6bc17acda31','{\"currency\":\"USD\"}','2025-03-24 12:13:27'),
('9035d398ea714199a2c6187b92','{\"currency\":\"USD\"}','2025-03-24 12:13:28'),
('9065efca768bffcd56d80be93f','{\"login_token\":\"123ee1e5762c1a4c8b19a03973b3eb92\"}','2025-03-24 12:14:28'),
('909a14fbe74644f6eaaf1ef478','{\"currency\":\"USD\"}','2025-03-24 12:13:20'),
('90dee6e775fd0625ca888aac16','{\"currency\":\"USD\"}','2025-03-24 12:14:24'),
('90ea5f6d0fdbc32f0a4d2ec4f7','{\"login_token\":\"69567ecbbb69df44d319bd373226b514\"}','2025-03-24 12:13:58'),
('90f3a78aa45d7fc474a129917e','{\"login_token\":\"7b56e1fd71e2957af35d42dd143656fc\"}','2025-03-24 12:13:41'),
('90fc30f6f23adfa8741bf8a2bd','{\"currency\":\"USD\"}','2025-03-24 12:13:14'),
('911405a0505669a9a91c4ad18c','{\"currency\":\"USD\"}','2025-03-24 12:13:19'),
('91351a7e5a76b56f0da90957a9','{\"currency\":\"USD\"}','2025-03-24 12:14:08'),
('91497c1332c32d14d6a5e6ab1a','{\"currency\":\"USD\"}','2025-03-24 12:14:18'),
('91660c249f552f22e894682fe8','{\"login_token\":\"f7bff584df6fef6d87bccbe44ecf5431\"}','2025-03-24 12:13:51'),
('91824b4e2a5a8ef5b98f137298','{\"login_token\":\"21e38c37548577f2d1abd04a788b6267\"}','2025-03-24 12:13:54'),
('91cfe205cc26e41aafd05ce017','{\"login_token\":\"a0504338526d6207c1c5d0d7285a044a\"}','2025-03-24 12:13:33'),
('9225a621a85bf89e490868ee64','{\"currency\":\"USD\"}','2025-03-24 12:14:17'),
('9243f5117e982f8d3e368cfd3e','{\"login_token\":\"aa06ce7439c16f8c4f9f6e0f761a8723\"}','2025-03-24 12:14:09'),
('92a67a24211b71dee9572edead','{\"currency\":\"USD\"}','2025-03-24 12:14:46'),
('92b53cb3bcaaf2c16b068aafb8','{\"login_token\":\"d955407bf670b9058bee05993ed162f2\"}','2025-03-24 12:13:20'),
('92bc0566341ac7490575899f2a','{\"login_token\":\"e6feebb27c467b69aa4f6fee54afdb47\"}','2025-03-24 12:13:05'),
('92ebda79a2d271e245cd890abd','{\"currency\":\"USD\"}','2025-03-24 12:13:42'),
('92ef72632c4866e6045d46c4fb','{\"currency\":\"USD\"}','2025-03-24 12:13:48'),
('931e7094d476b800a0af283fa5','{\"currency\":\"USD\"}','2025-03-24 12:13:32'),
('9386fec5fad571bc2c2c5109d7','{\"currency\":\"USD\"}','2025-03-24 12:14:11'),
('93b627d583a34a54510536f3a8','{\"currency\":\"USD\"}','2025-03-24 12:13:12'),
('93ccfae72f66278ee31ee09c32','{\"login_token\":\"25206dc3eee32e7e9d147a10a1624112\"}','2025-03-24 12:14:15'),
('93ec970bad513b04d9549a3d65','{\"currency\":\"USD\"}','2025-03-24 12:13:30'),
('93f639702bb81c593268134f3b','{\"login_token\":\"384ff17f521832b1d07c4a4fdc095997\"}','2025-03-24 12:13:44'),
('948d6afa73fabefbc973cdc9b2','{\"currency\":\"USD\"}','2025-03-24 12:12:55'),
('94b4cedb4515dbf962168c37af','{\"login_token\":\"117df10ab81da443a3547d443d55b1f5\"}','2025-03-24 12:14:31'),
('952b9639603c7bb613c5992623','{\"login_token\":\"660b1618576f7fcb9c573725a8ebe6f6\"}','2025-03-24 12:14:01'),
('95741f1b129650036642bc44d9','{\"login_token\":\"8b733f1f5619bc5dd4f7edcb04d314d6\"}','2025-03-24 12:13:03'),
('95882bb4d38265331ce209bc75','{\"login_token\":\"4dce80505efc101126e64048e01dba70\"}','2025-03-24 12:13:18'),
('95bfba569a9e7d1bf7e4058291','{\"currency\":\"USD\"}','2025-03-24 12:14:16'),
('95c2fbce979902a5927e3a4301','{\"currency\":\"USD\"}','2025-03-24 12:14:23'),
('95e7a7142a00197d74783a5b70','{\"login_token\":\"629ca96e07ed3f9249d7929d62ec38b8\"}','2025-03-24 12:14:27'),
('95fd1c95d2f8ce656dd588495f','{\"currency\":\"USD\"}','2025-03-24 12:12:58'),
('9612004ff6dc792726ef7c7438','{\"currency\":\"USD\"}','2025-03-24 12:14:30'),
('964087bfed05eab9fab4e77f93','{\"currency\":\"USD\"}','2025-03-24 12:13:14'),
('9658a4fa55ad351e57a98be6af','{\"login_token\":\"89587982b5cec92ac4d7be85a5b24831\"}','2025-03-24 12:13:43'),
('966d172e75fd66d4aca1d7d87b','{\"currency\":\"USD\"}','2025-03-24 12:13:44'),
('968a7fb3695030e9de934d2749','{\"currency\":\"USD\"}','2025-03-24 12:14:28'),
('96ec9ab30ab43addabbe673690','{\"currency\":\"USD\"}','2025-03-24 12:13:29'),
('96f42dfc4b67acdd2c540d5e15','{\"login_token\":\"47728fad4377788e7cdbd0e8a3940b64\"}','2025-03-24 12:13:41'),
('9737e696f39ee34567b3885c17','{\"currency\":\"USD\"}','2025-03-24 12:14:16'),
('973cc6df4c129eb6464e7283de','{\"login_token\":\"8e725b6723a1c27ab7b7db7b00e2ed0a\"}','2025-03-24 12:12:50'),
('9759df19feff0cf5f30c04adb0','{\"login_token\":\"081a5bb1837b5b9f913903ae3c59d4cd\"}','2025-03-24 12:14:08'),
('975be7d4b8d07dd15e6b19c822','{\"currency\":\"USD\"}','2025-03-24 12:14:42'),
('975c122e95529357254af57d0b','{\"login_token\":\"d4af727299f52b50123f8c7716d0a4c8\"}','2025-03-24 12:14:44'),
('9780d325fdec926300f469b164','{\"login_token\":\"f1674515f08bd277770b48fe49ddc6fa\"}','2025-03-24 12:14:00'),
('9780eeef045faaa5e26c832907','{\"login_token\":\"4549bcbae821f90d76518f8225ab69f1\"}','2025-03-24 12:14:19'),
('9792e9f02aa08be66284e06d77','{\"login_token\":\"dc42fbcd0cca2f4c895be22aef39220c\"}','2025-03-24 12:13:19'),
('97bb475aab60fd1facf4be0f0b','{\"login_token\":\"bd3a56379ee2fbe20db5657cf3e5a644\"}','2025-03-24 12:14:11'),
('97bcb94e8fd320b48608a7c745','{\"currency\":\"USD\"}','2025-03-24 12:13:47'),
('9812e2abf0aa798b8318e97794','{\"currency\":\"USD\"}','2025-03-24 12:13:23'),
('9843a538dca324d9ae7545215a','{\"login_token\":\"50faeae9d7e220bd5b17a7ebdc282684\"}','2025-03-24 12:13:14'),
('98487ea46c59b482103a7031f1','{\"login_token\":\"4ae1fb1d3289dcdf04809b810b74e228\"}','2025-03-24 12:14:32'),
('98888f8097adba905cc22f1b47','{\"currency\":\"USD\"}','2025-03-24 12:14:10'),
('989d99ee2f7b40d38b5fe1ef30','{\"login_token\":\"638085f15b02b49376c55e53cf13720e\"}','2025-03-24 12:13:38'),
('98a622046ec127efe1ad7bdfb9','{\"currency\":\"USD\"}','2025-03-24 12:14:20'),
('98be111fe9ed45fa0e9d73965a','{\"currency\":\"USD\"}','2025-03-24 12:13:06'),
('98ca75b4939150b891bd59c49d','{\"currency\":\"USD\"}','2025-03-24 12:14:41'),
('98ccc8138b6b655607a1972dfc','{\"currency\":\"USD\"}','2025-03-24 12:14:17'),
('98d9f71f0e2d1d6495124c7b0d','{\"login_token\":\"50d8b2f617aafeca5bb7d641e326cca4\"}','2025-03-24 12:14:02'),
('98e271037fc177952ede4e93cf','{\"currency\":\"USD\"}','2025-03-24 12:13:55'),
('98eb2793e34c625107e3e1d674','{\"currency\":\"USD\"}','2025-03-24 12:14:41'),
('991487613c2afd1565d9ad56a4','{\"currency\":\"USD\"}','2025-03-24 12:13:23'),
('991537b136eff946f37d001707','{\"currency\":\"USD\"}','2025-03-24 12:14:28'),
('99759ef6b34f0b92dda8ec8087','{\"currency\":\"USD\"}','2025-03-24 12:13:00'),
('99a2d77cd152dfe7ef8f468038','{\"currency\":\"USD\"}','2025-03-24 12:14:41'),
('99e29215ea866e6aadf1025860','{\"currency\":\"USD\"}','2025-03-24 12:12:56'),
('99f1bab2fee89619bb088dacfa','{\"login_token\":\"a3362a874a6c09c6a45707b45c995824\"}','2025-03-24 12:14:14'),
('99f492374fb3a7afb145c338d4','{\"login_token\":\"b328fac0bce3b5e438e093e034e74d7f\"}','2025-03-24 12:14:19'),
('9a36f3ea915d220c2853b0a413','{\"currency\":\"USD\"}','2025-03-24 12:13:56'),
('9a41489072b96637852dc4c8e4','{\"login_token\":\"09cbd8547b5b53b12b3aacdcdaa68542\"}','2025-03-24 12:14:03'),
('9ac6d7c1f03da8a057d11b3421','{\"login_token\":\"7568c4e32a34b47204eb8b24f5507c61\"}','2025-03-24 12:12:57'),
('9b25109da538dfebe4955a7fa5','{\"login_token\":\"c7615fdf1b3e851f74859ddaba640289\"}','2025-03-24 12:14:29'),
('9b25e0cf301b527cb6acaea207','{\"currency\":\"USD\"}','2025-03-24 12:14:13'),
('9b37ba6daf2252302f24d5a224','{\"currency\":\"USD\"}','2025-03-24 12:14:06'),
('9b38bdac92183497c723f5c542','{\"login_token\":\"8be052c018486ec89b6876031c740b16\"}','2025-03-24 12:13:55'),
('9b6f65f526115be055a74df1a4','{\"login_token\":\"99b436410d431f3435c16f61fa7b15d6\"}','2025-03-24 12:14:30'),
('9b7b40c60ce8971138a8b24302','{\"currency\":\"USD\"}','2025-03-24 12:14:15'),
('9b9722907e457bbb5e360ba662','{\"currency\":\"USD\"}','2025-03-24 12:13:53'),
('9bd24afa340f18cbe4ac53d0a5','{\"login_token\":\"556a8e7deb814045e04634763f8c7ef8\"}','2025-03-24 12:12:53'),
('9bd94e9abbe7a157ca6e9a6a26','{\"login_token\":\"c1c071104fd1e9fb1a804b3e00a09de2\"}','2025-03-24 12:14:11'),
('9bdc6a8e64b0e03fb6c8de65aa','{\"currency\":\"USD\"}','2025-03-24 12:12:56'),
('9bf3efaf8fa2078ab728b4b609','{\"login_token\":\"a9d385198fc20c397491f45481207980\"}','2025-03-24 12:13:11'),
('9bf45af607e1f28b90148fb2ec','{\"login_token\":\"de34db510e826c5db5757223c05296c9\"}','2025-03-24 12:12:54'),
('9c0ede03af0c69c265515c7a2e','{\"currency\":\"USD\"}','2025-03-24 12:13:06'),
('9c21b9e8c22a78a6f364c8f4e8','{\"currency\":\"USD\"}','2025-03-24 12:12:51'),
('9c22ce01c5086c093b291391b0','{\"login_token\":\"5f5f1592e9ae9ee744893cfcbece16b4\"}','2025-03-24 12:14:39'),
('9c71971d61c3dbe64a610fe6d7','{\"currency\":\"USD\"}','2025-03-24 12:15:10'),
('9c87f6ce090ca4d3b5df433f62','{\"currency\":\"USD\"}','2025-03-24 12:13:56'),
('9cf859dc5d570b897689a202e8','{\"currency\":\"USD\"}','2025-03-24 12:14:06'),
('9cfb0e79de6a70bdd6537c2c24','{\"currency\":\"USD\"}','2025-03-24 12:13:54'),
('9d237e9524bbaf2aab67f1f13f','{\"login_token\":\"fef21d5c91181e5e978faae09fcff55f\"}','2025-03-24 12:14:02'),
('9d27e8478a0475899fc5383b1a','{\"login_token\":\"4800f15a4a86db34b41a3ef9f937f516\"}','2025-03-24 12:13:27'),
('9d4be210686a0794c746db9058','{\"currency\":\"USD\"}','2025-03-24 12:12:57'),
('9d66825605402331a7f3c0c101','{\"login_token\":\"a4000d27f7c56bde71041fb55aea425e\"}','2025-03-24 12:14:36'),
('9d7d74655681dae2566b34bb81','{\"login_token\":\"08f6d84f7e2621d0434ae4deeb2b2471\"}','2025-03-24 12:13:06'),
('9d8431e1d7741294b6369d8b8f','{\"currency\":\"USD\"}','2025-03-24 12:13:37'),
('9d8fce1b87cc9bb02675bbb64f','{\"login_token\":\"91741ed8aa9e2a75aea22e8d5179276c\"}','2025-03-24 12:14:12'),
('9d97872e12a2a5414074620181','{\"currency\":\"USD\"}','2025-03-24 12:13:11'),
('9dbc6461381ee0b40f76d03765','{\"login_token\":\"dbe8a3acc5e7aa857edb958c676972f1\"}','2025-03-24 12:13:04'),
('9dd8917354baacfea18debe5ee','{\"currency\":\"USD\"}','2025-03-24 12:13:58'),
('9df8ad14639b4ca21bf3aa4195','{\"login_token\":\"63d1cdef6b4bc4cc1f9cc4c47d22e98f\"}','2025-03-24 12:14:31'),
('9e0ac27c91ab97ae21cc54ec11','{\"login_token\":\"ac4674d3f3cd650f26e934189e7f8e35\"}','2025-03-24 12:14:41'),
('9e1eff8e89c87cb76cab9f8969','{\"currency\":\"USD\"}','2025-03-24 12:13:47'),
('9e3435377e3e133492ab577a25','{\"login_token\":\"e4f1b7d23f06365b26e1598ee15c47a2\"}','2025-03-24 12:13:37'),
('9e3a56bdb2f702d2bda682d5fb','{\"currency\":\"USD\"}','2025-03-24 12:14:41'),
('9e4ef802213427bc869f0850b5','{\"login_token\":\"af0f50ffdbb95106546be845ae4f9a69\"}','2025-03-24 12:13:32'),
('9e62264e6c84e2f649313ffdc9','{\"currency\":\"USD\"}','2025-03-24 12:14:17'),
('9e696ed57da45cc7958711938a','{\"login_token\":\"767462a849c31d833a13b9921554aae7\"}','2025-03-24 12:13:02'),
('9e966386d9744e796e02e6703a','{\"currency\":\"USD\"}','2025-03-24 12:13:27'),
('9eb8567f371eb4c5142ffb2d55','{\"currency\":\"USD\"}','2025-03-24 12:14:24'),
('9ec4a656f2f8b6224b37922f25','{\"currency\":\"USD\"}','2025-03-24 12:15:10'),
('9ec8c9a75e6cab6ee5c4a3b2fe','{\"login_token\":\"4c1c1befda45c6ab92d0122c613c13bf\"}','2025-03-24 12:13:39'),
('9ed34db4279b407df7b5379e37','{\"currency\":\"USD\"}','2025-03-24 12:13:36'),
('9ee7bdde30006826de14fc1e79','{\"login_token\":\"9061b35364cb85858ab9a0d59e29c3e6\"}','2025-03-24 12:13:42'),
('9ef4cc00d95eb7752bed5ae21a','{\"login_token\":\"872f4b2f34355c0f9c756723a9cf79b3\"}','2025-03-24 12:14:03'),
('9ef5d6e8b92e31826ec3186edf','{\"currency\":\"USD\"}','2025-03-24 12:13:25'),
('9f0ce804f5ef0cda79f74a303e','{\"currency\":\"USD\"}','2025-03-24 12:13:33'),
('9f0d23eb4e9c1363457ed51768','{\"login_token\":\"f3a6f093d74aa381f483d7fa6024a5c7\"}','2025-03-24 12:13:55'),
('9f1b9d1f563dd4456ead5450e6','{\"login_token\":\"f354c22c777bab46087566d2b5f03c9a\"}','2025-03-24 12:14:28'),
('9f2763994b0842a780d4ff7aa1','{\"currency\":\"USD\"}','2025-03-24 12:13:57'),
('9f2bb0ef2b89e668fc66e7b15f','{\"login_token\":\"794f004b34ab35b23395c9c53537cbfb\"}','2025-03-24 12:14:11'),
('9f3378937ffa68780720a368fe','{\"currency\":\"USD\"}','2025-03-24 12:13:40'),
('9f38badb631acebba6a55707b9','{\"login_token\":\"c2b7a4074743b4ff5f393b47c8096a60\"}','2025-03-24 12:13:48'),
('9f49686b1e36fd163c3713c19d','{\"login_token\":\"bea22ff686d154f7f5ebb8000961d306\"}','2025-03-24 12:14:37'),
('9f9825a2d2465c8442b7a66b96','{\"login_token\":\"82358ac51c657e686512436a4c65ed4b\"}','2025-03-24 12:13:54'),
('9fb64f2dcd0a08a226b527a366','{\"currency\":\"USD\"}','2025-03-24 12:12:56'),
('9fdc82e69178bd8d1e1f136869','{\"currency\":\"USD\"}','2025-03-24 12:14:08'),
('a0088dfad7411508a0353ab3bb','{\"login_token\":\"0abe9589db6f35fc9d2f918a900c8d93\"}','2025-03-24 12:13:32'),
('a0132967b3f9ccfb11a21a1321','{\"login_token\":\"9101a6da1d5c1eb040a50e24f7ce32dd\"}','2025-03-24 12:13:20'),
('a01a0e3abc3959b6d98f9e41c0','{\"currency\":\"USD\"}','2025-03-24 12:12:55'),
('a01bfd2586081b581a051f3e37','{\"login_token\":\"62170aca07b78e4f9c319b8e5b79e6f1\"}','2025-03-24 12:13:34'),
('a030461d64a3b5df9e0497004a','{\"currency\":\"USD\"}','2025-03-24 12:12:58'),
('a041fa7617493f96e266ecf0da','{\"currency\":\"USD\"}','2025-03-24 12:14:09'),
('a04e889d824b758b101386fbeb','{\"currency\":\"USD\"}','2025-03-24 12:14:44'),
('a05668a60e28b1fe35caf366da','{\"login_token\":\"5e44238da8f9922fd1d9cf4d0d22fd8f\"}','2025-03-24 12:13:17'),
('a05a53e9a32c8f77053aac5db5','{\"currency\":\"USD\"}','2025-03-24 12:14:44'),
('a05f2a42c75ad4048f1fed4d70','{\"currency\":\"USD\"}','2025-03-24 12:12:54'),
('a06188d02f4dfcf8a17dbd44f9','{\"login_token\":\"7c4592751265e0e32cafa4b7b5717987\"}','2025-03-24 12:14:32'),
('a06ed2543403e382f2ed5af252','{\"currency\":\"USD\"}','2025-03-24 12:14:25'),
('a09dc6676e49d39557d76c6b6c','{\"login_token\":\"d3d40060763349df251c509f031d8dc6\"}','2025-03-24 12:14:22'),
('a0ab800888163ada34c26a922d','{\"currency\":\"USD\"}','2025-03-24 12:13:55'),
('a0dcfad85ad15cc467e921003e','{\"currency\":\"USD\"}','2025-03-24 12:12:59'),
('a0eceef7cfc6744863b866ce31','{\"currency\":\"USD\"}','2025-03-24 12:14:27'),
('a0f35069f6332cbce3358e0eea','{\"login_token\":\"52047118b51ae565f80966f1e8ec4905\"}','2025-03-24 12:14:30'),
('a10958323c31ce3621e4754366','{\"login_token\":\"0f0240ba138f2c4564b1b08884bec271\"}','2025-03-24 12:13:56'),
('a11975c87a87d131832a51a684','{\"currency\":\"USD\"}','2025-03-24 12:14:36'),
('a13040996e95f7d7d7702798d9','{\"currency\":\"USD\"}','2025-03-24 12:14:32'),
('a13d6239f469d4b8f82d5e5cef','{\"currency\":\"USD\"}','2025-03-24 12:12:52'),
('a15e8f07d062adbef1394a9126','{\"login_token\":\"22a3278175723269baf4fefc474cf0f2\"}','2025-03-24 12:14:42'),
('a1884fda7a372cf64b40a315cf','{\"login_token\":\"9c00bbc82175f9b7d17890474dcad195\"}','2025-03-24 12:13:22'),
('a18932191d2a17c3007c5e1149','{\"currency\":\"USD\"}','2025-03-24 12:13:13'),
('a1947a51e7226c8a2204184f5c','{\"login_token\":\"bc57690ba87554d30357d77a9b564b11\"}','2025-03-24 12:14:43'),
('a1b994e48d0bcf00c479da57d4','{\"login_token\":\"3084ff7e1b7e6ad869dd10d5bb0bbbf0\"}','2025-03-24 12:14:17'),
('a1ddf0f21e59edb6b54debc08e','{\"currency\":\"USD\"}','2025-03-24 12:13:39'),
('a1de4ee70b59cfaf7b9caf5c17','{\"login_token\":\"dde9a988b49667a6466ef2c84ee58757\"}','2025-03-24 12:13:08'),
('a1e233e8dcb486e0fd65914568','{\"login_token\":\"10acedd193a034778eeb2e79367c858f\"}','2025-03-24 12:14:20'),
('a207f06eeeaf2431792ee1a8ba','{\"currency\":\"USD\"}','2025-03-24 12:14:27'),
('a227a8ed4615c254b89db7c8ba','{\"login_token\":\"a6f60f212ea935a3ffe2d604f6e672aa\"}','2025-03-24 12:13:53'),
('a24e43e9d970e8f497805d544d','{\"currency\":\"USD\"}','2025-03-24 12:12:59'),
('a25acfc116b6fc05cc258dc14d','{\"currency\":\"USD\"}','2025-03-24 12:13:29'),
('a260ff8dd5ee4d72f5abadb38a','{\"login_token\":\"23f4bf40609a443b79516a9098e39376\"}','2025-03-24 12:12:58'),
('a26100bae20d3d2faae1f8462c','{\"currency\":\"USD\"}','2025-03-24 12:13:24'),
('a268cd8e09d542af9777686a13','{\"login_token\":\"2625489ce1c898c376d6814de07417bc\"}','2025-03-24 12:13:57'),
('a296ebe1c8aa884f5848066228','{\"login_token\":\"c87021b7d7e080346cced8fe798fba25\"}','2025-03-24 12:13:48'),
('a2a96137544416c61c7590d487','{\"login_token\":\"09d1ae16b20e0d4de863910964a0f0ac\"}','2025-03-24 12:14:43'),
('a2ede17bbbaa1f6c20ee0c035c','{\"currency\":\"USD\"}','2025-03-24 12:14:33'),
('a2f14c6f0e77dc09aeddd39865','{\"currency\":\"USD\"}','2025-03-24 12:14:38'),
('a2f216079be4b1b2cea35b3676','{\"login_token\":\"a55083d9624c128b10222ad01e6b3370\"}','2025-03-24 12:14:11'),
('a348603cdb99e8d72371b76e9d','{\"currency\":\"USD\"}','2025-03-24 12:13:27'),
('a364694171b5d312796cf8738c','{\"login_token\":\"59df367fef448aaf6f8f6d6ef6d7603b\"}','2025-03-24 12:14:46'),
('a36929fdc2d9f8a3494a89ae10','{\"login_token\":\"b489750105fe4f830f037be6b676c6c8\"}','2025-03-24 12:14:30'),
('a37461691c5e5ba27eb1beb988','{\"login_token\":\"3dbc4298ba378f585259e3557f8afc96\"}','2025-03-24 12:14:10'),
('a398dba32265e23fd8a5e88082','{\"currency\":\"USD\"}','2025-03-24 12:13:31'),
('a39f47c699dc2b0e14ccac60a9','{\"currency\":\"USD\"}','2025-03-24 12:13:23'),
('a3b82116d07e729b269c516469','{\"currency\":\"USD\"}','2025-03-24 12:14:16'),
('a3c279a5162e4a5bb94676210b','{\"login_token\":\"5309f839c1633b85d383500ec448267c\"}','2025-03-24 12:12:51'),
('a3df191a5b02f5d79183e4b0fa','{\"currency\":\"USD\"}','2025-03-24 12:14:16'),
('a3e662eae27f52c9a99ad1f6b6','{\"currency\":\"USD\"}','2025-03-24 12:13:03'),
('a3ea409df72d1a4bf830916d80','{\"login_token\":\"9de5ebdd9f42de187114d15f8b113910\"}','2025-03-24 12:13:49'),
('a423109ca3539c750331b64ef3','{\"currency\":\"USD\"}','2025-03-24 12:14:35'),
('a428bbe73fade122789310adfe','{\"login_token\":\"0eedb26fd50b49012f1eb2ef1ad39be9\"}','2025-03-24 12:14:03'),
('a4520e23580f25ae1cfa0a7a4d','{\"login_token\":\"e151d8c03e460fc3dce9bb4a925f8dc8\"}','2025-03-24 12:13:50'),
('a48f6bd80ada62f736edc97191','{\"login_token\":\"f4737346d765a9a3d8c826fc56abe0bf\"}','2025-03-24 12:13:41'),
('a491c711ce51656842368e7ff4','{\"currency\":\"USD\"}','2025-03-24 12:14:06'),
('a4c2bf543febb3951623a0dc13','{\"login_token\":\"aca9a1d05b2ab51e3b4e2c1f46e89122\"}','2025-03-24 12:13:38'),
('a56d49ced81f54916296683b54','{\"currency\":\"USD\"}','2025-03-24 12:13:29'),
('a5e7a394ee5720223147fe3fba','{\"currency\":\"USD\"}','2025-03-24 12:14:38'),
('a5ee1b1c8ca1e1a556dd77a81a','{\"login_token\":\"b3be2b4201b43381d2efb089c9ea30d5\"}','2025-03-24 12:14:37'),
('a5fbd2eba5e5e387719c008b43','{\"currency\":\"USD\"}','2025-03-24 12:13:30'),
('a605ec2ef0d235e6ae4c43337f','{\"currency\":\"USD\"}','2025-03-24 12:13:14'),
('a608d84248e8c39830f7e79084','{\"login_token\":\"a2dc099957122ee55c5ea26e501f3ea4\"}','2025-03-24 12:13:02'),
('a65d2026dd31eebf46c60327ea','{\"currency\":\"USD\"}','2025-03-24 12:13:53'),
('a6665b57e8d6ecd9a65ecd43c3','{\"currency\":\"USD\"}','2025-03-24 12:13:50'),
('a6821ef61b57cdf2a9297d15c2','{\"login_token\":\"bfd6ccbcb21a6c609d09844e3090b20c\"}','2025-03-24 12:14:02'),
('a69c742414386b0354852d4d63','{\"currency\":\"USD\"}','2025-03-24 12:13:46'),
('a6baafbabf4e6eead79b6acd64','{\"login_token\":\"7a54213c607f5678759125144c93f8ec\"}','2025-03-24 12:12:51'),
('a6c6c598e99b7e6693bae8cabf','{\"currency\":\"USD\"}','2025-03-24 12:14:34'),
('a6d92e0faf68cb6b16bab4bf91','{\"login_token\":\"68f3993f12f87ec66e38aca4b7ba3c77\"}','2025-03-24 12:14:06'),
('a7055541c7b61347f93632e8f0','{\"login_token\":\"e03c1ccd72252f54faff697bd35cce0b\"}','2025-03-24 12:14:06'),
('a73e7f73858120f98cfe09533b','{\"currency\":\"USD\"}','2025-03-24 12:12:54'),
('a7580420054a9be429b5b644e0','{\"currency\":\"USD\"}','2025-03-24 12:13:36'),
('a768d143c5fbce257a5a9260c8','{\"currency\":\"USD\"}','2025-03-24 12:13:01'),
('a78f829acca7ae44b3067c9891','{\"currency\":\"USD\"}','2025-03-24 12:14:39'),
('a7938f72b62d2ec16246c1f514','{\"login_token\":\"1aed2485808c6eb07c7b89f4e87a3aa5\"}','2025-03-24 12:14:05'),
('a7e947cdae2fc69bd0b355152e','{\"login_token\":\"4c124cae19272f5b1cf33bde64d51a6e\"}','2025-03-24 12:13:21'),
('a7f26a8aca5c60d908d957b3e2','{\"currency\":\"USD\"}','2025-03-24 12:13:22'),
('a85516d6e2732dfffad7fee997','{\"currency\":\"USD\"}','2025-03-24 12:14:24'),
('a856bf8266a8812f1728b050b7','{\"currency\":\"USD\"}','2025-03-24 12:13:58'),
('a86c1a608af31ba8ef429a5d63','{\"login_token\":\"46aff58bab91f123725b4ec3ebfb751e\"}','2025-03-24 12:13:01'),
('a87365d8fc715f73a5761e3605','{\"login_token\":\"65f6eeeb469c8f1926db1f012efb477c\"}','2025-03-24 12:13:30'),
('a891669b4e28b12ccbc37b4481','{\"login_token\":\"8f7764f745189bb5c83d1ce5aec01054\"}','2025-03-24 12:14:00'),
('a8c2cee19c4ef2ba489f6bd949','{\"currency\":\"USD\"}','2025-03-24 12:14:46'),
('a8f362621e3657c6f236391cba','{\"login_token\":\"fb27b8883fd6220b714c56fea43335a7\"}','2025-03-24 12:13:23'),
('a9146611d9e195b4c1c50aa61e','{\"login_token\":\"14b12a1cdce772d0338497dfa4f16a58\"}','2025-03-24 12:13:59'),
('a920e3a3774721fc39bac528c0','{\"login_token\":\"61b804926bf0752834acf3ea5b23a250\"}','2025-03-24 12:13:36'),
('a947d03a7237ff4592eaa6e2b4','{\"currency\":\"USD\"}','2025-03-24 12:14:22'),
('a95e4e81ac295f3857ad2903b0','{\"login_token\":\"3def58f06fbf6a911d15190e994a85d4\"}','2025-03-24 12:14:08'),
('a96ddfa3cea68c14e5adf8b827','{\"currency\":\"USD\"}','2025-03-24 12:13:11'),
('a96f843b6565552203566b215c','{\"currency\":\"USD\"}','2025-03-24 12:13:26'),
('a98cc0c0414e121fb2238d230f','{\"currency\":\"USD\"}','2025-03-24 12:12:53'),
('a98ef8995056e53b0625535af5','{\"currency\":\"USD\"}','2025-03-24 12:12:58'),
('a994678eda7b87caf95ebdbe29','{\"currency\":\"USD\"}','2025-03-24 12:13:48'),
('a99df437716eaffe4b48cc2458','{\"currency\":\"USD\"}','2025-03-24 12:14:20'),
('a9e1e4ba98b4eac16a22bb7913','{\"login_token\":\"bd9a3753ff31abe95d4eb02217f34577\"}','2025-03-24 12:13:52'),
('aa02b1fbb0d8498d81e6b72865','{\"currency\":\"USD\"}','2025-03-24 12:13:34'),
('aa1ca918df5205b08be8c94c0d','{\"login_token\":\"c03cd7d8521000ac1b94b276f39c3e23\"}','2025-03-24 12:14:06'),
('aa2209f5e3c4ec5c5d7d6c471c','{\"currency\":\"USD\"}','2025-03-24 12:14:32'),
('aa2379dfb8de8b1b22b6053a99','{\"currency\":\"USD\"}','2025-03-24 12:13:48'),
('aa29bdac6e20f369dba50f8dae','{\"login_token\":\"c9fd71afdad5e962e4d63470997997bd\"}','2025-03-24 12:13:06'),
('aa55339e1d5dc0aee7b6326d2a','{\"login_token\":\"c65dd6cf796254a8908985bdf57faa17\"}','2025-03-24 12:14:04'),
('aa5d878f231a27e430c4429281','{\"currency\":\"USD\"}','2025-03-24 12:14:18'),
('aa5de8ee942b7df0571dbe927e','{\"currency\":\"USD\"}','2025-03-24 12:12:58'),
('aa785f790e1258cfa79b440fea','{\"login_token\":\"27953b264106b2aa7ba43859097f09d5\"}','2025-03-24 12:13:17'),
('aa7fe81e8f2ecf91545d8ce394','{\"currency\":\"USD\"}','2025-03-24 12:12:52'),
('aa94cdeb4c475b09afe767c9fa','{\"currency\":\"USD\"}','2025-03-24 12:13:59'),
('aa9bc0d1332dc21c11119a722c','{\"login_token\":\"a6ed79e04cde06b917feb09c92d541fe\"}','2025-03-24 12:13:04'),
('aab56f5c235befce141f7e95fc','{\"login_token\":\"d056b244cc6acbe78f2e1b1f90395562\"}','2025-03-24 12:13:50'),
('aabf7d7019ca6982ff684f9430','{\"login_token\":\"8e3dd7b94294ce9f932297038083e910\"}','2025-03-24 12:13:33'),
('ab2a9d06ed27a440c320570c76','{\"login_token\":\"d8a45d0f48bbb841b4ae48932d32f9a1\"}','2025-03-24 12:13:32'),
('ab3ae90b125a79f26fe079817b','{\"login_token\":\"ddcc89c13858efe84fe77866c8ad01c1\"}','2025-03-24 12:13:59'),
('ab55d27311663f91f263cbbef6','{\"login_token\":\"2d852a26886d489c24e1f6f8ee13f16f\"}','2025-03-24 12:12:57'),
('ab5c17ad554474e3c31d9013af','{\"currency\":\"USD\"}','2025-03-24 12:14:08'),
('abaed67a50163c541c8ebc9f97','{\"login_token\":\"08916c3b2a885776e27769ebbe607eb6\"}','2025-03-24 12:14:36'),
('abf91478dd1f7f9e26d5541743','{\"currency\":\"USD\"}','2025-03-24 12:14:36'),
('ac11de121295798bf643d54ec0','{\"login_token\":\"eee1a3eb287d6731fb7aaf16907befb1\"}','2025-03-24 12:14:10'),
('ac1dc35eb9f2157545476b141b','{\"login_token\":\"c2aab8343613f378f08008eb8f12e028\"}','2025-03-24 12:14:29'),
('ac2c65af5362d8bb0a7d163640','{\"currency\":\"USD\"}','2025-03-24 12:13:18'),
('ac33565db3434c5be168faf28f','{\"login_token\":\"2b4c67a8edb29dc1ed4962b2d81cf69d\"}','2025-03-24 12:14:40'),
('ac42221d75fb4e1cc8d710a6cf','{\"login_token\":\"efe5aae2087e44442cf2dfe17240f96d\"}','2025-03-24 12:13:34'),
('ac513ec5e0fcb282188dad1135','{\"currency\":\"USD\"}','2025-03-24 12:14:39'),
('ac70efbad5a271207129875961','{\"currency\":\"USD\"}','2025-03-24 12:13:03'),
('ac769f96cdb0a0bfa0f1704a20','{\"currency\":\"USD\"}','2025-03-24 12:14:01'),
('aca0606133a688ada9b569de09','{\"login_token\":\"c5142db129573339a3ed45ed89116fe0\"}','2025-03-24 12:14:40'),
('aca98ee1648fbfc4b5f1cd1dda','{\"currency\":\"USD\"}','2025-03-24 12:15:11'),
('acdfaa7f88e64bee32553f16ed','{\"login_token\":\"3c5de599f9b7ddec4653ab92ba51aa27\"}','2025-03-24 12:13:35'),
('acf172f1460b3aadc8dbfe6890','{\"currency\":\"USD\"}','2025-03-24 12:13:19'),
('acfb4b6370ac92730751c95a7d','{\"login_token\":\"70728afdc3f4c7dc4a119bd6681cc2be\"}','2025-03-24 12:14:31'),
('acfb5cbeff1ada44bf89b41328','{\"currency\":\"USD\"}','2025-03-24 12:13:38'),
('ad003aa6cb7d27d8708ca7768d','{\"login_token\":\"3eecf9b47a55afa29e5893e487c9ec6f\"}','2025-03-24 12:12:54'),
('ad035665f4b89522e38a3e15ba','{\"currency\":\"USD\"}','2025-03-24 12:13:30'),
('ad08e997b249d22086108db298','{\"login_token\":\"e6b731209b168af9fdef74efc55af72a\"}','2025-03-24 12:14:43'),
('ad3321eb41108ed20daea63a58','{\"login_token\":\"26d5d4b0bd42b00b79f2f6f045ae0abe\"}','2025-03-24 12:14:38'),
('ad55e6369a374793cdda5b2868','{\"login_token\":\"8b961861063a83857af196deb779dbec\"}','2025-03-24 12:13:09'),
('ad91135ff565ad22589d4befc8','{\"currency\":\"USD\"}','2025-03-24 12:14:11'),
('ad9df9744c66997442f93d8ba7','{\"currency\":\"USD\"}','2025-03-24 12:13:36'),
('ada1c8cef0402395f95ed6fc70','{\"currency\":\"USD\"}','2025-03-24 12:12:58'),
('adb84aa783c524e9283bab9b9f','{\"currency\":\"USD\"}','2025-03-24 12:13:35'),
('adf2b7352b925c324cc77160bf','{\"login_token\":\"1038877bc0bcfa087122580983d2e525\"}','2025-03-24 12:14:07'),
('adf986211c7532b3e9cabe2f04','{\"login_token\":\"cc011a036bac2e912f4ac2152cd3c3b4\"}','2025-03-24 12:13:43'),
('adfc4ef9fded93567c909fe6e7','{\"login_token\":\"a777eaa82b40d70a7801dbfce7b2f100\"}','2025-03-24 12:13:43'),
('ae18d5f606d244bd3699aba059','{\"currency\":\"USD\"}','2025-03-24 12:13:16'),
('ae1a4e0e1990007c727007007b','{\"currency\":\"USD\"}','2025-03-24 12:13:09'),
('ae1c7b8995fabced196344774c','{\"login_token\":\"6c229eab59fb0ab98908d0af23f407c9\"}','2025-03-24 12:12:57'),
('ae237804ec44271f6c3ab8a97c','{\"currency\":\"USD\"}','2025-03-24 12:12:57'),
('ae2e99467fb005dd59492af88c','{\"login_token\":\"df88123c855add2ef7a2b942406256a7\"}','2025-03-24 12:14:13'),
('ae345c47f558800f81e6bca9e7','{\"login_token\":\"5a46adf696f10b8eff9934b1e6a591b7\"}','2025-03-24 12:13:03'),
('ae6acb68792e6bcba23ff81eba','{\"login_token\":\"af05b1b2481cf93a99c4ae9a49f023d4\"}','2025-03-24 12:13:05'),
('af1174a9b84bcc2039b926f80f','{\"login_token\":\"b32d757cecffd7d845413773c306e7d8\"}','2025-03-24 12:14:33'),
('af2dea74af9f3d01d19b2e1383','{\"login_token\":\"72c3faea3012383393c50668ae9b323f\"}','2025-03-24 12:13:12'),
('af36dcda0885ffb097a57929ea','{\"login_token\":\"1c07b8a190f7587198661507e4bfb037\"}','2025-03-24 12:14:09'),
('af4f520a8e159d2e2872e52791','{\"currency\":\"USD\"}','2025-03-24 12:13:49'),
('af7251472ab29de0c459359414','{\"currency\":\"USD\"}','2025-03-24 12:13:15'),
('af73672ef326e8fae3d1526896','{\"login_token\":\"8d757c58e1d8dd136a6b847d8b3cac07\"}','2025-03-24 12:14:26'),
('af918528b1097fb8a13405a171','{\"currency\":\"USD\"}','2025-03-24 12:13:12'),
('afac1492905551a4785db81ba5','{\"currency\":\"USD\"}','2025-03-24 12:14:06'),
('afba03f3c7ac997e7c42d4f775','{\"currency\":\"USD\"}','2025-03-24 12:12:51'),
('afc3265fc73e00afe525ec3173','{\"currency\":\"USD\"}','2025-03-24 12:13:23'),
('afed039181c98c11e7c9473f7a','{\"currency\":\"USD\"}','2025-03-24 12:13:34'),
('aff7f1594710c5b5b30b3d2308','{\"currency\":\"USD\"}','2025-03-24 12:14:31'),
('affcc444fc065434381f574c23','{\"currency\":\"USD\"}','2025-03-24 12:13:49'),
('b0436fb71d5b2577290ae04a7b','{\"login_token\":\"bfb03bd7dfd725af2c39883b8c90264f\"}','2025-03-24 12:12:53'),
('b0532f3e7439285feb5089b961','{\"login_token\":\"ba297241576f36deda6116bbe48fab1c\"}','2025-03-24 12:13:59'),
('b0840559b0fd1aaf23aa5eb05c','{\"login_token\":\"3ceb1f9844a597235643dbc0de615daa\"}','2025-03-24 12:14:39'),
('b0a049b87e4d417bed35d53bee','{\"currency\":\"USD\"}','2025-03-24 12:14:27'),
('b0d51ffcb7d03df2d748f7303a','{\"login_token\":\"65c53bba715e1ee006ae21942777129e\"}','2025-03-24 12:13:59'),
('b14c0e04731fb1b9bd294abcf7','{\"currency\":\"USD\"}','2025-03-24 12:12:56'),
('b15f76bb55bc32febd59ed6ba3','{\"login_token\":\"66fb1e90d134ca3d3b1b7d903078e75e\"}','2025-03-24 12:13:57'),
('b179b857d989f95807a0548b0b','{\"login_token\":\"c72431cd331dfeb2605f90d4db6b5e89\"}','2025-03-24 12:13:18'),
('b1ab75d6d6dfa75d17c071de8d','{\"currency\":\"USD\"}','2025-03-24 12:12:53'),
('b1ded7067beee1ba400338d0a9','{\"currency\":\"USD\"}','2025-03-24 12:13:11'),
('b1eb88bd0a911df30ef95c3908','{\"currency\":\"USD\"}','2025-03-24 12:14:17'),
('b2256a34f125b3a9c43cb2a178','{\"currency\":\"USD\"}','2025-03-24 12:13:12'),
('b237102823008e91393fa55722','{\"currency\":\"USD\"}','2025-03-24 12:14:05'),
('b25d7cef248daa48823caaab0b','{\"currency\":\"USD\"}','2025-03-24 12:14:07'),
('b267f001fbe307f18f36547a56','{\"currency\":\"USD\"}','2025-03-24 12:14:30'),
('b28365d17e97ed0551a1a1972f','{\"currency\":\"USD\"}','2025-03-24 12:13:07'),
('b290349203343cdb4790484f11','{\"login_token\":\"009745a6ad3a5165fb3a00342dd277b6\"}','2025-03-24 12:14:14'),
('b2c127e07321a626a074d9d1bc','{\"login_token\":\"f7c371ed4f72c177986e2872310058eb\"}','2025-03-24 12:13:05'),
('b2cb81fd7d6f2f320961048417','{\"login_token\":\"4e85982fa55ea8976224fadd2e6aae56\"}','2025-03-24 12:13:09'),
('b2ced41209c659a3c047260c5b','{\"currency\":\"USD\"}','2025-03-24 12:13:52'),
('b308f0b2a13a7e9d5ccff5b1eb','{\"currency\":\"USD\"}','2025-03-24 12:14:36'),
('b3108d72e39b8572c77c35ca3b','{\"login_token\":\"4309764122604fd2ced11a80694ba531\"}','2025-03-24 12:12:59'),
('b31cd16e49fd877ed9f7454d3d','{\"currency\":\"USD\"}','2025-03-24 12:13:21'),
('b33fb0b29591dbf25af769da7a','{\"login_token\":\"2090f0351042427744d9edad4b6911b9\"}','2025-03-24 12:14:12'),
('b34646d127d940d0b1e096dc10','{\"login_token\":\"01982fd7e176981f1616a760ccf6bfcc\"}','2025-03-24 12:14:45'),
('b356ee2f5a998cc13492f5120e','{\"login_token\":\"6ffed755df0f89e67c45861cf2e0c82c\"}','2025-03-24 12:13:24'),
('b36dc229859133b1c988724b9a','{\"currency\":\"USD\"}','2025-03-24 12:14:18'),
('b39568b91e36d70c8823b1a793','{\"currency\":\"USD\"}','2025-03-24 12:14:00'),
('b39b5a3985867f977dddb26773','{\"login_token\":\"8a6198a5619d1f38c4c912f2de3f8238\"}','2025-03-24 12:14:05'),
('b3b39815e436afa54a08095acd','{\"currency\":\"USD\"}','2025-03-24 12:14:04'),
('b3cf39c7817c692513f994727b','{\"currency\":\"USD\"}','2025-03-24 12:13:04'),
('b3d2af1d11b6b317aa8a9d0763','{\"login_token\":\"cf0b4e53d7ec297de48a2abd0eb39071\"}','2025-03-24 12:13:40'),
('b3f839588bc89408283d7e764e','{\"login_token\":\"6b219245a97893bec635c771314f9dd0\"}','2025-03-24 12:14:14'),
('b40ceb9f4140aa9a347094a618','{\"login_token\":\"b8095d7a6c6825209826382951b33c5e\"}','2025-03-24 12:13:06'),
('b419ef453132673a8227052f15','{\"login_token\":\"98dcd426b2d45f96b1301290c9854ced\"}','2025-03-24 12:13:58'),
('b41df580e8879865cd8f7c9337','{\"login_token\":\"94d9e0e291404a502f4e12f65db08d12\"}','2025-03-24 12:13:40'),
('b426a532c680d68cf6025dfb2b','{\"currency\":\"USD\"}','2025-03-24 12:14:44'),
('b441bba37451362b1173240a15','{\"currency\":\"USD\"}','2025-03-24 12:13:38'),
('b47dd3391d5bca3d5560d9d2b9','{\"login_token\":\"c3b1bc7c174ff50c4d5562a8f10ab05b\"}','2025-03-24 12:14:45'),
('b49267c2e5b0b8b69ce7ba79e4','{\"currency\":\"USD\"}','2025-03-24 12:13:56'),
('b496c841ba87c8b29216c17c34','{\"login_token\":\"72270104e947140e4b412c9764a52642\"}','2025-03-24 12:13:33'),
('b49bb3e3ea7444dfe07b05ea95','{\"currency\":\"USD\"}','2025-03-24 12:12:55'),
('b49c541ecc84bdc0325ead47fb','{\"currency\":\"USD\"}','2025-03-24 12:13:01'),
('b4a6087de733f6ac1de9f58973','{\"currency\":\"USD\"}','2025-03-24 12:14:13'),
('b4fdc5b60c314390d448e2d468','{\"currency\":\"USD\"}','2025-03-24 12:14:44'),
('b515107268bdf8694f1101b97f','{\"login_token\":\"9a4cd62aac9f2adfbd1808a529fc3271\"}','2025-03-24 12:13:11'),
('b54656108287f18c013b06e49e','{\"currency\":\"USD\"}','2025-03-24 12:13:59'),
('b57b944a5f5581229408441ef0','{\"login_token\":\"a4aa6995d8fc09554985e243352c0bab\"}','2025-03-24 12:14:07'),
('b58d2c79d9e60ee93c56fde319','{\"currency\":\"USD\"}','2025-03-24 12:13:06'),
('b5a67e32d89eedd8e00bc2fb88','{\"login_token\":\"5ca23c4ead35f22643511d3dd22535e4\"}','2025-03-24 12:14:26'),
('b5c7d6995d940af0e4e702380b','{\"login_token\":\"d5c41228632be7f715305e685579a3d7\"}','2025-03-24 12:13:47'),
('b5ecfb0f7516adb8ac1becfd09','{\"login_token\":\"97517f03ee552c9201e2368711732d91\"}','2025-03-24 12:13:08'),
('b5f5d7faf7ad343f3c22b81c2e','{\"currency\":\"USD\"}','2025-03-24 12:13:03'),
('b62132007ae6b683e193b040f3','{\"currency\":\"USD\"}','2025-03-24 12:13:08'),
('b62544eac3bdb957cc043a1de2','{\"currency\":\"USD\"}','2025-03-24 12:14:21'),
('b6283b4fd402b772d7c6e2108f','{\"login_token\":\"a904f80a8ea899e35cf7dc5606fe645b\"}','2025-03-24 12:13:52'),
('b6382b1edc31e60e4f3f3082e6','{\"currency\":\"USD\"}','2025-03-24 12:14:32'),
('b6421a32ccff150d0a71e0f19e','{\"login_token\":\"bb4c184def36ad131e0e7b04d353f56a\"}','2025-03-24 12:14:34'),
('b655b454a38d0979ecdf0ca50a','{\"currency\":\"USD\"}','2025-03-24 12:13:44'),
('b65f10852104df29a0167b4830','{\"login_token\":\"4ca8a3a96bbe96978a42483cc5158b22\"}','2025-03-24 12:12:51'),
('b688a4d1009998a07226824728','{\"login_token\":\"94c9c813e093db091e7ee1d7144e18ee\"}','2025-03-24 12:14:04'),
('b6b9a8cc8ecc7e4e208135fd8e','{\"currency\":\"USD\"}','2025-03-24 12:14:14'),
('b6cffc99a4fa4090e30550a6a4','{\"currency\":\"USD\"}','2025-03-24 12:14:43'),
('b70ab85481e3101af227776516','{\"currency\":\"USD\"}','2025-03-24 12:14:03'),
('b75ab3112d4a2a8bb15fe1cd04','{\"login_token\":\"72ed910c63c59e925a85703620b64e50\"}','2025-03-24 12:13:14'),
('b769c617c44873649695800c9d','{\"login_token\":\"87dee296b5b93f32ec0797442b7fbede\"}','2025-03-24 12:13:44'),
('b782dec6ed57caa4b952d8063a','{\"currency\":\"USD\"}','2025-03-24 12:13:41'),
('b78a4c7ed8b2edb26ff0f68cf2','{\"login_token\":\"edfa734da6d9ed87c4ceb3097771d45e\"}','2025-03-24 12:14:20'),
('b79f864899f1c0aeef2a295031','{\"login_token\":\"9f9c0caf78f8148eb69f43171329f610\"}','2025-03-24 12:14:45'),
('b7aeba79d950fe3b468718f984','{\"currency\":\"USD\"}','2025-03-24 12:14:00'),
('b82204cbe9f238d990c885add0','{\"login_token\":\"e7dd84b43c902dc4537374d088022e5b\"}','2025-03-24 12:13:31'),
('b82be02ed97f7ca9df23409f08','{\"currency\":\"USD\"}','2025-03-24 12:13:51'),
('b84271b26f3c8d8dc883bff080','{\"login_token\":\"73a04ca2326ae5ae6b04171aba11c00c\"}','2025-03-24 12:12:59'),
('b8542a54e68606514775e43761','{\"currency\":\"USD\"}','2025-03-24 12:12:59'),
('b8de193d2ac93422790c6ba6aa','{\"currency\":\"USD\"}','2025-03-24 12:12:54'),
('b8e2f74bbb56b01de8e8f7a6f0','{\"currency\":\"USD\"}','2025-03-24 12:13:14'),
('b8f7c52e453f46123b5f5c676b','{\"currency\":\"USD\"}','2025-03-24 12:13:43'),
('b90813fbacab4afd82a925e8da','{\"currency\":\"USD\"}','2025-03-24 12:14:13'),
('b91322c2419b32f2eb9ba25ebc','{\"currency\":\"USD\"}','2025-03-24 12:14:45'),
('b918746f9980535f0cc0cfbd1c','{\"currency\":\"USD\"}','2025-03-24 12:13:17'),
('b924d0e2758ddc20555241c7bd','{\"login_token\":\"8078f6eab72727c942c2c57ca2761cb7\"}','2025-03-24 12:13:58'),
('b927e28413dc4d40b99f5077f4','{\"currency\":\"USD\"}','2025-03-24 12:13:35'),
('b944f77c18e857e47e19744c77','{\"currency\":\"USD\"}','2025-03-24 12:13:54'),
('b94920f61d83fdeb25bf65cb96','{\"currency\":\"USD\"}','2025-03-24 12:14:11'),
('b97997c3a5684dc63eb78cdcf8','{\"login_token\":\"9f4d62824b8fda6037421b5d5c782634\"}','2025-03-24 12:12:54'),
('b9b6b5bd52fa2cbce2578d3ab1','{\"currency\":\"USD\"}','2025-03-24 12:13:48'),
('b9c1c35dd5f51155090fbc7be4','{\"login_token\":\"74508151349ca307d1b6c720dcfa9127\"}','2025-03-24 12:13:25'),
('b9cc59ee3f5e09d9ad6454b199','{\"currency\":\"USD\"}','2025-03-24 12:13:04'),
('b9f64b1d983ac50dd42389239d','{\"login_token\":\"fcbb43710a5a963a34864580507437cd\"}','2025-03-24 12:13:09'),
('b9fb896f89a200485c6af48b02','{\"login_token\":\"9b14e0d092e4aa764057a2df1937bae2\"}','2025-03-24 12:14:13'),
('ba2a6de367f914f88b835b3833','{\"login_token\":\"2083fafda4631a2ea9a6e66d29e55e4c\"}','2025-03-24 12:14:04'),
('ba34bacf44e9c8760c8e3d14d1','{\"currency\":\"USD\"}','2025-03-24 12:13:00'),
('ba438e5d39d5b71d81c357177e','{\"login_token\":\"5fcaa99878e64f2ad80f8c7ca1e219bf\"}','2025-03-24 12:13:04'),
('ba46d3542e010139f66e488bf4','{\"login_token\":\"4a9f384dd4bda7ddf1e49e4f81c0c7e9\"}','2025-03-24 12:13:15'),
('ba4ce7b9756775c00390077773','{\"login_token\":\"02d2fe06dc046dc4069e79ef7fe22528\"}','2025-03-24 12:13:11'),
('ba5218c21060616b91a36ddcdb','{\"currency\":\"USD\"}','2025-03-24 12:12:59'),
('ba63fd0c90dc07f6f27f306b36','{\"currency\":\"USD\"}','2025-03-24 12:13:15'),
('ba72976b63b612bf1d4c275fbc','{\"login_token\":\"45fd9d404d8fe66e7de6046a69248c73\"}','2025-03-24 12:13:17'),
('ba7b7b7d268b048b0bac205789','{\"currency\":\"USD\"}','2025-03-24 12:14:34'),
('ba9be42c7186d42d66f914f069','{\"currency\":\"USD\"}','2025-03-24 12:14:13'),
('bab450a1bd81990b1a85552143','{\"currency\":\"USD\"}','2025-03-24 12:14:30'),
('bad23570e453865ca07dd66a44','{\"login_token\":\"50751149e98090ce2e414f5c01339c5f\"}','2025-03-24 12:14:21'),
('bae952e9fc55f6ac004d281917','{\"login_token\":\"12f4bdce3ee5e0aa622f2f083972de6b\"}','2025-03-24 12:14:42'),
('bafc0256edccf999414e18c24e','{\"currency\":\"USD\"}','2025-03-24 12:14:37'),
('bb0f84220bf167c6ed7e3f9add','{\"currency\":\"USD\"}','2025-03-24 12:13:39'),
('bb32631e9e2cb236eb65ee1001','{\"login_token\":\"79b4fa9de1506c7c19b0cfc9ea224e9b\"}','2025-03-24 12:14:06'),
('bb39380ba07a1003ea76710ef8','{\"currency\":\"USD\"}','2025-03-24 12:13:35'),
('bb47c7aaf83aea15f8591fd479','{\"currency\":\"USD\"}','2025-03-24 12:13:10'),
('bb524ae93e238f059143b49d0e','{\"login_token\":\"3eb2be663b5a16e5e1e7237f9fa04c88\"}','2025-03-24 12:13:40'),
('bb62c30f60d620b806711f054b','{\"login_token\":\"64803eb56aa52fb71fe43ac2a82bff2e\"}','2025-03-24 12:13:16'),
('bb72a21f5c4a5cfffb5bf2f647','{\"currency\":\"USD\"}','2025-03-24 12:14:41'),
('bb73ae5437e76d3b549d750f9c','{\"currency\":\"USD\"}','2025-03-24 12:14:43'),
('bbb01702d336c6968dea01da2b','{\"login_token\":\"f53a33efd8bcceb486d88c132034d395\"}','2025-03-24 12:13:50'),
('bbc44c10d861abf58b88e99f58','{\"login_token\":\"7230347a0e3e1298750b45ad7b2f9c73\"}','2025-03-24 12:14:26'),
('bbcf0f076e20899e4ead2d4615','{\"login_token\":\"16df4fb8becb7927919ca9c73755f111\"}','2025-03-24 12:14:16'),
('bbd82d3a3191ce6c644923a6ca','{\"currency\":\"USD\"}','2025-03-24 12:13:46'),
('bbdd9a1ff251fb4f3481b52b2e','{\"login_token\":\"4f2a885f56a2db6a967d7288a38009e0\"}','2025-03-24 12:14:19'),
('bbf0598b3f5939652ae121c37c','{\"login_token\":\"943fca9292d28fba080990962faec5e7\"}','2025-03-24 12:13:28'),
('bbf9182a33ee7b6938a90656ad','{\"login_token\":\"60c9f85e0ece72760d85a607ae077485\"}','2025-03-24 12:12:52'),
('bc01f6c46f9c7a3621be52365e','{\"login_token\":\"78f9857c075ef4492794d00123fa6f68\"}','2025-03-24 12:14:35'),
('bc066f57b31b4e9b5b7049c611','{\"currency\":\"USD\"}','2025-03-24 12:13:52'),
('bc3209a6b3cdacc14a0609ffd7','{\"currency\":\"USD\"}','2025-03-24 12:13:47'),
('bc34126fbe9197b31a53490bb3','{\"login_token\":\"481114a923500ebbbd56e9871e5f9312\"}','2025-03-24 12:13:58'),
('bc91539b354a0df7a6090ff7a1','{\"currency\":\"USD\"}','2025-03-24 12:13:43'),
('bca2486194d28175cd5666c49d','{\"login_token\":\"bdf6f1da47f5fcba29851d5df55c88e8\"}','2025-03-24 12:12:54'),
('bcd4cd56c67bf5312f8531d089','{\"login_token\":\"3bda2976652ca849b1fdef2cc923a46f\"}','2025-03-24 12:13:47'),
('bd10e8ecec56652baa5bfd84fc','{\"currency\":\"USD\"}','2025-03-24 12:13:46'),
('bd1f94d8d5a67a88ace6764545','{\"login_token\":\"924e6bcf0c66a56a37dd8ffa828da0b3\"}','2025-03-24 12:13:36'),
('bd7e0b450f0f8a4190599c3d3c','{\"currency\":\"USD\"}','2025-03-24 12:12:56'),
('bdb855b848ba30c2959bd3d7b7','{\"login_token\":\"4b9c438d29fce9070af154b062f0b8e4\"}','2025-03-24 12:13:15'),
('bdc6cdd704eda74ef4c2803000','{\"login_token\":\"38d39e4999a2a63cec4296da7086f05d\"}','2025-03-24 12:13:51'),
('bde00d017e897b9dc3f2058fc1','{\"currency\":\"USD\"}','2025-03-24 12:13:20'),
('be1cd4d75d64ae22e374ec1957','{\"login_token\":\"68c83f1f0ee5c8b364154c72148398d0\"}','2025-03-24 12:13:14'),
('be2cca73a4967e41127fd46174','{\"currency\":\"USD\"}','2025-03-24 12:14:35'),
('be5877067d208d66d7c45a8eea','{\"login_token\":\"03b093fcfe768d12a891b73275149688\"}','2025-03-24 12:13:44'),
('be7039f4afbb6eaf6d4c09d1d8','{\"currency\":\"USD\"}','2025-03-24 12:13:13'),
('be892f288dbbd38d0de7f8508b','{\"login_token\":\"060dfe96a7ec35f3767d2429aff83def\"}','2025-03-24 12:14:22'),
('be996ef1a767907763c3519b73','{\"login_token\":\"e5a53b7ccaf9d6987cf3cfbdb5754f45\"}','2025-03-24 12:14:36'),
('bea20c9bf18c61c0afdfae7099','{\"login_token\":\"aa4411b2a643cc170ffe901d795e92bd\"}','2025-03-24 12:14:45'),
('bea613cd57b6a93043265aa039','{\"currency\":\"USD\"}','2025-03-24 12:14:30'),
('bea920d905b07c12a4399ea0bb','{\"currency\":\"USD\"}','2025-03-24 12:14:35'),
('beac8c5926cb5dd78203c07f31','{\"currency\":\"USD\"}','2025-03-24 12:13:12'),
('beb60d3d93478f2d556d9a6a88','{\"login_token\":\"698d4f0f7a6fe2df3b2fc62d4257798e\"}','2025-03-24 12:13:38'),
('bee1383965b23fc661463e21db','{\"currency\":\"USD\"}','2025-03-24 12:13:59'),
('bee5125a41d1ea4e129fd862b0','{\"login_token\":\"0d85eaf5f56bfa7c592d19499db7e965\"}','2025-03-24 12:14:23'),
('bf0c3d1dc154368edb1f78a7e1','{\"currency\":\"USD\"}','2025-03-24 12:13:00'),
('bf23b2cb77bf94f4d5e4eb96e2','{\"login_token\":\"e34ad3f21e64329966a46ec76429a488\"}','2025-03-24 12:13:08'),
('bf3a319b20985f507a5448becb','{\"currency\":\"USD\"}','2025-03-24 12:13:07'),
('bf774c85fe2a96b4ba05106cc2','{\"login_token\":\"ece4e595372f5062820473b5075897b2\"}','2025-03-24 12:14:13'),
('bf7e41b1eb15c268326443b68b','{\"currency\":\"USD\"}','2025-03-24 12:14:45'),
('bfa3d0fc6052039a7a3a465d98','{\"login_token\":\"61072ce940fae49f7d1ef56d6850ed15\"}','2025-03-24 12:12:51'),
('bfb2cebd56c0e6ef9972f34cc7','{\"login_token\":\"86daefbea4f3ee39d15937cbd08e5e04\"}','2025-03-24 12:14:01'),
('bfeb59d977798de915845ddac6','{\"currency\":\"USD\"}','2025-03-24 12:14:01'),
('bffce0328f32a30d928c68a1e4','{\"currency\":\"USD\"}','2025-03-24 12:14:03'),
('c010dbd6ad0c0bcadaa8fdad4b','{\"login_token\":\"0c00a2af13b5efd975c90721efe90ecc\"}','2025-03-24 12:14:33'),
('c033272ceeeac92cf587ef0bf2','{\"currency\":\"USD\"}','2025-03-24 12:14:27'),
('c04eed562b122fbeebf5271394','{\"login_token\":\"827fff39015c1320f2dc3477bd7ae63b\"}','2025-03-24 12:13:22'),
('c05f5adee095fbc71e8197be8e','{\"currency\":\"USD\"}','2025-03-24 12:13:05'),
('c0c7379ec2e80c1a5f732b2a93','{\"login_token\":\"4464676ff2cca9812458df06b600653e\"}','2025-03-24 12:13:08'),
('c0eece56f487c0aed61ede0a7d','{\"currency\":\"USD\"}','2025-03-24 12:13:43'),
('c1280febfd5eb60cc2d73fa821','{\"currency\":\"USD\"}','2025-03-24 12:13:12'),
('c13ec0948884bda703c2b137b1','{\"login_token\":\"a0ccdf997905d9cc58dbc085ed17b836\"}','2025-03-24 12:13:40'),
('c165678857a3e41e27cb70e621','{\"currency\":\"USD\"}','2025-03-24 12:13:23'),
('c175059517e3b37c81f78965fe','{\"currency\":\"USD\"}','2025-03-24 12:13:07'),
('c1a106f94583c1c5f79b20544b','{\"login_token\":\"43713c5bf9326f02878d9656c08aa1aa\"}','2025-03-24 12:13:17'),
('c1ae77ac7ee5787148d766e07a','{\"currency\":\"USD\"}','2025-03-24 12:14:23'),
('c1bd752d03f6c399ccf16c7f0b','{\"currency\":\"USD\"}','2025-03-24 12:13:37'),
('c226154cc35406f0f5b3728145','{\"currency\":\"USD\"}','2025-03-24 12:12:54'),
('c2b4abbb6a10a0583cedc28492','{\"login_token\":\"85a01e42db20be2d2202460698719f6b\"}','2025-03-24 12:14:29'),
('c2c1711d4f4c7c1998624d2157','{\"login_token\":\"75b26050a22ddec0546230cfb4c03218\"}','2025-03-24 12:13:30'),
('c2c721c52fe49272ab83e41e37','{\"login_token\":\"cf88a8395e9de6d96c2eab7ba338e694\"}','2025-03-24 12:14:21'),
('c2c9c53e86219789800d2f2ab2','{\"login_token\":\"403291f9b184c50e5c1baf5ac672127b\"}','2025-03-24 12:13:37'),
('c2f30f2ad15b5e9e90ec5cdfae','{\"currency\":\"USD\"}','2025-03-24 12:13:42'),
('c2f3aca281993b2530a0dc13dd','{\"currency\":\"USD\"}','2025-03-24 12:14:33'),
('c31a184ee41227a9bf72bb5ee6','{\"login_token\":\"61e08679c6fd507cd1d8f4efa9871034\"}','2025-03-24 12:13:54'),
('c32bd6971353e891b7bd74a895','{\"currency\":\"USD\"}','2025-03-24 12:14:27'),
('c36c2ddbaa74dafbb60dfb26b5','{\"login_token\":\"9b1f6e018eb6b99ec8cf1a10264e12bf\"}','2025-03-24 12:12:59'),
('c3e42b7c1a84b7fd5cd6285f0c','{\"currency\":\"USD\"}','2025-03-24 12:13:58'),
('c3f880b01b359e4ca4c0d31a7d','{\"currency\":\"USD\"}','2025-03-24 12:13:23'),
('c41d00afebce15c7f6278674f7','{\"currency\":\"USD\"}','2025-03-24 12:13:50'),
('c41f27fbf20776419a7eb4ff3b','{\"currency\":\"USD\"}','2025-03-24 12:14:43'),
('c42b45800e415272acd03a3413','{\"login_token\":\"eb380186ed95243689f8fa17cae4c443\"}','2025-03-24 12:14:24'),
('c4690809603536712ee6d5e25d','{\"currency\":\"USD\"}','2025-03-24 12:13:20'),
('c479e321f11ad4978810e1fbe9','{\"currency\":\"USD\"}','2025-03-24 12:14:45'),
('c482ab9ef7f58123d7316a1e3f','{\"currency\":\"USD\"}','2025-03-24 12:12:56'),
('c4a9efb3638f5a58c49dab8683','{\"login_token\":\"174ecff6baa43e786b3a41ac84ae98f7\"}','2025-03-24 12:13:40'),
('c4aec7221db88e4dd5dddda351','{\"currency\":\"USD\"}','2025-03-24 12:14:39'),
('c4dec969c0a79b5f13ed7121b9','{\"currency\":\"USD\"}','2025-03-24 12:14:18'),
('c4e4e8e8fb070f27eb7e1c44d3','{\"login_token\":\"9b43fa9b656625698326949b925d893e\"}','2025-03-24 12:14:42'),
('c4f0f9af66e0fd9e25945446b8','{\"currency\":\"USD\"}','2025-03-24 12:14:26'),
('c511b451bbb05a3cd09508d102','{\"currency\":\"USD\"}','2025-03-24 12:13:35'),
('c52ef5bbb1616b3dd957a74214','{\"login_token\":\"8c7ac66f52216034210ef724bb7f459d\"}','2025-03-24 12:12:55'),
('c56ffe58e23e7afdd27f0efa1c','{\"currency\":\"USD\"}','2025-03-24 12:13:57'),
('c5759a111fa6467a1136be0b55','{\"login_token\":\"5f6d92886b08b82a54de62cdef959a01\"}','2025-03-24 12:14:37'),
('c57778e1f0f7cfc8be17b6f71c','{\"login_token\":\"3d1aa21ddaee5ce6e39b94b5a32119d5\"}','2025-03-24 12:12:58'),
('c583bfdd37f8bd5b748b39f243','{\"login_token\":\"2ef94538d53750a7cb7cd298e45d30cd\"}','2025-03-24 12:13:18'),
('c5898bc3982d6dedba0382f75e','{\"login_token\":\"116e380b11c0ee2679a697c1443e4e76\"}','2025-03-24 12:13:03'),
('c58ee6b3d46df82d6cc466adbc','{\"login_token\":\"90ef263a44f68ec5b92139744ee9c445\"}','2025-03-24 12:13:36'),
('c5c4a72d8f67459977a913ca6a','{\"login_token\":\"6ee184237ebf4c03b0f8bdadc3d600d0\"}','2025-03-24 12:13:03'),
('c5f9c83589feebc8142e87bd3a','{\"currency\":\"USD\"}','2025-03-24 12:13:17'),
('c5fa8cecd147d809f4d411cb09','{\"login_token\":\"c40665e192e60bb2b81c5921efd788e4\"}','2025-03-24 12:13:57'),
('c6203963745775dbca9a4f1a29','{\"login_token\":\"562cffd6208c0e1a75cf0f7f8f5d0c32\"}','2025-03-24 12:14:19'),
('c638fcff9c01769c36ff5150a7','{\"login_token\":\"caf4a329630b81dd018f30afddb082e8\"}','2025-03-24 12:14:09'),
('c678ef36c969ee629580f3788a','{\"currency\":\"USD\"}','2025-03-24 12:13:46'),
('c6883f75a9c2aed123d07c1579','{\"login_token\":\"67f3fd2ef14260d027020ad6f6bc9cbb\"}','2025-03-24 12:13:49'),
('c688fa052dba47806eef850037','{\"login_token\":\"b45948d4a38f65242e5383332b9a6bfd\"}','2025-03-24 12:13:08'),
('c6afc6f013dd4c38c952a02a92','{\"currency\":\"USD\"}','2025-03-24 12:14:21'),
('c6c50cc891db9cf122cc2baeb5','{\"login_token\":\"878d0755ada7033d33338ec2f4ea08e5\"}','2025-03-24 12:13:00'),
('c6d90fa9c8f8149f97d642b1a7','{\"currency\":\"USD\"}','2025-03-24 12:13:37'),
('c6f50736a7a2198bb78b654320','{\"login_token\":\"e04096a7a3c970e18b5e5c26a60de9f9\"}','2025-03-24 12:14:28'),
('c731d8ff690242f1a369ece5f7','{\"currency\":\"USD\"}','2025-03-24 12:13:11'),
('c779400197ba302fb1918670c9','{\"login_token\":\"65c7694ad8a6f50bc936d72120eeaf63\"}','2025-03-24 12:14:35'),
('c7846123e747f3b9a47541cd29','{\"login_token\":\"67b89c5a3ababd8765a6c0097faa5da4\"}','2025-03-24 12:13:35'),
('c7af236cf3072799a03a9d1fcf','{\"login_token\":\"3fbe4be3c19911c2a7df30bd4a5c08f4\"}','2025-03-24 12:14:32'),
('c7c483a291339bec2013a25a61','{\"login_token\":\"9ed9250a16876ff7d3e89a6aba9031e9\"}','2025-03-24 12:13:58'),
('c804fac17c863b29971b2be9bc','{\"currency\":\"USD\"}','2025-03-24 12:13:02'),
('c807c8c830868bfa4a17bdf73b','{\"currency\":\"USD\"}','2025-03-24 12:14:10'),
('c80931d59d7083405fa2f5f46f','{\"login_token\":\"4f46efedc60d09256a80055192d5afb6\"}','2025-03-24 12:13:47'),
('c814166293f664690aaf0c28a8','{\"currency\":\"USD\"}','2025-03-24 12:13:12'),
('c85faa3cfacd7eba8f837bb653','{\"login_token\":\"6aa9199ca0441ea75fa708d5fc33ce77\"}','2025-03-24 12:14:41'),
('c884266a5fc9a43990667bec1a','{\"currency\":\"USD\"}','2025-03-24 12:13:34'),
('c891a41d3b47ca5ac8493d04f1','{\"login_token\":\"2d410fd08189a91e7512100b8520017a\"}','2025-03-24 12:13:51'),
('c8df4b426e37eac0134b7fa687','{\"currency\":\"USD\"}','2025-03-24 12:13:16'),
('c8e8a5b000549a19f5e858ea3f','{\"login_token\":\"04eb5b1e35e40b56f4c2f729abc82207\"}','2025-03-24 12:13:27'),
('c8f20cee4e77eaa543918e1716','{\"currency\":\"USD\"}','2025-03-24 12:14:21'),
('c904e3b1407907c16bb7c6a8e0','{\"login_token\":\"5b26870e188f6f911ee11e63415403d5\"}','2025-03-24 12:13:31'),
('c91151636d576cb626202296a8','{\"login_token\":\"204aacb48933585e9784303bd52f0c9c\"}','2025-03-24 12:14:28'),
('c9570d4dc981432dc36bd0dfbf','{\"currency\":\"USD\"}','2025-03-24 12:13:26'),
('c9678f16924080869974734549','{\"login_token\":\"d243640e5e7265fa3fba5f051ec0c5b6\"}','2025-03-24 12:13:36'),
('c97cae98a5130ad70ac36a6282','{\"currency\":\"USD\"}','2025-03-24 12:13:38'),
('c9925049cf1d2e95440a0e924e','{\"currency\":\"USD\"}','2025-03-24 12:13:05'),
('c99cf6990c4898994e62ae89f0','{\"login_token\":\"37e1dca192d50a4bfd4387264aa9ee66\"}','2025-03-24 12:15:10'),
('c9bcf66fb8776c9a9962b7f954','{\"currency\":\"USD\"}','2025-03-24 12:14:00'),
('c9caaa84587382a8682bb0d985','{\"currency\":\"USD\"}','2025-03-24 12:14:41'),
('ca18273fb4801659fbf6c7766a','{\"currency\":\"USD\"}','2025-03-24 12:13:42'),
('ca2bfe97e3a31f50479bfe1472','{\"currency\":\"USD\"}','2025-03-24 12:13:49'),
('ca3423d082e8df369e2fc8c152','{\"currency\":\"USD\"}','2025-03-24 12:14:07'),
('ca3ccb2420c1a9bd03259d391e','{\"login_token\":\"a295c87406aa9c04771c6aaaf216e8bb\"}','2025-03-24 12:13:45'),
('ca3d3f534b6a6ac47256f17a20','{\"login_token\":\"01cc3064ca5b9ce351f8dca100aa32f9\"}','2025-03-24 12:13:51'),
('ca3e1e94df6a10c896f57439a6','{\"login_token\":\"7ec997bd93209c2e20e3327ac9f32661\"}','2025-03-24 12:14:19'),
('ca3ed294485e3f3472a46a9cf0','{\"currency\":\"USD\"}','2025-03-24 12:12:58'),
('ca4de066413efb1bda414e1fb1','{\"login_token\":\"7c10f74d25909c2ef414a82dcbcf45d2\"}','2025-03-24 12:14:10'),
('ca65a2c353b178d1e35f7009c7','{\"login_token\":\"58f7d8443e9213b9bccf9c0558afbdb0\"}','2025-03-24 12:14:03'),
('ca89815082a54216e4c349f148','{\"currency\":\"USD\"}','2025-03-24 12:13:19'),
('caca2db8b067c4faf8b5de9d02','{\"currency\":\"USD\"}','2025-03-24 12:14:21'),
('cad3914c51371701e9bbaa00b4','{\"login_token\":\"8047e45a4bd778898907e55165f88d5d\"}','2025-03-24 12:13:38'),
('cae26226bb91c6d617039708e8','{\"currency\":\"USD\"}','2025-03-24 12:14:29'),
('cafe1b999d4b239f4692170324','{\"login_token\":\"b2a73edfe00e096b624d96656627f438\"}','2025-03-24 12:13:50'),
('cb1055edc8fc26c1fd411d9e85','{\"login_token\":\"67d26e35725ebf59429fa2deba4f7d77\"}','2025-03-24 12:13:51'),
('cb1082864e04e7f042ec77451e','{\"currency\":\"USD\"}','2025-03-24 12:12:58'),
('cb3d739f6f47dd83dabfb7332b','{\"login_token\":\"9e6f8ebb03be437f238e00c89459fc5a\"}','2025-03-24 12:13:14'),
('cb55f3a211b73a7c4b3f180eb3','{\"currency\":\"USD\"}','2025-03-24 12:14:21'),
('cba75d984e5c7d3d7aa13c66ed','{\"login_token\":\"aacdf55a67c929e6eafda8558a6795c6\"}','2025-03-24 12:13:57'),
('cbbbbd6a41f9cf8a6dc4e5d306','{\"login_token\":\"3ea2ef3e30f9daa406d69e71a99f9d4c\"}','2025-03-24 12:14:08'),
('cbdac9cad602065191dc7c733e','{\"currency\":\"USD\"}','2025-03-24 12:13:42'),
('cbdcc4c9300c1527f0fe188d58','{\"login_token\":\"20c484f1adcd4189dc6f7eae606bafe2\"}','2025-03-24 12:14:18'),
('cbefd02feb508897d61d34133a','{\"currency\":\"USD\"}','2025-03-24 12:13:50'),
('cbf28629f6329abc6aad6fce0b','{\"login_token\":\"e3573014aff04fe8535bdd6e603332ef\"}','2025-03-24 12:14:41'),
('cbf43ed82957bf5d30ac2c987e','{\"currency\":\"USD\"}','2025-03-24 12:14:29'),
('cc40f66cd02eef3519f90437a8','{\"login_token\":\"8653b5e8f588cd78844aade32935bbe0\"}','2025-03-24 12:14:42'),
('cc56c068ad18105c0863c0fed3','{\"currency\":\"USD\"}','2025-03-24 12:14:40'),
('cc63642a813ab95104c4759073','{\"login_token\":\"0e1f65ab34dbfbf7880d31b1612d47dd\"}','2025-03-24 12:13:26'),
('cc9a6f9a8a04c89b6778d8622e','{\"currency\":\"USD\"}','2025-03-24 12:12:54'),
('ccb2aa7a56302bba6a2f7a0142','{\"currency\":\"USD\"}','2025-03-24 12:13:47'),
('ccefe0d2c1a0a898573580863a','{\"currency\":\"USD\"}','2025-03-24 12:12:51'),
('ccf5ecb8a70b18735b0c7fb85d','{\"login_token\":\"f614841a633ec3ec0ec798c1912463c7\"}','2025-03-24 12:13:35'),
('cd063eef0b450a5cad9915d114','{\"login_token\":\"b31fa44c3c03fbb8a6d01afe938f11d3\"}','2025-03-24 12:13:39'),
('cd18e38d843402909dae043363','{\"currency\":\"USD\"}','2025-03-24 12:13:08'),
('cd30e039c34c12addf5c43c25f','{\"login_token\":\"9f10dd7f18c1903a5aa8eeb797a0a133\"}','2025-03-24 12:13:27'),
('cd4b3a862246e3b75203810fb4','{\"currency\":\"USD\"}','2025-03-24 12:13:04'),
('cd6905fc205ea18bf1943eb480','{\"login_token\":\"cce7bbc101b7d94ffd8ceef8c9b7f99e\"}','2025-03-24 12:14:03'),
('cd8c89b57b221f3224bade5079','{\"login_token\":\"aa14403f364bba4a77a83ed72a48a1f0\"}','2025-03-24 12:14:17'),
('cd8fda86d3bc58a6d55a32d39b','{\"login_token\":\"eb441073f5fbc33a9f4bd752a9dd9b1c\"}','2025-03-24 12:13:59'),
('cdd3973fdbcbacc1d1473334d9','{\"currency\":\"USD\"}','2025-03-24 12:13:41'),
('cde20e540b1739062779a26c1d','{\"login_token\":\"c41d618987f282778a00ccb9c6f4f719\"}','2025-03-24 12:13:13'),
('cdfc2a1df79cd53186d3325a73','{\"login_token\":\"d792b4842cb25e9f612b427893c403b7\"}','2025-03-24 12:14:16'),
('ce2b43f9a43cdd27a24e348447','{\"currency\":\"USD\"}','2025-03-24 12:14:27'),
('ce6586956acc5a69301fe8f419','{\"login_token\":\"944ffd2ce6f1522b3f7e21f0826e9749\"}','2025-03-24 12:13:21'),
('ce66e166dea01f53c031bdaec6','{\"login_token\":\"af69ea3d7d82bfe30352df3a19807f1d\"}','2025-03-24 12:13:52'),
('ce7c4974811472c8f5d8f74841','{\"currency\":\"USD\"}','2025-03-24 12:13:05'),
('ce9046f9101b1f1ddeaf2b1284','{\"currency\":\"USD\"}','2025-03-24 12:13:31'),
('cf58f30d025b5007e1643269d4','{\"currency\":\"USD\"}','2025-03-24 12:14:26'),
('cfa6a341b2bab290876e2f4d51','{\"currency\":\"USD\"}','2025-03-24 12:13:39'),
('cfaf726aa2a3a4b83b8f6f40e9','{\"currency\":\"USD\"}','2025-03-24 12:13:33'),
('cfce5398d507223ef72d54347e','{\"currency\":\"USD\"}','2025-03-24 12:13:58'),
('cfedfd9d8791eeef1bd3003407','{\"login_token\":\"f8f1685393b2c39bf4e1858c15498b07\"}','2025-03-24 12:13:20'),
('d023c12facdea953fba1ce79dc','{\"login_token\":\"504b96deb8741124a2ab9cf0585df72b\"}','2025-03-24 12:14:38'),
('d045184faf5cd4ed7ec17e281e','{\"login_token\":\"8f3f83cdb8a623d2f6be05bd1e622949\"}','2025-03-24 12:14:35'),
('d045402f73a7751a35e57fd067','{\"currency\":\"USD\"}','2025-03-24 12:13:00'),
('d04b25c7dce3403c78ac9a6f2b','{\"login_token\":\"4f94cc15a086f7a10582b7bbb22ad45d\"}','2025-03-24 12:14:19'),
('d06fa889dae282a021d4dde2f3','{\"currency\":\"USD\"}','2025-03-24 12:13:35'),
('d0721740090929c96a8d79a9c8','{\"currency\":\"USD\"}','2025-03-24 12:13:03'),
('d07503ce48cb08e65d8a0a9705','{\"login_token\":\"dbbb71815d34287e40460493326dda23\"}','2025-03-24 12:13:15'),
('d08c982a4f002523e3f53be4f9','{\"login_token\":\"c6995f22dd9175893a1e769a27785a83\"}','2025-03-24 12:13:28'),
('d0ce1dfd25c1560c851d84c4ec','{\"login_token\":\"7ba581173b5cb6597ebdbf4d6b128fda\"}','2025-03-24 12:14:35'),
('d0f85d11fac5ccfa721467fd5d','{\"login_token\":\"a40fd0d85194dc55b28671bcc85560b0\"}','2025-03-24 12:14:00'),
('d12e4d5abd8bd35f81d2663c65','{\"currency\":\"USD\"}','2025-03-24 12:13:37'),
('d13a94b4349b162c00ca6a50ad','{\"currency\":\"USD\"}','2025-03-24 12:13:41'),
('d1827b1d44a022b1540be53c48','{\"login_token\":\"16c6a61b031b8868baf53767c4bcd405\"}','2025-03-24 12:12:54'),
('d19fc53baf6b42bfd2dc0a22a2','{\"login_token\":\"e7f3c6743ac981918df0685eb1dba75f\"}','2025-03-24 12:13:02'),
('d1a58b751dff6aff6f9be4603f','{\"login_token\":\"d8ce4e1b77ac794d1d0380e0fd646b58\"}','2025-03-24 12:14:28'),
('d1d8ce72a6cb8972aa5b2eefce','{\"currency\":\"USD\"}','2025-03-24 12:13:01'),
('d21a6f96871cd5cd657d8c3b80','{\"currency\":\"USD\"}','2025-03-24 12:13:26'),
('d22b976b4bacf17752de559021','{\"currency\":\"USD\"}','2025-03-24 12:14:29'),
('d250fd95bf82d5d933b1e9fc03','{\"currency\":\"USD\"}','2025-03-24 12:14:44'),
('d2596c1e2c77817443a40d8765','{\"currency\":\"USD\"}','2025-03-24 12:13:32'),
('d2729e6ed19990362857d14d7e','{\"login_token\":\"b2c75df5730bbcdbf14ad179ea21b1ce\"}','2025-03-24 12:13:07'),
('d28a707fcc16d1639341e79633','{\"login_token\":\"3e293e99b78bb4d3198803aafbc84e3f\"}','2025-03-24 12:13:41'),
('d2b04df35d459afd7ff452513e','{\"currency\":\"USD\"}','2025-03-24 12:14:37'),
('d2f278ff63071b463a920d7e9d','{\"login_token\":\"c840fb49a7a3ea2d0053afe7b9eeee5e\"}','2025-03-24 12:13:08'),
('d30c734d5afab5512f052206cf','{\"login_token\":\"8ed9fafdc3c2d612c25b7986afc2eb51\"}','2025-03-24 12:13:05'),
('d30cac4f62e2c1d71cae437c4a','{\"currency\":\"USD\"}','2025-03-24 12:14:05'),
('d32211fa0b26f5c50aab7acec1','{\"currency\":\"USD\"}','2025-03-24 12:13:45'),
('d3364b2d1013ca4ba93e7b0977','{\"currency\":\"USD\"}','2025-03-24 12:14:01'),
('d3471981fb2e1faa75b8b5c17a','{\"login_token\":\"6575b292c4f34d0acbee1e80e7a41b2b\"}','2025-03-24 12:13:26'),
('d350002319d946ff1a19698bf4','{\"currency\":\"USD\"}','2025-03-24 12:13:40'),
('d354c443b58532be360afd26fa','{\"currency\":\"USD\"}','2025-03-24 12:13:57'),
('d35eae9d163f93f6539b392009','{\"login_token\":\"791fcda9a14a7effe389afae5a482b25\"}','2025-03-24 12:14:44'),
('d37076bf8a67293ab62184b1db','{\"login_token\":\"b3c2ff7cb838357190ff78c5013eed04\"}','2025-03-24 12:14:22'),
('d3d3ef12692ef87433dc28d8eb','{\"login_token\":\"f126a82cc3b6badd45a42a17ccc05ae0\"}','2025-03-24 12:14:25'),
('d3e01c302e74ca8397ae93f4d1','{\"currency\":\"USD\"}','2025-03-24 12:12:57'),
('d3ef1318d00767b410c8457a4c','{\"login_token\":\"4092339fc5348a279ac0dae8c8d4e761\"}','2025-03-24 12:13:45'),
('d41b1466c4e3e6787efc79e2f7','{\"login_token\":\"72dbae1a3e06d6ff1b4511cace1920f6\"}','2025-03-24 12:13:03'),
('d43e5593b22724103439eb4d1b','{\"login_token\":\"f7eef5aee16815fff65a534c4f409699\"}','2025-03-24 12:13:56'),
('d44a337639f37a6ad529483076','{\"currency\":\"USD\"}','2025-03-24 12:13:31'),
('d44ee4fa652212bdf0d84bcdaa','{\"login_token\":\"2571f55665981a58014af6b3f9a5bd9a\"}','2025-03-24 12:13:29'),
('d4df69d586864ad0fefaa347ed','{\"login_token\":\"a677522586953de03689edaa6beafb0e\"}','2025-03-24 12:13:30'),
('d4e369eb92ea5fda75b79a7fa9','{\"currency\":\"USD\"}','2025-03-24 12:13:18'),
('d4f14f12378ec08702c21419fb','{\"login_token\":\"bc3b75fc6756f1c364b034c5954e685d\"}','2025-03-24 12:13:05'),
('d5095c9e3c18af52b1bdba07e3','{\"login_token\":\"483d49767cfadd8b3f6f3b823143e9ee\"}','2025-03-24 12:13:18'),
('d51a48373b01409ae9b92bcc4b','{\"login_token\":\"222e03fb55f8ee17d2ec7c0e13f03a6f\"}','2025-03-24 12:14:14'),
('d54408c4142974667da660bfe2','{\"currency\":\"USD\"}','2025-03-24 12:14:25'),
('d5878f2a9559d0cc3b4418754f','{\"login_token\":\"fcbfcd94ef7b0de9adf097f364c00c68\"}','2025-03-24 12:13:11'),
('d5c7e0c357f035032ba40e5c8f','{\"currency\":\"USD\"}','2025-03-24 12:14:36'),
('d5f54654bd369e56a55112438b','{\"currency\":\"USD\"}','2025-03-24 12:14:29'),
('d5f8c66b6680d4df31054b61b3','{\"login_token\":\"ea31b82516d114469b78d13b6f0d1f9a\"}','2025-03-24 12:13:04'),
('d6204ffafa90bd38c9f7f10aa8','{\"login_token\":\"6352866a809ca891996f05dabc91fd6f\"}','2025-03-24 12:12:50'),
('d646f4f3b06d83a6cc0b21feb4','{\"login_token\":\"cfe35119f99dec8d78d9cfc2fc39db58\"}','2025-03-24 12:14:22'),
('d66b07ee5c857dfecaf5ab816d','{\"currency\":\"USD\"}','2025-03-24 12:13:17'),
('d6cc74c07a6a50639a7ec30e70','{\"login_token\":\"87d0e42ba8702e290c5ff40eb11144e9\"}','2025-03-24 12:13:23'),
('d6d56b87335dc3968b6c3960cf','{\"login_token\":\"8b2440ec3346deb9538273551320877e\"}','2025-03-24 12:13:07'),
('d6ec77a86338762adb514d88de','{\"currency\":\"USD\"}','2025-03-24 12:14:44'),
('d72c2bff53282ba25985894d5c','{\"currency\":\"USD\"}','2025-03-24 12:14:44'),
('d737e3af429f8ebf0d08602632','{\"login_token\":\"92b5734bb943ac3a718049f5a8ec12f3\"}','2025-03-24 12:13:58'),
('d73b9763679d3ac589e820ea3e','{\"login_token\":\"7c53be5592cd2726d71c57413e8450e8\"}','2025-03-24 12:14:40'),
('d75cb202f29b1e565b95edc76c','{\"login_token\":\"342c96894c6f33dd6aa35839cba6143f\"}','2025-03-24 12:13:31'),
('d7794fe916d7bf7d03aebbd483','{\"login_token\":\"0c918125a2bad1a7dc8a4c1ef8d46d55\"}','2025-03-24 12:13:53'),
('d77eccb92ae75d258fc97c0471','{\"currency\":\"USD\"}','2025-03-24 12:13:50'),
('d784b277c69271d2a0269ff0b4','{\"currency\":\"USD\"}','2025-03-24 12:13:23'),
('d7ae60b5f6c6834276a6c4e2c9','{\"currency\":\"USD\"}','2025-03-24 12:13:17'),
('d7d00f4653d8b3906445865dba','{\"currency\":\"USD\"}','2025-03-24 12:13:14'),
('d7ec22fe07f5970f43ae985d12','{\"login_token\":\"d93f2d31946ffa9dc27eca4585ae6e20\"}','2025-03-24 12:13:32'),
('d7f356782b009f097297e1f640','{\"currency\":\"USD\"}','2025-03-24 12:14:14'),
('d833d6393a8f187e8c68905812','{\"login_token\":\"7672602683ffe78918de7416138b6063\"}','2025-03-24 12:13:35'),
('d855e9af8d0014a41329639dc1','{\"currency\":\"USD\"}','2025-03-24 12:13:52'),
('d864b0aa19b14d5a1397fb2148','{\"login_token\":\"ba05ae68d599fa9185c014efb799ff46\"}','2025-03-24 12:13:02'),
('d86a22b4b7e081c0f7229c7c45','{\"currency\":\"USD\"}','2025-03-24 12:14:43'),
('d8753af39a92c63986af53701b','{\"currency\":\"USD\"}','2025-03-24 12:14:19'),
('d87ee08914c1979d080e0da428','{\"login_token\":\"1571f3a92817776110c6fe85f3161d53\"}','2025-03-24 12:13:08'),
('d8a636c013a932c48eba9f2d13','{\"login_token\":\"df806fac4d25c15727853bf8ca20f731\"}','2025-03-24 12:14:44'),
('d8c6b04c6435a68e462da6ccc6','{\"currency\":\"USD\"}','2025-03-24 12:13:16'),
('d8ccd27eeffce00892199f2536','{\"currency\":\"USD\"}','2025-03-24 12:13:56'),
('d8d604b9c6ec06b3102bdb7804','{\"login_token\":\"b635e11c2d325180c311bb3b292639d0\"}','2025-03-24 12:13:36'),
('d8f17d85aa791418c14e9d9905','{\"login_token\":\"2288f2b230de45bb3e3115ab6447fabc\"}','2025-03-24 12:14:24'),
('d92638d3e55e57de6ff32a0a87','{\"login_token\":\"e286c71f94cdd243deb51e6e6cacd085\"}','2025-03-24 12:13:00'),
('d94b586abe41b594ff21b586e3','{\"currency\":\"USD\"}','2025-03-24 12:14:31'),
('d9503063b783d32bfc352baedd','{\"login_token\":\"2c535e3355b52c2f026ce4b8da34044d\"}','2025-03-24 12:13:25'),
('d97bdf6d5d0b73b17799b4f67f','{\"login_token\":\"7d813cddbd6bfdae3d0a847b72d92b0e\"}','2025-03-24 12:13:02'),
('d9b403774ce96bccc7562718af','{\"currency\":\"USD\"}','2025-03-24 12:14:16'),
('d9d8ccc48166bcac245fab552f','{\"login_token\":\"c65ff0eedf555df59344376a33c059aa\"}','2025-03-24 12:14:32'),
('d9e16544a00b2f1c0283ca1f11','{\"login_token\":\"274819edf3f4de255be32cb9035bf3e8\"}','2025-03-24 12:13:53'),
('d9e2c0f69dd349c430cdd7d855','{\"login_token\":\"6b22dd102562fcd41df7feecfccb39b7\"}','2025-03-24 12:14:15'),
('d9f65aa9f35a714df4b4805436','{\"currency\":\"USD\"}','2025-03-24 12:13:13'),
('da622fa7546343b4cb95ce4d3a','{\"currency\":\"USD\"}','2025-03-24 12:13:44'),
('da7f210e730821059258491004','{\"currency\":\"USD\"}','2025-03-24 12:13:11'),
('da957ff49801b5c9fd9e49a890','{\"login_token\":\"749dd7223e94f9dab5114ae911900e29\"}','2025-03-24 12:12:57'),
('da9ea217031d3662209919857e','{\"currency\":\"USD\"}','2025-03-24 12:14:03'),
('dab691540af4265319d01a97f1','{\"login_token\":\"0a33bae591ba15e28dadea8e076c5e95\"}','2025-03-24 12:14:00'),
('dab7dde9bdf06710437f3085d8','{\"currency\":\"USD\"}','2025-03-24 12:14:26'),
('dac23e32b628019d07d5f0e391','{\"currency\":\"USD\"}','2025-03-24 12:12:51'),
('db17227a3503afd6b1250dad6e','{\"currency\":\"USD\"}','2025-03-24 12:14:40'),
('db2638451682653de91cb6f09b','{\"currency\":\"USD\"}','2025-03-24 12:13:09'),
('db26c159f44c68cbb5db318ac6','{\"login_token\":\"288767431f970a68bab11ebbacb84eef\"}','2025-03-24 12:13:36'),
('db39222faafbb50f54e8283cda','{\"login_token\":\"0753fcc93627be5fe8d9d6613a1a2860\"}','2025-03-24 12:13:53'),
('db4fe0f07d678d8f2a16149333','{\"login_token\":\"f40bc025e14986eb80e50d71181fd34f\"}','2025-03-24 12:13:49'),
('db6f54d1cdf5709e2d88ad0132','{\"login_token\":\"78344415712b72b529be277352b330b5\"}','2025-03-24 12:12:58'),
('db95c942a568f31312b093d488','{\"currency\":\"USD\"}','2025-03-24 12:14:40'),
('dbacf8dccade7b562f1f89ef54','{\"login_token\":\"49bb08adb5dd1edcdb82c82f3ade71f6\"}','2025-03-24 12:14:27'),
('dbdef1c15bf046029a0647f4a5','{\"currency\":\"USD\"}','2025-03-24 12:14:04'),
('dbebeaaf0bc5f9bc204864f6b0','{\"currency\":\"USD\"}','2025-03-24 12:13:45'),
('dbf42ab4d93340e3464fd5f518','{\"login_token\":\"b1c3cc10474de03d10ccf1b0da8186b8\"}','2025-03-24 12:14:16'),
('dc07e0636226ceb4f87ec6c981','{\"login_token\":\"2cbedf04c18da687833ae78ffb91a054\"}','2025-03-24 12:13:43'),
('dc0a8be63dcdf1ca1f218df549','{\"currency\":\"USD\"}','2025-03-24 12:12:57'),
('dc6612d0567f80162afa9256d8','{\"currency\":\"USD\"}','2025-03-24 12:13:54'),
('dc90069d04a6ce4259d38bb31d','{\"login_token\":\"26a36d3bc4b2e43a5f7442e6175efd16\"}','2025-03-24 12:13:18'),
('dcd196dedb2554410a4b6255a8','{\"currency\":\"USD\"}','2025-03-24 12:14:23'),
('dcd628e8fbc7a5698d940ad6bb','{\"login_token\":\"a4d329bf4468642d6b75ed5920b7de4f\"}','2025-03-24 12:14:37'),
('dce820e36d0be7efc9cfb4dac5','{\"currency\":\"USD\"}','2025-03-24 12:14:10'),
('dcf9e65e8e0a5734efff0c6a84','{\"login_token\":\"9e831f1cdd92db97bf8b6354e9a44c58\"}','2025-03-24 12:14:07'),
('dd1529f43f3047de199751b5af','{\"login_token\":\"896e52f23009c965912c29ac6bd9ec59\"}','2025-03-24 12:13:52'),
('dd38ca6599bd4cc0ce3ec07bc9','{\"currency\":\"USD\"}','2025-03-24 12:14:19'),
('dd519e08b15f5974bd1adc0b6f','{\"login_token\":\"83429106b1f5bf512ccd9e280d4dda3f\"}','2025-03-24 12:14:44'),
('dd6ff4a74721fb378202a4dae5','{\"login_token\":\"847a6cbbcdbd4e390acb74277623a3c0\"}','2025-03-24 12:13:02'),
('dd71598a6557dc8691a77b2c84','{\"login_token\":\"8e86f1d34cdbc672cf58a5437e452bee\"}','2025-03-24 12:13:23'),
('dd99dd93a1df96ba6468d979c9','{\"login_token\":\"13770064d9bdd6534db4aa3d1eed55cb\"}','2025-03-24 12:14:38'),
('dd9aa0f994f91a3946a25143e6','{\"currency\":\"USD\"}','2025-03-24 12:13:15'),
('dda832add91a7bee18ae34719d','{\"login_token\":\"59401a88a1439dc7702ef19cf4793a53\"}','2025-03-24 12:13:01'),
('ddc08d11f66fc75d7774f87915','{\"login_token\":\"4cf29682eb895854fe26755586823ce5\"}','2025-03-24 12:13:59'),
('dded0f63c6ae87cb1d852e7a5e','{\"login_token\":\"8573d03d4a0bd630e86396cda7715a8c\"}','2025-03-24 12:14:07'),
('ddffbca10504f8df79528c9647','{\"currency\":\"USD\"}','2025-03-24 12:14:34'),
('de0372d49008278339ad2b45ac','{\"login_token\":\"16a5900186ca0dc2ee61058d4149a628\"}','2025-03-24 12:13:43'),
('de05a12c4bc2bc2cd277ff0e89','{\"login_token\":\"412e6a1bb925afced6388d563614311e\"}','2025-03-24 12:12:55'),
('de334e75599a2694bab89eb6a8','{\"currency\":\"USD\"}','2025-03-24 12:13:55'),
('de4b55fd2dc904515a454be658','{\"login_token\":\"3795fbbd5e1fc63b638ac6ea4034ba0a\"}','2025-03-24 12:13:27'),
('de948f500f517c898eafc4231c','{\"login_token\":\"04a4ff5bac6608331a77e8d5963af26f\"}','2025-03-24 12:13:01'),
('deae9bb80e936d63904d403d61','{\"login_token\":\"39e3ac067d986a569b83f82358378ad5\"}','2025-03-24 12:13:07'),
('deb1c872c824d4ac1faff379e5','{\"currency\":\"USD\"}','2025-03-24 12:13:32'),
('ded043db630a44df9029e1792e','{\"currency\":\"USD\"}','2025-03-24 12:14:02'),
('dedbb9192d45143c414d77136d','{\"currency\":\"USD\"}','2025-03-24 12:13:53'),
('dee478e63a3fd7f8202d524452','{\"login_token\":\"c32626476c040fa61acaaa8cda4ee893\"}','2025-03-24 12:14:21'),
('dee575c964e1c645eeec192436','{\"currency\":\"USD\"}','2025-03-24 12:13:06'),
('deff4c94eeec424b8f12897b44','{\"currency\":\"USD\"}','2025-03-24 12:14:20'),
('df2180d6e3a275d07a0cf0db2f','{\"login_token\":\"1981e2f51b34eba36194aeb93aa49324\"}','2025-03-24 12:14:32'),
('df4eb5feb7e0ceac2d85a47489','{\"currency\":\"USD\"}','2025-03-24 12:13:53'),
('df69570a081c8325815b238b34','{\"login_token\":\"944c9fb6fac7b1290383f9f1b8bf4de8\"}','2025-03-24 12:13:20'),
('df759e00336288dd03ed3e411a','{\"currency\":\"USD\"}','2025-03-24 12:14:46'),
('df97d01d4848c81b5af2d0ab5a','{\"login_token\":\"642284c66023930aa2b16baf6ccbcbee\"}','2025-03-24 12:14:09'),
('dfdeaf6fff68ccba21318fe8c4','{\"login_token\":\"2803f07b3c1f9fe1eb75b73de9e0634e\"}','2025-03-24 12:13:35'),
('dfef53d2dde7331900594f20bd','{\"currency\":\"USD\"}','2025-03-24 12:13:04'),
('dffe69058ec6b15f2b7d0bc3c2','{\"currency\":\"USD\"}','2025-03-24 12:14:40'),
('e01114b21e985a5066e3d7a4ba','{\"currency\":\"USD\"}','2025-03-24 12:14:31'),
('e02a35a25daeceb84ea4a54cb3','{\"login_token\":\"b1fcd53296279da67cd0f7e1307d4ec3\"}','2025-03-24 12:13:55'),
('e0391d056f810469a054e3d9ee','{\"currency\":\"USD\"}','2025-03-24 12:13:47'),
('e04bf939119258efbc9a9cc9f8','{\"currency\":\"USD\"}','2025-03-24 12:13:43'),
('e04d82b5fcbc1eb7abc8456c17','{\"login_token\":\"fe68ea860cda4b9148942f3b5cc1e38d\"}','2025-03-24 12:14:23'),
('e0550bfcfc53cbeda0be0cd60b','{\"currency\":\"USD\"}','2025-03-24 12:12:53'),
('e0b854e7396800cf6ed0031eef','{\"login_token\":\"2f90ba8022966530c6e82cd053bd7e8e\"}','2025-03-24 12:14:31'),
('e0c8bf042cc931b1fa896621f6','{\"currency\":\"USD\"}','2025-03-24 12:13:21'),
('e0e4367a082b46947d467f94ff','{\"login_token\":\"1c4dace9861b3bc489453e683ac7b72f\"}','2025-03-24 12:14:05'),
('e118358fb345b2756ce053a1d5','{\"login_token\":\"aee51d65a547c26cc0a9a25e4a759bc4\"}','2025-03-24 12:13:35'),
('e13e7f8f7b50b98251416ce8eb','{\"login_token\":\"5d5a8f267265701166e6b2c4dbf12791\"}','2025-03-24 12:12:58'),
('e1865674444fbb8d5fab241f5f','{\"login_token\":\"dbb54e4f1910bbf114c097aa2eb661ab\"}','2025-03-24 12:12:55'),
('e18b924bf811c12d4b3c07dc14','{\"currency\":\"USD\"}','2025-03-24 12:14:41'),
('e1ac5b00d5c5358eeead0284f2','{\"currency\":\"USD\"}','2025-03-24 12:13:45'),
('e1cccb141fb4a49eebbb5b08d0','{\"login_token\":\"7516ac9ea3911afb7b78afc986103653\"}','2025-03-24 12:14:32'),
('e1d6e2398a9254fbff4921f0bb','{\"login_token\":\"d038baa337bf286b35f15c22f13e6202\"}','2025-03-24 12:13:04'),
('e207c5cf3e8aa7497bb71897a2','{\"login_token\":\"ab3ecee87a95748be242f7d959606d29\"}','2025-03-24 12:14:45'),
('e2297552999d2030d301eaa03e','{\"login_token\":\"a2ee1671901d6929337f5fe13e714296\"}','2025-03-24 12:13:47'),
('e252412d96189534af987c18ba','{\"login_token\":\"3f06e98b66847d5c348f44b72ed76231\"}','2025-03-24 12:14:42'),
('e264fa366ad58cc66236549da2','{\"login_token\":\"7ad748f06649dad219407f41e8575ce8\"}','2025-03-24 12:14:26'),
('e27c744af8205ab50afe589965','{\"login_token\":\"ce822af68caf3a7bfc2922f32dc968a2\"}','2025-03-24 12:13:47'),
('e28682ceef8982a6509a5fa889','{\"login_token\":\"ba9011c3240698e19a47d62a5f22d66c\"}','2025-03-24 12:14:07'),
('e298d554692757f6acd95a13c6','{\"currency\":\"USD\"}','2025-03-24 12:14:20'),
('e30ab3dd840ed70eeb6fde132f','{\"currency\":\"USD\"}','2025-03-24 12:13:30'),
('e322700282097c7bb3a8da56a9','{\"login_token\":\"20e04934cc993ef3d19085fc790deb97\"}','2025-03-24 12:13:02'),
('e33a7ff2b9359d8aebfa13579f','{\"login_token\":\"1106c2b85e3f89a13500ede41fd58918\"}','2025-03-24 12:14:40'),
('e35296341cfd5694c6b4cbbc8b','{\"login_token\":\"105dd6198648d5a793f0b3fad73678dd\"}','2025-03-24 12:14:23'),
('e37b0054651f191d81f5622cd1','{\"login_token\":\"8a989476ac46f2bad73504babe9ede45\"}','2025-03-24 12:12:58'),
('e394ac19ba730eb73b280d89c5','{\"currency\":\"USD\"}','2025-03-24 12:14:29'),
('e39b2e225580e9fa1a8f9aaba8','{\"login_token\":\"ca47adadc6d82c7d599cbaafc8522f13\"}','2025-03-24 12:13:16'),
('e3cab8bcb4bb082fc32d9b4696','{\"login_token\":\"3fd12b176eaedb8ee1ec71bd7c0e7094\"}','2025-03-24 12:14:04'),
('e3da5b60f691aca756b43de6e9','{\"currency\":\"USD\"}','2025-03-24 12:13:29'),
('e3ebeca1efc9e096d93514f36d','{\"currency\":\"USD\"}','2025-03-24 12:13:51'),
('e416dd530a77f3b34afdd4df86','{\"currency\":\"USD\"}','2025-03-24 12:14:41'),
('e45181799fdc9b447ddd1f5b4b','{\"currency\":\"USD\"}','2025-03-24 12:14:40'),
('e453c23957796c46b78166d336','{\"login_token\":\"7e8400a2130770a6886326732506dfcf\"}','2025-03-24 12:14:42'),
('e47dd9391c05838c2631b263cb','{\"currency\":\"USD\"}','2025-03-24 12:14:09'),
('e4867147d7d46226120344ecff','{\"login_token\":\"da63536cd4e850c3bf9863624abe16cf\"}','2025-03-24 12:13:06'),
('e49108aa2018e69571de8a39ad','{\"login_token\":\"c3ffdb506811c0a0a085a1b54e04457e\"}','2025-03-24 12:13:00'),
('e4dd062bc0a3ae8bf841b539e3','{\"login_token\":\"9e44608fa71264a3134b6cf71a1d332a\"}','2025-03-24 12:13:50'),
('e4dd67d22f8e6cbe666543bb08','{\"currency\":\"USD\"}','2025-03-24 12:13:10'),
('e4e05500e6d26e79aa2313dd75','{\"login_token\":\"4e6fe1bbfefb5fd0a7fde71d492d56c2\"}','2025-03-24 12:12:53'),
('e4f3a7edb4926f11e5655f993c','{\"currency\":\"USD\"}','2025-03-24 12:14:13'),
('e4f4a76accf5e757e45ff14f3e','{\"login_token\":\"580f74db1b8259dcb139db71b1118c26\"}','2025-03-24 12:14:14'),
('e4f6efc16c1d62f0b2d58459dd','{\"currency\":\"USD\"}','2025-03-24 12:13:33'),
('e52d0587207a78e13d23941a9b','{\"login_token\":\"9b8e0f0c2cffce5b05e4dec1110fa393\"}','2025-03-24 12:13:22'),
('e55ec729cf454cbbd004d03b70','{\"login_token\":\"1e8709ba993b615843dd04c5804c7a7b\"}','2025-03-24 12:13:45'),
('e56047895dbb216711a1184f40','{\"currency\":\"USD\"}','2025-03-24 12:13:44'),
('e58dcdce1b450babf9bf6f2243','{\"currency\":\"USD\"}','2025-03-24 12:13:48'),
('e593875cc3dc51b250dc57e811','{\"login_token\":\"c4f3452c2cb7b4a867f04d778bc1244d\"}','2025-03-24 12:14:32'),
('e5ddbaf27ef62272890b0b4736','{\"currency\":\"USD\"}','2025-03-24 12:13:06'),
('e62e963a62277321f64787ca1a','{\"login_token\":\"ef9871b5ecd654d8ef543130da4a70dd\"}','2025-03-24 12:14:31'),
('e641288f19ac4d05c169420aa9','{\"login_token\":\"5eab844075a76789b6e6271aad9a2a3e\"}','2025-03-24 12:13:44'),
('e641289eb025098ad1dfc8d3f6','{\"currency\":\"USD\"}','2025-03-24 12:13:26'),
('e675a184f489847da7906e3c28','{\"currency\":\"USD\"}','2025-03-24 12:13:49'),
('e69098bb3d6902ad6ab2afc2da','{\"login_token\":\"4bf13ae38c35ce1a26e48622e9c1924c\"}','2025-03-24 12:13:00'),
('e6b5d43fef215f7e97b2026f19','{\"login_token\":\"2b326bf9c0cd00a16db7dfe193456dd5\"}','2025-03-24 12:13:43'),
('e6c8818ed4f99fb279ada64f7f','{\"currency\":\"USD\"}','2025-03-24 12:13:12'),
('e6d403dc3f0c4d9cc7e62893b1','{\"currency\":\"USD\"}','2025-03-24 12:13:22'),
('e7002d31fce3edf3375531d84f','{\"login_token\":\"55ebf5f1dc52f3302a78ae65e1583aa7\"}','2025-03-24 12:13:26'),
('e71e30b7f8ccc779087c19492b','{\"currency\":\"USD\"}','2025-03-24 12:13:10'),
('e71ed056236135828a2b5288e4','{\"login_token\":\"0c387d4c93149143d7092bb37c98dbf2\"}','2025-03-24 12:13:04'),
('e729d54d725aceeea3473f6424','{\"currency\":\"USD\"}','2025-03-24 12:14:16'),
('e73459ca6806bff9424641a9bb','{\"currency\":\"USD\"}','2025-03-24 12:13:19'),
('e762aba63cc2d0e2c7d9a0e4c7','{\"currency\":\"USD\"}','2025-03-24 12:14:29'),
('e7790f58179423374e088465a1','{\"currency\":\"USD\"}','2025-03-24 12:14:11'),
('e7e7149236de0c84f302fa9ae0','{\"currency\":\"USD\"}','2025-03-24 12:14:15'),
('e800c4bc5789c580516b2c2ab5','{\"currency\":\"USD\"}','2025-03-24 12:13:44'),
('e80e049513c78087d46111a513','{\"login_token\":\"20a462208f60953b8b02de0927b6f772\"}','2025-03-24 12:13:36'),
('e813fb408a44276fd44fe84dbc','{\"currency\":\"USD\"}','2025-03-24 12:14:19'),
('e819d9fbba120e055655354838','{\"currency\":\"USD\"}','2025-03-24 12:14:38'),
('e8605e6cc045e61dd24511ca09','{\"currency\":\"USD\"}','2025-03-24 12:13:24'),
('e872b51eec1fa962021ec0f8d5','{\"currency\":\"USD\"}','2025-03-24 12:13:21'),
('e87a91a312d82a151e91226b8a','{\"currency\":\"USD\"}','2025-03-24 12:13:03'),
('e88337fcac035a4faffb737111','{\"currency\":\"USD\"}','2025-03-24 12:13:28'),
('e8da47c918f1cd57d34439305f','{\"login_token\":\"611e2935426a81fafbfcd18bd6ebf66f\"}','2025-03-24 12:13:07'),
('e8dfbea4f0f18e0108d41dae94','{\"currency\":\"USD\"}','2025-03-24 12:14:08'),
('e8e265d25048be238f3dfb3472','{\"login_token\":\"8cb5ca57dc51983e93102e55f0f0b622\"}','2025-03-24 12:13:50'),
('e8e8cd1c37681278520166b8dc','{\"currency\":\"USD\"}','2025-03-24 12:13:04'),
('e8f0142c9f67ed20f05eea0b84','{\"currency\":\"USD\"}','2025-03-24 12:14:06'),
('e90926890d6587ad88a2a91c31','{\"currency\":\"USD\"}','2025-03-24 12:13:47'),
('e92b32adcad2b2b095ecba1667','{\"login_token\":\"838df4c2e1272e81751cddcd38fe9075\"}','2025-03-24 12:14:08'),
('e938c4d70a01c9e144e348eb3c','{\"currency\":\"USD\"}','2025-03-24 12:14:07'),
('e95b3c79c879530a3d65747ce6','{\"currency\":\"USD\"}','2025-03-24 12:14:42'),
('e97052295f9ced272eeef2f1db','{\"login_token\":\"70bf3b1a5f3ad60ca90fd6cb95eb310b\"}','2025-03-24 12:13:32'),
('e9852ed6f20d313e91311776c2','{\"login_token\":\"65639dd44b9353b969996b17e6a7390a\"}','2025-03-24 12:12:59'),
('e98e52f0fffa10abae0a03c33f','{\"currency\":\"USD\"}','2025-03-24 12:14:13'),
('e9cdae2ff572be1486230e322e','{\"currency\":\"USD\"}','2025-03-24 12:14:03'),
('ea20ec142982183a6fdb643bc2','{\"currency\":\"USD\"}','2025-03-24 12:14:15'),
('ea269ceb02fd475dd62a12f001','{\"currency\":\"USD\"}','2025-03-24 12:13:59'),
('ea52c2987e88313d017d8c3278','{\"currency\":\"USD\"}','2025-03-24 12:14:34'),
('ea57e7efd4f6584d252028c2c1','{\"login_token\":\"ab29219b175c36bc54ec32cb469c1347\"}','2025-03-24 12:14:04'),
('ea66c0ced8a9f2f8ca51fa1c4b','{\"currency\":\"USD\"}','2025-03-24 12:14:28'),
('ea87b262be733415b6953e34c8','{\"login_token\":\"445b9b2dda398166e47c890079972d71\"}','2025-03-24 12:14:06'),
('eaaaa08b117043a34948a9928c','{\"currency\":\"USD\"}','2025-03-24 12:13:29'),
('eab1fcce22d984de33dc494e0a','{\"currency\":\"USD\"}','2025-03-24 12:13:34'),
('ead3256c4966c4201d78607078','{\"currency\":\"USD\"}','2025-03-24 12:13:53'),
('eafaddd0efafcd83bfeaf5366b','{\"login_token\":\"506da41ecb4ed6dabe3b46f59baf755c\"}','2025-03-24 12:14:15'),
('eb0788e1822e974b746f336511','{\"login_token\":\"2a9ccd8a8b3a48cd008ddb42b7b9de30\"}','2025-03-24 12:13:47'),
('eb2e6bba5a6f1eaa380b306f7c','{\"login_token\":\"4dc3b255b77c6d0f300ba4ef6d03c302\"}','2025-03-24 12:13:25'),
('eb44bdd1bac37fc4a63bc1c764','{\"currency\":\"USD\"}','2025-03-24 12:14:40'),
('eb56829d93da36272f98029144','{\"currency\":\"USD\"}','2025-03-24 12:13:09'),
('eb8b1356c24f5211c6417a8033','{\"login_token\":\"8a6ca8058b8dfe0dbea322216b4cbf50\"}','2025-03-24 12:13:47'),
('ebac3a3e59552e2e426a558e88','{\"login_token\":\"8899f38cd9129a5cda20f34f40139ce2\"}','2025-03-24 12:13:29'),
('ebb79f340eac0553ec287f27fc','{\"login_token\":\"24c177d246674773886b30058c14419e\"}','2025-03-24 12:13:54'),
('ebc281f9bdc5ee1ff0fe690c5c','{\"login_token\":\"ade4aa63e51d564609ee0e217462c371\"}','2025-03-24 12:13:51'),
('ec0dfa9c4a1bc961b9e7a8c87d','{\"currency\":\"USD\"}','2025-03-24 12:13:24'),
('ec39c13aac0c5a3e51626b1fe8','{\"login_token\":\"ba244cd6a431004196bea4d08f4e39a4\"}','2025-03-24 12:13:11'),
('ec3c4d852eb13bde1d3942319f','{\"currency\":\"USD\"}','2025-03-24 12:13:04'),
('ec6c9547465cdb82b7211012dc','{\"login_token\":\"e15743bb45f08f1add463a9710cb5f2f\"}','2025-03-24 12:14:08'),
('ec711fa8b2d10e9cef78c8eda3','{\"currency\":\"USD\"}','2025-03-24 12:14:14'),
('ecc74a2fb1bca7bf4b6c9ab977','{\"currency\":\"USD\"}','2025-03-24 12:12:59'),
('ece51cb93e9bf3b7a5171d5ca8','{\"currency\":\"USD\"}','2025-03-24 12:14:28'),
('ed2f8bf83802f31000bedbf57e','{\"login_token\":\"97661552b8b83aff582d88cf8dfa044d\"}','2025-03-24 12:14:02'),
('ed661f8a06ef5ae89a8e2f8bd5','{\"login_token\":\"33286aa2b39a431c978cfcb7bf48e776\"}','2025-03-24 12:14:15'),
('ed66a30040e17fb2cce80836ed','{\"login_token\":\"adb762daf18e2864ab72726a8c165ee3\"}','2025-03-24 12:13:31'),
('ed75ffc8f18de37a82db0e9c3f','{\"currency\":\"USD\"}','2025-03-24 12:13:02'),
('ee0a68df7d133bbfedaeacf070','{\"login_token\":\"6f0eb4477ceb5d7ce5759c5ff301f21a\"}','2025-03-24 12:14:05'),
('ee235e4c334f0bbb841f2891c5','{\"login_token\":\"b6d73a84bfc7ebda75b315b7951792c8\"}','2025-03-24 12:14:27'),
('ee283cf380a037383a66adea5a','{\"login_token\":\"2ca33b9f1aaf0de845610fbf0a3640f0\"}','2025-03-24 12:13:20'),
('ee40df9695ae092b8c730fe608','{\"login_token\":\"f58e52c6a20f76873cb0a240f3f49913\"}','2025-03-24 12:14:15'),
('ee57ef7e1844731566bce0d607','{\"currency\":\"USD\"}','2025-03-24 12:13:52'),
('ee7dafbb7d57043eaa043a8ebf','{\"login_token\":\"de322e2d859a5a3c97786d241fd5e859\"}','2025-03-24 12:14:45'),
('ee8b61979263c91e369b23e11f','{\"currency\":\"USD\"}','2025-03-24 12:13:43'),
('ee9ff895219b7f9be4b8b400ff','{\"currency\":\"USD\"}','2025-03-24 12:14:16'),
('eeb822ed192321b4d131fb4e43','{\"login_token\":\"c59902e7be571d7d91085f90ed46c50c\"}','2025-03-24 12:14:42'),
('eec05c3d9253c506d16448e2e8','{\"login_token\":\"cafe22728910386246d1d75d588059f6\"}','2025-03-24 12:13:41'),
('eed7ac2a656204cf077c0cd6f6','{\"login_token\":\"0bce7e126f43dad3ff59602847288361\"}','2025-03-24 12:13:07'),
('eedef6ecb109b0b2ac05dc5235','{\"login_token\":\"382de50169c3bdffc7d6dcf9641e8f09\"}','2025-03-24 12:14:13'),
('eeec773f3d2bdb65fe05eb6afb','{\"currency\":\"USD\"}','2025-03-24 12:14:12'),
('ef033e0cb1a43e5ad28340fbfa','{\"login_token\":\"67113b8ce3f994613bd161523eca31ab\"}','2025-03-24 12:13:16'),
('ef17ed2366e237f0ba5ebf6010','{\"login_token\":\"c927805ebb7d18878c0dfd5c17833409\"}','2025-03-24 12:14:45'),
('ef2f9577377ba0493f6e5e5f00','{\"login_token\":\"bccdf7549cf4aa902f37fd194048b8a8\"}','2025-03-24 12:13:03'),
('ef5794456e56bbbd91e09ecbdb','{\"currency\":\"USD\"}','2025-03-24 12:13:44'),
('ef5c07d3e109dcbd6f827100c4','{\"currency\":\"USD\"}','2025-03-24 12:13:29'),
('ef6dd9582e9764fa5b2ccd1b99','{\"login_token\":\"ba50f2afab7292ac4652c13b630ac746\"}','2025-03-24 12:13:00'),
('efbd1e0164d1751aae63fb21d7','{\"login_token\":\"d8c429c1eb6abf00946ff813777a2f7b\"}','2025-03-24 12:13:48'),
('eff315ef2f5af785ff2e70ee8a','{\"currency\":\"USD\"}','2025-03-24 12:14:24'),
('f042be61bb4f7f704365022324','{\"login_token\":\"ba7a24572db0f84fac139e454a86c427\"}','2025-03-24 12:12:51'),
('f050350e07369886acc3a15d67','{\"currency\":\"USD\"}','2025-03-24 12:13:53'),
('f06656bce1e2ceadeb059248c2','{\"login_token\":\"346f044fdf0aa43ffc3e8e8b1604cf4c\"}','2025-03-24 12:13:23'),
('f06c86b86da0c8db01ca21ffb3','{\"currency\":\"USD\"}','2025-03-24 12:13:15'),
('f06d542bac7914c1592f1b6355','{\"currency\":\"USD\"}','2025-03-24 12:13:54'),
('f08c96d8b63fd9bbfd0596fd33','{\"login_token\":\"3dbbec2ce90a1f24c892e657ed0651ce\"}','2025-03-24 12:14:07'),
('f0a46379b089b0e516887cd159','{\"login_token\":\"f7f7a050f64e601d8e3d4698ebfb18ca\"}','2025-03-24 12:14:08'),
('f0b425a590fda8a9fcc6361710','{\"login_token\":\"6d4a3127e8c8ca5d28866c9e22a471e4\"}','2025-03-24 12:14:30'),
('f0cbb22a61afc05f2bd8176b17','{\"login_token\":\"10074d9551f9cb62ccec0ab8a9896a99\"}','2025-03-24 12:13:10'),
('f12c1804a77397af5dd2b92e4b','{\"login_token\":\"13597e985c2982ad12b62f153483c0f3\"}','2025-03-24 12:13:24'),
('f159fc8af5220cebe9283c0c7a','{\"login_token\":\"799b1266183a78cfe7c08c6ecb11b25b\"}','2025-03-24 12:14:29'),
('f165c685b985bbd52466d454d4','{\"login_token\":\"790501d76ab3d03e55247aa9c168554c\"}','2025-03-24 12:13:39'),
('f190e219dc70e40f57183161ba','{\"currency\":\"USD\"}','2025-03-24 12:13:30'),
('f1a0d9a16570414cea775fc63d','{\"currency\":\"USD\"}','2025-03-24 12:14:31'),
('f1a4c42c913a3181e4a2e1f348','{\"login_token\":\"7e7474783fa24c9adf83d9f903ba8b9f\"}','2025-03-24 12:13:55'),
('f1cf9812b22a1051e25910909f','{\"currency\":\"USD\"}','2025-03-24 12:14:23'),
('f1dc02ce145c44a469edd0f086','{\"currency\":\"USD\"}','2025-03-24 12:13:49'),
('f1e7acf5f453fc0dd16f4b13d7','{\"currency\":\"USD\"}','2025-03-24 12:13:28'),
('f1fb2849feb76e48c25a8553f7','{\"currency\":\"USD\"}','2025-03-24 12:14:33'),
('f21cee23af197bd1b909fab449','{\"login_token\":\"07546b0e5445a44635dee462da314126\"}','2025-03-24 12:14:34'),
('f2302a1e05f822b6ad8e10206d','{\"currency\":\"USD\"}','2025-03-24 12:14:32'),
('f2522776ec421b57647e4099f0','{\"currency\":\"USD\"}','2025-03-24 12:14:25'),
('f29a901264cff8c4d2ad26014b','{\"login_token\":\"f6a60eb29cfe8d8ebc8ba93e156f17c4\"}','2025-03-24 12:14:34'),
('f2d4b95bb3b8d576ce03879b36','{\"login_token\":\"6523e411dd3e459085472a83183cb7fa\"}','2025-03-24 12:14:45'),
('f2f209f08c739e5dbc47a7be2e','{\"currency\":\"USD\"}','2025-03-24 12:14:04'),
('f30016cab410cb4f36595338ad','{\"login_token\":\"6acd9840be1ce0274c34d5cb47fd64c4\"}','2025-03-24 12:14:30'),
('f334f7ba116a79737b16e04bd2','{\"currency\":\"USD\"}','2025-03-24 12:14:23'),
('f374a8c375a3dac526d6180005','{\"currency\":\"USD\"}','2025-03-24 12:12:50'),
('f385bdd8af856f86e0abc0f25e','{\"login_token\":\"bdbd6588b356f0191f11a2f95941683f\"}','2025-03-24 12:14:00'),
('f39678055d9edc5f04f3854e4c','{\"currency\":\"USD\"}','2025-03-24 12:13:31'),
('f398b335e6e5795062fc73be14','{\"login_token\":\"57c406e7900bf8d6b1eca25864cf733e\"}','2025-03-24 12:14:31'),
('f3d1435ee8cfe2184ffcfa6969','{\"login_token\":\"f5d6e263d45b3c1f88482f8793952b36\"}','2025-03-24 12:14:29'),
('f3d9e57d66b26077b327f4f00d','{\"currency\":\"USD\"}','2025-03-24 12:13:38'),
('f3e3631caa7666d9278d9b2acb','{\"currency\":\"USD\"}','2025-03-24 12:14:19'),
('f4057d0cf27197e828e4ee158d','{\"currency\":\"USD\"}','2025-03-24 12:14:22'),
('f4106795ec67fb30f94d956d2d','{\"currency\":\"USD\"}','2025-03-24 12:13:50'),
('f41c15459fe3b35ecd6a970a20','{\"login_token\":\"e6b4f8678d34644bb021d7d21dea654f\"}','2025-03-24 12:13:38'),
('f424cdbfd7e755350070b75897','{\"currency\":\"USD\"}','2025-03-24 12:14:43'),
('f42fddee40ad2ccddd0369f394','{\"login_token\":\"ae463bca91948403ad924d60e8df3e8f\"}','2025-03-24 12:12:54'),
('f46ae62119ba3516dda4632e47','{\"currency\":\"USD\"}','2025-03-24 12:13:09'),
('f489700c488a824cdf8a0a3579','{\"login_token\":\"2879f86d01fc4ef375e4235e435a3fe5\"}','2025-03-24 12:14:32'),
('f49b66c44b56013fa97e014cb2','{\"currency\":\"USD\"}','2025-03-24 12:13:52'),
('f4abffbde412e6fe88d27874a6','{\"currency\":\"USD\"}','2025-03-24 12:13:39'),
('f4e9c8198bfa0ebfcda75b5763','{\"login_token\":\"9919c8b6d1ef4a70ea60477dc3e54f0d\"}','2025-03-24 12:14:18'),
('f511c5033eb6ea3f93ee760c72','{\"currency\":\"USD\"}','2025-03-24 12:14:21'),
('f51902ef5e7c764d7fc13d794f','{\"currency\":\"USD\"}','2025-03-24 12:13:21'),
('f51a9d140bd93f40dd28cdb9c4','{\"currency\":\"USD\"}','2025-03-24 12:13:09'),
('f571bb7f8e09fa9e37cf303a7c','{\"currency\":\"USD\"}','2025-03-24 12:14:10'),
('f58ba0fa7afe92900613740a75','{\"login_token\":\"853e349735ce6bda3ecf4b41bbbac55c\"}','2025-03-24 12:14:16'),
('f58c2bff81c87ae0146ef64f5f','{\"login_token\":\"06790b89ba5186a4bb105996fe005c99\"}','2025-03-24 12:14:34'),
('f5b3e3886d6219e33fa377e9f2','{\"currency\":\"USD\"}','2025-03-24 12:14:04'),
('f5cfad8054ec432feb2e7ee28c','{\"login_token\":\"67b7b9d6a5f5a42339406108c1498a5e\"}','2025-03-24 12:14:23'),
('f5ecf6a8323ede46dc4898293e','{\"login_token\":\"4425641fe79574cb7abcb00e95744644\"}','2025-03-24 12:14:35'),
('f61100fcdaba9ede641690de6f','{\"login_token\":\"74d52d60a5ac61e692b12c243aa3cf2a\"}','2025-03-24 12:14:14'),
('f629d043e3231e8473c87e64cd','{\"currency\":\"USD\"}','2025-03-24 12:14:05'),
('f6eb11df38193f8397e8195662','{\"currency\":\"USD\"}','2025-03-24 12:14:00'),
('f72af58a51eec250e305a40ba9','{\"login_token\":\"b3b06bb480dbc79d510d6926fe6542a7\"}','2025-03-24 12:14:43'),
('f74907ac819630042fdfb5ef43','{\"login_token\":\"c19dd60341a80f7ed86b37a165e6c3f3\"}','2025-03-24 12:14:33'),
('f77ff53e9eb47bf83c409acc3d','{\"currency\":\"USD\"}','2025-03-24 12:12:54'),
('f7ad562a6f567fcaa4ca48973e','{\"login_token\":\"a43f8a07a1334df999db253b8008c626\"}','2025-03-24 12:14:17'),
('f7c5cc3219ba38015fce711a3b','{\"login_token\":\"3dda520ab2862edfbe6a7730fd32a00d\"}','2025-03-24 12:14:46'),
('f7c6dc436ad12816fe95556502','{\"currency\":\"USD\"}','2025-03-24 12:13:21'),
('f7da7b8cab34992ac2aa7ff063','{\"login_token\":\"06b96c37926ca0c451452eabac234bbb\"}','2025-03-24 12:14:41'),
('f7e93e46fe54366a236ebbce56','{\"login_token\":\"b9723375ac00dec3c70447464e49b6ad\"}','2025-03-24 12:13:59'),
('f80168d62428fd1ed681a62c9f','{\"currency\":\"USD\"}','2025-03-24 12:14:08'),
('f818cd2d2d605b5264c576d494','{\"login_token\":\"a0c937a6b2d9476956fd62d2fc1188a8\"}','2025-03-24 12:13:31'),
('f880bc9449a5895d68079443e5','{\"currency\":\"USD\"}','2025-03-24 12:13:20'),
('f8b27f4a1fc3677737800b9aa6','{\"login_token\":\"ef88c33ee8dc2aeabf0fe9959cfb67e5\"}','2025-03-24 12:13:06'),
('f8e56739faae4af76538c7074e','{\"login_token\":\"7547f40a6c974b805434d0fcd9846055\"}','2025-03-24 12:13:00'),
('f9082a273a440080a6c0e7ccd8','{\"login_token\":\"ca35620ff212195aa33703e38982747c\"}','2025-03-24 12:13:57'),
('f950e8aac233d98dcae717f989','{\"currency\":\"USD\"}','2025-03-24 12:14:20'),
('f956422ab8a875df89d518ab30','{\"currency\":\"USD\"}','2025-03-24 12:14:13'),
('f969da85c184b5d1c6dc44224f','{\"login_token\":\"f64279a25e295c0785bc9bd272c21128\"}','2025-03-24 12:14:02'),
('f9779decfc8a0dc677ed39ee39','{\"currency\":\"USD\"}','2025-03-24 12:14:18'),
('f98f5f7206ee15183c107997c1','{\"login_token\":\"b8cba4fc771afa79a275008df433f081\"}','2025-03-24 12:13:09'),
('f9c218745e8340b37f4f645c2f','{\"login_token\":\"27cc3bfb41995fb2c9f8664ba6e63a3b\"}','2025-03-24 12:12:57'),
('f9c91bd4f1b70b9e29aafe25e7','{\"currency\":\"USD\"}','2025-03-24 12:13:27'),
('f9f71f6bc5c708d4709b902927','{\"currency\":\"USD\"}','2025-03-24 12:13:06'),
('fa41de7dc158e9dcd82aa9da92','{\"login_token\":\"ee349e2927c4e81300d69fb2c6081c1a\"}','2025-03-24 12:14:04'),
('fa73217610619b2aa1fad9f84d','{\"login_token\":\"944bbeea385c81c311047040b86cc26e\"}','2025-03-24 12:13:18'),
('fa864c7bd7194609999b05b271','{\"currency\":\"USD\"}','2025-03-24 12:13:02'),
('fa8edd50e8c53917dbe15f5344','{\"currency\":\"USD\"}','2025-03-24 12:13:53'),
('fa90609e653d702caca83d9ff4','{\"login_token\":\"5bafb42c87c039da7653e3285d26241f\"}','2025-03-24 12:13:05'),
('fa9c1854b527045c6bb4bfb39c','{\"login_token\":\"f8a5563ec15769ed4eda4f434e137557\"}','2025-03-24 12:14:38'),
('faa92045d50374909f1beec3f6','{\"login_token\":\"e72f272fdd9004e1f25450de1fd6e72c\"}','2025-03-24 12:12:54'),
('fab008cee86c7b6599d185e3a0','{\"login_token\":\"02019a01aa131df24cd4cf6b30349643\"}','2025-03-24 12:12:59'),
('faec22abb32b0098a27859dfef','{\"login_token\":\"a44ac6650f4342db4c7575dcf18a5a4a\"}','2025-03-24 12:13:17'),
('fb1b5ac22a71851d19e5ce957e','{\"currency\":\"USD\"}','2025-03-24 12:13:31'),
('fb23d113e9d23f56687900be6f','{\"login_token\":\"fd007451c9b50f6d49cc9a3dc8ae41bc\"}','2025-03-24 12:13:12'),
('fb6ea97b0e0e2922e2b0ae37e3','{\"login_token\":\"84d887f3fca489cd9742b34b037ef024\"}','2025-03-24 12:14:31'),
('fb8a89fd92af7c3e6a08bac9af','{\"currency\":\"USD\"}','2025-03-24 12:13:04'),
('fb8c5f3ae9adc7507ee6bec49a','{\"currency\":\"USD\"}','2025-03-24 12:13:57'),
('fb91684b403448d016fd55676c','{\"login_token\":\"e316229276be6cf0e04d27cd0c8dc0d0\"}','2025-03-24 12:13:12'),
('fb928ee9011a6bbe5b8d5f9f22','{\"login_token\":\"7221b4141e61203e92d1848d01210860\"}','2025-03-24 12:13:37'),
('fbc405906af9f349eff157eede','{\"currency\":\"USD\"}','2025-03-24 12:14:29'),
('fbc4124060064fade9db72429c','{\"login_token\":\"6e66272fcb4201320fc40b1e71bff9b3\"}','2025-03-24 12:14:14'),
('fbc9ccab819812ead15b2faa1a','{\"currency\":\"USD\"}','2025-03-24 12:13:57'),
('fbcaf632bab4eaeb7a66149f60','{\"login_token\":\"176c358584dfb0231e308db0b2b8b15b\"}','2025-03-24 12:14:39'),
('fbd7a8550ab75e7056a1de2207','{\"currency\":\"USD\"}','2025-03-24 12:14:15'),
('fbe24b0cbb1983ead65468351b','{\"login_token\":\"64cedfdefd315c71546cd95ec4efced9\"}','2025-03-24 12:13:05'),
('fbf643e5d6758994b8b11d6b8b','{\"login_token\":\"ddb0722cc84880f80778266f3ede901a\"}','2025-03-24 12:13:56'),
('fc145905b3e42fc05a4ef3e1ab','{\"login_token\":\"7a38d1a253f38a2b72a02b7b226ed48e\"}','2025-03-24 12:12:55'),
('fc58e533664f6e265f807e4b2b','{\"login_token\":\"d00437390e7c4e6dee45dc4c7f35abd8\"}','2025-03-24 12:14:25'),
('fc6b183b8025ad3ae8e34d79a6','{\"login_token\":\"739844f444009a1ef74e17e477c037dc\"}','2025-03-24 12:13:06'),
('fc790418afafd595a2f87cd8ff','{\"login_token\":\"0596c0968bf8c60b763a308a83ec281d\"}','2025-03-24 12:13:46'),
('fca775b333b5a46780750d1135','{\"login_token\":\"4703e157668c098bc74c93c6f0b3c127\"}','2025-03-24 12:12:56'),
('fcb87ddb73ba00a8c3de6d5f54','{\"login_token\":\"4f19de4173f067ee0d5d6c8705ccdd76\"}','2025-03-24 12:14:26'),
('fcbf709da0e0ac335f6eb0d01d','{\"currency\":\"USD\"}','2025-03-24 12:13:25'),
('fcc92ad8492e0f2b1271100efb','{\"currency\":\"USD\"}','2025-03-24 12:14:06'),
('fd00275e82e6551b27e1d5ca1c','{\"login_token\":\"13973663dc4379e31530707951c409fc\"}','2025-03-24 12:14:34'),
('fd3407a58fa52725f7c32e9931','{\"login_token\":\"66fc200d8abf4e7eaf5ea482f381b41c\"}','2025-03-24 12:13:04'),
('fd385741b792d56a5ab42acdec','{\"currency\":\"USD\"}','2025-03-24 12:14:26'),
('fd3b1b9d3580407105641bceec','{\"login_token\":\"2d9acbe9b7be108215a6ec4a8ab41912\"}','2025-03-24 12:13:18'),
('fd6b5e5f385b88c4436094e435','{\"login_token\":\"21eb3bfc9bda6d55d5ba0e20385ef262\"}','2025-03-24 12:14:22'),
('fddaa534b668ee23fda4a93bd8','{\"currency\":\"USD\"}','2025-03-24 12:14:23'),
('fe0c8430b3caf0a064eb2e83fa','{\"currency\":\"USD\"}','2025-03-24 12:13:45'),
('fe3ec8220a29b0d8755144881c','{\"login_token\":\"04cfdad531264b1e8fb39b3cc0354f4e\"}','2025-03-24 12:13:34'),
('fe798660c94cdac92c422cb693','{\"currency\":\"USD\"}','2025-03-24 12:14:16'),
('fe9d18c0c0ec67363df6875c80','{\"login_token\":\"febd3ebf1673f27ba1cb9db3a9e00d3e\"}','2025-03-24 12:14:23'),
('feb3a312661a219cc477daa450','{\"currency\":\"USD\"}','2025-03-24 12:13:14'),
('fecdabe1b5975e7810283d9138','{\"login_token\":\"23e0c1f345d282bba28b46c146e04f9d\"}','2025-03-24 12:13:01'),
('feddb77da833088e4d28124a05','{\"currency\":\"USD\"}','2025-03-24 12:13:59'),
('ff434adbda6b3a4a5ab10d2c03','{\"login_token\":\"691e03eb74b59d805a63b7299a26ad3c\"}','2025-03-24 12:13:19'),
('ff57ee9130c0933e81ebd28478','{\"login_token\":\"484f0f3106a4e20a6be53122478696c2\"}','2025-03-24 12:13:19'),
('ff6af8ff7e0905ca47e9c9ed74','{\"login_token\":\"de4acccdbe22117c1e6078a399d779a0\"}','2025-03-24 12:13:13'),
('ff6db6721ab13ef6d671964561','{\"currency\":\"USD\"}','2025-03-24 12:13:41'),
('ff75680a1d349e6fc22919421e','{\"currency\":\"USD\"}','2025-03-24 12:14:45'),
('ff78c6360af62c22ca76594272','{\"currency\":\"USD\"}','2025-03-24 12:14:31'),
('ff7b7ac9f3e935df85db354f0b','{\"login_token\":\"a3674a0362db1ce5f2d3048309d38fa6\"}','2025-03-24 12:13:40'),
('ff8e9501d3e910cb54901dd9cd','{\"login_token\":\"afb386c4ec96b73aebca28684f9d32fd\"}','2025-03-24 12:13:28'),
('ffa98b5cc935cfe049e1cb8434','{\"login_token\":\"d0539afb98cdc3b7e981cc17ef918321\"}','2025-03-24 12:14:31'),
('ffb4a24ff347275fe607bbb80f','{\"currency\":\"USD\"}','2025-03-24 12:12:24'),
('ffda2d0fcac9d19bb399a58a5a','{\"login_token\":\"d8df47acb5b3674c2385c4b69495e83c\"}','2025-03-24 12:13:57'),
('ffe44b784ea8e2e09e2c53fa1f','{\"login_token\":\"7356a9c167b533268925b314a6854988\"}','2025-03-24 12:14:26'),
('ffe770c65a96ef8df1146672de','{\"login_token\":\"89e9091aaf3bdd407d4ea119b6bf0d04\"}','2025-03-24 12:14:17'),
('ffe9affaf937f2bb6063a1c417','{\"login_token\":\"3105ae0f26d218f1e1bcf87d908ea6ce\"}','2025-03-24 12:13:47'),
('fff7ba8f72acb236a972485ce5','{\"login_token\":\"1dfd95b5900dbe21f3597cc150944505\"}','2025-03-24 12:14:37');
/*!40000 ALTER TABLE `oc_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_setting`
--

DROP TABLE IF EXISTS `oc_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `code` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_setting`
--

LOCK TABLES `oc_setting` WRITE;
/*!40000 ALTER TABLE `oc_setting` DISABLE KEYS */;
INSERT INTO `oc_setting` VALUES
(1,0,'config','config_robots','abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg',0),
(2,0,'config','config_shared','0',0),
(3,0,'config','config_fraud_detection','0',0),
(4,0,'config','config_meta_title','Your Store',0),
(5,0,'config','config_session_expire','86400',0),
(6,0,'config','config_session_samesite','Strict',0),
(7,0,'config','config_meta_description','My Store',0),
(8,0,'config','config_meta_keyword','',0),
(9,0,'config','config_theme','basic',0),
(10,0,'config','config_layout_id','4',0),
(11,0,'config','config_country_id','222',0),
(12,0,'config','config_zone_id','3563',0),
(13,0,'config','config_timezone','UTC',0),
(14,0,'config','config_language','en-gb',0),
(15,0,'config','config_language_admin','en-gb',0),
(16,0,'config','config_currency','USD',0),
(17,0,'config','config_currency_auto','1',0),
(18,0,'config','config_currency_engine','ecb',0),
(19,0,'config','config_length_class_id','1',0),
(20,0,'config','config_weight_class_id','1',0),
(21,0,'config','config_product_description_length','100',0),
(22,0,'config','config_pagination','10',0),
(23,0,'config','config_pagination_admin','10',0),
(24,0,'config','config_product_count','1',0),
(25,0,'config','config_review_status','1',0),
(26,0,'config','config_review_guest','1',0),
(27,0,'config','config_voucher_min','1',0),
(28,0,'config','config_voucher_max','1000',0),
(29,0,'config','config_cookie_id','0',0),
(30,0,'config','config_gdpr_id','0',0),
(31,0,'config','config_gdpr_limit','180',0),
(32,0,'config','config_tax','1',0),
(33,0,'config','config_tax_default','shipping',0),
(34,0,'config','config_tax_customer','shipping',0),
(35,0,'config','config_customer_online','0',0),
(36,0,'config','config_customer_online_expire','1',0),
(37,0,'config','config_customer_activity','0',0),
(38,0,'config','config_customer_search','0',0),
(39,0,'config','config_customer_group_id','1',0),
(40,0,'config','config_customer_group_display','[\"1\"]',1),
(41,0,'config','config_customer_price','0',0),
(42,0,'config','config_address_format_id','1',0),
(43,0,'config','config_account_id','3',0),
(44,0,'config','config_invoice_prefix','INV-2023-00',0),
(46,0,'config','config_cart_weight','1',0),
(47,0,'config','config_checkout_guest','1',0),
(48,0,'config','config_checkout_id','0',0),
(49,0,'config','config_order_status_id','1',0),
(50,0,'config','config_processing_status','[\"5\",\"1\",\"2\",\"12\",\"3\"]',1),
(51,0,'config','config_complete_status','[\"5\",\"3\"]',1),
(52,0,'config','config_fraud_status_id','8',0),
(53,0,'config','config_subscription_status_id','1',0),
(54,0,'config','config_subscription_active_status_id','2',0),
(55,0,'config','config_subscription_expired_status_id','6',0),
(56,0,'config','config_subscription_canceled_status_id','4',0),
(57,0,'config','config_subscription_failed_status_id','3',0),
(58,0,'config','config_subscription_denied_status_id','5',0),
(59,0,'config','config_stock_display','0',0),
(60,0,'config','config_stock_warning','0',0),
(61,0,'config','config_stock_checkout','0',0),
(62,0,'config','config_affiliate_status','1',0),
(63,0,'config','config_affiliate_approval','0',0),
(64,0,'config','config_affiliate_auto','0',0),
(65,0,'config','config_affiliate_commission','5',0),
(66,0,'config','config_affiliate_id','4',0),
(67,0,'config','config_return_id','0',0),
(68,0,'config','config_return_status_id','2',0),
(69,0,'config','config_logo','catalog/opencart-logo.png',0),
(70,0,'config','config_image_thumb_width','500',0),
(71,0,'config','config_image_thumb_height','500',0),
(72,0,'config','config_image_popup_width','800',0),
(73,0,'config','config_image_popup_height','800',0),
(74,0,'config','config_image_category_width','80',0),
(75,0,'config','config_image_category_height','80',0),
(76,0,'config','config_image_product_width','250',0),
(77,0,'config','config_image_product_height','250',0),
(78,0,'config','config_image_additional_width','74',0),
(79,0,'config','config_image_additional_height','74',0),
(80,0,'config','config_image_related_width','250',0),
(81,0,'config','config_image_related_height','250',0),
(82,0,'config','config_image_compare_width','90',0),
(83,0,'config','config_image_compare_height','90',0),
(84,0,'config','config_image_wishlist_width','47',0),
(85,0,'config','config_image_wishlist_height','47',0),
(86,0,'config','config_image_cart_height','47',0),
(87,0,'config','config_image_cart_width','47',0),
(88,0,'config','config_image_location_height','50',0),
(89,0,'config','config_image_location_width','268',0),
(90,0,'config','config_comment','',0),
(91,0,'config','config_open','',0),
(92,0,'config','config_image','',0),
(93,0,'config','config_fax','',0),
(94,0,'config','config_telephone','123456789',0),
(96,0,'config','config_geocode','',0),
(97,0,'config','config_owner','Your Name',0),
(98,0,'config','config_address','Address 1',0),
(99,0,'config','config_name','Your Store',0),
(100,0,'config','config_seo_url','0',0),
(101,0,'config','config_file_max_size','20',0),
(102,0,'config','config_file_ext_allowed','zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\nwebp\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nmp4\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc',0),
(103,0,'config','config_file_mime_allowed','text/plain\r\nimage/png\r\nimage/webp\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-zip\r\napplication/x-zip-compressed\r\napplication/rar\r\napplication/x-rar\r\napplication/x-rar-compressed\r\napplication/octet-stream\r\naudio/mpeg\r\nvideo/mp4\r\nvideo/quicktime\r\napplication/pdf',0),
(104,0,'config','config_maintenance','0',0),
(106,0,'config','config_compression','0',0),
(107,0,'config','config_error_display','1',0),
(108,0,'config','config_error_log','1',0),
(109,0,'config','config_error_filename','error.log',0),
(110,0,'config','config_mail_engine','',0),
(111,0,'config','config_mail_parameter','',0),
(112,0,'config','config_mail_smtp_hostname','',0),
(113,0,'config','config_mail_smtp_username','',0),
(114,0,'config','config_mail_smtp_password','',0),
(115,0,'config','config_mail_smtp_port','25',0),
(116,0,'config','config_mail_smtp_timeout','5',0),
(117,0,'config','config_mail_alert_email','',0),
(118,0,'config','config_mail_alert','[\"order\"]',1),
(119,0,'config','config_captcha','basic',0),
(120,0,'config','config_captcha_page','[\"review\",\"return\",\"contact\"]',1),
(121,0,'config','config_login_attempts','5',0),
(122,0,'developer','developer_sass','1',0),
(123,0,'currency_ecb','currency_ecb_status','1',0),
(124,0,'payment_free_checkout','payment_free_checkout_status','1',0),
(125,0,'payment_free_checkout','payment_free_checkout_order_status_id','1',0),
(126,0,'payment_free_checkout','payment_free_checkout_sort_order','1',0),
(127,0,'payment_cod','payment_cod_sort_order','5',0),
(128,0,'payment_cod','payment_cod_total','0.01',0),
(129,0,'payment_cod','payment_cod_order_status_id','1',0),
(130,0,'payment_cod','payment_cod_geo_zone_id','0',0),
(131,0,'payment_cod','payment_cod_status','1',0),
(132,0,'shipping_flat','shipping_flat_sort_order','1',0),
(133,0,'shipping_flat','shipping_flat_status','1',0),
(134,0,'shipping_flat','shipping_flat_geo_zone_id','0',0),
(135,0,'shipping_flat','shipping_flat_tax_class_id','9',0),
(136,0,'shipping_flat','shipping_flat_cost','5.00',0),
(137,0,'total_shipping','total_shipping_sort_order','3',0),
(138,0,'total_sub_total','total_sub_total_sort_order','1',0),
(139,0,'total_sub_total','total_sub_total_status','1',0),
(140,0,'total_tax','total_tax_sort_order','5',0),
(141,0,'total_tax','total_tax_status','1',0),
(142,0,'total_total','total_total_sort_order','9',0),
(143,0,'total_total','total_total_status','1',0),
(144,0,'total_credit','total_credit_sort_order','7',0),
(145,0,'total_credit','total_credit_status','1',0),
(146,0,'total_reward','total_reward_sort_order','2',0),
(147,0,'total_reward','total_reward_status','1',0),
(148,0,'total_shipping','total_shipping_status','1',0),
(149,0,'total_shipping','total_shipping_estimator','1',0),
(150,0,'total_coupon','total_coupon_sort_order','4',0),
(151,0,'total_coupon','total_coupon_status','1',0),
(152,0,'total_voucher','total_voucher_sort_order','8',0),
(153,0,'total_voucher','total_voucher_status','1',0),
(154,0,'module_category','module_category_status','1',0),
(155,0,'module_account','module_account_status','1',0),
(156,0,'theme_basic','theme_basic_status','1',0),
(157,0,'dashboard_activity','dashboard_activity_status','1',0),
(158,0,'dashboard_activity','dashboard_activity_sort_order','7',0),
(159,0,'dashboard_sale','dashboard_sale_status','1',0),
(160,0,'dashboard_sale','dashboard_sale_width','3',0),
(161,0,'dashboard_chart','dashboard_chart_status','1',0),
(162,0,'dashboard_chart','dashboard_chart_width','6',0),
(163,0,'dashboard_customer','dashboard_customer_status','1',0),
(164,0,'dashboard_customer','dashboard_customer_width','3',0),
(165,0,'dashboard_map','dashboard_map_status','1',0),
(166,0,'dashboard_map','dashboard_map_width','6',0),
(167,0,'dashboard_online','dashboard_online_status','1',0),
(168,0,'dashboard_online','dashboard_online_width','3',0),
(169,0,'dashboard_order','dashboard_order_sort_order','1',0),
(170,0,'dashboard_order','dashboard_order_status','1',0),
(171,0,'dashboard_order','dashboard_order_width','3',0),
(172,0,'dashboard_sale','dashboard_sale_sort_order','2',0),
(173,0,'dashboard_customer','dashboard_customer_sort_order','3',0),
(174,0,'dashboard_online','dashboard_online_sort_order','4',0),
(175,0,'dashboard_map','dashboard_map_sort_order','5',0),
(176,0,'dashboard_chart','dashboard_chart_sort_order','6',0),
(177,0,'dashboard_recent','dashboard_recent_status','1',0),
(178,0,'dashboard_recent','dashboard_recent_sort_order','8',0),
(179,0,'dashboard_activity','dashboard_activity_width','4',0),
(180,0,'dashboard_recent','dashboard_recent_width','8',0),
(181,0,'report_customer_activity','report_customer_activity_status','1',0),
(182,0,'report_customer_activity','report_customer_activity_sort_order','1',0),
(183,0,'report_customer_order','report_customer_order_status','1',0),
(184,0,'report_customer_order','report_customer_order_sort_order','2',0),
(185,0,'report_customer_reward','report_customer_reward_status','1',0),
(186,0,'report_customer_reward','report_customer_reward_sort_order','3',0),
(187,0,'report_customer_search','report_customer_search_sort_order','3',0),
(188,0,'report_customer_search','report_customer_search_status','1',0),
(189,0,'report_customer_transaction','report_customer_transaction_status','1',0),
(190,0,'report_customer_transaction','report_customer_transaction_sort_order','4',0),
(191,0,'report_sale_tax','report_sale_tax_status','1',0),
(192,0,'report_sale_tax','report_sale_tax_sort_order','5',0),
(193,0,'report_sale_shipping','report_sale_shipping_status','1',0),
(194,0,'report_sale_shipping','report_sale_shipping_sort_order','6',0),
(195,0,'report_sale_return','report_sale_return_status','1',0),
(196,0,'report_sale_return','report_sale_return_sort_order','7',0),
(197,0,'report_sale_order','report_sale_order_status','1',0),
(198,0,'report_sale_order','report_sale_order_sort_order','8',0),
(199,0,'report_sale_coupon','report_sale_coupon_status','1',0),
(200,0,'report_sale_coupon','report_sale_coupon_sort_order','9',0),
(201,0,'report_product_viewed','report_product_viewed_status','1',0),
(202,0,'report_product_viewed','report_product_viewed_sort_order','10',0),
(203,0,'report_product_purchased','report_product_purchased_status','1',0),
(204,0,'report_product_purchased','report_product_purchased_sort_order','11',0),
(205,0,'report_marketing','report_marketing_status','1',0),
(206,0,'report_marketing','report_marketing_sort_order','12',0),
(207,0,'config','config_email','admin@email.com',0),
(208,0,'config','config_encryption','131e82b333e01019b287ab78c2387318a936a403180bce8a17efc8f6dd65d862bd0d2711b18321e5338c49b378fb43008d0fdc011ac0d87b7fa903a136a46faa103a4815c76b43be7b706257dfe1339ad969c463bd17949896709249633f919de8f9f366304c29c71102cab962cfab8072e177fe14d39807282e06ef8a81725e0e846e7be4058dd478c7cc3873543e0dce8687d100e742e541fab6efe5d887966c0d41151937b8966b8a4f39651a253f7eb0996da845a68705265b5f3e1b3745d65a048dd30da9262263acf40a27505ecdcc59c9654c21268b99c5b94c0e2560b8c692ccbec54ffc6bc170647f2406a117c8480aa08bbdde8cc32b19ca305cfb',0),
(209,0,'config','config_api_id','1',0);
/*!40000 ALTER TABLE `oc_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_startup`
--

DROP TABLE IF EXISTS `oc_startup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_startup` (
  `startup_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`startup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_startup`
--

LOCK TABLES `oc_startup` WRITE;
/*!40000 ALTER TABLE `oc_startup` DISABLE KEYS */;
INSERT INTO `oc_startup` VALUES
(1,'a','a',0,0),
(2,'c','c',2,2);
/*!40000 ALTER TABLE `oc_startup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_statistics`
--

DROP TABLE IF EXISTS `oc_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_statistics` (
  `statistics_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `value` decimal(15,4) NOT NULL,
  PRIMARY KEY (`statistics_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_statistics`
--

LOCK TABLES `oc_statistics` WRITE;
/*!40000 ALTER TABLE `oc_statistics` DISABLE KEYS */;
INSERT INTO `oc_statistics` VALUES
(1,'order_sale',0.0000),
(2,'order_processing',0.0000),
(3,'order_complete',0.0000),
(4,'order_other',0.0000),
(5,'returns',0.0000),
(6,'product',0.0000),
(7,'review',0.0000);
/*!40000 ALTER TABLE `oc_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_stock_status`
--

DROP TABLE IF EXISTS `oc_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_stock_status`
--

LOCK TABLES `oc_stock_status` WRITE;
/*!40000 ALTER TABLE `oc_stock_status` DISABLE KEYS */;
INSERT INTO `oc_stock_status` VALUES
(5,1,'Out Of Stock'),
(6,1,'2-3 Days'),
(7,1,'In Stock'),
(8,1,'Pre-Order');
/*!40000 ALTER TABLE `oc_stock_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_store`
--

DROP TABLE IF EXISTS `oc_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_store`
--

LOCK TABLES `oc_store` WRITE;
/*!40000 ALTER TABLE `oc_store` DISABLE KEYS */;
INSERT INTO `oc_store` VALUES
(1,'a','a'),
(2,'c','c');
/*!40000 ALTER TABLE `oc_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_subscription`
--

DROP TABLE IF EXISTS `oc_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_subscription` (
  `subscription_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `subscription_plan_id` int(11) NOT NULL,
  `customer_payment_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `reference` varchar(255) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_remaining` smallint(6) NOT NULL,
  `trial_status` tinyint(1) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `cycle` smallint(6) NOT NULL,
  `duration` smallint(6) NOT NULL,
  `remaining` smallint(6) NOT NULL,
  `date_next` datetime NOT NULL,
  `subscription_status_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription`
--

LOCK TABLES `oc_subscription` WRITE;
/*!40000 ALTER TABLE `oc_subscription` DISABLE KEYS */;
INSERT INTO `oc_subscription` VALUES
(1,0,0,0,0,0,'a','a','a',0.0000,'day',0,0,0,0,0.0000,'day',0,0,0,'1970-01-01 00:00:01',0,0,'1970-01-01 00:00:01','1970-01-01 00:00:01'),
(2,2,2,2,2,2,'c','c','c',2.0000,'semi_month',2,2,2,2,2.0000,'semi_month',2,2,2,'1970-01-01 00:00:03',2,2,'1970-01-01 00:00:03','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_subscription_history`
--

DROP TABLE IF EXISTS `oc_subscription_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_subscription_history` (
  `subscription_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) NOT NULL,
  `subscription_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT 0,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`subscription_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_history`
--

LOCK TABLES `oc_subscription_history` WRITE;
/*!40000 ALTER TABLE `oc_subscription_history` DISABLE KEYS */;
INSERT INTO `oc_subscription_history` VALUES
(1,0,0,0,'a','1970-01-01 00:00:01'),
(2,2,2,2,'c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_subscription_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_subscription_plan`
--

DROP TABLE IF EXISTS `oc_subscription_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_subscription_plan` (
  `subscription_plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) NOT NULL,
  `trial_cycle` int(10) NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) NOT NULL,
  `cycle` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`subscription_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_plan`
--

LOCK TABLES `oc_subscription_plan` WRITE;
/*!40000 ALTER TABLE `oc_subscription_plan` DISABLE KEYS */;
INSERT INTO `oc_subscription_plan` VALUES
(1,0.0000,'day',0,0,0,0.0000,'day',0,0,0,0),
(2,2.0000,'semi_month',2,2,2,2.0000,'semi_month',2,2,2,2);
/*!40000 ALTER TABLE `oc_subscription_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_subscription_plan_description`
--

DROP TABLE IF EXISTS `oc_subscription_plan_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_subscription_plan_description` (
  `subscription_plan_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`subscription_plan_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_plan_description`
--

LOCK TABLES `oc_subscription_plan_description` WRITE;
/*!40000 ALTER TABLE `oc_subscription_plan_description` DISABLE KEYS */;
INSERT INTO `oc_subscription_plan_description` VALUES
(0,0,'a','a'),
(1,1,'b','b'),
(2,2,'c','c');
/*!40000 ALTER TABLE `oc_subscription_plan_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_subscription_status`
--

DROP TABLE IF EXISTS `oc_subscription_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_subscription_status` (
  `subscription_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`subscription_status_id`,`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_status`
--

LOCK TABLES `oc_subscription_status` WRITE;
/*!40000 ALTER TABLE `oc_subscription_status` DISABLE KEYS */;
INSERT INTO `oc_subscription_status` VALUES
(1,1,'Pending'),
(2,1,'Active'),
(3,1,'Failed'),
(4,1,'Cancelled'),
(5,1,'Denied'),
(6,1,'Expired');
/*!40000 ALTER TABLE `oc_subscription_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_subscription_transaction`
--

DROP TABLE IF EXISTS `oc_subscription_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_subscription_transaction` (
  `subscription_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `subscription_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`subscription_transaction_id`),
  KEY `subscription_id` (`subscription_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_subscription_transaction`
--

LOCK TABLES `oc_subscription_transaction` WRITE;
/*!40000 ALTER TABLE `oc_subscription_transaction` DISABLE KEYS */;
INSERT INTO `oc_subscription_transaction` VALUES
(1,0,0,'a','a',0.0000,0,'a','a','1970-01-01 00:00:01'),
(2,2,2,'c','c',2.0000,2,'c','c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_subscription_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_tax_class`
--

DROP TABLE IF EXISTS `oc_tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_tax_class`
--

LOCK TABLES `oc_tax_class` WRITE;
/*!40000 ALTER TABLE `oc_tax_class` DISABLE KEYS */;
INSERT INTO `oc_tax_class` VALUES
(9,'Taxable Goods','Taxed goods','2009-01-06 23:21:53','2011-09-23 14:07:50'),
(10,'Downloadable Products','Downloadable','2011-09-21 22:19:39','2011-09-22 10:27:36');
/*!40000 ALTER TABLE `oc_tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_tax_rate`
--

DROP TABLE IF EXISTS `oc_tax_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT 0.0000,
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_tax_rate`
--

LOCK TABLES `oc_tax_rate` WRITE;
/*!40000 ALTER TABLE `oc_tax_rate` DISABLE KEYS */;
INSERT INTO `oc_tax_rate` VALUES
(86,3,'VAT (20%)',20.0000,'P','2011-03-09 21:17:10','2011-09-22 22:24:29'),
(87,3,'Eco Tax (-2.00)',2.0000,'F','2011-09-21 21:49:23','2011-09-23 00:40:19');
/*!40000 ALTER TABLE `oc_tax_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_tax_rate_to_customer_group`
--

DROP TABLE IF EXISTS `oc_tax_rate_to_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_tax_rate_to_customer_group`
--

LOCK TABLES `oc_tax_rate_to_customer_group` WRITE;
/*!40000 ALTER TABLE `oc_tax_rate_to_customer_group` DISABLE KEYS */;
INSERT INTO `oc_tax_rate_to_customer_group` VALUES
(86,1),
(87,1);
/*!40000 ALTER TABLE `oc_tax_rate_to_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_tax_rule`
--

DROP TABLE IF EXISTS `oc_tax_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT 1,
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_tax_rule`
--

LOCK TABLES `oc_tax_rule` WRITE;
/*!40000 ALTER TABLE `oc_tax_rule` DISABLE KEYS */;
INSERT INTO `oc_tax_rule` VALUES
(120,10,87,'store',0),
(121,10,86,'payment',1),
(127,9,87,'shipping',2),
(128,9,86,'shipping',1);
/*!40000 ALTER TABLE `oc_tax_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_theme`
--

DROP TABLE IF EXISTS `oc_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` mediumtext NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_theme`
--

LOCK TABLES `oc_theme` WRITE;
/*!40000 ALTER TABLE `oc_theme` DISABLE KEYS */;
INSERT INTO `oc_theme` VALUES
(1,0,'a','a','1970-01-01 00:00:01'),
(2,2,'c','c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_translation`
--

DROP TABLE IF EXISTS `oc_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`translation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_translation`
--

LOCK TABLES `oc_translation` WRITE;
/*!40000 ALTER TABLE `oc_translation` DISABLE KEYS */;
INSERT INTO `oc_translation` VALUES
(1,0,0,'a','a','a','1970-01-01 00:00:01'),
(2,2,2,'c','c','c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_upload`
--

DROP TABLE IF EXISTS `oc_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_upload`
--

LOCK TABLES `oc_upload` WRITE;
/*!40000 ALTER TABLE `oc_upload` DISABLE KEYS */;
INSERT INTO `oc_upload` VALUES
(1,'a','a','a','1970-01-01 00:00:01'),
(2,'c','c','c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user`
--

DROP TABLE IF EXISTS `oc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(40) NOT NULL DEFAULT '',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user`
--

LOCK TABLES `oc_user` WRITE;
/*!40000 ALTER TABLE `oc_user` DISABLE KEYS */;
INSERT INTO `oc_user` VALUES
(1,1,'admin','$2y$10$cwfikJKMQYN8ybLtup1uDOvJW3AN3vcPq4lhafKhj4TTgxqQsMtwC','John','Doe','admin@email.com','','','192.168.128.1',1,'2023-03-01 21:40:34');
/*!40000 ALTER TABLE `oc_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_group`
--

DROP TABLE IF EXISTS `oc_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_group`
--

LOCK TABLES `oc_user_group` WRITE;
/*!40000 ALTER TABLE `oc_user_group` DISABLE KEYS */;
INSERT INTO `oc_user_group` VALUES
(1,'Administrator','{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/review\",\"catalog\\/subscription_plan\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/pagination\",\"common\\/security\",\"cron\\/cron\",\"cron\\/currency\",\"cron\\/gdpr\",\"cron\\/subscription\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"customer\\/gdpr\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"error\\/exception\",\"extension\\/analytics\",\"extension\\/captcha\",\"extension\\/currency\",\"extension\\/dashboard\",\"extension\\/feed\",\"extension\\/fraud\",\"extension\\/language\",\"extension\\/module\",\"extension\\/other\",\"extension\\/payment\",\"extension\\/report\",\"extension\\/shipping\",\"extension\\/theme\",\"extension\\/total\",\"localisation\\/address_format\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/subscription_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/authorize\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/gdpr\",\"mail\\/returns\",\"mail\\/reward\",\"mail\\/subscription\",\"mail\\/transaction\",\"mail\\/voucher\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/cron\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/promotion\",\"marketplace\\/startup\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/returns\",\"sale\\/subscription\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/authorize\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/notification\",\"tool\\/upgrade\",\"tool\\/upload\",\"user\\/api\",\"user\\/profile\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/opencart\\/captcha\\/basic\",\"extension\\/opencart\\/currency\\/ecb\",\"extension\\/opencart\\/currency\\/fixer\",\"extension\\/opencart\\/dashboard\\/activity\",\"extension\\/opencart\\/dashboard\\/chart\",\"extension\\/opencart\\/dashboard\\/customer\",\"extension\\/opencart\\/dashboard\\/map\",\"extension\\/opencart\\/dashboard\\/online\",\"extension\\/opencart\\/dashboard\\/order\",\"extension\\/opencart\\/dashboard\\/recent\",\"extension\\/opencart\\/dashboard\\/sale\",\"extension\\/opencart\\/fraud\\/ip\",\"extension\\/opencart\\/module\\/account\",\"extension\\/opencart\\/module\\/banner\",\"extension\\/opencart\\/module\\/bestseller\",\"extension\\/opencart\\/module\\/category\",\"extension\\/opencart\\/module\\/featured\",\"extension\\/opencart\\/module\\/filter\",\"extension\\/opencart\\/module\\/html\",\"extension\\/opencart\\/module\\/information\",\"extension\\/opencart\\/module\\/latest\",\"extension\\/opencart\\/module\\/special\",\"extension\\/opencart\\/module\\/store\",\"extension\\/opencart\\/payment\\/bank_transfer\",\"extension\\/opencart\\/payment\\/cheque\",\"extension\\/opencart\\/payment\\/cod\",\"extension\\/opencart\\/payment\\/free_checkout\",\"extension\\/opencart\\/report\\/customer_activity\",\"extension\\/opencart\\/report\\/customer_order\",\"extension\\/opencart\\/report\\/customer_reward\",\"extension\\/opencart\\/report\\/customer_search\",\"extension\\/opencart\\/report\\/customer_transaction\",\"extension\\/opencart\\/report\\/marketing\",\"extension\\/opencart\\/report\\/product_purchased\",\"extension\\/opencart\\/report\\/product_viewed\",\"extension\\/opencart\\/report\\/sale_coupon\",\"extension\\/opencart\\/report\\/sale_order\",\"extension\\/opencart\\/report\\/sale_return\",\"extension\\/opencart\\/report\\/sale_shipping\",\"extension\\/opencart\\/report\\/sale_tax\",\"extension\\/opencart\\/shipping\\/flat\",\"extension\\/opencart\\/shipping\\/free\",\"extension\\/opencart\\/shipping\\/item\",\"extension\\/opencart\\/shipping\\/pickup\",\"extension\\/opencart\\/shipping\\/weight\",\"extension\\/opencart\\/theme\\/basic\",\"extension\\/opencart\\/total\\/coupon\",\"extension\\/opencart\\/total\\/credit\",\"extension\\/opencart\\/total\\/handling\",\"extension\\/opencart\\/total\\/low_order_fee\",\"extension\\/opencart\\/total\\/reward\",\"extension\\/opencart\\/total\\/shipping\",\"extension\\/opencart\\/total\\/sub_total\",\"extension\\/opencart\\/total\\/tax\",\"extension\\/opencart\\/total\\/total\",\"extension\\/opencart\\/total\\/voucher\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/review\",\"catalog\\/subscription_plan\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/pagination\",\"common\\/security\",\"cron\\/cron\",\"cron\\/currency\",\"cron\\/gdpr\",\"cron\\/subscription\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"customer\\/gdpr\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"error\\/exception\",\"extension\\/analytics\",\"extension\\/captcha\",\"extension\\/currency\",\"extension\\/dashboard\",\"extension\\/feed\",\"extension\\/fraud\",\"extension\\/language\",\"extension\\/module\",\"extension\\/other\",\"extension\\/payment\",\"extension\\/report\",\"extension\\/shipping\",\"extension\\/theme\",\"extension\\/total\",\"localisation\\/address_format\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/subscription_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/authorize\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/gdpr\",\"mail\\/returns\",\"mail\\/reward\",\"mail\\/subscription\",\"mail\\/transaction\",\"mail\\/voucher\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/cron\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/promotion\",\"marketplace\\/startup\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/returns\",\"sale\\/subscription\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/authorize\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/notification\",\"tool\\/upgrade\",\"tool\\/upload\",\"user\\/api\",\"user\\/profile\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/opencart\\/captcha\\/basic\",\"extension\\/opencart\\/currency\\/ecb\",\"extension\\/opencart\\/currency\\/fixer\",\"extension\\/opencart\\/dashboard\\/activity\",\"extension\\/opencart\\/dashboard\\/chart\",\"extension\\/opencart\\/dashboard\\/customer\",\"extension\\/opencart\\/dashboard\\/map\",\"extension\\/opencart\\/dashboard\\/online\",\"extension\\/opencart\\/dashboard\\/order\",\"extension\\/opencart\\/dashboard\\/recent\",\"extension\\/opencart\\/dashboard\\/sale\",\"extension\\/opencart\\/fraud\\/ip\",\"extension\\/opencart\\/module\\/account\",\"extension\\/opencart\\/module\\/banner\",\"extension\\/opencart\\/module\\/bestseller\",\"extension\\/opencart\\/module\\/category\",\"extension\\/opencart\\/module\\/featured\",\"extension\\/opencart\\/module\\/filter\",\"extension\\/opencart\\/module\\/html\",\"extension\\/opencart\\/module\\/information\",\"extension\\/opencart\\/module\\/latest\",\"extension\\/opencart\\/module\\/special\",\"extension\\/opencart\\/module\\/store\",\"extension\\/opencart\\/payment\\/bank_transfer\",\"extension\\/opencart\\/payment\\/cheque\",\"extension\\/opencart\\/payment\\/cod\",\"extension\\/opencart\\/payment\\/free_checkout\",\"extension\\/opencart\\/report\\/customer_activity\",\"extension\\/opencart\\/report\\/customer_order\",\"extension\\/opencart\\/report\\/customer_reward\",\"extension\\/opencart\\/report\\/customer_search\",\"extension\\/opencart\\/report\\/customer_transaction\",\"extension\\/opencart\\/report\\/marketing\",\"extension\\/opencart\\/report\\/product_purchased\",\"extension\\/opencart\\/report\\/product_viewed\",\"extension\\/opencart\\/report\\/sale_coupon\",\"extension\\/opencart\\/report\\/sale_order\",\"extension\\/opencart\\/report\\/sale_return\",\"extension\\/opencart\\/report\\/sale_shipping\",\"extension\\/opencart\\/report\\/sale_tax\",\"extension\\/opencart\\/shipping\\/flat\",\"extension\\/opencart\\/shipping\\/free\",\"extension\\/opencart\\/shipping\\/item\",\"extension\\/opencart\\/shipping\\/pickup\",\"extension\\/opencart\\/shipping\\/weight\",\"extension\\/opencart\\/theme\\/basic\",\"extension\\/opencart\\/total\\/coupon\",\"extension\\/opencart\\/total\\/credit\",\"extension\\/opencart\\/total\\/handling\",\"extension\\/opencart\\/total\\/low_order_fee\",\"extension\\/opencart\\/total\\/reward\",\"extension\\/opencart\\/total\\/shipping\",\"extension\\/opencart\\/total\\/sub_total\",\"extension\\/opencart\\/total\\/tax\",\"extension\\/opencart\\/total\\/total\",\"extension\\/opencart\\/total\\/voucher\"]}'),
(2,'Demonstration','');
/*!40000 ALTER TABLE `oc_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_user_login`
--

DROP TABLE IF EXISTS `oc_user_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_user_login` (
  `user_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(96) NOT NULL,
  `total` int(1) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_login_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_user_login`
--

LOCK TABLES `oc_user_login` WRITE;
/*!40000 ALTER TABLE `oc_user_login` DISABLE KEYS */;
INSERT INTO `oc_user_login` VALUES
(1,0,'a',0,'a','a',0,'1970-01-01 00:00:01'),
(2,2,'c',2,'c','c',2,'1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_user_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_vendor`
--

DROP TABLE IF EXISTS `oc_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_vendor` (
  `vendor_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` text NOT NULL,
  `version` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_vendor`
--

LOCK TABLES `oc_vendor` WRITE;
/*!40000 ALTER TABLE `oc_vendor` DISABLE KEYS */;
INSERT INTO `oc_vendor` VALUES
(1,'a','a','a','1970-01-01 00:00:01'),
(2,'c','c','c','1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_voucher`
--

DROP TABLE IF EXISTS `oc_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_voucher`
--

LOCK TABLES `oc_voucher` WRITE;
/*!40000 ALTER TABLE `oc_voucher` DISABLE KEYS */;
INSERT INTO `oc_voucher` VALUES
(1,0,'a','a','a','a','a',0,'a',0.0000,0,'1970-01-01 00:00:01'),
(2,2,'c','c','c','c','c',2,'c',2.0000,2,'1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_voucher_history`
--

DROP TABLE IF EXISTS `oc_voucher_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_voucher_history`
--

LOCK TABLES `oc_voucher_history` WRITE;
/*!40000 ALTER TABLE `oc_voucher_history` DISABLE KEYS */;
INSERT INTO `oc_voucher_history` VALUES
(1,0,0,0.0000,'1970-01-01 00:00:01'),
(2,2,2,2.0000,'1970-01-01 00:00:03');
/*!40000 ALTER TABLE `oc_voucher_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_voucher_theme`
--

DROP TABLE IF EXISTS `oc_voucher_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_voucher_theme`
--

LOCK TABLES `oc_voucher_theme` WRITE;
/*!40000 ALTER TABLE `oc_voucher_theme` DISABLE KEYS */;
INSERT INTO `oc_voucher_theme` VALUES
(6,'catalog/demo/apple_logo.jpg'),
(7,'catalog/demo/gift-voucher-birthday.jpg'),
(8,'catalog/demo/canon_eos_5d_2.jpg');
/*!40000 ALTER TABLE `oc_voucher_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_voucher_theme_description`
--

DROP TABLE IF EXISTS `oc_voucher_theme_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_voucher_theme_description`
--

LOCK TABLES `oc_voucher_theme_description` WRITE;
/*!40000 ALTER TABLE `oc_voucher_theme_description` DISABLE KEYS */;
INSERT INTO `oc_voucher_theme_description` VALUES
(6,1,'Christmas'),
(7,1,'Birthday'),
(8,1,'General');
/*!40000 ALTER TABLE `oc_voucher_theme_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_weight_class`
--

DROP TABLE IF EXISTS `oc_weight_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT 0.00000000,
  PRIMARY KEY (`weight_class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_weight_class`
--

LOCK TABLES `oc_weight_class` WRITE;
/*!40000 ALTER TABLE `oc_weight_class` DISABLE KEYS */;
INSERT INTO `oc_weight_class` VALUES
(1,1.00000000),
(2,1000.00000000),
(5,2.20460000),
(6,35.27400000);
/*!40000 ALTER TABLE `oc_weight_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_weight_class_description`
--

DROP TABLE IF EXISTS `oc_weight_class_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_weight_class_description`
--

LOCK TABLES `oc_weight_class_description` WRITE;
/*!40000 ALTER TABLE `oc_weight_class_description` DISABLE KEYS */;
INSERT INTO `oc_weight_class_description` VALUES
(1,1,'Kilogram','kg'),
(2,1,'Gram','g'),
(5,1,'Pound ','lb'),
(6,1,'Ounce','oz');
/*!40000 ALTER TABLE `oc_weight_class_description` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_zone`
--

DROP TABLE IF EXISTS `oc_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4344 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_zone`
--

LOCK TABLES `oc_zone` WRITE;
/*!40000 ALTER TABLE `oc_zone` DISABLE KEYS */;
INSERT INTO `oc_zone` VALUES
(1,1,'Badakhshan','BDS',1),
(2,1,'Badghis','BDG',1),
(3,1,'Baghlan','BGL',1),
(4,1,'Balkh','BAL',1),
(5,1,'Bamian','BAM',1),
(6,1,'Farah','FRA',1),
(7,1,'Faryab','FYB',1),
(8,1,'Ghazni','GHA',1),
(9,1,'Ghowr','GHO',1),
(10,1,'Helmand','HEL',1),
(11,1,'Herat','HER',1),
(12,1,'Jowzjan','JOW',1),
(13,1,'Kabul','KAB',1),
(14,1,'Kandahar','KAN',1),
(15,1,'Kapisa','KAP',1),
(16,1,'Khost','KHO',1),
(17,1,'Konar','KNR',1),
(18,1,'Kondoz','KDZ',1),
(19,1,'Laghman','LAG',1),
(20,1,'Lowgar','LOW',1),
(21,1,'Nangrahar','NAN',1),
(22,1,'Nimruz','NIM',1),
(23,1,'Nurestan','NUR',1),
(24,1,'Oruzgan','ORU',1),
(25,1,'Paktia','PIA',1),
(26,1,'Paktika','PKA',1),
(27,1,'Parwan','PAR',1),
(28,1,'Samangan','SAM',1),
(29,1,'Sar-e Pol','SAR',1),
(30,1,'Takhar','TAK',1),
(31,1,'Wardak','WAR',1),
(32,1,'Zabol','ZAB',1),
(33,2,'Berat','BR',1),
(34,2,'Bulqize','BU',1),
(35,2,'Delvine','DL',1),
(36,2,'Devoll','DV',1),
(37,2,'Diber','DI',1),
(38,2,'Durres','DR',1),
(39,2,'Elbasan','EL',1),
(40,2,'Kolonje','ER',1),
(41,2,'Fier','FR',1),
(42,2,'Gjirokaster','GJ',1),
(43,2,'Gramsh','GR',1),
(44,2,'Has','HA',1),
(45,2,'Kavaje','KA',1),
(46,2,'Kurbin','KB',1),
(47,2,'Kucove','KC',1),
(48,2,'Korce','KO',1),
(49,2,'Kruje','KR',1),
(50,2,'Kukes','KU',1),
(51,2,'Librazhd','LB',1),
(52,2,'Lezhe','LE',1),
(53,2,'Lushnje','LU',1),
(54,2,'Malesi e Madhe','MM',1),
(55,2,'Mallakaster','MK',1),
(56,2,'Mat','MT',1),
(57,2,'Mirdite','MR',1),
(58,2,'Peqin','PQ',1),
(59,2,'Permet','PR',1),
(60,2,'Pogradec','PG',1),
(61,2,'Puke','PU',1),
(62,2,'Shkoder','SH',1),
(63,2,'Skrapar','SK',1),
(64,2,'Sarande','SR',1),
(65,2,'Tepelene','TE',1),
(66,2,'Tropoje','TP',1),
(67,2,'Tirane','TR',1),
(68,2,'Vlore','VL',1),
(69,3,'Adrar','01',1),
(70,3,'Ain Defla','44',1),
(71,3,'Ain Temouchent','46',1),
(72,3,'Alger','16',1),
(73,3,'Annaba','23',1),
(74,3,'Batna','05',1),
(75,3,'Bechar','08',1),
(76,3,'Bejaia','06',1),
(77,3,'Biskra','07',1),
(78,3,'Blida','09',1),
(79,3,'Bordj Bou Arreridj','34',1),
(80,3,'Bouira','10',1),
(81,3,'Boumerdes','35',1),
(82,3,'Chlef','02',1),
(83,3,'Constantine','26',1),
(84,3,'Djelfa','17',1),
(85,3,'El Bayadh','32',1),
(86,3,'El Oued','39',1),
(87,3,'El Tarf','36',1),
(88,3,'Ghardaia','47',1),
(89,3,'Guelma','24',1),
(90,3,'Illizi','33',1),
(91,3,'Jijel','18',1),
(92,3,'Khenchela','40',1),
(93,3,'Laghouat','03',1),
(94,3,'Mascara','29',1),
(95,3,'Medea','26',1),
(96,3,'Mila','43',1),
(97,3,'Mostaganem','27',1),
(98,3,'M\'Sila','28',1),
(99,3,'Naama','45',1),
(100,3,'Oran','31',1),
(101,3,'Ouargla','30',1),
(102,3,'Oum el-Bouaghi','04',1),
(103,3,'Relizane','48',1),
(104,3,'Saida','20',1),
(105,3,'Setif','19',1),
(106,3,'Sidi Bel Abbes','22',1),
(107,3,'Skikda','21',1),
(108,3,'Souk Ahras','41',1),
(109,3,'Tamanrasset','11',1),
(110,3,'Tebessa','12',1),
(111,3,'Tiaret','14',1),
(112,3,'Tindouf','37',1),
(113,3,'Tipaza','42',1),
(114,3,'Tissemsilt','38',1),
(115,3,'Tizi Ouzou','15',1),
(116,3,'Tlemcen','13',1),
(117,4,'Eastern','E',1),
(118,4,'Manu\'a','M',1),
(119,4,'Rose Island','R',1),
(120,4,'Swains Island','S',1),
(121,4,'Western','W',1),
(122,5,'Andorra la Vella','ALV',1),
(123,5,'Canillo','CAN',1),
(124,5,'Encamp','ENC',1),
(125,5,'Escaldes-Engordany','ESE',1),
(126,5,'La Massana','LMA',1),
(127,5,'Ordino','ORD',1),
(128,5,'Sant Julia de Loria','SJL',1),
(129,6,'Bengo','BGO',1),
(130,6,'Benguela','BGU',1),
(131,6,'Bie','BIE',1),
(132,6,'Cabinda','CAB',1),
(133,6,'Cuando-Cubango','CCU',1),
(134,6,'Cuanza Norte','CNO',1),
(135,6,'Cuanza Sul','CUS',1),
(136,6,'Cunene','CNN',1),
(137,6,'Huambo','HUA',1),
(138,6,'Huila','HUI',1),
(139,6,'Luanda','LUA',1),
(140,6,'Lunda Norte','LNO',1),
(141,6,'Lunda Sul','LSU',1),
(142,6,'Malange','MAL',1),
(143,6,'Moxico','MOX',1),
(144,6,'Namibe','NAM',1),
(145,6,'Uige','UIG',1),
(146,6,'Zaire','ZAI',1),
(147,9,'Saint George','ASG',1),
(148,9,'Saint John','ASJ',1),
(149,9,'Saint Mary','ASM',1),
(150,9,'Saint Paul','ASL',1),
(152,9,'Saint Philip','ASH',1),
(153,9,'Barbuda','BAR',1),
(154,9,'Redonda','RED',1),
(155,10,'Antartida e Islas del Atlantico','AN',1),
(156,10,'Buenos Aires','B',1),
(157,10,'Catamarca','K',1),
(158,10,'Chaco','H',1),
(159,10,'Chubut','U',1),
(160,10,'Cordoba','X',1),
(161,10,'Corrientes','W',1),
(162,10,'Ciudad Autónoma de Buenos Aires','C',1),
(163,10,'Entre Rios','E',1),
(164,10,'Formosa','P',1),
(165,10,'Jujuy','Y',1),
(166,10,'La Pampa','L',1),
(167,10,'La Rioja','F',1),
(168,10,'Mendoza','M',1),
(169,10,'Misiones','N',1),
(170,10,'Neuquen','Q',1),
(171,10,'Rio Negro','R',1),
(172,10,'Salta','A',1),
(173,10,'San Juan','J',1),
(174,10,'San Luis','D',1),
(175,10,'Santa Cruz','Z',1),
(176,10,'Santa Fe','S',1),
(177,10,'Santiago del Estero','G',1),
(178,10,'Tierra del Fuego','V',1),
(179,10,'Tucuman','T',1),
(180,11,'Aragatsotn','AGT',1),
(181,11,'Ararat','ARR',1),
(182,11,'Armavir','ARM',1),
(183,11,'Geghark\'unik\'','GEG',1),
(184,11,'Kotayk\'','KOT',1),
(185,11,'Lorri','LOR',1),
(186,11,'Shirak','SHI',1),
(187,11,'Syunik\'','SYU',1),
(188,11,'Tavush','TAV',1),
(189,11,'Vayots\' Dzor','VAY',1),
(190,11,'Yerevan','YER',1),
(191,13,'Australian Capital Territory','ACT',1),
(192,13,'New South Wales','NSW',1),
(193,13,'Northern Territory','NT',1),
(194,13,'Queensland','QLD',1),
(195,13,'South Australia','SA',1),
(196,13,'Tasmania','TAS',1),
(197,13,'Victoria','VIC',1),
(198,13,'Western Australia','WA',1),
(199,14,'Burgenland','1',1),
(200,14,'Kärnten','2',1),
(201,14,'Niederösterreich','3',1),
(202,14,'Oberösterreich','4',1),
(203,14,'Salzburg','5',1),
(204,14,'Steiermark','6',1),
(205,14,'Tirol','7',1),
(206,14,'Vorarlberg','8',1),
(207,14,'Wien','9',1),
(208,15,'Ali Bayramli','AB',1),
(209,15,'Abseron','ABS',1),
(210,15,'AgcabAdi','AGC',1),
(211,15,'Agdam','AGM',1),
(212,15,'Agdas','AGS',1),
(213,15,'Agstafa','AGA',1),
(214,15,'Agsu','AGU',1),
(215,15,'Astara','AST',1),
(216,15,'Baki','BA',1),
(217,15,'BabAk','BAB',1),
(218,15,'BalakAn','BAL',1),
(219,15,'BArdA','BAR',1),
(220,15,'Beylaqan','BEY',1),
(221,15,'Bilasuvar','BIL',1),
(222,15,'Cabrayil','CAB',1),
(223,15,'Calilabab','CAL',1),
(224,15,'Culfa','CUL',1),
(225,15,'Daskasan','DAS',1),
(226,15,'Davaci','DAV',1),
(227,15,'Fuzuli','FUZ',1),
(228,15,'Ganca','GA',1),
(229,15,'Gadabay','GAD',1),
(230,15,'Goranboy','GOR',1),
(231,15,'Goycay','GOY',1),
(232,15,'Haciqabul','HAC',1),
(233,15,'Imisli','IMI',1),
(234,15,'Ismayilli','ISM',1),
(235,15,'Kalbacar','KAL',1),
(236,15,'Kurdamir','KUR',1),
(237,15,'Lankaran','LA',1),
(238,15,'Lacin','LAC',1),
(239,15,'Lankaran','LAN',1),
(240,15,'Lerik','LER',1),
(241,15,'Masalli','MAS',1),
(242,15,'Mingacevir','MI',1),
(243,15,'Naftalan','NA',1),
(244,15,'Neftcala','NEF',1),
(245,15,'Oguz','OGU',1),
(246,15,'Ordubad','ORD',1),
(247,15,'Qabala','QAB',1),
(248,15,'Qax','QAX',1),
(249,15,'Qazax','QAZ',1),
(250,15,'Qobustan','QOB',1),
(251,15,'Quba','QBA',1),
(252,15,'Qubadli','QBI',1),
(253,15,'Qusar','QUS',1),
(254,15,'Saki','SA',1),
(255,15,'Saatli','SAT',1),
(256,15,'Sabirabad','SAB',1),
(257,15,'Sadarak','SAD',1),
(258,15,'Sahbuz','SAH',1),
(259,15,'Saki','SAK',1),
(260,15,'Salyan','SAL',1),
(261,15,'Sumqayit','SM',1),
(262,15,'Samaxi','SMI',1),
(263,15,'Samkir','SKR',1),
(264,15,'Samux','SMX',1),
(265,15,'Sarur','SAR',1),
(266,15,'Siyazan','SIY',1),
(267,15,'Susa','SS',1),
(268,15,'Susa','SUS',1),
(269,15,'Tartar','TAR',1),
(270,15,'Tovuz','TOV',1),
(271,15,'Ucar','UCA',1),
(272,15,'Xankandi','XA',1),
(273,15,'Xacmaz','XAC',1),
(274,15,'Xanlar','XAN',1),
(275,15,'Xizi','XIZ',1),
(276,15,'Xocali','XCI',1),
(277,15,'Xocavand','XVD',1),
(278,15,'Yardimli','YAR',1),
(279,15,'Yevlax','YEV',1),
(280,15,'Zangilan','ZAN',1),
(281,15,'Zaqatala','ZAQ',1),
(282,15,'Zardab','ZAR',1),
(283,15,'Naxcivan','NX',1),
(284,16,'Acklins','ACK',1),
(285,16,'Berry Islands','BER',1),
(286,16,'Bimini','BIM',1),
(287,16,'Black Point','BLK',1),
(288,16,'Cat Island','CAT',1),
(289,16,'Central Abaco','CAB',1),
(290,16,'Central Andros','CAN',1),
(291,16,'Central Eleuthera','CEL',1),
(292,16,'City of Freeport','FRE',1),
(293,16,'Crooked Island','CRO',1),
(294,16,'East Grand Bahama','EGB',1),
(295,16,'Exuma','EXU',1),
(296,16,'Grand Cay','GRD',1),
(297,16,'Harbour Island','HAR',1),
(298,16,'Hope Town','HOP',1),
(299,16,'Inagua','INA',1),
(300,16,'Long Island','LNG',1),
(301,16,'Mangrove Cay','MAN',1),
(302,16,'Mayaguana','MAY',1),
(303,16,'Moore\'s Island','MOO',1),
(304,16,'North Abaco','NAB',1),
(305,16,'North Andros','NAN',1),
(306,16,'North Eleuthera','NEL',1),
(307,16,'Ragged Island','RAG',1),
(308,16,'Rum Cay','RUM',1),
(309,16,'San Salvador','SAL',1),
(310,16,'South Abaco','SAB',1),
(311,16,'South Andros','SAN',1),
(312,16,'South Eleuthera','SEL',1),
(313,16,'Spanish Wells','SWE',1),
(314,16,'West Grand Bahama','WGB',1),
(315,17,'Capital','CAP',1),
(316,17,'Central','CEN',1),
(317,17,'Muharraq','MUH',1),
(318,17,'Northern','NOR',1),
(319,17,'Southern','SOU',1),
(320,18,'Barisal','BAR',1),
(321,18,'Chittagong','CHI',1),
(322,18,'Dhaka','DHA',1),
(323,18,'Khulna','KHU',1),
(324,18,'Rajshahi','RAJ',1),
(325,18,'Sylhet','SYL',1),
(326,19,'Christ Church','CC',1),
(327,19,'Saint Andrew','AND',1),
(328,19,'Saint George','GEO',1),
(329,19,'Saint James','JAM',1),
(330,19,'Saint John','JOH',1),
(331,19,'Saint Joseph','JOS',1),
(332,19,'Saint Lucy','LUC',1),
(333,19,'Saint Michael','MIC',1),
(334,19,'Saint Peter','PET',1),
(335,19,'Saint Philip','PHI',1),
(336,19,'Saint Thomas','THO',1),
(337,20,'Brestskaya (Brest)','BR',1),
(338,20,'Homyel\'skaya (Homyel\')','HO',1),
(339,20,'Horad Minsk','HM',1),
(340,20,'Hrodzyenskaya (Hrodna)','HR',1),
(341,20,'Mahilyowskaya (Mahilyow)','MA',1),
(342,20,'Minskaya','MI',1),
(343,20,'Vitsyebskaya (Vitsyebsk)','VI',1),
(344,21,'Antwerpen','VAN',1),
(345,21,'Brabant Wallon','WBR',1),
(346,21,'Hainaut','WHT',1),
(347,21,'Liège','WLG',1),
(348,21,'Limburg','VLI',1),
(349,21,'Luxembourg','WLX',1),
(350,21,'Namur','WNA',1),
(351,21,'Oost-Vlaanderen','VOV',1),
(352,21,'Vlaams Brabant','VBR',1),
(353,21,'West-Vlaanderen','VWV',1),
(354,22,'Belize','BZ',1),
(355,22,'Cayo','CY',1),
(356,22,'Corozal','CR',1),
(357,22,'Orange Walk','OW',1),
(358,22,'Stann Creek','SC',1),
(359,22,'Toledo','TO',1),
(360,23,'Alibori','AL',1),
(361,23,'Atakora','AK',1),
(362,23,'Atlantique','AQ',1),
(363,23,'Borgou','BO',1),
(364,23,'Collines','CO',1),
(365,23,'Donga','DO',1),
(366,23,'Kouffo','KO',1),
(367,23,'Littoral','LI',1),
(368,23,'Mono','MO',1),
(369,23,'Oueme','OU',1),
(370,23,'Plateau','PL',1),
(371,23,'Zou','ZO',1),
(372,24,'Devonshire','DS',1),
(373,24,'Hamilton City','HC',1),
(374,24,'Hamilton','HA',1),
(375,24,'Paget','PG',1),
(376,24,'Pembroke','PB',1),
(377,24,'Saint George City','GC',1),
(378,24,'Saint George\'s','SG',1),
(379,24,'Sandys','SA',1),
(380,24,'Smith\'s','SM',1),
(381,24,'Southampton','SH',1),
(382,24,'Warwick','WA',1),
(383,25,'Bumthang','BUM',1),
(384,25,'Chukha','CHU',1),
(385,25,'Dagana','DAG',1),
(386,25,'Gasa','GAS',1),
(387,25,'Haa','HAA',1),
(388,25,'Lhuntse','LHU',1),
(389,25,'Mongar','MON',1),
(390,25,'Paro','PAR',1),
(391,25,'Pemagatshel','PEM',1),
(392,25,'Punakha','PUN',1),
(393,25,'Samdrup Jongkhar','SJO',1),
(394,25,'Samtse','SAT',1),
(395,25,'Sarpang','SAR',1),
(396,25,'Thimphu','THI',1),
(397,25,'Trashigang','TRG',1),
(398,25,'Trashiyangste','TRY',1),
(399,25,'Trongsa','TRO',1),
(400,25,'Tsirang','TSI',1),
(401,25,'Wangdue Phodrang','WPH',1),
(402,25,'Zhemgang','ZHE',1),
(403,26,'Beni','BEN',1),
(404,26,'Chuquisaca','CHU',1),
(405,26,'Cochabamba','COC',1),
(406,26,'La Paz','LPZ',1),
(407,26,'Oruro','ORU',1),
(408,26,'Pando','PAN',1),
(409,26,'Potosi','POT',1),
(410,26,'Santa Cruz','SCZ',1),
(411,26,'Tarija','TAR',1),
(412,27,'Brcko district','BRO',1),
(413,27,'Unsko-Sanski Kanton','FUS',1),
(414,27,'Posavski Kanton','FPO',1),
(415,27,'Tuzlanski Kanton','FTU',1),
(416,27,'Zenicko-Dobojski Kanton','FZE',1),
(417,27,'Bosanskopodrinjski Kanton','FBP',1),
(418,27,'Srednjebosanski Kanton','FSB',1),
(419,27,'Hercegovacko-neretvanski Kanton','FHN',1),
(420,27,'Zapadnohercegovacka Zupanija','FZH',1),
(421,27,'Kanton Sarajevo','FSA',1),
(422,27,'Zapadnobosanska','FZA',1),
(423,27,'Banja Luka','SBL',1),
(424,27,'Doboj','SDO',1),
(425,27,'Bijeljina','SBI',1),
(426,27,'Vlasenica','SVL',1),
(427,27,'Sarajevo-Romanija or Sokolac','SSR',1),
(428,27,'Foca','SFO',1),
(429,27,'Trebinje','STR',1),
(430,28,'Central','CE',1),
(431,28,'Ghanzi','GH',1),
(432,28,'Kgalagadi','KD',1),
(433,28,'Kgatleng','KT',1),
(434,28,'Kweneng','KW',1),
(435,28,'Ngamiland','NG',1),
(436,28,'North East','NE',1),
(437,28,'North West','NW',1),
(438,28,'South East','SE',1),
(439,28,'Southern','SO',1),
(440,30,'Acre','AC',1),
(441,30,'Alagoas','AL',1),
(442,30,'Amapá','AP',1),
(443,30,'Amazonas','AM',1),
(444,30,'Bahia','BA',1),
(445,30,'Ceará','CE',1),
(446,30,'Distrito Federal','DF',1),
(447,30,'Espírito Santo','ES',1),
(448,30,'Goiás','GO',1),
(449,30,'Maranhão','MA',1),
(450,30,'Mato Grosso','MT',1),
(451,30,'Mato Grosso do Sul','MS',1),
(452,30,'Minas Gerais','MG',1),
(453,30,'Pará','PA',1),
(454,30,'Paraíba','PB',1),
(455,30,'Paraná','PR',1),
(456,30,'Pernambuco','PE',1),
(457,30,'Piauí','PI',1),
(458,30,'Rio de Janeiro','RJ',1),
(459,30,'Rio Grande do Norte','RN',1),
(460,30,'Rio Grande do Sul','RS',1),
(461,30,'Rondônia','RO',1),
(462,30,'Roraima','RR',1),
(463,30,'Santa Catarina','SC',1),
(464,30,'São Paulo','SP',1),
(465,30,'Sergipe','SE',1),
(466,30,'Tocantins','TO',1),
(467,31,'Peros Banhos','PB',1),
(468,31,'Salomon Islands','SI',1),
(469,31,'Nelsons Island','NI',1),
(470,31,'Three Brothers','TB',1),
(471,31,'Eagle Islands','EA',1),
(472,31,'Danger Island','DI',1),
(473,31,'Egmont Islands','EG',1),
(474,31,'Diego Garcia','DG',1),
(475,32,'Belait','BEL',1),
(476,32,'Brunei and Muara','BRM',1),
(477,32,'Temburong','TEM',1),
(478,32,'Tutong','TUT',1),
(479,33,'Blagoevgrad','',1),
(480,33,'Burgas','',1),
(481,33,'Dobrich','',1),
(482,33,'Gabrovo','',1),
(483,33,'Haskovo','',1),
(484,33,'Kardjali','',1),
(485,33,'Kyustendil','',1),
(486,33,'Lovech','',1),
(487,33,'Montana','',1),
(488,33,'Pazardjik','',1),
(489,33,'Pernik','',1),
(490,33,'Pleven','',1),
(491,33,'Plovdiv','',1),
(492,33,'Razgrad','',1),
(493,33,'Shumen','',1),
(494,33,'Silistra','',1),
(495,33,'Sliven','',1),
(496,33,'Smolyan','',1),
(497,33,'Sofia','',1),
(498,33,'Sofia - town','',1),
(499,33,'Stara Zagora','',1),
(500,33,'Targovishte','',1),
(501,33,'Varna','',1),
(502,33,'Veliko Tarnovo','',1),
(503,33,'Vidin','',1),
(504,33,'Vratza','',1),
(505,33,'Yambol','',1),
(506,34,'Bale','BAL',1),
(507,34,'Bam','BAM',1),
(508,34,'Banwa','BAN',1),
(509,34,'Bazega','BAZ',1),
(510,34,'Bougouriba','BOR',1),
(511,34,'Boulgou','BLG',1),
(512,34,'Boulkiemde','BOK',1),
(513,34,'Comoe','COM',1),
(514,34,'Ganzourgou','GAN',1),
(515,34,'Gnagna','GNA',1),
(516,34,'Gourma','GOU',1),
(517,34,'Houet','HOU',1),
(518,34,'Ioba','IOA',1),
(519,34,'Kadiogo','KAD',1),
(520,34,'Kenedougou','KEN',1),
(521,34,'Komondjari','KOD',1),
(522,34,'Kompienga','KOP',1),
(523,34,'Kossi','KOS',1),
(524,34,'Koulpelogo','KOL',1),
(525,34,'Kouritenga','KOT',1),
(526,34,'Kourweogo','KOW',1),
(527,34,'Leraba','LER',1),
(528,34,'Loroum','LOR',1),
(529,34,'Mouhoun','MOU',1),
(530,34,'Nahouri','NAH',1),
(531,34,'Namentenga','NAM',1),
(532,34,'Nayala','NAY',1),
(533,34,'Noumbiel','NOU',1),
(534,34,'Oubritenga','OUB',1),
(535,34,'Oudalan','OUD',1),
(536,34,'Passore','PAS',1),
(537,34,'Poni','PON',1),
(538,34,'Sanguie','SAG',1),
(539,34,'Sanmatenga','SAM',1),
(540,34,'Seno','SEN',1),
(541,34,'Sissili','SIS',1),
(542,34,'Soum','SOM',1),
(543,34,'Sourou','SOR',1),
(544,34,'Tapoa','TAP',1),
(545,34,'Tuy','TUY',1),
(546,34,'Yagha','YAG',1),
(547,34,'Yatenga','YAT',1),
(548,34,'Ziro','ZIR',1),
(549,34,'Zondoma','ZOD',1),
(550,34,'Zoundweogo','ZOW',1),
(551,35,'Bubanza','BB',1),
(552,35,'Bujumbura','BJ',1),
(553,35,'Bururi','BR',1),
(554,35,'Cankuzo','CA',1),
(555,35,'Cibitoke','CI',1),
(556,35,'Gitega','GI',1),
(557,35,'Karuzi','KR',1),
(558,35,'Kayanza','KY',1),
(559,35,'Kirundo','KI',1),
(560,35,'Makamba','MA',1),
(561,35,'Muramvya','MU',1),
(562,35,'Muyinga','MY',1),
(563,35,'Mwaro','MW',1),
(564,35,'Ngozi','NG',1),
(565,35,'Rutana','RT',1),
(566,35,'Ruyigi','RY',1),
(567,36,'Phnom Penh','PP',1),
(568,36,'Preah Seihanu (Kompong Som or Sihanoukville)','PS',1),
(569,36,'Pailin','PA',1),
(570,36,'Keb','KB',1),
(571,36,'Banteay Meanchey','BM',1),
(572,36,'Battambang','BA',1),
(573,36,'Kampong Cham','KM',1),
(574,36,'Kampong Chhnang','KN',1),
(575,36,'Kampong Speu','KU',1),
(576,36,'Kampong Som','KO',1),
(577,36,'Kampong Thom','KT',1),
(578,36,'Kampot','KP',1),
(579,36,'Kandal','KL',1),
(580,36,'Kaoh Kong','KK',1),
(581,36,'Kratie','KR',1),
(582,36,'Mondul Kiri','MK',1),
(583,36,'Oddar Meancheay','OM',1),
(584,36,'Pursat','PU',1),
(585,36,'Preah Vihear','PR',1),
(586,36,'Prey Veng','PG',1),
(587,36,'Ratanak Kiri','RK',1),
(588,36,'Siemreap','SI',1),
(589,36,'Stung Treng','ST',1),
(590,36,'Svay Rieng','SR',1),
(591,36,'Takeo','TK',1),
(592,37,'Adamawa (Adamaoua)','ADA',1),
(593,37,'Centre','CEN',1),
(594,37,'East (Est)','EST',1),
(595,37,'Extreme North (Extreme-Nord)','EXN',1),
(596,37,'Littoral','LIT',1),
(597,37,'North (Nord)','NOR',1),
(598,37,'Northwest (Nord-Ouest)','NOT',1),
(599,37,'West (Ouest)','OUE',1),
(600,37,'South (Sud)','SUD',1),
(601,37,'Southwest (Sud-Ouest).','SOU',1),
(602,38,'Alberta','AB',1),
(603,38,'British Columbia','BC',1),
(604,38,'Manitoba','MB',1),
(605,38,'New Brunswick','NB',1),
(606,38,'Newfoundland and Labrador','NL',1),
(607,38,'Northwest Territories','NT',1),
(608,38,'Nova Scotia','NS',1),
(609,38,'Nunavut','NU',1),
(610,38,'Ontario','ON',1),
(611,38,'Prince Edward Island','PE',1),
(612,38,'Qu&eacute;bec','QC',1),
(613,38,'Saskatchewan','SK',1),
(614,38,'Yukon Territory','YT',1),
(615,39,'Boa Vista','BV',1),
(616,39,'Brava','BR',1),
(617,39,'Calheta de Sao Miguel','CS',1),
(618,39,'Maio','MA',1),
(619,39,'Mosteiros','MO',1),
(620,39,'Paul','PA',1),
(621,39,'Porto Novo','PN',1),
(622,39,'Praia','PR',1),
(623,39,'Ribeira Grande','RG',1),
(624,39,'Sal','SL',1),
(625,39,'Santa Catarina','CA',1),
(626,39,'Santa Cruz','CR',1),
(627,39,'Sao Domingos','SD',1),
(628,39,'Sao Filipe','SF',1),
(629,39,'Sao Nicolau','SN',1),
(630,39,'Sao Vicente','SV',1),
(631,39,'Tarrafal','TA',1),
(632,40,'Creek','CR',1),
(633,40,'Eastern','EA',1),
(634,40,'Midland','ML',1),
(635,40,'South Town','ST',1),
(636,40,'Spot Bay','SP',1),
(637,40,'Stake Bay','SK',1),
(638,40,'West End','WD',1),
(639,40,'Western','WN',1),
(640,41,'Bamingui-Bangoran','BBA',1),
(641,41,'Basse-Kotto','BKO',1),
(642,41,'Haute-Kotto','HKO',1),
(643,41,'Haut-Mbomou','HMB',1),
(644,41,'Kemo','KEM',1),
(645,41,'Lobaye','LOB',1),
(646,41,'Mambere-KadeÔ','MKD',1),
(647,41,'Mbomou','MBO',1),
(648,41,'Nana-Mambere','NMM',1),
(649,41,'Ombella-M\'Poko','OMP',1),
(650,41,'Ouaka','OUK',1),
(651,41,'Ouham','OUH',1),
(652,41,'Ouham-Pende','OPE',1),
(653,41,'Vakaga','VAK',1),
(654,41,'Nana-Grebizi','NGR',1),
(655,41,'Sangha-Mbaere','SMB',1),
(656,41,'Bangui','BAN',1),
(657,42,'Batha','BA',1),
(658,42,'Biltine','BI',1),
(659,42,'Borkou-Ennedi-Tibesti','BE',1),
(660,42,'Chari-Baguirmi','CB',1),
(661,42,'Guera','GU',1),
(662,42,'Kanem','KA',1),
(663,42,'Lac','LA',1),
(664,42,'Logone Occidental','LC',1),
(665,42,'Logone Oriental','LR',1),
(666,42,'Mayo-Kebbi','MK',1),
(667,42,'Moyen-Chari','MC',1),
(668,42,'Ouaddai','OU',1),
(669,42,'Salamat','SA',1),
(670,42,'Tandjile','TA',1),
(671,43,'Aisen del General Carlos Ibanez','AI',1),
(672,43,'Antofagasta','AN',1),
(673,43,'Araucania','AR',1),
(674,43,'Atacama','AT',1),
(675,43,'Bio-Bio','BI',1),
(676,43,'Coquimbo','CO',1),
(677,43,'Libertador General Bernardo O\'Higgins','LI',1),
(678,43,'Los Lagos','LL',1),
(679,43,'Magallanes y de la Antartica Chilena','MA',1),
(680,43,'Maule','ML',1),
(681,43,'Region Metropolitana','RM',1),
(682,43,'Tarapaca','TA',1),
(683,43,'Valparaiso','VS',1),
(684,44,'Anhui','AN',1),
(685,44,'Beijing','BE',1),
(686,44,'Chongqing','CH',1),
(687,44,'Fujian','FU',1),
(688,44,'Gansu','GA',1),
(689,44,'Guangdong','GU',1),
(690,44,'Guangxi','GX',1),
(691,44,'Guizhou','GZ',1),
(692,44,'Hainan','HA',1),
(693,44,'Hebei','HB',1),
(694,44,'Heilongjiang','HL',1),
(695,44,'Henan','HE',1),
(696,44,'Hong Kong','HK',1),
(697,44,'Hubei','HU',1),
(698,44,'Hunan','HN',1),
(699,44,'Inner Mongolia','IM',1),
(700,44,'Jiangsu','JI',1),
(701,44,'Jiangxi','JX',1),
(702,44,'Jilin','JL',1),
(703,44,'Liaoning','LI',1),
(704,44,'Macau','MA',1),
(705,44,'Ningxia','NI',1),
(706,44,'Shaanxi','SH',1),
(707,44,'Shandong','SA',1),
(708,44,'Shanghai','SG',1),
(709,44,'Shanxi','SX',1),
(710,44,'Sichuan','SI',1),
(711,44,'Tianjin','TI',1),
(712,44,'Xinjiang','XI',1),
(713,44,'Yunnan','YU',1),
(714,44,'Zhejiang','ZH',1),
(715,46,'Direction Island','D',1),
(716,46,'Home Island','H',1),
(717,46,'Horsburgh Island','O',1),
(718,46,'South Island','S',1),
(719,46,'West Island','W',1),
(720,47,'Amazonas','AMA',1),
(721,47,'Antioquia','ANT',1),
(722,47,'Arauca','ARA',1),
(723,47,'Atlantico','ATL',1),
(724,47,'Bogota D.C.','DC',1),
(725,47,'Bolivar','BOL',1),
(726,47,'Boyaca','BOY',1),
(727,47,'Caldas','CAL',1),
(728,47,'Caqueta','CAQ',1),
(729,47,'Casanare','CAS',1),
(730,47,'Cauca','CAU',1),
(731,47,'Cesar','CES',1),
(732,47,'Choco','CHO',1),
(733,47,'Cordoba','COR',1),
(734,47,'Cundinamarca','CUN',1),
(735,47,'Guainia','GNA',1),
(736,47,'Guajira','GJR',1),
(737,47,'Guaviare','GUV',1),
(738,47,'Huila','HUI',1),
(739,47,'Magdalena','MAG',1),
(740,47,'Meta','MET',1),
(741,47,'Narino','NAR',1),
(742,47,'Norte de Santander','NSA',1),
(743,47,'Putumayo','PUT',1),
(744,47,'Quindio','QUI',1),
(745,47,'Risaralda','RIS',1),
(746,47,'San Andres y Providencia','SAP',1),
(747,47,'Santander','SAN',1),
(748,47,'Sucre','SUC',1),
(749,47,'Tolima','TOL',1),
(750,47,'Valle del Cauca','VAC',1),
(751,47,'Vaupes','VAU',1),
(752,47,'Vichada','VID',1),
(753,48,'Grande Comore','G',1),
(754,48,'Anjouan','A',1),
(755,48,'Moheli','M',1),
(756,49,'Bouenza','BO',1),
(757,49,'Brazzaville','BR',1),
(758,49,'Cuvette','CU',1),
(759,49,'Cuvette-Ouest','CO',1),
(760,49,'Kouilou','KO',1),
(761,49,'Lekoumou','LE',1),
(762,49,'Likouala','LI',1),
(763,49,'Niari','NI',1),
(764,49,'Plateaux','PL',1),
(765,49,'Pool','PO',1),
(766,49,'Sangha','SA',1),
(767,50,'Pukapuka','PU',1),
(768,50,'Rakahanga','RK',1),
(769,50,'Manihiki','MK',1),
(770,50,'Penrhyn','PE',1),
(771,50,'Nassau Island','NI',1),
(772,50,'Surwarrow','SU',1),
(773,50,'Palmerston','PA',1),
(774,50,'Aitutaki','AI',1),
(775,50,'Manuae','MA',1),
(776,50,'Takutea','TA',1),
(777,50,'Mitiaro','MT',1),
(778,50,'Atiu','AT',1),
(779,50,'Mauke','MU',1),
(780,50,'Rarotonga','RR',1),
(781,50,'Mangaia','MG',1),
(782,51,'Alajuela','AL',1),
(783,51,'Cartago','CA',1),
(784,51,'Guanacaste','GU',1),
(785,51,'Heredia','HE',1),
(786,51,'Limon','LI',1),
(787,51,'Puntarenas','PU',1),
(788,51,'San Jose','SJ',1),
(789,52,'Abengourou','ABE',1),
(790,52,'Abidjan','ABI',1),
(791,52,'Aboisso','ABO',1),
(792,52,'Adiake','ADI',1),
(793,52,'Adzope','ADZ',1),
(794,52,'Agboville','AGB',1),
(795,52,'Agnibilekrou','AGN',1),
(796,52,'Alepe','ALE',1),
(797,52,'Bocanda','BOC',1),
(798,52,'Bangolo','BAN',1),
(799,52,'Beoumi','BEO',1),
(800,52,'Biankouma','BIA',1),
(801,52,'Bondoukou','BDK',1),
(802,52,'Bongouanou','BGN',1),
(803,52,'Bouafle','BFL',1),
(804,52,'Bouake','BKE',1),
(805,52,'Bouna','BNA',1),
(806,52,'Boundiali','BDL',1),
(807,52,'Dabakala','DKL',1),
(808,52,'Dabou','DBU',1),
(809,52,'Daloa','DAL',1),
(810,52,'Danane','DAN',1),
(811,52,'Daoukro','DAO',1),
(812,52,'Dimbokro','DIM',1),
(813,52,'Divo','DIV',1),
(814,52,'Duekoue','DUE',1),
(815,52,'Ferkessedougou','FER',1),
(816,52,'Gagnoa','GAG',1),
(817,52,'Grand-Bassam','GBA',1),
(818,52,'Grand-Lahou','GLA',1),
(819,52,'Guiglo','GUI',1),
(820,52,'Issia','ISS',1),
(821,52,'Jacqueville','JAC',1),
(822,52,'Katiola','KAT',1),
(823,52,'Korhogo','KOR',1),
(824,52,'Lakota','LAK',1),
(825,52,'Man','MAN',1),
(826,52,'Mankono','MKN',1),
(827,52,'Mbahiakro','MBA',1),
(828,52,'Odienne','ODI',1),
(829,52,'Oume','OUM',1),
(830,52,'Sakassou','SAK',1),
(831,52,'San-Pedro','SPE',1),
(832,52,'Sassandra','SAS',1),
(833,52,'Seguela','SEG',1),
(834,52,'Sinfra','SIN',1),
(835,52,'Soubre','SOU',1),
(836,52,'Tabou','TAB',1),
(837,52,'Tanda','TAN',1),
(838,52,'Tiebissou','TIE',1),
(839,52,'Tingrela','TIN',1),
(840,52,'Tiassale','TIA',1),
(841,52,'Touba','TBA',1),
(842,52,'Toulepleu','TLP',1),
(843,52,'Toumodi','TMD',1),
(844,52,'Vavoua','VAV',1),
(845,52,'Yamoussoukro','YAM',1),
(846,52,'Zuenoula','ZUE',1),
(847,53,'Bjelovarsko-bilogorska','BB',1),
(848,53,'Grad Zagreb','GZ',1),
(849,53,'Dubrovačko-neretvanska','DN',1),
(850,53,'Istarska','IS',1),
(851,53,'Karlovačka','KA',1),
(852,53,'Koprivničko-križevačka','KK',1),
(853,53,'Krapinsko-zagorska','KZ',1),
(854,53,'Ličko-senjska','LS',1),
(855,53,'Međimurska','ME',1),
(856,53,'Osječko-baranjska','OB',1),
(857,53,'Požeško-slavonska','PS',1),
(858,53,'Primorsko-goranska','PG',1),
(859,53,'Šibensko-kninska','SK',1),
(860,53,'Sisačko-moslavačka','SM',1),
(861,53,'Brodsko-posavska','BP',1),
(862,53,'Splitsko-dalmatinska','SD',1),
(863,53,'Varaždinska','VA',1),
(864,53,'Virovitičko-podravska','VP',1),
(865,53,'Vukovarsko-srijemska','VS',1),
(866,53,'Zadarska','ZA',1),
(867,53,'Zagrebačka','ZG',1),
(868,54,'Camaguey','CA',1),
(869,54,'Ciego de Avila','CD',1),
(870,54,'Cienfuegos','CI',1),
(871,54,'Ciudad de La Habana','CH',1),
(872,54,'Granma','GR',1),
(873,54,'Guantanamo','GU',1),
(874,54,'Holguin','HO',1),
(875,54,'Isla de la Juventud','IJ',1),
(876,54,'La Habana','LH',1),
(877,54,'Las Tunas','LT',1),
(878,54,'Matanzas','MA',1),
(879,54,'Pinar del Rio','PR',1),
(880,54,'Sancti Spiritus','SS',1),
(881,54,'Santiago de Cuba','SC',1),
(882,54,'Villa Clara','VC',1),
(883,55,'Famagusta','F',1),
(884,55,'Kyrenia','K',1),
(885,55,'Larnaca','A',1),
(886,55,'Limassol','I',1),
(887,55,'Nicosia','N',1),
(888,55,'Paphos','P',1),
(889,56,'Ústecký','U',1),
(890,56,'Jihočeský','C',1),
(891,56,'Jihomoravský','B',1),
(892,56,'Karlovarský','K',1),
(893,56,'Královehradecký','H',1),
(894,56,'Liberecký','L',1),
(895,56,'Moravskoslezský','T',1),
(896,56,'Olomoucký','M',1),
(897,56,'Pardubický','E',1),
(898,56,'Plzeňský','P',1),
(899,56,'Praha','A',1),
(900,56,'Středočeský','S',1),
(901,56,'Vysočina','J',1),
(902,56,'Zlínský','Z',1),
(903,57,'Nordjyland','81',1),
(904,57,'Midtjylland','82',1),
(905,57,'Syddanmark','83',1),
(906,57,'Faroe Islands','FO',1),
(907,57,'Hovedstaden','84',1),
(908,57,'Sjælland','85',1),
(919,58,'\'Ali Sabih','S',1),
(920,58,'Dikhil','K',1),
(921,58,'Djibouti','J',1),
(922,58,'Obock','O',1),
(923,58,'Tadjoura','T',1),
(924,59,'Saint Andrew Parish','AND',1),
(925,59,'Saint David Parish','DAV',1),
(926,59,'Saint George Parish','GEO',1),
(927,59,'Saint John Parish','JOH',1),
(928,59,'Saint Joseph Parish','JOS',1),
(929,59,'Saint Luke Parish','LUK',1),
(930,59,'Saint Mark Parish','MAR',1),
(931,59,'Saint Patrick Parish','PAT',1),
(932,59,'Saint Paul Parish','PAU',1),
(933,59,'Saint Peter Parish','PET',1),
(934,60,'Distrito Nacional','DN',1),
(935,60,'Azua','AZ',1),
(936,60,'Baoruco','BC',1),
(937,60,'Barahona','BH',1),
(938,60,'Dajabon','DJ',1),
(939,60,'Duarte','DU',1),
(940,60,'Elias Pina','EL',1),
(941,60,'El Seybo','SY',1),
(942,60,'Espaillat','ET',1),
(943,60,'Hato Mayor','HM',1),
(944,60,'Independencia','IN',1),
(945,60,'La Altagracia','AL',1),
(946,60,'La Romana','RO',1),
(947,60,'La Vega','VE',1),
(948,60,'Maria Trinidad Sanchez','MT',1),
(949,60,'Monsenor Nouel','MN',1),
(950,60,'Monte Cristi','MC',1),
(951,60,'Monte Plata','MP',1),
(952,60,'Pedernales','PD',1),
(953,60,'Peravia (Bani)','PR',1),
(954,60,'Puerto Plata','PP',1),
(955,60,'Salcedo','SL',1),
(956,60,'Samana','SM',1),
(957,60,'Sanchez Ramirez','SH',1),
(958,60,'San Cristobal','SC',1),
(959,60,'San Jose de Ocoa','JO',1),
(960,60,'San Juan','SJ',1),
(961,60,'San Pedro de Macoris','PM',1),
(962,60,'Santiago','SA',1),
(963,60,'Santiago Rodriguez','ST',1),
(964,60,'Santo Domingo','SD',1),
(965,60,'Valverde','VA',1),
(966,61,'Aileu','AL',1),
(967,61,'Ainaro','AN',1),
(968,61,'Baucau','BA',1),
(969,61,'Bobonaro','BO',1),
(970,61,'Cova Lima','CO',1),
(971,61,'Dili','DI',1),
(972,61,'Ermera','ER',1),
(973,61,'Lautem','LA',1),
(974,61,'Liquica','LI',1),
(975,61,'Manatuto','MT',1),
(976,61,'Manufahi','MF',1),
(977,61,'Oecussi','OE',1),
(978,61,'Viqueque','VI',1),
(979,62,'Azuay','AZU',1),
(980,62,'Bolivar','BOL',1),
(981,62,'Ca&ntilde;ar','CAN',1),
(982,62,'Carchi','CAR',1),
(983,62,'Chimborazo','CHI',1),
(984,62,'Cotopaxi','COT',1),
(985,62,'El Oro','EOR',1),
(986,62,'Esmeraldas','ESM',1),
(987,62,'Gal&aacute;pagos','GPS',1),
(988,62,'Guayas','GUA',1),
(989,62,'Imbabura','IMB',1),
(990,62,'Loja','LOJ',1),
(991,62,'Los Rios','LRO',1),
(992,62,'Manab&iacute;','MAN',1),
(993,62,'Morona Santiago','MSA',1),
(994,62,'Napo','NAP',1),
(995,62,'Orellana','ORE',1),
(996,62,'Pastaza','PAS',1),
(997,62,'Pichincha','PIC',1),
(998,62,'Sucumb&iacute;os','SUC',1),
(999,62,'Tungurahua','TUN',1),
(1000,62,'Zamora Chinchipe','ZCH',1),
(1001,63,'Ad Daqahliyah','DHY',1),
(1002,63,'Al Bahr al Ahmar','BAM',1),
(1003,63,'Al Buhayrah','BHY',1),
(1004,63,'Al Fayyum','FYM',1),
(1005,63,'Al Gharbiyah','GBY',1),
(1006,63,'Al Iskandariyah','IDR',1),
(1007,63,'Al Isma\'iliyah','IML',1),
(1008,63,'Al Jizah','JZH',1),
(1009,63,'Al Minufiyah','MFY',1),
(1010,63,'Al Minya','MNY',1),
(1011,63,'Al Qahirah','QHR',1),
(1012,63,'Al Qalyubiyah','QLY',1),
(1013,63,'Al Wadi al Jadid','WJD',1),
(1014,63,'Ash Sharqiyah','SHQ',1),
(1015,63,'As Suways','SWY',1),
(1016,63,'Aswan','ASW',1),
(1017,63,'Asyut','ASY',1),
(1018,63,'Bani Suwayf','BSW',1),
(1019,63,'Bur Sa\'id','BSD',1),
(1020,63,'Dumyat','DMY',1),
(1021,63,'Janub Sina\'','JNS',1),
(1022,63,'Kafr ash Shaykh','KSH',1),
(1023,63,'Matruh','MAT',1),
(1024,63,'Qina','QIN',1),
(1025,63,'Shamal Sina\'','SHS',1),
(1026,63,'Suhaj','SUH',1),
(1027,64,'Ahuachapan','AH',1),
(1028,64,'Cabanas','CA',1),
(1029,64,'Chalatenango','CH',1),
(1030,64,'Cuscatlan','CU',1),
(1031,64,'La Libertad','LB',1),
(1032,64,'La Paz','PZ',1),
(1033,64,'La Union','UN',1),
(1034,64,'Morazan','MO',1),
(1035,64,'San Miguel','SM',1),
(1036,64,'San Salvador','SS',1),
(1037,64,'San Vicente','SV',1),
(1038,64,'Santa Ana','SA',1),
(1039,64,'Sonsonate','SO',1),
(1040,64,'Usulutan','US',1),
(1041,65,'Provincia Annobon','AN',1),
(1042,65,'Provincia Bioko Norte','BN',1),
(1043,65,'Provincia Bioko Sur','BS',1),
(1044,65,'Provincia Centro Sur','CS',1),
(1045,65,'Provincia Kie-Ntem','KN',1),
(1046,65,'Provincia Litoral','LI',1),
(1047,65,'Provincia Wele-Nzas','WN',1),
(1048,66,'Central (Maekel)','MA',1),
(1049,66,'Anseba (Keren)','KE',1),
(1050,66,'Southern Red Sea (Debub-Keih-Bahri)','DK',1),
(1051,66,'Northern Red Sea (Semien-Keih-Bahri)','SK',1),
(1052,66,'Southern (Debub)','DE',1),
(1053,66,'Gash-Barka (Barentu)','BR',1),
(1054,67,'Harjumaa (Tallinn)','HA',1),
(1055,67,'Hiiumaa (Kardla)','HI',1),
(1056,67,'Ida-Virumaa (Johvi)','IV',1),
(1057,67,'Jarvamaa (Paide)','JA',1),
(1058,67,'Jogevamaa (Jogeva)','JO',1),
(1059,67,'Laane-Virumaa (Rakvere)','LV',1),
(1060,67,'Laanemaa (Haapsalu)','LA',1),
(1061,67,'Parnumaa (Parnu)','PA',1),
(1062,67,'Polvamaa (Polva)','PO',1),
(1063,67,'Raplamaa (Rapla)','RA',1),
(1064,67,'Saaremaa (Kuessaare)','SA',1),
(1065,67,'Tartumaa (Tartu)','TA',1),
(1066,67,'Valgamaa (Valga)','VA',1),
(1067,67,'Viljandimaa (Viljandi)','VI',1),
(1068,67,'Vorumaa (Voru)','VO',1),
(1069,68,'Afar','AF',1),
(1070,68,'Amhara','AH',1),
(1071,68,'Benishangul-Gumaz','BG',1),
(1072,68,'Gambela','GB',1),
(1073,68,'Hariai','HR',1),
(1074,68,'Oromia','OR',1),
(1075,68,'Somali','SM',1),
(1076,68,'Southern Nations - Nationalities and Peoples Region','SN',1),
(1077,68,'Tigray','TG',1),
(1078,68,'Addis Ababa','AA',1),
(1079,68,'Dire Dawa','DD',1),
(1080,71,'Central Division','C',1),
(1081,71,'Northern Division','N',1),
(1082,71,'Eastern Division','E',1),
(1083,71,'Western Division','W',1),
(1084,71,'Rotuma','R',1),
(1085,72,'Ahvenanmaan lääni','AL',1),
(1086,72,'Etelä-Suomen lääni','ES',1),
(1087,72,'Itä-Suomen lääni','IS',1),
(1088,72,'Länsi-Suomen lääni','LS',1),
(1089,72,'Lapin lääni','LA',1),
(1090,72,'Oulun lääni','OU',1),
(1114,74,'Ain','01',1),
(1115,74,'Aisne','02',1),
(1116,74,'Allier','03',1),
(1117,74,'Alpes de Haute Provence','04',1),
(1118,74,'Hautes-Alpes','05',1),
(1119,74,'Alpes Maritimes','06',1),
(1120,74,'Ard&egrave;che','07',1),
(1121,74,'Ardennes','08',1),
(1122,74,'Ari&egrave;ge','09',1),
(1123,74,'Aube','10',1),
(1124,74,'Aude','11',1),
(1125,74,'Aveyron','12',1),
(1126,74,'Bouches du Rh&ocirc;ne','13',1),
(1127,74,'Calvados','14',1),
(1128,74,'Cantal','15',1),
(1129,74,'Charente','16',1),
(1130,74,'Charente Maritime','17',1),
(1131,74,'Cher','18',1),
(1132,74,'Corr&egrave;ze','19',1),
(1133,74,'Corse du Sud','2A',1),
(1134,74,'Haute Corse','2B',1),
(1135,74,'C&ocirc;te d&#039;or','21',1),
(1136,74,'C&ocirc;tes d&#039;Armor','22',1),
(1137,74,'Creuse','23',1),
(1138,74,'Dordogne','24',1),
(1139,74,'Doubs','25',1),
(1140,74,'Dr&ocirc;me','26',1),
(1141,74,'Eure','27',1),
(1142,74,'Eure et Loir','28',1),
(1143,74,'Finist&egrave;re','29',1),
(1144,74,'Gard','30',1),
(1145,74,'Haute Garonne','31',1),
(1146,74,'Gers','32',1),
(1147,74,'Gironde','33',1),
(1148,74,'H&eacute;rault','34',1),
(1149,74,'Ille et Vilaine','35',1),
(1150,74,'Indre','36',1),
(1151,74,'Indre et Loire','37',1),
(1152,74,'Is&eacute;re','38',1),
(1153,74,'Jura','39',1),
(1154,74,'Landes','40',1),
(1155,74,'Loir et Cher','41',1),
(1156,74,'Loire','42',1),
(1157,74,'Haute Loire','43',1),
(1158,74,'Loire Atlantique','44',1),
(1159,74,'Loiret','45',1),
(1160,74,'Lot','46',1),
(1161,74,'Lot et Garonne','47',1),
(1162,74,'Loz&egrave;re','48',1),
(1163,74,'Maine et Loire','49',1),
(1164,74,'Manche','50',1),
(1165,74,'Marne','51',1),
(1166,74,'Haute Marne','52',1),
(1167,74,'Mayenne','53',1),
(1168,74,'Meurthe et Moselle','54',1),
(1169,74,'Meuse','55',1),
(1170,74,'Morbihan','56',1),
(1171,74,'Moselle','57',1),
(1172,74,'Ni&egrave;vre','58',1),
(1173,74,'Nord','59',1),
(1174,74,'Oise','60',1),
(1175,74,'Orne','61',1),
(1176,74,'Pas de Calais','62',1),
(1177,74,'Puy de D&ocirc;me','63',1),
(1178,74,'Pyr&eacute;n&eacute;es Atlantiques','64',1),
(1179,74,'Hautes Pyr&eacute;n&eacute;es','65',1),
(1180,74,'Pyr&eacute;n&eacute;es Orientales','66',1),
(1181,74,'Bas Rhin','67',1),
(1182,74,'Haut Rhin','68',1),
(1183,74,'Rh&ocirc;ne','69',1),
(1184,74,'Haute Sa&ocirc;ne','70',1),
(1185,74,'Sa&ocirc;ne et Loire','71',1),
(1186,74,'Sarthe','72',1),
(1187,74,'Savoie','73',1),
(1188,74,'Haute Savoie','74',1),
(1189,74,'Paris','75',1),
(1190,74,'Seine Maritime','76',1),
(1191,74,'Seine et Marne','77',1),
(1192,74,'Yvelines','78',1),
(1193,74,'Deux S&egrave;vres','79',1),
(1194,74,'Somme','80',1),
(1195,74,'Tarn','81',1),
(1196,74,'Tarn et Garonne','82',1),
(1197,74,'Var','83',1),
(1198,74,'Vaucluse','84',1),
(1199,74,'Vend&eacute;e','85',1),
(1200,74,'Vienne','86',1),
(1201,74,'Haute Vienne','87',1),
(1202,74,'Vosges','88',1),
(1203,74,'Yonne','89',1),
(1204,74,'Territoire de Belfort','90',1),
(1205,74,'Essonne','91',1),
(1206,74,'Hauts de Seine','92',1),
(1207,74,'Seine St-Denis','93',1),
(1208,74,'Val de Marne','94',1),
(1209,74,'Val d\'Oise','95',1),
(1210,76,'Archipel des Marquises','M',1),
(1211,76,'Archipel des Tuamotu','T',1),
(1212,76,'Archipel des Tubuai','I',1),
(1213,76,'Iles du Vent','V',1),
(1214,76,'Iles Sous-le-Vent','S',1),
(1215,77,'Iles Crozet','C',1),
(1216,77,'Iles Kerguelen','K',1),
(1217,77,'Ile Amsterdam','A',1),
(1218,77,'Ile Saint-Paul','P',1),
(1219,77,'Adelie Land','D',1),
(1220,78,'Estuaire','ES',1),
(1221,78,'Haut-Ogooue','HO',1),
(1222,78,'Moyen-Ogooue','MO',1),
(1223,78,'Ngounie','NG',1),
(1224,78,'Nyanga','NY',1),
(1225,78,'Ogooue-Ivindo','OI',1),
(1226,78,'Ogooue-Lolo','OL',1),
(1227,78,'Ogooue-Maritime','OM',1),
(1228,78,'Woleu-Ntem','WN',1),
(1229,79,'Banjul','BJ',1),
(1230,79,'Basse','BS',1),
(1231,79,'Brikama','BR',1),
(1232,79,'Janjangbure','JA',1),
(1233,79,'Kanifeng','KA',1),
(1234,79,'Kerewan','KE',1),
(1235,79,'Kuntaur','KU',1),
(1236,79,'Mansakonko','MA',1),
(1237,79,'Lower River','LR',1),
(1238,79,'Central River','CR',1),
(1239,79,'North Bank','NB',1),
(1240,79,'Upper River','UR',1),
(1241,79,'Western','WE',1),
(1242,80,'Abkhazia','AB',1),
(1243,80,'Ajaria','AJ',1),
(1244,80,'Tbilisi','TB',1),
(1245,80,'Guria','GU',1),
(1246,80,'Imereti','IM',1),
(1247,80,'Kakheti','KA',1),
(1248,80,'Kvemo Kartli','KK',1),
(1249,80,'Mtskheta-Mtianeti','MM',1),
(1250,80,'Racha Lechkhumi and Kvemo Svanet','RL',1),
(1251,80,'Samegrelo-Zemo Svaneti','SZ',1),
(1252,80,'Samtskhe-Javakheti','SJ',1),
(1253,80,'Shida Kartli','SK',1),
(1254,81,'Baden-Württemberg','BW',1),
(1255,81,'Bayern','BY',1),
(1256,81,'Berlin','BE',1),
(1257,81,'Brandenburg','BB',1),
(1258,81,'Bremen','HB',1),
(1259,81,'Hamburg','HH',1),
(1260,81,'Hessen','HE',1),
(1261,81,'Mecklenburg-Vorpommern','MV',1),
(1262,81,'Niedersachsen','NI',1),
(1263,81,'Nordrhein-Westfalen','NW',1),
(1264,81,'Rheinland-Pfalz','RP',1),
(1265,81,'Saarland','SL',1),
(1266,81,'Sachsen','SN',1),
(1267,81,'Sachsen-Anhalt','ST',1),
(1268,81,'Schleswig-Holstein','SH',1),
(1269,81,'Thüringen','TH',1),
(1270,82,'Ashanti Region','AS',1),
(1271,82,'Brong-Ahafo Region','BA',1),
(1272,82,'Central Region','CE',1),
(1273,82,'Eastern Region','EA',1),
(1274,82,'Greater Accra Region','GA',1),
(1275,82,'Northern Region','NO',1),
(1276,82,'Upper East Region','UE',1),
(1277,82,'Upper West Region','UW',1),
(1278,82,'Volta Region','VO',1),
(1279,82,'Western Region','WE',1),
(1280,84,'Attica','AT',1),
(1281,84,'Central Greece','CN',1),
(1282,84,'Central Macedonia','CM',1),
(1283,84,'Crete','CR',1),
(1284,84,'East Macedonia and Thrace','EM',1),
(1285,84,'Epirus','EP',1),
(1286,84,'Ionian Islands','II',1),
(1287,84,'North Aegean','NA',1),
(1288,84,'Peloponnesos','PP',1),
(1289,84,'South Aegean','SA',1),
(1290,84,'Thessaly','TH',1),
(1291,84,'West Greece','WG',1),
(1292,84,'West Macedonia','WM',1),
(1293,85,'Avannaa','A',1),
(1294,85,'Tunu','T',1),
(1295,85,'Kitaa','K',1),
(1296,86,'Saint Andrew','A',1),
(1297,86,'Saint David','D',1),
(1298,86,'Saint George','G',1),
(1299,86,'Saint John','J',1),
(1300,86,'Saint Mark','M',1),
(1301,86,'Saint Patrick','P',1),
(1302,86,'Carriacou','C',1),
(1303,86,'Petit Martinique','Q',1),
(1304,89,'Alta Verapaz','AV',1),
(1305,89,'Baja Verapaz','BV',1),
(1306,89,'Chimaltenango','CM',1),
(1307,89,'Chiquimula','CQ',1),
(1308,89,'El Peten','PE',1),
(1309,89,'El Progreso','PR',1),
(1310,89,'El Quiche','QC',1),
(1311,89,'Escuintla','ES',1),
(1312,89,'Guatemala','GU',1),
(1313,89,'Huehuetenango','HU',1),
(1314,89,'Izabal','IZ',1),
(1315,89,'Jalapa','JA',1),
(1316,89,'Jutiapa','JU',1),
(1317,89,'Quetzaltenango','QZ',1),
(1318,89,'Retalhuleu','RE',1),
(1319,89,'Sacatepequez','ST',1),
(1320,89,'San Marcos','SM',1),
(1321,89,'Santa Rosa','SR',1),
(1322,89,'Solola','SO',1),
(1323,89,'Suchitepequez','SU',1),
(1324,89,'Totonicapan','TO',1),
(1325,89,'Zacapa','ZA',1),
(1326,90,'Conakry','CNK',1),
(1327,90,'Beyla','BYL',1),
(1328,90,'Boffa','BFA',1),
(1329,90,'Boke','BOK',1),
(1330,90,'Coyah','COY',1),
(1331,90,'Dabola','DBL',1),
(1332,90,'Dalaba','DLB',1),
(1333,90,'Dinguiraye','DGR',1),
(1334,90,'Dubreka','DBR',1),
(1335,90,'Faranah','FRN',1),
(1336,90,'Forecariah','FRC',1),
(1337,90,'Fria','FRI',1),
(1338,90,'Gaoual','GAO',1),
(1339,90,'Gueckedou','GCD',1),
(1340,90,'Kankan','KNK',1),
(1341,90,'Kerouane','KRN',1),
(1342,90,'Kindia','KND',1),
(1343,90,'Kissidougou','KSD',1),
(1344,90,'Koubia','KBA',1),
(1345,90,'Koundara','KDA',1),
(1346,90,'Kouroussa','KRA',1),
(1347,90,'Labe','LAB',1),
(1348,90,'Lelouma','LLM',1),
(1349,90,'Lola','LOL',1),
(1350,90,'Macenta','MCT',1),
(1351,90,'Mali','MAL',1),
(1352,90,'Mamou','MAM',1),
(1353,90,'Mandiana','MAN',1),
(1354,90,'Nzerekore','NZR',1),
(1355,90,'Pita','PIT',1),
(1356,90,'Siguiri','SIG',1),
(1357,90,'Telimele','TLM',1),
(1358,90,'Tougue','TOG',1),
(1359,90,'Yomou','YOM',1),
(1360,91,'Bafata Region','BF',1),
(1361,91,'Biombo Region','BB',1),
(1362,91,'Bissau Region','BS',1),
(1363,91,'Bolama Region','BL',1),
(1364,91,'Cacheu Region','CA',1),
(1365,91,'Gabu Region','GA',1),
(1366,91,'Oio Region','OI',1),
(1367,91,'Quinara Region','QU',1),
(1368,91,'Tombali Region','TO',1),
(1369,92,'Barima-Waini','BW',1),
(1370,92,'Cuyuni-Mazaruni','CM',1),
(1371,92,'Demerara-Mahaica','DM',1),
(1372,92,'East Berbice-Corentyne','EC',1),
(1373,92,'Essequibo Islands-West Demerara','EW',1),
(1374,92,'Mahaica-Berbice','MB',1),
(1375,92,'Pomeroon-Supenaam','PM',1),
(1376,92,'Potaro-Siparuni','PI',1),
(1377,92,'Upper Demerara-Berbice','UD',1),
(1378,92,'Upper Takutu-Upper Essequibo','UT',1),
(1379,93,'Artibonite','AR',1),
(1380,93,'Centre','CE',1),
(1381,93,'Grand\'Anse','GA',1),
(1382,93,'Nord','ND',1),
(1383,93,'Nord-Est','NE',1),
(1384,93,'Nord-Ouest','NO',1),
(1385,93,'Ouest','OU',1),
(1386,93,'Sud','SD',1),
(1387,93,'Sud-Est','SE',1),
(1388,94,'Flat Island','F',1),
(1389,94,'McDonald Island','M',1),
(1390,94,'Shag Island','S',1),
(1391,94,'Heard Island','H',1),
(1392,95,'Atlantida','AT',1),
(1393,95,'Choluteca','CH',1),
(1394,95,'Colon','CL',1),
(1395,95,'Comayagua','CM',1),
(1396,95,'Copan','CP',1),
(1397,95,'Cortes','CR',1),
(1398,95,'El Paraiso','PA',1),
(1399,95,'Francisco Morazan','FM',1),
(1400,95,'Gracias a Dios','GD',1),
(1401,95,'Intibuca','IN',1),
(1402,95,'Islas de la Bahia (Bay Islands)','IB',1),
(1403,95,'La Paz','PZ',1),
(1404,95,'Lempira','LE',1),
(1405,95,'Ocotepeque','OC',1),
(1406,95,'Olancho','OL',1),
(1407,95,'Santa Barbara','SB',1),
(1408,95,'Valle','VA',1),
(1409,95,'Yoro','YO',1),
(1410,96,'Central and Western Hong Kong Island','HCW',1),
(1411,96,'Eastern Hong Kong Island','HEA',1),
(1412,96,'Southern Hong Kong Island','HSO',1),
(1413,96,'Wan Chai Hong Kong Island','HWC',1),
(1414,96,'Kowloon City Kowloon','KKC',1),
(1415,96,'Kwun Tong Kowloon','KKT',1),
(1416,96,'Sham Shui Po Kowloon','KSS',1),
(1417,96,'Wong Tai Sin Kowloon','KWT',1),
(1418,96,'Yau Tsim Mong Kowloon','KYT',1),
(1419,96,'Islands New Territories','NIS',1),
(1420,96,'Kwai Tsing New Territories','NKT',1),
(1421,96,'North New Territories','NNO',1),
(1422,96,'Sai Kung New Territories','NSK',1),
(1423,96,'Sha Tin New Territories','NST',1),
(1424,96,'Tai Po New Territories','NTP',1),
(1425,96,'Tsuen Wan New Territories','NTW',1),
(1426,96,'Tuen Mun New Territories','NTM',1),
(1427,96,'Yuen Long New Territories','NYL',1),
(1467,98,'Austurland','AL',1),
(1468,98,'Hofuoborgarsvaeoi','HF',1),
(1469,98,'Norourland eystra','NE',1),
(1470,98,'Norourland vestra','NV',1),
(1471,98,'Suourland','SL',1),
(1472,98,'Suournes','SN',1),
(1473,98,'Vestfiroir','VF',1),
(1474,98,'Vesturland','VL',1),
(1475,99,'Andaman and Nicobar Islands','AN',1),
(1476,99,'Andhra Pradesh','AP',1),
(1477,99,'Arunachal Pradesh','AR',1),
(1478,99,'Assam','AS',1),
(1479,99,'Bihar','BR',1),
(1480,99,'Chandigarh','CH',1),
(1481,99,'Dadra and Nagar Haveli and Davan and Diu','DH',1),
(1483,99,'Delhi','DL',1),
(1484,99,'Goa','GA',1),
(1485,99,'Gujarat','GJ',1),
(1486,99,'Haryana','HR',1),
(1487,99,'Himachal Pradesh','HP',1),
(1488,99,'Jammu and Kashmir','JK',1),
(1489,99,'Karnataka','KA',1),
(1490,99,'Kerala','KL',1),
(1491,99,'Lakshadweep','LD',1),
(1492,99,'Madhya Pradesh','MP',1),
(1493,99,'Maharashtra','MH',1),
(1494,99,'Manipur','MN',1),
(1495,99,'Meghalaya','ML',1),
(1496,99,'Mizoram','MZ',1),
(1497,99,'Nagaland','NL',1),
(1498,99,'Odisha','OR',1),
(1499,99,'Puducherry','PY',1),
(1500,99,'Punjab','PB',1),
(1501,99,'Rajasthan','RJ',1),
(1502,99,'Sikkim','SK',1),
(1503,99,'Tamil Nadu','TN',1),
(1504,99,'Tripura','TR',1),
(1505,99,'Uttar Pradesh','UP',1),
(1506,99,'West Bengal','WB',1),
(1507,100,'Aceh','AC',1),
(1508,100,'Bali','BA',1),
(1509,100,'Banten','BT',1),
(1510,100,'Bengkulu','BE',1),
(1511,100,'Kalimantan Utara','BD',1),
(1512,100,'Gorontalo','GO',1),
(1513,100,'Jakarta','JK',1),
(1514,100,'Jambi','JA',1),
(1515,100,'Jawa Barat','JB',1),
(1516,100,'Jawa Tengah','JT',1),
(1517,100,'Jawa Timur','JI',1),
(1518,100,'Kalimantan Barat','KB',1),
(1519,100,'Kalimantan Selatan','KS',1),
(1520,100,'Kalimantan Tengah','KT',1),
(1521,100,'Kalimantan Timur','KI',1),
(1522,100,'Kepulauan Bangka Belitung','BB',1),
(1523,100,'Lampung','LA',1),
(1524,100,'Maluku','MA',1),
(1525,100,'Maluku Utara','MU',1),
(1526,100,'Nusa Tenggara Barat','NB',1),
(1527,100,'Nusa Tenggara Timur','NT',1),
(1528,100,'Papua','PA',1),
(1529,100,'Riau','RI',1),
(1530,100,'Sulawesi Selatan','SN',1),
(1531,100,'Sulawesi Tengah','ST',1),
(1532,100,'Sulawesi Tenggara','SG',1),
(1533,100,'Sulawesi Utara','SA',1),
(1534,100,'Sumatera Barat','SB',1),
(1535,100,'Sumatera Selatan','SS',1),
(1536,100,'Sumatera Utara','SU',1),
(1537,100,'Yogyakarta','YO',1),
(1538,101,'Tehran','TEH',1),
(1539,101,'Qom','QOM',1),
(1540,101,'Markazi','MKZ',1),
(1541,101,'Qazvin','QAZ',1),
(1542,101,'Gilan','GIL',1),
(1543,101,'Ardabil','ARD',1),
(1544,101,'Zanjan','ZAN',1),
(1545,101,'East Azarbaijan','EAZ',1),
(1546,101,'West Azarbaijan','WEZ',1),
(1547,101,'Kurdistan','KRD',1),
(1548,101,'Hamadan','HMD',1),
(1549,101,'Kermanshah','KRM',1),
(1550,101,'Ilam','ILM',1),
(1551,101,'Lorestan','LRS',1),
(1552,101,'Khuzestan','KZT',1),
(1553,101,'Chahar Mahaal and Bakhtiari','CMB',1),
(1554,101,'Kohkiluyeh and Buyer Ahmad','KBA',1),
(1555,101,'Bushehr','BSH',1),
(1556,101,'Fars','FAR',1),
(1557,101,'Hormozgan','HRM',1),
(1558,101,'Sistan and Baluchistan','SBL',1),
(1559,101,'Kerman','KRB',1),
(1560,101,'Yazd','YZD',1),
(1561,101,'Esfahan','EFH',1),
(1562,101,'Semnan','SMN',1),
(1563,101,'Mazandaran','MZD',1),
(1564,101,'Golestan','GLS',1),
(1565,101,'North Khorasan','NKH',1),
(1566,101,'Razavi Khorasan','RKH',1),
(1567,101,'South Khorasan','SKH',1),
(1568,102,'Baghdad','BD',1),
(1569,102,'Salah ad Din','SD',1),
(1570,102,'Diyala','DY',1),
(1571,102,'Wasit','WS',1),
(1572,102,'Maysan','MY',1),
(1573,102,'Al Basrah','BA',1),
(1574,102,'Dhi Qar','DQ',1),
(1575,102,'Al Muthanna','MU',1),
(1576,102,'Al Qadisyah','QA',1),
(1577,102,'Babil','BB',1),
(1578,102,'Al Karbala','KB',1),
(1579,102,'An Najaf','NJ',1),
(1580,102,'Al Anbar','AB',1),
(1581,102,'Ninawa','NN',1),
(1582,102,'Dahuk','DH',1),
(1583,102,'Arbil','AL',1),
(1584,102,'Kirkuk','KI',1),
(1585,102,'As Sulaymaniyah','SL',1),
(1586,103,'Carlow','CA',1),
(1587,103,'Cavan','CV',1),
(1588,103,'Clare','CL',1),
(1589,103,'Cork','CO',1),
(1590,103,'Donegal','DO',1),
(1591,103,'Dublin','DU',1),
(1592,103,'Galway','GA',1),
(1593,103,'Kerry','KE',1),
(1594,103,'Kildare','KI',1),
(1595,103,'Kilkenny','KL',1),
(1596,103,'Laois','LA',1),
(1597,103,'Leitrim','LE',1),
(1598,103,'Limerick','LI',1),
(1599,103,'Longford','LO',1),
(1600,103,'Louth','LU',1),
(1601,103,'Mayo','MA',1),
(1602,103,'Meath','ME',1),
(1603,103,'Monaghan','MO',1),
(1604,103,'Offaly','OF',1),
(1605,103,'Roscommon','RO',1),
(1606,103,'Sligo','SL',1),
(1607,103,'Tipperary','TI',1),
(1608,103,'Waterford','WA',1),
(1609,103,'Westmeath','WE',1),
(1610,103,'Wexford','WX',1),
(1611,103,'Wicklow','WI',1),
(1612,104,'Be\'er Sheva','BS',1),
(1613,104,'Bika\'at Hayarden','BH',1),
(1614,104,'Eilat and Arava','EA',1),
(1615,104,'Galil','GA',1),
(1616,104,'Haifa','HA',1),
(1617,104,'Jehuda Mountains','JM',1),
(1618,104,'Jerusalem','JE',1),
(1619,104,'Negev','NE',1),
(1620,104,'Semaria','SE',1),
(1621,104,'Sharon','SH',1),
(1622,104,'Tel Aviv (Gosh Dan)','TA',1),
(1643,106,'Clarendon Parish','CLA',1),
(1644,106,'Hanover Parish','HAN',1),
(1645,106,'Kingston Parish','KIN',1),
(1646,106,'Manchester Parish','MAN',1),
(1647,106,'Portland Parish','POR',1),
(1648,106,'Saint Andrew Parish','AND',1),
(1649,106,'Saint Ann Parish','ANN',1),
(1650,106,'Saint Catherine Parish','CAT',1),
(1651,106,'Saint Elizabeth Parish','ELI',1),
(1652,106,'Saint James Parish','JAM',1),
(1653,106,'Saint Mary Parish','MAR',1),
(1654,106,'Saint Thomas Parish','THO',1),
(1655,106,'Trelawny Parish','TRL',1),
(1656,106,'Westmoreland Parish','WML',1),
(1657,107,'Aichi','AI',1),
(1658,107,'Akita','AK',1),
(1659,107,'Aomori','AO',1),
(1660,107,'Chiba','CH',1),
(1661,107,'Ehime','EH',1),
(1662,107,'Fukui','FK',1),
(1663,107,'Fukuoka','FU',1),
(1664,107,'Fukushima','FS',1),
(1665,107,'Gifu','GI',1),
(1666,107,'Gumma','GU',1),
(1667,107,'Hiroshima','HI',1),
(1668,107,'Hokkaido','HO',1),
(1669,107,'Hyogo','HY',1),
(1670,107,'Ibaraki','IB',1),
(1671,107,'Ishikawa','IS',1),
(1672,107,'Iwate','IW',1),
(1673,107,'Kagawa','KA',1),
(1674,107,'Kagoshima','KG',1),
(1675,107,'Kanagawa','KN',1),
(1676,107,'Kochi','KO',1),
(1677,107,'Kumamoto','KU',1),
(1678,107,'Kyoto','KY',1),
(1679,107,'Mie','MI',1),
(1680,107,'Miyagi','MY',1),
(1681,107,'Miyazaki','MZ',1),
(1682,107,'Nagano','NA',1),
(1683,107,'Nagasaki','NG',1),
(1684,107,'Nara','NR',1),
(1685,107,'Niigata','NI',1),
(1686,107,'Oita','OI',1),
(1687,107,'Okayama','OK',1),
(1688,107,'Okinawa','ON',1),
(1689,107,'Osaka','OS',1),
(1690,107,'Saga','SA',1),
(1691,107,'Saitama','SI',1),
(1692,107,'Shiga','SH',1),
(1693,107,'Shimane','SM',1),
(1694,107,'Shizuoka','SZ',1),
(1695,107,'Tochigi','TO',1),
(1696,107,'Tokushima','TS',1),
(1697,107,'Tokyo','TK',1),
(1698,107,'Tottori','TT',1),
(1699,107,'Toyama','TY',1),
(1700,107,'Wakayama','WA',1),
(1701,107,'Yamagata','YA',1),
(1702,107,'Yamaguchi','YM',1),
(1703,107,'Yamanashi','YN',1),
(1704,108,'\'Amman','AM',1),
(1705,108,'Ajlun','AJ',1),
(1706,108,'Al \'Aqabah','AA',1),
(1707,108,'Al Balqa\'','AB',1),
(1708,108,'Al Karak','AK',1),
(1709,108,'Al Mafraq','AL',1),
(1710,108,'At Tafilah','AT',1),
(1711,108,'Az Zarqa\'','AZ',1),
(1712,108,'Irbid','IR',1),
(1713,108,'Jarash','JA',1),
(1714,108,'Ma\'an','MA',1),
(1715,108,'Madaba','MD',1),
(1716,109,'Almaty','AL',1),
(1717,109,'Almaty City','AC',1),
(1718,109,'Aqmola','AM',1),
(1719,109,'Aqtobe','AQ',1),
(1720,109,'Astana City','AS',1),
(1721,109,'Atyrau','AT',1),
(1722,109,'Batys Qazaqstan','BA',1),
(1723,109,'Bayqongyr City','BY',1),
(1724,109,'Mangghystau','MA',1),
(1725,109,'Ongtustik Qazaqstan','ON',1),
(1726,109,'Pavlodar','PA',1),
(1727,109,'Qaraghandy','QA',1),
(1728,109,'Qostanay','QO',1),
(1729,109,'Qyzylorda','QY',1),
(1730,109,'Shyghys Qazaqstan','SH',1),
(1731,109,'Soltustik Qazaqstan','SO',1),
(1732,109,'Zhambyl','ZH',1),
(1733,110,'Central','CE',1),
(1734,110,'Coast','CO',1),
(1735,110,'Eastern','EA',1),
(1736,110,'Nairobi Area','NA',1),
(1737,110,'North Eastern','NE',1),
(1738,110,'Nyanza','NY',1),
(1739,110,'Rift Valley','RV',1),
(1740,110,'Western','WE',1),
(1741,111,'Abaiang','AG',1),
(1742,111,'Abemama','AM',1),
(1743,111,'Aranuka','AK',1),
(1744,111,'Arorae','AO',1),
(1745,111,'Banaba','BA',1),
(1746,111,'Beru','BE',1),
(1747,111,'Butaritari','bT',1),
(1748,111,'Kanton','KA',1),
(1749,111,'Kiritimati','KR',1),
(1750,111,'Kuria','KU',1),
(1751,111,'Maiana','MI',1),
(1752,111,'Makin','MN',1),
(1753,111,'Marakei','ME',1),
(1754,111,'Nikunau','NI',1),
(1755,111,'Nonouti','NO',1),
(1756,111,'Onotoa','ON',1),
(1757,111,'Tabiteuea','TT',1),
(1758,111,'Tabuaeran','TR',1),
(1759,111,'Tamana','TM',1),
(1760,111,'Tarawa','TW',1),
(1761,111,'Teraina','TE',1),
(1762,112,'Chagang-do','CHA',1),
(1763,112,'Hamgyong-bukto','HAB',1),
(1764,112,'Hamgyong-namdo','HAN',1),
(1765,112,'Hwanghae-bukto','HWB',1),
(1766,112,'Hwanghae-namdo','HWN',1),
(1767,112,'Kangwon-do','KAN',1),
(1768,112,'P\'yongan-bukto','PYB',1),
(1769,112,'P\'yongan-namdo','PYN',1),
(1770,112,'Ryanggang-do (Yanggang-do)','YAN',1),
(1771,112,'Rason Directly Governed City','NAJ',1),
(1772,112,'P\'yongyang Special City','PYO',1),
(1788,114,'Al \'Asimah','AL',1),
(1789,114,'Al Ahmadi','AA',1),
(1790,114,'Al Farwaniyah','AF',1),
(1791,114,'Al Jahra\'','AJ',1),
(1792,114,'Hawalli','HA',1),
(1793,115,'Bishkek','GB',1),
(1794,115,'Batken','B',1),
(1795,115,'Chu','C',1),
(1796,115,'Jalal-Abad','J',1),
(1797,115,'Naryn','N',1),
(1798,115,'Osh','O',1),
(1799,115,'Talas','T',1),
(1800,115,'Ysyk-Kol','Y',1),
(1801,116,'Vientiane','VT',1),
(1802,116,'Attapu','AT',1),
(1803,116,'Bokeo','BK',1),
(1804,116,'Bolikhamxai','BL',1),
(1805,116,'Champasak','CH',1),
(1806,116,'Houaphan','HO',1),
(1807,116,'Khammouan','KH',1),
(1808,116,'Louang Namtha','LM',1),
(1809,116,'Louangphabang','LP',1),
(1810,116,'Oudomxai','OU',1),
(1811,116,'Phongsali','PH',1),
(1812,116,'Salavan','SL',1),
(1813,116,'Savannakhet','SV',1),
(1814,116,'Vientiane','VI',1),
(1815,116,'Xaignabouli','XA',1),
(1816,116,'Xekong','XE',1),
(1817,116,'Xiangkhoang','XI',1),
(1818,116,'Xaisomboun','XN',1),
(1852,119,'Berea','BE',1),
(1853,119,'Butha-Buthe','BB',1),
(1854,119,'Leribe','LE',1),
(1855,119,'Mafeteng','MF',1),
(1856,119,'Maseru','MS',1),
(1857,119,'Mohale\'s Hoek','MH',1),
(1858,119,'Mokhotlong','MK',1),
(1859,119,'Qacha\'s Nek','QN',1),
(1860,119,'Quthing','QT',1),
(1861,119,'Thaba-Tseka','TT',1),
(1862,120,'Bomi','BI',1),
(1863,120,'Bong','BG',1),
(1864,120,'Grand Bassa','GB',1),
(1865,120,'Grand Cape Mount','CM',1),
(1866,120,'Grand Gedeh','GG',1),
(1867,120,'Grand Kru','GK',1),
(1868,120,'Lofa','LO',1),
(1869,120,'Margibi','MG',1),
(1870,120,'Maryland','ML',1),
(1871,120,'Montserrado','MS',1),
(1872,120,'Nimba','NB',1),
(1873,120,'River Cess','RC',1),
(1874,120,'Sinoe','SN',1),
(1875,121,'Ajdabiya','AJ',1),
(1876,121,'Al \'Aziziyah','AZ',1),
(1877,121,'Al Fatih','FA',1),
(1878,121,'Al Jabal al Akhdar','JA',1),
(1879,121,'Al Jufrah','JU',1),
(1880,121,'Al Khums','KH',1),
(1881,121,'Al Kufrah','KU',1),
(1882,121,'An Nuqat al Khams','NK',1),
(1883,121,'Ash Shati\'','AS',1),
(1884,121,'Awbari','AW',1),
(1885,121,'Az Zawiyah','ZA',1),
(1886,121,'Banghazi','BA',1),
(1887,121,'Darnah','DA',1),
(1888,121,'Ghadamis','GD',1),
(1889,121,'Gharyan','GY',1),
(1890,121,'Misratah','MI',1),
(1891,121,'Murzuq','MZ',1),
(1892,121,'Sabha','SB',1),
(1893,121,'Sawfajjin','SW',1),
(1894,121,'Surt','SU',1),
(1895,121,'Tarabulus (Tripoli)','TL',1),
(1896,121,'Tarhunah','TH',1),
(1897,121,'Tubruq','TU',1),
(1898,121,'Yafran','YA',1),
(1899,121,'Zlitan','ZL',1),
(1900,122,'Vaduz','V',1),
(1901,122,'Schaan','A',1),
(1902,122,'Balzers','B',1),
(1903,122,'Triesen','N',1),
(1904,122,'Eschen','E',1),
(1905,122,'Mauren','M',1),
(1906,122,'Triesenberg','T',1),
(1907,122,'Ruggell','R',1),
(1908,122,'Gamprin','G',1),
(1909,122,'Schellenberg','L',1),
(1910,122,'Planken','P',1),
(1911,123,'Alytus','AL',1),
(1912,123,'Kaunas','KA',1),
(1913,123,'Klaipeda','KL',1),
(1914,123,'Marijampole','MA',1),
(1915,123,'Panevezys','PA',1),
(1916,123,'Siauliai','SI',1),
(1917,123,'Taurage','TA',1),
(1918,123,'Telsiai','TE',1),
(1919,123,'Utena','UT',1),
(1920,123,'Vilnius','VI',1),
(1921,124,'Diekirch','DD',1),
(1922,124,'Clervaux','DC',1),
(1923,124,'Redange','DR',1),
(1924,124,'Vianden','DV',1),
(1925,124,'Wiltz','DW',1),
(1926,124,'Grevenmacher','GG',1),
(1927,124,'Echternach','GE',1),
(1928,124,'Remich','GR',1),
(1929,124,'Luxembourg','LL',1),
(1930,124,'Capellen','LC',1),
(1931,124,'Esch-sur-Alzette','LE',1),
(1932,124,'Mersch','LM',1),
(1933,125,'Our Lady Fatima Parish','OLF',1),
(1934,125,'St. Anthony Parish','ANT',1),
(1935,125,'St. Lazarus Parish','LAZ',1),
(1936,125,'Cathedral Parish','CAT',1),
(1937,125,'St. Lawrence Parish','LAW',1),
(1938,127,'Antananarivo','AN',1),
(1939,127,'Antsiranana','AS',1),
(1940,127,'Fianarantsoa','FN',1),
(1941,127,'Mahajanga','MJ',1),
(1942,127,'Toamasina','TM',1),
(1943,127,'Toliara','TL',1),
(1944,128,'Balaka','BLK',1),
(1945,128,'Blantyre','BLT',1),
(1946,128,'Chikwawa','CKW',1),
(1947,128,'Chiradzulu','CRD',1),
(1948,128,'Chitipa','CTP',1),
(1949,128,'Dedza','DDZ',1),
(1950,128,'Dowa','DWA',1),
(1951,128,'Karonga','KRG',1),
(1952,128,'Kasungu','KSG',1),
(1953,128,'Likoma','LKM',1),
(1954,128,'Lilongwe','LLG',1),
(1955,128,'Machinga','MCG',1),
(1956,128,'Mangochi','MGC',1),
(1957,128,'Mchinji','MCH',1),
(1958,128,'Mulanje','MLJ',1),
(1959,128,'Mwanza','MWZ',1),
(1960,128,'Mzimba','MZM',1),
(1961,128,'Ntcheu','NTU',1),
(1962,128,'Nkhata Bay','NKB',1),
(1963,128,'Nkhotakota','NKH',1),
(1964,128,'Nsanje','NSJ',1),
(1965,128,'Ntchisi','NTI',1),
(1966,128,'Phalombe','PHL',1),
(1967,128,'Rumphi','RMP',1),
(1968,128,'Salima','SLM',1),
(1969,128,'Thyolo','THY',1),
(1970,128,'Zomba','ZBA',1),
(1971,129,'Johor','MY-01',1),
(1972,129,'Kedah','MY-02',1),
(1973,129,'Kelantan','MY-03',1),
(1974,129,'Labuan','MY-15',1),
(1975,129,'Melaka','MY-04',1),
(1976,129,'Negeri Sembilan','MY-05',1),
(1977,129,'Pahang','MY-06',1),
(1978,129,'Perak','MY-08',1),
(1979,129,'Perlis','MY-09',1),
(1980,129,'Pulau Pinang','MY-07',1),
(1981,129,'Sabah','MY-12',1),
(1982,129,'Sarawak','MY-13',1),
(1983,129,'Selangor','MY-10',1),
(1984,129,'Terengganu','MY-11',1),
(1985,129,'Kuala Lumpur','MY-14',1),
(1986,130,'Thiladhunmathi Uthuru','THU',1),
(1987,130,'Thiladhunmathi Dhekunu','THD',1),
(1988,130,'Miladhunmadulu Uthuru','MLU',1),
(1989,130,'Miladhunmadulu Dhekunu','MLD',1),
(1990,130,'Maalhosmadulu Uthuru','MAU',1),
(1991,130,'Maalhosmadulu Dhekunu','MAD',1),
(1992,130,'Faadhippolhu','FAA',1),
(1993,130,'Male Atoll','MAA',1),
(1994,130,'Ari Atoll Uthuru','AAU',1),
(1995,130,'Ari Atoll Dheknu','AAD',1),
(1996,130,'Felidhe Atoll','FEA',1),
(1997,130,'Mulaku Atoll','MUA',1),
(1998,130,'Nilandhe Atoll Uthuru','NAU',1),
(1999,130,'Nilandhe Atoll Dhekunu','NAD',1),
(2000,130,'Kolhumadulu','KLH',1),
(2001,130,'Hadhdhunmathi','HDH',1),
(2002,130,'Huvadhu Atoll Uthuru','HAU',1),
(2003,130,'Huvadhu Atoll Dhekunu','HAD',1),
(2004,130,'Fua Mulaku','FMU',1),
(2005,130,'Addu','ADD',1),
(2006,131,'Gao','GA',1),
(2007,131,'Kayes','KY',1),
(2008,131,'Kidal','KD',1),
(2009,131,'Koulikoro','KL',1),
(2010,131,'Mopti','MP',1),
(2011,131,'Segou','SG',1),
(2012,131,'Sikasso','SK',1),
(2013,131,'Tombouctou','TB',1),
(2014,131,'Bamako Capital District','CD',1),
(2015,132,'Attard','ATT',1),
(2016,132,'Balzan','BAL',1),
(2017,132,'Birgu','BGU',1),
(2018,132,'Birkirkara','BKK',1),
(2019,132,'Birzebbuga','BRZ',1),
(2020,132,'Bormla','BOR',1),
(2021,132,'Dingli','DIN',1),
(2022,132,'Fgura','FGU',1),
(2023,132,'Floriana','FLO',1),
(2024,132,'Gudja','GDJ',1),
(2025,132,'Gzira','GZR',1),
(2026,132,'Gargur','GRG',1),
(2027,132,'Gaxaq','GXQ',1),
(2028,132,'Hamrun','HMR',1),
(2029,132,'Iklin','IKL',1),
(2030,132,'Isla','ISL',1),
(2031,132,'Kalkara','KLK',1),
(2032,132,'Kirkop','KRK',1),
(2033,132,'Lija','LIJ',1),
(2034,132,'Luqa','LUQ',1),
(2035,132,'Marsa','MRS',1),
(2036,132,'Marsaskala','MKL',1),
(2037,132,'Marsaxlokk','MXL',1),
(2038,132,'Mdina','MDN',1),
(2039,132,'Melliea','MEL',1),
(2040,132,'Mgarr','MGR',1),
(2041,132,'Mosta','MST',1),
(2042,132,'Mqabba','MQA',1),
(2043,132,'Msida','MSI',1),
(2044,132,'Mtarfa','MTF',1),
(2045,132,'Naxxar','NAX',1),
(2046,132,'Paola','PAO',1),
(2047,132,'Pembroke','PEM',1),
(2048,132,'Pieta','PIE',1),
(2049,132,'Qormi','QOR',1),
(2050,132,'Qrendi','QRE',1),
(2051,132,'Rabat','RAB',1),
(2052,132,'Safi','SAF',1),
(2053,132,'San Giljan','SGI',1),
(2054,132,'Santa Lucija','SLU',1),
(2055,132,'San Pawl il-Bahar','SPB',1),
(2056,132,'San Gwann','SGW',1),
(2057,132,'Santa Venera','SVE',1),
(2058,132,'Siggiewi','SIG',1),
(2059,132,'Sliema','SLM',1),
(2060,132,'Swieqi','SWQ',1),
(2061,132,'Ta Xbiex','TXB',1),
(2062,132,'Tarxien','TRX',1),
(2063,132,'Valletta','VLT',1),
(2064,132,'Xgajra','XGJ',1),
(2065,132,'Zabbar','ZBR',1),
(2066,132,'Zebbug','ZBG',1),
(2067,132,'Zejtun','ZJT',1),
(2068,132,'Zurrieq','ZRQ',1),
(2069,132,'Fontana','FNT',1),
(2070,132,'Ghajnsielem','GHJ',1),
(2071,132,'Gharb','GHR',1),
(2072,132,'Ghasri','GHS',1),
(2073,132,'Kercem','KRC',1),
(2074,132,'Munxar','MUN',1),
(2075,132,'Nadur','NAD',1),
(2076,132,'Qala','QAL',1),
(2077,132,'Victoria','VIC',1),
(2078,132,'San Lawrenz','SLA',1),
(2079,132,'Sannat','SNT',1),
(2080,132,'Xagra','ZAG',1),
(2081,132,'Xewkija','XEW',1),
(2082,132,'Zebbug','ZEB',1),
(2083,133,'Ailinginae','ALG',1),
(2084,133,'Ailinglaplap','ALL',1),
(2085,133,'Ailuk','ALK',1),
(2086,133,'Arno','ARN',1),
(2087,133,'Aur','AUR',1),
(2088,133,'Bikar','BKR',1),
(2089,133,'Bikini','BKN',1),
(2090,133,'Bokak','BKK',1),
(2091,133,'Ebon','EBN',1),
(2092,133,'Enewetak','ENT',1),
(2093,133,'Erikub','EKB',1),
(2094,133,'Jabat','JBT',1),
(2095,133,'Jaluit','JLT',1),
(2096,133,'Jemo','JEM',1),
(2097,133,'Kili','KIL',1),
(2098,133,'Kwajalein','KWJ',1),
(2099,133,'Lae','LAE',1),
(2100,133,'Lib','LIB',1),
(2101,133,'Likiep','LKP',1),
(2102,133,'Majuro','MJR',1),
(2103,133,'Maloelap','MLP',1),
(2104,133,'Mejit','MJT',1),
(2105,133,'Mili','MIL',1),
(2106,133,'Namorik','NMK',1),
(2107,133,'Namu','NAM',1),
(2108,133,'Rongelap','RGL',1),
(2109,133,'Rongrik','RGK',1),
(2110,133,'Toke','TOK',1),
(2111,133,'Ujae','UJA',1),
(2112,133,'Ujelang','UJL',1),
(2113,133,'Utirik','UTK',1),
(2114,133,'Wotho','WTH',1),
(2115,133,'Wotje','WTJ',1),
(2116,135,'Adrar','AD',1),
(2117,135,'Assaba','AS',1),
(2118,135,'Brakna','BR',1),
(2119,135,'Dakhlet Nouadhibou','DN',1),
(2120,135,'Gorgol','GO',1),
(2121,135,'Guidimaka','GM',1),
(2122,135,'Hodh Ech Chargui','HC',1),
(2123,135,'Hodh El Gharbi','HG',1),
(2124,135,'Inchiri','IN',1),
(2125,135,'Tagant','TA',1),
(2126,135,'Tiris Zemmour','TZ',1),
(2127,135,'Trarza','TR',1),
(2128,135,'Nouakchott','NO',1),
(2129,136,'Beau Bassin-Rose Hill','BR',1),
(2130,136,'Curepipe','CU',1),
(2131,136,'Port Louis','PU',1),
(2132,136,'Quatre Bornes','QB',1),
(2133,136,'Vacoas-Phoenix','VP',1),
(2134,136,'Agalega Islands','AG',1),
(2135,136,'Cargados Carajos Shoals (Saint Brandon Islands)','CC',1),
(2136,136,'Rodrigues','RO',1),
(2137,136,'Black River','BL',1),
(2138,136,'Flacq','FL',1),
(2139,136,'Grand Port','GP',1),
(2140,136,'Moka','MO',1),
(2141,136,'Pamplemousses','PA',1),
(2142,136,'Plaines Wilhems','PW',1),
(2143,136,'Port Louis','PL',1),
(2144,136,'Riviere du Rempart','RR',1),
(2145,136,'Savanne','SA',1),
(2146,138,'Baja California','BCN',1),
(2147,138,'Baja California Sur','BCS',1),
(2148,138,'Campeche','CAM',1),
(2149,138,'Chiapas','CHP',1),
(2150,138,'Chihuahua','CHH',1),
(2151,138,'Coahuila de Zaragoza','COA',1),
(2152,138,'Colima','COL',1),
(2153,138,'Cuidad de Mexico','CMX',1),
(2154,138,'Durango','DUR',1),
(2155,138,'Guanajuato','GUA',1),
(2156,138,'Guerrero','GRO',1),
(2157,138,'Hidalgo','HID',1),
(2158,138,'Jalisco','JAL',1),
(2159,138,'Mexico','MEX',1),
(2160,138,'Michoacan de Ocampo','MIC',1),
(2161,138,'Morelos','MOR',1),
(2162,138,'Nayarit','NAY',1),
(2163,138,'Nuevo Leon','NLE',1),
(2164,138,'Oaxaca','OAX',1),
(2165,138,'Puebla','PUE',1),
(2166,138,'Queretaro','QUE',1),
(2167,138,'Quintana Roo','ROO',1),
(2168,138,'San Luis Potosi','SLP',1),
(2169,138,'Sinaloa','SIN',1),
(2170,138,'Sonora','SON',1),
(2171,138,'Tabasco','TAB',1),
(2172,138,'Tamaulipas','TAM',1),
(2173,138,'Tlaxcala','TLA',1),
(2174,138,'Veracruz de Ignacio de la Llave','VER',1),
(2175,138,'Yucatan','YUC',1),
(2176,138,'Zacatecas','ZAC',1),
(2177,139,'Chuuk','C',1),
(2178,139,'Kosrae','K',1),
(2179,139,'Pohnpei','P',1),
(2180,139,'Yap','Y',1),
(2181,140,'Gagauzia','GA',1),
(2182,140,'Chisinau','CU',1),
(2183,140,'Balti','BA',1),
(2184,140,'Cahul','CA',1),
(2185,140,'Edinet','ED',1),
(2186,140,'Lapusna','LA',1),
(2187,140,'Orhei','OR',1),
(2188,140,'Soroca','SO',1),
(2189,140,'Tighina','TI',1),
(2190,140,'Ungheni','UN',1),
(2191,140,'St‚nga Nistrului','SN',1),
(2192,141,'Fontvieille','FV',1),
(2193,141,'La Condamine','LC',1),
(2194,141,'Monaco-Ville','MV',1),
(2195,141,'Monte-Carlo','MC',1),
(2196,142,'Ulanbaatar','1',1),
(2197,142,'Orhon','035',1),
(2198,142,'Darhan uul','037',1),
(2199,142,'Hentiy','039',1),
(2200,142,'Hovsgol','041',1),
(2201,142,'Hovd','043',1),
(2202,142,'Uvs','046',1),
(2203,142,'Tov','047',1),
(2204,142,'Selenge','049',1),
(2205,142,'Suhbaatar','051',1),
(2206,142,'Omnogovi','053',1),
(2207,142,'Ovorhangay','055',1),
(2208,142,'Dzavhan','057',1),
(2209,142,'DundgovL','059',1),
(2210,142,'Dornod','061',1),
(2211,142,'Dornogov','063',1),
(2212,142,'Govi-Sumber','064',1),
(2213,142,'Govi-Altay','065',1),
(2214,142,'Bulgan','067',1),
(2215,142,'Bayanhongor','069',1),
(2216,142,'Bayan-Olgiy','071',1),
(2217,142,'Arhangay','073',1),
(2218,143,'Saint Anthony','A',1),
(2219,143,'Saint Georges','G',1),
(2220,143,'Saint Peter','P',1),
(2221,144,'Agadir','AGD',1),
(2222,144,'Al Hoceima','HOC',1),
(2223,144,'Azilal','AZI',1),
(2224,144,'Beni Mellal','BME',1),
(2225,144,'Ben Slimane','BSL',1),
(2226,144,'Boulemane','BLM',1),
(2227,144,'Casablanca','CBL',1),
(2228,144,'Chaouen','CHA',1),
(2229,144,'El Jadida','EJA',1),
(2230,144,'El Kelaa des Sraghna','EKS',1),
(2231,144,'Er Rachidia','ERA',1),
(2232,144,'Essaouira','ESS',1),
(2233,144,'Fes','FES',1),
(2234,144,'Figuig','FIG',1),
(2235,144,'Guelmim','GLM',1),
(2236,144,'Ifrane','IFR',1),
(2237,144,'Kenitra','KEN',1),
(2238,144,'Khemisset','KHM',1),
(2239,144,'Khenifra','KHN',1),
(2240,144,'Khouribga','KHO',1),
(2241,144,'Laayoune','LYN',1),
(2242,144,'Larache','LAR',1),
(2243,144,'Marrakech','MRK',1),
(2244,144,'Meknes','MKN',1),
(2245,144,'Nador','NAD',1),
(2246,144,'Ouarzazate','ORZ',1),
(2247,144,'Oujda','OUJ',1),
(2248,144,'Rabat-Sale','RSA',1),
(2249,144,'Safi','SAF',1),
(2250,144,'Settat','SET',1),
(2251,144,'Sidi Kacem','SKA',1),
(2252,144,'Tangier','TGR',1),
(2253,144,'Tan-Tan','TAN',1),
(2254,144,'Taounate','TAO',1),
(2255,144,'Taroudannt','TRD',1),
(2256,144,'Tata','TAT',1),
(2257,144,'Taza','TAZ',1),
(2258,144,'Tetouan','TET',1),
(2259,144,'Tiznit','TIZ',1),
(2260,144,'Ad Dakhla','ADK',1),
(2261,144,'Boujdour','BJD',1),
(2262,144,'Es Smara','ESM',1),
(2263,145,'Cabo Delgado','CD',1),
(2264,145,'Gaza','GZ',1),
(2265,145,'Inhambane','IN',1),
(2266,145,'Manica','MN',1),
(2267,145,'Maputo (city)','MC',1),
(2268,145,'Maputo','MP',1),
(2269,145,'Nampula','NA',1),
(2270,145,'Niassa','NI',1),
(2271,145,'Sofala','SO',1),
(2272,145,'Tete','TE',1),
(2273,145,'Zambezia','ZA',1),
(2274,146,'Ayeyarwady','AY',1),
(2275,146,'Bago','BG',1),
(2276,146,'Magway','MG',1),
(2277,146,'Mandalay','MD',1),
(2278,146,'Sagaing','SG',1),
(2279,146,'Tanintharyi','TN',1),
(2280,146,'Yangon','YG',1),
(2281,146,'Chin State','CH',1),
(2282,146,'Kachin State','KC',1),
(2283,146,'Kayah State','KH',1),
(2284,146,'Kayin State','KN',1),
(2285,146,'Mon State','MN',1),
(2286,146,'Rakhine State','RK',1),
(2287,146,'Shan State','SH',1),
(2288,147,'Caprivi','CA',1),
(2289,147,'Erongo','ER',1),
(2290,147,'Hardap','HA',1),
(2291,147,'Karas','KR',1),
(2292,147,'Kavango','KV',1),
(2293,147,'Khomas','KH',1),
(2294,147,'Kunene','KU',1),
(2295,147,'Ohangwena','OW',1),
(2296,147,'Omaheke','OK',1),
(2297,147,'Omusati','OT',1),
(2298,147,'Oshana','ON',1),
(2299,147,'Oshikoto','OO',1),
(2300,147,'Otjozondjupa','OJ',1),
(2301,148,'Aiwo','AO',1),
(2302,148,'Anabar','AA',1),
(2303,148,'Anetan','AT',1),
(2304,148,'Anibare','AI',1),
(2305,148,'Baiti','BA',1),
(2306,148,'Boe','BO',1),
(2307,148,'Buada','BU',1),
(2308,148,'Denigomodu','DE',1),
(2309,148,'Ewa','EW',1),
(2310,148,'Ijuw','IJ',1),
(2311,148,'Meneng','ME',1),
(2312,148,'Nibok','NI',1),
(2313,148,'Uaboe','UA',1),
(2314,148,'Yaren','YA',1),
(2315,149,'Bagmati','BA',1),
(2316,149,'Bheri','BH',1),
(2317,149,'Dhawalagiri','DH',1),
(2318,149,'Gandaki','GA',1),
(2319,149,'Janakpur','JA',1),
(2320,149,'Karnali','KA',1),
(2321,149,'Kosi','KO',1),
(2322,149,'Lumbini','LU',1),
(2323,149,'Mahakali','MA',1),
(2324,149,'Mechi','ME',1),
(2325,149,'Narayani','NA',1),
(2326,149,'Rapti','RA',1),
(2327,149,'Sagarmatha','SA',1),
(2328,149,'Seti','SE',1),
(2329,150,'Drenthe','DR',1),
(2330,150,'Flevoland','FL',1),
(2331,150,'Friesland','FR',1),
(2332,150,'Gelderland','GE',1),
(2333,150,'Groningen','GR',1),
(2334,150,'Limburg','LI',1),
(2335,150,'Noord-Brabant','NB',1),
(2336,150,'Noord-Holland','NH',1),
(2337,150,'Overijssel','OV',1),
(2338,150,'Utrecht','UT',1),
(2339,150,'Zeeland','ZE',1),
(2340,150,'Zuid-Holland','ZH',1),
(2341,152,'Iles Loyaute','L',1),
(2342,152,'Nord','N',1),
(2343,152,'Sud','S',1),
(2344,153,'Auckland','AUK',1),
(2345,153,'Bay of Plenty','BOP',1),
(2346,153,'Canterbury','CAN',1),
(2347,153,'Coromandel','COR',1),
(2348,153,'Gisborne','GIS',1),
(2349,153,'Fiordland','FIO',1),
(2350,153,'Hawke\'s Bay','HKB',1),
(2351,153,'Marlborough','MBH',1),
(2352,153,'Manawatu-Wanganui','MWT',1),
(2353,153,'Mt Cook-Mackenzie','MCM',1),
(2354,153,'Nelson','NSN',1),
(2355,153,'Northland','NTL',1),
(2356,153,'Otago','OTA',1),
(2357,153,'Southland','STL',1),
(2358,153,'Taranaki','TKI',1),
(2359,153,'Wellington','WGN',1),
(2360,153,'Waikato','WKO',1),
(2361,153,'Wairarapa','WAI',1),
(2362,153,'West Coast','WTC',1),
(2363,154,'Atlantico Norte','AN',1),
(2364,154,'Atlantico Sur','AS',1),
(2365,154,'Boaco','BO',1),
(2366,154,'Carazo','CA',1),
(2367,154,'Chinandega','CI',1),
(2368,154,'Chontales','CO',1),
(2369,154,'Esteli','ES',1),
(2370,154,'Granada','GR',1),
(2371,154,'Jinotega','JI',1),
(2372,154,'Leon','LE',1),
(2373,154,'Madriz','MD',1),
(2374,154,'Managua','MN',1),
(2375,154,'Masaya','MS',1),
(2376,154,'Matagalpa','MT',1),
(2377,154,'Nuevo Segovia','NS',1),
(2378,154,'Rio San Juan','RS',1),
(2379,154,'Rivas','RI',1),
(2380,155,'Agadez','AG',1),
(2381,155,'Diffa','DF',1),
(2382,155,'Dosso','DS',1),
(2383,155,'Maradi','MA',1),
(2384,155,'Niamey','NM',1),
(2385,155,'Tahoua','TH',1),
(2386,155,'Tillaberi','TL',1),
(2387,155,'Zinder','ZD',1),
(2388,156,'Abia','AB',1),
(2389,156,'Abuja Federal Capital Territory','CT',1),
(2390,156,'Adamawa','AD',1),
(2391,156,'Akwa Ibom','AK',1),
(2392,156,'Anambra','AN',1),
(2393,156,'Bauchi','BC',1),
(2394,156,'Bayelsa','BY',1),
(2395,156,'Benue','BN',1),
(2396,156,'Borno','BO',1),
(2397,156,'Cross River','CR',1),
(2398,156,'Delta','DE',1),
(2399,156,'Ebonyi','EB',1),
(2400,156,'Edo','ED',1),
(2401,156,'Ekiti','EK',1),
(2402,156,'Enugu','EN',1),
(2403,156,'Gombe','GO',1),
(2404,156,'Imo','IM',1),
(2405,156,'Jigawa','JI',1),
(2406,156,'Kaduna','KD',1),
(2407,156,'Kano','KN',1),
(2408,156,'Katsina','KT',1),
(2409,156,'Kebbi','KE',1),
(2410,156,'Kogi','KO',1),
(2411,156,'Kwara','KW',1),
(2412,156,'Lagos','LA',1),
(2413,156,'Nassarawa','NA',1),
(2414,156,'Niger','NI',1),
(2415,156,'Ogun','OG',1),
(2416,156,'Ondo','ONG',1),
(2417,156,'Osun','OS',1),
(2418,156,'Oyo','OY',1),
(2419,156,'Plateau','PL',1),
(2420,156,'Rivers','RI',1),
(2421,156,'Sokoto','SO',1),
(2422,156,'Taraba','TA',1),
(2423,156,'Yobe','YO',1),
(2424,156,'Zamfara','ZA',1),
(2425,159,'Northern Islands','N',1),
(2426,159,'Rota','R',1),
(2427,159,'Saipan','S',1),
(2428,159,'Tinian','T',1),
(2429,160,'Akershus','AK',1),
(2430,160,'Aust-Agder','AA',1),
(2431,160,'Buskerud','BU',1),
(2432,160,'Finnmark','FM',1),
(2433,160,'Hedmark','HM',1),
(2434,160,'Hordaland','HL',1),
(2435,160,'More og Romdal','MR',1),
(2436,160,'Nord-Trondelag','NT',1),
(2437,160,'Nordland','NL',1),
(2438,160,'Ostfold','OF',1),
(2439,160,'Oppland','OP',1),
(2440,160,'Oslo','OL',1),
(2441,160,'Rogaland','RL',1),
(2442,160,'Sor-Trondelag','ST',1),
(2443,160,'Sogn og Fjordane','SJ',1),
(2444,160,'Svalbard','SV',1),
(2445,160,'Telemark','TM',1),
(2446,160,'Troms','TR',1),
(2447,160,'Vest-Agder','VA',1),
(2448,160,'Vestfold','VF',1),
(2449,161,'Ad Dakhiliyah','DA',1),
(2450,161,'Al Batinah','BA',1),
(2451,161,'Al Wusta','WU',1),
(2452,161,'Ash Sharqiyah','SH',1),
(2453,161,'Az Zahirah','ZA',1),
(2454,161,'Masqat','MA',1),
(2455,161,'Musandam','MU',1),
(2456,161,'Zufar','ZU',1),
(2457,162,'Balochistan','B',1),
(2458,162,'Federally Administered Tribal Areas','T',1),
(2459,162,'Islamabad Capital Territory','I',1),
(2460,162,'North-West Frontier','N',1),
(2461,162,'Punjab','P',1),
(2462,162,'Sindh','S',1),
(2463,163,'Aimeliik','AM',1),
(2464,163,'Airai','AR',1),
(2465,163,'Angaur','AN',1),
(2466,163,'Hatohobei','HA',1),
(2467,163,'Kayangel','KA',1),
(2468,163,'Koror','KO',1),
(2469,163,'Melekeok','ME',1),
(2470,163,'Ngaraard','NA',1),
(2471,163,'Ngarchelong','NG',1),
(2472,163,'Ngardmau','ND',1),
(2473,163,'Ngatpang','NT',1),
(2474,163,'Ngchesar','NC',1),
(2475,163,'Ngeremlengui','NR',1),
(2476,163,'Ngiwal','NW',1),
(2477,163,'Peleliu','PE',1),
(2478,163,'Sonsorol','SO',1),
(2479,164,'Bocas del Toro','BT',1),
(2480,164,'Chiriqui','CH',1),
(2481,164,'Cocle','CC',1),
(2482,164,'Colon','CL',1),
(2483,164,'Darien','DA',1),
(2484,164,'Herrera','HE',1),
(2485,164,'Los Santos','LS',1),
(2486,164,'Panama','PA',1),
(2487,164,'San Blas','SB',1),
(2488,164,'Veraguas','VG',1),
(2489,165,'Bougainville','BV',1),
(2490,165,'Central','CE',1),
(2491,165,'Chimbu','CH',1),
(2492,165,'Eastern Highlands','EH',1),
(2493,165,'East New Britain','EB',1),
(2494,165,'East Sepik','ES',1),
(2495,165,'Enga','EN',1),
(2496,165,'Gulf','GU',1),
(2497,165,'Madang','MD',1),
(2498,165,'Manus','MN',1),
(2499,165,'Milne Bay','MB',1),
(2500,165,'Morobe','MR',1),
(2501,165,'National Capital','NC',1),
(2502,165,'New Ireland','NI',1),
(2503,165,'Northern','NO',1),
(2504,165,'Sandaun','SA',1),
(2505,165,'Southern Highlands','SH',1),
(2506,165,'Western','WE',1),
(2507,165,'Western Highlands','WH',1),
(2508,165,'West New Britain','WB',1),
(2509,166,'Alto Paraguay','AG',1),
(2510,166,'Alto Parana','AN',1),
(2511,166,'Amambay','AM',1),
(2512,166,'Asuncion','AS',1),
(2513,166,'Boqueron','BO',1),
(2514,166,'Caaguazu','CG',1),
(2515,166,'Caazapa','CZ',1),
(2516,166,'Canindeyu','CN',1),
(2517,166,'Central','CE',1),
(2518,166,'Concepcion','CC',1),
(2519,166,'Cordillera','CD',1),
(2520,166,'Guaira','GU',1),
(2521,166,'Itapua','IT',1),
(2522,166,'Misiones','MI',1),
(2523,166,'Neembucu','NE',1),
(2524,166,'Paraguari','PA',1),
(2525,166,'Presidente Hayes','PH',1),
(2526,166,'San Pedro','SP',1),
(2527,167,'Amazonas','AM',1),
(2528,167,'Ancash','AN',1),
(2529,167,'Apurimac','AP',1),
(2530,167,'Arequipa','AR',1),
(2531,167,'Ayacucho','AY',1),
(2532,167,'Cajamarca','CJ',1),
(2533,167,'Callao','CL',1),
(2534,167,'Cusco','CU',1),
(2535,167,'Huancavelica','HV',1),
(2536,167,'Huanuco','HO',1),
(2537,167,'Ica','IC',1),
(2538,167,'Junin','JU',1),
(2539,167,'La Libertad','LD',1),
(2540,167,'Lambayeque','LY',1),
(2541,167,'Lima','LI',1),
(2542,167,'Loreto','LO',1),
(2543,167,'Madre de Dios','MD',1),
(2544,167,'Moquegua','MO',1),
(2545,167,'Pasco','PA',1),
(2546,167,'Piura','PI',1),
(2547,167,'Puno','PU',1),
(2548,167,'San Martin','SM',1),
(2549,167,'Tacna','TA',1),
(2550,167,'Tumbes','TU',1),
(2551,167,'Ucayali','UC',1),
(2552,168,'Abra','ABR',1),
(2553,168,'Agusan del Norte','ANO',1),
(2554,168,'Agusan del Sur','ASU',1),
(2555,168,'Aklan','AKL',1),
(2556,168,'Albay','ALB',1),
(2557,168,'Antique','ANT',1),
(2558,168,'Apayao','APY',1),
(2559,168,'Aurora','AUR',1),
(2560,168,'Basilan','BAS',1),
(2561,168,'Bataan','BTA',1),
(2562,168,'Batanes','BTE',1),
(2563,168,'Batangas','BTG',1),
(2564,168,'Biliran','BLR',1),
(2565,168,'Benguet','BEN',1),
(2566,168,'Bohol','BOL',1),
(2567,168,'Bukidnon','BUK',1),
(2568,168,'Bulacan','BUL',1),
(2569,168,'Cagayan','CAG',1),
(2570,168,'Camarines Norte','CNO',1),
(2571,168,'Camarines Sur','CSU',1),
(2572,168,'Camiguin','CAM',1),
(2573,168,'Capiz','CAP',1),
(2574,168,'Catanduanes','CAT',1),
(2575,168,'Cavite','CAV',1),
(2576,168,'Cebu','CEB',1),
(2577,168,'Compostela','CMP',1),
(2578,168,'Davao del Norte','DNO',1),
(2579,168,'Davao del Sur','DSU',1),
(2580,168,'Davao Oriental','DOR',1),
(2581,168,'Eastern Samar','ESA',1),
(2582,168,'Guimaras','GUI',1),
(2583,168,'Ifugao','IFU',1),
(2584,168,'Ilocos Norte','INO',1),
(2585,168,'Ilocos Sur','ISU',1),
(2586,168,'Iloilo','ILO',1),
(2587,168,'Isabela','ISA',1),
(2588,168,'Kalinga','KAL',1),
(2589,168,'Laguna','LAG',1),
(2590,168,'Lanao del Norte','LNO',1),
(2591,168,'Lanao del Sur','LSU',1),
(2592,168,'La Union','UNI',1),
(2593,168,'Leyte','LEY',1),
(2594,168,'Maguindanao','MAG',1),
(2595,168,'Marinduque','MRN',1),
(2596,168,'Masbate','MSB',1),
(2597,168,'Mindoro Occidental','MIC',1),
(2598,168,'Mindoro Oriental','MIR',1),
(2599,168,'Misamis Occidental','MSC',1),
(2600,168,'Misamis Oriental','MOR',1),
(2601,168,'Mountain','MOP',1),
(2602,168,'Negros Occidental','NOC',1),
(2603,168,'Negros Oriental','NOR',1),
(2604,168,'North Cotabato','NCT',1),
(2605,168,'Northern Samar','NSM',1),
(2606,168,'Nueva Ecija','NEC',1),
(2607,168,'Nueva Vizcaya','NVZ',1),
(2608,168,'Palawan','PLW',1),
(2609,168,'Pampanga','PMP',1),
(2610,168,'Pangasinan','PNG',1),
(2611,168,'Quezon','QZN',1),
(2612,168,'Quirino','QRN',1),
(2613,168,'Rizal','RIZ',1),
(2614,168,'Romblon','ROM',1),
(2615,168,'Samar','SMR',1),
(2616,168,'Sarangani','SRG',1),
(2617,168,'Siquijor','SQJ',1),
(2618,168,'Sorsogon','SRS',1),
(2619,168,'South Cotabato','SCO',1),
(2620,168,'Southern Leyte','SLE',1),
(2621,168,'Sultan Kudarat','SKU',1),
(2622,168,'Sulu','SLU',1),
(2623,168,'Surigao del Norte','SNO',1),
(2624,168,'Surigao del Sur','SSU',1),
(2625,168,'Tarlac','TAR',1),
(2626,168,'Tawi-Tawi','TAW',1),
(2627,168,'Zambales','ZBL',1),
(2628,168,'Zamboanga del Norte','ZNO',1),
(2629,168,'Zamboanga del Sur','ZSU',1),
(2630,168,'Zamboanga Sibugay','ZSI',1),
(2631,170,'Dolnoslaskie','02',1),
(2632,170,'Kujawsko-Pomorskie','94',1),
(2633,170,'Lodzkie','10',1),
(2634,170,'Lubelskie','06',1),
(2635,170,'Lubuskie','08',1),
(2636,170,'Malopolskie','12',1),
(2637,170,'Mazowieckie','14',1),
(2638,170,'Opolskie','16',1),
(2639,170,'Podkarpackie','18',1),
(2640,170,'Podlaskie','20',1),
(2641,170,'Pomorskie','22',1),
(2642,170,'Slaskie','24',1),
(2643,170,'Swietokrzyskie','26',1),
(2644,170,'Warminsko-Mazurskie','28',1),
(2645,170,'Wielkopolskie','30',1),
(2646,170,'Zachodniopomorskie','32',1),
(2647,198,'Saint Pierre','P',1),
(2648,198,'Miquelon','M',1),
(2649,171,'A&ccedil;ores','20',1),
(2650,171,'Aveiro','01',1),
(2651,171,'Beja','02',1),
(2652,171,'Braga','03',1),
(2653,171,'Bragan&ccedil;a','04',1),
(2654,171,'Castelo Branco','05',1),
(2655,171,'Coimbra','06',1),
(2656,171,'&Eacute;vora','07',1),
(2657,171,'Faro','08',1),
(2658,171,'Guarda','09',1),
(2659,171,'Leiria','10',1),
(2660,171,'Lisboa','11',1),
(2661,171,'Madeira','30',1),
(2662,171,'Portalegre','12',1),
(2663,171,'Porto','13',1),
(2664,171,'Santar&eacute;m','14',1),
(2665,171,'Set&uacute;bal','15',1),
(2666,171,'Viana do Castelo','16',1),
(2667,171,'Vila Real','17',1),
(2668,171,'Viseu','VI',1),
(2669,173,'Ad Dawhah','DW',1),
(2670,173,'Al Ghuwayriyah','GW',1),
(2671,173,'Al Jumayliyah','JM',1),
(2672,173,'Al Khawr','KR',1),
(2673,173,'Al Wakrah','WK',1),
(2674,173,'Ar Rayyan','RN',1),
(2675,173,'Jarayan al Batinah','JB',1),
(2676,173,'Madinat ash Shamal','MS',1),
(2677,173,'Umm Sa\'id','UD',1),
(2678,173,'Umm Salal','UL',1),
(2679,175,'Alba','AB',1),
(2680,175,'Arad','AR',1),
(2681,175,'Argeș','AG',1),
(2682,175,'Bacău','BC',1),
(2683,175,'Bihor','BH',1),
(2684,175,'Bistrița-Năsăud','BN',1),
(2685,175,'Botoșani','BT',1),
(2686,175,'Brașov','BV',1),
(2687,175,'Brăila','BR',1),
(2688,175,'București','B',1),
(2689,175,'Buzău','BZ',1),
(2690,175,'Caraș-Severin','CS',1),
(2691,175,'Călărași','CL',1),
(2692,175,'Cluj','CJ',1),
(2693,175,'Constanța','CT',1),
(2694,175,'Covasna','CV',1),
(2695,175,'Dâmbovița','DB',1),
(2696,175,'Dolj','DJ',1),
(2697,175,'Galați','GL',1),
(2698,175,'Giurgiu','GR',1),
(2699,175,'Gorj','GJ',1),
(2700,175,'Harghita','HR',1),
(2701,175,'Hunedoara','HD',1),
(2702,175,'Ialomița','IL',1),
(2703,175,'Iași','IS',1),
(2704,175,'Ilfov','IF',1),
(2705,175,'Maramureș','MM',1),
(2706,175,'Mehedinți','MH',1),
(2707,175,'Mureș','MS',1),
(2708,175,'Neamț','NT',1),
(2709,175,'Olt','OT',1),
(2710,175,'Prahova','PH',1),
(2711,175,'Satu-Mare','SM',1),
(2712,175,'Sălaj','SJ',1),
(2713,175,'Sibiu','SB',1),
(2714,175,'Suceava','SV',1),
(2715,175,'Teleorman','TR',1),
(2716,175,'Timiș','TM',1),
(2717,175,'Tulcea','TL',1),
(2718,175,'Vaslui','VS',1),
(2719,175,'Vâlcea','VL',1),
(2720,175,'Vrancea','VN',1),
(2809,177,'Butare','BU',1),
(2810,177,'Byumba','BY',1),
(2811,177,'Cyangugu','CY',1),
(2812,177,'Gikongoro','GK',1),
(2813,177,'Gisenyi','GS',1),
(2814,177,'Gitarama','GT',1),
(2815,177,'Kibungo','KG',1),
(2816,177,'Kibuye','KY',1),
(2817,177,'Kigali Rurale','KR',1),
(2818,177,'Kigali-ville','KV',1),
(2819,177,'Ruhengeri','RU',1),
(2820,177,'Umutara','UM',1),
(2821,178,'Christ Church Nichola Town','CCN',1),
(2822,178,'Saint Anne Sandy Point','SAS',1),
(2823,178,'Saint George Basseterre','SGB',1),
(2824,178,'Saint George Gingerland','SGG',1),
(2825,178,'Saint James Windward','SJW',1),
(2826,178,'Saint John Capesterre','SJC',1),
(2827,178,'Saint John Figtree','SJF',1),
(2828,178,'Saint Mary Cayon','SMC',1),
(2829,178,'Saint Paul Capesterre','CAP',1),
(2830,178,'Saint Paul Charlestown','CHA',1),
(2831,178,'Saint Peter Basseterre','SPB',1),
(2832,178,'Saint Thomas Lowland','STL',1),
(2833,178,'Saint Thomas Middle Island','STM',1),
(2834,178,'Trinity Palmetto Point','TPP',1),
(2835,179,'Anse-la-Raye','AR',1),
(2836,179,'Castries','CA',1),
(2837,179,'Choiseul','CH',1),
(2838,179,'Dauphin','DA',1),
(2839,179,'Dennery','DE',1),
(2840,179,'Gros-Islet','GI',1),
(2841,179,'Laborie','LA',1),
(2842,179,'Micoud','MI',1),
(2843,179,'Praslin','PR',1),
(2844,179,'Soufriere','SO',1),
(2845,179,'Vieux-Fort','VF',1),
(2846,180,'Charlotte','C',1),
(2847,180,'Grenadines','R',1),
(2848,180,'Saint Andrew','A',1),
(2849,180,'Saint David','D',1),
(2850,180,'Saint George','G',1),
(2851,180,'Saint Patrick','P',1),
(2852,181,'A\'ana','AN',1),
(2853,181,'Aiga-i-le-Tai','AI',1),
(2854,181,'Atua','AT',1),
(2855,181,'Fa\'asaleleaga','FA',1),
(2856,181,'Gaga\'emauga','GE',1),
(2857,181,'Gagaifomauga','GF',1),
(2858,181,'Palauli','PA',1),
(2859,181,'Satupa\'itea','SA',1),
(2860,181,'Tuamasaga','TU',1),
(2861,181,'Va\'a-o-Fonoti','VF',1),
(2862,181,'Vaisigano','VS',1),
(2863,182,'Acquaviva','AC',1),
(2864,182,'Borgo Maggiore','BM',1),
(2865,182,'Chiesanuova','CH',1),
(2866,182,'Domagnano','DO',1),
(2867,182,'Faetano','FA',1),
(2868,182,'Fiorentino','FI',1),
(2869,182,'Montegiardino','MO',1),
(2870,182,'Citta di San Marino','SM',1),
(2871,182,'Serravalle','SE',1),
(2872,183,'Sao Tome','S',1),
(2873,183,'Principe','P',1),
(2874,184,'Al Bahah','BH',1),
(2875,184,'Al Hudud ash Shamaliyah','HS',1),
(2876,184,'Al Jawf','JF',1),
(2877,184,'Al Madinah','MD',1),
(2878,184,'Al Qasim','QS',1),
(2879,184,'Ar Riyad','RD',1),
(2880,184,'Ash Sharqiyah (Eastern)','AQ',1),
(2881,184,'\'Asir','AS',1),
(2882,184,'Ha\'il','HL',1),
(2883,184,'Jizan','JZ',1),
(2884,184,'Makkah','ML',1),
(2885,184,'Najran','NR',1),
(2886,184,'Tabuk','TB',1),
(2887,185,'Dakar','DA',1),
(2888,185,'Diourbel','DI',1),
(2889,185,'Fatick','FA',1),
(2890,185,'Kaolack','KA',1),
(2891,185,'Kolda','KO',1),
(2892,185,'Louga','LO',1),
(2893,185,'Matam','MA',1),
(2894,185,'Saint-Louis','SL',1),
(2895,185,'Tambacounda','TA',1),
(2896,185,'Thies','TH',1),
(2897,185,'Ziguinchor','ZI',1),
(2898,186,'Anse aux Pins','AP',1),
(2899,186,'Anse Boileau','AB',1),
(2900,186,'Anse Etoile','AE',1),
(2901,186,'Anse Louis','AL',1),
(2902,186,'Anse Royale','AR',1),
(2903,186,'Baie Lazare','BL',1),
(2904,186,'Baie Sainte Anne','BS',1),
(2905,186,'Beau Vallon','BV',1),
(2906,186,'Bel Air','BA',1),
(2907,186,'Bel Ombre','BO',1),
(2908,186,'Cascade','CA',1),
(2909,186,'Glacis','GL',1),
(2910,186,'Grand\' Anse (on Mahe)','GM',1),
(2911,186,'Grand\' Anse (on Praslin)','GP',1),
(2912,186,'La Digue','DG',1),
(2913,186,'La Riviere Anglaise','RA',1),
(2914,186,'Mont Buxton','MB',1),
(2915,186,'Mont Fleuri','MF',1),
(2916,186,'Plaisance','PL',1),
(2917,186,'Pointe La Rue','PR',1),
(2918,186,'Port Glaud','PG',1),
(2919,186,'Saint Louis','SL',1),
(2920,186,'Takamaka','TA',1),
(2921,187,'Eastern','E',1),
(2922,187,'Northern','N',1),
(2923,187,'Southern','S',1),
(2924,187,'Western','W',1),
(2925,189,'Banskobystrický','BC',1),
(2926,189,'Bratislavský','BL',1),
(2927,189,'Košický','KI',1),
(2928,189,'Nitriansky','NI',1),
(2929,189,'Prešovský','PV',1),
(2930,189,'Trenčiansky','TC',1),
(2931,189,'Trnavský','TA',1),
(2932,189,'Žilinský','ZI',1),
(2933,191,'Central','CE',1),
(2934,191,'Choiseul','CH',1),
(2935,191,'Guadalcanal','GC',1),
(2936,191,'Honiara','HO',1),
(2937,191,'Isabel','IS',1),
(2938,191,'Makira','MK',1),
(2939,191,'Malaita','ML',1),
(2940,191,'Rennell and Bellona','RB',1),
(2941,191,'Temotu','TM',1),
(2942,191,'Western','WE',1),
(2943,192,'Awdal','AW',1),
(2944,192,'Bakool','BK',1),
(2945,192,'Banaadir','BN',1),
(2946,192,'Bari','BR',1),
(2947,192,'Bay','BY',1),
(2948,192,'Galguduud','GA',1),
(2949,192,'Gedo','GE',1),
(2950,192,'Hiiraan','HI',1),
(2951,192,'Jubbada Dhexe','JD',1),
(2952,192,'Jubbada Hoose','JH',1),
(2953,192,'Mudug','MU',1),
(2954,192,'Nugaal','NU',1),
(2955,192,'Sanaag','SA',1),
(2956,192,'Shabeellaha Dhexe','SD',1),
(2957,192,'Shabeellaha Hoose','SH',1),
(2958,192,'Sool','SL',1),
(2959,192,'Togdheer','TO',1),
(2960,192,'Woqooyi Galbeed','WG',1),
(2961,193,'Eastern Cape','EC',1),
(2962,193,'Free State','FS',1),
(2963,193,'Gauteng','GP',1),
(2964,193,'KwaZulu-Natal','KZN',1),
(2965,193,'Limpopo','LP',1),
(2966,193,'Mpumalanga','MP',1),
(2967,193,'North West','NW',1),
(2968,193,'Northern Cape','NC',1),
(2969,193,'Western Cape','WC',1),
(2970,195,'La Coru&ntilde;a','C',1),
(2971,195,'&Aacute;lava','VI',1),
(2972,195,'Albacete','AB',1),
(2973,195,'Alicante','A',1),
(2974,195,'Almeria','AL',1),
(2975,195,'Asturias','O',1),
(2976,195,'&Aacute;vila','AV',1),
(2977,195,'Badajoz','BA',1),
(2978,195,'Baleares','IB',1),
(2979,195,'Barcelona','B',1),
(2980,195,'Burgos','BU',1),
(2981,195,'C&aacute;ceres','CC',1),
(2982,195,'C&aacute;diz','CA',1),
(2983,195,'Cantabria','S',1),
(2984,195,'Castell&oacute;n','CS',1),
(2985,195,'Ceuta','CE',1),
(2986,195,'Ciudad Real','CR',1),
(2987,195,'C&oacute;rdoba','CO',1),
(2988,195,'Cuenca','CU',1),
(2989,195,'Girona','GI',1),
(2990,195,'Granada','GR',1),
(2991,195,'Guadalajara','GU',1),
(2992,195,'Guip&uacute;zcoa','SS',1),
(2993,195,'Huelva','H',1),
(2994,195,'Huesca','HU',1),
(2995,195,'Ja&eacute;n','J',1),
(2996,195,'La Rioja','LO',1),
(2997,195,'Las Palmas','GC',1),
(2998,195,'Leon','CL',1),
(2999,195,'Lleida','L',1),
(3000,195,'Lugo','LU',1),
(3001,195,'Madrid','M',1),
(3002,195,'Malaga','MA',1),
(3003,195,'Melilla','ML',1),
(3004,195,'Murcia','MU',1),
(3005,195,'Navarra','NA',1),
(3006,195,'Ourense','OR',1),
(3007,195,'Palencia','P',1),
(3008,195,'Pontevedra','PO',1),
(3009,195,'Salamanca','SA',1),
(3010,195,'Santa Cruz de Tenerife','TF',1),
(3011,195,'Segovia','SG',1),
(3012,195,'Sevilla','SE',1),
(3013,195,'Soria','SO',1),
(3014,195,'Tarragona','T',1),
(3015,195,'Teruel','TE',1),
(3016,195,'Toledo','TO',1),
(3017,195,'Valencia','V',1),
(3018,195,'Valladolid','VA',1),
(3019,195,'Bizkaia','BI',1),
(3020,195,'Zamora','ZA',1),
(3021,195,'Zaragoza','Z',1),
(3022,196,'Central','CE',1),
(3023,196,'Eastern','EA',1),
(3024,196,'North Central','NC',1),
(3025,196,'Northern','NO',1),
(3026,196,'North Western','NW',1),
(3027,196,'Sabaragamuwa','SA',1),
(3028,196,'Southern','SO',1),
(3029,196,'Uva','UV',1),
(3030,196,'Western','WE',1),
(3032,197,'Saint Helena','S',1),
(3034,199,'A\'ali an Nil','ANL',1),
(3035,199,'Al Bahr al Ahmar','BAM',1),
(3036,199,'Al Buhayrat','BRT',1),
(3037,199,'Al Jazirah','JZR',1),
(3038,199,'Al Khartum','KRT',1),
(3039,199,'Al Qadarif','QDR',1),
(3040,199,'Al Wahdah','WDH',1),
(3041,199,'An Nil al Abyad','ANB',1),
(3042,199,'An Nil al Azraq','ANZ',1),
(3043,199,'Ash Shamaliyah','ASH',1),
(3044,199,'Bahr al Jabal','BJA',1),
(3045,199,'Gharb al Istiwa\'iyah','GIS',1),
(3046,199,'Gharb Bahr al Ghazal','GBG',1),
(3047,199,'Gharb Darfur','GDA',1),
(3048,199,'Gharb Kurdufan','GKU',1),
(3049,199,'Janub Darfur','JDA',1),
(3050,199,'Janub Kurdufan','JKU',1),
(3051,199,'Junqali','JQL',1),
(3052,199,'Kassala','KSL',1),
(3053,199,'Nahr an Nil','NNL',1),
(3054,199,'Shamal Bahr al Ghazal','SBG',1),
(3055,199,'Shamal Darfur','SDA',1),
(3056,199,'Shamal Kurdufan','SKU',1),
(3057,199,'Sharq al Istiwa\'iyah','SIS',1),
(3058,199,'Sinnar','SNR',1),
(3059,199,'Warab','WRB',1),
(3060,200,'Brokopondo','BR',1),
(3061,200,'Commewijne','CM',1),
(3062,200,'Coronie','CR',1),
(3063,200,'Marowijne','MA',1),
(3064,200,'Nickerie','NI',1),
(3065,200,'Para','PA',1),
(3066,200,'Paramaribo','PM',1),
(3067,200,'Saramacca','SA',1),
(3068,200,'Sipaliwini','SI',1),
(3069,200,'Wanica','WA',1),
(3070,202,'Hhohho','H',1),
(3071,202,'Lubombo','L',1),
(3072,202,'Manzini','M',1),
(3073,202,'Shishelweni','S',1),
(3074,203,'Blekinge','K',1),
(3075,203,'Dalarna','W',1),
(3076,203,'Gävleborg','X',1),
(3077,203,'Gotland','I',1),
(3078,203,'Halland','N',1),
(3079,203,'Jämtland','Z',1),
(3080,203,'Jönköping','F',1),
(3081,203,'Kalmar','H',1),
(3082,203,'Kronoberg','G',1),
(3083,203,'Norrbotten','BD',1),
(3084,203,'Örebro','T',1),
(3085,203,'Östergötland','E',1),
(3086,203,'Sk&aring;ne','M',1),
(3087,203,'Södermanland','D',1),
(3088,203,'Stockholm','AB',1),
(3089,203,'Uppsala','C',1),
(3090,203,'Värmland','S',1),
(3091,203,'Västerbotten','AC',1),
(3092,203,'Västernorrland','Y',1),
(3093,203,'Västmanland','U',1),
(3094,203,'Västra Götaland','O',1),
(3095,204,'Aargau','AG',1),
(3096,204,'Appenzell Ausserrhoden','AR',1),
(3097,204,'Appenzell Innerrhoden','AI',1),
(3098,204,'Basel-Stadt','BS',1),
(3099,204,'Basel-Landschaft','BL',1),
(3100,204,'Bern','BE',1),
(3101,204,'Fribourg','FR',1),
(3102,204,'Gen&egrave;ve','GE',1),
(3103,204,'Glarus','GL',1),
(3104,204,'Graubünden','GR',1),
(3105,204,'Jura','JU',1),
(3106,204,'Luzern','LU',1),
(3107,204,'Neuch&acirc;tel','NE',1),
(3108,204,'Nidwald','NW',1),
(3109,204,'Obwald','OW',1),
(3110,204,'St. Gallen','SG',1),
(3111,204,'Schaffhausen','SH',1),
(3112,204,'Schwyz','SZ',1),
(3113,204,'Solothurn','SO',1),
(3114,204,'Thurgau','TG',1),
(3115,204,'Ticino','TI',1),
(3116,204,'Uri','UR',1),
(3117,204,'Valais','VS',1),
(3118,204,'Vaud','VD',1),
(3119,204,'Zug','ZG',1),
(3120,204,'Zürich','ZH',1),
(3121,205,'Al Hasakah','HA',1),
(3122,205,'Al Ladhiqiyah','LA',1),
(3123,205,'Al Qunaytirah','QU',1),
(3124,205,'Ar Raqqah','RQ',1),
(3125,205,'As Suwayda','SU',1),
(3126,205,'Dara','DA',1),
(3127,205,'Dayr az Zawr','DZ',1),
(3128,205,'Dimashq','DI',1),
(3129,205,'Halab','HL',1),
(3130,205,'Hamah','HM',1),
(3131,205,'Hims','HI',1),
(3132,205,'Idlib','ID',1),
(3133,205,'Rif Dimashq','RD',1),
(3134,205,'Tartus','TA',1),
(3135,206,'Chang-hua','CH',1),
(3136,206,'Chia-i','CI',1),
(3137,206,'Hsin-chu','HS',1),
(3138,206,'Hua-lien','HL',1),
(3139,206,'I-lan','IL',1),
(3140,206,'Kao-hsiung county','KH',1),
(3141,206,'Kin-men','KM',1),
(3142,206,'Lien-chiang','LC',1),
(3143,206,'Miao-li','ML',1),
(3144,206,'Nan-t\'ou','NT',1),
(3145,206,'P\'eng-hu','PH',1),
(3146,206,'P\'ing-tung','PT',1),
(3147,206,'T\'ai-chung','TG',1),
(3148,206,'T\'ai-nan','TA',1),
(3149,206,'T\'ai-pei county','TP',1),
(3150,206,'T\'ai-tung','TT',1),
(3151,206,'T\'ao-yuan','TY',1),
(3152,206,'Yun-lin','YL',1),
(3153,206,'Chia-i city','CC',1),
(3154,206,'Chi-lung','CL',1),
(3155,206,'Hsin-chu','HC',1),
(3156,206,'T\'ai-chung','TH',1),
(3157,206,'T\'ai-nan','TN',1),
(3158,206,'Kao-hsiung city','KC',1),
(3159,206,'T\'ai-pei city','TC',1),
(3160,207,'Gorno-Badakhstan','GB',1),
(3161,207,'Khatlon','KT',1),
(3162,207,'Sughd','SU',1),
(3163,208,'Arusha','AR',1),
(3164,208,'Dar es Salaam','DS',1),
(3165,208,'Dodoma','DO',1),
(3166,208,'Iringa','IR',1),
(3167,208,'Kagera','KA',1),
(3168,208,'Kigoma','KI',1),
(3169,208,'Kilimanjaro','KJ',1),
(3170,208,'Lindi','LN',1),
(3171,208,'Manyara','MY',1),
(3172,208,'Mara','MR',1),
(3173,208,'Mbeya','MB',1),
(3174,208,'Morogoro','MO',1),
(3175,208,'Mtwara','MT',1),
(3176,208,'Mwanza','MW',1),
(3177,208,'Pemba North','PN',1),
(3178,208,'Pemba South','PS',1),
(3179,208,'Pwani','PW',1),
(3180,208,'Rukwa','RK',1),
(3181,208,'Ruvuma','RV',1),
(3182,208,'Shinyanga','SH',1),
(3183,208,'Singida','SI',1),
(3184,208,'Tabora','TB',1),
(3185,208,'Tanga','TN',1),
(3186,208,'Zanzibar Central/South','ZC',1),
(3187,208,'Zanzibar North','ZN',1),
(3188,208,'Zanzibar Urban/West','ZU',1),
(3189,209,'Amnat Charoen','37',1),
(3190,209,'Ang Thong','15',1),
(3192,209,'Bangkok','10',1),
(3193,209,'Buri Ram','31',1),
(3194,209,'Chachoengsao','24',1),
(3195,209,'Chai Nat','18',1),
(3196,209,'Chaiyaphum','36',1),
(3197,209,'Chanthaburi','22',1),
(3198,209,'Chiang Mai','50',1),
(3199,209,'Chiang Rai','57',1),
(3200,209,'Chon Buri','20',1),
(3201,209,'Chumphon','86',1),
(3202,209,'Kalasin','46',1),
(3203,209,'Kamphaeng Phet','62',1),
(3204,209,'Kanchanaburi','71',1),
(3205,209,'Khon Kaen','40',1),
(3206,209,'Krabi','81',1),
(3207,209,'Lampang','52',1),
(3208,209,'Lamphun','51',1),
(3209,209,'Loei','42',1),
(3210,209,'Lop Buri','1',1),
(3211,209,'Mae Hong Son','55',1),
(3212,209,'Maha Sarakham','44',1),
(3213,209,'Mukdahan','49',1),
(3214,209,'Nakhon Nayok','26',1),
(3215,209,'Nakhon Pathom','73',1),
(3216,209,'Nakhon Phanom','48',1),
(3217,209,'Nakhon Ratchasima','30',1),
(3218,209,'Nakhon Sawan','60',1),
(3219,209,'Nakhon Si Thammarat','80',1),
(3220,209,'Nan','55',1),
(3221,209,'Narathiwat','96',1),
(3222,209,'Nong Bua Lamphu','39',1),
(3223,209,'Nong Khai','43',1),
(3224,209,'Nonthaburi','12',1),
(3225,209,'Pathum Thani','13',1),
(3226,209,'Pattani','94',1),
(3227,209,'Phangnga','82',1),
(3228,209,'Phatthalung','93',1),
(3229,209,'Phayao','Phayao',1),
(3230,209,'Phetchabun','67',1),
(3231,209,'Phetchaburi','76',1),
(3232,209,'Phichit','66',1),
(3233,209,'Phitsanulok','65',1),
(3234,209,'Phrae','54',1),
(3235,209,'Phuket','83',1),
(3236,209,'Prachin Buri','25',1),
(3237,209,'Prachuap Khiri Khan','77',1),
(3238,209,'Ranong','21',1),
(3239,209,'Ratchaburi','70',1),
(3240,209,'Rayong','21',1),
(3241,209,'Roi Et','45',1),
(3242,209,'Sa Kaeo','27',1),
(3243,209,'Sakon Nakhon','47',1),
(3244,209,'Samut Prakan','11',1),
(3245,209,'Samut Sakhon','74',1),
(3246,209,'Samut Songkhram','75',1),
(3247,209,'Saraburi','19',1),
(3248,209,'Satun','91',1),
(3249,209,'Sing Buri','17',1),
(3250,209,'Si Sa Ket','33',1),
(3251,209,'Songkhla','90',1),
(3252,209,'Sukhothai','64',1),
(3253,209,'Suphan Buri','72',1),
(3254,209,'Surat Thani','84',1),
(3255,209,'Surin','32',1),
(3256,209,'Tak','63',1),
(3257,209,'Trang','92',1),
(3258,209,'Trat','23',1),
(3259,209,'Ubon Ratchathani','34',1),
(3260,209,'Udon Thani','41',1),
(3261,209,'Uthai Thani','61',1),
(3262,209,'Uttaradit','53',1),
(3263,209,'Yala','95',1),
(3264,209,'Yasothon','35',1),
(3265,210,'Kara','K',1),
(3266,210,'Plateaux','P',1),
(3267,210,'Savanes','S',1),
(3268,210,'Centrale','C',1),
(3269,210,'Maritime','M',1),
(3270,211,'Atafu','A',1),
(3271,211,'Fakaofo','F',1),
(3272,211,'Nukunonu','N',1),
(3273,212,'Ha\'apai','H',1),
(3274,212,'Tongatapu','T',1),
(3275,212,'Vava\'u','V',1),
(3276,213,'Couva/Tabaquite/Talparo','CT',1),
(3277,213,'Diego Martin','DM',1),
(3278,213,'Mayaro/Rio Claro','MR',1),
(3279,213,'Penal/Debe','PD',1),
(3280,213,'Princes Town','PT',1),
(3281,213,'Sangre Grande','SG',1),
(3282,213,'San Juan/Laventille','SL',1),
(3283,213,'Siparia','SI',1),
(3284,213,'Tunapuna/Piarco','TP',1),
(3285,213,'Port of Spain','PS',1),
(3286,213,'San Fernando','SF',1),
(3287,213,'Arima','AR',1),
(3288,213,'Point Fortin','PF',1),
(3289,213,'Chaguanas','CH',1),
(3290,213,'Tobago','TO',1),
(3291,214,'Ariana','AR',1),
(3292,214,'Beja','BJ',1),
(3293,214,'Ben Arous','BA',1),
(3294,214,'Bizerte','BI',1),
(3295,214,'Gabes','GB',1),
(3296,214,'Gafsa','GF',1),
(3297,214,'Jendouba','JE',1),
(3298,214,'Kairouan','KR',1),
(3299,214,'Kasserine','KS',1),
(3300,214,'Kebili','KB',1),
(3301,214,'Kef','KF',1),
(3302,214,'Mahdia','MH',1),
(3303,214,'Manouba','MN',1),
(3304,214,'Medenine','ME',1),
(3305,214,'Monastir','MO',1),
(3306,214,'Nabeul','NA',1),
(3307,214,'Sfax','SF',1),
(3308,214,'Sidi','SD',1),
(3309,214,'Siliana','SL',1),
(3310,214,'Sousse','SO',1),
(3311,214,'Tataouine','TA',1),
(3312,214,'Tozeur','TO',1),
(3313,214,'Tunis','TU',1),
(3314,214,'Zaghouan','ZA',1),
(3315,215,'Adana','TR-01',1),
(3316,215,'Adıyaman','TR-02',1),
(3317,215,'Afyonkarahisar','TR-03',1),
(3318,215,'Ağrı','TR-04',1),
(3319,215,'Aksaray','TR-68',1),
(3320,215,'Amasya','TR-05',1),
(3321,215,'Ankara','TR-06',1),
(3322,215,'Antalya','TR-07',1),
(3323,215,'Ardahan','TR-75',1),
(3324,215,'Artvin','TR-08',1),
(3325,215,'Aydın','TR-09',1),
(3326,215,'Balıkesir','TR-10',1),
(3327,215,'Bartın','TR-74',1),
(3328,215,'Batman','TR-72',1),
(3329,215,'Bayburt','TR-69',1),
(3330,215,'Bilecik','TR-11',1),
(3331,215,'Bingöl','TR-12',1),
(3332,215,'Bitlis','TR-13',1),
(3333,215,'Bolu','TR-14',1),
(3334,215,'Burdur','TR-15',1),
(3335,215,'Bursa','TR-16',1),
(3336,215,'Çanakkale','TR-17',1),
(3337,215,'Çankırı','TR-18',1),
(3338,215,'Çorum','TR-19',1),
(3339,215,'Denizli','TR-20',1),
(3340,215,'Diyarbakır','TR-21',1),
(3341,215,'Düzce','TR-81',1),
(3342,215,'Edirne','TR-22',1),
(3343,215,'Elazığ','TR-23',1),
(3344,215,'Erzincan','TR-24',1),
(3345,215,'Erzurum','TR-25',1),
(3346,215,'Eskişehir','TR-26',1),
(3347,215,'Gaziantep','TR-27',1),
(3348,215,'Giresun','TR-28',1),
(3349,215,'Gümüşhane','TR-29',1),
(3350,215,'Hakkari','TR-30',1),
(3351,215,'Hatay','TR-31',1),
(3352,215,'Iğdır','TR-76',1),
(3353,215,'Isparta','TR-32',1),
(3354,215,'İstanbul','TR-34',1),
(3355,215,'İzmir','TR-35',1),
(3356,215,'Kahramanmaraş','TR-46',1),
(3357,215,'Karabük','TR-78',1),
(3358,215,'Karaman','TR-70',1),
(3359,215,'Kars','TR-36',1),
(3360,215,'Kastamonu','TR-37',1),
(3361,215,'Kayseri','TR-38',1),
(3362,215,'Kilis','TR-79',1),
(3363,215,'Kırıkkale','TR-71',1),
(3364,215,'Kırklareli','TR-39',1),
(3365,215,'Kırşehir','TR-40',1),
(3366,215,'Kocaeli','TR-41',1),
(3367,215,'Konya','TR-42',1),
(3368,215,'Kütahya','TR-43',1),
(3369,215,'Malatya','TR-44',1),
(3370,215,'Manisa','TR-45',1),
(3371,215,'Mardin','TR-47',1),
(3372,215,'Mersin','TR-33',1),
(3373,215,'Muğla','TR-48',1),
(3374,215,'Muş','TR-49',1),
(3375,215,'Nevşehir','TR-50',1),
(3376,215,'Niğde','TR-51',1),
(3377,215,'Ordu','TR-52',1),
(3378,215,'Osmaniye','TR-80',1),
(3379,215,'Rize','TR-53',1),
(3380,215,'Sakarya','TR-54',1),
(3381,215,'Samsun','TR-55',1),
(3382,215,'Şanlıurfa','TR-63',1),
(3383,215,'Siirt','TR-56',1),
(3384,215,'Sinop','TR-57',1),
(3385,215,'Şırnak','TR-73',1),
(3386,215,'Sivas','TR-58',1),
(3387,215,'Tekirdağ','TR-59',1),
(3388,215,'Tokat','TR-60',1),
(3389,215,'Trabzon','TR-61',1),
(3390,215,'Tunceli','TR-62',1),
(3391,215,'Uşak','TR-64',1),
(3392,215,'Van','TR-65',1),
(3393,215,'Yalova','TR-77',1),
(3394,215,'Yozgat','TR-66',1),
(3395,215,'Zonguldak','TR-67',1),
(3396,216,'Ahal Welayaty','A',1),
(3397,216,'Balkan Welayaty','B',1),
(3398,216,'Dashhowuz Welayaty','D',1),
(3399,216,'Lebap Welayaty','L',1),
(3400,216,'Mary Welayaty','M',1),
(3401,217,'Ambergris Cays','AC',1),
(3402,217,'Dellis Cay','DC',1),
(3403,217,'French Cay','FC',1),
(3404,217,'Little Water Cay','LW',1),
(3405,217,'Parrot Cay','RC',1),
(3406,217,'Pine Cay','PN',1),
(3407,217,'Salt Cay','SL',1),
(3408,217,'Grand Turk','GT',1),
(3409,217,'South Caicos','SC',1),
(3410,217,'East Caicos','EC',1),
(3411,217,'Middle Caicos','MC',1),
(3412,217,'North Caicos','NC',1),
(3413,217,'Providenciales','PR',1),
(3414,217,'West Caicos','WC',1),
(3415,218,'Nanumanga','NMG',1),
(3416,218,'Niulakita','NLK',1),
(3417,218,'Niutao','NTO',1),
(3418,218,'Funafuti','FUN',1),
(3419,218,'Nanumea','NME',1),
(3420,218,'Nui','NUI',1),
(3421,218,'Nukufetau','NFT',1),
(3422,218,'Nukulaelae','NLL',1),
(3423,218,'Vaitupu','VAI',1),
(3424,219,'Kalangala','KAL',1),
(3425,219,'Kampala','KMP',1),
(3426,219,'Kayunga','KAY',1),
(3427,219,'Kiboga','KIB',1),
(3428,219,'Luwero','LUW',1),
(3429,219,'Masaka','MAS',1),
(3430,219,'Mpigi','MPI',1),
(3431,219,'Mubende','MUB',1),
(3432,219,'Mukono','MUK',1),
(3433,219,'Nakasongola','NKS',1),
(3434,219,'Rakai','RAK',1),
(3435,219,'Sembabule','SEM',1),
(3436,219,'Wakiso','WAK',1),
(3437,219,'Bugiri','BUG',1),
(3438,219,'Busia','BUS',1),
(3439,219,'Iganga','IGA',1),
(3440,219,'Jinja','JIN',1),
(3441,219,'Kaberamaido','KAB',1),
(3442,219,'Kamuli','KML',1),
(3443,219,'Kapchorwa','KPC',1),
(3444,219,'Katakwi','KTK',1),
(3445,219,'Kumi','KUM',1),
(3446,219,'Mayuge','MAY',1),
(3447,219,'Mbale','MBA',1),
(3448,219,'Pallisa','PAL',1),
(3449,219,'Sironko','SIR',1),
(3450,219,'Soroti','SOR',1),
(3451,219,'Tororo','TOR',1),
(3452,219,'Adjumani','ADJ',1),
(3453,219,'Apac','APC',1),
(3454,219,'Arua','ARU',1),
(3455,219,'Gulu','GUL',1),
(3456,219,'Kitgum','KIT',1),
(3457,219,'Kotido','KOT',1),
(3458,219,'Lira','LIR',1),
(3459,219,'Moroto','MRT',1),
(3460,219,'Moyo','MOY',1),
(3461,219,'Nakapiripirit','NAK',1),
(3462,219,'Nebbi','NEB',1),
(3463,219,'Pader','PAD',1),
(3464,219,'Yumbe','YUM',1),
(3465,219,'Bundibugyo','BUN',1),
(3466,219,'Bushenyi','BSH',1),
(3467,219,'Hoima','HOI',1),
(3468,219,'Kabale','KBL',1),
(3469,219,'Kabarole','KAR',1),
(3470,219,'Kamwenge','KAM',1),
(3471,219,'Kanungu','KAN',1),
(3472,219,'Kasese','KAS',1),
(3473,219,'Kibaale','KBA',1),
(3474,219,'Kisoro','KIS',1),
(3475,219,'Kyenjojo','KYE',1),
(3476,219,'Masindi','MSN',1),
(3477,219,'Mbarara','MBR',1),
(3478,219,'Ntungamo','NTU',1),
(3479,219,'Rukungiri','RUK',1),
(3480,220,'Cherkaska','23',1),
(3481,220,'Chernihivska','25',1),
(3482,220,'Chernivetska','24',1),
(3483,220,'Avtonomna Respublika Krym','27',1),
(3484,220,'Dnipropetrovska','04',1),
(3485,220,'Donetska','05',1),
(3486,220,'Ivano-Frankivska','09',1),
(3487,220,'Khersonska','21',1),
(3488,220,'Khmelnytska','22',1),
(3489,220,'Kirovohradska','35',1),
(3490,220,'Kyiv','26',1),
(3491,220,'Kyivska','10',1),
(3492,220,'Luhanska','12',1),
(3493,220,'Lvivska','13',1),
(3494,220,'Mykolaivska','14',1),
(3495,220,'Odeska','15',1),
(3496,220,'Poltavska','16',1),
(3497,220,'Rivnenska','17',1),
(3498,220,'Sevastopol','28',1),
(3499,220,'Sumska','18',1),
(3500,220,'Ternopilska','19',1),
(3501,220,'Vinnytska','02',1),
(3502,220,'Volynska','03',1),
(3503,220,'Zakarpatska','07',1),
(3504,220,'Zaporizka','08',1),
(3505,220,'Zhytomyrskа','06',1),
(3506,221,'Abu Dhabi','ADH',1),
(3507,221,'\'Ajman','AJ',1),
(3508,221,'Al Fujayrah','FU',1),
(3509,221,'Ash Shāriqah','SH',1),
(3510,221,'Dubai','DU',1),
(3511,221,'Ra’s al Khaymah','RK',1),
(3512,221,'Umm al Qaywayn','UQ',1),
(3513,222,'Aberdeen','ABN',1),
(3514,222,'Aberdeenshire','ABNS',1),
(3515,222,'Anglesey','ANG',1),
(3516,222,'Angus','AGS',1),
(3517,222,'Argyll and Bute','ARY',1),
(3518,222,'Bedfordshire','BEDS',1),
(3519,222,'Berkshire','BERKS',1),
(3520,222,'Blaenau Gwent','BLA',1),
(3521,222,'Bridgend','BRI',1),
(3522,222,'Bristol','BSTL',1),
(3523,222,'Buckinghamshire','BUCKS',1),
(3524,222,'Caerphilly','CAE',1),
(3525,222,'Cambridgeshire','CAMBS',1),
(3526,222,'Cardiff','CDF',1),
(3527,222,'Carmarthenshire','CARM',1),
(3528,222,'Ceredigion','CDGN',1),
(3529,222,'Cheshire','CHES',1),
(3530,222,'Clackmannanshire','CLACK',1),
(3531,222,'Conwy','CON',1),
(3532,222,'Cornwall','CORN',1),
(3533,222,'Denbighshire','DNBG',1),
(3534,222,'Derbyshire','DERBY',1),
(3535,222,'Devon','DVN',1),
(3536,222,'Dorset','DOR',1),
(3537,222,'Dumfries and Galloway','DGL',1),
(3538,222,'Dundee','DUND',1),
(3539,222,'Durham','DHM',1),
(3540,222,'East Ayrshire','ARYE',1),
(3541,222,'East Dunbartonshire','DUNBE',1),
(3542,222,'East Lothian','LOTE',1),
(3543,222,'East Renfrewshire','RENE',1),
(3544,222,'East Riding of Yorkshire','ERYS',1),
(3545,222,'East Sussex','SXE',1),
(3546,222,'Edinburgh','EDIN',1),
(3547,222,'Essex','ESX',1),
(3548,222,'Falkirk','FALK',1),
(3549,222,'Fife','FFE',1),
(3550,222,'Flintshire','FLINT',1),
(3551,222,'Glasgow','GLAS',1),
(3552,222,'Gloucestershire','GLOS',1),
(3553,222,'Greater London','LDN',1),
(3554,222,'Greater Manchester','MCH',1),
(3555,222,'Gwynedd','GDD',1),
(3556,222,'Hampshire','HANTS',1),
(3557,222,'Herefordshire','HWR',1),
(3558,222,'Hertfordshire','HERTS',1),
(3559,222,'Highlands','HLD',1),
(3560,222,'Inverclyde','IVER',1),
(3561,222,'Isle of Wight','IOW',1),
(3562,222,'Kent','KNT',1),
(3563,222,'Lancashire','LANCS',1),
(3564,222,'Leicestershire','LEICS',1),
(3565,222,'Lincolnshire','LINCS',1),
(3566,222,'Merseyside','MSY',1),
(3567,222,'Merthyr Tydfil','MERT',1),
(3568,222,'Midlothian','MLOT',1),
(3569,222,'Monmouthshire','MMOUTH',1),
(3570,222,'Moray','MORAY',1),
(3571,222,'Neath Port Talbot','NPRTAL',1),
(3572,222,'Newport','NEWPT',1),
(3573,222,'Norfolk','NOR',1),
(3574,222,'North Ayrshire','ARYN',1),
(3575,222,'North Lanarkshire','LANN',1),
(3576,222,'North Yorkshire','YSN',1),
(3577,222,'Northamptonshire','NHM',1),
(3578,222,'Northumberland','NLD',1),
(3579,222,'Nottinghamshire','NOT',1),
(3580,222,'Orkney Islands','ORK',1),
(3581,222,'Oxfordshire','OFE',1),
(3582,222,'Pembrokeshire','PEM',1),
(3583,222,'Perth and Kinross','PERTH',1),
(3584,222,'Powys','PWS',1),
(3585,222,'Renfrewshire','REN',1),
(3586,222,'Rhondda Cynon Taff','RHON',1),
(3587,222,'Rutland','RUT',1),
(3588,222,'Scottish Borders','BOR',1),
(3589,222,'Shetland Islands','SHET',1),
(3590,222,'Shropshire','SPE',1),
(3591,222,'Somerset','SOM',1),
(3592,222,'South Ayrshire','ARYS',1),
(3593,222,'South Lanarkshire','LANS',1),
(3594,222,'South Yorkshire','YSS',1),
(3595,222,'Staffordshire','SFD',1),
(3596,222,'Stirling','STIR',1),
(3597,222,'Suffolk','SFK',1),
(3598,222,'Surrey','SRY',1),
(3599,222,'Swansea','SWAN',1),
(3600,222,'Torfaen','TORF',1),
(3601,222,'Tyne and Wear','TWR',1),
(3602,222,'Vale of Glamorgan','VGLAM',1),
(3603,222,'Warwickshire','WARKS',1),
(3604,222,'West Dunbartonshire','WDUN',1),
(3605,222,'West Lothian','WLOT',1),
(3606,222,'West Midlands','WMD',1),
(3607,222,'West Sussex','SXW',1),
(3608,222,'West Yorkshire','YSW',1),
(3609,222,'Western Isles','WIL',1),
(3610,222,'Wiltshire','WLT',1),
(3611,222,'Worcestershire','WORCS',1),
(3612,222,'Wrexham','WRX',1),
(3613,223,'Alabama','AL',1),
(3614,223,'Alaska','AK',1),
(3615,223,'American Samoa','AS',1),
(3616,223,'Arizona','AZ',1),
(3617,223,'Arkansas','AR',1),
(3618,223,'Armed Forces Africa','AF',1),
(3619,223,'Armed Forces Americas','AA',1),
(3620,223,'Armed Forces Canada','AC',1),
(3621,223,'Armed Forces Europe','AE',1),
(3622,223,'Armed Forces Middle East','AM',1),
(3623,223,'Armed Forces Pacific','AP',1),
(3624,223,'California','CA',1),
(3625,223,'Colorado','CO',1),
(3626,223,'Connecticut','CT',1),
(3627,223,'Delaware','DE',1),
(3628,223,'District of Columbia','DC',1),
(3629,223,'Federated States Of Micronesia','FM',1),
(3630,223,'Florida','FL',1),
(3631,223,'Georgia','GA',1),
(3632,223,'Guam','GU',1),
(3633,223,'Hawaii','HI',1),
(3634,223,'Idaho','ID',1),
(3635,223,'Illinois','IL',1),
(3636,223,'Indiana','IN',1),
(3637,223,'Iowa','IA',1),
(3638,223,'Kansas','KS',1),
(3639,223,'Kentucky','KY',1),
(3640,223,'Louisiana','LA',1),
(3641,223,'Maine','ME',1),
(3642,223,'Marshall Islands','MH',1),
(3643,223,'Maryland','MD',1),
(3644,223,'Massachusetts','MA',1),
(3645,223,'Michigan','MI',1),
(3646,223,'Minnesota','MN',1),
(3647,223,'Mississippi','MS',1),
(3648,223,'Missouri','MO',1),
(3649,223,'Montana','MT',1),
(3650,223,'Nebraska','NE',1),
(3651,223,'Nevada','NV',1),
(3652,223,'New Hampshire','NH',1),
(3653,223,'New Jersey','NJ',1),
(3654,223,'New Mexico','NM',1),
(3655,223,'New York','NY',1),
(3656,223,'North Carolina','NC',1),
(3657,223,'North Dakota','ND',1),
(3658,223,'Northern Mariana Islands','MP',1),
(3659,223,'Ohio','OH',1),
(3660,223,'Oklahoma','OK',1),
(3661,223,'Oregon','OR',1),
(3662,223,'Palau','PW',1),
(3663,223,'Pennsylvania','PA',1),
(3664,223,'Puerto Rico','PR',1),
(3665,223,'Rhode Island','RI',1),
(3666,223,'South Carolina','SC',1),
(3667,223,'South Dakota','SD',1),
(3668,223,'Tennessee','TN',1),
(3669,223,'Texas','TX',1),
(3670,223,'Utah','UT',1),
(3671,223,'Vermont','VT',1),
(3672,223,'Virgin Islands','VI',1),
(3673,223,'Virginia','VA',1),
(3674,223,'Washington','WA',1),
(3675,223,'West Virginia','WV',1),
(3676,223,'Wisconsin','WI',1),
(3677,223,'Wyoming','WY',1),
(3678,224,'Baker Island','BI',1),
(3679,224,'Howland Island','HI',1),
(3680,224,'Jarvis Island','JI',1),
(3681,224,'Johnston Atoll','JA',1),
(3682,224,'Kingman Reef','KR',1),
(3683,224,'Midway Atoll','MA',1),
(3684,224,'Navassa Island','NI',1),
(3685,224,'Palmyra Atoll','PA',1),
(3686,224,'Wake Island','WI',1),
(3687,225,'Artigas','AR',1),
(3688,225,'Canelones','CA',1),
(3689,225,'Cerro Largo','CL',1),
(3690,225,'Colonia','CO',1),
(3691,225,'Durazno','DU',1),
(3692,225,'Flores','FS',1),
(3693,225,'Florida','FA',1),
(3694,225,'Lavalleja','LA',1),
(3695,225,'Maldonado','MA',1),
(3696,225,'Montevideo','MO',1),
(3697,225,'Paysandu','PA',1),
(3698,225,'Rio Negro','RN',1),
(3699,225,'Rivera','RV',1),
(3700,225,'Rocha','RO',1),
(3701,225,'Salto','SL',1),
(3702,225,'San Jose','SJ',1),
(3703,225,'Soriano','SO',1),
(3704,225,'Tacuarembo','TA',1),
(3705,225,'Treinta y Tres','TT',1),
(3706,226,'Andijon','AN',1),
(3707,226,'Buxoro','BU',1),
(3708,226,'Farg\'ona','FA',1),
(3709,226,'Jizzax','JI',1),
(3710,226,'Namangan','NG',1),
(3711,226,'Navoiy','NW',1),
(3712,226,'Qashqadaryo','QA',1),
(3713,226,'Qoraqalpog\'iston Republikasi','QR',1),
(3714,226,'Samarqand','SA',1),
(3715,226,'Sirdaryo','SI',1),
(3716,226,'Surxondaryo','SU',1),
(3717,226,'Toshkent City','TK',1),
(3718,226,'Toshkent Region','TO',1),
(3719,226,'Xorazm','XO',1),
(3720,227,'Malampa','MA',1),
(3721,227,'Penama','PE',1),
(3722,227,'Sanma','SA',1),
(3723,227,'Shefa','SH',1),
(3724,227,'Tafea','TA',1),
(3725,227,'Torba','TO',1),
(3726,229,'Amazonas','Z',1),
(3727,229,'Anzoategui','B',1),
(3728,229,'Apure','C',1),
(3729,229,'Aragua','D',1),
(3730,229,'Barinas','E',1),
(3731,229,'Bolivar','F',1),
(3732,229,'Carabobo','G',1),
(3733,229,'Cojedes','H',1),
(3734,229,'Delta Amacuro','Y',1),
(3735,229,'Dependencias Federales','W',1),
(3736,229,'Distrito Capital','A',1),
(3737,229,'Falcon','I',1),
(3738,229,'Guarico','J',1),
(3739,229,'Lara','K',1),
(3740,229,'Merida','L',1),
(3741,229,'Miranda','M',1),
(3742,229,'Monagas','N',1),
(3743,229,'Nueva Esparta','O',1),
(3744,229,'Portuguesa','P',1),
(3745,229,'Sucre','R',1),
(3746,229,'Tachira','S',1),
(3747,229,'Trujillo','T',1),
(3748,229,'Vargas','X',1),
(3749,229,'Yaracuy','U',1),
(3750,229,'Zulia','V',1),
(3751,230,'An Giang','AG',1),
(3752,230,'Bac Giang','BG',1),
(3753,230,'Bac Kan','BK',1),
(3754,230,'Bac Lieu','BL',1),
(3755,230,'Bac Ninh','BC',1),
(3756,230,'Ba Ria-Vung Tau','BR',1),
(3757,230,'Ben Tre','BN',1),
(3758,230,'Binh Dinh','BH',1),
(3759,230,'Binh Duong','BU',1),
(3760,230,'Binh Phuoc','BP',1),
(3761,230,'Binh Thuan','BT',1),
(3762,230,'Ca Mau','CM',1),
(3763,230,'Can Tho','CT',1),
(3764,230,'Cao Bang','CB',1),
(3765,230,'Dak Lak','DL',1),
(3766,230,'Dak Nong','DG',1),
(3767,230,'Da Nang','DN',1),
(3768,230,'Dien Bien','DB',1),
(3769,230,'Dong Nai','DI',1),
(3770,230,'Dong Thap','DT',1),
(3771,230,'Gia Lai','GL',1),
(3772,230,'Ha Giang','HG',1),
(3773,230,'Hai Duong','HD',1),
(3774,230,'Hai Phong','HP',1),
(3775,230,'Ha Nam','HM',1),
(3776,230,'Ha Noi','HI',1),
(3777,230,'Ha Tay','HT',1),
(3778,230,'Ha Tinh','HH',1),
(3779,230,'Hoa Binh','HB',1),
(3780,230,'Ho Chi Minh City','HC',1),
(3781,230,'Hau Giang','HU',1),
(3782,230,'Hung Yen','HY',1),
(3783,232,'Saint Croix','C',1),
(3784,232,'Saint John','J',1),
(3785,232,'Saint Thomas','T',1),
(3786,233,'Alo','A',1),
(3787,233,'Sigave','S',1),
(3788,233,'Wallis','W',1),
(3789,235,'Abyan','AB',1),
(3790,235,'Adan','AD',1),
(3791,235,'Amran','AM',1),
(3792,235,'Al Bayda','BA',1),
(3793,235,'Ad Dali','DA',1),
(3794,235,'Dhamar','DH',1),
(3795,235,'Hadramawt','HD',1),
(3796,235,'Hajjah','HJ',1),
(3797,235,'Al Hudaydah','HU',1),
(3798,235,'Ibb','IB',1),
(3799,235,'Al Jawf','JA',1),
(3800,235,'Lahij','LA',1),
(3801,235,'Ma\'rib','MA',1),
(3802,235,'Al Mahrah','MR',1),
(3803,235,'Al Mahwit','MW',1),
(3804,235,'Sa\'dah','SD',1),
(3805,235,'San\'a','SN',1),
(3806,235,'Shabwah','SH',1),
(3807,235,'Ta\'izz','TA',1),
(3812,237,'Bas-Congo','BC',1),
(3813,237,'Bandundu','BN',1),
(3814,237,'Equateur','EQ',1),
(3815,237,'Katanga','KA',1),
(3816,237,'Kasai-Oriental','KE',1),
(3817,237,'Kinshasa','KN',1),
(3818,237,'Kasai-Occidental','KW',1),
(3819,237,'Maniema','MA',1),
(3820,237,'Nord-Kivu','NK',1),
(3821,237,'Orientale','OR',1),
(3822,237,'Sud-Kivu','SK',1),
(3823,238,'Central','CE',1),
(3824,238,'Copperbelt','CB',1),
(3825,238,'Eastern','EA',1),
(3826,238,'Luapula','LP',1),
(3827,238,'Lusaka','LK',1),
(3828,238,'Northern','NO',1),
(3829,238,'North-Western','NW',1),
(3830,238,'Southern','SO',1),
(3831,238,'Western','WE',1),
(3832,239,'Bulawayo','BU',1),
(3833,239,'Harare','HA',1),
(3834,239,'Manicaland','ML',1),
(3835,239,'Mashonaland Central','MC',1),
(3836,239,'Mashonaland East','ME',1),
(3837,239,'Mashonaland West','MW',1),
(3838,239,'Masvingo','MV',1),
(3839,239,'Matabeleland North','MN',1),
(3840,239,'Matabeleland South','MS',1),
(3841,239,'Midlands','MD',1),
(3842,105,'Agrigento','AG',1),
(3843,105,'Alessandria','AL',1),
(3844,105,'Ancona','AN',1),
(3845,105,'Aosta','AO',1),
(3846,105,'Arezzo','AR',1),
(3847,105,'Ascoli Piceno','AP',1),
(3848,105,'Asti','AT',1),
(3849,105,'Avellino','AV',1),
(3850,105,'Bari','BA',1),
(3851,105,'Belluno','BL',1),
(3852,105,'Benevento','BN',1),
(3853,105,'Bergamo','BG',1),
(3854,105,'Biella','BI',1),
(3855,105,'Bologna','BO',1),
(3856,105,'Bolzano','BZ',1),
(3857,105,'Brescia','BS',1),
(3858,105,'Brindisi','BR',1),
(3859,105,'Cagliari','CA',1),
(3860,105,'Caltanissetta','CL',1),
(3861,105,'Campobasso','CB',1),
(3863,105,'Caserta','CE',1),
(3864,105,'Catania','CT',1),
(3865,105,'Catanzaro','CZ',1),
(3866,105,'Chieti','CH',1),
(3867,105,'Como','CO',1),
(3868,105,'Cosenza','CS',1),
(3869,105,'Cremona','CR',1),
(3870,105,'Crotone','KR',1),
(3871,105,'Cuneo','CN',1),
(3872,105,'Enna','EN',1),
(3873,105,'Ferrara','FE',1),
(3874,105,'Firenze','FI',1),
(3875,105,'Foggia','FG',1),
(3876,105,'Forli-Cesena','FC',1),
(3877,105,'Frosinone','FR',1),
(3878,105,'Genova','GE',1),
(3879,105,'Gorizia','GO',1),
(3880,105,'Grosseto','GR',1),
(3881,105,'Imperia','IM',1),
(3882,105,'Isernia','IS',1),
(3883,105,'L&#39;Aquila','AQ',1),
(3884,105,'La Spezia','SP',1),
(3885,105,'Latina','LT',1),
(3886,105,'Lecce','LE',1),
(3887,105,'Lecco','LC',1),
(3888,105,'Livorno','LI',1),
(3889,105,'Lodi','LO',1),
(3890,105,'Lucca','LU',1),
(3891,105,'Macerata','MC',1),
(3892,105,'Mantova','MN',1),
(3893,105,'Massa-Carrara','MS',1),
(3894,105,'Matera','MT',1),
(3896,105,'Messina','ME',1),
(3897,105,'Milano','MI',1),
(3898,105,'Modena','MO',1),
(3899,105,'Napoli','NA',1),
(3900,105,'Novara','NO',1),
(3901,105,'Nuoro','NU',1),
(3904,105,'Oristano','OR',1),
(3905,105,'Padova','PD',1),
(3906,105,'Palermo','PA',1),
(3907,105,'Parma','PR',1),
(3908,105,'Pavia','PV',1),
(3909,105,'Perugia','PG',1),
(3910,105,'Pesaro e Urbino','PU',1),
(3911,105,'Pescara','PE',1),
(3912,105,'Piacenza','PC',1),
(3913,105,'Pisa','PI',1),
(3914,105,'Pistoia','PT',1),
(3915,105,'Pordenone','PN',1),
(3916,105,'Potenza','PZ',1),
(3917,105,'Prato','PO',1),
(3918,105,'Ragusa','RG',1),
(3919,105,'Ravenna','RA',1),
(3920,105,'Reggio Calabria','RC',1),
(3921,105,'Reggio Emilia','RE',1),
(3922,105,'Rieti','RI',1),
(3923,105,'Rimini','RN',1),
(3924,105,'Roma','RM',1),
(3925,105,'Rovigo','RO',1),
(3926,105,'Salerno','SA',1),
(3927,105,'Sassari','SS',1),
(3928,105,'Savona','SV',1),
(3929,105,'Siena','SI',1),
(3930,105,'Siracusa','SR',1),
(3931,105,'Sondrio','SO',1),
(3932,105,'Taranto','TA',1),
(3933,105,'Teramo','TE',1),
(3934,105,'Terni','TR',1),
(3935,105,'Torino','TO',1),
(3936,105,'Trapani','TP',1),
(3937,105,'Trento','TN',1),
(3938,105,'Treviso','TV',1),
(3939,105,'Trieste','TS',1),
(3940,105,'Udine','UD',1),
(3941,105,'Varese','VA',1),
(3942,105,'Venezia','VE',1),
(3943,105,'Verbano-Cusio-Ossola','VB',1),
(3944,105,'Vercelli','VC',1),
(3945,105,'Verona','VR',1),
(3946,105,'Vibo Valentia','VV',1),
(3947,105,'Vicenza','VI',1),
(3948,105,'Viterbo','VT',1),
(3949,222,'County Antrim','ANT',1),
(3950,222,'County Armagh','ARM',1),
(3951,222,'County Down','DOW',1),
(3952,222,'County Fermanagh','FER',1),
(3953,222,'County Londonderry','LDY',1),
(3954,222,'County Tyrone','TYR',1),
(3955,222,'Cumbria','CMA',1),
(3956,190,'Pomurska','1',1),
(3957,190,'Podravska','2',1),
(3958,190,'Koroška','3',1),
(3959,190,'Savinjska','4',1),
(3960,190,'Zasavska','5',1),
(3961,190,'Spodnjeposavska','6',1),
(3962,190,'Jugovzhodna Slovenija','7',1),
(3963,190,'Osrednjeslovenska','8',1),
(3964,190,'Gorenjska','9',1),
(3965,190,'Notranjsko-kraška','10',1),
(3966,190,'Goriška','11',1),
(3967,190,'Obalno-kraška','12',1),
(3968,33,'Ruse','',1),
(3969,101,'Alborz','ALB',1),
(3970,21,'Brussels-Capital Region','BRU',1),
(3971,138,'Aguascalientes','AG',1),
(3973,242,'Andrijevica','01',1),
(3974,242,'Bar','02',1),
(3975,242,'Berane','03',1),
(3976,242,'Bijelo Polje','04',1),
(3977,242,'Budva','05',1),
(3978,242,'Cetinje','06',1),
(3979,242,'Danilovgrad','07',1),
(3980,242,'Herceg-Novi','08',1),
(3981,242,'Kolašin','09',1),
(3982,242,'Kotor','10',1),
(3983,242,'Mojkovac','11',1),
(3984,242,'Nikšić','12',1),
(3985,242,'Plav','13',1),
(3986,242,'Pljevlja','14',1),
(3987,242,'Plužine','15',1),
(3988,242,'Podgorica','16',1),
(3989,242,'Rožaje','17',1),
(3990,242,'Šavnik','18',1),
(3991,242,'Tivat','19',1),
(3992,242,'Ulcinj','20',1),
(3993,242,'Žabljak','21',1),
(3994,243,'Belgrade','00',1),
(3995,243,'North Bačka','01',1),
(3996,243,'Central Banat','02',1),
(3997,243,'North Banat','03',1),
(3998,243,'South Banat','04',1),
(3999,243,'West Bačka','05',1),
(4000,243,'South Bačka','06',1),
(4001,243,'Srem','07',1),
(4002,243,'Mačva','08',1),
(4003,243,'Kolubara','09',1),
(4004,243,'Podunavlje','10',1),
(4005,243,'Braničevo','11',1),
(4006,243,'Šumadija','12',1),
(4007,243,'Pomoravlje','13',1),
(4008,243,'Bor','14',1),
(4009,243,'Zaječar','15',1),
(4010,243,'Zlatibor','16',1),
(4011,243,'Moravica','17',1),
(4012,243,'Raška','18',1),
(4013,243,'Rasina','19',1),
(4014,243,'Nišava','20',1),
(4015,243,'Toplica','21',1),
(4016,243,'Pirot','22',1),
(4017,243,'Jablanica','23',1),
(4018,243,'Pčinja','24',1),
(4020,245,'Bonaire','BO',1),
(4021,245,'Saba','SA',1),
(4022,245,'Sint Eustatius','SE',1),
(4023,248,'Central Equatoria','EC',1),
(4024,248,'Eastern Equatoria','EE',1),
(4025,248,'Jonglei','JG',1),
(4026,248,'Lakes','LK',1),
(4027,248,'Northern Bahr el-Ghazal','BN',1),
(4028,248,'Unity','UY',1),
(4029,248,'Upper Nile','NU',1),
(4030,248,'Warrap','WR',1),
(4031,248,'Western Bahr el-Ghazal','BW',1),
(4032,248,'Western Equatoria','EW',1),
(4035,129,'Putrajaya','MY-16',1),
(4038,117,'Aizkraukles novads','002',1),
(4040,117,'Aizputes novads','003',1),
(4042,117,'Aknīstes novads','004',1),
(4044,117,'Alojas novads','005',1),
(4045,117,'Alsungas novads','006',1),
(4047,117,'Alūksnes novads','007',1),
(4048,117,'Amatas novads','008',1),
(4050,117,'Apes novads','008',1),
(4052,117,'Auces novads','010',1),
(4053,117,'Ādažu novads','011',1),
(4054,117,'Babītes novads','012',1),
(4056,117,'Baldones novads','013',1),
(4058,117,'Baltinavas novads','014',1),
(4060,117,'Balvu novads','015',1),
(4062,117,'Bauskas novads','016',1),
(4063,117,'Beverīnas novads','017',1),
(4065,117,'Brocēnu novads','018',1),
(4066,117,'Burtnieku novads','019',1),
(4067,117,'Carnikavas novads','020',1),
(4069,117,'Cesvaines novads','021',1),
(4071,117,'Cēsu novads','022',1),
(4072,117,'Ciblas novads','023',1),
(4074,117,'Dagdas novads','024',1),
(4075,117,'Daugavpils','DGV',1),
(4076,117,'Daugavpils novads','025',1),
(4078,117,'Dobeles novads','026',1),
(4079,117,'Dundagas novads','027',1),
(4081,117,'Durbes novads','028',1),
(4082,117,'Engures novads','029',1),
(4083,117,'Ērgļu novads','030',1),
(4084,117,'Garkalnes novads','031',1),
(4086,117,'Grobiņas novads','032',1),
(4088,117,'Gulbenes novads','033',1),
(4089,117,'Iecavas novads','034',1),
(4091,117,'Ikšķiles novads','035',1),
(4093,117,'Ilūkstes novads','036',1),
(4094,117,'Inčukalna novads','037',1),
(4096,117,'Jaunjelgavas novads','038',1),
(4097,117,'Jaunpiebalgas novads','039',1),
(4098,117,'Jaunpils novads','040',1),
(4099,117,'Jelgava','JEL',1),
(4100,117,'Jelgavas novads','041',1),
(4101,117,'Jēkabpils','JKB',1),
(4102,117,'Jēkabpils novads','042',1),
(4103,117,'Jūrmala','JUR',1),
(4106,117,'Kandavas novads','043',1),
(4108,117,'Kārsavas novads','044',1),
(4110,117,'Kokneses novads','046',1),
(4112,117,'Krāslavas novads','047',1),
(4113,117,'Krimuldas novads','048',1),
(4114,117,'Krustpils novads','049',1),
(4116,117,'Kuldīgas novads','050',1),
(4117,117,'Ķeguma novads','051',1),
(4119,117,'Ķekavas novads','052',1),
(4121,117,'Lielvārdes novads','053',1),
(4122,117,'Liepāja','LPX',1),
(4124,117,'Limbažu novads','054',1),
(4126,117,'Līgatnes novads','055',1),
(4128,117,'Līvānu novads','056',1),
(4130,117,'Lubānas novads','057',1),
(4132,117,'Ludzas novads','058',1),
(4134,117,'Madonas novads','059',1),
(4136,117,'Mazsalacas novads','060',1),
(4137,117,'Mālpils novads','061',1),
(4138,117,'Mārupes novads','062',1),
(4139,117,'Mērsraga novads','063',1),
(4140,117,'Naukšēnu novads','064',1),
(4141,117,'Neretas novads','065',1),
(4142,117,'Nīcas novads','066',1),
(4144,117,'Ogres novads','067',1),
(4146,117,'Olaines novads','068',1),
(4147,117,'Ozolnieku novads','069',1),
(4148,117,'Pārgaujas novads','070',1),
(4150,117,'Pāvilostas novads','071',1),
(4153,117,'Pļaviņu novads','072',1),
(4155,117,'Preiļu novads','073',1),
(4157,117,'Priekules novads','074',1),
(4158,117,'Priekuļu novads','075',1),
(4159,117,'Raunas novads','076',1),
(4160,117,'Rēzekne','REZ',1),
(4161,117,'Rēzeknes novads','077',1),
(4162,117,'Riebiņu novads','078',1),
(4163,117,'Rīga','RIX',1),
(4164,117,'Rojas novads','079',1),
(4165,117,'Ropažu novads','080',1),
(4166,117,'Rucavas novads','081',1),
(4167,117,'Rugāju novads','082',1),
(4168,117,'Rundāles novads','083',1),
(4170,117,'Rūjienas novads','084',1),
(4173,117,'Salacgrīvas novads','086',1),
(4174,117,'Salas novads','085',1),
(4175,117,'Salaspils novads','087',1),
(4177,117,'Saldus novads','088',1),
(4178,117,'Saldus, Saldus novads','0840201',1),
(4180,117,'Saulkrastu novads','089',1),
(4182,117,'Sējas novads','090',1),
(4184,117,'Siguldas novads','091',1),
(4185,117,'Skrīveru novads','092',1),
(4187,117,'Skrundas novads','093',1),
(4189,117,'Smiltenes novads','094',1),
(4192,117,'Stopiņu novads','095',1),
(4194,117,'Strenču novads','096',1),
(4197,117,'Talsu novads','097',1),
(4198,117,'Tērvetes novads','098',1),
(4199,117,'Tukuma novads','099',1),
(4201,117,'Vaiņodes novads','100',1),
(4204,117,'Valkas novads','101',1),
(4205,117,'Valmiera','VMR',1),
(4208,117,'Varakļānu novads','102',1),
(4209,117,'Vārkavas novads','103',1),
(4210,117,'Vecpiebalgas novads','104',1),
(4211,117,'Vecumnieku novads','105',1),
(4212,117,'Ventspils','VEN',1),
(4213,117,'Ventspils novads','106',1),
(4215,117,'Viesītes novads','107',1),
(4217,117,'Viļakas novads','108',1),
(4219,117,'Viļānu novads','109',1),
(4221,117,'Zilupes novads','110',1),
(4222,43,'Arica y Parinacota','AP',1),
(4223,43,'Los Rios','LR',1),
(4224,220,'Kharkivs\'ka Oblast\'','63',1),
(4225,118,'Beirut','LB-BR',1),
(4226,118,'Bekaa','LB-BE',1),
(4227,118,'Mount Lebanon','LB-ML',1),
(4228,118,'Nabatieh','LB-NB',1),
(4229,118,'North','LB-NR',1),
(4230,118,'South','LB-ST',1),
(4231,99,'Telangana','TS',1),
(4232,44,'Qinghai','QH',1),
(4233,100,'Papua Barat','PB',1),
(4234,100,'Sulawesi Barat','SR',1),
(4235,100,'Kepulauan Riau','KR',1),
(4236,105,'Barletta-Andria-Trani','BT',1),
(4237,105,'Fermo','FM',1),
(4238,105,'Monza Brianza','MB',1),
(4239,113,'Seoul-teukbyeolsi','11',1),
(4240,113,'Busan-gwangyeoksi','26',1),
(4241,113,'Daegu-gwangyeoksi','27',1),
(4242,113,'Daejeon-gwangyeoksi','30',1),
(4243,113,'Gwangju-gwangyeoksi','29',1),
(4244,113,'Incheon-gwangyeoksi','28',1),
(4245,113,'Ulsan-gwangyeoksi','31',1),
(4246,113,'Chungcheongbuk-do','43',1),
(4247,113,'Chungcheongnam-do','44',1),
(4248,113,'Gangwon-do','42',1),
(4249,113,'Gyeonggi-do','41',1),
(4250,113,'Gyeongsangbuk-do','47',1),
(4251,113,'Gyeongsangnam-do','48',1),
(4252,113,'Jeollabuk-do','45',1),
(4253,113,'Jeollanam-do','46',1),
(4254,113,'Jeju-teukbyeoljachido','49',1),
(4255,113,'Sejong-teukbyeoljachisi','50',1),
(4256,209,'Phra Nakhon Si Ayutthaya','14',1),
(4257,176,'Adygea, Republic of','RU-AD',1),
(4258,176,'Bashkortostan, Republic of','RU-BA',1),
(4259,176,'Buryatia, Republic of','RU-BU',1),
(4260,176,'Altai Republic','RU-AL',1),
(4261,176,'Dagestan, Republic of','RU-DA',1),
(4262,176,'Ingushetia, Republic of','RU-IN',1),
(4263,176,'Kabardino-Balkar Republic','RU-KB',1),
(4264,176,'Kalmykia, Republic of','RU-KL',1),
(4265,176,'Karachay-Cherkess Republic','RU-KC',1),
(4266,176,'Karelia, Republic of','RU-KR',1),
(4267,176,'Komi Republic','RU-KO',1),
(4268,176,'Mari El Republic','RU-ME',1),
(4269,176,'Mordovia, Republic of','RU-MO',1),
(4270,176,'Sakha (Yakutia) Republic','RU-SA',1),
(4271,176,'North Ossetia-Alania, Republic of','RU-SE',1),
(4272,176,'Tatarstan, Republic of','RU-TA',1),
(4273,176,'Tuva Republic','RU-TY',1),
(4274,176,'Udmurt Republic','RU-UD',1),
(4275,176,'Khakassia, Republic of','RU-KK',1),
(4276,176,'Chechen Republic','RU-CE',1),
(4277,176,'Chuvash Republic','RU-CU',1),
(4278,176,'Altai Krai','RU-ALT',1),
(4279,176,'Krasnodar Krai','RU-KDA',1),
(4280,176,'Krasnoyarsk Krai','RU-KYA',1),
(4281,176,'Primorsky Krai','RU-PRI',1),
(4282,176,'Stavropol Krai','RU-STA',1),
(4283,176,'Khabarovsk Krai','RU-KHA',1),
(4284,176,'Amur Oblast','RU-AMU',1),
(4285,176,'Arkhangelsk Oblast','RU-ARK',1),
(4286,176,'Astrakhan Oblast','RU-AST',1),
(4287,176,'Belgorod Oblast','RU-BEL',1),
(4288,176,'Bryansk Oblast','RU-BRY',1),
(4289,176,'Vladimir Oblast','RU-VLA',1),
(4290,176,'Volgograd Oblast','RU-VGG',1),
(4291,176,'Vologda Oblast','RU-VLG',1),
(4292,176,'Voronezh Oblast','RU-VOR',1),
(4293,176,'Ivanovo Oblast','RU-IVA',1),
(4294,176,'Irkutsk Oblast','RU-IRK',1),
(4295,176,'Kaliningrad Oblast','RU-KGD',1),
(4296,176,'Kaluga Oblast','RU-KLU',1),
(4297,176,'Kamchatka Krai','RU-KAM',1),
(4298,176,'Kemerovo Oblast','RU-KEM',1),
(4299,176,'Kirov Oblast','RU-KIR',1),
(4300,176,'Kostroma Oblast','RU-KOS',1),
(4301,176,'Kurgan Oblast','RU-KGN',1),
(4302,176,'Kursk Oblast','RU-KRS',1),
(4303,176,'Leningrad Oblast','RU-LEN',1),
(4304,176,'Lipetsk Oblast','RU-LIP',1),
(4305,176,'Magadan Oblast','RU-MAG',1),
(4306,176,'Moscow Oblast','RU-MOS',1),
(4307,176,'Murmansk Oblast','RU-MUR',1),
(4308,176,'Nizhny Novgorod Oblast','RU-NIZ',1),
(4309,176,'Novgorod Oblast','RU-NGR',1),
(4310,176,'Novosibirsk Oblast','RU-NVS',1),
(4311,176,'Omsk Oblast','RU-OMS',1),
(4312,176,'Orenburg Oblast','RU-ORE',1),
(4313,176,'Oryol Oblast','RU-ORL',1),
(4314,176,'Penza Oblast','RU-PNZ',1),
(4315,176,'Perm Krai','RU-PER',1),
(4316,176,'Pskov Oblast','RU-PSK',1),
(4317,176,'Rostov Oblast','RU-ROS',1),
(4318,176,'Ryazan Oblast','RU-RYA',1),
(4319,176,'Samara Oblast','RU-SAM',1),
(4320,176,'Saratov Oblast','RU-SAR',1),
(4321,176,'Sakhalin Oblast','RU-SAK',1),
(4322,176,'Sverdlovsk Oblast','RU-SVE',1),
(4323,176,'Smolensk Oblast','RU-SMO',1),
(4324,176,'Tambov Oblast','RU-TAM',1),
(4325,176,'Tver Oblast','RU-TVE',1),
(4326,176,'Tomsk Oblast','RU-TOM',1),
(4327,176,'Tula Oblast','RU-TUL',1),
(4328,176,'Tyumen Oblast','RU-TYU',1),
(4329,176,'Ulyanovsk Oblast','RU-ULY',1),
(4330,176,'Chelyabinsk Oblast','RU-CHE',1),
(4331,176,'Zabaykalsky Krai','RU-ZAB',1),
(4332,176,'Yaroslavl Oblast','RU-YAR',1),
(4333,176,'Moscow','RU-MOW',1),
(4334,176,'Saint Petersburg','RU-SPE',1),
(4335,176,'Jewish Autonomous Oblast','RU-YEV',1),
(4336,176,'Nenets Autonomous Okrug','RU-NEN',1),
(4337,176,'Khanty–Mansi Autonomous Okrug – Yugra','RU-KHM',1),
(4338,176,'Chukotka Autonomous Okrug','RU-CHU',1),
(4339,176,'Yamalo-Nenets Autonomous Okrug','RU-YAN',1),
(4340,117,'Aglonas novads','001',1),
(4341,99,'Chhattisgarh','CT',1),
(4342,99,'Ladakh','LA',1),
(4343,99,'Uttarakhand','UT',1);
/*!40000 ALTER TABLE `oc_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oc_zone_to_geo_zone`
--

DROP TABLE IF EXISTS `oc_zone_to_geo_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT 0,
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oc_zone_to_geo_zone`
--

LOCK TABLES `oc_zone_to_geo_zone` WRITE;
/*!40000 ALTER TABLE `oc_zone_to_geo_zone` DISABLE KEYS */;
INSERT INTO `oc_zone_to_geo_zone` VALUES
(1,222,0,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(2,222,3513,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(3,222,3514,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(4,222,3515,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(5,222,3516,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(6,222,3517,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(7,222,3518,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(8,222,3519,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(9,222,3520,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(10,222,3521,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(11,222,3522,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(12,222,3523,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(13,222,3524,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(14,222,3525,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(15,222,3526,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(16,222,3527,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(17,222,3528,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(18,222,3529,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(19,222,3530,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(20,222,3531,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(21,222,3532,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(22,222,3533,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(23,222,3534,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(24,222,3535,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(25,222,3536,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(26,222,3537,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(27,222,3538,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(28,222,3539,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(29,222,3540,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(30,222,3541,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(31,222,3542,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(32,222,3543,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(33,222,3544,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(34,222,3545,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(35,222,3546,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(36,222,3547,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(37,222,3548,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(38,222,3549,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(39,222,3550,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(40,222,3551,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(41,222,3552,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(42,222,3553,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(43,222,3554,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(44,222,3555,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(45,222,3556,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(46,222,3557,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(47,222,3558,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(48,222,3559,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(49,222,3560,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(50,222,3561,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(51,222,3562,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(52,222,3563,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(53,222,3564,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(54,222,3565,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(55,222,3566,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(56,222,3567,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(57,222,3568,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(58,222,3569,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(59,222,3570,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(60,222,3571,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(61,222,3572,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(62,222,3573,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(63,222,3574,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(64,222,3575,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(65,222,3576,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(66,222,3577,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(67,222,3578,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(68,222,3579,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(69,222,3580,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(70,222,3581,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(71,222,3582,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(72,222,3583,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(73,222,3584,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(74,222,3585,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(75,222,3586,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(76,222,3587,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(77,222,3588,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(78,222,3589,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(79,222,3590,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(80,222,3591,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(81,222,3592,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(82,222,3593,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(83,222,3594,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(84,222,3595,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(85,222,3596,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(86,222,3597,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(87,222,3598,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(88,222,3599,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(89,222,3600,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(90,222,3601,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(91,222,3602,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(92,222,3603,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(93,222,3604,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(94,222,3605,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(95,222,3606,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(96,222,3607,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(97,222,3608,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(98,222,3609,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(99,222,3610,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(100,222,3611,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(101,222,3612,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(102,222,3949,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(103,222,3950,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(104,222,3951,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(105,222,3952,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(106,222,3953,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(107,222,3954,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),
(108,222,3955,3,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `oc_zone_to_geo_zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-03-23 13:15:11
