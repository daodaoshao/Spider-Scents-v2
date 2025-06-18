/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.6.2-MariaDB, for osx10.19 (arm64)
--
-- Host: localhost    Database: piwigo
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
-- Table structure for table `piwigo_activity`
--

DROP TABLE IF EXISTS `piwigo_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_activity` (
  `activity_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `object` varchar(255) NOT NULL,
  `object_id` int(11) unsigned NOT NULL,
  `action` varchar(255) NOT NULL,
  `performed_by` mediumint(8) unsigned NOT NULL,
  `session_idx` varchar(255) NOT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `occured_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `details` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_activity`
--

LOCK TABLES `piwigo_activity` WRITE;
/*!40000 ALTER TABLE `piwigo_activity` DISABLE KEYS */;
INSERT INTO `piwigo_activity` VALUES
(1,'system',3,'\"\'><script>xss(979488)</script>',0,'none','192.168.224.1','2023-03-08 19:47:02','a:3:{s:8:\"theme_id\";s:5:\"modus\";s:7:\"version\";s:6:\"13.6.0\";s:6:\"script\";s:7:\"install\";}',NULL),
(2,'system',3,'\"\'><script>xss(972439)</script>',0,'none','192.168.224.1','2023-03-08 19:47:02','a:3:{s:8:\"theme_id\";s:11:\"smartpocket\";s:7:\"version\";s:6:\"13.6.0\";s:6:\"script\";s:7:\"install\";}',NULL),
(3,'system',1,'\"\'><script>xss(982181)</script>',0,'none','192.168.224.1','2023-03-08 19:47:03','a:2:{s:7:\"version\";s:6:\"13.6.0\";s:6:\"script\";s:7:\"install\";}',NULL),
(4,'user',1,'\"\'><script>xss(927991)</script>',1,'7143949d105e025cdfbb5c0ca02c97d0','192.168.224.1','2023-03-08 19:47:03','a:1:{s:6:\"script\";s:7:\"install\";}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/110.0'),
(5,'user',1,'\"\'><script>xss(948823)</script>',1,'8adfbd28746aefcfc0f1c2c84053e30d','192.168.65.1','2025-03-23 20:11:53','a:1:{s:6:\"script\";s:14:\"identification\";}','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) HeadlessChrome/134.0.0.0 Safari/537.36');
/*!40000 ALTER TABLE `piwigo_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_caddie`
--

DROP TABLE IF EXISTS `piwigo_caddie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_caddie` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `element_id` mediumint(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`element_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_caddie`
--

LOCK TABLES `piwigo_caddie` WRITE;
/*!40000 ALTER TABLE `piwigo_caddie` DISABLE KEYS */;
INSERT INTO `piwigo_caddie` VALUES
(0,0);
/*!40000 ALTER TABLE `piwigo_caddie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_categories`
--

DROP TABLE IF EXISTS `piwigo_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_categories` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `id_uppercat` smallint(5) unsigned DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `dir` varchar(255) DEFAULT NULL,
  `rank` smallint(5) unsigned DEFAULT NULL,
  `status` enum('public','private') NOT NULL DEFAULT 'public',
  `site_id` tinyint(4) unsigned DEFAULT NULL,
  `visible` enum('true','false') NOT NULL DEFAULT 'true',
  `representative_picture_id` mediumint(8) unsigned DEFAULT NULL,
  `uppercats` varchar(255) NOT NULL DEFAULT '',
  `commentable` enum('true','false') NOT NULL DEFAULT 'true',
  `global_rank` varchar(255) DEFAULT NULL,
  `image_order` varchar(128) DEFAULT NULL,
  `permalink` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_i3` (`permalink`),
  KEY `categories_i2` (`id_uppercat`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_categories`
--

LOCK TABLES `piwigo_categories` WRITE;
/*!40000 ALTER TABLE `piwigo_categories` DISABLE KEYS */;
INSERT INTO `piwigo_categories` VALUES
(1,'a',0,'a','a',0,'public',0,'true',0,'a','true','a','a','a','1970-01-01 00:00:01');
/*!40000 ALTER TABLE `piwigo_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_comments`
--

DROP TABLE IF EXISTS `piwigo_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_comments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `date` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `author` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `author_id` mediumint(8) unsigned DEFAULT NULL,
  `anonymous_id` varchar(45) NOT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `validated` enum('true','false') NOT NULL DEFAULT 'false',
  `validation_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_i2` (`validation_date`),
  KEY `comments_i1` (`image_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_comments`
--

LOCK TABLES `piwigo_comments` WRITE;
/*!40000 ALTER TABLE `piwigo_comments` DISABLE KEYS */;
INSERT INTO `piwigo_comments` VALUES
(1,0,'1970-01-01 00:00:01','a','a',0,'a','a','a','true','1970-01-01 00:00:01');
/*!40000 ALTER TABLE `piwigo_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_config`
--

DROP TABLE IF EXISTS `piwigo_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_config` (
  `param` varchar(40) NOT NULL DEFAULT '',
  `value` text DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`param`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci COMMENT='configuration table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_config`
--

LOCK TABLES `piwigo_config` WRITE;
/*!40000 ALTER TABLE `piwigo_config` DISABLE KEYS */;
INSERT INTO `piwigo_config` VALUES
('activate_comments','false','Global parameter for usage of comments system'),
('nb_comment_page','10','number of comments to display on each page'),
('log','true','keep an history of visits on your website'),
('comments_validation','false','administrators validate users comments before becoming visible'),
('comments_forall','false','even guest not registered can post comments'),
('comments_order','ASC','comments order on picture page and cie'),
('comments_author_mandatory','false','Comment author is mandatory'),
('comments_email_mandatory','false','Comment email is mandatory'),
('comments_enable_website','true','Enable \"website\" field on add comment form'),
('user_can_delete_comment','false','administrators can allow user delete their own comments'),
('user_can_edit_comment','false','administrators can allow user edit their own comments'),
('email_admin_on_comment_edition','false','Send an email to the administrators when a comment is modified'),
('email_admin_on_comment_deletion','false','Send an email to the administrators when a comment is deleted'),
('gallery_locked','false','Lock your gallery temporary for non admin users'),
('gallery_title','Just another Piwigo gallery','Title at top of each page and for RSS feed'),
('rate','false','Rating pictures feature is enabled'),
('rate_anonymous','true','Rating pictures feature is also enabled for visitors'),
('page_banner','<h1>%gallery_title%</h1>\n\n<p>Welcome to my photo gallery</p>','html displayed on the top each page of your gallery'),
('history_admin','false','keep a history of administrator visits on your website'),
('history_guest','true','keep a history of guest visits on your website'),
('allow_user_registration','true','allow visitors to register?'),
('allow_user_customization','true','allow users to customize their gallery?'),
('nb_categories_page','12','Param for categories pagination'),
('nbm_send_html_mail','true','Send mail on HTML format for notification by mail'),
('nbm_send_mail_as','','Send mail as param value for notification by mail'),
('nbm_send_detailed_content','true','Send detailed content for notification by mail'),
('nbm_complementary_mail_content','','Complementary mail content for notification by mail'),
('nbm_send_recent_post_dates','true','Send recent post by dates for notification by mail'),
('email_admin_on_new_user','false','Send an email to theadministrators when a user registers'),
('email_admin_on_comment','false','Send an email to the administrators when a valid comment is entered'),
('email_admin_on_comment_validation','true','Send an email to the administrators when a comment requires validation'),
('obligatory_user_mail_address','false','Mail address is obligatory for users'),
('c13y_ignore','a:2:{s:7:\"version\";s:6:\"13.6.0\";s:4:\"list\";a:0:{}}','List of ignored anomalies'),
('extents_for_templates','a:0:{}','Actived template-extension(s)'),
('blk_menubar','','Menubar options'),
('menubar_filter_icon','false','Display filter icon'),
('index_sort_order_input','true','Display image order selection list'),
('index_flat_icon','false','Display flat icon'),
('index_posted_date_icon','true','Display calendar by posted date'),
('index_created_date_icon','true','Display calendar by creation date icon'),
('index_slideshow_icon','true','Display slideshow icon'),
('index_new_icon','true','Display new icons next albums and pictures'),
('picture_metadata_icon','true','Display metadata icon on picture page'),
('picture_slideshow_icon','true','Display slideshow icon on picture page'),
('picture_favorite_icon','true','Display favorite icon on picture page'),
('picture_download_icon','true','Display download icon on picture page'),
('picture_navigation_icons','true','Display navigation icons on picture page'),
('picture_navigation_thumb','true','Display navigation thumbnails on picture page'),
('picture_menu','false','Show menubar on picture page'),
('picture_informations','a:11:{s:6:\"author\";b:1;s:10:\"created_on\";b:1;s:9:\"posted_on\";b:1;s:10:\"dimensions\";b:0;s:4:\"file\";b:0;s:8:\"filesize\";b:0;s:4:\"tags\";b:1;s:10:\"categories\";b:1;s:6:\"visits\";b:1;s:12:\"rating_score\";b:1;s:13:\"privacy_level\";b:1;}','Information displayed on picture page'),
('week_starts_on','monday','Monday may not be the first day of the week'),
('updates_ignored','a:3:{s:7:\"plugins\";a:0:{}s:6:\"themes\";a:0:{}s:9:\"languages\";a:0:{}}','Extensions ignored for update'),
('order_by','ORDER BY date_available DESC, file ASC, id ASC','default photo order'),
('order_by_inside_category','ORDER BY date_available DESC, file ASC, id ASC','default photo order inside category'),
('original_resize','false',NULL),
('original_resize_maxwidth','2016',NULL),
('original_resize_maxheight','2016',NULL),
('original_resize_quality','95',NULL),
('mobile_theme','smartpocket',NULL),
('mail_theme','clear',NULL),
('picture_sizes_icon','true',NULL),
('index_sizes_icon','true',NULL),
('index_edit_icon','true',NULL),
('index_caddie_icon','true',NULL),
('display_fromto','false',NULL),
('picture_edit_icon','true',NULL),
('picture_caddie_icon','true',NULL),
('picture_representative_icon','true',NULL),
('show_mobile_app_banner_in_admin','true',NULL),
('show_mobile_app_banner_in_gallery','false',NULL),
('secret_key','48c785a082b68e6dc791aa7e75cd0f83','a secret key specific to the gallery for internal use'),
('piwigo_db_version','13',NULL),
('modus_theme','a:5:{s:4:\"skin\";s:9:\"newspaper\";s:16:\"album_thumb_size\";i:250;s:17:\"index_photo_deriv\";s:6:\"2small\";s:22:\"index_photo_deriv_hdpi\";s:6:\"xsmall\";s:19:\"display_page_banner\";b:0;}',NULL),
('smartpocket','a:2:{s:4:\"loop\";b:1;s:8:\"autohide\";i:5000;}',NULL),
('derivatives','a:4:{s:1:\"d\";a:9:{s:6:\"square\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1678304825;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:120;i:1;i:120;}s:8:\"max_crop\";i:1;s:8:\"min_size\";a:2:{i:0;i:120;i:1;i:120;}}s:7:\"sharpen\";i:0;}s:5:\"thumb\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1678304825;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:144;i:1;i:144;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}s:6:\"2small\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1678304825;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:240;i:1;i:240;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}s:6:\"xsmall\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1678304825;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:432;i:1;i:324;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}s:5:\"small\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1678304825;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:576;i:1;i:432;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}s:6:\"medium\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1678304825;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:792;i:1;i:594;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}s:5:\"large\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1678304825;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:1008;i:1;i:756;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}s:6:\"xlarge\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1678304825;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:1224;i:1;i:918;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}s:7:\"xxlarge\";O:16:\"DerivativeParams\":3:{s:13:\"last_mod_time\";i:1678304825;s:6:\"sizing\";O:12:\"SizingParams\":3:{s:10:\"ideal_size\";a:2:{i:0;i:1656;i:1;i:1242;}s:8:\"max_crop\";i:0;s:8:\"min_size\";N;}s:7:\"sharpen\";i:0;}}s:1:\"q\";i:95;s:1:\"w\";O:15:\"WatermarkParams\":7:{s:4:\"file\";s:0:\"\";s:8:\"min_size\";a:2:{i:0;i:500;i:1;i:500;}s:4:\"xpos\";i:50;s:4:\"ypos\";i:50;s:7:\"xrepeat\";i:0;s:7:\"yrepeat\";i:0;s:7:\"opacity\";i:100;}s:1:\"c\";a:0:{}}',NULL),
('data_dir_checked','1',NULL),
('no_photo_yet','false',NULL),
('update_notify_last_check','2025-03-23T20:11:53+00:00',NULL),
('fs_quick_check_last_check','2025-03-23T20:13:12+00:00',NULL);
/*!40000 ALTER TABLE `piwigo_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_favorites`
--

DROP TABLE IF EXISTS `piwigo_favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_favorites` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`image_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_favorites`
--

LOCK TABLES `piwigo_favorites` WRITE;
/*!40000 ALTER TABLE `piwigo_favorites` DISABLE KEYS */;
INSERT INTO `piwigo_favorites` VALUES
(0,0);
/*!40000 ALTER TABLE `piwigo_favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_group_access`
--

DROP TABLE IF EXISTS `piwigo_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_group_access` (
  `group_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_group_access`
--

LOCK TABLES `piwigo_group_access` WRITE;
/*!40000 ALTER TABLE `piwigo_group_access` DISABLE KEYS */;
INSERT INTO `piwigo_group_access` VALUES
(0,0);
/*!40000 ALTER TABLE `piwigo_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_groups`
--

DROP TABLE IF EXISTS `piwigo_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_groups` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `is_default` enum('true','false') NOT NULL DEFAULT 'false',
  `lastmodified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `groups_ui1` (`name`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_groups`
--

LOCK TABLES `piwigo_groups` WRITE;
/*!40000 ALTER TABLE `piwigo_groups` DISABLE KEYS */;
INSERT INTO `piwigo_groups` VALUES
(1,'a','true','1970-01-01 00:00:01');
/*!40000 ALTER TABLE `piwigo_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_history`
--

DROP TABLE IF EXISTS `piwigo_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL DEFAULT '1970-01-01',
  `time` time NOT NULL DEFAULT '00:00:00',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `IP` varchar(15) NOT NULL DEFAULT '',
  `section` enum('categories','tags','search','list','favorites','most_visited','best_rated','recent_pics','recent_cats') DEFAULT NULL,
  `category_id` smallint(5) DEFAULT NULL,
  `tag_ids` varchar(50) DEFAULT NULL,
  `image_id` mediumint(8) DEFAULT NULL,
  `image_type` enum('picture','high','other') DEFAULT NULL,
  `format_id` int(11) unsigned DEFAULT NULL,
  `auth_key_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_history`
--

LOCK TABLES `piwigo_history` WRITE;
/*!40000 ALTER TABLE `piwigo_history` DISABLE KEYS */;
INSERT INTO `piwigo_history` VALUES
(1,'1970-01-01','00:00:01',0,'a','categories',0,'a',0,'picture',0,0);
/*!40000 ALTER TABLE `piwigo_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_history_summary`
--

DROP TABLE IF EXISTS `piwigo_history_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_history_summary` (
  `year` smallint(4) NOT NULL DEFAULT 0,
  `month` tinyint(2) DEFAULT NULL,
  `day` tinyint(2) DEFAULT NULL,
  `hour` tinyint(2) DEFAULT NULL,
  `nb_pages` int(11) DEFAULT NULL,
  `history_id_from` int(10) unsigned DEFAULT NULL,
  `history_id_to` int(10) unsigned DEFAULT NULL,
  UNIQUE KEY `history_summary_ymdh` (`year`,`month`,`day`,`hour`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_history_summary`
--

LOCK TABLES `piwigo_history_summary` WRITE;
/*!40000 ALTER TABLE `piwigo_history_summary` DISABLE KEYS */;
INSERT INTO `piwigo_history_summary` VALUES
(0,0,0,0,0,0,0),
(1970,NULL,NULL,NULL,1,1,1),
(1970,1,NULL,NULL,1,1,1),
(1970,1,1,NULL,1,1,1),
(1970,1,1,0,1,1,1);
/*!40000 ALTER TABLE `piwigo_history_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_image_category`
--

DROP TABLE IF EXISTS `piwigo_image_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_image_category` (
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `category_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `rank` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`image_id`,`category_id`),
  KEY `image_category_i1` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_image_category`
--

LOCK TABLES `piwigo_image_category` WRITE;
/*!40000 ALTER TABLE `piwigo_image_category` DISABLE KEYS */;
INSERT INTO `piwigo_image_category` VALUES
(0,0,0);
/*!40000 ALTER TABLE `piwigo_image_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_image_format`
--

DROP TABLE IF EXISTS `piwigo_image_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_image_format` (
  `format_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `ext` varchar(255) NOT NULL,
  `filesize` mediumint(9) unsigned DEFAULT NULL,
  PRIMARY KEY (`format_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_image_format`
--

LOCK TABLES `piwigo_image_format` WRITE;
/*!40000 ALTER TABLE `piwigo_image_format` DISABLE KEYS */;
INSERT INTO `piwigo_image_format` VALUES
(1,0,'a',0);
/*!40000 ALTER TABLE `piwigo_image_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_image_tag`
--

DROP TABLE IF EXISTS `piwigo_image_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_image_tag` (
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `tag_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`image_id`,`tag_id`),
  KEY `image_tag_i1` (`tag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_image_tag`
--

LOCK TABLES `piwigo_image_tag` WRITE;
/*!40000 ALTER TABLE `piwigo_image_tag` DISABLE KEYS */;
INSERT INTO `piwigo_image_tag` VALUES
(0,0);
/*!40000 ALTER TABLE `piwigo_image_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_images`
--

DROP TABLE IF EXISTS `piwigo_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_images` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_available` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `date_creation` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `hit` int(10) unsigned NOT NULL DEFAULT 0,
  `filesize` mediumint(9) unsigned DEFAULT NULL,
  `width` smallint(9) unsigned DEFAULT NULL,
  `height` smallint(9) unsigned DEFAULT NULL,
  `coi` char(4) DEFAULT NULL COMMENT 'center of interest',
  `representative_ext` varchar(4) DEFAULT NULL,
  `date_metadata_update` date DEFAULT NULL,
  `rating_score` float(5,2) unsigned DEFAULT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `storage_category_id` smallint(5) unsigned DEFAULT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `md5sum` char(32) DEFAULT NULL,
  `added_by` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `rotation` tinyint(3) unsigned DEFAULT NULL,
  `latitude` double(8,6) DEFAULT NULL,
  `longitude` double(9,6) DEFAULT NULL,
  `lastmodified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `images_i2` (`date_available`),
  KEY `images_i3` (`rating_score`),
  KEY `images_i4` (`hit`),
  KEY `images_i5` (`date_creation`),
  KEY `images_i1` (`storage_category_id`),
  KEY `images_i6` (`latitude`),
  KEY `images_i7` (`path`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_images`
--

LOCK TABLES `piwigo_images` WRITE;
/*!40000 ALTER TABLE `piwigo_images` DISABLE KEYS */;
INSERT INTO `piwigo_images` VALUES
(1,'a','1970-01-01 00:00:01','1970-01-01 00:00:01','a','a','a',0,0,0,0,'a','a','1970-01-01',0.00,'a',0,0,'a',0,0,0.000000,0.000000,'1970-01-01 00:00:01');
/*!40000 ALTER TABLE `piwigo_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_languages`
--

DROP TABLE IF EXISTS `piwigo_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_languages` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_languages`
--

LOCK TABLES `piwigo_languages` WRITE;
/*!40000 ALTER TABLE `piwigo_languages` DISABLE KEYS */;
INSERT INTO `piwigo_languages` VALUES
('en_GB','13.6.0','English [GB]');
/*!40000 ALTER TABLE `piwigo_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_lounge`
--

DROP TABLE IF EXISTS `piwigo_lounge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_lounge` (
  `image_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `category_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`image_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_lounge`
--

LOCK TABLES `piwigo_lounge` WRITE;
/*!40000 ALTER TABLE `piwigo_lounge` DISABLE KEYS */;
INSERT INTO `piwigo_lounge` VALUES
(0,0);
/*!40000 ALTER TABLE `piwigo_lounge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_old_permalinks`
--

DROP TABLE IF EXISTS `piwigo_old_permalinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_old_permalinks` (
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `permalink` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_deleted` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `last_hit` datetime DEFAULT NULL,
  `hit` int(10) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`permalink`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_old_permalinks`
--

LOCK TABLES `piwigo_old_permalinks` WRITE;
/*!40000 ALTER TABLE `piwigo_old_permalinks` DISABLE KEYS */;
INSERT INTO `piwigo_old_permalinks` VALUES
(0,'a','1970-01-01 00:00:01','1970-01-01 00:00:01',0);
/*!40000 ALTER TABLE `piwigo_old_permalinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_plugins`
--

DROP TABLE IF EXISTS `piwigo_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_plugins` (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `state` enum('inactive','active') NOT NULL DEFAULT 'inactive',
  `version` varchar(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_plugins`
--

LOCK TABLES `piwigo_plugins` WRITE;
/*!40000 ALTER TABLE `piwigo_plugins` DISABLE KEYS */;
INSERT INTO `piwigo_plugins` VALUES
('a','inactive','a');
/*!40000 ALTER TABLE `piwigo_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_rate`
--

DROP TABLE IF EXISTS `piwigo_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_rate` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `element_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `anonymous_id` varchar(45) NOT NULL DEFAULT '',
  `rate` tinyint(2) unsigned NOT NULL DEFAULT 0,
  `date` date NOT NULL DEFAULT '1970-01-01',
  PRIMARY KEY (`element_id`,`user_id`,`anonymous_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_rate`
--

LOCK TABLES `piwigo_rate` WRITE;
/*!40000 ALTER TABLE `piwigo_rate` DISABLE KEYS */;
INSERT INTO `piwigo_rate` VALUES
(0,0,'a',0,'1970-01-01');
/*!40000 ALTER TABLE `piwigo_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_search`
--

DROP TABLE IF EXISTS `piwigo_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_search` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `last_seen` date DEFAULT NULL,
  `rules` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_search`
--

LOCK TABLES `piwigo_search` WRITE;
/*!40000 ALTER TABLE `piwigo_search` DISABLE KEYS */;
INSERT INTO `piwigo_search` VALUES
(1,'1970-01-01','a');
/*!40000 ALTER TABLE `piwigo_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_sessions`
--

DROP TABLE IF EXISTS `piwigo_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_sessions` (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `data` mediumtext NOT NULL,
  `expiration` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_sessions`
--

LOCK TABLES `piwigo_sessions` WRITE;
/*!40000 ALTER TABLE `piwigo_sessions` DISABLE KEYS */;
INSERT INTO `piwigo_sessions` VALUES
('C0A8fcbd2da484d7626d06464cb341a173a0','pwg_device|s:7:\"desktop\";pwg_mobile_theme|b:0;','2025-03-23 20:12:03'),
('C0A860439692186958619eaec36e05bec7bc','pwg_device|s:7:\"desktop\";pwg_mobile_theme|b:0;','2025-03-23 20:13:07'),
('C0A88adfbd28746aefcfc0f1c2c84053e30d','pwg_device|s:7:\"desktop\";pwg_mobile_theme|b:0;pwg_uid|i:1;cache_activity_last_weeks|a:2:{s:13:\"calculated_on\";i:1742760718;s:4:\"data\";a:1:{i:3;a:1:{i:7;a:3:{s:7:\"details\";a:1:{s:4:\"User\";a:1:{s:5:\"Login\";s:1:\"1\";}}s:6:\"number\";i:1;s:4:\"date\";s:20:\"Sunday 23 March 2025\";}}}}pwg_caps|a:3:{i:0;s:1:\"2\";i:1;s:4:\"1200\";i:2;s:3:\"896\";}need_update13.6.0|b:0;extensions_need_update|a:3:{s:7:\"plugins\";a:4:{s:9:\"TakeATour\";s:6:\"13.8.0\";s:10:\"AdminTools\";s:6:\"13.8.0\";s:16:\"LocalFilesEditor\";s:6:\"13.8.0\";s:15:\"language_switch\";s:6:\"13.8.0\";}s:6:\"themes\";a:3:{s:7:\"elegant\";s:6:\"13.8.0\";s:11:\"smartpocket\";s:6:\"13.8.0\";s:5:\"modus\";s:6:\"13.8.0\";}s:9:\"languages\";a:59:{s:5:\"af_ZA\";s:6:\"13.8.0\";s:5:\"es_AR\";s:6:\"13.8.0\";s:5:\"id_ID\";s:6:\"13.8.0\";s:5:\"pt_BR\";s:6:\"13.8.0\";s:5:\"br_FR\";s:6:\"13.8.0\";s:5:\"ca_ES\";s:6:\"13.8.0\";s:5:\"da_DK\";s:6:\"13.8.0\";s:5:\"de_DE\";s:6:\"13.8.0\";s:5:\"en_GB\";s:6:\"13.8.0\";s:5:\"en_UK\";s:6:\"13.8.0\";s:5:\"en_US\";s:6:\"13.8.0\";s:5:\"es_ES\";s:6:\"13.8.0\";s:5:\"eo_EO\";s:6:\"13.8.0\";s:5:\"et_EE\";s:6:\"13.8.0\";s:5:\"fi_FI\";s:6:\"13.8.0\";s:5:\"fr_FR\";s:6:\"13.8.0\";s:5:\"fr_CA\";s:6:\"13.8.0\";s:5:\"gl_ES\";s:6:\"13.8.0\";s:5:\"hr_HR\";s:6:\"13.8.0\";s:5:\"it_IT\";s:6:\"13.8.0\";s:5:\"lv_LV\";s:6:\"13.8.0\";s:5:\"lt_LT\";s:6:\"13.8.0\";s:5:\"hu_HU\";s:6:\"13.8.0\";s:5:\"es_MX\";s:6:\"13.8.0\";s:5:\"nl_NL\";s:6:\"13.8.0\";s:5:\"nb_NO\";s:6:\"13.8.0\";s:5:\"nn_NO\";s:6:\"13.8.0\";s:5:\"pl_PL\";s:6:\"13.8.0\";s:5:\"pt_PT\";s:6:\"13.8.0\";s:5:\"ro_RO\";s:6:\"13.8.0\";s:5:\"sk_SK\";s:6:\"13.8.0\";s:5:\"sl_SI\";s:6:\"13.8.0\";s:5:\"sh_RS\";s:6:\"13.8.0\";s:5:\"sv_SE\";s:6:\"13.8.0\";s:5:\"vi_VN\";s:6:\"13.8.0\";s:5:\"tr_TR\";s:6:\"13.8.0\";s:5:\"is_IS\";s:6:\"13.8.0\";s:5:\"cs_CZ\";s:6:\"13.8.0\";s:5:\"el_GR\";s:6:\"13.8.0\";s:5:\"bg_BG\";s:6:\"13.8.0\";s:5:\"mk_MK\";s:6:\"13.8.0\";s:5:\"mn_MN\";s:6:\"13.8.0\";s:5:\"ru_RU\";s:6:\"13.8.0\";s:5:\"sr_RS\";s:6:\"13.8.0\";s:5:\"uk_UA\";s:6:\"13.8.0\";s:5:\"he_IL\";s:6:\"13.8.0\";s:5:\"ar_EG\";s:6:\"13.8.0\";s:5:\"ar_SA\";s:6:\"13.8.0\";s:5:\"fa_IR\";s:6:\"13.8.0\";s:5:\"ta_IN\";s:6:\"13.8.0\";s:5:\"kn_IN\";s:6:\"13.8.0\";s:5:\"th_TH\";s:6:\"13.8.0\";s:5:\"ka_GE\";s:6:\"13.8.0\";s:5:\"km_KH\";s:6:\"13.8.0\";s:5:\"zh_TW\";s:6:\"13.8.0\";s:5:\"zh_HK\";s:6:\"13.8.0\";s:5:\"ja_JP\";s:6:\"13.8.0\";s:5:\"zh_CN\";s:6:\"13.8.0\";s:5:\"ko_KR\";s:6:\"13.8.0\";}}bulk_manager_filter|a:1:{s:9:\"prefilter\";s:11:\"last_import\";}incompatible_plugins|a:1:{s:10:\"~~expire~~\";i:1742761104;}','2025-03-23 20:13:27');
/*!40000 ALTER TABLE `piwigo_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_sites`
--

DROP TABLE IF EXISTS `piwigo_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_sites` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `galleries_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sites_ui1` (`galleries_url`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_sites`
--

LOCK TABLES `piwigo_sites` WRITE;
/*!40000 ALTER TABLE `piwigo_sites` DISABLE KEYS */;
INSERT INTO `piwigo_sites` VALUES
(1,'./galleries/');
/*!40000 ALTER TABLE `piwigo_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_tags`
--

DROP TABLE IF EXISTS `piwigo_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_tags` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastmodified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `tags_i1` (`url_name`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_tags`
--

LOCK TABLES `piwigo_tags` WRITE;
/*!40000 ALTER TABLE `piwigo_tags` DISABLE KEYS */;
INSERT INTO `piwigo_tags` VALUES
(1,'a','a','1970-01-01 00:00:01');
/*!40000 ALTER TABLE `piwigo_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_themes`
--

DROP TABLE IF EXISTS `piwigo_themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_themes` (
  `id` varchar(64) NOT NULL DEFAULT '',
  `version` varchar(64) NOT NULL DEFAULT '0',
  `name` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_themes`
--

LOCK TABLES `piwigo_themes` WRITE;
/*!40000 ALTER TABLE `piwigo_themes` DISABLE KEYS */;
INSERT INTO `piwigo_themes` VALUES
('modus','13.6.0','modus'),
('smartpocket','13.6.0','Smart Pocket');
/*!40000 ALTER TABLE `piwigo_themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_upgrade`
--

DROP TABLE IF EXISTS `piwigo_upgrade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_upgrade` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `applied` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_upgrade`
--

LOCK TABLES `piwigo_upgrade` WRITE;
/*!40000 ALTER TABLE `piwigo_upgrade` DISABLE KEYS */;
INSERT INTO `piwigo_upgrade` VALUES
('61','2023-03-08 19:47:02','upgrade included in installation'),
('62','2023-03-08 19:47:02','upgrade included in installation'),
('63','2023-03-08 19:47:02','upgrade included in installation'),
('64','2023-03-08 19:47:02','upgrade included in installation'),
('65','2023-03-08 19:47:02','upgrade included in installation'),
('66','2023-03-08 19:47:02','upgrade included in installation'),
('67','2023-03-08 19:47:02','upgrade included in installation'),
('68','2023-03-08 19:47:02','upgrade included in installation'),
('69','2023-03-08 19:47:02','upgrade included in installation'),
('70','2023-03-08 19:47:02','upgrade included in installation'),
('71','2023-03-08 19:47:02','upgrade included in installation'),
('72','2023-03-08 19:47:02','upgrade included in installation'),
('73','2023-03-08 19:47:02','upgrade included in installation'),
('74','2023-03-08 19:47:02','upgrade included in installation'),
('75','2023-03-08 19:47:02','upgrade included in installation'),
('76','2023-03-08 19:47:02','upgrade included in installation'),
('77','2023-03-08 19:47:02','upgrade included in installation'),
('78','2023-03-08 19:47:02','upgrade included in installation'),
('79','2023-03-08 19:47:02','upgrade included in installation'),
('80','2023-03-08 19:47:02','upgrade included in installation'),
('81','2023-03-08 19:47:02','upgrade included in installation'),
('82','2023-03-08 19:47:02','upgrade included in installation'),
('83','2023-03-08 19:47:02','upgrade included in installation'),
('84','2023-03-08 19:47:02','upgrade included in installation'),
('85','2023-03-08 19:47:02','upgrade included in installation'),
('86','2023-03-08 19:47:02','upgrade included in installation'),
('87','2023-03-08 19:47:02','upgrade included in installation'),
('88','2023-03-08 19:47:02','upgrade included in installation'),
('89','2023-03-08 19:47:02','upgrade included in installation'),
('90','2023-03-08 19:47:02','upgrade included in installation'),
('91','2023-03-08 19:47:02','upgrade included in installation'),
('92','2023-03-08 19:47:02','upgrade included in installation'),
('93','2023-03-08 19:47:02','upgrade included in installation'),
('94','2023-03-08 19:47:02','upgrade included in installation'),
('95','2023-03-08 19:47:02','upgrade included in installation'),
('96','2023-03-08 19:47:02','upgrade included in installation'),
('97','2023-03-08 19:47:02','upgrade included in installation'),
('98','2023-03-08 19:47:02','upgrade included in installation'),
('99','2023-03-08 19:47:02','upgrade included in installation'),
('100','2023-03-08 19:47:02','upgrade included in installation'),
('101','2023-03-08 19:47:02','upgrade included in installation'),
('102','2023-03-08 19:47:02','upgrade included in installation'),
('103','2023-03-08 19:47:02','upgrade included in installation'),
('104','2023-03-08 19:47:02','upgrade included in installation'),
('105','2023-03-08 19:47:02','upgrade included in installation'),
('106','2023-03-08 19:47:02','upgrade included in installation'),
('107','2023-03-08 19:47:02','upgrade included in installation'),
('108','2023-03-08 19:47:02','upgrade included in installation'),
('109','2023-03-08 19:47:02','upgrade included in installation'),
('110','2023-03-08 19:47:02','upgrade included in installation'),
('111','2023-03-08 19:47:02','upgrade included in installation'),
('112','2023-03-08 19:47:02','upgrade included in installation'),
('113','2023-03-08 19:47:02','upgrade included in installation'),
('114','2023-03-08 19:47:02','upgrade included in installation'),
('115','2023-03-08 19:47:02','upgrade included in installation'),
('116','2023-03-08 19:47:02','upgrade included in installation'),
('117','2023-03-08 19:47:02','upgrade included in installation'),
('118','2023-03-08 19:47:02','upgrade included in installation'),
('119','2023-03-08 19:47:02','upgrade included in installation'),
('120','2023-03-08 19:47:02','upgrade included in installation'),
('121','2023-03-08 19:47:02','upgrade included in installation'),
('122','2023-03-08 19:47:02','upgrade included in installation'),
('123','2023-03-08 19:47:02','upgrade included in installation'),
('124','2023-03-08 19:47:02','upgrade included in installation'),
('125','2023-03-08 19:47:02','upgrade included in installation'),
('126','2023-03-08 19:47:02','upgrade included in installation'),
('127','2023-03-08 19:47:02','upgrade included in installation'),
('128','2023-03-08 19:47:02','upgrade included in installation'),
('129','2023-03-08 19:47:02','upgrade included in installation'),
('130','2023-03-08 19:47:02','upgrade included in installation'),
('131','2023-03-08 19:47:02','upgrade included in installation'),
('132','2023-03-08 19:47:02','upgrade included in installation'),
('133','2023-03-08 19:47:02','upgrade included in installation'),
('134','2023-03-08 19:47:02','upgrade included in installation'),
('135','2023-03-08 19:47:02','upgrade included in installation'),
('136','2023-03-08 19:47:02','upgrade included in installation'),
('137','2023-03-08 19:47:02','upgrade included in installation'),
('138','2023-03-08 19:47:02','upgrade included in installation'),
('139','2023-03-08 19:47:02','upgrade included in installation'),
('140','2023-03-08 19:47:02','upgrade included in installation'),
('141','2023-03-08 19:47:02','upgrade included in installation'),
('142','2023-03-08 19:47:02','upgrade included in installation'),
('143','2023-03-08 19:47:02','upgrade included in installation'),
('144','2023-03-08 19:47:02','upgrade included in installation'),
('145','2023-03-08 19:47:02','upgrade included in installation'),
('146','2023-03-08 19:47:02','upgrade included in installation'),
('147','2023-03-08 19:47:02','upgrade included in installation'),
('148','2023-03-08 19:47:02','upgrade included in installation'),
('149','2023-03-08 19:47:02','upgrade included in installation'),
('150','2023-03-08 19:47:02','upgrade included in installation'),
('151','2023-03-08 19:47:02','upgrade included in installation'),
('152','2023-03-08 19:47:02','upgrade included in installation'),
('153','2023-03-08 19:47:02','upgrade included in installation'),
('154','2023-03-08 19:47:02','upgrade included in installation'),
('155','2023-03-08 19:47:02','upgrade included in installation'),
('156','2023-03-08 19:47:02','upgrade included in installation'),
('157','2023-03-08 19:47:02','upgrade included in installation'),
('158','2023-03-08 19:47:02','upgrade included in installation'),
('159','2023-03-08 19:47:02','upgrade included in installation'),
('160','2023-03-08 19:47:02','upgrade included in installation'),
('161','2023-03-08 19:47:02','upgrade included in installation'),
('162','2023-03-08 19:47:02','upgrade included in installation'),
('163','2023-03-08 19:47:02','upgrade included in installation'),
('164','2023-03-08 19:47:02','upgrade included in installation');
/*!40000 ALTER TABLE `piwigo_upgrade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_access`
--

DROP TABLE IF EXISTS `piwigo_user_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_access` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_access`
--

LOCK TABLES `piwigo_user_access` WRITE;
/*!40000 ALTER TABLE `piwigo_user_access` DISABLE KEYS */;
INSERT INTO `piwigo_user_access` VALUES
(0,0);
/*!40000 ALTER TABLE `piwigo_user_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_auth_keys`
--

DROP TABLE IF EXISTS `piwigo_user_auth_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_auth_keys` (
  `auth_key_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `auth_key` varchar(255) NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `created_on` datetime NOT NULL,
  `duration` int(11) unsigned DEFAULT NULL,
  `expired_on` datetime NOT NULL,
  PRIMARY KEY (`auth_key_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_auth_keys`
--

LOCK TABLES `piwigo_user_auth_keys` WRITE;
/*!40000 ALTER TABLE `piwigo_user_auth_keys` DISABLE KEYS */;
INSERT INTO `piwigo_user_auth_keys` VALUES
(1,'a',0,'1970-01-01 00:00:01',0,'1970-01-01 00:00:01');
/*!40000 ALTER TABLE `piwigo_user_auth_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_cache`
--

DROP TABLE IF EXISTS `piwigo_user_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_cache` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `need_update` enum('true','false') NOT NULL DEFAULT 'true',
  `cache_update_time` int(10) unsigned NOT NULL DEFAULT 0,
  `forbidden_categories` mediumtext DEFAULT NULL,
  `nb_total_images` mediumint(8) unsigned DEFAULT NULL,
  `last_photo_date` datetime DEFAULT NULL,
  `nb_available_tags` int(5) DEFAULT NULL,
  `nb_available_comments` int(5) DEFAULT NULL,
  `image_access_type` enum('NOT IN','IN') NOT NULL DEFAULT 'NOT IN',
  `image_access_list` mediumtext DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_cache`
--

LOCK TABLES `piwigo_user_cache` WRITE;
/*!40000 ALTER TABLE `piwigo_user_cache` DISABLE KEYS */;
INSERT INTO `piwigo_user_cache` VALUES
(1,'false',1742760782,'0',0,NULL,0,NULL,'NOT IN','0'),
(2,'false',1742760787,'1',0,NULL,0,NULL,'NOT IN','0');
/*!40000 ALTER TABLE `piwigo_user_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_cache_categories`
--

DROP TABLE IF EXISTS `piwigo_user_cache_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_cache_categories` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `cat_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `date_last` datetime DEFAULT NULL,
  `max_date_last` datetime DEFAULT NULL,
  `nb_images` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `count_images` mediumint(8) unsigned DEFAULT 0,
  `nb_categories` mediumint(8) unsigned DEFAULT 0,
  `count_categories` mediumint(8) unsigned DEFAULT 0,
  `user_representative_picture_id` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`,`cat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_cache_categories`
--

LOCK TABLES `piwigo_user_cache_categories` WRITE;
/*!40000 ALTER TABLE `piwigo_user_cache_categories` DISABLE KEYS */;
INSERT INTO `piwigo_user_cache_categories` VALUES
(1,1,NULL,NULL,0,0,0,0,NULL);
/*!40000 ALTER TABLE `piwigo_user_cache_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_feed`
--

DROP TABLE IF EXISTS `piwigo_user_feed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_feed` (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `last_check` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_feed`
--

LOCK TABLES `piwigo_user_feed` WRITE;
/*!40000 ALTER TABLE `piwigo_user_feed` DISABLE KEYS */;
INSERT INTO `piwigo_user_feed` VALUES
('a',0,'1970-01-01 00:00:01'),
('oAvW3Doo17aNgba7sd5L1gifNpg71F5cEQvMJiQYGPapkjQN14',1,NULL),
('Zm5X1gHoPRRocPdyNY4h6UYO40UbOSX8w26LMCuJ53QbW2FYLq',1,NULL),
('4TJ3tC8FIYMDoaFhtmcdg7gFAMCNunfcmVTMWH3Mz4EhNLeLuf',1,NULL),
('vi8alZX5KvKohv3nzg8S7TfikVHqjxAV7Qg5RcDxBvjd5FuyhH',1,NULL),
('YRECasCnMMnDfFQajnwF3OktX54QbtOZ32qwqoSzbqzbZv00Xq',1,NULL),
('TBaQFVPz5ucHbIgR2pfDCXHZoorPrDzXcGuqEZYzavdk2OTjmP',1,NULL),
('zL7lraLOOcVXf7bpKC8F8wNZ7hiFRwILif3kpZh5RaTwd4QNLT',1,NULL),
('iH2Sd7Sy6rFUk63DC95sWDhcfmks3pMQSCdxDt4x0kw7h18d8V',1,NULL),
('mYJYsxEEocesuXsLy3lV2yYlLvFcg9GP1DwJP9kTavX8K2Xpu9',1,NULL),
('0FLmRTtuhtsfYQSF8tyIyiWkPTk96e4KTntACEzmH6ETL4TQU7',1,NULL),
('1fBqXJCPVTLMlLoGigtRMxRzkxPijRgvXY5kddVAqzYMavVXPL',1,NULL),
('t9lZ2moXaZHAflsYjj6YNTc4Wj5pn5ugAqNrzV893eciR1zYpE',1,NULL),
('r1yrEBXD8mshaQ7HEjvGCpw10DCaJgfKfPQOgGHmXfp2gFw0bB',1,NULL);
/*!40000 ALTER TABLE `piwigo_user_feed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_group`
--

DROP TABLE IF EXISTS `piwigo_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_group` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `group_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`group_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_group`
--

LOCK TABLES `piwigo_user_group` WRITE;
/*!40000 ALTER TABLE `piwigo_user_group` DISABLE KEYS */;
INSERT INTO `piwigo_user_group` VALUES
(0,0);
/*!40000 ALTER TABLE `piwigo_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_infos`
--

DROP TABLE IF EXISTS `piwigo_user_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_infos` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `nb_image_page` smallint(3) unsigned NOT NULL DEFAULT 15,
  `status` enum('webmaster','admin','normal','generic','guest') NOT NULL DEFAULT 'guest',
  `language` varchar(50) NOT NULL DEFAULT 'en_UK',
  `expand` enum('true','false') NOT NULL DEFAULT 'false',
  `show_nb_comments` enum('true','false') NOT NULL DEFAULT 'false',
  `show_nb_hits` enum('true','false') NOT NULL DEFAULT 'false',
  `recent_period` tinyint(3) unsigned NOT NULL DEFAULT 7,
  `theme` varchar(255) NOT NULL DEFAULT 'modus',
  `registration_date` datetime NOT NULL DEFAULT '1970-01-01 00:00:00',
  `enabled_high` enum('true','false') NOT NULL DEFAULT 'true',
  `level` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `activation_key` varchar(255) DEFAULT NULL,
  `activation_key_expire` datetime DEFAULT NULL,
  `last_visit` datetime DEFAULT NULL,
  `last_visit_from_history` enum('true','false') NOT NULL DEFAULT 'false',
  `lastmodified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `lastmodified` (`lastmodified`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_infos`
--

LOCK TABLES `piwigo_user_infos` WRITE;
/*!40000 ALTER TABLE `piwigo_user_infos` DISABLE KEYS */;
INSERT INTO `piwigo_user_infos` VALUES
(1,15,'webmaster','en_GB','false','false','false',7,'modus','2023-03-08 19:47:02','true',8,NULL,NULL,'2025-03-23 20:11:53','false','2025-03-23 20:12:45','a:2:{s:23:\"user-manager-pagination\";s:1:\"5\";s:11:\"admin_theme\";s:4:\"roma\";}'),
(2,15,'guest','en_GB','false','false','false',7,'modus','2023-03-08 19:47:02','true',0,NULL,NULL,NULL,'true','2023-03-08 19:47:02',NULL);
/*!40000 ALTER TABLE `piwigo_user_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_user_mail_notification`
--

DROP TABLE IF EXISTS `piwigo_user_mail_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_user_mail_notification` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `check_key` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `enabled` enum('true','false') NOT NULL DEFAULT 'false',
  `last_send` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_mail_notification_ui1` (`check_key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_user_mail_notification`
--

LOCK TABLES `piwigo_user_mail_notification` WRITE;
/*!40000 ALTER TABLE `piwigo_user_mail_notification` DISABLE KEYS */;
INSERT INTO `piwigo_user_mail_notification` VALUES
(0,'a','true','1970-01-01 00:00:01'),
(1,'vMTlsZqOaCHkGbYR','false',NULL);
/*!40000 ALTER TABLE `piwigo_user_mail_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piwigo_users`
--

DROP TABLE IF EXISTS `piwigo_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `piwigo_users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(255) DEFAULT NULL,
  `mail_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_ui1` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwigo_users`
--

LOCK TABLES `piwigo_users` WRITE;
/*!40000 ALTER TABLE `piwigo_users` DISABLE KEYS */;
INSERT INTO `piwigo_users` VALUES
(1,'admin','$P$Gi2xhKzyLNV8ITRJFXn3LEYrwsfpU..','admin@email.com'),
(2,'guest',NULL,NULL);
/*!40000 ALTER TABLE `piwigo_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-03-23 21:13:29
