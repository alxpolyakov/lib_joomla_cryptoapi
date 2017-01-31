-- MySQL dump 10.13  Distrib 5.6.16, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cryptocoin
-- ------------------------------------------------------
-- Server version	5.6.16-1~exp1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `crypto_payments`
--

DROP TABLE IF EXISTS `crypto_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crypto_payments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `box_id` int(11) unsigned NOT NULL DEFAULT '0',
  `box_type` enum('paymentbox','captchabox') NOT NULL,
  `virtuemart_order_id` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `country_code` varchar(3) NOT NULL DEFAULT '',
  `coin_label` varchar(6) NOT NULL DEFAULT '',
  `amount` double(20,8) NOT NULL DEFAULT '0.00000000',
  `amount_usd` double(20,8) NOT NULL DEFAULT '0.00000000',
  `unrecognised` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addr` varchar(34) NOT NULL DEFAULT '',
  `tx_id` char(64) NOT NULL DEFAULT '',
  `tx_date` datetime DEFAULT NULL,
  `tx_confirmed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tx_check_date` datetime DEFAULT NULL,
  `processed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `processed_date` datetime DEFAULT NULL,
  `record_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `box_id` (`box_id`),
  KEY `box_type` (`box_type`),
  KEY `user_id` (`user_id`),
  KEY `country_code` (`country_code`),
  KEY `virtuemart_order_id` (`virtuemart_order_id`),
  KEY `amount` (`amount`),
  KEY `amount_usd` (`amount_usd`),
  KEY `coin_label` (`coin_label`),
  KEY `unrecognised` (`unrecognised`),
  KEY `addr` (`addr`),
  KEY `tx_id` (`tx_id`),
  KEY `tx_date` (`tx_date`),
  KEY `tx_confirmed` (`tx_confirmed`),
  KEY `tx_check_date` (`tx_check_date`),
  KEY `processed` (`processed`),
  KEY `processed_date` (`processed_date`),
  KEY `record_created` (`record_created`),
  KEY `key1` (`box_id`,`virtuemart_order_id`),
  KEY `key2` (`box_id`,`virtuemart_order_id`,`user_id`),
  KEY `key3` (`box_id`,`virtuemart_order_id`,`user_id`,`tx_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crypto_payments`
--

LOCK TABLES `crypto_payments` WRITE;
/*!40000 ALTER TABLE `crypto_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `crypto_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_assets`
--

DROP TABLE IF EXISTS `j_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_assets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `level` int(10) unsigned NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_asset_name` (`name`),
  KEY `idx_lft_rgt` (`lft`,`rgt`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_assets`
--

LOCK TABLES `j_assets` WRITE;
/*!40000 ALTER TABLE `j_assets` DISABLE KEYS */;
INSERT INTO `j_assets` VALUES (1,0,0,103,0,'root.1','Root Asset','{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),(2,1,1,2,1,'com_admin','com_admin','{}'),(3,1,3,6,1,'com_banners','com_banners','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(4,1,7,8,1,'com_cache','com_cache','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(5,1,9,10,1,'com_checkin','com_checkin','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(6,1,11,12,1,'com_config','com_config','{}'),(7,1,13,16,1,'com_contact','com_contact','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(8,1,17,20,1,'com_content','com_content','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":[],\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.edit.own\":[]}'),(9,1,21,22,1,'com_cpanel','com_cpanel','{}'),(10,1,23,24,1,'com_installer','com_installer','{\"core.admin\":[],\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),(11,1,25,26,1,'com_languages','com_languages','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(12,1,27,28,1,'com_login','com_login','{}'),(13,1,29,30,1,'com_mailto','com_mailto','{}'),(14,1,31,32,1,'com_massmail','com_massmail','{}'),(15,1,33,34,1,'com_media','com_media','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),(16,1,35,38,1,'com_menus','com_menus','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(17,1,39,40,1,'com_messages','com_messages','{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),(18,1,41,72,1,'com_modules','com_modules','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(19,1,73,76,1,'com_newsfeeds','com_newsfeeds','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(20,1,77,78,1,'com_plugins','com_plugins','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(21,1,79,80,1,'com_redirect','com_redirect','{\"core.admin\":{\"7\":1},\"core.manage\":[]}'),(22,1,81,82,1,'com_search','com_search','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(23,1,83,84,1,'com_templates','com_templates','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(24,1,85,88,1,'com_users','com_users','{\"core.admin\":{\"7\":1},\"core.manage\":[],\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(26,1,89,90,1,'com_wrapper','com_wrapper','{}'),(27,8,18,19,2,'com_content.category.2','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(28,3,4,5,2,'com_banners.category.3','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(29,7,14,15,2,'com_contact.category.4','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(30,19,74,75,2,'com_newsfeeds.category.5','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[],\"core.edit.own\":[]}'),(32,24,86,87,1,'com_users.category.7','Uncategorised','{\"core.create\":[],\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(33,1,91,92,1,'com_finder','com_finder','{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),(34,1,93,94,1,'com_joomlaupdate','com_joomlaupdate','{\"core.admin\":[],\"core.manage\":[],\"core.delete\":[],\"core.edit.state\":[]}'),(35,1,95,96,1,'com_tags','com_tags','{\"core.admin\":[],\"core.manage\":[],\"core.manage\":[],\"core.delete\":[],\"core.edit.state\":[]}'),(36,1,97,98,1,'com_contenthistory','com_contenthistory','{}'),(37,1,99,100,1,'com_ajax','com_ajax','{}'),(38,1,101,102,1,'com_postinstall','com_postinstall','{}'),(39,18,42,43,2,'com_modules.module.1','Main Menu','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(40,18,44,45,2,'com_modules.module.2','Login','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(41,18,46,47,2,'com_modules.module.3','Popular Articles','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(42,18,48,49,2,'com_modules.module.4','Recently Added Articles','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(43,18,50,51,2,'com_modules.module.8','Toolbar','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(44,18,52,53,2,'com_modules.module.9','Quick Icons','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(45,18,54,55,2,'com_modules.module.10','Logged-in Users','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(46,18,56,57,2,'com_modules.module.12','Admin Menu','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(47,18,58,59,2,'com_modules.module.13','Admin Submenu','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(48,18,60,61,2,'com_modules.module.14','User Status','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(49,18,62,63,2,'com_modules.module.15','Title','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(50,18,64,65,2,'com_modules.module.16','Login Form','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(51,18,66,67,2,'com_modules.module.17','Breadcrumbs','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(52,18,68,69,2,'com_modules.module.79','Multilanguage status','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(53,18,70,71,2,'com_modules.module.86','Joomla Version','{\"core.delete\":[],\"core.edit\":[],\"core.edit.state\":[]}'),(54,16,36,37,2,'com_menus.menu.1','Main Menu','{}'),(55,1,117,118,1,'com_virtuemart','VIRTUEMART','{}'),(56,1,119,120,1,'com_virtuemart_allinone','VirtueMart_allinone','{}'),(57,18,72,73,2,'com_modules.module.87','VM - Administrator Module','{}'),(58,18,74,75,2,'com_modules.module.88','VM - Currencies Selector','{}'),(59,18,76,77,2,'com_modules.module.89','VM - Featured products','{}'),(60,18,78,79,2,'com_modules.module.90','VM - Search in Shop','{}'),(61,18,80,81,2,'com_modules.module.91','VM - Manufacturer','{}'),(62,18,82,83,2,'com_modules.module.92','VM - Shopping cart','{}'),(63,18,84,85,2,'com_modules.module.93','VM - Category','{}'),(64,1,121,122,1,'com_tcpdf','tcpdf','{}');
/*!40000 ALTER TABLE `j_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_associations`
--

DROP TABLE IF EXISTS `j_associations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.',
  PRIMARY KEY (`context`,`id`),
  KEY `idx_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_associations`
--

LOCK TABLES `j_associations` WRITE;
/*!40000 ALTER TABLE `j_associations` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_associations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_banner_clients`
--

DROP TABLE IF EXISTS `j_banner_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_banner_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_banner_clients`
--

LOCK TABLES `j_banner_clients` WRITE;
/*!40000 ALTER TABLE `j_banner_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_banner_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_banner_tracks`
--

DROP TABLE IF EXISTS `j_banner_tracks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) unsigned NOT NULL,
  `banner_id` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  KEY `idx_track_date` (`track_date`),
  KEY `idx_track_type` (`track_type`),
  KEY `idx_banner_id` (`banner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_banner_tracks`
--

LOCK TABLES `j_banner_tracks` WRITE;
/*!40000 ALTER TABLE `j_banner_tracks` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_banner_tracks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_banners`
--

DROP TABLE IF EXISTS `j_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_banners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT '0',
  `impmade` int(11) NOT NULL DEFAULT '0',
  `clicks` int(11) NOT NULL DEFAULT '0',
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(1) NOT NULL DEFAULT '0',
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT '-1',
  `track_clicks` tinyint(4) NOT NULL DEFAULT '-1',
  `track_impressions` tinyint(4) NOT NULL DEFAULT '-1',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `reset` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_own_prefix` (`own_prefix`),
  KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  KEY `idx_banner_catid` (`catid`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_banners`
--

LOCK TABLES `j_banners` WRITE;
/*!40000 ALTER TABLE `j_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_categories`
--

DROP TABLE IF EXISTS `j_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `cat_idx` (`extension`,`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_categories`
--

LOCK TABLES `j_categories` WRITE;
/*!40000 ALTER TABLE `j_categories` DISABLE KEYS */;
INSERT INTO `j_categories` VALUES (1,0,0,0,11,0,'','system','ROOT','root','','',1,0,'0000-00-00 00:00:00',1,'{}','','','{}',833,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1),(2,27,1,1,2,1,'uncategorised','com_content','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',833,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1),(3,28,1,3,4,1,'uncategorised','com_banners','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',833,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1),(4,29,1,5,6,1,'uncategorised','com_contact','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',833,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1),(5,30,1,7,8,1,'uncategorised','com_newsfeeds','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',833,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1),(7,32,1,9,10,1,'uncategorised','com_users','Uncategorised','uncategorised','','',1,0,'0000-00-00 00:00:00',1,'{\"category_layout\":\"\",\"image\":\"\"}','','','{\"author\":\"\",\"robots\":\"\"}',833,'2011-01-01 00:00:01',0,'0000-00-00 00:00:00',0,'*',1);
/*!40000 ALTER TABLE `j_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_contact_details`
--

DROP TABLE IF EXISTS `j_contact_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_contact_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `catid` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_contact_details`
--

LOCK TABLES `j_contact_details` WRITE;
/*!40000 ALTER TABLE `j_contact_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_contact_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_content`
--

DROP TABLE IF EXISTS `j_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`state`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_featured_catid` (`featured`,`catid`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_content`
--

LOCK TABLES `j_content` WRITE;
/*!40000 ALTER TABLE `j_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_content_frontpage`
--

DROP TABLE IF EXISTS `j_content_frontpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_content_frontpage`
--

LOCK TABLES `j_content_frontpage` WRITE;
/*!40000 ALTER TABLE `j_content_frontpage` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_content_frontpage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_content_rating`
--

DROP TABLE IF EXISTS `j_content_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `rating_sum` int(10) unsigned NOT NULL DEFAULT '0',
  `rating_count` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_content_rating`
--

LOCK TABLES `j_content_rating` WRITE;
/*!40000 ALTER TABLE `j_content_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_content_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_content_types`
--

DROP TABLE IF EXISTS `j_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_content_types` (
  `type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options',
  PRIMARY KEY (`type_id`),
  KEY `idx_alias` (`type_alias`(100))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_content_types`
--

LOCK TABLES `j_content_types` WRITE;
/*!40000 ALTER TABLE `j_content_types` DISABLE KEYS */;
INSERT INTO `j_content_types` VALUES (1,'Article','com_content.article','{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"Content\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"asset_id\"}, \"special\":{\"fulltext\":\"fulltext\"}}','ContentHelperRoute::getArticleRoute','{\"formFile\":\"administrator\\/components\\/com_content\\/models\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),(2,'Contact','com_contact.contact','{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"Contact\",\"prefix\":\"ContactTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}','ContactHelperRoute::getContactRoute','{\"formFile\":\"administrator\\/components\\/com_contact\\/models\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\",\"xreference\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }'),(3,'Newsfeed','com_newsfeeds.newsfeed','{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"Newsfeed\",\"prefix\":\"NewsfeedsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"xreference\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}','NewsfeedsHelperRoute::getNewsfeedRoute','{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/models\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),(4,'User','com_users.user','{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerdate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}','UsersHelperRoute::getUserRoute',''),(5,'Article Category','com_content.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','ContentHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(6,'Contact Category','com_contact.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','ContactHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(7,'Newsfeeds Category','com_newsfeeds.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','NewsfeedsHelperRoute::getCategoryRoute','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(8,'Tag','com_tags.tag','{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"Tag\",\"prefix\":\"TagsTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}','TagsHelperRoute::getTagRoute','{\"formFile\":\"administrator\\/components\\/com_tags\\/models\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),(9,'Banner','com_banners.banner','{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"Banner\",\"prefix\":\"BannersTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"core_xreference\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}','','{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),(10,'Banners Category','com_banners.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),(11,'Banner Client','com_banners.client','{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"Client\",\"prefix\":\"BannersTable\"}}','','','','{\"formFile\":\"administrator\\/components\\/com_banners\\/models\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}'),(12,'User Notes','com_users.note','{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"Note\",\"prefix\":\"UsersTable\"}}','','','','{\"formFile\":\"administrator\\/components\\/com_users\\/models\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),(13,'User Notes Category','com_users.category','{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"Category\",\"prefix\":\"JTable\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"JTable\",\"config\":\"array()\"}}','','{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"core_xreference\":\"null\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}','','{\"formFile\":\"administrator\\/components\\/com_categories\\/models\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');
/*!40000 ALTER TABLE `j_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_contentitem_tag_map`
--

DROP TABLE IF EXISTS `j_contentitem_tag_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) unsigned NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) unsigned NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(8) NOT NULL COMMENT 'PK from the content_type table',
  UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  KEY `idx_tag_type` (`tag_id`,`type_id`),
  KEY `idx_date_id` (`tag_date`,`tag_id`),
  KEY `idx_core_content_id` (`core_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_contentitem_tag_map`
--

LOCK TABLES `j_contentitem_tag_map` WRITE;
/*!40000 ALTER TABLE `j_contentitem_tag_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_contentitem_tag_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_core_log_searches`
--

DROP TABLE IF EXISTS `j_core_log_searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_core_log_searches` (
  `search_term` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_core_log_searches`
--

LOCK TABLES `j_core_log_searches` WRITE;
/*!40000 ALTER TABLE `j_core_log_searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_core_log_searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_extensions`
--

DROP TABLE IF EXISTS `j_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_extensions` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(3) NOT NULL,
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  `access` int(10) unsigned NOT NULL DEFAULT '1',
  `protected` tinyint(3) NOT NULL DEFAULT '0',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `system_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) DEFAULT '0',
  `state` int(11) DEFAULT '0',
  PRIMARY KEY (`extension_id`),
  KEY `element_clientid` (`element`,`client_id`),
  KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  KEY `extension` (`type`,`element`,`folder`,`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10033 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_extensions`
--

LOCK TABLES `j_extensions` WRITE;
/*!40000 ALTER TABLE `j_extensions` DISABLE KEYS */;
INSERT INTO `j_extensions` VALUES (1,'com_mailto','component','com_mailto','',0,1,1,1,'{\"name\":\"com_mailto\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MAILTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mailto\"}','','','',0,'0000-00-00 00:00:00',0,0),(2,'com_wrapper','component','com_wrapper','',0,1,1,1,'{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"wrapper\"}','','','',0,'0000-00-00 00:00:00',0,0),(3,'com_admin','component','com_admin','',1,1,1,1,'{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(4,'com_banners','component','com_banners','',1,1,1,0,'{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}','{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}','','',0,'0000-00-00 00:00:00',0,0),(5,'com_cache','component','com_cache','',1,1,1,1,'{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(6,'com_categories','component','com_categories','',1,1,1,1,'{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(7,'com_checkin','component','com_checkin','',1,1,1,1,'{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(8,'com_contact','component','com_contact','',1,1,1,0,'{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}','{\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_misc\":\"1\",\"show_image\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"show_profile\":\"0\",\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"show_headings\":\"1\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"allow_vcard_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_email_form\":\"1\",\"show_email_copy\":\"1\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_category_crumb\":\"0\",\"metakey\":\"\",\"metadesc\":\"\",\"robots\":\"\",\"author\":\"\",\"rights\":\"\",\"xreference\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(9,'com_cpanel','component','com_cpanel','',1,1,1,1,'{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(10,'com_installer','component','com_installer','',1,1,1,1,'{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(11,'com_languages','component','com_languages','',1,1,1,1,'{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}','{\"admin_language\":\"ru-RU\",\"language\":\"ru-RU\"}','','',0,'0000-00-00 00:00:00',0,0),(12,'com_login','component','com_login','',1,1,1,1,'{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(13,'com_media','component','com_media','',1,1,0,1,'{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}','{\"upload_extensions\":\"bmp,csv,doc,gif,ico,jpg,jpeg,odg,odp,ods,odt,pdf,png,ppt,swf,txt,xcf,xls,BMP,CSV,DOC,GIF,ICO,JPG,JPEG,ODG,ODP,ODS,ODT,PDF,PNG,PPT,SWF,TXT,XCF,XLS\",\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,application\\/x-shockwave-flash,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\",\"upload_mime_illegal\":\"text\\/html\"}','','',0,'0000-00-00 00:00:00',0,0),(14,'com_menus','component','com_menus','',1,1,1,1,'{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(15,'com_messages','component','com_messages','',1,1,1,1,'{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(16,'com_modules','component','com_modules','',1,1,1,1,'{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(17,'com_newsfeeds','component','com_newsfeeds','',1,1,1,0,'{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(18,'com_plugins','component','com_plugins','',1,1,1,1,'{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(19,'com_search','component','com_search','',1,1,1,0,'{\"name\":\"com_search\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"search\"}','{\"enabled\":\"0\",\"show_date\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(20,'com_templates','component','com_templates','',1,1,1,1,'{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}','{\"template_positions_display\":\"0\",\"upload_limit\":\"10\",\"image_formats\":\"gif,bmp,jpg,jpeg,png\",\"source_formats\":\"txt,less,ini,xml,js,php,css\",\"font_formats\":\"woff,ttf,otf\",\"compressed_formats\":\"zip\"}','','',0,'0000-00-00 00:00:00',0,0),(22,'com_content','component','com_content','',1,1,0,1,'{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"show_category\":\"1\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_author\":\"1\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"1\",\"show_item_navigation\":\"1\",\"show_vote\":\"0\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":\"100\",\"show_icons\":\"1\",\"show_print_icon\":\"1\",\"show_email_icon\":\"1\",\"show_hits\":\"1\",\"show_noauth\":\"0\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"save_history\":\"1\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":\"1\",\"num_intro_articles\":\"4\",\"num_columns\":\"2\",\"num_links\":\"4\",\"multi_column_order\":\"0\",\"show_subcategory_content\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(23,'com_config','component','com_config','',1,1,0,1,'{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\"}','{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"9\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}','','',0,'0000-00-00 00:00:00',0,0),(24,'com_redirect','component','com_redirect','',1,1,0,1,'{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(25,'com_users','component','com_users','',1,1,0,1,'{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"April 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}','{\"allowUserRegistration\":\"0\",\"new_usertype\":\"2\",\"guest_usergroup\":\"9\",\"sendpassword\":\"1\",\"useractivation\":\"1\",\"mail_to_admin\":\"0\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"minimum_length\":\"4\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"save_history\":\"1\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(27,'com_finder','component','com_finder','',1,1,0,0,'{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}','{\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_advanced\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"memory_table_limit\":30000,\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stemmer\":\"snowball\"}','','',0,'0000-00-00 00:00:00',0,0),(28,'com_joomlaupdate','component','com_joomlaupdate','',1,1,0,1,'{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"February 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.2\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(29,'com_tags','component','com_tags','',1,1,1,1,'{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"December 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','{\"tag_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"show_tag_num_items\":\"0\",\"tag_list_orderby\":\"title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_descripion\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(30,'com_contenthistory','component','com_contenthistory','',1,1,1,0,'{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"May 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contenthistory\"}','','','',0,'0000-00-00 00:00:00',0,0),(31,'com_ajax','component','com_ajax','',1,1,1,1,'{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}','','','',0,'0000-00-00 00:00:00',0,0),(32,'com_postinstall','component','com_postinstall','',1,1,1,1,'{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(102,'phputf8','library','phputf8','',0,1,1,1,'{\"name\":\"phputf8\",\"type\":\"library\",\"creationDate\":\"2006\",\"author\":\"Harry Fuecks\",\"copyright\":\"Copyright various authors\",\"authorEmail\":\"hfuecks@gmail.com\",\"authorUrl\":\"http:\\/\\/sourceforge.net\\/projects\\/phputf8\",\"version\":\"0.5\",\"description\":\"LIB_PHPUTF8_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phputf8\"}','','','',0,'0000-00-00 00:00:00',0,0),(103,'Joomla! Platform','library','joomla','',0,1,1,1,'{\"name\":\"Joomla! Platform\",\"type\":\"library\",\"creationDate\":\"2008\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"https:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{\"mediaversion\":\"2309e0d6aedd86d322b9e09e6930891d\"}','','',0,'0000-00-00 00:00:00',0,0),(104,'IDNA Convert','library','idna_convert','',0,1,1,1,'{\"name\":\"IDNA Convert\",\"type\":\"library\",\"creationDate\":\"2004\",\"author\":\"phlyLabs\",\"copyright\":\"2004-2011 phlyLabs Berlin, http:\\/\\/phlylabs.de\",\"authorEmail\":\"phlymail@phlylabs.de\",\"authorUrl\":\"http:\\/\\/phlylabs.de\",\"version\":\"0.8.0\",\"description\":\"LIB_IDNA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"idna_convert\"}','','','',0,'0000-00-00 00:00:00',0,0),(105,'FOF','library','fof','',0,1,1,1,'{\"name\":\"FOF\",\"type\":\"library\",\"creationDate\":\"2015-04-22 13:15:32\",\"author\":\"Nicholas K. Dionysopoulos \\/ Akeeba Ltd\",\"copyright\":\"(C)2011-2015 Nicholas K. Dionysopoulos\",\"authorEmail\":\"nicholas@akeebabackup.com\",\"authorUrl\":\"https:\\/\\/www.akeebabackup.com\",\"version\":\"2.4.3\",\"description\":\"LIB_FOF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fof\"}','','','',0,'0000-00-00 00:00:00',0,0),(106,'PHPass','library','phpass','',0,1,1,1,'{\"name\":\"PHPass\",\"type\":\"library\",\"creationDate\":\"2004-2006\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"http:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}','','','',0,'0000-00-00 00:00:00',0,0),(200,'mod_articles_archive','module','mod_articles_archive','',0,1,1,0,'{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_archive\"}','','','',0,'0000-00-00 00:00:00',0,0),(201,'mod_articles_latest','module','mod_articles_latest','',0,1,1,0,'{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_latest\"}','','','',0,'0000-00-00 00:00:00',0,0),(202,'mod_articles_popular','module','mod_articles_popular','',0,1,1,0,'{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_popular\"}','','','',0,'0000-00-00 00:00:00',0,0),(203,'mod_banners','module','mod_banners','',0,1,1,0,'{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_banners\"}','','','',0,'0000-00-00 00:00:00',0,0),(204,'mod_breadcrumbs','module','mod_breadcrumbs','',0,1,1,1,'{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_breadcrumbs\"}','','','',0,'0000-00-00 00:00:00',0,0),(205,'mod_custom','module','mod_custom','',0,1,1,1,'{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}','','','',0,'0000-00-00 00:00:00',0,0),(206,'mod_feed','module','mod_feed','',0,1,1,0,'{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}','','','',0,'0000-00-00 00:00:00',0,0),(207,'mod_footer','module','mod_footer','',0,1,1,0,'{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_footer\"}','','','',0,'0000-00-00 00:00:00',0,0),(208,'mod_login','module','mod_login','',0,1,1,1,'{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}','','','',0,'0000-00-00 00:00:00',0,0),(209,'mod_menu','module','mod_menu','',0,1,1,1,'{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}','','','',0,'0000-00-00 00:00:00',0,0),(210,'mod_articles_news','module','mod_articles_news','',0,1,1,0,'{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_news\"}','','','',0,'0000-00-00 00:00:00',0,0),(211,'mod_random_image','module','mod_random_image','',0,1,1,0,'{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"July 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_random_image\"}','','','',0,'0000-00-00 00:00:00',0,0),(212,'mod_related_items','module','mod_related_items','',0,1,1,0,'{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_related_items\"}','','','',0,'0000-00-00 00:00:00',0,0),(213,'mod_search','module','mod_search','',0,1,1,0,'{\"name\":\"mod_search\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SEARCH_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_search\"}','','','',0,'0000-00-00 00:00:00',0,0),(214,'mod_stats','module','mod_stats','',0,1,1,0,'{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats\"}','','','',0,'0000-00-00 00:00:00',0,0),(215,'mod_syndicate','module','mod_syndicate','',0,1,1,1,'{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"May 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_syndicate\"}','','','',0,'0000-00-00 00:00:00',0,0),(216,'mod_users_latest','module','mod_users_latest','',0,1,1,0,'{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"December 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_users_latest\"}','','','',0,'0000-00-00 00:00:00',0,0),(218,'mod_whosonline','module','mod_whosonline','',0,1,1,0,'{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_whosonline\"}','','','',0,'0000-00-00 00:00:00',0,0),(219,'mod_wrapper','module','mod_wrapper','',0,1,1,0,'{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"October 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_wrapper\"}','','','',0,'0000-00-00 00:00:00',0,0),(220,'mod_articles_category','module','mod_articles_category','',0,1,1,0,'{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_category\"}','','','',0,'0000-00-00 00:00:00',0,0),(221,'mod_articles_categories','module','mod_articles_categories','',0,1,1,0,'{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_categories\"}','','','',0,'0000-00-00 00:00:00',0,0),(222,'mod_languages','module','mod_languages','',0,1,1,1,'{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"February 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_languages\"}','','','',0,'0000-00-00 00:00:00',0,0),(223,'mod_finder','module','mod_finder','',0,1,0,0,'{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_finder\"}','','','',0,'0000-00-00 00:00:00',0,0),(300,'mod_custom','module','mod_custom','',1,1,1,1,'{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}','','','',0,'0000-00-00 00:00:00',0,0),(301,'mod_feed','module','mod_feed','',1,1,1,0,'{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"July 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}','','','',0,'0000-00-00 00:00:00',0,0),(302,'mod_latest','module','mod_latest','',1,1,1,0,'{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latest\"}','','','',0,'0000-00-00 00:00:00',0,0),(303,'mod_logged','module','mod_logged','',1,1,1,0,'{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"January 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_logged\"}','','','',0,'0000-00-00 00:00:00',0,0),(304,'mod_login','module','mod_login','',1,1,1,1,'{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"March 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}','','','',0,'0000-00-00 00:00:00',0,0),(305,'mod_menu','module','mod_menu','',1,1,1,0,'{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}','','','',0,'0000-00-00 00:00:00',0,0),(307,'mod_popular','module','mod_popular','',1,1,1,0,'{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_popular\"}','','','',0,'0000-00-00 00:00:00',0,0),(308,'mod_quickicon','module','mod_quickicon','',1,1,1,1,'{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_quickicon\"}','','','',0,'0000-00-00 00:00:00',0,0),(309,'mod_status','module','mod_status','',1,1,1,0,'{\"name\":\"mod_status\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_status\"}','','','',0,'0000-00-00 00:00:00',0,0),(310,'mod_submenu','module','mod_submenu','',1,1,1,0,'{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"Feb 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_submenu\"}','','','',0,'0000-00-00 00:00:00',0,0),(311,'mod_title','module','mod_title','',1,1,1,0,'{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}','','','',0,'0000-00-00 00:00:00',0,0),(312,'mod_toolbar','module','mod_toolbar','',1,1,1,1,'{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"Nov 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}','','','',0,'0000-00-00 00:00:00',0,0),(313,'mod_multilangstatus','module','mod_multilangstatus','',1,1,1,0,'{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"September 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}','{\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(314,'mod_version','module','mod_version','',1,1,1,0,'{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"January 2012\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_version\"}','{\"format\":\"short\",\"product\":\"1\",\"cache\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(315,'mod_stats_admin','module','mod_stats_admin','',1,1,1,0,'{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"July 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats_admin\"}','{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}','','',0,'0000-00-00 00:00:00',0,0),(316,'mod_tags_popular','module','mod_tags_popular','',0,1,1,0,'{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_popular\"}','{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(317,'mod_tags_similar','module','mod_tags_similar','',0,1,1,0,'{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"January 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_similar\"}','{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(400,'plg_authentication_gmail','plugin','gmail','authentication',0,0,1,0,'{\"name\":\"plg_authentication_gmail\",\"type\":\"plugin\",\"creationDate\":\"February 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_GMAIL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"gmail\"}','{\"applysuffix\":\"0\",\"suffix\":\"\",\"verifypeer\":\"1\",\"user_blacklist\":\"\"}','','',0,'0000-00-00 00:00:00',1,0),(401,'plg_authentication_joomla','plugin','joomla','authentication',0,1,1,1,'{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','','','',0,'0000-00-00 00:00:00',0,0),(402,'plg_authentication_ldap','plugin','ldap','authentication',0,0,1,0,'{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}','{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}','','',0,'0000-00-00 00:00:00',3,0),(403,'plg_content_contact','plugin','contact','content',0,1,1,0,'{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"January 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}','','','',0,'0000-00-00 00:00:00',1,0),(404,'plg_content_emailcloak','plugin','emailcloak','content',0,1,1,0,'{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"emailcloak\"}','{\"mode\":\"1\"}','','',0,'0000-00-00 00:00:00',1,0),(406,'plg_content_loadmodule','plugin','loadmodule','content',0,1,1,0,'{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}','{\"style\":\"xhtml\"}','','',0,'2011-09-18 15:22:50',0,0),(407,'plg_content_pagebreak','plugin','pagebreak','content',0,1,1,0,'{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}','{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}','','',0,'0000-00-00 00:00:00',4,0),(408,'plg_content_pagenavigation','plugin','pagenavigation','content',0,1,1,0,'{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"January 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}','{\"position\":\"1\"}','','',0,'0000-00-00 00:00:00',5,0),(409,'plg_content_vote','plugin','vote','content',0,1,1,0,'{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}','','','',0,'0000-00-00 00:00:00',6,0),(410,'plg_editors_codemirror','plugin','codemirror','editors',0,1,1,1,'{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"http:\\/\\/codemirror.net\\/\",\"version\":\"5.17.0\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"codemirror\"}','{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}','','',0,'0000-00-00 00:00:00',1,0),(411,'plg_editors_none','plugin','none','editors',0,1,1,1,'{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"September 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"none\"}','','','',0,'0000-00-00 00:00:00',2,0),(412,'plg_editors_tinymce','plugin','tinymce','editors',0,1,1,0,'{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-2016\",\"author\":\"Ephox Corporation\",\"copyright\":\"Ephox Corporation\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"http:\\/\\/www.tinymce.com\",\"version\":\"4.4.0\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tinymce\"}','{\"mode\":\"1\",\"skin\":\"0\",\"mobile\":\"0\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"extended_elements\":\"\",\"html_height\":\"550\",\"html_width\":\"750\",\"resizing\":\"1\",\"element_path\":\"1\",\"fonts\":\"1\",\"paste\":\"1\",\"searchreplace\":\"1\",\"insertdate\":\"1\",\"colors\":\"1\",\"table\":\"1\",\"smilies\":\"1\",\"hr\":\"1\",\"link\":\"1\",\"media\":\"1\",\"print\":\"1\",\"directionality\":\"1\",\"fullscreen\":\"1\",\"alignment\":\"1\",\"visualchars\":\"1\",\"visualblocks\":\"1\",\"nonbreaking\":\"1\",\"template\":\"1\",\"blockquote\":\"1\",\"wordcount\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"inlinepopups\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}','','',0,'0000-00-00 00:00:00',3,0),(413,'plg_editors-xtd_article','plugin','article','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"October 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"article\"}','','','',0,'0000-00-00 00:00:00',1,0),(414,'plg_editors-xtd_image','plugin','image','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"image\"}','','','',0,'0000-00-00 00:00:00',2,0),(415,'plg_editors-xtd_pagebreak','plugin','pagebreak','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"August 2004\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}','','','',0,'0000-00-00 00:00:00',3,0),(416,'plg_editors-xtd_readmore','plugin','readmore','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"March 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"readmore\"}','','','',0,'0000-00-00 00:00:00',4,0),(417,'plg_search_categories','plugin','categories','search',0,1,1,0,'{\"name\":\"plg_search_categories\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(418,'plg_search_contacts','plugin','contacts','search',0,1,1,0,'{\"name\":\"plg_search_contacts\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(419,'plg_search_content','plugin','content','search',0,1,1,0,'{\"name\":\"plg_search_content\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(420,'plg_search_newsfeeds','plugin','newsfeeds','search',0,1,1,0,'{\"name\":\"plg_search_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"November 2005\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','{\"search_limit\":\"50\",\"search_content\":\"1\",\"search_archived\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(422,'plg_system_languagefilter','plugin','languagefilter','system',0,0,1,1,'{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"July 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}','','','',0,'0000-00-00 00:00:00',1,0),(423,'plg_system_p3p','plugin','p3p','system',0,0,1,0,'{\"name\":\"plg_system_p3p\",\"type\":\"plugin\",\"creationDate\":\"September 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_P3P_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"p3p\"}','{\"headers\":\"NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM\"}','','',0,'0000-00-00 00:00:00',2,0),(424,'plg_system_cache','plugin','cache','system',0,0,1,1,'{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"February 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cache\"}','{\"browsercache\":\"0\",\"cachetime\":\"15\"}','','',0,'0000-00-00 00:00:00',9,0),(425,'plg_system_debug','plugin','debug','system',0,1,1,0,'{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"debug\"}','{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}','','',0,'0000-00-00 00:00:00',4,0),(426,'plg_system_log','plugin','log','system',0,1,1,1,'{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}','','','',0,'0000-00-00 00:00:00',5,0),(427,'plg_system_redirect','plugin','redirect','system',0,0,1,1,'{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}','','','',0,'0000-00-00 00:00:00',6,0),(428,'plg_system_remember','plugin','remember','system',0,1,1,1,'{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"April 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}','','','',0,'0000-00-00 00:00:00',7,0),(429,'plg_system_sef','plugin','sef','system',0,1,1,0,'{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"December 2007\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}','','','',0,'0000-00-00 00:00:00',8,0),(430,'plg_system_logout','plugin','logout','system',0,1,1,1,'{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"April 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}','','','',0,'0000-00-00 00:00:00',3,0),(431,'plg_user_contactcreator','plugin','contactcreator','user',0,0,1,0,'{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"August 2009\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}','{\"autowebpage\":\"\",\"category\":\"34\",\"autopublish\":\"0\"}','','',0,'0000-00-00 00:00:00',1,0),(432,'plg_user_joomla','plugin','joomla','user',0,1,1,0,'{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"December 2006\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','{\"autoregister\":\"1\",\"mail_to_user\":\"1\",\"forceLogout\":\"1\"}','','',0,'0000-00-00 00:00:00',2,0),(433,'plg_user_profile','plugin','profile','user',0,0,1,0,'{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"January 2008\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}','{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(434,'plg_extension_joomla','plugin','joomla','extension',0,1,1,1,'{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"May 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','','','',0,'0000-00-00 00:00:00',1,0),(435,'plg_content_joomla','plugin','joomla','content',0,1,1,0,'{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"November 2010\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}','','','',0,'0000-00-00 00:00:00',0,0),(436,'plg_system_languagecode','plugin','languagecode','system',0,0,1,0,'{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"November 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}','','','',0,'0000-00-00 00:00:00',10,0),(437,'plg_quickicon_joomlaupdate','plugin','joomlaupdate','quickicon',0,1,1,1,'{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomlaupdate\"}','','','',0,'0000-00-00 00:00:00',0,0),(438,'plg_quickicon_extensionupdate','plugin','extensionupdate','quickicon',0,1,1,1,'{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"extensionupdate\"}','','','',0,'0000-00-00 00:00:00',0,0),(439,'plg_captcha_recaptcha','plugin','recaptcha','captcha',0,0,1,0,'{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha\"}','{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}','','',0,'0000-00-00 00:00:00',0,0),(440,'plg_system_highlight','plugin','highlight','system',0,1,1,0,'{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"highlight\"}','','','',0,'0000-00-00 00:00:00',7,0),(441,'plg_content_finder','plugin','finder','content',0,0,1,0,'{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"December 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}','','','',0,'0000-00-00 00:00:00',0,0),(442,'plg_finder_categories','plugin','categories','finder',0,1,1,0,'{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}','','','',0,'0000-00-00 00:00:00',1,0),(443,'plg_finder_contacts','plugin','contacts','finder',0,1,1,0,'{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}','','','',0,'0000-00-00 00:00:00',2,0),(444,'plg_finder_content','plugin','content','finder',0,1,1,0,'{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}','','','',0,'0000-00-00 00:00:00',3,0),(445,'plg_finder_newsfeeds','plugin','newsfeeds','finder',0,1,1,0,'{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"August 2011\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}','','','',0,'0000-00-00 00:00:00',4,0),(447,'plg_finder_tags','plugin','tags','finder',0,1,1,0,'{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"February 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','','','',0,'0000-00-00 00:00:00',0,0),(448,'plg_twofactorauth_totp','plugin','totp','twofactorauth',0,0,1,0,'{\"name\":\"plg_twofactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"August 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"totp\"}','','','',0,'0000-00-00 00:00:00',0,0),(449,'plg_authentication_cookie','plugin','cookie','authentication',0,1,1,0,'{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"July 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTH_COOKIE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cookie\"}','','','',0,'0000-00-00 00:00:00',0,0),(450,'plg_twofactorauth_yubikey','plugin','yubikey','twofactorauth',0,0,1,0,'{\"name\":\"plg_twofactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"September 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_TWOFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"yubikey\"}','','','',0,'0000-00-00 00:00:00',0,0),(451,'plg_search_tags','plugin','tags','search',0,1,1,0,'{\"name\":\"plg_search_tags\",\"type\":\"plugin\",\"creationDate\":\"March 2014\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEARCH_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}','{\"search_limit\":\"50\",\"show_tagged_items\":\"1\"}','','',0,'0000-00-00 00:00:00',0,0),(452,'plg_system_updatenotification','plugin','updatenotification','system',0,1,1,0,'{\"name\":\"plg_system_updatenotification\",\"type\":\"plugin\",\"creationDate\":\"May 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"updatenotification\"}','{\"lastrun\":1485891316}','','',0,'0000-00-00 00:00:00',0,0),(453,'plg_editors-xtd_module','plugin','module','editors-xtd',0,1,1,0,'{\"name\":\"plg_editors-xtd_module\",\"type\":\"plugin\",\"creationDate\":\"October 2015\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_MODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"module\"}','','','',0,'0000-00-00 00:00:00',0,0),(454,'plg_system_stats','plugin','stats','system',0,1,1,0,'{\"name\":\"plg_system_stats\",\"type\":\"plugin\",\"creationDate\":\"November 2013\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"stats\"}','{\"mode\":3,\"lastrun\":1485588561,\"unique_id\":\"08f1ca14fa32203e7023e553e56aed11f2e5a623\",\"interval\":12}','','',0,'0000-00-00 00:00:00',0,0),(455,'plg_installer_packageinstaller','plugin','packageinstaller','installer',0,1,1,1,'{\"name\":\"plg_installer_packageinstaller\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"packageinstaller\"}','','','',0,'0000-00-00 00:00:00',1,0),(456,'PLG_INSTALLER_FOLDERINSTALLER','plugin','folderinstaller','installer',0,1,1,1,'{\"name\":\"PLG_INSTALLER_FOLDERINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"folderinstaller\"}','','','',0,'0000-00-00 00:00:00',2,0),(457,'PLG_INSTALLER_URLINSTALLER','plugin','urlinstaller','installer',0,1,1,1,'{\"name\":\"PLG_INSTALLER_URLINSTALLER\",\"type\":\"plugin\",\"creationDate\":\"May 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"urlinstaller\"}','','','',0,'0000-00-00 00:00:00',3,0),(503,'beez3','template','beez3','',0,1,1,0,'{\"name\":\"beez3\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"a.radtke@derauftritt.de\",\"authorUrl\":\"http:\\/\\/www.der-auftritt.de\",\"version\":\"3.1.0\",\"description\":\"TPL_BEEZ3_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"center\",\"templatecolor\":\"nature\"}','','',0,'0000-00-00 00:00:00',0,0),(504,'hathor','template','hathor','',1,1,1,0,'{\"name\":\"hathor\",\"type\":\"template\",\"creationDate\":\"May 2010\",\"author\":\"Andrea Tarr\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"3.0.0\",\"description\":\"TPL_HATHOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"showSiteName\":\"0\",\"colourChoice\":\"0\",\"boldText\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(506,'protostar','template','protostar','',0,1,1,0,'{\"name\":\"protostar\",\"type\":\"template\",\"creationDate\":\"4\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_PROTOSTAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}','','',0,'0000-00-00 00:00:00',0,0),(507,'isis','template','isis','',1,1,1,0,'{\"name\":\"isis\",\"type\":\"template\",\"creationDate\":\"3\\/30\\/2012\",\"author\":\"Kyle Ledbetter\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ISIS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{\"templateColor\":\"\",\"logoFile\":\"\"}','','',0,'0000-00-00 00:00:00',0,0),(600,'English (en-GB)','language','en-GB','',0,1,1,1,'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.2\",\"description\":\"en-GB site language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(601,'English (en-GB)','language','en-GB','',1,1,1,1,'{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.2\",\"description\":\"en-GB administrator language\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(700,'files_joomla','file','joomla','',0,1,1,1,'{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 - 2016 Open Source Matters. All rights reserved\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.2\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}','','','',0,'0000-00-00 00:00:00',0,0),(802,'English (en-GB) Language Pack','package','pkg_en-GB','',0,1,1,1,'{\"name\":\"English (en-GB) Language Pack\",\"type\":\"package\",\"creationDate\":\"August 2016\",\"author\":\"Joomla! Project\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters, Inc. All rights reserved.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.2.1\",\"description\":\"en-GB language pack\",\"group\":\"\",\"filename\":\"pkg_en-GB\"}','','','',0,'0000-00-00 00:00:00',0,0),(10000,'VIRTUEMART','component','com_virtuemart','',1,1,0,0,'{\"name\":\"VIRTUEMART\",\"type\":\"component\",\"creationDate\":\"August 30 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004-2015 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"max|at|virtuemart.net\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.17.8\",\"description\":\"\",\"group\":\"\",\"filename\":\"virtuemart\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10001,'VirtueMart_allinone','component','com_virtuemart_allinone','',1,1,0,0,'{\"name\":\"VirtueMart_allinone\",\"type\":\"component\",\"creationDate\":\"August 30 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004-2015 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.17.8\",\"description\":\"\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10002,'VM Payment - Standard','plugin','standard','vmpayment',0,1,1,0,'{\"name\":\"Standard\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"Standard payment plugin\",\"group\":\"\",\"filename\":\"standard\"}','','','',0,'0000-00-00 00:00:00',20,0),(10003,'VM Payment - Klarna','plugin','klarna','vmpayment',0,0,1,0,'{\"name\":\"Klarna\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"Klarna VirtueMart Payment Plugin\",\"group\":\"\",\"filename\":\"klarna\"}','','','',0,'0000-00-00 00:00:00',6,0),(10004,'VM Payment - KlarnaCheckout','plugin','klarnacheckout','vmpayment',0,0,1,0,'{\"name\":\"Klarna Checkout\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"\",\"group\":\"\",\"filename\":\"klarnacheckout\"}','','','',0,'0000-00-00 00:00:00',20,0),(10005,'VM Payment - Sofort Banking/Überweisung','plugin','sofort','vmpayment',0,0,1,0,'{\"name\":\"Sofort\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"<a href=\\\"http:\\/www.sofort.com\\\" target=\\\"_blank\\\">Sofort<\\/a> is a popular\\n\\tpayment provider and available in many countries. \\n    \",\"group\":\"\",\"filename\":\"sofort\"}','','','',0,'0000-00-00 00:00:00',4,0),(10006,'VM Payment - PayPal','plugin','paypal','vmpayment',0,1,1,0,'{\"name\":\"PayPal\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"PayPal\",\"group\":\"\",\"filename\":\"paypal\"}','','','',0,'0000-00-00 00:00:00',0,0),(10007,'VM Payment - Heidelpay','plugin','heidelpay','vmpayment',0,0,1,0,'{\"name\":\"Heidelpay\",\"type\":\"plugin\",\"creationDate\":\"12-Sep-2012\",\"author\":\"Heidelberger Payment GmbH\",\"copyright\":\"Copyright Heidelberger Payment GmbH\",\"authorEmail\":\"info@heidelpay.de\",\"authorUrl\":\"http:\\/\\/www.heidelpay.de\",\"version\":\"3.0.0\",\"description\":\"\\n        <h2>Virtuemart Plugin von:<\\/h2><p><a href=\\\"http:\\/\\/www.Heidelpay.de\\\" target=\\\"_blank\\\"><img src=\\\"http:\\/\\/www.heidelpay.de\\/gfx\\/logo.gif\\\" style=\\\"margin-right:20px;\\\"\\/><\\/a><\\/p> \",\"group\":\"\",\"filename\":\"heidelpay\"}','','','',0,'0000-00-00 00:00:00',8,0),(10008,'VM Payment - Paybox','plugin','paybox','vmpayment',0,0,1,0,'{\"name\":\"VM Payment - Paybox\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"<a href=\\\"http:\\/\\/paybox.com\\\" target=\\\"_blank\\\">Paybox<\\/a> \\n    \",\"group\":\"\",\"filename\":\"paybox\"}','','','',0,'0000-00-00 00:00:00',7,0),(10009,'VM Payment - 2Checkout','plugin','tco','vmpayment',0,0,1,0,'{\"name\":\"2Checkout\",\"type\":\"plugin\",\"creationDate\":\"October 2015\",\"author\":\"Craig Christenson\",\"copyright\":\"Copyright (C) 2004-2015 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.2checkout.com\",\"version\":\"0.1\",\"description\":\"<a href=\\\"https:\\/\\/www.2checkout.com\\/referral?r=virtuemart\\\" target=\\\"_blank\\\">2Checkout<\\/a> is a popular payment provider and available in many countries. \\n    \",\"group\":\"\",\"filename\":\"tco\"}','','','',0,'0000-00-00 00:00:00',1,0),(10010,'VM Payment - Pay with Amazon','plugin','amazon','vmpayment',0,0,1,0,'{\"name\":\"AMAZON\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"AMAZON payment plugin\",\"group\":\"\",\"filename\":\"amazon\"}','','','',0,'0000-00-00 00:00:00',2,0),(10011,'System - Pay with Amazon','plugin','amazon','system',0,0,1,0,'{\"name\":\"AMAZON\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"AMAZON payment SYSTEM plugin\",\"group\":\"\",\"filename\":\"amazon\"}','','','',0,'0000-00-00 00:00:00',2,0),(10012,'VM Payment - Realex HPP & API','plugin','realex_hpp_api','vmpayment',0,0,1,0,'{\"name\":\"realex_hpp_api\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"Realex HPP and API\",\"group\":\"\",\"filename\":\"realex_hpp_api\"}','','','',0,'0000-00-00 00:00:00',3,0),(10013,'VM UserField - Realex HPP & API','plugin','realex_hpp_api','vmuserfield',0,0,1,0,'{\"name\":\"Realex_hpp_api\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"Card storage plugin for Realex\",\"group\":\"\",\"filename\":\"realex_hpp_api\"}','','','',0,'0000-00-00 00:00:00',3,0),(10014,'VM Payment - Skrill','plugin','skrill','vmpayment',0,0,1,0,'{\"name\":\"Skrill\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"Skrill Holdings Limited\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.skrill.com\",\"version\":\"3.0.18\",\"description\":\"<a href=\\\"http:\\/\\/www.skrill.com\\\" target=\\\"_blank\\\">skrill<\\/a> is a popular\\n\\tpayment provider authorised by the Financial Services Authority of the United Kingdom (FSA). \\n    \",\"group\":\"\",\"filename\":\"skrill\"}','','','',0,'0000-00-00 00:00:00',9,0),(10015,'VM Payment - Authorize.net','plugin','authorizenet','vmpayment',0,0,1,0,'{\"name\":\"Authorize.net AIM\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"Authorize.net AIM\",\"group\":\"\",\"filename\":\"authorizenet\"}','','','',0,'0000-00-00 00:00:00',20,0),(10016,'VM Payment - Sofort iDeal','plugin','sofort_ideal','vmpayment',0,0,1,0,'{\"name\":\"Sofort Ideal\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"<a href=\\\"http:\\/www.sofort.com\\\" target=\\\"_blank\\\">Sofort<\\/a> is a popular\\n\\tpayment provider and available in many countries. \\n    \",\"group\":\"\",\"filename\":\"sofort\"}','','','',0,'0000-00-00 00:00:00',5,0),(10017,'VM Payment - Klikandpay','plugin','klikandpay','vmpayment',0,0,1,0,'{\"name\":\"VM Payment - klikandpay\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"Beta1\",\"description\":\"<a href=\\\"http:\\/\\/klikandpay.com\\\" target=\\\"_blank\\\">klikandpay<\\/a> \\n    \",\"group\":\"\",\"filename\":\"klikandpay\"}','','','',0,'0000-00-00 00:00:00',10,0),(10018,'VM Shipment - By weight, ZIP and countries','plugin','weight_countries','vmshipment',0,1,1,0,'{\"name\":\"By weight, ZIP and countries\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"VMSHIPMENT_WEIGHT_COUNTRIES_PLUGIN_DESC\",\"group\":\"\",\"filename\":\"weight_countries\"}','','','',0,'0000-00-00 00:00:00',0,0),(10019,'VM Custom - Customer text input','plugin','textinput','vmcustom',0,1,1,0,'{\"name\":\"VMCustom - textinput\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004-2014 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"text input plugin for product\",\"group\":\"\",\"filename\":\"textinput\"}','','','',0,'0000-00-00 00:00:00',0,0),(10020,'VM Custom - Product specification','plugin','specification','vmcustom',0,1,1,0,'{\"name\":\"plgvm_specification\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004-2014 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"VMCustom - specification; text input plugin for product\",\"group\":\"\",\"filename\":\"specification\"}','','','',0,'0000-00-00 00:00:00',0,0),(10021,'VM Calculation - Avalara Tax','plugin','avalara','vmcalculation',0,0,1,0,'{\"name\":\"VM - Calculation Avalara Tax\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"Max Milbers\",\"copyright\":\"Copyright (C) 2013 iStraxx UG (haftungsbeschr\\u00e4nkt). All rights reserved\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"VM - Calculation Avalara Tax; On demand tax calculation for whole U.S.A.\",\"group\":\"\",\"filename\":\"avalara\"}','','','',0,'0000-00-00 00:00:00',0,0),(10022,'VirtueMart Product','plugin','virtuemart','search',0,0,1,0,'{\"name\":\"Search - VirtueMart\",\"type\":\"plugin\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"PLG_SEARCH_VIRTUEMART_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"virtuemart\"}','','','',0,'0000-00-00 00:00:00',0,0),(10023,'mod_vmmenu','module','mod_vmmenu','',1,1,3,0,'{\"name\":\"VirtueMart Administrator Menu\",\"type\":\"module\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004-2013 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"max|at|virtuemart.net\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"MOD_VMMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_vmmenu\"}','','','',0,'0000-00-00 00:00:00',5,0),(10024,'mod_virtuemart_currencies','module','mod_virtuemart_currencies','',0,1,1,0,'{\"name\":\"mod_virtuemart_currencies\",\"type\":\"module\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"MOD_VIRTUEMART_CURRENCIES_DESC\",\"group\":\"\",\"filename\":\"mod_virtuemart_currencies\"}','','','',0,'0000-00-00 00:00:00',5,0),(10025,'mod_virtuemart_product','module','mod_virtuemart_product','',0,1,1,0,'{\"name\":\"mod_virtuemart_product\",\"type\":\"module\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"MOD_VIRTUEMART_PRODUCT_DESC\",\"group\":\"\",\"filename\":\"mod_virtuemart_product\"}','','','',0,'0000-00-00 00:00:00',3,0),(10026,'mod_virtuemart_search','module','mod_virtuemart_search','',0,1,1,0,'{\"name\":\"mod_virtuemart_search\",\"type\":\"module\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"MOD_VIRTUEMART_SEARCH_DESC\",\"group\":\"\",\"filename\":\"mod_virtuemart_search\"}','','','',0,'0000-00-00 00:00:00',2,0),(10027,'mod_virtuemart_manufacturer','module','mod_virtuemart_manufacturer','',0,1,1,0,'{\"name\":\"mod_virtuemart_manufacturer\",\"type\":\"module\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"MOD_VIRTUEMART_MANUFACTURER_DESC\",\"group\":\"\",\"filename\":\"mod_virtuemart_manufacturer\"}','','','',0,'0000-00-00 00:00:00',8,0),(10028,'mod_virtuemart_cart','module','mod_virtuemart_cart','',0,1,1,0,'{\"name\":\"mod_virtuemart_cart\",\"type\":\"module\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"MOD_VIRTUEMART_CART_DESC\",\"group\":\"\",\"filename\":\"mod_virtuemart_cart\"}','','','',0,'0000-00-00 00:00:00',0,0),(10029,'mod_virtuemart_category','module','mod_virtuemart_category','',0,1,1,0,'{\"name\":\"mod_virtuemart_category\",\"type\":\"module\",\"creationDate\":\"September 20 2016\",\"author\":\"The VirtueMart Development Team\",\"copyright\":\"Copyright (C) 2004 - 2016 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"3.0.18\",\"description\":\"MOD_VIRTUEMART_CATEGORY_DESC\",\"group\":\"\",\"filename\":\"mod_virtuemart_category\"}','','','',0,'0000-00-00 00:00:00',4,0),(10030,'tcpdf','component','com_tcpdf','',1,1,0,0,'{\"name\":\"tcpdf\",\"type\":\"component\",\"creationDate\":\"February 2015\",\"author\":\"Nicola Asuni, The VirtueMart Development Team\",\"copyright\":\"Copyright (c) 2001-2013 Nicola Asuni - Tecnick.com LTD - Tutti i diritti riservati - All Rights Reserved. 2015 Virtuemart Team. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/www.virtuemart.net\",\"version\":\"1.0.2\",\"description\":\"TCPDF 6.2.12 by Nicola Asuni. Joomla Installer by the VirtueMart Team\",\"group\":\"\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10031,'vmbeez3','template','vmbeez3','',0,1,1,0,'{\"name\":\"vmbeez3\",\"type\":\"template\",\"creationDate\":\"25 November 2009\",\"author\":\"Angie Radtke, adapted by the VirtueMart team\",\"copyright\":\"Copyright (C) 2005 - 2016 Open Source Matters, 2016 Virtuemart Team, Inc. All rights reserved.\",\"authorEmail\":\"team@virtuemart.net\",\"authorUrl\":\"http://virtuemart.net\",\"version\":\"3.1.0\",\"description\":\"TPL_BEEZ3_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templateDetails\"}','{}','','',0,'0000-00-00 00:00:00',0,0),(10032,'plg_vmpayment_cryptocoin','plugin','cryptocoin','vmpayment',0,1,1,0,'{\"name\":\"plg_vmpayment_cryptocoin\",\"type\":\"plugin\",\"creationDate\":\"January 2017\",\"author\":\"Unknown\",\"copyright\":\"Copyright (c) 2017 alx. All rights reserved.\",\"authorEmail\":\"\",\"authorUrl\":\"http:\\/\\/alx.com\",\"version\":\"1.0.0\",\"description\":\"\\n\\t\\n\\t\\t\\n\\t\\n\\t\",\"group\":\"\",\"filename\":\"cryptocoin\"}','{}','','',0,'0000-00-00 00:00:00',0,0);
/*!40000 ALTER TABLE `j_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_filters`
--

DROP TABLE IF EXISTS `j_finder_filters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_filters` (
  `filter_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL,
  `created_by_alias` varchar(255) NOT NULL,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `map_count` int(10) unsigned NOT NULL DEFAULT '0',
  `data` text NOT NULL,
  `params` mediumtext,
  PRIMARY KEY (`filter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_filters`
--

LOCK TABLES `j_finder_filters` WRITE;
/*!40000 ALTER TABLE `j_finder_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_filters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links`
--

DROP TABLE IF EXISTS `j_finder_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `route` varchar(255) NOT NULL,
  `title` varchar(400) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `indexdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `md5sum` varchar(32) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `state` int(5) DEFAULT '1',
  `access` int(5) DEFAULT '0',
  `language` varchar(8) NOT NULL,
  `publish_start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `start_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `list_price` double unsigned NOT NULL DEFAULT '0',
  `sale_price` double unsigned NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `object` mediumblob NOT NULL,
  PRIMARY KEY (`link_id`),
  KEY `idx_type` (`type_id`),
  KEY `idx_title` (`title`(100)),
  KEY `idx_md5` (`md5sum`),
  KEY `idx_url` (`url`(75)),
  KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links`
--

LOCK TABLES `j_finder_links` WRITE;
/*!40000 ALTER TABLE `j_finder_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_terms0`
--

DROP TABLE IF EXISTS `j_finder_links_terms0`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_terms0` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_terms0`
--

LOCK TABLES `j_finder_links_terms0` WRITE;
/*!40000 ALTER TABLE `j_finder_links_terms0` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_terms0` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_terms1`
--

DROP TABLE IF EXISTS `j_finder_links_terms1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_terms1` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_terms1`
--

LOCK TABLES `j_finder_links_terms1` WRITE;
/*!40000 ALTER TABLE `j_finder_links_terms1` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_terms1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_terms2`
--

DROP TABLE IF EXISTS `j_finder_links_terms2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_terms2` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_terms2`
--

LOCK TABLES `j_finder_links_terms2` WRITE;
/*!40000 ALTER TABLE `j_finder_links_terms2` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_terms2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_terms3`
--

DROP TABLE IF EXISTS `j_finder_links_terms3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_terms3` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_terms3`
--

LOCK TABLES `j_finder_links_terms3` WRITE;
/*!40000 ALTER TABLE `j_finder_links_terms3` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_terms3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_terms4`
--

DROP TABLE IF EXISTS `j_finder_links_terms4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_terms4` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_terms4`
--

LOCK TABLES `j_finder_links_terms4` WRITE;
/*!40000 ALTER TABLE `j_finder_links_terms4` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_terms4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_terms5`
--

DROP TABLE IF EXISTS `j_finder_links_terms5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_terms5` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_terms5`
--

LOCK TABLES `j_finder_links_terms5` WRITE;
/*!40000 ALTER TABLE `j_finder_links_terms5` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_terms5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_terms6`
--

DROP TABLE IF EXISTS `j_finder_links_terms6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_terms6` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_terms6`
--

LOCK TABLES `j_finder_links_terms6` WRITE;
/*!40000 ALTER TABLE `j_finder_links_terms6` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_terms6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_terms7`
--

DROP TABLE IF EXISTS `j_finder_links_terms7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_terms7` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_terms7`
--

LOCK TABLES `j_finder_links_terms7` WRITE;
/*!40000 ALTER TABLE `j_finder_links_terms7` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_terms7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_terms8`
--

DROP TABLE IF EXISTS `j_finder_links_terms8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_terms8` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_terms8`
--

LOCK TABLES `j_finder_links_terms8` WRITE;
/*!40000 ALTER TABLE `j_finder_links_terms8` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_terms8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_terms9`
--

DROP TABLE IF EXISTS `j_finder_links_terms9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_terms9` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_terms9`
--

LOCK TABLES `j_finder_links_terms9` WRITE;
/*!40000 ALTER TABLE `j_finder_links_terms9` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_terms9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_termsa`
--

DROP TABLE IF EXISTS `j_finder_links_termsa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_termsa` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_termsa`
--

LOCK TABLES `j_finder_links_termsa` WRITE;
/*!40000 ALTER TABLE `j_finder_links_termsa` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_termsa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_termsb`
--

DROP TABLE IF EXISTS `j_finder_links_termsb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_termsb` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_termsb`
--

LOCK TABLES `j_finder_links_termsb` WRITE;
/*!40000 ALTER TABLE `j_finder_links_termsb` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_termsb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_termsc`
--

DROP TABLE IF EXISTS `j_finder_links_termsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_termsc` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_termsc`
--

LOCK TABLES `j_finder_links_termsc` WRITE;
/*!40000 ALTER TABLE `j_finder_links_termsc` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_termsc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_termsd`
--

DROP TABLE IF EXISTS `j_finder_links_termsd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_termsd` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_termsd`
--

LOCK TABLES `j_finder_links_termsd` WRITE;
/*!40000 ALTER TABLE `j_finder_links_termsd` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_termsd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_termse`
--

DROP TABLE IF EXISTS `j_finder_links_termse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_termse` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_termse`
--

LOCK TABLES `j_finder_links_termse` WRITE;
/*!40000 ALTER TABLE `j_finder_links_termse` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_termse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_links_termsf`
--

DROP TABLE IF EXISTS `j_finder_links_termsf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_links_termsf` (
  `link_id` int(10) unsigned NOT NULL,
  `term_id` int(10) unsigned NOT NULL,
  `weight` float unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`term_id`),
  KEY `idx_term_weight` (`term_id`,`weight`),
  KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_links_termsf`
--

LOCK TABLES `j_finder_links_termsf` WRITE;
/*!40000 ALTER TABLE `j_finder_links_termsf` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_links_termsf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_taxonomy`
--

DROP TABLE IF EXISTS `j_finder_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_taxonomy` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ordering` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `state` (`state`),
  KEY `ordering` (`ordering`),
  KEY `access` (`access`),
  KEY `idx_parent_published` (`parent_id`,`state`,`access`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_taxonomy`
--

LOCK TABLES `j_finder_taxonomy` WRITE;
/*!40000 ALTER TABLE `j_finder_taxonomy` DISABLE KEYS */;
INSERT INTO `j_finder_taxonomy` VALUES (1,0,'ROOT',0,0,0);
/*!40000 ALTER TABLE `j_finder_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_taxonomy_map`
--

DROP TABLE IF EXISTS `j_finder_taxonomy_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_taxonomy_map` (
  `link_id` int(10) unsigned NOT NULL,
  `node_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`link_id`,`node_id`),
  KEY `link_id` (`link_id`),
  KEY `node_id` (`node_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_taxonomy_map`
--

LOCK TABLES `j_finder_taxonomy_map` WRITE;
/*!40000 ALTER TABLE `j_finder_taxonomy_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_taxonomy_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_terms`
--

DROP TABLE IF EXISTS `j_finder_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_terms` (
  `term_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '0',
  `soundex` varchar(75) NOT NULL,
  `links` int(10) NOT NULL DEFAULT '0',
  `language` char(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `idx_term` (`term`),
  KEY `idx_term_phrase` (`term`,`phrase`),
  KEY `idx_stem_phrase` (`stem`,`phrase`),
  KEY `idx_soundex_phrase` (`soundex`,`phrase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_terms`
--

LOCK TABLES `j_finder_terms` WRITE;
/*!40000 ALTER TABLE `j_finder_terms` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_terms_common`
--

DROP TABLE IF EXISTS `j_finder_terms_common`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_terms_common` (
  `term` varchar(75) NOT NULL,
  `language` varchar(3) NOT NULL,
  KEY `idx_word_lang` (`term`,`language`),
  KEY `idx_lang` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_terms_common`
--

LOCK TABLES `j_finder_terms_common` WRITE;
/*!40000 ALTER TABLE `j_finder_terms_common` DISABLE KEYS */;
INSERT INTO `j_finder_terms_common` VALUES ('a','en'),('about','en'),('after','en'),('ago','en'),('all','en'),('am','en'),('an','en'),('and','en'),('ani','en'),('any','en'),('are','en'),('aren\'t','en'),('as','en'),('at','en'),('be','en'),('but','en'),('by','en'),('for','en'),('from','en'),('get','en'),('go','en'),('how','en'),('if','en'),('in','en'),('into','en'),('is','en'),('isn\'t','en'),('it','en'),('its','en'),('me','en'),('more','en'),('most','en'),('must','en'),('my','en'),('new','en'),('no','en'),('none','en'),('not','en'),('noth','en'),('nothing','en'),('of','en'),('off','en'),('often','en'),('old','en'),('on','en'),('onc','en'),('once','en'),('onli','en'),('only','en'),('or','en'),('other','en'),('our','en'),('ours','en'),('out','en'),('over','en'),('page','en'),('she','en'),('should','en'),('small','en'),('so','en'),('some','en'),('than','en'),('thank','en'),('that','en'),('the','en'),('their','en'),('theirs','en'),('them','en'),('then','en'),('there','en'),('these','en'),('they','en'),('this','en'),('those','en'),('thus','en'),('time','en'),('times','en'),('to','en'),('too','en'),('true','en'),('under','en'),('until','en'),('up','en'),('upon','en'),('use','en'),('user','en'),('users','en'),('veri','en'),('version','en'),('very','en'),('via','en'),('want','en'),('was','en'),('way','en'),('were','en'),('what','en'),('when','en'),('where','en'),('whi','en'),('which','en'),('who','en'),('whom','en'),('whose','en'),('why','en'),('wide','en'),('will','en'),('with','en'),('within','en'),('without','en'),('would','en'),('yes','en'),('yet','en'),('you','en'),('your','en'),('yours','en');
/*!40000 ALTER TABLE `j_finder_terms_common` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_tokens`
--

DROP TABLE IF EXISTS `j_finder_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_tokens` (
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `weight` float unsigned NOT NULL DEFAULT '1',
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `language` char(3) NOT NULL DEFAULT '',
  KEY `idx_word` (`term`),
  KEY `idx_context` (`context`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_tokens`
--

LOCK TABLES `j_finder_tokens` WRITE;
/*!40000 ALTER TABLE `j_finder_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_tokens_aggregate`
--

DROP TABLE IF EXISTS `j_finder_tokens_aggregate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_tokens_aggregate` (
  `term_id` int(10) unsigned NOT NULL,
  `map_suffix` char(1) NOT NULL,
  `term` varchar(75) NOT NULL,
  `stem` varchar(75) NOT NULL,
  `common` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `phrase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `term_weight` float unsigned NOT NULL,
  `context` tinyint(1) unsigned NOT NULL DEFAULT '2',
  `context_weight` float unsigned NOT NULL,
  `total_weight` float unsigned NOT NULL,
  `language` char(3) NOT NULL DEFAULT '',
  KEY `token` (`term`),
  KEY `keyword_id` (`term_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_tokens_aggregate`
--

LOCK TABLES `j_finder_tokens_aggregate` WRITE;
/*!40000 ALTER TABLE `j_finder_tokens_aggregate` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_tokens_aggregate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_finder_types`
--

DROP TABLE IF EXISTS `j_finder_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_finder_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `mime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_finder_types`
--

LOCK TABLES `j_finder_types` WRITE;
/*!40000 ALTER TABLE `j_finder_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_finder_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_languages`
--

DROP TABLE IF EXISTS `j_languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_languages` (
  `lang_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `ordering` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  UNIQUE KEY `idx_sef` (`sef`),
  UNIQUE KEY `idx_image` (`image`),
  UNIQUE KEY `idx_langcode` (`lang_code`),
  KEY `idx_access` (`access`),
  KEY `idx_ordering` (`ordering`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_languages`
--

LOCK TABLES `j_languages` WRITE;
/*!40000 ALTER TABLE `j_languages` DISABLE KEYS */;
INSERT INTO `j_languages` VALUES (1,0,'en-GB','English (UK)','English (UK)','en','en','','','','',1,1,1);
/*!40000 ALTER TABLE `j_languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_menu`
--

DROP TABLE IF EXISTS `j_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The published state of the menu link.',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The relative level in the tree.',
  `component_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to #__users.id',
  `checked_out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'The click behaviour of the link.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `home` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  KEY `idx_menutype` (`menutype`),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_path` (`path`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_menu`
--

LOCK TABLES `j_menu` WRITE;
/*!40000 ALTER TABLE `j_menu` DISABLE KEYS */;
INSERT INTO `j_menu` VALUES (1,'','Menu_Item_Root','root','','','','',1,0,0,0,0,'0000-00-00 00:00:00',0,0,'',0,'',0,77,0,'*',0),(2,'menu','com_banners','Banners','','Banners','index.php?option=com_banners','component',0,1,1,4,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',1,10,0,'*',1),(3,'menu','com_banners','Banners','','Banners/Banners','index.php?option=com_banners','component',0,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners',0,'',2,3,0,'*',1),(4,'menu','com_banners_categories','Categories','','Banners/Categories','index.php?option=com_categories&extension=com_banners','component',0,2,2,6,0,'0000-00-00 00:00:00',0,0,'class:banners-cat',0,'',4,5,0,'*',1),(5,'menu','com_banners_clients','Clients','','Banners/Clients','index.php?option=com_banners&view=clients','component',0,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners-clients',0,'',6,7,0,'*',1),(6,'menu','com_banners_tracks','Tracks','','Banners/Tracks','index.php?option=com_banners&view=tracks','component',0,2,2,4,0,'0000-00-00 00:00:00',0,0,'class:banners-tracks',0,'',8,9,0,'*',1),(7,'menu','com_contact','Contacts','','Contacts','index.php?option=com_contact','component',0,1,1,8,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',11,16,0,'*',1),(8,'menu','com_contact_contacts','Contacts','','Contacts/Contacts','index.php?option=com_contact','component',0,7,2,8,0,'0000-00-00 00:00:00',0,0,'class:contact',0,'',12,13,0,'*',1),(9,'menu','com_contact_categories','Categories','','Contacts/Categories','index.php?option=com_categories&extension=com_contact','component',0,7,2,6,0,'0000-00-00 00:00:00',0,0,'class:contact-cat',0,'',14,15,0,'*',1),(10,'menu','com_messages','Messaging','','Messaging','index.php?option=com_messages','component',0,1,1,15,0,'0000-00-00 00:00:00',0,0,'class:messages',0,'',17,20,0,'*',1),(11,'menu','com_messages_add','New Private Message','','Messaging/New Private Message','index.php?option=com_messages&task=message.add','component',0,10,2,15,0,'0000-00-00 00:00:00',0,0,'class:messages-add',0,'',18,19,0,'*',1),(13,'menu','com_newsfeeds','News Feeds','','News Feeds','index.php?option=com_newsfeeds','component',0,1,1,17,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',21,26,0,'*',1),(14,'menu','com_newsfeeds_feeds','Feeds','','News Feeds/Feeds','index.php?option=com_newsfeeds','component',0,13,2,17,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds',0,'',22,23,0,'*',1),(15,'menu','com_newsfeeds_categories','Categories','','News Feeds/Categories','index.php?option=com_categories&extension=com_newsfeeds','component',0,13,2,6,0,'0000-00-00 00:00:00',0,0,'class:newsfeeds-cat',0,'',24,25,0,'*',1),(16,'menu','com_redirect','Redirect','','Redirect','index.php?option=com_redirect','component',0,1,1,24,0,'0000-00-00 00:00:00',0,0,'class:redirect',0,'',27,28,0,'*',1),(17,'menu','com_search','Basic Search','','Basic Search','index.php?option=com_search','component',0,1,1,19,0,'0000-00-00 00:00:00',0,0,'class:search',0,'',29,30,0,'*',1),(18,'menu','com_finder','Smart Search','','Smart Search','index.php?option=com_finder','component',0,1,1,27,0,'0000-00-00 00:00:00',0,0,'class:finder',0,'',31,32,0,'*',1),(19,'menu','com_joomlaupdate','Joomla! Update','','Joomla! Update','index.php?option=com_joomlaupdate','component',1,1,1,28,0,'0000-00-00 00:00:00',0,0,'class:joomlaupdate',0,'',33,34,0,'*',1),(20,'main','com_tags','Tags','','Tags','index.php?option=com_tags','component',0,1,1,29,0,'0000-00-00 00:00:00',0,1,'class:tags',0,'',35,36,0,'',1),(21,'main','com_postinstall','Post-installation messages','','Post-installation messages','index.php?option=com_postinstall','component',0,1,1,32,0,'0000-00-00 00:00:00',0,1,'class:postinstall',0,'',37,38,0,'*',1),(101,'mainmenu','Home','home','','home','index.php?option=com_virtuemart&view=category&virtuemart_category_id=0&virtuemart_manufacturer_id=0&categorylayout=0&showcategory=1&showproducts=1&showsearch=1&productsublayout=0&featured=1&latest=1&topten=1&recent=1&featured_rows=1&latest_rows=1&topten_rows=1&recent_rows=1','component',1,1,1,10000,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"1\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',39,40,1,'*',0),(115,'main','VirtueMart AIO','virtuemart-aio','','virtuemart-aio','index.php?option=com_virtuemart_allinone','component',0,1,1,10001,0,'0000-00-00 00:00:00',0,1,'class:component',0,'{}',41,42,0,'',1),(116,'main','COM_VIRTUEMART','com-virtuemart','','com-virtuemart','index.php?option=com_virtuemart','component',0,1,1,10000,0,'0000-00-00 00:00:00',0,1,'../components/com_virtuemart/assets/images/vmgeneral/menu_icon.png',0,'{}',43,68,0,'',1),(117,'main','COM_VIRTUEMART_CONTROL_PANEL','com-virtuemart-control-panel','','com-virtuemart/com-virtuemart-control-panel','index.php?option=com_virtuemart&view=virtuemart','component',0,116,2,10000,0,'0000-00-00 00:00:00',0,1,'components/com_virtuemart/assets/images/icon_16/menu-icon16-report.png',0,'{}',44,45,0,'',1),(118,'main','COM_VIRTUEMART_MENU_CATEGORIES','com-virtuemart-menu-categories','','com-virtuemart/com-virtuemart-menu-categories','index.php?option=com_virtuemart&view=category','component',0,116,2,10000,0,'0000-00-00 00:00:00',0,1,'components/com_virtuemart/assets/images/icon_16/menu-icon16-categories.png',0,'{}',46,47,0,'',1),(119,'main','COM_VIRTUEMART_MENU_PRODUCTS','com-virtuemart-menu-products','','com-virtuemart/com-virtuemart-menu-products','index.php?option=com_virtuemart&view=product','component',0,116,2,10000,0,'0000-00-00 00:00:00',0,1,'components/com_virtuemart/assets/images/icon_16/menu-icon16-products.png',0,'{}',48,49,0,'',1),(120,'main','COM_VIRTUEMART_MENU_ORDERS','com-virtuemart-menu-orders','','com-virtuemart/com-virtuemart-menu-orders','index.php?option=com_virtuemart&view=orders','component',0,116,2,10000,0,'0000-00-00 00:00:00',0,1,'components/com_virtuemart/assets/images/icon_16/menu-icon16-orders.png',0,'{}',50,51,0,'',1),(121,'main','COM_VIRTUEMART_MENU_REPORT','com-virtuemart-menu-report','','com-virtuemart/com-virtuemart-menu-report','index.php?option=com_virtuemart&view=report','component',0,116,2,10000,0,'0000-00-00 00:00:00',0,1,'components/com_virtuemart/assets/images/icon_16/menu-icon16-report.png',0,'{}',52,53,0,'',1),(122,'main','COM_VIRTUEMART_MENU_USERS','com-virtuemart-menu-users','','com-virtuemart/com-virtuemart-menu-users','index.php?option=com_virtuemart&view=user','component',0,116,2,10000,0,'0000-00-00 00:00:00',0,1,'components/com_virtuemart/assets/images/icon_16/menu-icon16-shoppers.png',0,'{}',54,55,0,'',1),(123,'main','COM_VIRTUEMART_MENU_MANUFACTURERS','com-virtuemart-menu-manufacturers','','com-virtuemart/com-virtuemart-menu-manufacturers','index.php?option=com_virtuemart&view=manufacturer','component',0,116,2,10000,0,'0000-00-00 00:00:00',0,1,'components/com_virtuemart/assets/images/icon_16/menu-icon16-manufacturers.png',0,'{}',56,57,0,'',1),(124,'main','COM_VIRTUEMART_MENU_STORE','com-virtuemart-menu-store','','com-virtuemart/com-virtuemart-menu-store','index.php?option=com_virtuemart&view=user&task=editshop','component',0,116,2,10000,0,'0000-00-00 00:00:00',0,1,'components/com_virtuemart/assets/images/icon_16/menu-icon16-shop.png',0,'{}',58,59,0,'',1),(125,'main','COM_VIRTUEMART_MENU_MEDIAFILES','com-virtuemart-menu-mediafiles','','com-virtuemart/com-virtuemart-menu-mediafiles','index.php?option=com_virtuemart&view=media','component',0,116,2,10000,0,'0000-00-00 00:00:00',0,1,'components/com_virtuemart/assets/images/icon_16/menu-icon16-media.png',0,'{}',60,61,0,'',1),(126,'main','COM_VIRTUEMART_MENU_SHIPMENTMETHODS','com-virtuemart-menu-shipmentmethods','','com-virtuemart/com-virtuemart-menu-shipmentmethods','index.php?option=com_virtuemart&view=shipmentmethod','component',0,116,2,10000,0,'0000-00-00 00:00:00',0,1,'components/com_virtuemart/assets/images/icon_16/menu-icon16-shipmentmethods.png',0,'{}',62,63,0,'',1),(127,'main','COM_VIRTUEMART_MENU_PAYMENTMETHODS','com-virtuemart-menu-paymentmethods','','com-virtuemart/com-virtuemart-menu-paymentmethods','index.php?option=com_virtuemart&view=paymentmethod','component',0,116,2,10000,0,'0000-00-00 00:00:00',0,1,'components/com_virtuemart/assets/images/icon_16/menu-icon16-paymentmethods.png',0,'{}',64,65,0,'',1),(128,'main','COM_VIRTUEMART_MENU_CONFIGURATION','com-virtuemart-menu-configuration','','com-virtuemart/com-virtuemart-menu-configuration','index.php?option=com_virtuemart&view=config','component',0,116,2,10000,0,'0000-00-00 00:00:00',0,1,'components/com_virtuemart/assets/images/icon_16/menu-icon16-config.png',0,'{}',66,67,0,'',1),(129,'main','TCPDF','tcpdf','','tcpdf','index.php?option=com_tcpdf','component',0,1,1,10030,0,'0000-00-00 00:00:00',0,1,'class:component',0,'{}',69,70,0,'',1),(130,'mainmenu','Account','account','','account','index.php?option=com_virtuemart&view=user&layout=edit','component',1,1,1,10000,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',71,72,0,'*',0),(131,'mainmenu','Orders','orders','','orders','index.php?option=com_virtuemart&view=orders&layout=list','component',1,1,1,10000,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',73,74,0,'*',0),(132,'mainmenu','Cart','cart','','cart','index.php?option=com_virtuemart&view=cart','component',1,1,1,10000,0,'0000-00-00 00:00:00',0,1,' ',0,'{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_image\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"menu-meta_keywords\":\"\",\"robots\":\"\",\"secure\":0}',75,76,0,'*',0);
/*!40000 ALTER TABLE `j_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_menu_types`
--

DROP TABLE IF EXISTS `j_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_menu_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) NOT NULL,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_menutype` (`menutype`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_menu_types`
--

LOCK TABLES `j_menu_types` WRITE;
/*!40000 ALTER TABLE `j_menu_types` DISABLE KEYS */;
INSERT INTO `j_menu_types` VALUES (1,0,'mainmenu','Main Menu','The main menu for the site');
/*!40000 ALTER TABLE `j_menu_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_messages`
--

DROP TABLE IF EXISTS `j_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_messages` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id_from` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id_to` int(10) unsigned NOT NULL DEFAULT '0',
  `folder_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `date_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `state` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `useridto_state` (`user_id_to`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_messages`
--

LOCK TABLES `j_messages` WRITE;
/*!40000 ALTER TABLE `j_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_messages_cfg`
--

DROP TABLE IF EXISTS `j_messages_cfg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_messages_cfg` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_messages_cfg`
--

LOCK TABLES `j_messages_cfg` WRITE;
/*!40000 ALTER TABLE `j_messages_cfg` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_messages_cfg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_modules`
--

DROP TABLE IF EXISTS `j_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `showtitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `published` (`published`,`access`),
  KEY `newsfeeds` (`module`,`published`),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_modules`
--

LOCK TABLES `j_modules` WRITE;
/*!40000 ALTER TABLE `j_modules` DISABLE KEYS */;
INSERT INTO `j_modules` VALUES (1,39,'Main Menu','','',1,'position-1',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',1,1,'{\"menutype\":\"mainmenu\",\"base\":\"\",\"startLevel\":\"1\",\"endLevel\":\"0\",\"showAllChildren\":\"0\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"_menu\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}',0,'*'),(2,40,'Login','','',1,'login',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'',1,'*'),(3,41,'Popular Articles','','',3,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_popular',3,1,'{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(4,42,'Recently Added Articles','','',4,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_latest',3,1,'{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(8,43,'Toolbar','','',1,'toolbar',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_toolbar',3,1,'',1,'*'),(9,44,'Quick Icons','','',1,'icon',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_quickicon',3,1,'',1,'*'),(10,45,'Logged-in Users','','',2,'cpanel',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_logged',3,1,'{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(12,46,'Admin Menu','','',1,'menu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_menu',3,1,'{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}',1,'*'),(13,47,'Admin Submenu','','',1,'submenu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_submenu',3,1,'',1,'*'),(14,48,'User Status','','',2,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_status',3,1,'',1,'*'),(15,49,'Title','','',1,'title',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_title',3,1,'',1,'*'),(16,50,'Login Form','','',7,'position-7',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_login',1,1,'{\"greeting\":\"1\",\"name\":\"0\"}',0,'*'),(17,51,'Breadcrumbs','','',1,'position-2',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_breadcrumbs',1,1,'{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"0\",\"cache_time\":\"0\",\"cachemode\":\"itemid\"}',0,'*'),(79,52,'Multilanguage status','','',1,'status',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',0,'mod_multilangstatus',3,1,'{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(86,53,'Joomla Version','','',1,'footer',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_version',3,1,'{\"format\":\"short\",\"product\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}',1,'*'),(87,57,'VM - Administrator Module','','',5,'menu',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_vmmenu',3,1,'',1,'*'),(88,58,'VM - Currencies Selector','','',5,'position-4',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_virtuemart_currencies',1,1,'',0,'*'),(89,59,'VM - Featured products','','',3,'position-4',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_virtuemart_product',1,1,'',0,'*'),(90,60,'VM - Search in Shop','','',2,'position-4',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_virtuemart_search',1,1,'',0,'*'),(91,61,'VM - Manufacturer','','',8,'position-4',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_virtuemart_manufacturer',1,1,'',0,'*'),(92,62,'VM - Shopping cart','','',0,'position-4',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_virtuemart_cart',1,1,'',0,'*'),(93,63,'VM - Category','','',4,'position-4',0,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00',1,'mod_virtuemart_category',1,1,'',0,'*');
/*!40000 ALTER TABLE `j_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_modules_menu`
--

DROP TABLE IF EXISTS `j_modules_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT '0',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`moduleid`,`menuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_modules_menu`
--

LOCK TABLES `j_modules_menu` WRITE;
/*!40000 ALTER TABLE `j_modules_menu` DISABLE KEYS */;
INSERT INTO `j_modules_menu` VALUES (1,0),(2,0),(3,0),(4,0),(6,0),(7,0),(8,0),(9,0),(10,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(79,0),(86,0),(87,0),(88,0),(89,0),(90,0),(91,0),(92,0),(93,0);
/*!40000 ALTER TABLE `j_modules_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_newsfeeds`
--

DROP TABLE IF EXISTS `j_newsfeeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT '0',
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `numarticles` int(10) unsigned NOT NULL DEFAULT '1',
  `cache_time` int(10) unsigned NOT NULL DEFAULT '3600',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rtl` tinyint(4) NOT NULL DEFAULT '0',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(10) unsigned NOT NULL DEFAULT '0',
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_state` (`published`),
  KEY `idx_catid` (`catid`),
  KEY `idx_createdby` (`created_by`),
  KEY `idx_language` (`language`),
  KEY `idx_xreference` (`xreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_newsfeeds`
--

LOCK TABLES `j_newsfeeds` WRITE;
/*!40000 ALTER TABLE `j_newsfeeds` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_newsfeeds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_overrider`
--

DROP TABLE IF EXISTS `j_overrider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_overrider` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_overrider`
--

LOCK TABLES `j_overrider` WRITE;
/*!40000 ALTER TABLE `j_overrider` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_overrider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_postinstall_messages`
--

DROP TABLE IF EXISTS `j_postinstall_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_postinstall_messages` (
  `postinstall_message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` bigint(20) NOT NULL DEFAULT '700' COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(3) NOT NULL DEFAULT '1',
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(3) NOT NULL DEFAULT '1',
  PRIMARY KEY (`postinstall_message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_postinstall_messages`
--

LOCK TABLES `j_postinstall_messages` WRITE;
/*!40000 ALTER TABLE `j_postinstall_messages` DISABLE KEYS */;
INSERT INTO `j_postinstall_messages` VALUES (1,700,'PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_TITLE','PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_BODY','PLG_TWOFACTORAUTH_TOTP_POSTINSTALL_ACTION','plg_twofactorauth_totp',1,'action','site://plugins/twofactorauth/totp/postinstall/actions.php','twofactorauth_postinstall_action','site://plugins/twofactorauth/totp/postinstall/actions.php','twofactorauth_postinstall_condition','3.2.0',1),(2,700,'COM_CPANEL_WELCOME_BEGINNERS_TITLE','COM_CPANEL_WELCOME_BEGINNERS_MESSAGE','','com_cpanel',1,'message','','','','','3.2.0',1),(3,700,'COM_CPANEL_MSG_STATS_COLLECTION_TITLE','COM_CPANEL_MSG_STATS_COLLECTION_BODY','','com_cpanel',1,'message','','','admin://components/com_admin/postinstall/statscollection.php','admin_postinstall_statscollection_condition','3.5.0',1);
/*!40000 ALTER TABLE `j_postinstall_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_redirect_links`
--

DROP TABLE IF EXISTS `j_redirect_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_redirect_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `header` smallint(3) NOT NULL DEFAULT '301',
  PRIMARY KEY (`id`),
  KEY `idx_old_url` (`old_url`(100)),
  KEY `idx_link_modifed` (`modified_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_redirect_links`
--

LOCK TABLES `j_redirect_links` WRITE;
/*!40000 ALTER TABLE `j_redirect_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_redirect_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_schemas`
--

DROP TABLE IF EXISTS `j_schemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`extension_id`,`version_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_schemas`
--

LOCK TABLES `j_schemas` WRITE;
/*!40000 ALTER TABLE `j_schemas` DISABLE KEYS */;
INSERT INTO `j_schemas` VALUES (700,'3.6.0-2016-06-05');
/*!40000 ALTER TABLE `j_schemas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_session`
--

DROP TABLE IF EXISTS `j_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_session` (
  `session_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `guest` tinyint(4) unsigned DEFAULT '1',
  `time` varchar(14) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` mediumtext COLLATE utf8mb4_unicode_ci,
  `userid` int(11) DEFAULT '0',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`session_id`),
  KEY `userid` (`userid`),
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_session`
--

LOCK TABLES `j_session` WRITE;
/*!40000 ALTER TABLE `j_session` DISABLE KEYS */;
INSERT INTO `j_session` VALUES ('13qn3vnncqp223sbsqdbksei82',0,1,'1485892411','joomla|s:708:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjI6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxODtzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjozOntzOjU6InN0YXJ0IjtpOjE0ODU4OTEzOTg7czo0OiJsYXN0IjtpOjE0ODU4OTIzNTU7czozOiJub3ciO2k6MTQ4NTg5MjQxMDt9fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MTtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjU6IkpVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX1zOjQ6Il9fdm0iO086ODoic3RkQ2xhc3MiOjE6e3M6NjoibWFuYWdlIjtpOjA7fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('197n510vf0he95ndf09ev4mss0',0,1,'1485332670','joomla|s:636:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjI6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aTo2O3M6NToidGltZXIiO086ODoic3RkQ2xhc3MiOjM6e3M6NToic3RhcnQiO2k6MTQ4NTMyNzgzNDtzOjQ6Imxhc3QiO2k6MTQ4NTMzMjYzMTtzOjM6Im5vdyI7aToxNDg1MzMyNjY5O319czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjoyOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjU6IkpVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX1zOjQ6Il9fdm0iO086ODoic3RkQ2xhc3MiOjE6e3M6NjoibWFuYWdlIjtpOjA7fX1zOjk6InNlcGFyYXRvciI7czoxOiIuIjt9\";',0,''),('1lojs98lksmhj04ebms2ibr9i3',0,0,'1485892730','joomla|s:2432:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjI6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToyMzQ7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNDg1NTAxMDUyO3M6NDoibGFzdCI7aToxNDg1ODkyNzI4O3M6Mzoibm93IjtpOjE0ODU4OTI3Mjk7fXM6NToidG9rZW4iO3M6MzI6IlgzeHZkQjRKR3JNVWNjN2xCeVVyVVh4VlBPc2RMc3FaIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6NToidXNlcnMiO086ODoic3RkQ2xhc3MiOjE6e3M6NToibG9naW4iO086ODoic3RkQ2xhc3MiOjE6e3M6NDoiZm9ybSI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo2OiJyZXR1cm4iO3M6NjM6Imh0dHA6Ly9jcnlwdG9jb2luLmxvYy9pbmRleC5waHA/b3B0aW9uPWNvbV92aXJ0dWVtYXJ0JnZpZXc9Y2FydCI7czo0OiJkYXRhIjthOjA6e319fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MTtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjU6IkpVc2VyIjoxOntzOjI6ImlkIjtzOjM6IjgzMyI7fXM6MTE6ImFwcGxpY2F0aW9uIjtPOjg6InN0ZENsYXNzIjoxOntzOjU6InF1ZXVlIjtOO319czo0OiJfX3ZtIjtPOjg6InN0ZENsYXNzIjo2OntzOjY6Im1hbmFnZSI7aTowO3M6MTk6InZtbGFzdHZpc2l0ZWRJdGVtaWQiO2k6MTAxO3M6MjM6InZtbGFzdHZpc2l0ZWRjYXRlZ29yeWlkIjtpOjA7czoxOToidm1sYXN0dmlzaXRlZG1hbnVpZCI7aTowO3M6Njoidm1jYXJ0IjtzOjgyMDoieyJjYXJ0UHJvZHVjdHNEYXRhIjpbeyJ2aXJ0dWVtYXJ0X3Byb2R1Y3RfaWQiOjEyMTEsInF1YW50aXR5IjozLCJjdXN0b21Qcm9kdWN0RGF0YSI6W119XSwidmVuZG9ySWQiOiIxIiwibGFzdFZpc2l0ZWRDYXRlZ29yeUlkIjowLCJ2aXJ0dWVtYXJ0X3NoaXBtZW50bWV0aG9kX2lkIjoiMSIsInZpcnR1ZW1hcnRfcGF5bWVudG1ldGhvZF9pZCI6IjMiLCJhdXRvbWF0aWNTZWxlY3RlZFNoaXBtZW50Ijp0cnVlLCJhdXRvbWF0aWNTZWxlY3RlZFBheW1lbnQiOmZhbHNlLCJvcmRlcl9udW1iZXIiOiJTVlFHMDg3IiwiQlQiOnsiZW1haWwiOiJhbHgucG9seWFrb3ZAZ21haWwuY29tIiwiZmlyc3RfbmFtZSI6IkRvZSIsImFkZHJlc3NfMSI6IlBPIEJveCAxMjMifSwiU1QiOnsiZW1haWwiOiJhbHgucG9seWFrb3ZAZ21haWwuY29tIiwiZmlyc3RfbmFtZSI6IkRvZSIsImFkZHJlc3NfMSI6IlBPIEJveCAxMjMifSwiY2FydGZpZWxkcyI6W10sImNvdXBvbkNvZGUiOiIiLCJfdHJpZXNWYWxpZGF0ZUNvdXBvbiI6W10sIm9yZGVyX2xhbmd1YWdlIjoiZW4tR0IiLCJwcmljZXNDdXJyZW5jeSI6IjQ3IiwicGF5bWVudEN1cnJlbmN5IjoiNDciLCJfZ3Vlc3QiOjAsIl9pbkNoZWNrT3V0IjpmYWxzZSwiX2luQ29uZmlybSI6ZmFsc2UsIl9kYXRhVmFsaWRhdGVkIjoiZDQxZDhjZDk4ZjAwYjIwNGU5ODAwOTk4ZWNmODQyN2UiLCJfY29uZmlybURvbmUiOnRydWUsIlNUc2FtZUFzQlQiOjEsInNlbGVjdGVkX3NoaXB0byI6MCwiX2Zyb21DYXJ0Ijp0cnVlLCJsYXlvdXQiOiJkZWZhdWx0IiwibGF5b3V0UGF0aCI6IiIsInZpcnR1ZW1hcnRfY2FydF9pZCI6IjYifSI7czoyMzoidm1sYXN0dmlzaXRlZHByb2R1Y3RpZHMiO2E6MTp7aTowO2k6MTIxMTt9fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',833,'alx'),('7bi4e8vkgs6u701209bubeuv32',0,1,'1485608039','joomla|s:708:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjI6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjozOntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjI6e3M6NzoiY291bnRlciI7aToxNjtzOjU6InRpbWVyIjtPOjg6InN0ZENsYXNzIjozOntzOjU6InN0YXJ0IjtpOjE0ODU2MDY2ODk7czo0OiJsYXN0IjtpOjE0ODU2MDc5OTA7czozOiJub3ciO2k6MTQ4NTYwODAzODt9fXM6ODoicmVnaXN0cnkiO086MjQ6Ikpvb21sYVxSZWdpc3RyeVxSZWdpc3RyeSI6Mzp7czo3OiIAKgBkYXRhIjtPOjg6InN0ZENsYXNzIjowOnt9czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MTtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9czo0OiJ1c2VyIjtPOjU6IkpVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX1zOjQ6Il9fdm0iO086ODoic3RkQ2xhc3MiOjE6e3M6NjoibWFuYWdlIjtpOjA7fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";',0,''),('h3eeju1sj021pbilapn03chb42',1,0,'1485891481','joomla|s:6904:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6OToiX19kZWZhdWx0IjtPOjg6InN0ZENsYXNzIjo0OntzOjc6InNlc3Npb24iO086ODoic3RkQ2xhc3MiOjM6e3M6NzoiY291bnRlciI7aToyMzY7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNDg1NTAxMDcxO3M6NDoibGFzdCI7aToxNDg1NzAxMzA4O3M6Mzoibm93IjtpOjE0ODU4OTE0ODE7fXM6NToidG9rZW4iO3M6MzI6InJPeVZLc0tFbWF2OGVDMVEzMmg1WnBvYnJaUTZNR0FTIjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6MTM6ImNvbV9pbnN0YWxsZXIiO086ODoic3RkQ2xhc3MiOjI6e3M6NzoibWVzc2FnZSI7czowOiIiO3M6MTc6ImV4dGVuc2lvbl9tZXNzYWdlIjtzOjA6IiI7fXM6MTQ6ImNvbV92aXJ0dWVtYXJ0IjtPOjg6InN0ZENsYXNzIjoyOntzOjc6InByb2R1Y3QiO086ODoic3RkQ2xhc3MiOjk6e3M6MTY6ImZpbHRlcl9vcmRlcl9EaXIiO3M6NDoiREVTQyI7czoxMjoiZmlsdGVyX29yZGVyIjtzOjEwOiJjcmVhdGVkX29uIjtzOjIyOiJ2aXJ0dWVtYXJ0X2NhdGVnb3J5X2lkIjtzOjA6IiI7czoyNjoidmlydHVlbWFydF9tYW51ZmFjdHVyZXJfaWQiO3M6MToiMCI7czoxNzoicHJvZHVjdF9wYXJlbnRfaWQiO3M6MToiMCI7czoxNDoiZmlsdGVyX3Byb2R1Y3QiO3M6MDoiIjtzOjExOiJzZWFyY2hfdHlwZSI7czowOiIiO3M6MTI6InNlYXJjaF9vcmRlciI7czoyOiJiZiI7czoxMToic2VhcmNoX2RhdGUiO3M6MTU6IjEwOjIwIDI3LjEuMjAxNyI7fXM6ODoiY2F0ZWdvcnkiO086ODoic3RkQ2xhc3MiOjI6e3M6NToibGltaXQiO3M6MjoiMzAiO3M6MTA6ImxpbWl0c3RhcnQiO2k6MDt9fXM6MTA6ImNvbV9jb25maWciO086ODoic3RkQ2xhc3MiOjE6e3M6NjoiY29uZmlnIjtPOjg6InN0ZENsYXNzIjoxOntzOjY6Imdsb2JhbCI7Tzo4OiJzdGRDbGFzcyI6MTp7czo0OiJkYXRhIjthOjkxOntzOjc6Im9mZmxpbmUiO3M6MToiMCI7czoxNToib2ZmbGluZV9tZXNzYWdlIjtzOjEyOToi0KHQsNC50YIg0LfQsNC60YDRi9GCINC90LAg0YLQtdGF0L3QuNGH0LXRgdC60L7QtSDQvtCx0YHQu9GD0LbQuNCy0LDQvdC40LUuPGJyIC8+0J/QvtC20LDQu9GD0LnRgdGC0LAsINC30LDQudC00LjRgtC1INC/0L7Qt9C20LUuIjtzOjIzOiJkaXNwbGF5X29mZmxpbmVfbWVzc2FnZSI7czoxOiIxIjtzOjEzOiJvZmZsaW5lX2ltYWdlIjtzOjA6IiI7czo4OiJzaXRlbmFtZSI7czoxMDoiY3J5cHRvY29pbiI7czo2OiJlZGl0b3IiO3M6NzoidGlueW1jZSI7czo3OiJjYXB0Y2hhIjtzOjE6IjAiO3M6MTA6Imxpc3RfbGltaXQiO3M6MjoiMjUiO3M6NjoiYWNjZXNzIjtzOjE6IjEiO3M6NToiZGVidWciO3M6MToiMCI7czoxMDoiZGVidWdfbGFuZyI7czoxOiIwIjtzOjY6ImRidHlwZSI7czo2OiJteXNxbGkiO3M6NDoiaG9zdCI7czo5OiJsb2NhbGhvc3QiO3M6NDoidXNlciI7czo0OiJyb290IjtzOjg6InBhc3N3b3JkIjtzOjY6IjExMjIxMSI7czoyOiJkYiI7czoxMDoiY3J5cHRvY29pbiI7czo4OiJkYnByZWZpeCI7czoyOiJqXyI7czo5OiJsaXZlX3NpdGUiO3M6MDoiIjtzOjY6InNlY3JldCI7czoxNjoiZEZtTGJ4MHFvNGlnSG9XMyI7czo0OiJnemlwIjtzOjE6IjAiO3M6MTU6ImVycm9yX3JlcG9ydGluZyI7czo3OiJtYXhpbXVtIjtzOjc6ImhlbHB1cmwiO3M6ODA6Imh0dHBzOi8vaGVscC5qb29tbGEub3JnL3Byb3h5P2tleXJlZj1IZWxwe21ham9yfXttaW5vcn06e2tleXJlZn0mbGFuZz17bGFuZ2NvZGV9IjtzOjg6ImZ0cF9ob3N0IjtzOjA6IiI7czo4OiJmdHBfcG9ydCI7czowOiIiO3M6ODoiZnRwX3VzZXIiO3M6MDoiIjtzOjg6ImZ0cF9wYXNzIjtzOjA6IiI7czo4OiJmdHBfcm9vdCI7czowOiIiO3M6MTA6ImZ0cF9lbmFibGUiO3M6MToiMCI7czo2OiJvZmZzZXQiO3M6MzoiVVRDIjtzOjEwOiJtYWlsb25saW5lIjtzOjE6IjEiO3M6NjoibWFpbGVyIjtzOjg6InNlbmRtYWlsIjtzOjg6Im1haWxmcm9tIjtzOjIyOiJhbHgucG9seWFrb3ZAZ21haWwuY29tIjtzOjg6ImZyb21uYW1lIjtzOjEwOiJjcnlwdG9jb2luIjtzOjg6InNlbmRtYWlsIjtzOjI0OiIvdXNyL2Jpbi9mYWtlc2VuZG1haWwuc2giO3M6ODoic210cGF1dGgiO3M6MToiMCI7czo4OiJzbXRwdXNlciI7czowOiIiO3M6ODoic210cHBhc3MiO3M6MDoiIjtzOjg6InNtdHBob3N0IjtzOjk6ImxvY2FsaG9zdCI7czoxMDoic210cHNlY3VyZSI7czo0OiJub25lIjtzOjg6InNtdHBwb3J0IjtzOjI6IjI1IjtzOjc6ImNhY2hpbmciO3M6MToiMCI7czoxMzoiY2FjaGVfaGFuZGxlciI7czo0OiJmaWxlIjtzOjk6ImNhY2hldGltZSI7czoyOiIxNSI7czoyMDoiY2FjaGVfcGxhdGZvcm1wcmVmaXgiO3M6MToiMCI7czo4OiJNZXRhRGVzYyI7czo4NzoiVmlydHVlTWFydCB3b3JrcyB3aXRoIEpvb21sYSEgLSB0aGUgZHluYW1pYyBwb3J0YWwgZW5naW5lIGFuZCBjb250ZW50IG1hbmFnZW1lbnQgc3lzdGVtIjtzOjg6Ik1ldGFLZXlzIjtzOjMxOiJ2aXJ0dWVtYXJ0LCB2bTIsIGpvb21sYSwgSm9vbWxhIjtzOjk6Ik1ldGFUaXRsZSI7czoxOiIxIjtzOjEwOiJNZXRhQXV0aG9yIjtzOjE6IjEiO3M6MTE6Ik1ldGFWZXJzaW9uIjtzOjE6IjAiO3M6Njoicm9ib3RzIjtzOjA6IiI7czozOiJzZWYiO3M6MToiMCI7czoxMToic2VmX3Jld3JpdGUiO3M6MToiMCI7czoxMDoic2VmX3N1ZmZpeCI7czoxOiIwIjtzOjEyOiJ1bmljb2Rlc2x1Z3MiO3M6MToiMCI7czoxMDoiZmVlZF9saW1pdCI7czoyOiIxMCI7czoxMDoiZmVlZF9lbWFpbCI7czo0OiJub25lIjtzOjg6ImxvZ19wYXRoIjtzOjQ3OiIvaG9tZS9hbHgvcGhwL2NyeXB0b2NvaW4ubG9jL2FkbWluaXN0cmF0b3IvbG9ncyI7czo4OiJ0bXBfcGF0aCI7czozMjoiL2hvbWUvYWx4L3BocC9jcnlwdG9jb2luLmxvYy90bXAiO3M6ODoibGlmZXRpbWUiO3M6NjoiNjAwMDAwIjtzOjE1OiJzZXNzaW9uX2hhbmRsZXIiO3M6ODoiZGF0YWJhc2UiO3M6ODoiYXNzZXRfaWQiO2k6MTtzOjE2OiJtZW1jYWNoZV9wZXJzaXN0IjtzOjE6IjEiO3M6MTc6Im1lbWNhY2hlX2NvbXByZXNzIjtzOjE6IjAiO3M6MjA6Im1lbWNhY2hlX3NlcnZlcl9ob3N0IjtzOjk6ImxvY2FsaG9zdCI7czoyMDoibWVtY2FjaGVfc2VydmVyX3BvcnQiO3M6NToiMTEyMTEiO3M6MTc6Im1lbWNhY2hlZF9wZXJzaXN0IjtzOjE6IjEiO3M6MTg6Im1lbWNhY2hlZF9jb21wcmVzcyI7czoxOiIwIjtzOjIxOiJtZW1jYWNoZWRfc2VydmVyX2hvc3QiO3M6OToibG9jYWxob3N0IjtzOjIxOiJtZW1jYWNoZWRfc2VydmVyX3BvcnQiO3M6NToiMTEyMTEiO3M6MTM6InJlZGlzX3BlcnNpc3QiO3M6MToiMSI7czoxNzoicmVkaXNfc2VydmVyX2hvc3QiO3M6OToibG9jYWxob3N0IjtzOjE3OiJyZWRpc19zZXJ2ZXJfcG9ydCI7czo0OiI2Mzc5IjtzOjE3OiJyZWRpc19zZXJ2ZXJfYXV0aCI7czowOiIiO3M6MTU6InJlZGlzX3NlcnZlcl9kYiI7czoxOiIwIjtzOjEyOiJwcm94eV9lbmFibGUiO3M6MToiMCI7czoxMDoicHJveHlfaG9zdCI7czowOiIiO3M6MTA6InByb3h5X3BvcnQiO3M6MDoiIjtzOjEwOiJwcm94eV91c2VyIjtzOjA6IiI7czoxMDoicHJveHlfcGFzcyI7czowOiIiO3M6MTE6Im1hc3NtYWlsb2ZmIjtzOjE6IjAiO3M6MTA6Ik1ldGFSaWdodHMiO3M6MDoiIjtzOjE5OiJzaXRlbmFtZV9wYWdldGl0bGVzIjtzOjE6IjAiO3M6OToiZm9yY2Vfc3NsIjtzOjE6IjAiO3M6Mjg6InNlc3Npb25fbWVtY2FjaGVfc2VydmVyX2hvc3QiO3M6OToibG9jYWxob3N0IjtzOjI4OiJzZXNzaW9uX21lbWNhY2hlX3NlcnZlcl9wb3J0IjtzOjU6IjExMjExIjtzOjI5OiJzZXNzaW9uX21lbWNhY2hlZF9zZXJ2ZXJfaG9zdCI7czo5OiJsb2NhbGhvc3QiO3M6Mjk6InNlc3Npb25fbWVtY2FjaGVkX3NlcnZlcl9wb3J0IjtzOjU6IjExMjExIjtzOjEyOiJmcm9udGVkaXRpbmciO3M6MToiMSI7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjA6IiI7czo3OiJmaWx0ZXJzIjthOjk6e2k6MTthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6Ik5IIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6OTthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6IkJMIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6NjthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjI6IkJMIjtzOjExOiJmaWx0ZXJfdGFncyI7czowOiIiO3M6MTc6ImZpbHRlcl9hdHRyaWJ1dGVzIjtzOjA6IiI7fWk6NzthOjM6e3M6MTE6ImZpbHRlcl90eXBlIjtzOjQ6Ik5PTkUiO3M6MTE6ImZpbHRlcl90YWdzIjtzOjA6IiI7czoxNzoiZmlsdGVyX2F0dHJpYnV0ZXMiO3M6MDoiIjt9aToyO2E6Mzp7czoxMToiZmlsdGVyX3R5cGUiO3M6MjoiTkgiO3M6MTE6ImZpbHRlcl90YWdzIjtzOjA6IiI7czoxNzoiZmlsdGVyX2F0dHJpYnV0ZXMiO3M6MDoiIjt9aTozO2E6Mzp7czoxMToiZmlsdGVyX3R5cGUiO3M6MjoiQkwiO3M6MTE6ImZpbHRlcl90YWdzIjtzOjA6IiI7czoxNzoiZmlsdGVyX2F0dHJpYnV0ZXMiO3M6MDoiIjt9aTo0O2E6Mzp7czoxMToiZmlsdGVyX3R5cGUiO3M6MjoiQkwiO3M6MTE6ImZpbHRlcl90YWdzIjtzOjA6IiI7czoxNzoiZmlsdGVyX2F0dHJpYnV0ZXMiO3M6MDoiIjt9aTo1O2E6Mzp7czoxMToiZmlsdGVyX3R5cGUiO3M6MjoiQkwiO3M6MTE6ImZpbHRlcl90YWdzIjtzOjA6IiI7czoxNzoiZmlsdGVyX2F0dHJpYnV0ZXMiO3M6MDoiIjt9aTo4O2E6Mzp7czoxMToiZmlsdGVyX3R5cGUiO3M6NDoiTk9ORSI7czoxMToiZmlsdGVyX3RhZ3MiO3M6MDoiIjtzOjE3OiJmaWx0ZXJfYXR0cmlidXRlcyI7czowOiIiO319fX19fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjoxO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086NToiSlVzZXIiOjE6e3M6MjoiaWQiO3M6MzoiODMzIjt9czoxMToiYXBwbGljYXRpb24iO086ODoic3RkQ2xhc3MiOjE6e3M6NToicXVldWUiO047fX19czoxNDoiACoAaW5pdGlhbGl6ZWQiO2I6MDtzOjk6InNlcGFyYXRvciI7czoxOiIuIjt9\";',833,'alx');
/*!40000 ALTER TABLE `j_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_tags`
--

DROP TABLE IF EXISTS `j_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access` int(10) unsigned NOT NULL DEFAULT '0',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) unsigned NOT NULL DEFAULT '1',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `tag_idx` (`published`,`access`),
  KEY `idx_access` (`access`),
  KEY `idx_checkout` (`checked_out`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100)),
  KEY `idx_language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_tags`
--

LOCK TABLES `j_tags` WRITE;
/*!40000 ALTER TABLE `j_tags` DISABLE KEYS */;
INSERT INTO `j_tags` VALUES (1,0,0,1,0,'','ROOT','root','','',1,0,'0000-00-00 00:00:00',1,'','','','',833,'2011-01-01 00:00:01','',0,'0000-00-00 00:00:00','','',0,'*',1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `j_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_template_styles`
--

DROP TABLE IF EXISTS `j_template_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_template_styles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_template` (`template`),
  KEY `idx_home` (`home`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_template_styles`
--

LOCK TABLES `j_template_styles` WRITE;
/*!40000 ALTER TABLE `j_template_styles` DISABLE KEYS */;
INSERT INTO `j_template_styles` VALUES (4,'beez3',0,'0','Beez3 - Default','{\"wrapperSmall\":\"53\",\"wrapperLarge\":\"72\",\"logo\":\"images\\/joomla_black.png\",\"sitetitle\":\"Joomla!\",\"sitedescription\":\"Open Source Content Management\",\"navposition\":\"left\",\"templatecolor\":\"personal\",\"html5\":\"0\"}'),(5,'hathor',1,'0','Hathor - Default','{\"showSiteName\":\"0\",\"colourChoice\":\"\",\"boldText\":\"0\"}'),(7,'protostar',0,'0','protostar - Default','{\"templateColor\":\"\",\"logoFile\":\"\",\"googleFont\":\"1\",\"googleFontName\":\"Open+Sans\",\"fluidContainer\":\"0\"}'),(8,'isis',1,'1','isis - Default','{\"templateColor\":\"\",\"logoFile\":\"\"}'),(9,'vmbeez3',0,'1','vmbeez3 - Default','{\"wrapperSmall\":53,\"wrapperLarge\":72,\"logo\":\"\",\"sitetitle\":\"\",\"sitedescription\":\"\",\"navposition\":\"left\",\"bootstrap\":\"\",\"templatecolor\":\"personal\",\"headerImage\":\"\",\"backgroundcolor\":\"#ffffff\",\"fontsizeselect\":\"1\",\"change_content_width\":\"1\",\"content_width\":1240,\"main_menu_position\":\"main_menu_top\",\"nav2cont_ratio\":20}');
/*!40000 ALTER TABLE `j_template_styles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_ucm_base`
--

DROP TABLE IF EXISTS `j_ucm_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_ucm_base` (
  `ucm_id` int(10) unsigned NOT NULL,
  `ucm_item_id` int(10) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL,
  PRIMARY KEY (`ucm_id`),
  KEY `idx_ucm_item_id` (`ucm_item_id`),
  KEY `idx_ucm_type_id` (`ucm_type_id`),
  KEY `idx_ucm_language_id` (`ucm_language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_ucm_base`
--

LOCK TABLES `j_ucm_base` WRITE;
/*!40000 ALTER TABLE `j_ucm_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_ucm_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_ucm_content`
--

DROP TABLE IF EXISTS `j_ucm_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_ucm_content` (
  `core_content_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_state` tinyint(1) NOT NULL DEFAULT '0',
  `core_checked_out_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_checked_out_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_access` int(10) unsigned NOT NULL DEFAULT '0',
  `core_params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_featured` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_modified_user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_publish_up` datetime NOT NULL,
  `core_publish_down` datetime NOT NULL,
  `core_content_item_id` int(10) unsigned DEFAULT NULL COMMENT 'ID from the individual type table',
  `asset_id` int(10) unsigned DEFAULT NULL COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_hits` int(10) unsigned NOT NULL DEFAULT '0',
  `core_version` int(10) unsigned NOT NULL DEFAULT '1',
  `core_ordering` int(11) NOT NULL DEFAULT '0',
  `core_metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `core_catid` int(10) unsigned NOT NULL DEFAULT '0',
  `core_xreference` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'A reference to enable linkages to external data sets.',
  `core_type_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`core_content_id`),
  KEY `tag_idx` (`core_state`,`core_access`),
  KEY `idx_access` (`core_access`),
  KEY `idx_alias` (`core_alias`(100)),
  KEY `idx_language` (`core_language`),
  KEY `idx_title` (`core_title`(100)),
  KEY `idx_modified_time` (`core_modified_time`),
  KEY `idx_created_time` (`core_created_time`),
  KEY `idx_content_type` (`core_type_alias`(100)),
  KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  KEY `idx_core_created_user_id` (`core_created_user_id`),
  KEY `idx_core_type_id` (`core_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_ucm_content`
--

LOCK TABLES `j_ucm_content` WRITE;
/*!40000 ALTER TABLE `j_ucm_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_ucm_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_ucm_history`
--

DROP TABLE IF EXISTS `j_ucm_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_ucm_history` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ucm_item_id` int(10) unsigned NOT NULL,
  `ucm_type_id` int(10) unsigned NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editor_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `character_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0=auto delete; 1=keep',
  PRIMARY KEY (`version_id`),
  KEY `idx_ucm_item_id` (`ucm_type_id`,`ucm_item_id`),
  KEY `idx_save_date` (`save_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_ucm_history`
--

LOCK TABLES `j_ucm_history` WRITE;
/*!40000 ALTER TABLE `j_ucm_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_ucm_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_update_sites`
--

DROP TABLE IF EXISTS `j_update_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_update_sites` (
  `update_site_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT '0',
  `last_check_timestamp` bigint(20) DEFAULT '0',
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_update_sites`
--

LOCK TABLES `j_update_sites` WRITE;
/*!40000 ALTER TABLE `j_update_sites` DISABLE KEYS */;
INSERT INTO `j_update_sites` VALUES (1,'Joomla! Core','collection','https://update.joomla.org/core/list.xml',1,1485891318,''),(2,'Joomla! Extension Directory','collection','https://update.joomla.org/jed/list.xml',1,1485891319,''),(3,'Accredited Joomla! Translations','collection','https://update.joomla.org/language/translationlist_3.xml',1,1485592489,''),(4,'Joomla! Update Component Update Site','extension','https://update.joomla.org/core/extensions/com_joomlaupdate.xml',1,1485592490,''),(5,'VirtueMart3 Update Site','extension','http://virtuemart.net/releases/vm3/virtuemart_update.xml',1,1485592490,''),(6,'VirtueMart plg_vmpayment_standard Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmpayment_standard_update.xml',1,1485592491,''),(7,'VirtueMart plg_vmpayment_klarna Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmpayment_klarna_update.xml',1,1485592491,''),(8,'VirtueMart plg_vmpayment_klarnacheckout Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmpayment_klarnacheckout_update.xml',1,1485592492,''),(9,'VirtueMart plg_vmpayment_sofort Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmpayment_sofort_update.xml',1,1485592492,''),(10,'VirtueMart plg_vmpayment_paypal Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmpayment_paypal_update.xml',1,1485592492,''),(11,'VirtueMart plg_vmpayment_heidelpay Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmpayment_heidelpay_update.xml',1,1485592493,''),(12,'VirtueMart plg_vmpayment_paybox Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmpayment_paybox_update.xml',1,1485592493,''),(13,'VirtueMart3 plg_vmpayment_tco Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmpayment_tco_update.xml',1,1485592494,''),(14,'VirtueMart plg_vmpayment_amazon Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmpayment_amazon_update.xml',1,1485592494,''),(15,'VirtueMart plg_system_amazon Update Site','extension','http://virtuemart.net/releases/vm3/plg_system_amazon_update.xml',1,1485592494,''),(16,'VirtueMart plg_vmpayment_realex_hpp_api Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmpayment_realex_hpp_api_update.xml',1,1485592495,''),(17,'VirtueMart plg_vmuserfield_realex_hpp_api Update Site','extension','\n            http://virtuemart.net/releases/vm3/plg_vmuserfield_realex_hpp_api_update.xml',1,1485592495,''),(18,'VirtueMart3 plg_vmpayment_skrill Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmpayment_skrill_update.xml',1,1485592496,''),(19,'VirtueMart plg_vmpayment_authorizenet Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmpayment_authorisenet_update.xml',1,1485592496,''),(20,'VirtueMart plg_vmpayment_sofort_ideal Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmpayment_sofort_ideal_update.xml',1,1485592496,''),(21,'VirtueMart plg_vmpayment_klikandpay Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmpayment_klikandpay_update.xml',1,1485592497,''),(22,'VirtueMart3 plg_vmshipment_weight_countries Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmshipment_weight_countries_update.xml',1,1485592497,''),(23,'VirtueMart3 plg_vmcustom_textinput Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmcustom_textinput_update.xml',1,1485592498,''),(24,'VirtueMart3 plg_vmcustom_specification Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmcustom_specification_update.xml',1,1485592498,''),(25,'VirtueMart3 plg_vmcalculation_avalara Update Site','extension','http://virtuemart.net/releases/vm3/plg_vmcalculation_avalara_update.xml',1,1485592499,''),(26,'VirtueMart3 plg_search_virtuemart Update Site','extension','http://virtuemart.net/releases/vm3/plg_search_virtuemart_update.xml',1,1485592499,''),(27,'VirtueMart3 MOD_VMENU Update Site','extension','http://virtuemart.net/releases/vm3/mod_vmmenu_update.xml',1,1485592499,''),(28,'VirtueMart3 mod_virtuemart_currencies Update Site','extension','http://virtuemart.net/releases/vm3/mod_virtuemart_currencies_update.xml',1,1485592500,''),(29,'VirtueMart3 mod_virtuemart_product Update Site','extension','http://virtuemart.net/releases/vm3/mod_virtuemart_product_update.xml',1,1485592500,''),(30,'VirtueMart3 mod_virtuemart_search Update Site','extension','http://virtuemart.net/releases/vm3/mod_virtuemart_search_update.xml',1,1485592501,''),(31,'VirtueMart3 mod_virtuemart_manufacturer Update Site','extension','http://virtuemart.net/releases/vm3/mod_virtuemart_manufacturer_update.xml',1,1485592501,''),(32,'VirtueMart3 mod_virtuemart_cart Update Site','extension','http://virtuemart.net/releases/vm3/mod_virtuemart_cart_update.xml',1,1485592502,''),(33,'VirtueMart3 mod_virtuemart_category Update Site','extension','http://virtuemart.net/releases/vm3/mod_virtuemart_category_update.xml',1,1485592502,''),(34,'VirtueMart3 AIO Update Site','extension','http://virtuemart.net/releases/vm3/virtuemart_aio_update.xml',1,1485592502,''),(35,'TCPDF Update Site','extension','http://virtuemart.net/releases/TCPDF/tcpdf.xml',1,1485592503,'');
/*!40000 ALTER TABLE `j_update_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_update_sites_extensions`
--

DROP TABLE IF EXISTS `j_update_sites_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT '0',
  `extension_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`update_site_id`,`extension_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_update_sites_extensions`
--

LOCK TABLES `j_update_sites_extensions` WRITE;
/*!40000 ALTER TABLE `j_update_sites_extensions` DISABLE KEYS */;
INSERT INTO `j_update_sites_extensions` VALUES (1,700),(2,700),(3,802),(4,28),(5,10000),(6,10002),(7,10003),(8,10004),(9,10005),(10,10006),(11,10007),(12,10008),(13,10009),(14,10010),(15,10011),(16,10012),(17,10013),(18,10014),(19,10015),(20,10016),(21,10017),(22,10018),(23,10019),(24,10020),(25,10021),(26,10022),(27,10023),(28,10024),(29,10025),(30,10026),(31,10027),(32,10028),(33,10029),(34,10001),(35,10030);
/*!40000 ALTER TABLE `j_update_sites_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_updates`
--

DROP TABLE IF EXISTS `j_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_updates` (
  `update_id` int(11) NOT NULL AUTO_INCREMENT,
  `update_site_id` int(11) DEFAULT '0',
  `extension_id` int(11) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(3) DEFAULT '0',
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`update_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_updates`
--

LOCK TABLES `j_updates` WRITE;
/*!40000 ALTER TABLE `j_updates` DISABLE KEYS */;
INSERT INTO `j_updates` VALUES (1,3,0,'Malay','','pkg_ms-MY','package','',0,'3.4.1.2','','https://update.joomla.org/language/details3/ms-MY_details.xml','',''),(2,3,0,'Romanian','','pkg_ro-RO','package','',0,'3.6.0.1','','https://update.joomla.org/language/details3/ro-RO_details.xml','',''),(3,3,0,'Flemish','','pkg_nl-BE','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/nl-BE_details.xml','',''),(4,3,0,'Chinese Traditional','','pkg_zh-TW','package','',0,'3.6.3.1','','https://update.joomla.org/language/details3/zh-TW_details.xml','',''),(5,3,0,'French','','pkg_fr-FR','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/fr-FR_details.xml','',''),(6,3,0,'Galician','','pkg_gl-ES','package','',0,'3.3.1.2','','https://update.joomla.org/language/details3/gl-ES_details.xml','',''),(7,3,0,'Georgian','','pkg_ka-GE','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/ka-GE_details.xml','',''),(8,3,0,'Greek','','pkg_el-GR','package','',0,'3.6.3.2','','https://update.joomla.org/language/details3/el-GR_details.xml','',''),(9,3,0,'Japanese','','pkg_ja-JP','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/ja-JP_details.xml','',''),(10,3,0,'Hebrew','','pkg_he-IL','package','',0,'3.1.1.1','','https://update.joomla.org/language/details3/he-IL_details.xml','',''),(11,3,0,'Hungarian','','pkg_hu-HU','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/hu-HU_details.xml','',''),(12,3,0,'Afrikaans','','pkg_af-ZA','package','',0,'3.6.3.1','','https://update.joomla.org/language/details3/af-ZA_details.xml','',''),(13,3,0,'Arabic Unitag','','pkg_ar-AA','package','',0,'3.6.5.2','','https://update.joomla.org/language/details3/ar-AA_details.xml','',''),(14,3,0,'Belarusian','','pkg_be-BY','package','',0,'3.2.1.1','','https://update.joomla.org/language/details3/be-BY_details.xml','',''),(15,3,0,'Bulgarian','','pkg_bg-BG','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/bg-BG_details.xml','',''),(16,3,0,'Catalan','','pkg_ca-ES','package','',0,'3.6.5.2','','https://update.joomla.org/language/details3/ca-ES_details.xml','',''),(17,3,0,'Chinese Simplified','','pkg_zh-CN','package','',0,'3.4.1.1','','https://update.joomla.org/language/details3/zh-CN_details.xml','',''),(18,3,0,'Croatian','','pkg_hr-HR','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/hr-HR_details.xml','',''),(19,3,0,'Czech','','pkg_cs-CZ','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/cs-CZ_details.xml','',''),(20,3,0,'Danish','','pkg_da-DK','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/da-DK_details.xml','',''),(21,3,0,'Dutch','','pkg_nl-NL','package','',0,'3.6.3.1','','https://update.joomla.org/language/details3/nl-NL_details.xml','',''),(22,3,0,'Estonian','','pkg_et-EE','package','',0,'3.6.0.1','','https://update.joomla.org/language/details3/et-EE_details.xml','',''),(23,3,0,'Italian','','pkg_it-IT','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/it-IT_details.xml','',''),(24,3,0,'Khmer','','pkg_km-KH','package','',0,'3.4.5.1','','https://update.joomla.org/language/details3/km-KH_details.xml','',''),(25,3,0,'Korean','','pkg_ko-KR','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/ko-KR_details.xml','',''),(26,3,0,'Latvian','','pkg_lv-LV','package','',0,'3.6.2.2','','https://update.joomla.org/language/details3/lv-LV_details.xml','',''),(27,3,0,'Macedonian','','pkg_mk-MK','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/mk-MK_details.xml','',''),(28,3,0,'Norwegian Bokmal','','pkg_nb-NO','package','',0,'3.5.1.1','','https://update.joomla.org/language/details3/nb-NO_details.xml','',''),(29,3,0,'Norwegian Nynorsk','','pkg_nn-NO','package','',0,'3.4.2.1','','https://update.joomla.org/language/details3/nn-NO_details.xml','',''),(30,1,700,'Joomla','','joomla','file','',0,'3.6.5','','https://update.joomla.org/core/sts/extension_sts.xml','',''),(31,3,0,'Persian','','pkg_fa-IR','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/fa-IR_details.xml','',''),(32,3,0,'Polish','','pkg_pl-PL','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/pl-PL_details.xml','',''),(33,3,0,'Portuguese','','pkg_pt-PT','package','',0,'3.6.4.3','','https://update.joomla.org/language/details3/pt-PT_details.xml','',''),(34,3,0,'Russian','','pkg_ru-RU','package','',0,'3.6.2.2','','https://update.joomla.org/language/details3/ru-RU_details.xml','',''),(35,3,0,'English AU','','pkg_en-AU','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/en-AU_details.xml','',''),(36,3,0,'Slovak','','pkg_sk-SK','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/sk-SK_details.xml','',''),(37,3,0,'English US','','pkg_en-US','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/en-US_details.xml','',''),(38,3,0,'Swedish','','pkg_sv-SE','package','',0,'3.6.3.1','','https://update.joomla.org/language/details3/sv-SE_details.xml','',''),(39,3,0,'Syriac','','pkg_sy-IQ','package','',0,'3.4.5.1','','https://update.joomla.org/language/details3/sy-IQ_details.xml','',''),(40,3,0,'Tamil','','pkg_ta-IN','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/ta-IN_details.xml','',''),(41,3,0,'Thai','','pkg_th-TH','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/th-TH_details.xml','',''),(42,3,0,'Turkish','','pkg_tr-TR','package','',0,'3.6.2.1','','https://update.joomla.org/language/details3/tr-TR_details.xml','',''),(43,3,0,'Ukrainian','','pkg_uk-UA','package','',0,'3.6.3.1','','https://update.joomla.org/language/details3/uk-UA_details.xml','',''),(44,3,0,'Uyghur','','pkg_ug-CN','package','',0,'3.3.0.1','','https://update.joomla.org/language/details3/ug-CN_details.xml','',''),(45,3,0,'Albanian','','pkg_sq-AL','package','',0,'3.1.1.1','','https://update.joomla.org/language/details3/sq-AL_details.xml','',''),(46,3,0,'Basque','','pkg_eu-ES','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/eu-ES_details.xml','',''),(47,3,0,'Hindi','','pkg_hi-IN','package','',0,'3.3.6.2','','https://update.joomla.org/language/details3/hi-IN_details.xml','',''),(48,3,0,'German DE','','pkg_de-DE','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/de-DE_details.xml','',''),(49,3,0,'Portuguese Brazil','','pkg_pt-BR','package','',0,'3.6.4.1','','https://update.joomla.org/language/details3/pt-BR_details.xml','',''),(50,3,0,'Serbian Latin','','pkg_sr-YU','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/sr-YU_details.xml','',''),(51,3,0,'Spanish','','pkg_es-ES','package','',0,'3.6.3.1','','https://update.joomla.org/language/details3/es-ES_details.xml','',''),(52,3,0,'Bosnian','','pkg_bs-BA','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/bs-BA_details.xml','',''),(53,3,0,'Serbian Cyrillic','','pkg_sr-RS','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/sr-RS_details.xml','',''),(54,3,0,'Vietnamese','','pkg_vi-VN','package','',0,'3.2.1.1','','https://update.joomla.org/language/details3/vi-VN_details.xml','',''),(55,3,0,'Bahasa Indonesia','','pkg_id-ID','package','',0,'3.6.2.1','','https://update.joomla.org/language/details3/id-ID_details.xml','',''),(56,3,0,'Finnish','','pkg_fi-FI','package','',0,'3.6.2.1','','https://update.joomla.org/language/details3/fi-FI_details.xml','',''),(57,3,0,'Swahili','','pkg_sw-KE','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/sw-KE_details.xml','',''),(58,3,0,'Montenegrin','','pkg_srp-ME','package','',0,'3.3.1.1','','https://update.joomla.org/language/details3/srp-ME_details.xml','',''),(59,3,0,'English CA','','pkg_en-CA','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/en-CA_details.xml','',''),(60,3,0,'French CA','','pkg_fr-CA','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/fr-CA_details.xml','',''),(61,3,0,'Welsh','','pkg_cy-GB','package','',0,'3.3.0.2','','https://update.joomla.org/language/details3/cy-GB_details.xml','',''),(62,3,0,'Sinhala','','pkg_si-LK','package','',0,'3.3.1.1','','https://update.joomla.org/language/details3/si-LK_details.xml','',''),(63,3,0,'Dari Persian','','pkg_prs-AF','package','',0,'3.4.4.1','','https://update.joomla.org/language/details3/prs-AF_details.xml','',''),(64,3,0,'Turkmen','','pkg_tk-TM','package','',0,'3.5.0.2','','https://update.joomla.org/language/details3/tk-TM_details.xml','',''),(65,3,0,'Irish','','pkg_ga-IE','package','',0,'3.6.4.1','','https://update.joomla.org/language/details3/ga-IE_details.xml','',''),(66,3,0,'Dzongkha','','pkg_dz-BT','package','',0,'3.6.2.1','','https://update.joomla.org/language/details3/dz-BT_details.xml','',''),(67,3,0,'Slovenian','','pkg_sl-SI','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/sl-SI_details.xml','',''),(68,3,0,'Spanish CO','','pkg_es-CO','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/es-CO_details.xml','',''),(69,3,0,'German CH','','pkg_de-CH','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/de-CH_details.xml','',''),(70,3,0,'German AT','','pkg_de-AT','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/de-AT_details.xml','',''),(71,3,0,'German LI','','pkg_de-LI','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/de-LI_details.xml','',''),(72,3,0,'German LU','','pkg_de-LU','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/de-LU_details.xml','',''),(73,3,0,'English NZ','','pkg_en-NZ','package','',0,'3.6.5.1','','https://update.joomla.org/language/details3/en-NZ_details.xml','',''),(74,5,10000,'VirtueMart','VirtueMart Component','com_virtuemart','component','',1,'3.0.18','','http://virtuemart.net/releases/vm3/virtuemart_update.xml','http://virtuemart.net/news/latest-news/477-release-of-3-0-18-connecting-the-loose-ends',''),(75,11,10007,'VirtueMart - Payments, Heidelpay','VirtueMart - Payments, Heidelpay','heidelpay','plugin','vmpayment',0,'3.0.18','','http://virtuemart.net/releases/vm3/plg_vmpayment_heidelpay_update.xml','https://docs.virtuemart.net/tutorials/installation-migration-upgrade/226-update-single-plugin-delivered-by-aio.html',''),(76,13,10009,'VirtueMart - Payments, tco','VirtueMart - Payments, 2 Checkout','tco','plugin','vmpayment',0,'3.0.18','','http://virtuemart.net/releases/vm3/plg_vmpayment_tco_update.xml','https://docs.virtuemart.net/tutorials/installation-migration-upgrade/226-update-single-plugin-delivered-by-aio.html',''),(77,21,10017,'VirtueMart - Payments, Klick and Pay','VirtueMart - Payments, Klick and Pay','klikandpay','plugin','vmpayment',0,'3.0.18','','http://virtuemart.net/releases/vm3/plg_vmpayment_klikandpay_update.xml','https://docs.virtuemart.net/tutorials/installation-migration-upgrade/226-update-single-plugin-delivered-by-aio.html',''),(78,22,0,'VirtueMart - Shipment, by Weight, country, zip,... ','VirtueMart - Shipment, Shipment, by Weight, country, zip,... ','standard','plugin','vmshipment',0,'3.0.18','','http://virtuemart.net/releases/vm3/plg_vmshipment_weight_countries_update.xml','https://docs.virtuemart.net/tutorials/installation-migration-upgrade/226-update-single-plugin-delivered-by-aio.html',''),(79,29,0,'VirtueMart Product module','VirtueMart Product module','mod_virtuemart_product','plugin','',0,'3.0.18','','http://virtuemart.net/releases/vm3/mod_virtuemart_product_update.xml','https://docs.virtuemart.net/tutorials/installation-migration-upgrade/226-update-single-plugin-delivered-by-aio.html',''),(80,34,10001,'VirtueMart AIO','VirtueMart AIO Component','com_virtuemart_allinone','component','',1,'3.0.18','','http://virtuemart.net/releases/vm3/virtuemart_aio_update.xml','http://virtuemart.net/news/latest-news/477-release-of-3-0-18-connecting-the-loose-ends','');
/*!40000 ALTER TABLE `j_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_user_keys`
--

DROP TABLE IF EXISTS `j_user_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_user_keys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invalid` tinyint(4) NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `series` (`series`),
  UNIQUE KEY `series_2` (`series`),
  UNIQUE KEY `series_3` (`series`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_user_keys`
--

LOCK TABLES `j_user_keys` WRITE;
/*!40000 ALTER TABLE `j_user_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_user_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_user_notes`
--

DROP TABLE IF EXISTS `j_user_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_user_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(10) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_user_id` int(10) unsigned NOT NULL,
  `modified_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `review_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_category_id` (`catid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_user_notes`
--

LOCK TABLES `j_user_notes` WRITE;
/*!40000 ALTER TABLE `j_user_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_user_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_user_profiles`
--

DROP TABLE IF EXISTS `j_user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_user_profiles`
--

LOCK TABLES `j_user_profiles` WRITE;
/*!40000 ALTER TABLE `j_user_profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_user_usergroup_map`
--

DROP TABLE IF EXISTS `j_user_usergroup_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_user_usergroup_map` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key to #__usergroups.id',
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_user_usergroup_map`
--

LOCK TABLES `j_user_usergroup_map` WRITE;
/*!40000 ALTER TABLE `j_user_usergroup_map` DISABLE KEYS */;
INSERT INTO `j_user_usergroup_map` VALUES (833,8);
/*!40000 ALTER TABLE `j_user_usergroup_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_usergroups`
--

DROP TABLE IF EXISTS `j_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_usergroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT '0' COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_usergroups`
--

LOCK TABLES `j_usergroups` WRITE;
/*!40000 ALTER TABLE `j_usergroups` DISABLE KEYS */;
INSERT INTO `j_usergroups` VALUES (1,0,1,18,'Public'),(2,1,8,15,'Registered'),(3,2,9,14,'Author'),(4,3,10,13,'Editor'),(5,4,11,12,'Publisher'),(6,1,4,7,'Manager'),(7,6,5,6,'Administrator'),(8,1,16,17,'Super Users'),(9,1,2,3,'Guest');
/*!40000 ALTER TABLE `j_usergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_users`
--

DROP TABLE IF EXISTS `j_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `sendEmail` tinyint(4) DEFAULT '0',
  `registerDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastvisitDate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT '0' COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'One time emergency passwords',
  `requireReset` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Require user to reset password on next login',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `username` (`username`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=834 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_users`
--

LOCK TABLES `j_users` WRITE;
/*!40000 ALTER TABLE `j_users` DISABLE KEYS */;
INSERT INTO `j_users` VALUES (833,'Super User','alx','alx.polyakov@gmail.com','$2y$10$D.zzGiSXqqtFJo9ZBU4ma.5GPoFkdXoUtzB0jrKyw.CqRvdfD7Ope',0,1,'2017-01-24 18:32:52','2017-01-27 07:26:09','0','{}','0000-00-00 00:00:00',0,'','',0);
/*!40000 ALTER TABLE `j_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_utf8_conversion`
--

DROP TABLE IF EXISTS `j_utf8_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_utf8_conversion` (
  `converted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_utf8_conversion`
--

LOCK TABLES `j_utf8_conversion` WRITE;
/*!40000 ALTER TABLE `j_utf8_conversion` DISABLE KEYS */;
INSERT INTO `j_utf8_conversion` VALUES (2);
/*!40000 ALTER TABLE `j_utf8_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_viewlevels`
--

DROP TABLE IF EXISTS `j_viewlevels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_viewlevels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT '0',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_assetgroup_title_lookup` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_viewlevels`
--

LOCK TABLES `j_viewlevels` WRITE;
/*!40000 ALTER TABLE `j_viewlevels` DISABLE KEYS */;
INSERT INTO `j_viewlevels` VALUES (1,'Public',0,'[1]'),(2,'Registered',2,'[6,2,8]'),(3,'Special',3,'[6,3,8]'),(5,'Guest',1,'[9]'),(6,'Super Users',4,'[8]');
/*!40000 ALTER TABLE `j_viewlevels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_adminmenuentries`
--

DROP TABLE IF EXISTS `j_virtuemart_adminmenuentries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_adminmenuentries` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'The ID of the VM Module, this Item is assigned to',
  `parent_id` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` char(64) NOT NULL DEFAULT '0',
  `link` char(64) NOT NULL DEFAULT '0',
  `depends` char(64) NOT NULL DEFAULT '' COMMENT 'Names of the Parameters, this Item depends on',
  `icon_class` char(96) DEFAULT NULL,
  `ordering` int(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `tooltip` char(128) DEFAULT NULL,
  `view` char(32) DEFAULT NULL,
  `task` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `module_id` (`module_id`),
  KEY `published` (`published`),
  KEY `ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='Administration Menu Items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_adminmenuentries`
--

LOCK TABLES `j_virtuemart_adminmenuentries` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_adminmenuentries` DISABLE KEYS */;
INSERT INTO `j_virtuemart_adminmenuentries` VALUES (1,1,0,'COM_VIRTUEMART_CATEGORY_S','','','vmicon vmicon-16-folder_camera',1,1,'','category',''),(2,1,0,'COM_VIRTUEMART_PRODUCT_S','','','vmicon vmicon-16-camera',2,1,'','product',''),(3,1,0,'COM_VIRTUEMART_PRODUCT_CUSTOM_FIELD_S','','','vmicon vmicon-16-document_move',5,1,'','custom',''),(4,1,0,'COM_VIRTUEMART_PRODUCT_INVENTORY','','','vmicon vmicon-16-price_watch',7,1,'','inventory',''),(5,1,0,'COM_VIRTUEMART_CALC_S','','','vmicon vmicon-16-calculator',8,1,'','calc',''),(6,1,0,'COM_VIRTUEMART_REVIEW_RATE_S','','','vmicon vmicon-16-comments',9,1,'','ratings',''),(7,2,0,'COM_VIRTUEMART_ORDER_S','','','vmicon vmicon-16-page_white_stack',1,1,'','orders',''),(8,2,0,'COM_VIRTUEMART_COUPON_S','','','vmicon vmicon-16-shopping',10,1,'','coupon',''),(9,2,0,'COM_VIRTUEMART_REPORT','','','vmicon vmicon-16-chart_bar',3,1,'','report',''),(10,2,0,'COM_VIRTUEMART_USER_S','','','vmicon vmicon-16-user',4,1,'','user',''),(11,2,0,'COM_VIRTUEMART_SHOPPERGROUP_S','','','vmicon vmicon-16-user-group',5,1,'','shoppergroup',''),(12,3,0,'COM_VIRTUEMART_MANUFACTURER_S','','','vmicon vmicon-16-wrench_orange',1,1,'','manufacturer',''),(13,3,0,'COM_VIRTUEMART_MANUFACTURER_CATEGORY_S','','','vmicon vmicon-16-folder_wrench',2,1,'','manufacturercategories',''),(14,4,0,'COM_VIRTUEMART_STORE','','','vmicon vmicon-16-reseller_account_template',1,1,'','user','editshop'),(15,4,0,'COM_VIRTUEMART_MEDIA_S','','','vmicon vmicon-16-pictures',2,1,'','media',''),(16,4,0,'COM_VIRTUEMART_SHIPMENTMETHOD_S','','','vmicon vmicon-16-lorry',3,1,'','shipmentmethod',''),(17,4,0,'COM_VIRTUEMART_PAYMENTMETHOD_S','','','vmicon vmicon-16-creditcards',4,1,'','paymentmethod',''),(18,5,0,'COM_VIRTUEMART_CONFIGURATION','','','vmicon vmicon-16-config',1,1,'','config',''),(19,5,0,'COM_VIRTUEMART_USERFIELD_S','','','vmicon vmicon-16-participation_rate',2,1,'','userfields',''),(20,5,0,'COM_VIRTUEMART_ORDERSTATUS_S','','','vmicon vmicon-16-document_editing',3,1,'','orderstatus',''),(21,5,0,'COM_VIRTUEMART_CURRENCY_S','','','vmicon vmicon-16-coins',5,1,'','currency',''),(22,5,0,'COM_VIRTUEMART_COUNTRY_S','','','vmicon vmicon-16-globe',6,1,'','country',''),(23,11,0,'COM_VIRTUEMART_MIGRATION_UPDATE','','','vmicon vmicon-16-installer_box',0,1,'','updatesmigration',''),(24,11,0,'COM_VIRTUEMART_ABOUT','','','vmicon vmicon-16-info',10,1,'','about',''),(25,11,0,'COM_VIRTUEMART_HELP_TOPICS','http://docs.virtuemart.net/','','vmicon vmicon-16-help',5,1,'','',''),(26,11,0,'COM_VIRTUEMART_COMMUNITY_FORUM','http://forum.virtuemart.net/','','vmicon vmicon-16-reseller_programm',7,1,'','',''),(27,11,0,'COM_VIRTUEMART_STATISTIC_SUMMARY','','','vmicon vmicon-16-info',1,1,'','virtuemart',''),(28,11,0,'COM_VIRTUEMART_LOG','','','vmicon vmicon-16-info',2,1,'','log',''),(29,11,0,'COM_VIRTUEMART_SUPPORT','','','vmicon vmicon-16-help',3,1,'','support','');
/*!40000 ALTER TABLE `j_virtuemart_adminmenuentries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_calc_categories`
--

DROP TABLE IF EXISTS `j_virtuemart_calc_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_calc_categories` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_calc_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_category_id` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_calc_id` (`virtuemart_calc_id`,`virtuemart_category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_calc_categories`
--

LOCK TABLES `j_virtuemart_calc_categories` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_calc_categories` DISABLE KEYS */;
INSERT INTO `j_virtuemart_calc_categories` VALUES (1,1,2),(2,1,3),(3,1,4),(4,1,7),(5,1,8),(6,1,9),(7,2,9),(8,3,11),(9,4,12);
/*!40000 ALTER TABLE `j_virtuemart_calc_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_calc_countries`
--

DROP TABLE IF EXISTS `j_virtuemart_calc_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_calc_countries` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_calc_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_country_id` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_calc_id` (`virtuemart_calc_id`,`virtuemart_country_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_calc_countries`
--

LOCK TABLES `j_virtuemart_calc_countries` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_calc_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_calc_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_calc_manufacturers`
--

DROP TABLE IF EXISTS `j_virtuemart_calc_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_calc_manufacturers` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_calc_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_manufacturer_id` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_calc_id` (`virtuemart_calc_id`,`virtuemart_manufacturer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_calc_manufacturers`
--

LOCK TABLES `j_virtuemart_calc_manufacturers` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_calc_manufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_calc_manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_calc_shoppergroups`
--

DROP TABLE IF EXISTS `j_virtuemart_calc_shoppergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_calc_shoppergroups` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_calc_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_shoppergroup_id` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_calc_id` (`virtuemart_calc_id`,`virtuemart_shoppergroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_calc_shoppergroups`
--

LOCK TABLES `j_virtuemart_calc_shoppergroups` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_calc_shoppergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_calc_shoppergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_calc_states`
--

DROP TABLE IF EXISTS `j_virtuemart_calc_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_calc_states` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_calc_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_state_id` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_calc_id` (`virtuemart_calc_id`,`virtuemart_state_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_calc_states`
--

LOCK TABLES `j_virtuemart_calc_states` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_calc_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_calc_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_calcs`
--

DROP TABLE IF EXISTS `j_virtuemart_calcs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_calcs` (
  `virtuemart_calc_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Belongs to vendor',
  `calc_jplugin_id` int(1) NOT NULL DEFAULT '0',
  `calc_name` varchar(64) NOT NULL DEFAULT '' COMMENT 'Name of the rule',
  `calc_descr` varchar(128) NOT NULL DEFAULT '' COMMENT 'Description',
  `calc_kind` varchar(16) NOT NULL DEFAULT '' COMMENT 'Discount/Tax/Margin/Commission',
  `calc_value_mathop` varchar(8) NOT NULL DEFAULT '' COMMENT 'the mathematical operation like (+,-,+%,-%)',
  `calc_value` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT 'The Amount',
  `calc_currency` smallint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Currency of the Rule',
  `calc_shopper_published` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Visible for Shoppers',
  `calc_vendor_published` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Visible for Vendors',
  `publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Startdate if nothing is set = permanent',
  `publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Enddate if nothing is set = permanent',
  `for_override` tinyint(1) NOT NULL DEFAULT '0',
  `calc_params` varchar(18000) NOT NULL DEFAULT '',
  `ordering` int(1) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_calc_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `published` (`published`),
  KEY `calc_kind` (`calc_kind`),
  KEY `shared` (`shared`),
  KEY `publish_up` (`publish_up`),
  KEY `publish_down` (`publish_down`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_calcs`
--

LOCK TABLES `j_virtuemart_calcs` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_calcs` DISABLE KEYS */;
INSERT INTO `j_virtuemart_calcs` VALUES (1,1,0,'Tax 20%','common vat, if your shop needs only one VAT, just use it without any category set','VatTax','+%',20.0000,47,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'',0,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(2,1,0,'Discount 5% for ladies','The discount is based on net price with VAT, the tax amount is recalculated based on the new net price','DATax','-%',5.0000,47,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'',0,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(3,1,0,'Tax 10%','as example for the category product variants','VatTax','+%',10.0000,47,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'',0,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(4,1,0,'Tax 7%','as example for the category product attributes','VatTax','+%',7.0000,47,0,0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,'',0,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_calcs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_carts`
--

DROP TABLE IF EXISTS `j_virtuemart_carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_carts` (
  `virtuemart_cart_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_user_id` int(1) unsigned NOT NULL,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL,
  `cartData` varbinary(50000) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_cart_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `virtuemart_user_id` (`virtuemart_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Used to store the cart';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_carts`
--

LOCK TABLES `j_virtuemart_carts` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_carts` DISABLE KEYS */;
INSERT INTO `j_virtuemart_carts` VALUES (6,833,1,'{\"cartProductsData\":[{\"virtuemart_product_id\":1211,\"quantity\":3,\"customProductData\":[]}],\"vendorId\":\"1\",\"lastVisitedCategoryId\":0,\"virtuemart_shipmentmethod_id\":\"1\",\"virtuemart_paymentmethod_id\":\"3\",\"automaticSelectedShipment\":true,\"automaticSelectedPayment\":false,\"order_number\":\"SVQG087\",\"BT\":{\"email\":\"alx.polyakov@gmail.com\",\"first_name\":\"Doe\",\"address_1\":\"PO Box 123\"},\"ST\":{\"email\":\"alx.polyakov@gmail.com\",\"first_name\":\"Doe\",\"address_1\":\"PO Box 123\"},\"cartfields\":[],\"couponCode\":\"\",\"_triesValidateCoupon\":[],\"order_language\":\"en-GB\",\"pricesCurrency\":\"47\",\"paymentCurrency\":\"47\",\"_guest\":0,\"_inCheckOut\":false,\"_inConfirm\":false,\"_dataValidated\":\"d41d8cd98f00b204e9800998ecf8427e\",\"_confirmDone\":true,\"STsameAsBT\":1,\"selected_shipto\":0,\"_fromCart\":true,\"layout\":\"default\",\"layoutPath\":\"\",\"virtuemart_cart_id\":\"6\"}','0000-00-00 00:00:00',0,'2017-01-31 19:58:50',833);
/*!40000 ALTER TABLE `j_virtuemart_carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_categories`
--

DROP TABLE IF EXISTS `j_virtuemart_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_categories` (
  `virtuemart_category_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1' COMMENT 'Belongs to vendor',
  `category_template` char(128) DEFAULT NULL,
  `category_layout` char(64) DEFAULT NULL,
  `category_product_layout` char(64) DEFAULT NULL,
  `products_per_row` tinyint(1) DEFAULT NULL,
  `limit_list_step` char(32) DEFAULT NULL,
  `limit_list_initial` smallint(1) unsigned DEFAULT NULL,
  `hits` int(1) unsigned NOT NULL DEFAULT '0',
  `metarobot` char(40) NOT NULL DEFAULT '',
  `metaauthor` char(64) NOT NULL DEFAULT '',
  `ordering` int(1) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_category_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `published` (`published`),
  KEY `shared` (`shared`),
  KEY `ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Product Categories are stored here';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_categories`
--

LOCK TABLES `j_virtuemart_categories` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_categories` DISABLE KEYS */;
INSERT INTO `j_virtuemart_categories` VALUES (13,1,'default','0','0',0,'0',0,0,'','',0,0,0,'2017-01-27 07:18:17',833,'2017-01-27 07:18:17',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_categories_en_gb`
--

DROP TABLE IF EXISTS `j_virtuemart_categories_en_gb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_categories_en_gb` (
  `virtuemart_category_id` int(1) unsigned NOT NULL,
  `category_name` varchar(180) NOT NULL DEFAULT '',
  `category_description` varchar(19000) NOT NULL DEFAULT '',
  `metadesc` varchar(400) NOT NULL DEFAULT '',
  `metakey` varchar(400) NOT NULL DEFAULT '',
  `customtitle` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(192) NOT NULL DEFAULT '',
  PRIMARY KEY (`virtuemart_category_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_categories_en_gb`
--

LOCK TABLES `j_virtuemart_categories_en_gb` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_categories_en_gb` DISABLE KEYS */;
INSERT INTO `j_virtuemart_categories_en_gb` VALUES (13,'Test category','','','','','test-category');
/*!40000 ALTER TABLE `j_virtuemart_categories_en_gb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_category_categories`
--

DROP TABLE IF EXISTS `j_virtuemart_category_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_category_categories` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `category_parent_id` int(1) unsigned NOT NULL DEFAULT '0',
  `category_child_id` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_parent_id` (`category_parent_id`,`category_child_id`),
  KEY `category_child_id` (`category_child_id`),
  KEY `ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Category child-parent relation list';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_category_categories`
--

LOCK TABLES `j_virtuemart_category_categories` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_category_categories` DISABLE KEYS */;
INSERT INTO `j_virtuemart_category_categories` VALUES (13,0,13,0);
/*!40000 ALTER TABLE `j_virtuemart_category_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_category_medias`
--

DROP TABLE IF EXISTS `j_virtuemart_category_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_category_medias` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_category_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_media_id` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_category_id` (`virtuemart_category_id`,`virtuemart_media_id`),
  KEY `ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_category_medias`
--

LOCK TABLES `j_virtuemart_category_medias` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_category_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_category_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_configs`
--

DROP TABLE IF EXISTS `j_virtuemart_configs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_configs` (
  `virtuemart_config_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `config` text,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_config_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Holds configuration settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_configs`
--

LOCK TABLES `j_virtuemart_configs` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_configs` DISABLE KEYS */;
INSERT INTO `j_virtuemart_configs` VALUES (1,'useSSL=\"0\"|dangeroustools=\"0\"|debug_enable=\"none\"|vmdev=\"none\"|google_jquery=\"0\"|multix=\"none\"|usefancy=\"1\"|jchosen=\"1\"|enableEnglish=\"1\"|shop_is_offline=\"0\"|offline_message=\"Our Shop is currently down for maintenance. Please check back again soon.\"|use_as_catalog=\"0\"|currency_converter_module=\"convertECB.php\"|order_mail_html=\"1\"|useVendorEmail=\"0\"|pdf_button_enable=\"1\"|show_emailfriend=\"0\"|show_printicon=\"1\"|show_out_of_stock_products=\"1\"|ask_captcha=\"1\"|coupons_enable=\"1\"|show_uncat_products=\"0\"|show_uncat_child_products=\"0\"|show_unpub_cat_products=\"1\"|coupons_default_expire=\"1,M\"|weight_unit_default=\"KG\"|lwh_unit_default=\"M\"|list_limit=\"30\"|showReviewFor=\"all\"|reviewMode=\"bought\"|showRatingFor=\"all\"|ratingMode=\"bought\"|reviews_autopublish=\"1\"|reviews_minimum_comment_length=\"0\"|reviews_maximum_comment_length=\"2000\"|product_navigation=\"1\"|display_stock=\"1\"|vmtemplate=\"default\"|categorytemplate=\"default\"|showCategory=\"1\"|categorylayout=\"0\"|categories_per_row=\"3\"|productlayout=\"0\"|products_per_row=\"3\"|llimit_init_FE=\"24\"|vmlayout=\"0\"|show_store_desc=\"1\"|show_categories=\"1\"|homepage_categories_per_row=\"3\"|homepage_products_per_row=\"3\"|show_featured=\"1\"|featured_products_rows=\"1\"|show_topTen=\"1\"|topTen_products_rows=\"1\"|show_recent=\"1\"|recent_products_rows=\"1\"|show_latest=\"1\"|latest_products_rows=\"1\"|assets_general_path=\"components\\/com_virtuemart\\/assets\\/\"|media_category_path=\"images\\/stories\\/virtuemart\\/category\\/\"|media_product_path=\"images\\/stories\\/virtuemart\\/product\\/\"|media_manufacturer_path=\"images\\/stories\\/virtuemart\\/manufacturer\\/\"|media_vendor_path=\"images\\/stories\\/virtuemart\\/vendor\\/\"|forSale_path_thumb=\"images\\/stories\\/virtuemart\\/forSale\\/resized\\/\"|img_resize_enable=\"1\"|img_width=\"0\"|img_height=\"90\"|no_image_set=\"noimage.gif\"|no_image_found=\"warning.png\"|browse_orderby_field=\"pc.ordering\"|browse_cat_orderby_field=\"c.ordering,category_name\"|browse_orderby_fields=[\"product_name\",\"`p`.product_sku\",\"category_name\",\"mf_name\",\"pc.ordering\"]|browse_search_fields=[\"product_name\",\"`p`.product_sku\",\"product_s_desc\",\"product_desc\",\"category_name\",\"category_description\",\"mf_name\"]|askprice=\"1\"|roundindig=\"1\"|show_prices=\"1\"|price_show_packaging_pricelabel=\"0\"|show_tax=\"1\"|basePrice=\"0\"|basePriceText=\"1\"|basePriceRounding=\"-1\"|variantModification=\"0\"|variantModificationText=\"1\"|variantModificationRounding=\"-1\"|basePriceVariant=\"1\"|basePriceVariantText=\"1\"|basePriceVariantRounding=\"-1\"|basePriceWithTax=\"0\"|basePriceWithTaxText=\"1\"|basePriceWithTaxRounding=\"-1\"|discountedPriceWithoutTax=\"1\"|discountedPriceWithoutTaxText=\"1\"|discountedPriceWithoutTaxRounding=\"-1\"|salesPriceWithDiscount=\"0\"|salesPriceWithDiscountText=\"1\"|salesPriceWithDiscountRounding=\"-1\"|salesPrice=\"1\"|salesPriceText=\"1\"|salesPriceRounding=\"-1\"|priceWithoutTax=\"1\"|priceWithoutTaxText=\"1\"|priceWithoutTaxRounding=\"-1\"|discountAmount=\"1\"|discountAmountText=\"1\"|discountAmountRounding=\"-1\"|taxAmount=\"1\"|taxAmountText=\"1\"|taxAmountRounding=\"-1\"|unitPrice=\"1\"|unitPriceText=\"1\"|unitPriceRounding=\"-1\"|addtocart_popup=\"1\"|check_stock=\"0\"|automatic_payment=\"0\"|automatic_shipment=\"0\"|oncheckout_opc=\"1\"|oncheckout_ajax=\"1\"|oncheckout_show_legal_info=\"1\"|oncheckout_show_register=\"1\"|oncheckout_show_steps=\"0\"|oncheckout_show_register_text=\"COM_VIRTUEMART_ONCHECKOUT_DEFAULT_TEXT_REGISTER\"|oncheckout_show_images=\"1\"|inv_os=[\"C\"]|email_os_s=[\"U\",\"C\",\"X\",\"R\",\"S\"]|email_os_v=[\"U\",\"C\",\"X\",\"R\"]|seo_disabled=\"0\"|seo_translate=\"0\"|seo_use_id=\"0\"|enable_content_plugin=\"0\"|reg_captcha=\"0\"|handle_404=\"1\"|active_languages=[\"en-GB\"]|revproxvar=\"\"|multixcart=\"0\"|attach=\"\"|attach_os=[\"U\",\"C\",\"X\",\"R\"]|pdf_icon=\"0\"|recommend_unauth=\"0\"|ask_question=\"0\"|asks_minimum_comment_length=\"50\"|asks_maximum_comment_length=\"2000\"|cp_rm=[\"C\"]|show_pcustoms=\"1\"|show_uncat_parent_products=\"0\"|latest_products_days=\"7\"|latest_products_orderBy=\"created_on\"|lstockmail=\"0\"|stockhandle=\"none\"|rised_availability=\"\"|image=\"\"|rr_os=[\"C\"]|show_manufacturers=\"1\"|cartlayout=\"default\"|productsublayout=\"0\"|manufacturer_per_row=\"3\"|mediaLimit=\"20\"|llimit_init_BE=\"30\"|pagseq=\"\"|pagseq_1=\"\"|pagseq_2=\"\"|pagseq_3=\"\"|pagseq_4=\"\"|pagseq_5=\"\"|feed_cat_published=\"0\"|feed_cat_show_images=\"0\"|feed_cat_show_prices=\"0\"|feed_cat_show_description=\"0\"|feed_cat_description_type=\"product_s_desc\"|feed_cat_max_text_length=\"500\"|forSale_path=\"\\/home\\/alx\\/php\\/cryptocoin.loc\\/administrator\\/components\\/com_virtuemart\\/mwoQlnA7hN6F\\/\"|add_img_main=\"0\"|feed_latest_published=\"0\"|feed_latest_nb=\"5\"|feed_topten_published=\"0\"|feed_topten_nb=\"5\"|feed_featured_published=\"0\"|feed_featured_nb=\"5\"|feed_home_show_images=\"1\"|feed_home_show_prices=\"1\"|feed_home_show_description=\"0\"|feed_home_description_type=\"product_s_desc\"|feed_home_max_text_length=\"500\"|css=\"1\"|jquery=\"1\"|jprice=\"1\"|jsite=\"1\"|jdynupdate=\"1\"|rappenrundung=\"0\"|cVarswT=\"1\"|popup_rel=\"1\"|set_automatic_shipment=\"0\"|set_automatic_payment=\"0\"|agree_to_tos_onorder=\"1\"|oncheckout_only_registered=\"0\"|oncheckout_change_shopper=\"1\"|del_date_type=\"m\"|prd_brws_orderby_dir=\"ASC\"|cat_brws_orderby_dir=\"ASC\"|use_seo_suffix=\"1\"|seo_sufix=\"-detail\"|seo_full=\"1\"|task=\"apply\"|option=\"com_virtuemart\"|view=\"config\"|2ebf777e3566ceba63a990ee9fe63c8b=\"1\"','0000-00-00 00:00:00',0,'2017-01-28 07:27:41',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_configs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_countries`
--

DROP TABLE IF EXISTS `j_virtuemart_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_countries` (
  `virtuemart_country_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_worldzone_id` tinyint(1) NOT NULL DEFAULT '1',
  `country_name` varchar(64) DEFAULT NULL,
  `country_3_code` char(3) DEFAULT NULL,
  `country_2_code` char(2) DEFAULT NULL,
  `ordering` int(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_country_id`),
  KEY `country_3_code` (`country_3_code`),
  KEY `country_2_code` (`country_2_code`),
  KEY `country_name` (`country_name`),
  KEY `ordering` (`ordering`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=249 DEFAULT CHARSET=utf8 COMMENT='Country records';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_countries`
--

LOCK TABLES `j_virtuemart_countries` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_countries` DISABLE KEYS */;
INSERT INTO `j_virtuemart_countries` VALUES (1,1,'Afghanistan','AFG','AF',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(2,1,'Albania','ALB','AL',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(3,1,'Algeria','DZA','DZ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(4,1,'American Samoa','ASM','AS',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(5,1,'Andorra','AND','AD',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(6,1,'Angola','AGO','AO',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(7,1,'Anguilla','AIA','AI',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(8,1,'Antarctica','ATA','AQ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(9,1,'Antigua and Barbuda','ATG','AG',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(10,1,'Argentina','ARG','AR',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(11,1,'Armenia','ARM','AM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(12,1,'Aruba','ABW','AW',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(13,1,'Australia','AUS','AU',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(14,1,'Austria','AUT','AT',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(15,1,'Azerbaijan','AZE','AZ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(16,1,'Bahamas','BHS','BS',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(17,1,'Bahrain','BHR','BH',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(18,1,'Bangladesh','BGD','BD',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(19,1,'Barbados','BRB','BB',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(20,1,'Belarus','BLR','BY',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(21,1,'Belgium','BEL','BE',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(22,1,'Belize','BLZ','BZ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(23,1,'Benin','BEN','BJ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(24,1,'Bermuda','BMU','BM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(25,1,'Bhutan','BTN','BT',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(26,1,'Bolivia','BOL','BO',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(27,1,'Bosnia and Herzegowina','BIH','BA',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(28,1,'Botswana','BWA','BW',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(29,1,'Bouvet Island','BVT','BV',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(30,1,'Brazil','BRA','BR',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(31,1,'British Indian Ocean Territory','IOT','IO',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(32,1,'Brunei Darussalam','BRN','BN',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(33,1,'Bulgaria','BGR','BG',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(34,1,'Burkina Faso','BFA','BF',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(35,1,'Burundi','BDI','BI',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(36,1,'Cambodia','KHM','KH',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(37,1,'Cameroon','CMR','CM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(38,1,'Canada','CAN','CA',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(39,1,'Cape Verde','CPV','CV',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(40,1,'Cayman Islands','CYM','KY',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(41,1,'Central African Republic','CAF','CF',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(42,1,'Chad','TCD','TD',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(43,1,'Chile','CHL','CL',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(44,1,'China','CHN','CN',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(45,1,'Christmas Island','CXR','CX',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(46,1,'Cocos (Keeling) Islands','CCK','CC',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(47,1,'Colombia','COL','CO',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(48,1,'Comoros','COM','KM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(49,1,'Congo','COG','CG',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(50,1,'Cook Islands','COK','CK',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(51,1,'Costa Rica','CRI','CR',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(52,1,'Cote D\'Ivoire','CIV','CI',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(53,1,'Croatia','HRV','HR',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(54,1,'Cuba','CUB','CU',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(55,1,'Cyprus','CYP','CY',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(56,1,'Czech Republic','CZE','CZ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(57,1,'Denmark','DNK','DK',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(58,1,'Djibouti','DJI','DJ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(59,1,'Dominica','DMA','DM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(60,1,'Dominican Republic','DOM','DO',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(61,1,'East Timor','TLS','TL',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(62,1,'Ecuador','ECU','EC',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(63,1,'Egypt','EGY','EG',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(64,1,'El Salvador','SLV','SV',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(65,1,'Equatorial Guinea','GNQ','GQ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(66,1,'Eritrea','ERI','ER',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(67,1,'Estonia','EST','EE',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(68,1,'Ethiopia','ETH','ET',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(69,1,'Falkland Islands (Malvinas)','FLK','FK',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(70,1,'Faroe Islands','FRO','FO',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(71,1,'Fiji','FJI','FJ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(72,1,'Finland','FIN','FI',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(73,1,'France','FRA','FR',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(75,1,'French Guiana','GUF','GF',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(76,1,'French Polynesia','PYF','PF',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(77,1,'French Southern Territories','ATF','TF',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(78,1,'Gabon','GAB','GA',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(79,1,'Gambia','GMB','GM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(80,1,'Georgia','GEO','GE',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(81,1,'Germany','DEU','DE',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(82,1,'Ghana','GHA','GH',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(83,1,'Gibraltar','GIB','GI',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(84,1,'Greece','GRC','GR',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(85,1,'Greenland','GRL','GL',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(86,1,'Grenada','GRD','GD',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(87,1,'Guadeloupe','GLP','GP',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(88,1,'Guam','GUM','GU',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(89,1,'Guatemala','GTM','GT',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(90,1,'Guinea','GIN','GN',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(91,1,'Guinea-bissau','GNB','GW',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(92,1,'Guyana','GUY','GY',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(93,1,'Haiti','HTI','HT',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(94,1,'Heard and Mc Donald Islands','HMD','HM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(95,1,'Honduras','HND','HN',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(96,1,'Hong Kong','HKG','HK',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(97,1,'Hungary','HUN','HU',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(98,1,'Iceland','ISL','IS',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(99,1,'India','IND','IN',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(100,1,'Indonesia','IDN','ID',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(101,1,'Iran (Islamic Republic of)','IRN','IR',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(102,1,'Iraq','IRQ','IQ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(103,1,'Ireland','IRL','IE',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(104,1,'Israel','ISR','IL',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(105,1,'Italy','ITA','IT',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(106,1,'Jamaica','JAM','JM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(107,1,'Japan','JPN','JP',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(108,1,'Jordan','JOR','JO',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(109,1,'Kazakhstan','KAZ','KZ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(110,1,'Kenya','KEN','KE',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(111,1,'Kiribati','KIR','KI',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(112,1,'Korea, Democratic People\'s Republic of','PRK','KP',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(113,1,'Korea, Republic of','KOR','KR',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(114,1,'Kuwait','KWT','KW',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(115,1,'Kyrgyzstan','KGZ','KG',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(116,1,'Lao People\'s Democratic Republic','LAO','LA',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(117,1,'Latvia','LVA','LV',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(118,1,'Lebanon','LBN','LB',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(119,1,'Lesotho','LSO','LS',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(120,1,'Liberia','LBR','LR',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(121,1,'Libya','LBY','LY',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(122,1,'Liechtenstein','LIE','LI',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(123,1,'Lithuania','LTU','LT',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(124,1,'Luxembourg','LUX','LU',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(125,1,'Macau','MAC','MO',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(126,1,'Macedonia, The Former Yugoslav Republic of','MKD','MK',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(127,1,'Madagascar','MDG','MG',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(128,1,'Malawi','MWI','MW',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(129,1,'Malaysia','MYS','MY',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(130,1,'Maldives','MDV','MV',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(131,1,'Mali','MLI','ML',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(132,1,'Malta','MLT','MT',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(133,1,'Marshall Islands','MHL','MH',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(134,1,'Martinique','MTQ','MQ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(135,1,'Mauritania','MRT','MR',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(136,1,'Mauritius','MUS','MU',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(137,1,'Mayotte','MYT','YT',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(138,1,'Mexico','MEX','MX',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(139,1,'Micronesia, Federated States of','FSM','FM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(140,1,'Moldova, Republic of','MDA','MD',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(141,1,'Monaco','MCO','MC',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(142,1,'Mongolia','MNG','MN',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(143,1,'Montserrat','MSR','MS',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(144,1,'Morocco','MAR','MA',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(145,1,'Mozambique','MOZ','MZ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(146,1,'Myanmar','MMR','MM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(147,1,'Namibia','NAM','NA',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(148,1,'Nauru','NRU','NR',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(149,1,'Nepal','NPL','NP',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(150,1,'Netherlands','NLD','NL',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(151,1,'Netherlands Antilles','ANT','AN',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(152,1,'New Caledonia','NCL','NC',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(153,1,'New Zealand','NZL','NZ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(154,1,'Nicaragua','NIC','NI',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(155,1,'Niger','NER','NE',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(156,1,'Nigeria','NGA','NG',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(157,1,'Niue','NIU','NU',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(158,1,'Norfolk Island','NFK','NF',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(159,1,'Northern Mariana Islands','MNP','MP',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(160,1,'Norway','NOR','NO',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(161,1,'Oman','OMN','OM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(162,1,'Pakistan','PAK','PK',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(163,1,'Palau','PLW','PW',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(164,1,'Panama','PAN','PA',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(165,1,'Papua New Guinea','PNG','PG',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(166,1,'Paraguay','PRY','PY',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(167,1,'Peru','PER','PE',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(168,1,'Philippines','PHL','PH',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(169,1,'Pitcairn','PCN','PN',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(170,1,'Poland','POL','PL',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(171,1,'Portugal','PRT','PT',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(172,1,'Puerto Rico','PRI','PR',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(173,1,'Qatar','QAT','QA',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(174,1,'Reunion','REU','RE',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(175,1,'Romania','ROM','RO',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(176,1,'Russian Federation','RUS','RU',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(177,1,'Rwanda','RWA','RW',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(178,1,'Saint Kitts and Nevis','KNA','KN',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(179,1,'Saint Lucia','LCA','LC',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(180,1,'Saint Vincent and the Grenadines','VCT','VC',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(181,1,'Samoa','WSM','WS',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(182,1,'San Marino','SMR','SM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(183,1,'Sao Tome and Principe','STP','ST',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(184,1,'Saudi Arabia','SAU','SA',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(185,1,'Senegal','SEN','SN',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(186,1,'Seychelles','SYC','SC',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(187,1,'Sierra Leone','SLE','SL',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(188,1,'Singapore','SGP','SG',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(189,1,'Slovakia','SVK','SK',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(190,1,'Slovenia','SVN','SI',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(191,1,'Solomon Islands','SLB','SB',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(192,1,'Somalia','SOM','SO',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(193,1,'South Africa','ZAF','ZA',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(194,1,'South Georgia and the South Sandwich Islands','SGS','GS',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(195,1,'Spain','ESP','ES',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(196,1,'Sri Lanka','LKA','LK',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(197,1,'St. Helena','SHN','SH',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(198,1,'St. Pierre and Miquelon','SPM','PM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(199,1,'Sudan','SDN','SD',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(200,1,'Suriname','SUR','SR',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(201,1,'Svalbard and Jan Mayen Islands','SJM','SJ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(202,1,'Swaziland','SWZ','SZ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(203,1,'Sweden','SWE','SE',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(204,1,'Switzerland','CHE','CH',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(205,1,'Syrian Arab Republic','SYR','SY',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(206,1,'Taiwan','TWN','TW',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(207,1,'Tajikistan','TJK','TJ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(208,1,'Tanzania, United Republic of','TZA','TZ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(209,1,'Thailand','THA','TH',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(210,1,'Togo','TGO','TG',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(211,1,'Tokelau','TKL','TK',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(212,1,'Tonga','TON','TO',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(213,1,'Trinidad and Tobago','TTO','TT',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(214,1,'Tunisia','TUN','TN',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(215,1,'Turkey','TUR','TR',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(216,1,'Turkmenistan','TKM','TM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(217,1,'Turks and Caicos Islands','TCA','TC',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(218,1,'Tuvalu','TUV','TV',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(219,1,'Uganda','UGA','UG',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(220,1,'Ukraine','UKR','UA',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(221,1,'United Arab Emirates','ARE','AE',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(222,1,'United Kingdom','GBR','GB',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(223,1,'United States','USA','US',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(224,1,'United States Minor Outlying Islands','UMI','UM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(225,1,'Uruguay','URY','UY',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(226,1,'Uzbekistan','UZB','UZ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(227,1,'Vanuatu','VUT','VU',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(228,1,'Vatican City State (Holy See)','VAT','VA',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(229,1,'Venezuela','VEN','VE',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(230,1,'Viet Nam','VNM','VN',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(231,1,'Virgin Islands (British)','VGB','VG',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(232,1,'Virgin Islands (U.S.)','VIR','VI',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(233,1,'Wallis and Futuna Islands','WLF','WF',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(234,1,'Western Sahara','ESH','EH',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(235,1,'Yemen','YEM','YE',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(237,1,'The Democratic Republic of Congo','RCB','CD',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(238,1,'Zambia','ZMB','ZM',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(239,1,'Zimbabwe','ZWE','ZW',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(241,1,'Jersey','JEY','JE',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(242,1,'St. Barthelemy','BLM','BL',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(243,1,'St. Eustatius','BES','BQ',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(244,1,'Canary Islands','XCA','IC',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(245,1,'Serbia','SRB','RS',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(246,1,'Sint Maarten (French Antilles)','MAF','MF',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(247,1,'Sint Maarten (Netherlands Antilles)','SXM','SX',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(248,1,'Palestinian Territory, occupied','PSE','PS',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_coupons`
--

DROP TABLE IF EXISTS `j_virtuemart_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_coupons` (
  `virtuemart_coupon_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL,
  `coupon_code` varchar(32) NOT NULL DEFAULT '',
  `percent_or_total` enum('percent','total') NOT NULL DEFAULT 'percent',
  `coupon_type` enum('gift','permanent') NOT NULL DEFAULT 'gift',
  `coupon_value` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `coupon_start_date` datetime DEFAULT NULL,
  `coupon_expiry_date` datetime DEFAULT NULL,
  `coupon_value_valid` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `coupon_used` varchar(200) NOT NULL DEFAULT '',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_coupon_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `coupon_code` (`coupon_code`),
  KEY `coupon_type` (`coupon_type`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Used to store coupon codes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_coupons`
--

LOCK TABLES `j_virtuemart_coupons` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_coupons` DISABLE KEYS */;
INSERT INTO `j_virtuemart_coupons` VALUES (1,1,'Sample Coupon','total','permanent',0.01000,'0000-00-00 00:00:00','0000-00-00 00:00:00',0.00000,'0',1,'0000-00-00 00:00:00',635,'0000-00-00 00:00:00',635,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_currencies`
--

DROP TABLE IF EXISTS `j_virtuemart_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_currencies` (
  `virtuemart_currency_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1',
  `currency_name` varchar(64) DEFAULT NULL,
  `currency_code_2` char(2) DEFAULT NULL,
  `currency_code_3` char(3) DEFAULT NULL,
  `currency_numeric_code` int(4) DEFAULT NULL,
  `currency_exchange_rate` decimal(10,5) DEFAULT NULL,
  `currency_symbol` varchar(8) DEFAULT NULL,
  `currency_decimal_place` varchar(8) DEFAULT NULL,
  `currency_decimal_symbol` varchar(8) DEFAULT NULL,
  `currency_thousands` varchar(8) DEFAULT NULL,
  `currency_positive_style` varchar(64) DEFAULT NULL,
  `currency_negative_style` varchar(64) DEFAULT NULL,
  `ordering` int(1) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '1',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_currency_id`),
  UNIQUE KEY `currency_code_3` (`currency_code_3`),
  KEY `ordering` (`ordering`),
  KEY `currency_name` (`currency_name`),
  KEY `published` (`published`),
  KEY `shared` (`shared`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `currency_numeric_code` (`currency_numeric_code`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COMMENT='Used to store currencies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_currencies`
--

LOCK TABLES `j_virtuemart_currencies` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_currencies` DISABLE KEYS */;
INSERT INTO `j_virtuemart_currencies` VALUES (2,1,'United Arab Emirates dirham','','AED',784,0.00000,'د.إ','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(4,1,'Albanian lek','','ALL',8,0.00000,'Lek','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(5,1,'Netherlands Antillean gulden','','ANG',532,0.00000,'ƒ','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(7,1,'Argentine peso','','ARS',32,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(9,1,'Australian dollar','','AUD',36,0.00000,'$','2','.','','{symbol} {number}','{sign}{symbol} {number}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(10,1,'Aruban florin','','AWG',533,0.00000,'ƒ','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(11,1,'Barbadian dollar','','BBD',52,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(12,1,'Bangladeshi taka','','BDT',50,0.00000,'৳','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(15,1,'Bahraini dinar','','BHD',48,0.00000,'ب.د','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(16,1,'Burundian franc','','BIF',108,0.00000,'Fr','0','','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(17,1,'Bermudian dollar','','BMD',60,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(18,1,'Brunei dollar','','BND',96,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(19,1,'Bolivian boliviano','','BOB',68,0.00000,'$b','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(20,1,'Brazilian real','','BRL',986,0.00000,'R$','2',',','.','{symbol} {number}','{symbol} {sign}{number}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(21,1,'Bahamian dollar','','BSD',44,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(22,1,'Bhutanese ngultrum','','BTN',64,0.00000,'BTN','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(24,1,'Botswana pula','','BWP',72,0.00000,'P','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(25,1,'Belize dollar','','BZD',84,0.00000,'BZ$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(26,1,'Canadian dollar','','CAD',124,0.00000,'$','2','.',',','{symbol}{number}','{symbol}{sign}{number}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(27,1,'Swiss franc','','CHF',756,0.00000,'CHF','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(28,1,'Unidad de Fomento','','CLF',990,0.00000,'CLF','0',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(29,1,'Chilean peso','','CLP',152,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(30,1,'Chinese renminbi yuan','','CNY',156,0.00000,'元','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(31,1,'Colombian peso','','COP',170,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(32,1,'Costa Rican colón','','CRC',188,0.00000,'₡','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(33,1,'Czech koruna','','CZK',203,0.00000,'Kč','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(34,1,'Cuban peso','','CUP',192,0.00000,'₱','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(35,1,'Cape Verdean escudo','','CVE',132,0.00000,'$','0','','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(40,1,'Danish krone','','DKK',208,0.00000,'kr','2','.',',','{symbol}{number}','{symbol}{sign}{number}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(41,1,'Dominican peso','','DOP',214,0.00000,'RD$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(42,1,'Algerian dinar','','DZD',12,0.00000,'د.ج','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(44,1,'Egyptian pound','','EGP',818,0.00000,'£','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(46,1,'Ethiopian birr','','ETB',230,0.00000,'ETB','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(47,1,'Euro','','EUR',978,0.00000,'€','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(49,1,'Fijian dollar','','FJD',242,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(50,1,'Falkland pound','','FKP',238,0.00000,'£','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(52,1,'British pound','','GBP',826,0.00000,'£','2','.',',','{symbol}{number}','{symbol}{sign}{number}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(54,1,'Gibraltar pound','','GIP',292,0.00000,'£','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(55,1,'Gambian dalasi','','GMD',270,0.00000,'D','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(56,1,'Guinean franc','','GNF',324,0.00000,'Fr','0','','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(58,1,'Guatemalan quetzal','','GTQ',320,0.00000,'Q','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(60,1,'Guyanese dollar','','GYD',328,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(61,1,'Hong Kong dollar','','HKD',344,0.00000,'元','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(62,1,'Honduran lempira','','HNL',340,0.00000,'L','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(63,1,'Haitian gourde','','HTG',332,0.00000,'G','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(64,1,'Hungarian forint','','HUF',348,0.00000,'Ft','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(65,1,'Indonesian rupiah','','IDR',360,0.00000,'Rp','0','','','{symbol}{number}','{symbol}{sign}{number}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(67,1,'Israeli new sheqel','','ILS',376,0.00000,'₪','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(68,1,'Indian rupee','','INR',356,0.00000,'₨','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(69,1,'Iraqi dinar','','IQD',368,0.00000,'ع.د','0','','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(70,1,'Iranian rial','','IRR',364,0.00000,'﷼','2',',','','{number} {symbol}','{sign}{number}{symb0l}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(73,1,'Jamaican dollar','','JMD',388,0.00000,'J$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(74,1,'Jordanian dinar','','JOD',400,0.00000,'د.ا','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(75,1,'Japanese yen','','JPY',392,0.00000,'¥','0',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(76,1,'Kenyan shilling','','KES',404,0.00000,'Sh','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(77,1,'Cambodian riel','','KHR',116,0.00000,'៛','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(78,1,'Comorian franc','','KMF',174,0.00000,'Fr','0','','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(79,1,'North Korean won','','KPW',408,0.00000,'₩','0','','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(80,1,'South Korean won','','KRW',410,0.00000,'₩','0','','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(81,1,'Kuwaiti dinar','','KWD',414,0.00000,'د.ك','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(82,1,'Cayman Islands dollar','','KYD',136,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(83,1,'Lao kip','','LAK',418,0.00000,'₭','0','','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(84,1,'Lebanese pound','','LBP',422,0.00000,'£','0','','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(85,1,'Sri Lankan rupee','','LKR',144,0.00000,'₨','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(86,1,'Liberian dollar','','LRD',430,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(87,1,'Lesotho loti','','LSL',426,0.00000,'L','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(89,1,'Libyan dinar','','LYD',434,0.00000,'ل.د','3',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(90,1,'Moroccan dirham','','MAD',504,0.00000,'د.م.','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(92,1,'Mongolian tögrög','','MNT',496,0.00000,'₮','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(93,1,'Macanese pataca','','MOP',446,0.00000,'P','1',',','','{symbol}{number}','{symbol}{sign}{number}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(94,1,'Mauritanian ouguiya','','MRO',478,0.00000,'UM','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(96,1,'Mauritian rupee','','MUR',480,0.00000,'₨','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(97,1,'Maldivian rufiyaa','','MVR',462,0.00000,'ރ.','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(98,1,'Malawian kwacha','','MWK',454,0.00000,'MK','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(100,1,'Malaysian ringgit','','MYR',458,0.00000,'RM','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(102,1,'Nigerian naira','','NGN',566,0.00000,'₦','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(105,1,'Norwegian krone','','NOK',578,0.00000,'kr','2',',','','{symbol}{number}','{symbol}{sign}{number}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(106,1,'Nepalese rupee','','NPR',524,0.00000,'₨','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(107,1,'New Zealand dollar','','NZD',554,0.00000,'$','2',',','','{number} {symbol}','{symbol}{sign}{number}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(108,1,'Omani rial','','OMR',512,0.00000,'﷼','3','.','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(109,1,'Panamanian balboa','','PAB',590,0.00000,'B/.','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(110,1,'Peruvian nuevo sol','','PEN',604,0.00000,'S/.','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(111,1,'Papua New Guinean kina','','PGK',598,0.00000,'K','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(112,1,'Philippine peso','','PHP',608,0.00000,'₱','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(113,1,'Pakistani rupee','','PKR',586,0.00000,'₨','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(114,1,'Polish Złoty','','PLN',985,0.00000,'zł','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(116,1,'Paraguayan guaraní','','PYG',600,0.00000,'₲','0','','.','{symbol} {number}','{symbol} {sign}{number}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(117,1,'Qatari riyal','','QAR',634,0.00000,'﷼','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(118,1,'Romanian leu','','RON',946,0.00000,'lei','2',',','.','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(119,1,'Rwandan franc','','RWF',646,0.00000,'Fr','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(120,1,'Saudi riyal','','SAR',682,0.00000,'﷼','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(121,1,'Solomon Islands dollar','','SBD',90,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(122,1,'Seychellois rupee','','SCR',690,0.00000,'₨','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(124,1,'Swedish krona','','SEK',752,0.00000,'kr','2',',','.','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(125,1,'Singapore dollar','','SGD',702,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(126,1,'Saint Helenian pound','','SHP',654,0.00000,'£','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(127,1,'Sierra Leonean leone','','SLL',694,0.00000,'Le','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(128,1,'Somali shilling','','SOS',706,0.00000,'S','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(130,1,'São Tomé and Príncipe dobra','','STD',678,0.00000,'Db','0','','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(131,1,'Russian ruble','','RUB',643,0.00000,'руб','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(132,1,'Salvadoran colón','','SVC',222,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(133,1,'Syrian pound','','SYP',760,0.00000,'£','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(134,1,'Swazi lilangeni','','SZL',748,0.00000,'L','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(135,1,'Thai baht','','THB',764,0.00000,'฿','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(136,1,'Tunisian dinar','','TND',788,0.00000,'د.ت','3',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(137,1,'Tongan paʻanga','','TOP',776,0.00000,'T$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(139,1,'Türk Lirası','','TRY',949,0.00000,'TL','2',',','.','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(140,1,'Trinidad and Tobago dollar','','TTD',780,0.00000,'TT$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(141,1,'New Taiwan dollar','','TWD',901,0.00000,'NT$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(142,1,'Tanzanian shilling','','TZS',834,0.00000,'Sh','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(144,1,'United States dollar','','USD',840,0.00000,'$','2','.',',','{symbol}{number}','{symbol}{sign}{number}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(147,1,'Vietnamese Dong','','VND',704,0.00000,'₫','0','','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(148,1,'Vanuatu vatu','','VUV',548,0.00000,'Vt','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(149,1,'Samoan tala','','WST',882,0.00000,'T','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(151,1,'Yemeni rial','','YER',886,0.00000,'﷼','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(152,1,'Serbian dinar','','RSD',941,0.00000,'Дин.','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(153,1,'South African rand','','ZAR',710,0.00000,'R','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(154,1,'Zambian kwacha','','ZMK',894,0.00000,'ZK','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(156,1,'Zimbabwean dollar','','ZWD',932,0.00000,'Z$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(158,1,'Armenian dram','','AMD',51,0.00000,'դր.','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(159,1,'Myanmar kyat','','MMK',104,0.00000,'K','2',',','','{number} {symbol}','{symbol} {sign}{number}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(160,1,'Croatian kuna','','HRK',191,0.00000,'kn','2',',','.','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(161,1,'Eritrean nakfa','','ERN',232,0.00000,'Nfk','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(162,1,'Djiboutian franc','','DJF',262,0.00000,'Fr','0','','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(163,1,'Icelandic króna','','ISK',352,0.00000,'kr','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(164,1,'Kazakhstani tenge','','KZT',398,0.00000,'лв','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(165,1,'Kyrgyzstani som','','KGS',417,0.00000,'лв','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(166,1,'Latvian lats','','LVL',428,0.00000,'Ls','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(167,1,'Lithuanian litas','','LTL',440,0.00000,'Lt','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(168,1,'Mexican peso','','MXN',484,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(169,1,'Moldovan leu','','MDL',498,0.00000,'L','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(170,1,'Namibian dollar','','NAD',516,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(171,1,'Nicaraguan córdoba','','NIO',558,0.00000,'C$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(172,1,'Ugandan shilling','','UGX',800,0.00000,'Sh','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(173,1,'Macedonian denar','','MKD',807,0.00000,'ден','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(174,1,'Uruguayan peso','','UYU',858,0.00000,'$','0','','','{symbol}number}','{symbol}{sign}{number}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(175,1,'Uzbekistani som','','UZS',860,0.00000,'лв','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(176,1,'Azerbaijani manat','','AZN',934,0.00000,'ман','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(177,1,'Ghanaian cedi','','GHS',936,0.00000,'₵','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(178,1,'Venezuelan bolívar','','VEF',937,0.00000,'Bs','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(179,1,'Sudanese pound','','SDG',938,0.00000,'£','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(180,1,'Uruguay Peso','','UYI',940,0.00000,'UYI','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(181,1,'Mozambican metical','','MZN',943,0.00000,'MT','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(182,1,'WIR Euro','','CHE',947,0.00000,'€','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(183,1,'WIR Franc','','CHW',948,0.00000,'CHW','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(184,1,'Central African CFA franc','','XAF',950,0.00000,'Fr','0','','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(185,1,'East Caribbean dollar','','XCD',951,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(186,1,'West African CFA franc','','XOF',952,0.00000,'Fr','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(187,1,'CFP franc','','XPF',953,0.00000,'Fr','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(188,1,'Surinamese dollar','','SRD',968,0.00000,'$','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(189,1,'Malagasy ariary','','MGA',969,0.00000,'MGA','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(190,1,'Unidad de Valor Real','','COU',970,0.00000,'COU','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(191,1,'Afghan afghani','','AFN',971,0.00000,'؋','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(192,1,'Tajikistani somoni','','TJS',972,0.00000,'ЅМ','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(193,1,'Angolan kwanza','','AOA',973,0.00000,'Kz','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(194,1,'Belarusian ruble','','BYR',974,0.00000,'p.','0','','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(195,1,'Bulgarian lev','','BGN',975,0.00000,'лв','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(196,1,'Congolese franc','','CDF',976,0.00000,'Fr','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(197,1,'Bosnia and Herzegovina convert','','BAM',977,0.00000,'KM','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(198,1,'Mexican Unid','','MXV',979,0.00000,'MXV','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(199,1,'Ukrainian hryvnia','','UAH',980,0.00000,'₴','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(200,1,'Georgian lari','','GEL',981,0.00000,'ლ','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(201,1,'Mvdol','','BOV',984,0.00000,'BOV','2',',','','{number} {symbol}','{sign}{number} {symbol}',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_customs`
--

DROP TABLE IF EXISTS `j_virtuemart_customs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_customs` (
  `virtuemart_custom_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `custom_parent_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1',
  `custom_jplugin_id` int(1) NOT NULL DEFAULT '0',
  `custom_element` varchar(50) NOT NULL DEFAULT '',
  `admin_only` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:Display in admin only',
  `custom_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'field title',
  `show_title` tinyint(1) NOT NULL DEFAULT '1',
  `custom_tip` varchar(255) NOT NULL DEFAULT '' COMMENT 'tip',
  `custom_value` varchar(2200) DEFAULT NULL COMMENT 'default value',
  `custom_desc` varchar(255) DEFAULT NULL COMMENT 'description or unit',
  `field_type` varchar(2) NOT NULL DEFAULT '0' COMMENT 'S:string,I:int,P:parent, B:bool,D:date,T:time,H:hidden',
  `is_list` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'list of values',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:hidden',
  `is_cart_attribute` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Add attributes to cart',
  `is_input` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Add input to cart',
  `searchable` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Available as search filter',
  `layout_pos` varchar(24) DEFAULT NULL COMMENT 'Layout Position',
  `custom_params` varchar(17000) NOT NULL DEFAULT '',
  `shared` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'valid for all vendors?',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `ordering` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_custom_id`),
  KEY `custom_parent_id` (`custom_parent_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `custom_element` (`custom_element`),
  KEY `field_type` (`field_type`),
  KEY `is_cart_attribute` (`is_cart_attribute`),
  KEY `is_input` (`is_input`),
  KEY `searchable` (`searchable`),
  KEY `shared` (`shared`),
  KEY `published` (`published`),
  KEY `ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='custom fields definition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_customs`
--

LOCK TABLES `j_virtuemart_customs` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_customs` DISABLE KEYS */;
INSERT INTO `j_virtuemart_customs` VALUES (1,0,0,0,'0',0,'COM_VIRTUEMART_RELATED_PRODUCTS',1,'COM_VIRTUEMART_RELATED_PRODUCTS_TIP','related_products','COM_VIRTUEMART_RELATED_PRODUCTS_DESC','R',0,0,0,0,0,'related_products','wPrice=\"1\"|wImage=\"1\"|wDescr=\"1\"|',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(2,0,0,0,'0',0,'COM_VIRTUEMART_RELATED_CATEGORIES',1,'COM_VIRTUEMART_RELATED_CATEGORIES_TIP','related_categories','COM_VIRTUEMART_RELATED_CATEGORIES_DESC','Z',0,0,0,0,0,'related_categories','wImage=\"1\"|wDescr=\"1\"|',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(9,0,1,0,'',0,'Group',1,'Group','','set of cart attribute','G',0,0,0,0,0,'','',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(10,0,1,0,'',0,'String',1,'Also with tooltip','Display characteristic product attributes in a standarized format','','S',0,0,0,0,0,'','',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(11,9,1,0,'',0,'String, attribute',1,'Use values seperated by ; to directly select the value in the backend','','','S',0,0,1,0,0,'','',0,1,'0000-00-00 00:00:00',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(12,0,1,0,'',0,'String, list',1,'Use values seperated by ; to directly select the value in the backend','Cotton;Wool;Flax;Nylon;Polyester','','S',1,0,1,0,0,'','',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(13,0,1,0,'',0,'String, is input',1,'Select a variant','Combine Customfields of the same type to create flexible selections (dropdowns, radio lists)','','S',0,0,1,1,0,'addtocart','',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(14,0,1,0,'',0,'String, admin list',1,'Select a variant','Cotton;Wool;Flax;Nylon;Polyester','','S',2,0,1,1,0,'addtocart','',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(15,9,1,0,'',0,'Media, list',1,'Also with tooltip','20;21;22;23;24','extra Image','M',1,0,1,0,0,'','',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(16,9,1,0,'',0,'Editor',1,'Show extra conditions','Use the texteditor to display extra text at predefined positions','Testimonial','X',0,0,0,0,0,'','',0,1,'0000-00-00 00:00:00',0,3,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(17,0,1,0,'',0,'Date',1,'Show date','','Next delivery','D',0,0,1,0,0,'addtocart','',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(18,0,1,0,'',0,'Time',1,'Show time','','Workshop at ','T',0,0,0,0,0,'addtocart','',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(20,0,1,0,'',0,'Generic Child Variant',1,'Also with tooltip','Use admin lists for faster product editing','','A',0,0,1,0,0,'ontop','withParent=\"0\"|parentOrderable=\"0\"|wPrice=\"1\"|',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(21,0,1,0,'',0,'Multi Variant',1,'Also with tooltip','Use admin lists for faster product editing','','C',0,0,1,0,0,'addtocart','usecanonical=\"1\"|showlabels=\"0\"|sCustomId=\"11\"|selectoptions=\"0\"|clabels=\"0\"|options=\"0\"|',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(22,0,1,0,'',0,'Media, paid',1,'Also with tooltip','','paid extra Image','M',0,0,1,1,0,'addtocart','width=\"0\"|height=\"0\"|addEmpty=\"0\"|selectType=\"1\"|',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(23,0,1,0,'',0,'String, is input alternative',1,'Select a variant','Combine Customfields of the same type to create flexible selections (dropdowns, radio lists)','','S',0,0,1,1,0,'addtocart','',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(24,0,1,0,'',0,'Property',0,'','','','P',0,0,0,0,0,'','',0,1,'0000-00-00 00:00:00',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_customs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_invoices`
--

DROP TABLE IF EXISTS `j_virtuemart_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_invoices` (
  `virtuemart_invoice_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1',
  `virtuemart_order_id` int(1) unsigned DEFAULT NULL,
  `invoice_number` varchar(64) DEFAULT NULL,
  `order_status` char(2) DEFAULT NULL,
  `xhtml` text,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_invoice_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`,`virtuemart_vendor_id`),
  KEY `virtuemart_order_id` (`virtuemart_order_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='custom fields definition';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_invoices`
--

LOCK TABLES `j_virtuemart_invoices` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_manufacturer_medias`
--

DROP TABLE IF EXISTS `j_virtuemart_manufacturer_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_manufacturer_medias` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_manufacturer_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_media_id` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_manufacturer_id` (`virtuemart_manufacturer_id`,`virtuemart_media_id`),
  KEY `ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_manufacturer_medias`
--

LOCK TABLES `j_virtuemart_manufacturer_medias` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_manufacturer_medias` DISABLE KEYS */;
INSERT INTO `j_virtuemart_manufacturer_medias` VALUES (1,3,5,1),(2,1,6,1),(3,2,5,1);
/*!40000 ALTER TABLE `j_virtuemart_manufacturer_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_manufacturercategories`
--

DROP TABLE IF EXISTS `j_virtuemart_manufacturercategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_manufacturercategories` (
  `virtuemart_manufacturercategories_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_manufacturercategories_id`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Manufacturers are assigned to these categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_manufacturercategories`
--

LOCK TABLES `j_virtuemart_manufacturercategories` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_manufacturercategories` DISABLE KEYS */;
INSERT INTO `j_virtuemart_manufacturercategories` VALUES (1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_manufacturercategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_manufacturercategories_en_gb`
--

DROP TABLE IF EXISTS `j_virtuemart_manufacturercategories_en_gb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_manufacturercategories_en_gb` (
  `virtuemart_manufacturercategories_id` int(1) unsigned NOT NULL,
  `mf_category_name` varchar(180) NOT NULL DEFAULT '',
  `mf_category_desc` varchar(19000) NOT NULL DEFAULT '',
  `slug` varchar(192) NOT NULL DEFAULT '',
  PRIMARY KEY (`virtuemart_manufacturercategories_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_manufacturercategories_en_gb`
--

LOCK TABLES `j_virtuemart_manufacturercategories_en_gb` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_manufacturercategories_en_gb` DISABLE KEYS */;
INSERT INTO `j_virtuemart_manufacturercategories_en_gb` VALUES (1,'default','This is the default manufacturer category ','default');
/*!40000 ALTER TABLE `j_virtuemart_manufacturercategories_en_gb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_manufacturers`
--

DROP TABLE IF EXISTS `j_virtuemart_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_manufacturers` (
  `virtuemart_manufacturer_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_manufacturercategories_id` int(1) DEFAULT NULL,
  `metarobot` varchar(400) DEFAULT NULL,
  `metaauthor` varchar(400) DEFAULT NULL,
  `hits` int(1) unsigned NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_manufacturer_id`),
  UNIQUE KEY `virtuemart_manufacturercategories_id` (`virtuemart_manufacturer_id`,`virtuemart_manufacturercategories_id`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Manufacturers are those who deliver products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_manufacturers`
--

LOCK TABLES `j_virtuemart_manufacturers` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_manufacturers` DISABLE KEYS */;
INSERT INTO `j_virtuemart_manufacturers` VALUES (1,1,NULL,NULL,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(2,1,NULL,NULL,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(3,1,NULL,NULL,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_manufacturers_en_gb`
--

DROP TABLE IF EXISTS `j_virtuemart_manufacturers_en_gb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_manufacturers_en_gb` (
  `virtuemart_manufacturer_id` int(1) unsigned NOT NULL,
  `mf_name` varchar(180) NOT NULL DEFAULT '',
  `mf_email` varchar(255) NOT NULL DEFAULT '',
  `mf_desc` varchar(19000) NOT NULL DEFAULT '',
  `mf_url` varchar(255) NOT NULL DEFAULT '',
  `metadesc` varchar(400) NOT NULL DEFAULT '',
  `metakey` varchar(400) NOT NULL DEFAULT '',
  `customtitle` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(192) NOT NULL DEFAULT '',
  PRIMARY KEY (`virtuemart_manufacturer_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_manufacturers_en_gb`
--

LOCK TABLES `j_virtuemart_manufacturers_en_gb` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_manufacturers_en_gb` DISABLE KEYS */;
INSERT INTO `j_virtuemart_manufacturers_en_gb` VALUES (1,'Manufacturer','manufacturer@example.org','<p>An example for a manufacturer</p>','http://virtuemart.net','','','','manufacturer'),(2,'Default','example@manufacturer.net','<p>Default manufacturer</p>','http://virtuemart.net','','','','default'),(3,'Producer','info@producer.com','<p>An example for another manufacturer.</p>','http://virtuemart.net','','','','producer');
/*!40000 ALTER TABLE `j_virtuemart_manufacturers_en_gb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_medias`
--

DROP TABLE IF EXISTS `j_virtuemart_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_medias` (
  `virtuemart_media_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1',
  `file_title` varchar(126) NOT NULL DEFAULT '',
  `file_description` varchar(254) NOT NULL DEFAULT '',
  `file_meta` varchar(254) NOT NULL DEFAULT '',
  `file_class` varchar(64) NOT NULL DEFAULT '',
  `file_mimetype` varchar(64) NOT NULL DEFAULT '',
  `file_type` varchar(32) NOT NULL DEFAULT '',
  `file_url` varchar(900) NOT NULL DEFAULT '',
  `file_url_thumb` varchar(900) NOT NULL DEFAULT '',
  `file_is_product_image` tinyint(1) NOT NULL DEFAULT '0',
  `file_is_downloadable` tinyint(1) NOT NULL DEFAULT '0',
  `file_is_forSale` tinyint(1) NOT NULL DEFAULT '0',
  `file_params` varchar(17000) NOT NULL DEFAULT '',
  `file_lang` varchar(500) NOT NULL DEFAULT '',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_media_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `published` (`published`),
  KEY `file_type` (`file_type`),
  KEY `shared` (`shared`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='Additional Images and Files which are assigned to products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_medias`
--

LOCK TABLES `j_virtuemart_medias` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_medias` DISABLE KEYS */;
INSERT INTO `j_virtuemart_medias` VALUES (1,1,'ShopLogo','Used in the invoice','virtuemart shop','','image/gif','vendor','images/stories/virtuemart/vendor/vendor.gif','images/stories/virtuemart/vendor/resized/vendor_0x90.gif',0,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(5,1,'Manufacturer','','','','image/jpeg','manufacturer','images/stories/virtuemart/manufacturer/manufacturer.jpg','',0,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(6,1,'Producer','','','','image/jpeg','manufacturer','images/stories/virtuemart/manufacturer/producer.jpg','',0,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(10,1,'student hat','Products in this category showing tips and tricks','student_hat_16','','image/jpeg','category','images/stories/virtuemart/category/student_hat_16.jpg','',0,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(11,1,'T-Shirts','Warp5 T-Shirts','virtuemart warp5','','image/png','product','images/stories/virtuemart/product/tshirt5.png','',0,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(12,1,'Hats','Hat #1','virtuemart #1','','image/png','product','images/stories/virtuemart/product/hat1.png','',0,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(13,1,'Skirts','Skirt #1','virtuemart #1','','image/png','product','images/stories/virtuemart/product/skirt1.png','',0,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(20,1,'VM Cart Logo','The Famous VirtueMart Cart Logo','virtuemart cart logo','','image/jpeg','product','images/stories/virtuemart/product/cart_logo.jpg','',1,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(21,1,'Hat 1','VirtueMart Sample','virtuemart sample','','image/png','product','images/stories/virtuemart/product/hat1.png','',1,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(22,1,'Hat 2','VirtueMart Sample','virtuemart sample','','image/png','product','images/stories/virtuemart/product/hat2.png','',1,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(23,1,'Hat 3','VirtueMart Sample','virtuemart sample','','image/png','product','images/stories/virtuemart/product/hat3.png','',1,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(24,1,'shirt 1','VirtueMart Sample','virtuemart sample','','image/png','product','images/stories/virtuemart/product/shirt1.png','',1,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(25,1,'shirt 2','VirtueMart Sample','virtuemart sample','','image/png','product','images/stories/virtuemart/product/shirt2.png','',1,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(26,1,'Coat','','','','image/png','product','images/stories/virtuemart/product/coat1.png','',1,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(27,1,'Skirt 1','VirtueMart Sample','virtuemart sample','','image/png','product','images/stories/virtuemart/product/skirt1.png','',1,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(28,1,'Skirt 2','VirtueMart Sample','virtuemart sample','','image/png','product','images/stories/virtuemart/product/skirt2.png','',1,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(29,1,'T-Shirt EightBall','VirtueMart Sample','virtuemart sample','','image/png','product','images/stories/virtuemart/product/tshirt8.png','',1,0,0,'','',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_migration_oldtonew_ids`
--

DROP TABLE IF EXISTS `j_virtuemart_migration_oldtonew_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_migration_oldtonew_ids` (
  `id` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `cats` longblob,
  `catsxref` blob,
  `manus` longblob,
  `mfcats` blob,
  `shoppergroups` longblob,
  `products` longblob,
  `products_start` int(1) DEFAULT NULL,
  `orderstates` blob,
  `orders` longblob,
  `attributes` longblob,
  `relatedproducts` longblob,
  `orders_start` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='xref table for vm1 ids to vm2 ids';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_migration_oldtonew_ids`
--

LOCK TABLES `j_virtuemart_migration_oldtonew_ids` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_migration_oldtonew_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_migration_oldtonew_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_modules`
--

DROP TABLE IF EXISTS `j_virtuemart_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_modules` (
  `module_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` char(255) DEFAULT NULL,
  `module_description` varchar(21000) DEFAULT NULL,
  `module_perms` char(255) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `is_admin` enum('0','1') NOT NULL DEFAULT '0',
  `ordering` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`module_id`),
  KEY `module_name` (`module_name`),
  KEY `ordering` (`ordering`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='VirtueMart Core Modules, not: Joomla modules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_modules`
--

LOCK TABLES `j_virtuemart_modules` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_modules` DISABLE KEYS */;
INSERT INTO `j_virtuemart_modules` VALUES (1,'product','Here you can administer your online catalog of products.  Categories , Products (view=product), Attributes, Product Types, Product Files (view=media), Inventory, Calculation Rules, Customer Reviews  ','storeadmin,admin',1,'',1),(2,'order','View Order and Update Order Status:    Orders , Coupons , Revenue Report ,Shopper , Shopper Groups ','admin,storeadmin',1,'',2),(3,'manufacturer','Manage the manufacturers of products in your store.','storeadmin,admin',1,'',3),(4,'store','Store Configuration: Store Information, Payment Methods , Shipment, Shipment Rates','storeadmin,admin',1,'',4),(5,'configuration','Configuration: shop configuration , currencies (view=currency), Credit Card List, Countries, userfields, order status  ','admin,storeadmin',1,'0',5),(6,'msgs','This module is unprotected an used for displaying system messages to users.  We need to have an area that does not require authorization when things go wrong.','none',0,'',99),(7,'shop','This is the Washupito store module.  This is the demo store included with the VirtueMart distribution.','none',1,'',99),(8,'store','Store Configuration: Store Information, Payment Methods , Shipment, Shipment Rates','storeadmin,admin',1,'',4),(9,'account','This module allows shoppers to update their account information and view previously placed orders.','shopper,storeadmin,admin,demo',1,'',99),(10,'checkout','','none',0,'',99),(11,'tools','Tools','admin',1,'0',8),(13,'zone','This is the zone-shipment module. Here you can manage your shipment costs according to Zones.','admin,storeadmin',0,'',11);
/*!40000 ALTER TABLE `j_virtuemart_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_order_calc_rules`
--

DROP TABLE IF EXISTS `j_virtuemart_order_calc_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_order_calc_rules` (
  `virtuemart_order_calc_rule_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_calc_id` int(1) unsigned DEFAULT NULL,
  `virtuemart_order_id` int(1) unsigned DEFAULT NULL,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1',
  `virtuemart_order_item_id` int(1) DEFAULT NULL,
  `calc_rule_name` varchar(64) NOT NULL DEFAULT '' COMMENT 'Name of the rule',
  `calc_kind` varchar(16) NOT NULL DEFAULT '' COMMENT 'Discount/Tax/Margin/Commission',
  `calc_mathop` varchar(16) NOT NULL DEFAULT '' COMMENT 'Discount/Tax/Margin/Commission',
  `calc_amount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `calc_result` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `calc_value` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `calc_currency` int(1) DEFAULT NULL,
  `calc_params` varchar(18000) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_order_calc_rule_id`),
  KEY `virtuemart_calc_id` (`virtuemart_calc_id`),
  KEY `virtuemart_order_id` (`virtuemart_order_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Stores all calculation rules which are part of an order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_order_calc_rules`
--

LOCK TABLES `j_virtuemart_order_calc_rules` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_order_calc_rules` DISABLE KEYS */;
INSERT INTO `j_virtuemart_order_calc_rules` VALUES (1,1,1,1,1,'Tax 20%','VatTax','+%',2.00000,2.56395,20.00000,47,'','2017-01-24 18:40:38',833,'2017-01-24 18:40:38',833,'0000-00-00 00:00:00',0),(2,1,1,1,NULL,'Tax 20%','payment','+%',0.06595,0.00000,20.00000,47,'','2017-01-24 18:40:38',833,'2017-01-24 18:40:38',833,'0000-00-00 00:00:00',0),(3,1,1,1,NULL,'Tax 20%','shipment','+%',0.49800,0.00000,20.00000,47,'','2017-01-24 18:40:38',833,'2017-01-24 18:40:38',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_order_calc_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_order_histories`
--

DROP TABLE IF EXISTS `j_virtuemart_order_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_order_histories` (
  `virtuemart_order_history_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(1) unsigned NOT NULL DEFAULT '0',
  `order_status_code` char(1) NOT NULL DEFAULT '0',
  `customer_notified` tinyint(1) NOT NULL DEFAULT '0',
  `comments` varchar(21000) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_order_history_id`),
  KEY `virtuemart_order_id` (`virtuemart_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COMMENT='Stores all actions and changes that occur to an order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_order_histories`
--

LOCK TABLES `j_virtuemart_order_histories` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_order_histories` DISABLE KEYS */;
INSERT INTO `j_virtuemart_order_histories` VALUES (1,1,'P',0,'',1,'2017-01-24 18:40:38',833,'2017-01-24 18:40:38',833,'0000-00-00 00:00:00',0),(2,1,'U',1,'',1,'2017-01-24 18:40:38',833,'2017-01-24 18:40:38',833,'0000-00-00 00:00:00',0),(3,2,'P',0,'',1,'2017-01-27 07:26:17',833,'2017-01-27 07:26:17',833,'0000-00-00 00:00:00',0),(4,3,'P',0,'',1,'2017-01-27 07:27:16',833,'2017-01-27 07:27:16',833,'0000-00-00 00:00:00',0),(5,4,'P',0,'',1,'2017-01-27 07:30:21',833,'2017-01-27 07:30:21',833,'0000-00-00 00:00:00',0),(6,5,'P',0,'',1,'2017-01-27 08:14:15',833,'2017-01-27 08:14:15',833,'0000-00-00 00:00:00',0),(7,6,'P',0,'',1,'2017-01-27 08:14:47',833,'2017-01-27 08:14:47',833,'0000-00-00 00:00:00',0),(8,7,'P',0,'',1,'2017-01-27 08:16:27',833,'2017-01-27 08:16:27',833,'0000-00-00 00:00:00',0),(9,8,'P',0,'',1,'2017-01-27 08:25:37',833,'2017-01-27 08:25:37',833,'0000-00-00 00:00:00',0),(10,9,'P',0,'',1,'2017-01-27 08:26:00',833,'2017-01-27 08:26:00',833,'0000-00-00 00:00:00',0),(11,10,'P',0,'',1,'2017-01-27 08:26:06',833,'2017-01-27 08:26:06',833,'0000-00-00 00:00:00',0),(12,11,'P',0,'',1,'2017-01-27 08:27:48',833,'2017-01-27 08:27:48',833,'0000-00-00 00:00:00',0),(13,12,'P',0,'',1,'2017-01-27 08:30:35',833,'2017-01-27 08:30:35',833,'0000-00-00 00:00:00',0),(14,13,'P',0,'',1,'2017-01-27 08:31:07',833,'2017-01-27 08:31:07',833,'0000-00-00 00:00:00',0),(15,14,'P',0,'',1,'2017-01-27 09:53:19',833,'2017-01-27 09:53:19',833,'0000-00-00 00:00:00',0),(16,15,'P',0,'',1,'2017-01-27 09:57:25',833,'2017-01-27 09:57:25',833,'0000-00-00 00:00:00',0),(17,16,'P',0,'',1,'2017-01-27 09:58:06',833,'2017-01-27 09:58:06',833,'0000-00-00 00:00:00',0),(18,17,'P',0,'',1,'2017-01-27 09:58:23',833,'2017-01-27 09:58:23',833,'0000-00-00 00:00:00',0),(19,18,'P',0,'',1,'2017-01-27 10:05:08',833,'2017-01-27 10:05:08',833,'0000-00-00 00:00:00',0),(20,19,'P',0,'',1,'2017-01-27 10:05:25',833,'2017-01-27 10:05:25',833,'0000-00-00 00:00:00',0),(21,20,'P',0,'',1,'2017-01-27 10:06:48',833,'2017-01-27 10:06:48',833,'0000-00-00 00:00:00',0),(22,21,'P',0,'',1,'2017-01-27 10:07:09',833,'2017-01-27 10:07:09',833,'0000-00-00 00:00:00',0),(23,22,'P',0,'',1,'2017-01-27 10:18:37',833,'2017-01-27 10:18:37',833,'0000-00-00 00:00:00',0),(24,23,'P',0,'',1,'2017-01-27 10:20:49',833,'2017-01-27 10:20:49',833,'0000-00-00 00:00:00',0),(25,24,'P',0,'',1,'2017-01-27 10:21:26',833,'2017-01-27 10:21:26',833,'0000-00-00 00:00:00',0),(26,25,'P',0,'',1,'2017-01-27 10:21:41',833,'2017-01-27 10:21:41',833,'0000-00-00 00:00:00',0),(27,26,'P',0,'',1,'2017-01-27 10:21:57',833,'2017-01-27 10:21:57',833,'0000-00-00 00:00:00',0),(28,27,'P',0,'',1,'2017-01-27 10:23:08',833,'2017-01-27 10:23:08',833,'0000-00-00 00:00:00',0),(29,28,'P',0,'',1,'2017-01-27 10:23:27',833,'2017-01-27 10:23:27',833,'0000-00-00 00:00:00',0),(30,29,'P',0,'',1,'2017-01-27 10:26:23',833,'2017-01-27 10:26:23',833,'0000-00-00 00:00:00',0),(31,30,'P',0,'',1,'2017-01-27 10:26:57',833,'2017-01-27 10:26:57',833,'0000-00-00 00:00:00',0),(32,31,'P',0,'',1,'2017-01-27 11:23:20',833,'2017-01-27 11:23:20',833,'0000-00-00 00:00:00',0),(33,32,'P',0,'',1,'2017-01-27 11:23:53',833,'2017-01-27 11:23:53',833,'0000-00-00 00:00:00',0),(34,33,'P',0,'',1,'2017-01-27 11:28:08',833,'2017-01-27 11:28:08',833,'0000-00-00 00:00:00',0),(35,34,'P',0,'',1,'2017-01-27 11:28:38',833,'2017-01-27 11:28:38',833,'0000-00-00 00:00:00',0),(36,35,'P',0,'',1,'2017-01-27 11:29:06',833,'2017-01-27 11:29:06',833,'0000-00-00 00:00:00',0),(37,36,'P',0,'',1,'2017-01-27 11:29:40',833,'2017-01-27 11:29:40',833,'0000-00-00 00:00:00',0),(38,37,'P',0,'',1,'2017-01-27 11:31:08',833,'2017-01-27 11:31:08',833,'0000-00-00 00:00:00',0),(39,38,'P',0,'',1,'2017-01-27 17:13:58',833,'2017-01-27 17:13:58',833,'0000-00-00 00:00:00',0),(40,39,'P',0,'',1,'2017-01-27 17:17:17',833,'2017-01-27 17:17:17',833,'0000-00-00 00:00:00',0),(41,40,'P',0,'',1,'2017-01-27 17:21:51',833,'2017-01-27 17:21:51',833,'0000-00-00 00:00:00',0),(42,41,'P',0,'',1,'2017-01-27 17:22:43',833,'2017-01-27 17:22:43',833,'0000-00-00 00:00:00',0),(43,42,'P',0,'',1,'2017-01-27 17:24:27',833,'2017-01-27 17:24:27',833,'0000-00-00 00:00:00',0),(44,43,'P',0,'',1,'2017-01-27 18:29:17',833,'2017-01-27 18:29:17',833,'0000-00-00 00:00:00',0),(45,44,'P',0,'',1,'2017-01-27 18:29:49',833,'2017-01-27 18:29:49',833,'0000-00-00 00:00:00',0),(46,45,'P',0,'',1,'2017-01-27 18:30:05',833,'2017-01-27 18:30:05',833,'0000-00-00 00:00:00',0),(47,46,'P',0,'',1,'2017-01-27 19:39:50',833,'2017-01-27 19:39:50',833,'0000-00-00 00:00:00',0),(48,47,'P',0,'',1,'2017-01-27 19:40:55',833,'2017-01-27 19:40:55',833,'0000-00-00 00:00:00',0),(49,48,'P',0,'',1,'2017-01-27 19:41:40',833,'2017-01-27 19:41:40',833,'0000-00-00 00:00:00',0),(50,49,'P',0,'',1,'2017-01-27 19:45:05',833,'2017-01-27 19:45:05',833,'0000-00-00 00:00:00',0),(51,50,'P',0,'',1,'2017-01-27 19:47:32',833,'2017-01-27 19:47:32',833,'0000-00-00 00:00:00',0),(52,51,'P',0,'',1,'2017-01-27 19:47:41',833,'2017-01-27 19:47:41',833,'0000-00-00 00:00:00',0),(53,52,'P',0,'',1,'2017-01-27 19:48:51',833,'2017-01-27 19:48:51',833,'0000-00-00 00:00:00',0),(54,53,'P',0,'',1,'2017-01-27 19:59:48',833,'2017-01-27 19:59:48',833,'0000-00-00 00:00:00',0),(55,54,'P',0,'',1,'2017-01-27 20:00:03',833,'2017-01-27 20:00:03',833,'0000-00-00 00:00:00',0),(56,55,'P',0,'',1,'2017-01-27 20:04:50',833,'2017-01-27 20:04:50',833,'0000-00-00 00:00:00',0),(57,56,'P',0,'',1,'2017-01-27 20:14:56',833,'2017-01-27 20:14:56',833,'0000-00-00 00:00:00',0),(58,57,'P',0,'',1,'2017-01-27 20:16:15',833,'2017-01-27 20:16:15',833,'0000-00-00 00:00:00',0),(59,58,'P',0,'',1,'2017-01-28 06:15:09',833,'2017-01-28 06:15:09',833,'0000-00-00 00:00:00',0),(60,59,'P',0,'',1,'2017-01-28 06:35:59',833,'2017-01-28 06:35:59',833,'0000-00-00 00:00:00',0),(61,59,'U',1,'',1,'2017-01-28 06:35:59',833,'2017-01-28 06:35:59',833,'0000-00-00 00:00:00',0),(62,60,'P',0,'',1,'2017-01-28 06:37:04',833,'2017-01-28 06:37:04',833,'0000-00-00 00:00:00',0),(63,61,'P',0,'',1,'2017-01-28 06:38:30',833,'2017-01-28 06:38:30',833,'0000-00-00 00:00:00',0),(64,62,'P',0,'',1,'2017-01-28 06:39:22',833,'2017-01-28 06:39:22',833,'0000-00-00 00:00:00',0),(65,63,'P',0,'',1,'2017-01-28 06:39:52',833,'2017-01-28 06:39:52',833,'0000-00-00 00:00:00',0),(66,64,'P',0,'',1,'2017-01-28 06:40:17',833,'2017-01-28 06:40:17',833,'0000-00-00 00:00:00',0),(67,65,'P',0,'',1,'2017-01-28 06:40:47',833,'2017-01-28 06:40:47',833,'0000-00-00 00:00:00',0),(68,66,'P',0,'',1,'2017-01-28 06:41:13',833,'2017-01-28 06:41:13',833,'0000-00-00 00:00:00',0),(69,67,'P',0,'',1,'2017-01-28 06:41:44',833,'2017-01-28 06:41:44',833,'0000-00-00 00:00:00',0),(70,68,'P',0,'',1,'2017-01-28 06:46:34',833,'2017-01-28 06:46:34',833,'0000-00-00 00:00:00',0),(71,69,'P',0,'',1,'2017-01-28 06:47:17',833,'2017-01-28 06:47:17',833,'0000-00-00 00:00:00',0),(72,70,'P',0,'',1,'2017-01-28 06:47:29',833,'2017-01-28 06:47:29',833,'0000-00-00 00:00:00',0),(73,71,'P',0,'',1,'2017-01-28 08:00:41',833,'2017-01-28 08:00:41',833,'0000-00-00 00:00:00',0),(74,72,'P',0,'',1,'2017-01-28 08:10:39',833,'2017-01-28 08:10:39',833,'0000-00-00 00:00:00',0),(75,73,'P',0,'',1,'2017-01-28 08:15:56',833,'2017-01-28 08:15:56',833,'0000-00-00 00:00:00',0),(76,74,'P',0,'',1,'2017-01-28 08:19:28',833,'2017-01-28 08:19:28',833,'0000-00-00 00:00:00',0),(77,75,'P',0,'',1,'2017-01-28 08:20:52',833,'2017-01-28 08:20:52',833,'0000-00-00 00:00:00',0),(78,76,'P',0,'',1,'2017-01-28 08:22:11',833,'2017-01-28 08:22:11',833,'0000-00-00 00:00:00',0),(79,77,'P',0,'',1,'2017-01-28 08:22:56',833,'2017-01-28 08:22:56',833,'0000-00-00 00:00:00',0),(80,78,'P',0,'',1,'2017-01-28 08:23:25',833,'2017-01-28 08:23:25',833,'0000-00-00 00:00:00',0),(81,79,'P',0,'',1,'2017-01-28 08:26:21',833,'2017-01-28 08:26:21',833,'0000-00-00 00:00:00',0),(82,80,'P',0,'',1,'2017-01-28 08:34:57',833,'2017-01-28 08:34:57',833,'0000-00-00 00:00:00',0),(83,81,'P',0,'',1,'2017-01-28 08:35:22',833,'2017-01-28 08:35:22',833,'0000-00-00 00:00:00',0),(84,82,'P',0,'',1,'2017-01-28 09:00:09',833,'2017-01-28 09:00:09',833,'0000-00-00 00:00:00',0),(85,82,'U',1,'',1,'2017-01-28 09:00:09',833,'2017-01-28 09:00:09',833,'0000-00-00 00:00:00',0),(86,83,'P',0,'',1,'2017-01-28 09:18:14',833,'2017-01-28 09:18:14',833,'0000-00-00 00:00:00',0),(87,83,'U',1,'',1,'2017-01-28 09:18:14',833,'2017-01-28 09:18:14',833,'0000-00-00 00:00:00',0),(88,84,'P',0,'',1,'2017-01-28 12:51:19',833,'2017-01-28 12:51:19',833,'0000-00-00 00:00:00',0),(89,84,'U',1,'',1,'2017-01-28 12:51:19',833,'2017-01-28 12:51:19',833,'0000-00-00 00:00:00',0),(90,85,'P',0,'',1,'2017-01-28 12:57:01',833,'2017-01-28 12:57:01',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_order_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_order_items`
--

DROP TABLE IF EXISTS `j_virtuemart_order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_order_items` (
  `virtuemart_order_item_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(1) unsigned DEFAULT NULL,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1',
  `virtuemart_product_id` int(1) DEFAULT NULL,
  `order_item_sku` varchar(255) NOT NULL DEFAULT '',
  `order_item_name` varchar(4096) NOT NULL DEFAULT '',
  `product_quantity` int(1) DEFAULT NULL,
  `product_item_price` decimal(15,5) DEFAULT NULL,
  `product_priceWithoutTax` decimal(15,5) DEFAULT NULL,
  `product_tax` decimal(15,5) DEFAULT NULL,
  `product_basePriceWithTax` decimal(15,5) DEFAULT NULL,
  `product_discountedPriceWithoutTax` decimal(15,5) DEFAULT NULL,
  `product_final_price` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `product_subtotal_discount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `product_subtotal_with_tax` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `order_item_currency` int(1) DEFAULT NULL,
  `order_status` char(1) DEFAULT NULL,
  `product_attribute` mediumtext,
  `delivery_date` varchar(200) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_order_item_id`),
  KEY `virtuemart_product_id` (`virtuemart_product_id`),
  KEY `virtuemart_order_id` (`virtuemart_order_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `order_status` (`order_status`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COMMENT='Stores all items (products) which are part of an order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_order_items`
--

LOCK TABLES `j_virtuemart_order_items` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_order_items` DISABLE KEYS */;
INSERT INTO `j_virtuemart_order_items` VALUES (1,1,1,162,'TPCM','Cowboy Hat',1,10.00000,10.00000,2.00000,12.00000,10.00000,12.00000,0.00000,12.00000,NULL,'U','{\n    \"11\": {\n        \"452\": false\n    },\n    \"13\": \"457\",\n    \"14\": \"454\"\n}',NULL,'2017-01-24 18:40:38',833,'2017-01-24 18:40:38',833,'0000-00-00 00:00:00',0),(2,2,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 07:26:17',833,'2017-01-27 07:26:17',833,'0000-00-00 00:00:00',0),(3,2,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 07:26:17',833,'2017-01-27 07:26:17',833,'0000-00-00 00:00:00',0),(4,3,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 07:27:16',833,'2017-01-27 07:27:16',833,'0000-00-00 00:00:00',0),(5,3,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 07:27:16',833,'2017-01-27 07:27:16',833,'0000-00-00 00:00:00',0),(6,4,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 07:30:21',833,'2017-01-27 07:30:21',833,'0000-00-00 00:00:00',0),(7,4,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 07:30:21',833,'2017-01-27 07:30:21',833,'0000-00-00 00:00:00',0),(8,5,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 08:14:15',833,'2017-01-27 08:14:15',833,'0000-00-00 00:00:00',0),(9,5,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 08:14:15',833,'2017-01-27 08:14:15',833,'0000-00-00 00:00:00',0),(10,6,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 08:14:47',833,'2017-01-27 08:14:47',833,'0000-00-00 00:00:00',0),(11,6,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 08:14:47',833,'2017-01-27 08:14:47',833,'0000-00-00 00:00:00',0),(12,7,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 08:16:27',833,'2017-01-27 08:16:27',833,'0000-00-00 00:00:00',0),(13,7,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 08:16:27',833,'2017-01-27 08:16:27',833,'0000-00-00 00:00:00',0),(14,8,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 08:25:37',833,'2017-01-27 08:25:37',833,'0000-00-00 00:00:00',0),(15,8,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 08:25:37',833,'2017-01-27 08:25:37',833,'0000-00-00 00:00:00',0),(16,9,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 08:26:00',833,'2017-01-27 08:26:00',833,'0000-00-00 00:00:00',0),(17,9,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 08:26:00',833,'2017-01-27 08:26:00',833,'0000-00-00 00:00:00',0),(18,10,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 08:26:06',833,'2017-01-27 08:26:06',833,'0000-00-00 00:00:00',0),(19,10,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 08:26:06',833,'2017-01-27 08:26:06',833,'0000-00-00 00:00:00',0),(20,11,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 08:27:48',833,'2017-01-27 08:27:48',833,'0000-00-00 00:00:00',0),(21,11,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 08:27:48',833,'2017-01-27 08:27:48',833,'0000-00-00 00:00:00',0),(22,12,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 08:30:35',833,'2017-01-27 08:30:35',833,'0000-00-00 00:00:00',0),(23,12,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 08:30:35',833,'2017-01-27 08:30:35',833,'0000-00-00 00:00:00',0),(24,13,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 08:31:07',833,'2017-01-27 08:31:07',833,'0000-00-00 00:00:00',0),(25,13,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 08:31:07',833,'2017-01-27 08:31:07',833,'0000-00-00 00:00:00',0),(26,14,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 09:53:19',833,'2017-01-27 09:53:19',833,'0000-00-00 00:00:00',0),(27,14,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 09:53:19',833,'2017-01-27 09:53:19',833,'0000-00-00 00:00:00',0),(28,15,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 09:57:25',833,'2017-01-27 09:57:25',833,'0000-00-00 00:00:00',0),(29,15,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 09:57:25',833,'2017-01-27 09:57:25',833,'0000-00-00 00:00:00',0),(30,16,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 09:58:06',833,'2017-01-27 09:58:06',833,'0000-00-00 00:00:00',0),(31,16,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 09:58:06',833,'2017-01-27 09:58:06',833,'0000-00-00 00:00:00',0),(32,17,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 09:58:23',833,'2017-01-27 09:58:23',833,'0000-00-00 00:00:00',0),(33,17,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 09:58:23',833,'2017-01-27 09:58:23',833,'0000-00-00 00:00:00',0),(34,18,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 10:05:08',833,'2017-01-27 10:05:08',833,'0000-00-00 00:00:00',0),(35,18,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 10:05:08',833,'2017-01-27 10:05:08',833,'0000-00-00 00:00:00',0),(36,19,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 10:05:25',833,'2017-01-27 10:05:25',833,'0000-00-00 00:00:00',0),(37,19,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 10:05:25',833,'2017-01-27 10:05:25',833,'0000-00-00 00:00:00',0),(38,20,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 10:06:48',833,'2017-01-27 10:06:48',833,'0000-00-00 00:00:00',0),(39,20,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 10:06:48',833,'2017-01-27 10:06:48',833,'0000-00-00 00:00:00',0),(40,21,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 10:07:09',833,'2017-01-27 10:07:09',833,'0000-00-00 00:00:00',0),(41,21,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 10:07:09',833,'2017-01-27 10:07:09',833,'0000-00-00 00:00:00',0),(42,22,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 10:18:37',833,'2017-01-27 10:18:37',833,'0000-00-00 00:00:00',0),(43,22,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 10:18:37',833,'2017-01-27 10:18:37',833,'0000-00-00 00:00:00',0),(44,23,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 10:20:49',833,'2017-01-27 10:20:49',833,'0000-00-00 00:00:00',0),(45,23,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 10:20:49',833,'2017-01-27 10:20:49',833,'0000-00-00 00:00:00',0),(46,24,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 10:21:26',833,'2017-01-27 10:21:26',833,'0000-00-00 00:00:00',0),(47,24,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 10:21:26',833,'2017-01-27 10:21:26',833,'0000-00-00 00:00:00',0),(48,25,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 10:21:41',833,'2017-01-27 10:21:41',833,'0000-00-00 00:00:00',0),(49,25,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 10:21:41',833,'2017-01-27 10:21:41',833,'0000-00-00 00:00:00',0),(50,26,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 10:21:57',833,'2017-01-27 10:21:57',833,'0000-00-00 00:00:00',0),(51,26,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 10:21:57',833,'2017-01-27 10:21:57',833,'0000-00-00 00:00:00',0),(52,27,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 10:23:08',833,'2017-01-27 10:23:08',833,'0000-00-00 00:00:00',0),(53,27,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 10:23:08',833,'2017-01-27 10:23:08',833,'0000-00-00 00:00:00',0),(54,28,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 10:23:27',833,'2017-01-27 10:23:27',833,'0000-00-00 00:00:00',0),(55,28,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 10:23:27',833,'2017-01-27 10:23:27',833,'0000-00-00 00:00:00',0),(56,29,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 10:26:23',833,'2017-01-27 10:26:23',833,'0000-00-00 00:00:00',0),(57,29,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 10:26:23',833,'2017-01-27 10:26:23',833,'0000-00-00 00:00:00',0),(58,30,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 10:26:57',833,'2017-01-27 10:26:57',833,'0000-00-00 00:00:00',0),(59,30,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 10:26:57',833,'2017-01-27 10:26:57',833,'0000-00-00 00:00:00',0),(60,31,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 11:23:20',833,'2017-01-27 11:23:20',833,'0000-00-00 00:00:00',0),(61,31,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 11:23:20',833,'2017-01-27 11:23:20',833,'0000-00-00 00:00:00',0),(62,32,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 11:23:53',833,'2017-01-27 11:23:53',833,'0000-00-00 00:00:00',0),(63,32,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 11:23:53',833,'2017-01-27 11:23:53',833,'0000-00-00 00:00:00',0),(64,33,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 11:28:08',833,'2017-01-27 11:28:08',833,'0000-00-00 00:00:00',0),(65,33,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 11:28:08',833,'2017-01-27 11:28:08',833,'0000-00-00 00:00:00',0),(66,34,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 11:28:38',833,'2017-01-27 11:28:38',833,'0000-00-00 00:00:00',0),(67,34,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 11:28:38',833,'2017-01-27 11:28:38',833,'0000-00-00 00:00:00',0),(68,35,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 11:29:06',833,'2017-01-27 11:29:06',833,'0000-00-00 00:00:00',0),(69,35,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 11:29:06',833,'2017-01-27 11:29:06',833,'0000-00-00 00:00:00',0),(70,36,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 11:29:40',833,'2017-01-27 11:29:40',833,'0000-00-00 00:00:00',0),(71,36,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 11:29:40',833,'2017-01-27 11:29:40',833,'0000-00-00 00:00:00',0),(72,37,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 11:31:08',833,'2017-01-27 11:31:08',833,'0000-00-00 00:00:00',0),(73,37,1,1211,'','Test product',1,0.00931,0.00931,0.00000,0.00000,0.00931,0.00931,0.00000,0.00931,NULL,'P','[]',NULL,'2017-01-27 11:31:08',833,'2017-01-27 11:31:08',833,'0000-00-00 00:00:00',0),(74,38,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 17:13:58',833,'2017-01-27 17:13:58',833,'0000-00-00 00:00:00',0),(75,38,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 17:13:58',833,'2017-01-27 17:13:58',833,'0000-00-00 00:00:00',0),(76,39,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 17:17:17',833,'2017-01-27 17:17:17',833,'0000-00-00 00:00:00',0),(77,39,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 17:17:17',833,'2017-01-27 17:17:17',833,'0000-00-00 00:00:00',0),(78,40,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 17:21:51',833,'2017-01-27 17:21:51',833,'0000-00-00 00:00:00',0),(79,40,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 17:21:51',833,'2017-01-27 17:21:51',833,'0000-00-00 00:00:00',0),(80,41,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 17:22:43',833,'2017-01-27 17:22:43',833,'0000-00-00 00:00:00',0),(81,41,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 17:22:43',833,'2017-01-27 17:22:43',833,'0000-00-00 00:00:00',0),(82,42,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 17:24:27',833,'2017-01-27 17:24:27',833,'0000-00-00 00:00:00',0),(83,42,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 17:24:27',833,'2017-01-27 17:24:27',833,'0000-00-00 00:00:00',0),(84,43,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 18:29:17',833,'2017-01-27 18:29:17',833,'0000-00-00 00:00:00',0),(85,43,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 18:29:17',833,'2017-01-27 18:29:17',833,'0000-00-00 00:00:00',0),(86,44,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 18:29:49',833,'2017-01-27 18:29:49',833,'0000-00-00 00:00:00',0),(87,44,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 18:29:49',833,'2017-01-27 18:29:49',833,'0000-00-00 00:00:00',0),(88,45,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 18:30:05',833,'2017-01-27 18:30:05',833,'0000-00-00 00:00:00',0),(89,45,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 18:30:05',833,'2017-01-27 18:30:05',833,'0000-00-00 00:00:00',0),(90,46,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 19:39:50',833,'2017-01-27 19:39:50',833,'0000-00-00 00:00:00',0),(91,46,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 19:39:50',833,'2017-01-27 19:39:50',833,'0000-00-00 00:00:00',0),(92,47,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 19:40:55',833,'2017-01-27 19:40:55',833,'0000-00-00 00:00:00',0),(93,47,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 19:40:55',833,'2017-01-27 19:40:55',833,'0000-00-00 00:00:00',0),(94,48,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 19:41:40',833,'2017-01-27 19:41:40',833,'0000-00-00 00:00:00',0),(95,48,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 19:41:40',833,'2017-01-27 19:41:40',833,'0000-00-00 00:00:00',0),(96,49,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 19:45:05',833,'2017-01-27 19:45:05',833,'0000-00-00 00:00:00',0),(97,49,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 19:45:05',833,'2017-01-27 19:45:05',833,'0000-00-00 00:00:00',0),(98,50,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 19:47:32',833,'2017-01-27 19:47:32',833,'0000-00-00 00:00:00',0),(99,50,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 19:47:32',833,'2017-01-27 19:47:32',833,'0000-00-00 00:00:00',0),(100,51,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 19:47:41',833,'2017-01-27 19:47:41',833,'0000-00-00 00:00:00',0),(101,51,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 19:47:41',833,'2017-01-27 19:47:41',833,'0000-00-00 00:00:00',0),(102,52,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 19:48:51',833,'2017-01-27 19:48:51',833,'0000-00-00 00:00:00',0),(103,52,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 19:48:51',833,'2017-01-27 19:48:51',833,'0000-00-00 00:00:00',0),(104,53,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 19:59:48',833,'2017-01-27 19:59:48',833,'0000-00-00 00:00:00',0),(105,53,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 19:59:48',833,'2017-01-27 19:59:48',833,'0000-00-00 00:00:00',0),(106,54,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 20:00:03',833,'2017-01-27 20:00:03',833,'0000-00-00 00:00:00',0),(107,54,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 20:00:03',833,'2017-01-27 20:00:03',833,'0000-00-00 00:00:00',0),(108,55,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 20:04:50',833,'2017-01-27 20:04:50',833,'0000-00-00 00:00:00',0),(109,55,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 20:04:50',833,'2017-01-27 20:04:50',833,'0000-00-00 00:00:00',0),(110,56,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 20:14:56',833,'2017-01-27 20:14:56',833,'0000-00-00 00:00:00',0),(111,56,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 20:14:56',833,'2017-01-27 20:14:56',833,'0000-00-00 00:00:00',0),(112,57,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-27 20:16:15',833,'2017-01-27 20:16:15',833,'0000-00-00 00:00:00',0),(113,57,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-27 20:16:15',833,'2017-01-27 20:16:15',833,'0000-00-00 00:00:00',0),(114,58,1,197,'','',1,NULL,NULL,NULL,NULL,NULL,0.00000,0.00000,0.00000,NULL,'P','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-28 06:15:09',833,'2017-01-28 06:15:09',833,'0000-00-00 00:00:00',0),(115,58,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'P','[]',NULL,'2017-01-28 06:15:09',833,'2017-01-28 06:15:09',833,'0000-00-00 00:00:00',0),(116,59,1,197,'','',1,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,0.00000,NULL,'U','{\n    \"20\": {\n        \"415\": false\n    },\n    \"11\": {\n        \"416\": false\n    },\n    \"12\": {\n        \"417\": false\n    },\n    \"23\": \"460\",\n    \"13\": \"461\"\n}',NULL,'2017-01-28 06:35:59',833,'2017-01-28 06:35:59',833,'0000-00-00 00:00:00',0),(117,59,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'U','[]',NULL,'2017-01-28 06:35:59',833,'2017-01-28 06:35:59',833,'0000-00-00 00:00:00',0),(118,60,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 06:37:04',833,'2017-01-28 06:37:04',833,'0000-00-00 00:00:00',0),(119,61,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 06:38:30',833,'2017-01-28 06:38:30',833,'0000-00-00 00:00:00',0),(120,62,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 06:39:22',833,'2017-01-28 06:39:22',833,'0000-00-00 00:00:00',0),(121,63,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 06:39:52',833,'2017-01-28 06:39:52',833,'0000-00-00 00:00:00',0),(122,64,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 06:40:17',833,'2017-01-28 06:40:17',833,'0000-00-00 00:00:00',0),(123,65,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 06:40:47',833,'2017-01-28 06:40:47',833,'0000-00-00 00:00:00',0),(124,66,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 06:41:13',833,'2017-01-28 06:41:13',833,'0000-00-00 00:00:00',0),(125,67,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 06:41:44',833,'2017-01-28 06:41:44',833,'0000-00-00 00:00:00',0),(126,68,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 06:46:34',833,'2017-01-28 06:46:34',833,'0000-00-00 00:00:00',0),(127,69,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 06:47:17',833,'2017-01-28 06:47:17',833,'0000-00-00 00:00:00',0),(128,70,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 06:47:29',833,'2017-01-28 06:47:29',833,'0000-00-00 00:00:00',0),(129,71,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 08:00:41',833,'2017-01-28 08:00:41',833,'0000-00-00 00:00:00',0),(130,72,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 08:10:39',833,'2017-01-28 08:10:39',833,'0000-00-00 00:00:00',0),(131,73,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 08:15:56',833,'2017-01-28 08:15:56',833,'0000-00-00 00:00:00',0),(132,74,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 08:19:28',833,'2017-01-28 08:19:28',833,'0000-00-00 00:00:00',0),(133,75,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 08:20:52',833,'2017-01-28 08:20:52',833,'0000-00-00 00:00:00',0),(134,76,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 08:22:11',833,'2017-01-28 08:22:11',833,'0000-00-00 00:00:00',0),(135,77,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 08:22:56',833,'2017-01-28 08:22:56',833,'0000-00-00 00:00:00',0),(136,78,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 08:23:25',833,'2017-01-28 08:23:25',833,'0000-00-00 00:00:00',0),(137,79,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 08:26:21',833,'2017-01-28 08:26:21',833,'0000-00-00 00:00:00',0),(138,80,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 08:34:57',833,'2017-01-28 08:34:57',833,'0000-00-00 00:00:00',0),(139,81,1,1211,'','Test product',3,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.02808,NULL,'P','[]',NULL,'2017-01-28 08:35:22',833,'2017-01-28 08:35:22',833,'0000-00-00 00:00:00',0),(140,82,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'U','[]',NULL,'2017-01-28 09:00:09',833,'2017-01-28 09:00:09',833,'0000-00-00 00:00:00',0),(141,83,1,1211,'','Test product',1,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.00936,NULL,'U','[]',NULL,'2017-01-28 09:18:14',833,'2017-01-28 09:18:14',833,'0000-00-00 00:00:00',0),(142,84,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'U','[]',NULL,'2017-01-28 12:51:19',833,'2017-01-28 12:51:19',833,'0000-00-00 00:00:00',0),(143,85,1,1211,'','Test product',2,0.00936,0.00936,0.00000,0.00000,0.00936,0.00936,0.00000,0.01872,NULL,'P','[]',NULL,'2017-01-28 12:57:01',833,'2017-01-28 12:57:01',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_order_userinfos`
--

DROP TABLE IF EXISTS `j_virtuemart_order_userinfos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_order_userinfos` (
  `virtuemart_order_userinfo_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_user_id` int(1) unsigned NOT NULL DEFAULT '0',
  `address_type` char(2) DEFAULT NULL,
  `address_type_name` varchar(32) DEFAULT NULL,
  `company` varchar(64) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `last_name` varchar(96) DEFAULT NULL,
  `first_name` varchar(96) DEFAULT NULL,
  `middle_name` varchar(96) DEFAULT NULL,
  `phone_1` varchar(32) DEFAULT NULL,
  `phone_2` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `address_1` varchar(96) NOT NULL DEFAULT '',
  `address_2` varchar(64) DEFAULT NULL,
  `city` varchar(96) NOT NULL DEFAULT '',
  `virtuemart_state_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_country_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `zip` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(128) DEFAULT NULL,
  `agreed` tinyint(1) NOT NULL DEFAULT '0',
  `tos` tinyint(1) NOT NULL DEFAULT '0',
  `customer_note` varchar(5000) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_order_userinfo_id`),
  KEY `virtuemart_order_id` (`virtuemart_order_id`),
  KEY `virtuemart_user_id` (`virtuemart_user_id`,`address_type`),
  KEY `address_type` (`address_type`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='Stores the BillTo and ShipTo Information at order time';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_order_userinfos`
--

LOCK TABLES `j_virtuemart_order_userinfos` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_order_userinfos` DISABLE KEYS */;
INSERT INTO `j_virtuemart_order_userinfos` VALUES (1,1,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-24 18:40:38',833,'2017-01-24 18:40:38',833,'0000-00-00 00:00:00',0),(2,2,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 07:26:17',833,'2017-01-27 07:26:17',833,'0000-00-00 00:00:00',0),(3,3,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 07:27:16',833,'2017-01-27 07:27:16',833,'0000-00-00 00:00:00',0),(4,4,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 07:30:21',833,'2017-01-27 07:30:21',833,'0000-00-00 00:00:00',0),(5,5,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 08:14:15',833,'2017-01-27 08:14:15',833,'0000-00-00 00:00:00',0),(6,6,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 08:14:47',833,'2017-01-27 08:14:47',833,'0000-00-00 00:00:00',0),(7,7,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 08:16:27',833,'2017-01-27 08:16:27',833,'0000-00-00 00:00:00',0),(8,8,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 08:25:37',833,'2017-01-27 08:25:37',833,'0000-00-00 00:00:00',0),(9,9,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 08:26:00',833,'2017-01-27 08:26:00',833,'0000-00-00 00:00:00',0),(10,10,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 08:26:06',833,'2017-01-27 08:26:06',833,'0000-00-00 00:00:00',0),(11,11,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 08:27:48',833,'2017-01-27 08:27:48',833,'0000-00-00 00:00:00',0),(12,12,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 08:30:35',833,'2017-01-27 08:30:35',833,'0000-00-00 00:00:00',0),(13,13,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 08:31:07',833,'2017-01-27 08:31:07',833,'0000-00-00 00:00:00',0),(14,14,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 09:53:19',833,'2017-01-27 09:53:19',833,'0000-00-00 00:00:00',0),(15,15,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 09:57:25',833,'2017-01-27 09:57:25',833,'0000-00-00 00:00:00',0),(16,16,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 09:58:06',833,'2017-01-27 09:58:06',833,'0000-00-00 00:00:00',0),(17,17,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 09:58:23',833,'2017-01-27 09:58:23',833,'0000-00-00 00:00:00',0),(18,18,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 10:05:08',833,'2017-01-27 10:05:08',833,'0000-00-00 00:00:00',0),(19,19,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 10:05:25',833,'2017-01-27 10:05:25',833,'0000-00-00 00:00:00',0),(20,20,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 10:06:48',833,'2017-01-27 10:06:48',833,'0000-00-00 00:00:00',0),(21,21,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 10:07:09',833,'2017-01-27 10:07:09',833,'0000-00-00 00:00:00',0),(22,22,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 10:18:37',833,'2017-01-27 10:18:37',833,'0000-00-00 00:00:00',0),(23,23,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 10:20:49',833,'2017-01-27 10:20:49',833,'0000-00-00 00:00:00',0),(24,24,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 10:21:26',833,'2017-01-27 10:21:26',833,'0000-00-00 00:00:00',0),(25,25,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 10:21:41',833,'2017-01-27 10:21:41',833,'0000-00-00 00:00:00',0),(26,26,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 10:21:57',833,'2017-01-27 10:21:57',833,'0000-00-00 00:00:00',0),(27,27,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 10:23:08',833,'2017-01-27 10:23:08',833,'0000-00-00 00:00:00',0),(28,28,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 10:23:27',833,'2017-01-27 10:23:27',833,'0000-00-00 00:00:00',0),(29,29,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 10:26:23',833,'2017-01-27 10:26:23',833,'0000-00-00 00:00:00',0),(30,30,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 10:26:57',833,'2017-01-27 10:26:57',833,'0000-00-00 00:00:00',0),(31,31,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 11:23:20',833,'2017-01-27 11:23:20',833,'0000-00-00 00:00:00',0),(32,32,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 11:23:53',833,'2017-01-27 11:23:53',833,'0000-00-00 00:00:00',0),(33,33,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 11:28:08',833,'2017-01-27 11:28:08',833,'0000-00-00 00:00:00',0),(34,34,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 11:28:38',833,'2017-01-27 11:28:38',833,'0000-00-00 00:00:00',0),(35,35,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 11:29:06',833,'2017-01-27 11:29:06',833,'0000-00-00 00:00:00',0),(36,36,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 11:29:40',833,'2017-01-27 11:29:40',833,'0000-00-00 00:00:00',0),(37,37,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 11:31:08',833,'2017-01-27 11:31:08',833,'0000-00-00 00:00:00',0),(38,38,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 17:13:58',833,'2017-01-27 17:13:58',833,'0000-00-00 00:00:00',0),(39,39,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 17:17:17',833,'2017-01-27 17:17:17',833,'0000-00-00 00:00:00',0),(40,40,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 17:21:51',833,'2017-01-27 17:21:51',833,'0000-00-00 00:00:00',0),(41,41,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 17:22:43',833,'2017-01-27 17:22:43',833,'0000-00-00 00:00:00',0),(42,42,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 17:24:27',833,'2017-01-27 17:24:27',833,'0000-00-00 00:00:00',0),(43,43,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 18:29:17',833,'2017-01-27 18:29:17',833,'0000-00-00 00:00:00',0),(44,44,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 18:29:49',833,'2017-01-27 18:29:49',833,'0000-00-00 00:00:00',0),(45,45,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 18:30:05',833,'2017-01-27 18:30:05',833,'0000-00-00 00:00:00',0),(46,46,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 19:39:50',833,'2017-01-27 19:39:50',833,'0000-00-00 00:00:00',0),(47,47,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 19:40:55',833,'2017-01-27 19:40:55',833,'0000-00-00 00:00:00',0),(48,48,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 19:41:40',833,'2017-01-27 19:41:40',833,'0000-00-00 00:00:00',0),(49,49,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 19:45:05',833,'2017-01-27 19:45:05',833,'0000-00-00 00:00:00',0),(50,50,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 19:47:32',833,'2017-01-27 19:47:32',833,'0000-00-00 00:00:00',0),(51,51,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 19:47:41',833,'2017-01-27 19:47:41',833,'0000-00-00 00:00:00',0),(52,52,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 19:48:51',833,'2017-01-27 19:48:51',833,'0000-00-00 00:00:00',0),(53,53,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 19:59:48',833,'2017-01-27 19:59:48',833,'0000-00-00 00:00:00',0),(54,54,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 20:00:03',833,'2017-01-27 20:00:03',833,'0000-00-00 00:00:00',0),(55,55,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 20:04:50',833,'2017-01-27 20:04:50',833,'0000-00-00 00:00:00',0),(56,56,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 20:14:56',833,'2017-01-27 20:14:56',833,'0000-00-00 00:00:00',0),(57,57,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-27 20:16:15',833,'2017-01-27 20:16:15',833,'0000-00-00 00:00:00',0),(58,58,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 06:15:09',833,'2017-01-28 06:15:09',833,'0000-00-00 00:00:00',0),(59,59,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 06:35:59',833,'2017-01-28 06:35:59',833,'0000-00-00 00:00:00',0),(60,60,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 06:37:04',833,'2017-01-28 06:37:04',833,'0000-00-00 00:00:00',0),(61,61,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 06:38:30',833,'2017-01-28 06:38:30',833,'0000-00-00 00:00:00',0),(62,62,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 06:39:22',833,'2017-01-28 06:39:22',833,'0000-00-00 00:00:00',0),(63,63,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 06:39:52',833,'2017-01-28 06:39:52',833,'0000-00-00 00:00:00',0),(64,64,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 06:40:17',833,'2017-01-28 06:40:17',833,'0000-00-00 00:00:00',0),(65,65,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 06:40:47',833,'2017-01-28 06:40:47',833,'0000-00-00 00:00:00',0),(66,66,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 06:41:13',833,'2017-01-28 06:41:13',833,'0000-00-00 00:00:00',0),(67,67,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 06:41:44',833,'2017-01-28 06:41:44',833,'0000-00-00 00:00:00',0),(68,68,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 06:46:34',833,'2017-01-28 06:46:34',833,'0000-00-00 00:00:00',0),(69,69,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 06:47:17',833,'2017-01-28 06:47:17',833,'0000-00-00 00:00:00',0),(70,70,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 06:47:29',833,'2017-01-28 06:47:29',833,'0000-00-00 00:00:00',0),(71,71,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 08:00:41',833,'2017-01-28 08:00:41',833,'0000-00-00 00:00:00',0),(72,72,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 08:10:39',833,'2017-01-28 08:10:39',833,'0000-00-00 00:00:00',0),(73,73,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 08:15:56',833,'2017-01-28 08:15:56',833,'0000-00-00 00:00:00',0),(74,74,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 08:19:28',833,'2017-01-28 08:19:28',833,'0000-00-00 00:00:00',0),(75,75,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 08:20:52',833,'2017-01-28 08:20:52',833,'0000-00-00 00:00:00',0),(76,76,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 08:22:11',833,'2017-01-28 08:22:11',833,'0000-00-00 00:00:00',0),(77,77,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 08:22:56',833,'2017-01-28 08:22:56',833,'0000-00-00 00:00:00',0),(78,78,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 08:23:25',833,'2017-01-28 08:23:25',833,'0000-00-00 00:00:00',0),(79,79,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 08:26:21',833,'2017-01-28 08:26:21',833,'0000-00-00 00:00:00',0),(80,80,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 08:34:57',833,'2017-01-28 08:34:57',833,'0000-00-00 00:00:00',0),(81,81,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 08:35:22',833,'2017-01-28 08:35:22',833,'0000-00-00 00:00:00',0),(82,82,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 09:00:09',833,'2017-01-28 09:00:09',833,'0000-00-00 00:00:00',0),(83,83,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 09:18:14',833,'2017-01-28 09:18:14',833,'0000-00-00 00:00:00',0),(84,84,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 12:51:19',833,'2017-01-28 12:51:19',833,'0000-00-00 00:00:00',0),(85,85,833,'BT',NULL,NULL,NULL,NULL,'Doe',NULL,NULL,NULL,NULL,'PO Box 123',NULL,'',0,0,'','alx.polyakov@gmail.com',0,0,'','2017-01-28 12:57:01',833,'2017-01-28 12:57:01',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_order_userinfos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_orders`
--

DROP TABLE IF EXISTS `j_virtuemart_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_orders` (
  `virtuemart_order_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_user_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '0',
  `order_number` varchar(64) DEFAULT NULL,
  `customer_number` varchar(32) DEFAULT NULL,
  `order_pass` varchar(34) DEFAULT NULL,
  `order_create_invoice_pass` varchar(32) DEFAULT NULL,
  `order_total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `order_salesPrice` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `order_billTaxAmount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `order_billTax` varchar(400) DEFAULT NULL,
  `order_billDiscountAmount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `order_discountAmount` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `order_subtotal` decimal(15,5) DEFAULT NULL,
  `order_tax` decimal(10,5) DEFAULT NULL,
  `order_shipment` decimal(10,5) DEFAULT NULL,
  `order_shipment_tax` decimal(10,5) DEFAULT NULL,
  `order_payment` decimal(10,2) DEFAULT NULL,
  `order_payment_tax` decimal(10,5) DEFAULT NULL,
  `coupon_discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(32) DEFAULT NULL,
  `order_discount` decimal(12,2) NOT NULL DEFAULT '0.00',
  `order_currency` smallint(1) DEFAULT NULL,
  `order_status` char(1) DEFAULT NULL,
  `user_currency_id` smallint(1) DEFAULT NULL,
  `user_currency_rate` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `payment_currency_id` smallint(1) DEFAULT NULL,
  `payment_currency_rate` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `virtuemart_paymentmethod_id` int(1) unsigned DEFAULT NULL,
  `virtuemart_shipmentmethod_id` int(1) unsigned DEFAULT NULL,
  `delivery_date` varchar(200) DEFAULT NULL,
  `order_language` varchar(7) DEFAULT NULL,
  `ip_address` char(15) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_order_id`),
  KEY `virtuemart_user_id` (`virtuemart_user_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `order_number` (`order_number`),
  KEY `virtuemart_paymentmethod_id` (`virtuemart_paymentmethod_id`),
  KEY `virtuemart_shipmentmethod_id` (`virtuemart_shipmentmethod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='Used to store all orders';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_orders`
--

LOCK TABLES `j_virtuemart_orders` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_orders` DISABLE KEYS */;
INSERT INTO `j_virtuemart_orders` VALUES (1,833,1,'2HJQ03','AL2db814a','p_ywrpZgju','hZQsRBX3',15.38372,12.00000,2.56395,'{\"1\":{\"virtuemart_calc_id\":1,\"calc_name\":\"Tax 20%\",\"calc_value\":\"20.0000\",\"result\":2.5639533}}',0.00000,0.00000,10.00000,2.00000,2.49000,0.49800,0.33,0.06595,0.00,NULL,0.00,47,'U',47,1.00000,47,1.00000,1,1,'Same as invoice date','en-GB','xx','2017-01-24 18:40:38',833,'2017-01-24 18:40:38',833,'0000-00-00 00:00:00',0),(2,833,1,'NFVG04','AL2db814a','p_MLNFts9P','5Vdz8i5c',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 07:26:17',833,'2017-01-27 07:26:17',833,'0000-00-00 00:00:00',0),(3,833,1,'HW7L05','AL2db814a','p_tVrNMxUw','hQZIJXTN',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 07:27:16',833,'2017-01-27 07:27:16',833,'0000-00-00 00:00:00',0),(4,833,1,'8H3V06','AL2db814a','p_hywbU9NK','34ezvy3D',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 07:30:21',833,'2017-01-27 07:30:21',833,'0000-00-00 00:00:00',0),(5,833,1,'56DU07','AL2db814a','p_BjRJH9oX','JXoFGJYA',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 08:14:15',833,'2017-01-27 08:14:15',833,'0000-00-00 00:00:00',0),(6,833,1,'WJRI08','AL2db814a','p_mPQYSUcz','cUg7p99T',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 08:14:47',833,'2017-01-27 08:14:47',833,'0000-00-00 00:00:00',0),(7,833,1,'T29409','AL2db814a','p_PvSGWoK6','hqiv2Ne2',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 08:16:27',833,'2017-01-27 08:16:27',833,'0000-00-00 00:00:00',0),(8,833,1,'HE77010','AL2db814a','p_4Wc92xzx','k4MDIYBM',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 08:25:37',833,'2017-01-27 08:25:37',833,'0000-00-00 00:00:00',0),(9,833,1,'8XQG011','AL2db814a','p_qzDGsoao','hHxz32j2',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 08:26:00',833,'2017-01-27 08:26:00',833,'0000-00-00 00:00:00',0),(10,833,1,'23B8012','AL2db814a','p_3keyfJQM','7qfS2ePM',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 08:26:06',833,'2017-01-27 08:26:06',833,'0000-00-00 00:00:00',0),(11,833,1,'XS46013','AL2db814a','p_fYh6CMH2','AHFSp3NF',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 08:27:48',833,'2017-01-27 08:27:48',833,'0000-00-00 00:00:00',0),(12,833,1,'72BD014','AL2db814a','p_6qhfwHTU','5n11P0bg',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 08:30:35',833,'2017-01-27 08:30:35',833,'0000-00-00 00:00:00',0),(13,833,1,'R8XM015','AL2db814a','p_tL7iRhBm','vLZUtWRk',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 08:31:07',833,'2017-01-27 08:31:07',833,'0000-00-00 00:00:00',0),(14,833,1,'PQ9K016','AL2db814a','p_5ePVzLhs','0E6s66aN',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 09:53:19',833,'2017-01-27 09:53:19',833,'0000-00-00 00:00:00',0),(15,833,1,'X8UK017','AL2db814a','p_ZDkVpvLZ','0FHs3qQ2',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 09:57:25',833,'2017-01-27 09:57:25',833,'0000-00-00 00:00:00',0),(16,833,1,'7PI7018','AL2db814a','p_oYLbTarB','JidPCLsq',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 09:58:06',833,'2017-01-27 09:58:06',833,'0000-00-00 00:00:00',0),(17,833,1,'9LDV019','AL2db814a','p_cvviJq7e','v5rmwG3t',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 09:58:23',833,'2017-01-27 09:58:23',833,'0000-00-00 00:00:00',0),(18,833,1,'Q7YG020','AL2db814a','p_Se59dxb5','s4E7BrNg',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 10:05:08',833,'2017-01-27 10:05:08',833,'0000-00-00 00:00:00',0),(19,833,1,'1MLJ021','AL2db814a','p_fgmZr6bS','2d0Cx9wi',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 10:05:25',833,'2017-01-27 10:05:25',833,'0000-00-00 00:00:00',0),(20,833,1,'P2UN022','AL2db814a','p_T58yVk98','sO5MCrye',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 10:06:48',833,'2017-01-27 10:06:48',833,'0000-00-00 00:00:00',0),(21,833,1,'56Q2023','AL2db814a','p_2suQxyxr','vVxAzH6U',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 10:07:09',833,'2017-01-27 10:07:09',833,'0000-00-00 00:00:00',0),(22,833,1,'RE34024','AL2db814a','p_JAwGetyJ','i7gY0jn3',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 10:18:37',833,'2017-01-27 10:18:37',833,'0000-00-00 00:00:00',0),(23,833,1,'3EF5025','AL2db814a','p_MDpswz6u','x382dVgu',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 10:20:49',833,'2017-01-27 10:20:49',833,'0000-00-00 00:00:00',0),(24,833,1,'JSV1026','AL2db814a','p_5hRrCv4a','0MCXHF7x',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 10:21:26',833,'2017-01-27 10:21:26',833,'0000-00-00 00:00:00',0),(25,833,1,'USQD027','AL2db814a','p_GVVHJ8UE','5K28UD0B',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 10:21:41',833,'2017-01-27 10:21:41',833,'0000-00-00 00:00:00',0),(26,833,1,'IHUF028','AL2db814a','p_2KdpyzMJ','2Tfnw410',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 10:21:57',833,'2017-01-27 10:21:57',833,'0000-00-00 00:00:00',0),(27,833,1,'LRS2029','AL2db814a','p_rFGpe1cs','L0xsMCpa',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 10:23:08',833,'2017-01-27 10:23:08',833,'0000-00-00 00:00:00',0),(28,833,1,'25JT030','AL2db814a','p_Sx67DNSw','GFTAdQFZ',2.49931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,2.49000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 10:23:27',833,'2017-01-27 10:23:27',833,'0000-00-00 00:00:00',0),(29,833,1,'48BW031','AL2db814a','p_tGE1h1B5','3vjANcXU',0.00931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 10:26:23',833,'2017-01-27 10:26:23',833,'0000-00-00 00:00:00',0),(30,833,1,'81RC032','AL2db814a','p_DeY7R4hL','96rhW9QU',0.00931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 10:26:57',833,'2017-01-27 10:26:57',833,'0000-00-00 00:00:00',0),(31,833,1,'68DQ033','AL2db814a','p_Zo9xVp8s','6HcFcQ5A',0.00931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 11:23:20',833,'2017-01-27 11:23:20',833,'0000-00-00 00:00:00',0),(32,833,1,'RU9U034','AL2db814a','p_cdzdnmY3','IpgGbgPh',0.00931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 11:23:53',833,'2017-01-27 11:23:53',833,'0000-00-00 00:00:00',0),(33,833,1,'2VSG035','AL2db814a','p_qSPffKK3','8oGh3C2Z',0.00931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 11:28:08',833,'2017-01-27 11:28:08',833,'0000-00-00 00:00:00',0),(34,833,1,'2AHK036','AL2db814a','p_AjDJdBjc','lSkbTjTK',0.00931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 11:28:38',833,'2017-01-27 11:28:38',833,'0000-00-00 00:00:00',0),(35,833,1,'8Y2B037','AL2db814a','p_2zDSaD9d','14ZUACa4',0.00931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 11:29:06',833,'2017-01-27 11:29:06',833,'0000-00-00 00:00:00',0),(36,833,1,'FML5038','AL2db814a','p_dhkaSboW','chs9QyrD',0.00931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 11:29:40',833,'2017-01-27 11:29:40',833,'0000-00-00 00:00:00',0),(37,833,1,'YK57039','AL2db814a','p_yhzMs9k1','skRnYfgc',0.00931,0.00931,0.00000,'0',0.00000,0.00000,0.00931,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 11:31:08',833,'2017-01-27 11:31:08',833,'0000-00-00 00:00:00',0),(38,833,1,'Y23M040','AL2db814a','p_mLggxhwn','X3IEXZ0U',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 17:13:58',833,'2017-01-27 17:13:58',833,'0000-00-00 00:00:00',0),(39,833,1,'NTBB041','AL2db814a','p_ngADjUSo','bW2YCJ6O',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 17:17:17',833,'2017-01-27 17:17:17',833,'0000-00-00 00:00:00',0),(40,833,1,'SNL3042','AL2db814a','p_6KfJrr7D','JKpoctGe',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 17:21:51',833,'2017-01-27 17:21:51',833,'0000-00-00 00:00:00',0),(41,833,1,'E5Z7043','AL2db814a','p_514WZPkk','CvfMOMpG',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 17:22:43',833,'2017-01-27 17:22:43',833,'0000-00-00 00:00:00',0),(42,833,1,'QFN9044','AL2db814a','p_VmcTDsRY','LW0J52NX',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 17:24:27',833,'2017-01-27 17:24:27',833,'0000-00-00 00:00:00',0),(43,833,1,'9DM1045','AL2db814a','p_G9ZL5MED','PAqf0oJM',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 18:29:17',833,'2017-01-27 18:29:17',833,'0000-00-00 00:00:00',0),(44,833,1,'A9WN046','AL2db814a','p_VXfvLaot','CRm4qrel',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 18:29:49',833,'2017-01-27 18:29:49',833,'0000-00-00 00:00:00',0),(45,833,1,'WTQU047','AL2db814a','p_hLsCVRTg','W4e7X3AB',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 18:30:05',833,'2017-01-27 18:30:05',833,'0000-00-00 00:00:00',0),(46,833,1,'4DET048','AL2db814a','p_6EWnKhnv','XorD9r5g',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 19:39:50',833,'2017-01-27 19:39:50',833,'0000-00-00 00:00:00',0),(47,833,1,'V9T1049','AL2db814a','p_JKRiFU9H','cRfqUcrb',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 19:40:55',833,'2017-01-27 19:40:55',833,'0000-00-00 00:00:00',0),(48,833,1,'RX6W050','AL2db814a','p_7JvkUcZA','FByQcdoe',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 19:41:40',833,'2017-01-27 19:41:40',833,'0000-00-00 00:00:00',0),(49,833,1,'YWMH051','AL2db814a','p_bUygdWve','TQolUJ39',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 19:45:05',833,'2017-01-27 19:45:05',833,'0000-00-00 00:00:00',0),(50,833,1,'UZLC052','AL2db814a','p_LtB2nwku','kpntcZmM',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 19:47:32',833,'2017-01-27 19:47:32',833,'0000-00-00 00:00:00',0),(51,833,1,'QKHH053','AL2db814a','p_oJc7FCgn','DCLQaoRC',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 19:47:41',833,'2017-01-27 19:47:41',833,'0000-00-00 00:00:00',0),(52,833,1,'ZNV7054','AL2db814a','p_KgLFKUZf','ta5ACcl3',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 19:48:51',833,'2017-01-27 19:48:51',833,'0000-00-00 00:00:00',0),(53,833,1,'HWC4055','AL2db814a','p_fiGkNA2M','EhfZDtkO',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 19:59:48',833,'2017-01-27 19:59:48',833,'0000-00-00 00:00:00',0),(54,833,1,'NWN4056','AL2db814a','p_cRooaZUU','IXfJPJ62',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 20:00:03',833,'2017-01-27 20:00:03',833,'0000-00-00 00:00:00',0),(55,833,1,'FYXX057','AL2db814a','p_UZrdgc9C','Va2ZpGRg',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 20:04:50',833,'2017-01-27 20:04:50',833,'0000-00-00 00:00:00',0),(56,833,1,'2ZS5058','AL2db814a','p_XXro2U4V','o7z0iNfx',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 20:14:56',833,'2017-01-27 20:14:56',833,'0000-00-00 00:00:00',0),(57,833,1,'9GYZ059','AL2db814a','p_hpuR436t','vVd98Aye',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-27 20:16:15',833,'2017-01-27 20:16:15',833,'0000-00-00 00:00:00',0),(58,833,1,'Q8P1060','AL2db814a','p_uZ3UXpTj','59QPwsWH',0.00936,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 06:15:09',833,'2017-01-28 06:15:09',833,'0000-00-00 00:00:00',0),(59,833,1,'2PIL061','AL2db814a','p_mA1A9ogu','LRVCNdm3',0.11103,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.10,0.00000,0.00,NULL,0.00,47,'U',47,1.00000,47,1.00000,1,1,'Same as invoice date','en-GB','xx','2017-01-28 06:35:59',833,'2017-01-28 06:35:59',833,'0000-00-00 00:00:00',0),(60,833,1,'QD5X062','AL2db814a','p_tt2CkVvm','zypdpTP2',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 06:37:04',833,'2017-01-28 06:37:04',833,'0000-00-00 00:00:00',0),(61,833,1,'BD69063','AL2db814a','p_TptSJyq5','tN75NmzI',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 06:38:30',833,'2017-01-28 06:38:30',833,'0000-00-00 00:00:00',0),(62,833,1,'XS4J064','AL2db814a','p_iXQ4z2dQ','6nAeuVc4',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 06:39:22',833,'2017-01-28 06:39:22',833,'0000-00-00 00:00:00',0),(63,833,1,'BXNR065','AL2db814a','p_fj29jzkS','Q0lFsVeX',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 06:39:52',833,'2017-01-28 06:39:52',833,'0000-00-00 00:00:00',0),(64,833,1,'YTZZ066','AL2db814a','p_ivsJdGUD','2d8Yg2bt',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 06:40:17',833,'2017-01-28 06:40:17',833,'0000-00-00 00:00:00',0),(65,833,1,'7GPW067','AL2db814a','p_n8pbwroF','f07XjKRj',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 06:40:47',833,'2017-01-28 06:40:47',833,'0000-00-00 00:00:00',0),(66,833,1,'E7IF068','AL2db814a','p_4chPHCzL','e7FRMJpa',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 06:41:13',833,'2017-01-28 06:41:13',833,'0000-00-00 00:00:00',0),(67,833,1,'JLBP069','AL2db814a','p_QVCJN2M3','ZPtSm48V',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 06:41:44',833,'2017-01-28 06:41:44',833,'0000-00-00 00:00:00',0),(68,833,1,'Y5BE070','AL2db814a','p_jpsGfNeR','jBqdxhKv',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 06:46:34',833,'2017-01-28 06:46:34',833,'0000-00-00 00:00:00',0),(69,833,1,'4S9E071','AL2db814a','p_pnDw2yy7','dTqhI4pD',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 06:47:17',833,'2017-01-28 06:47:17',833,'0000-00-00 00:00:00',0),(70,833,1,'2DES072','AL2db814a','p_2Hk4Zmab','EkdxexFd',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 06:47:29',833,'2017-01-28 06:47:29',833,'0000-00-00 00:00:00',0),(71,833,1,'5SQ9073','AL2db814a','p_cSuaMcxD','Qt3gjReO',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 08:00:41',833,'2017-01-28 08:00:41',833,'0000-00-00 00:00:00',0),(72,833,1,'SZEM074','AL2db814a','p_jFQrYEhE','XdvNYx7f',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 08:10:39',833,'2017-01-28 08:10:39',833,'0000-00-00 00:00:00',0),(73,833,1,'62PY075','AL2db814a','p_GFRPcgLU','I9G9zeBB',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 08:15:56',833,'2017-01-28 08:15:56',833,'0000-00-00 00:00:00',0),(74,833,1,'U1E7076','AL2db814a','p_yGa48Mxs','rjXGkIHq',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 08:19:28',833,'2017-01-28 08:19:28',833,'0000-00-00 00:00:00',0),(75,833,1,'3B4H077','AL2db814a','p_34szykTL','7AGHpqls',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 08:20:52',833,'2017-01-28 08:20:52',833,'0000-00-00 00:00:00',0),(76,833,1,'MDPW078','AL2db814a','p_nXKNyb9X','wd2Sfksi',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 08:22:11',833,'2017-01-28 08:22:11',833,'0000-00-00 00:00:00',0),(77,833,1,'V8BH079','AL2db814a','p_VxxNLSvK','XlvA7Z1I',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 08:22:56',833,'2017-01-28 08:22:56',833,'0000-00-00 00:00:00',0),(78,833,1,'GY3N080','AL2db814a','p_CzEjtyhk','ePgBdZv4',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 08:23:25',833,'2017-01-28 08:23:25',833,'0000-00-00 00:00:00',0),(79,833,1,'WPYT081','AL2db814a','p_dn563tYw','pIfD6PWT',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 08:26:21',833,'2017-01-28 08:26:21',833,'0000-00-00 00:00:00',0),(80,833,1,'25LS082','AL2db814a','p_5gURA9R3','YIjI1xQF',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 08:34:57',833,'2017-01-28 08:34:57',833,'0000-00-00 00:00:00',0),(81,833,1,'4CM1083','AL2db814a','p_1bHmx9vX','sLXg8pJP',0.02808,0.02808,0.00000,'0',0.00000,0.00000,0.02808,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 08:35:22',833,'2017-01-28 08:35:22',833,'0000-00-00 00:00:00',0),(82,833,1,'8DAD084','AL2db814a','p_A3LsmthQ','JA1h6OBC',0.11103,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.10,0.00000,0.00,NULL,0.00,47,'U',47,1.00000,47,1.00000,1,1,'Same as invoice date','en-GB','xx','2017-01-28 09:00:09',833,'2017-01-28 09:00:09',833,'0000-00-00 00:00:00',0),(83,833,1,'M2VH085','AL2db814a','p_m1ediWXY','8IHZpX98',0.11103,0.00936,0.00000,'0',0.00000,0.00000,0.00936,0.00000,0.00000,0.00000,0.10,0.00000,0.00,NULL,0.00,47,'U',47,1.00000,47,1.00000,1,1,'Same as invoice date','en-GB','xx','2017-01-28 09:18:14',833,'2017-01-28 09:18:14',833,'0000-00-00 00:00:00',0),(84,833,1,'GUEE086','AL2db814a','p_UyphbzhA','AjeBgvNh',0.12053,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.10,0.00000,0.00,NULL,0.00,47,'U',47,1.00000,47,1.00000,3,1,'Same as invoice date','en-GB','xx','2017-01-28 12:51:19',833,'2017-01-28 12:51:19',833,'0000-00-00 00:00:00',0),(85,833,1,'SVQG087','AL2db814a','p_faRx1pAN','7DFWOR0r',0.01872,0.01872,0.00000,'0',0.00000,0.00000,0.01872,0.00000,0.00000,0.00000,0.00,0.00000,0.00,NULL,0.00,47,'P',47,1.00000,47,1.00000,3,1,NULL,'en-GB','xx','2017-01-28 12:57:01',833,'2017-01-28 12:57:01',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_orderstates`
--

DROP TABLE IF EXISTS `j_virtuemart_orderstates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_orderstates` (
  `virtuemart_orderstate_id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1',
  `order_status_code` char(1) NOT NULL DEFAULT '',
  `order_status_name` varchar(64) DEFAULT NULL,
  `order_status_description` varchar(20000) DEFAULT NULL,
  `order_stock_handle` char(1) NOT NULL DEFAULT 'A',
  `ordering` int(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_orderstate_id`),
  KEY `ordering` (`ordering`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='All available order statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_orderstates`
--

LOCK TABLES `j_virtuemart_orderstates` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_orderstates` DISABLE KEYS */;
INSERT INTO `j_virtuemart_orderstates` VALUES (1,1,'P','COM_VIRTUEMART_ORDER_STATUS_PENDING','','R',1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(2,1,'U','COM_VIRTUEMART_ORDER_STATUS_CONFIRMED_BY_SHOPPER','','R',2,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(3,1,'C','COM_VIRTUEMART_ORDER_STATUS_CONFIRMED','','R',3,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(4,1,'X','COM_VIRTUEMART_ORDER_STATUS_CANCELLED','','A',4,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(5,1,'R','COM_VIRTUEMART_ORDER_STATUS_REFUNDED','','A',5,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(6,1,'S','COM_VIRTUEMART_ORDER_STATUS_SHIPPED','','O',6,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(7,1,'F','COM_VIRTUEMART_ORDER_STATUS_COMPLETED','','R',7,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(8,1,'D','COM_VIRTUEMART_ORDER_STATUS_DENIED','','A',8,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_orderstates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_payment_plg_cryptocoin`
--

DROP TABLE IF EXISTS `j_virtuemart_payment_plg_cryptocoin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_payment_plg_cryptocoin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `box_id` int(11) unsigned NOT NULL DEFAULT '0',
  `box_type` enum('paymentbox','captchabox') NOT NULL,
  `virtuemart_order_id` int(1) unsigned DEFAULT NULL,
  `order_number` char(64) DEFAULT NULL,
  `payment_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `country_code` varchar(3) NOT NULL DEFAULT '',
  `payment_currency` tinyint(4) DEFAULT NULL,
  `coin_label` varchar(6) NOT NULL DEFAULT '',
  `amount` double(20,8) NOT NULL DEFAULT '0.00000000',
  `amount_usd` double(20,8) NOT NULL DEFAULT '0.00000000',
  `unrecognised` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addr` varchar(34) NOT NULL DEFAULT '',
  `tx_id` char(64) NOT NULL DEFAULT '',
  `tx_date` datetime DEFAULT NULL,
  `tx_confirmed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `tx_check_date` datetime DEFAULT NULL,
  `processed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `processed_date` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `cost_per_transaction` decimal(10,2) DEFAULT NULL,
  `cost_percent_total` decimal(10,2) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_payment_plg_cryptocoin`
--

LOCK TABLES `j_virtuemart_payment_plg_cryptocoin` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_payment_plg_cryptocoin` DISABLE KEYS */;
INSERT INTO `j_virtuemart_payment_plg_cryptocoin` VALUES (1,0,'',84,'GUEE086','Cash on delivery',833,'0',0,'',0.00000000,0.00000000,0,'0','0','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0.00,0.00,'2017-01-28 12:51:19',833,'2017-01-28 12:51:19',833,'0000-00-00 00:00:00',0),(2,0,'',85,'SVQG087','Coins test box',833,'0',0,'DOGE',0.00000000,0.02000000,0,'0','0','0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00','0000-00-00 00:00:00',0.00,0.00,'2017-01-28 12:57:01',833,'2017-01-28 12:57:01',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_payment_plg_cryptocoin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_payment_plg_paypal`
--

DROP TABLE IF EXISTS `j_virtuemart_payment_plg_paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_payment_plg_paypal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(1) unsigned DEFAULT NULL,
  `order_number` char(64) DEFAULT NULL,
  `virtuemart_paymentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `payment_name` varchar(5000) DEFAULT NULL,
  `payment_order_total` decimal(15,5) NOT NULL,
  `payment_currency` smallint(1) DEFAULT NULL,
  `email_currency` smallint(1) DEFAULT NULL,
  `cost_per_transaction` decimal(10,2) DEFAULT NULL,
  `cost_percent_total` decimal(10,2) DEFAULT NULL,
  `tax_id` smallint(1) DEFAULT NULL,
  `paypal_custom` varchar(255) DEFAULT NULL,
  `paypal_method` varchar(200) DEFAULT NULL,
  `paypal_response_mc_gross` decimal(10,2) DEFAULT NULL,
  `paypal_response_mc_currency` char(10) DEFAULT NULL,
  `paypal_response_invoice` char(32) DEFAULT NULL,
  `paypal_response_protection_eligibility` char(128) DEFAULT NULL,
  `paypal_response_payer_id` char(13) DEFAULT NULL,
  `paypal_response_tax` decimal(10,2) DEFAULT NULL,
  `paypal_response_payment_date` char(28) DEFAULT NULL,
  `paypal_response_payment_status` char(50) DEFAULT NULL,
  `paypal_response_pending_reason` char(50) DEFAULT NULL,
  `paypal_response_mc_fee` decimal(10,2) DEFAULT NULL,
  `paypal_response_payer_email` char(128) DEFAULT NULL,
  `paypal_response_last_name` char(64) DEFAULT NULL,
  `paypal_response_first_name` char(64) DEFAULT NULL,
  `paypal_response_business` char(128) DEFAULT NULL,
  `paypal_response_receiver_email` char(128) DEFAULT NULL,
  `paypal_response_transaction_subject` char(128) DEFAULT NULL,
  `paypal_response_residence_country` char(2) DEFAULT NULL,
  `paypal_response_txn_id` char(32) DEFAULT NULL,
  `paypal_response_txn_type` char(32) DEFAULT NULL,
  `paypal_response_parent_txn_id` char(32) DEFAULT NULL,
  `paypal_response_case_creation_date` char(32) DEFAULT NULL,
  `paypal_response_case_id` char(32) DEFAULT NULL,
  `paypal_response_case_type` char(32) DEFAULT NULL,
  `paypal_response_reason_code` char(32) DEFAULT NULL,
  `paypalresponse_raw` varchar(512) DEFAULT NULL,
  `paypal_fullresponse` text,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_payment_plg_paypal`
--

LOCK TABLES `j_virtuemart_payment_plg_paypal` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_payment_plg_paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_payment_plg_paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_payment_plg_standard`
--

DROP TABLE IF EXISTS `j_virtuemart_payment_plg_standard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_payment_plg_standard` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(1) unsigned DEFAULT NULL,
  `order_number` char(64) DEFAULT NULL,
  `virtuemart_paymentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `payment_name` varchar(5000) DEFAULT NULL,
  `payment_order_total` decimal(15,5) NOT NULL DEFAULT '0.00000',
  `payment_currency` char(3) DEFAULT NULL,
  `email_currency` char(3) DEFAULT NULL,
  `cost_per_transaction` decimal(10,2) DEFAULT NULL,
  `cost_min_transaction` decimal(10,2) DEFAULT NULL,
  `cost_percent_total` decimal(10,2) DEFAULT NULL,
  `tax_id` smallint(1) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Payment Standard Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_payment_plg_standard`
--

LOCK TABLES `j_virtuemart_payment_plg_standard` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_payment_plg_standard` DISABLE KEYS */;
INSERT INTO `j_virtuemart_payment_plg_standard` VALUES (1,1,'2HJQ03',1,'<span class=\"vmpayment_name\">Cash on delivery</span><br />',15.38000,'EUR','47',0.10,0.00,1.50,0,'2017-01-24 18:40:38',833,'2017-01-24 18:40:38',833,'0000-00-00 00:00:00',0),(2,59,'2PIL061',1,' <span class=\"vmpayment_name\">Cash on delivery</span><br />',0.11000,'EUR','47',0.10,0.00,1.50,0,'2017-01-28 06:35:59',833,'2017-01-28 06:35:59',833,'0000-00-00 00:00:00',0),(3,82,'8DAD084',1,' <span class=\"vmpayment_name\">Cash on delivery</span><br />',0.11000,'EUR','47',0.10,0.00,1.50,0,'2017-01-28 09:00:09',833,'2017-01-28 09:00:09',833,'0000-00-00 00:00:00',0),(4,83,'M2VH085',1,' <span class=\"vmpayment_name\">Cash on delivery</span><br />',0.11000,'EUR','47',0.10,0.00,1.50,0,'2017-01-28 09:18:14',833,'2017-01-28 09:18:14',833,'0000-00-00 00:00:00',0),(5,84,'GUEE086',1,' <span class=\"vmpayment_name\">Cash on delivery</span><br />',0.12000,'EUR','47',0.10,0.00,1.50,0,'2017-01-28 12:51:19',833,'2017-01-28 12:51:19',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_payment_plg_standard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_paymentmethod_shoppergroups`
--

DROP TABLE IF EXISTS `j_virtuemart_paymentmethod_shoppergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_paymentmethod_shoppergroups` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_paymentmethod_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_shoppergroup_id` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_paymentmethod_id` (`virtuemart_paymentmethod_id`,`virtuemart_shoppergroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='xref table for paymentmethods to shoppergroup';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_paymentmethod_shoppergroups`
--

LOCK TABLES `j_virtuemart_paymentmethod_shoppergroups` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_paymentmethod_shoppergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_paymentmethod_shoppergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_paymentmethods`
--

DROP TABLE IF EXISTS `j_virtuemart_paymentmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_paymentmethods` (
  `virtuemart_paymentmethod_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1',
  `payment_jplugin_id` int(1) NOT NULL DEFAULT '0',
  `payment_element` varchar(50) NOT NULL DEFAULT '',
  `payment_params` varchar(19000) NOT NULL DEFAULT '',
  `currency_id` int(1) unsigned DEFAULT NULL,
  `shared` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'valide for all vendors?',
  `ordering` int(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_paymentmethod_id`),
  KEY `payment_jplugin_id` (`payment_jplugin_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `payment_element` (`payment_element`,`virtuemart_vendor_id`),
  KEY `ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='The payment methods of your store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_paymentmethods`
--

LOCK TABLES `j_virtuemart_paymentmethods` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_paymentmethods` DISABLE KEYS */;
INSERT INTO `j_virtuemart_paymentmethods` VALUES (1,1,10002,'standard','payment_currency=\"0\"|status_pending=\"U\"|send_invoice_on_order_null=\"1\"|payment_logos=[\n    \"\"\n]|payment_info=\"\"|countries=\"\"|min_amount=\"\"|max_amount=\"\"|cost_per_transaction=\"0.10\"|cost_min_transaction=\"\"|cost_percent_total=\"1.5\"|tax_id=\"0\"|',47,0,0,1,'0000-00-00 00:00:00',0,'2017-01-27 08:54:32',833,'0000-00-00 00:00:00',0),(3,1,10032,'cryptocoin','notify_url=\"\"|box_id=\"8270\"|public_key=\"8270AAwgOMgDogecoin77DOGEPUBxMq81Fn9nMCnWTGrmnz6HU\"|private_key=\"8270AAwgOMgDogecoin77DOGEPRV31FlkaNESfjomGq2yD0X6l\"|webdev_key=\"DEV535GEAEB61F772C10C5G2089664571\"|min_amount=\"0.01\"|max_amount=\"1000000\"|box_type=\"paymentbox\"|box_coin=\"dogecoin\"|order_status_success_first=\"C\"|order_status_success_next=\"R\"|exchange_rate=\"1.00\"|icon_width=\"60\"|frame_w=\"540\"|frame_h=\"230\"|message_style=\"display:inline-block;max-width:580px;padding:15px 20px;box-shadow:0 0 10px #aaa;-moz-box-shadow: 0 0 10px #aaa;margin:7px;font-size:13px;font-weight:normal;line-height:21px;font-family: Verdana, Arial, Helvetica, sans-serif;\"|box_style=\"\"|button_style=\"color:#555;border-color:#ccc;background:#f7f7f7;-webkit-box-shadow:inset 0 1px 0 #fff,0 1px 0 rgba(0,0,0,.08);box-shadow:inset 0 1px 0 #fff,0 1px 0 rgba(0,0,0,.08);vertical-align:top;display:inline-block;text-decoration:none;font-size:13px;line-height:26px;min-height:28px;margin:20px 0 25px 0;padding:0 10px 1px;cursor:pointer;border-width:1px;border-style:solid;-webkit-appearance:none;-webkit-border-radius:3px;border-radius:3px;white-space:nowrap;-webkit-box-sizing:border-box;-moz-box-sizing:border-box;box-sizing:border-box;font-family:\'Open Sans\',sans-serif;font-size: 13px;font-weight: normal;text-transform: none;\"|locale=\"en\"|',47,0,0,1,'2017-01-27 07:19:29',833,'2017-01-28 09:20:51',833,'0000-00-00 00:00:00',0),(4,1,10006,'paypal','paypal_merchant_email=\"\"|accelerated_onboarding=\"\"|api_login_id=\"\"|api_password=\"\"|authentication=\"\"|api_signature=\"\"|api_certificate=\"\"|sandbox=0|sandbox_merchant_email=\"\"|sandbox_api_login_id=\"\"|sandbox_api_password=\"\"|sandbox_api_signature=\"\"|sandbox_api_certificate=\"\"|sandbox_payflow_vendor=\"\"|sandbox_payflow_partner=\"\"|payflow_vendor=\"\"|payflow_partner=\"\"|creditcards=\"\"|cvv_required=\"\"|cvv_images=\"\"|paypalproduct=\"\"|paypal_verified_only=\"\"|payment_currency=\"\"|email_currency=\"\"|log_ipn=\"\"|payment_logos=\"\"|debug=0|log=0|status_pending=\"\"|status_success=\"\"|status_canceled=\"\"|status_expired=\"\"|status_capture=\"\"|status_refunded=\"\"|status_denied=\"\"|status_partial_refunded=\"\"|expected_maxamount=\"\"|secure_post=\"\"|ipn_test=\"\"|no_shipping=\"\"|address_override=\"\"|payment_type=\"_xclick\"|subcription_trials=0|trial1_price=\"\"|trial1_duration=\"\"|subscription_duration=\"\"|subscription_term=\"\"|payment_plan_duration=\"\"|payment_plan_term=\"\"|payment_plan_defer=\"\"|payment_plan_defer_duration=\"\"|payment_plan_defer_strtotime=\"\"|billing_max_amount_type=\"\"|billing_max_amount=\"\"|sftp_login=\"\"|sftp_password=\"\"|sftp_host=\"\"|sftp_sandbox_login=\"\"|sftp_sandbox_password=\"\"|countries=\"\"|min_amount=\"0\"|max_amount=\"0\"|publishup=\"\"|publishdown=\"\"|cost_per_transaction=\"\"|cost_percent_total=\"\"|cost_method=\"\"|tax_id=0|headerBgColor=\"\"|headerHeight=\"\"|logoFont=\"\"|logoFontColor=\"\"|logoFontSize=\"\"|bodyBgImg=\"\"|bodyBgColor=\"\"|PageTitleTextColor=\"\"|PageCollapseBgColor=\"\"|PageCollapseTextColor=\"\"|orderSummaryBgColor=\"\"|orderSummaryBgImage=\"\"|footerTextColor=\"\"|footerTextlinkColor=\"\"|pageButtonBgColor=\"\"|pageButtonTextColor=\"\"|pageTitleTextColor=\"\"|sectionBorder=\"\"|bordercolor=\"\"|headerimg=\"\"|logoimg=\"\"|payment_action=\"sale\"|template=\"\"|add_prices_api=\"\"|',47,0,0,0,'2017-01-27 09:14:28',833,'2017-01-27 09:15:01',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_paymentmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_paymentmethods_en_gb`
--

DROP TABLE IF EXISTS `j_virtuemart_paymentmethods_en_gb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_paymentmethods_en_gb` (
  `virtuemart_paymentmethod_id` int(1) unsigned NOT NULL,
  `payment_name` varchar(180) NOT NULL DEFAULT '',
  `payment_desc` varchar(19000) NOT NULL DEFAULT '',
  `slug` varchar(192) NOT NULL DEFAULT '',
  PRIMARY KEY (`virtuemart_paymentmethod_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_paymentmethods_en_gb`
--

LOCK TABLES `j_virtuemart_paymentmethods_en_gb` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_paymentmethods_en_gb` DISABLE KEYS */;
INSERT INTO `j_virtuemart_paymentmethods_en_gb` VALUES (1,'Cash on delivery','','cash-on-delivery'),(3,'Coins test box','','coins-test-box'),(4,'qqq','','qqq');
/*!40000 ALTER TABLE `j_virtuemart_paymentmethods_en_gb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_product_categories`
--

DROP TABLE IF EXISTS `j_virtuemart_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_product_categories` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_category_id` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_product_id` (`virtuemart_product_id`,`virtuemart_category_id`),
  KEY `ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='Maps Products to Categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_product_categories`
--

LOCK TABLES `j_virtuemart_product_categories` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_product_categories` DISABLE KEYS */;
INSERT INTO `j_virtuemart_product_categories` VALUES (69,1211,13,0);
/*!40000 ALTER TABLE `j_virtuemart_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_product_customfields`
--

DROP TABLE IF EXISTS `j_virtuemart_product_customfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_product_customfields` (
  `virtuemart_customfield_id` int(1) unsigned NOT NULL AUTO_INCREMENT COMMENT 'field id',
  `virtuemart_product_id` int(1) NOT NULL DEFAULT '0',
  `virtuemart_custom_id` int(1) NOT NULL DEFAULT '1' COMMENT 'custom group id',
  `customfield_value` varchar(2500) DEFAULT NULL COMMENT 'field value',
  `customfield_price` decimal(15,6) DEFAULT NULL COMMENT 'price',
  `disabler` int(1) unsigned NOT NULL DEFAULT '0',
  `override` int(1) unsigned NOT NULL DEFAULT '0',
  `customfield_params` varchar(17000) NOT NULL DEFAULT '' COMMENT 'Param for Plugins',
  `product_sku` varchar(64) DEFAULT NULL,
  `product_gtin` varchar(64) DEFAULT NULL,
  `product_mpn` varchar(64) DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) unsigned NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) unsigned NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_customfield_id`),
  KEY `virtuemart_product_id` (`virtuemart_product_id`),
  KEY `virtuemart_custom_id` (`virtuemart_custom_id`),
  KEY `published` (`published`),
  KEY `ordering` (`virtuemart_product_id`,`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=485 DEFAULT CHARSET=utf8 COMMENT='custom fields';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_product_customfields`
--

LOCK TABLES `j_virtuemart_product_customfields` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_product_customfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_product_customfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_product_manufacturers`
--

DROP TABLE IF EXISTS `j_virtuemart_product_manufacturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_product_manufacturers` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) DEFAULT NULL,
  `virtuemart_manufacturer_id` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_product_id` (`virtuemart_product_id`,`virtuemart_manufacturer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Maps a product to a manufacturer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_product_manufacturers`
--

LOCK TABLES `j_virtuemart_product_manufacturers` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_product_manufacturers` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_product_manufacturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_product_medias`
--

DROP TABLE IF EXISTS `j_virtuemart_product_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_product_medias` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_media_id` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_product_id` (`virtuemart_product_id`,`virtuemart_media_id`),
  KEY `ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_product_medias`
--

LOCK TABLES `j_virtuemart_product_medias` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_product_medias` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_product_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_product_prices`
--

DROP TABLE IF EXISTS `j_virtuemart_product_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_product_prices` (
  `virtuemart_product_price_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_shoppergroup_id` int(1) unsigned NOT NULL DEFAULT '0',
  `product_price` decimal(15,6) DEFAULT NULL,
  `override` tinyint(1) DEFAULT NULL,
  `product_override_price` decimal(15,5) DEFAULT NULL,
  `product_tax_id` int(1) DEFAULT NULL,
  `product_discount_id` int(1) DEFAULT NULL,
  `product_currency` smallint(1) DEFAULT NULL,
  `product_price_publish_up` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_price_publish_down` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `price_quantity_start` int(1) unsigned NOT NULL DEFAULT '0',
  `price_quantity_end` int(1) unsigned NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_product_price_id`),
  KEY `virtuemart_product_id` (`virtuemart_product_id`),
  KEY `product_price` (`virtuemart_product_id`),
  KEY `virtuemart_shoppergroup_id` (`virtuemart_shoppergroup_id`),
  KEY `product_price_publish_up` (`product_price_publish_up`),
  KEY `product_price_publish_down` (`product_price_publish_down`),
  KEY `price_quantity_start` (`price_quantity_start`),
  KEY `price_quantity_end` (`price_quantity_end`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='Holds price records for a product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_product_prices`
--

LOCK TABLES `j_virtuemart_product_prices` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_product_prices` DISABLE KEYS */;
INSERT INTO `j_virtuemart_product_prices` VALUES (40,1211,0,0.010000,0,0.01000,-1,-1,144,'0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,'2017-01-27 07:21:07',833,'2017-01-27 07:21:07',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_product_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_product_shoppergroups`
--

DROP TABLE IF EXISTS `j_virtuemart_product_shoppergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_product_shoppergroups` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_shoppergroup_id` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_product_id` (`virtuemart_product_id`,`virtuemart_shoppergroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Maps Products to Categories';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_product_shoppergroups`
--

LOCK TABLES `j_virtuemart_product_shoppergroups` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_product_shoppergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_product_shoppergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_products`
--

DROP TABLE IF EXISTS `j_virtuemart_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_products` (
  `virtuemart_product_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1',
  `product_parent_id` int(1) unsigned NOT NULL DEFAULT '0',
  `product_sku` varchar(255) DEFAULT NULL,
  `product_gtin` varchar(64) DEFAULT NULL,
  `product_mpn` varchar(64) DEFAULT NULL,
  `product_weight` decimal(10,4) DEFAULT NULL,
  `product_weight_uom` varchar(7) DEFAULT NULL,
  `product_length` decimal(10,4) DEFAULT NULL,
  `product_width` decimal(10,4) DEFAULT NULL,
  `product_height` decimal(10,4) DEFAULT NULL,
  `product_lwh_uom` varchar(7) DEFAULT NULL,
  `product_url` varchar(255) DEFAULT NULL,
  `product_in_stock` int(1) NOT NULL DEFAULT '0',
  `product_ordered` int(1) NOT NULL DEFAULT '0',
  `low_stock_notification` int(1) unsigned NOT NULL DEFAULT '0',
  `product_available_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_availability` varchar(32) DEFAULT NULL,
  `product_special` tinyint(1) DEFAULT NULL,
  `product_sales` int(1) unsigned NOT NULL DEFAULT '0',
  `product_unit` varchar(8) DEFAULT NULL,
  `product_packaging` decimal(8,4) unsigned DEFAULT NULL,
  `product_params` text NOT NULL,
  `hits` int(1) unsigned DEFAULT NULL,
  `intnotes` text,
  `metarobot` varchar(400) DEFAULT NULL,
  `metaauthor` varchar(400) DEFAULT NULL,
  `layout` varchar(16) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `pordering` int(1) unsigned NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_product_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `product_parent_id` (`product_parent_id`),
  KEY `product_special` (`product_special`),
  KEY `product_in_stock` (`product_in_stock`),
  KEY `product_ordered` (`product_ordered`),
  KEY `published` (`published`),
  KEY `pordering` (`pordering`),
  KEY `created_on` (`created_on`),
  KEY `modified_on` (`modified_on`)
) ENGINE=MyISAM AUTO_INCREMENT=1212 DEFAULT CHARSET=utf8 COMMENT='All products are stored here.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_products`
--

LOCK TABLES `j_virtuemart_products` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_products` DISABLE KEYS */;
INSERT INTO `j_virtuemart_products` VALUES (1211,1,0,'','','',NULL,'KG',NULL,NULL,NULL,'M','',0,109,0,'2017-01-27 00:00:00','',0,0,'KG',NULL,'min_order_level=\"\"|max_order_level=\"\"|step_order_level=\"\"|product_box=\"\"|',NULL,'','','','0',1,0,'2017-01-27 07:21:07',833,'2017-01-27 07:21:07',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_products_en_gb`
--

DROP TABLE IF EXISTS `j_virtuemart_products_en_gb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_products_en_gb` (
  `virtuemart_product_id` int(1) unsigned NOT NULL,
  `product_s_desc` varchar(2000) NOT NULL DEFAULT '',
  `product_desc` varchar(18400) NOT NULL DEFAULT '',
  `product_name` varchar(180) NOT NULL DEFAULT '',
  `metadesc` varchar(400) NOT NULL DEFAULT '',
  `metakey` varchar(400) NOT NULL DEFAULT '',
  `customtitle` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(192) NOT NULL DEFAULT '',
  PRIMARY KEY (`virtuemart_product_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_products_en_gb`
--

LOCK TABLES `j_virtuemart_products_en_gb` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_products_en_gb` DISABLE KEYS */;
INSERT INTO `j_virtuemart_products_en_gb` VALUES (1211,'','','Test product','','','','test-product');
/*!40000 ALTER TABLE `j_virtuemart_products_en_gb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_rating_reviews`
--

DROP TABLE IF EXISTS `j_virtuemart_rating_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_rating_reviews` (
  `virtuemart_rating_review_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_rating_vote_id` int(1) unsigned DEFAULT NULL,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `comment` varchar(18000) DEFAULT NULL,
  `review_ok` tinyint(1) NOT NULL DEFAULT '0',
  `review_rates` int(1) unsigned NOT NULL DEFAULT '0',
  `review_ratingcount` int(1) unsigned NOT NULL DEFAULT '0',
  `review_rating` decimal(10,2) NOT NULL DEFAULT '0.00',
  `review_editable` tinyint(1) NOT NULL DEFAULT '1',
  `lastip` char(50) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `customer` varchar(128) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_rating_review_id`),
  KEY `virtuemart_rating_vote_id` (`virtuemart_rating_vote_id`),
  KEY `virtuemart_product_id` (`virtuemart_product_id`,`created_by`),
  KEY `created_on` (`created_on`),
  KEY `created_by` (`created_by`),
  KEY `published` (`published`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_rating_reviews`
--

LOCK TABLES `j_virtuemart_rating_reviews` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_rating_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_rating_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_rating_votes`
--

DROP TABLE IF EXISTS `j_virtuemart_rating_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_rating_votes` (
  `virtuemart_rating_vote_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `vote` int(1) NOT NULL DEFAULT '0',
  `lastip` char(50) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_rating_vote_id`),
  KEY `virtuemart_product_id` (`virtuemart_product_id`,`created_by`),
  KEY `created_by` (`created_by`),
  KEY `created_on` (`created_on`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores all ratings for a product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_rating_votes`
--

LOCK TABLES `j_virtuemart_rating_votes` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_rating_votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_rating_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_ratings`
--

DROP TABLE IF EXISTS `j_virtuemart_ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_ratings` (
  `virtuemart_rating_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `rates` int(1) NOT NULL DEFAULT '0',
  `ratingcount` int(1) unsigned NOT NULL DEFAULT '0',
  `rating` decimal(10,1) NOT NULL DEFAULT '0.0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_rating_id`),
  UNIQUE KEY `virtuemart_product_id` (`virtuemart_product_id`,`virtuemart_rating_id`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=1211 DEFAULT CHARSET=utf8 COMMENT='Stores all ratings for a product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_ratings`
--

LOCK TABLES `j_virtuemart_ratings` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_shipment_plg_weight_countries`
--

DROP TABLE IF EXISTS `j_virtuemart_shipment_plg_weight_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_shipment_plg_weight_countries` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_order_id` int(11) unsigned DEFAULT NULL,
  `order_number` char(32) DEFAULT NULL,
  `virtuemart_shipmentmethod_id` mediumint(1) unsigned DEFAULT NULL,
  `shipment_name` varchar(5000) DEFAULT NULL,
  `order_weight` decimal(10,4) DEFAULT NULL,
  `shipment_weight_unit` char(3) DEFAULT 'KG',
  `shipment_cost` decimal(10,2) DEFAULT NULL,
  `shipment_package_fee` decimal(10,2) DEFAULT NULL,
  `tax_id` smallint(1) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='Shipment Weight Countries Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_shipment_plg_weight_countries`
--

LOCK TABLES `j_virtuemart_shipment_plg_weight_countries` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_shipment_plg_weight_countries` DISABLE KEYS */;
INSERT INTO `j_virtuemart_shipment_plg_weight_countries` VALUES (1,1,'2HJQ03',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.1500,'KG',0.00,2.49,0,'2017-01-24 18:40:38',833,'2017-01-24 18:40:38',833,'0000-00-00 00:00:00',0),(2,2,'NFVG04',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 07:26:17',833,'2017-01-27 07:26:17',833,'0000-00-00 00:00:00',0),(3,3,'HW7L05',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 07:27:16',833,'2017-01-27 07:27:16',833,'0000-00-00 00:00:00',0),(4,4,'8H3V06',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 07:30:21',833,'2017-01-27 07:30:21',833,'0000-00-00 00:00:00',0),(5,5,'56DU07',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 08:14:15',833,'2017-01-27 08:14:15',833,'0000-00-00 00:00:00',0),(6,6,'WJRI08',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 08:14:47',833,'2017-01-27 08:14:47',833,'0000-00-00 00:00:00',0),(7,7,'T29409',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 08:16:27',833,'2017-01-27 08:16:27',833,'0000-00-00 00:00:00',0),(8,8,'HE77010',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 08:25:37',833,'2017-01-27 08:25:37',833,'0000-00-00 00:00:00',0),(9,9,'8XQG011',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 08:26:00',833,'2017-01-27 08:26:00',833,'0000-00-00 00:00:00',0),(10,10,'23B8012',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 08:26:06',833,'2017-01-27 08:26:06',833,'0000-00-00 00:00:00',0),(11,11,'XS46013',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 08:27:48',833,'2017-01-27 08:27:48',833,'0000-00-00 00:00:00',0),(12,12,'72BD014',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 08:30:35',833,'2017-01-27 08:30:35',833,'0000-00-00 00:00:00',0),(13,13,'R8XM015',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 08:31:07',833,'2017-01-27 08:31:07',833,'0000-00-00 00:00:00',0),(14,14,'PQ9K016',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 09:53:19',833,'2017-01-27 09:53:19',833,'0000-00-00 00:00:00',0),(15,15,'X8UK017',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 09:57:25',833,'2017-01-27 09:57:25',833,'0000-00-00 00:00:00',0),(16,16,'7PI7018',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 09:58:06',833,'2017-01-27 09:58:06',833,'0000-00-00 00:00:00',0),(17,17,'9LDV019',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 09:58:23',833,'2017-01-27 09:58:23',833,'0000-00-00 00:00:00',0),(18,18,'Q7YG020',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:05:08',833,'2017-01-27 10:05:08',833,'0000-00-00 00:00:00',0),(19,19,'1MLJ021',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:05:25',833,'2017-01-27 10:05:25',833,'0000-00-00 00:00:00',0),(20,20,'P2UN022',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:06:48',833,'2017-01-27 10:06:48',833,'0000-00-00 00:00:00',0),(21,21,'56Q2023',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:07:09',833,'2017-01-27 10:07:09',833,'0000-00-00 00:00:00',0),(22,22,'RE34024',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:18:37',833,'2017-01-27 10:18:37',833,'0000-00-00 00:00:00',0),(23,23,'3EF5025',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:20:49',833,'2017-01-27 10:20:49',833,'0000-00-00 00:00:00',0),(24,24,'JSV1026',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:21:26',833,'2017-01-27 10:21:26',833,'0000-00-00 00:00:00',0),(25,24,'JSV1026',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:21:26',833,'2017-01-27 10:21:26',833,'0000-00-00 00:00:00',0),(26,25,'USQD027',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:21:41',833,'2017-01-27 10:21:41',833,'0000-00-00 00:00:00',0),(27,25,'USQD027',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:21:41',833,'2017-01-27 10:21:41',833,'0000-00-00 00:00:00',0),(28,26,'IHUF028',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:21:57',833,'2017-01-27 10:21:57',833,'0000-00-00 00:00:00',0),(29,26,'IHUF028',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:21:57',833,'2017-01-27 10:21:57',833,'0000-00-00 00:00:00',0),(30,27,'LRS2029',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:23:08',833,'2017-01-27 10:23:08',833,'0000-00-00 00:00:00',0),(31,27,'LRS2029',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:23:08',833,'2017-01-27 10:23:08',833,'0000-00-00 00:00:00',0),(32,28,'25JT030',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:23:27',833,'2017-01-27 10:23:27',833,'0000-00-00 00:00:00',0),(33,28,'25JT030',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,2.49,0,'2017-01-27 10:23:27',833,'2017-01-27 10:23:27',833,'0000-00-00 00:00:00',0),(34,29,'48BW031',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 10:26:23',833,'2017-01-27 10:26:23',833,'0000-00-00 00:00:00',0),(35,29,'48BW031',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 10:26:23',833,'2017-01-27 10:26:23',833,'0000-00-00 00:00:00',0),(36,30,'81RC032',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 10:26:57',833,'2017-01-27 10:26:57',833,'0000-00-00 00:00:00',0),(37,31,'68DQ033',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 11:23:20',833,'2017-01-27 11:23:20',833,'0000-00-00 00:00:00',0),(38,32,'RU9U034',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 11:23:53',833,'2017-01-27 11:23:53',833,'0000-00-00 00:00:00',0),(39,33,'2VSG035',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 11:28:08',833,'2017-01-27 11:28:08',833,'0000-00-00 00:00:00',0),(40,34,'2AHK036',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 11:28:38',833,'2017-01-27 11:28:38',833,'0000-00-00 00:00:00',0),(41,35,'8Y2B037',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 11:29:06',833,'2017-01-27 11:29:06',833,'0000-00-00 00:00:00',0),(42,36,'FML5038',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 11:29:40',833,'2017-01-27 11:29:40',833,'0000-00-00 00:00:00',0),(43,37,'YK57039',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 11:31:08',833,'2017-01-27 11:31:08',833,'0000-00-00 00:00:00',0),(44,38,'Y23M040',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 17:13:58',833,'2017-01-27 17:13:58',833,'0000-00-00 00:00:00',0),(45,39,'NTBB041',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 17:17:17',833,'2017-01-27 17:17:17',833,'0000-00-00 00:00:00',0),(46,40,'SNL3042',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 17:21:51',833,'2017-01-27 17:21:51',833,'0000-00-00 00:00:00',0),(47,41,'E5Z7043',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 17:22:43',833,'2017-01-27 17:22:43',833,'0000-00-00 00:00:00',0),(48,42,'QFN9044',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 17:24:27',833,'2017-01-27 17:24:27',833,'0000-00-00 00:00:00',0),(49,43,'9DM1045',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 18:29:17',833,'2017-01-27 18:29:17',833,'0000-00-00 00:00:00',0),(50,44,'A9WN046',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 18:29:49',833,'2017-01-27 18:29:49',833,'0000-00-00 00:00:00',0),(51,45,'WTQU047',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 18:30:05',833,'2017-01-27 18:30:05',833,'0000-00-00 00:00:00',0),(52,46,'4DET048',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 19:39:50',833,'2017-01-27 19:39:50',833,'0000-00-00 00:00:00',0),(53,47,'V9T1049',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 19:40:55',833,'2017-01-27 19:40:55',833,'0000-00-00 00:00:00',0),(54,48,'RX6W050',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 19:41:40',833,'2017-01-27 19:41:40',833,'0000-00-00 00:00:00',0),(55,49,'YWMH051',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 19:45:05',833,'2017-01-27 19:45:05',833,'0000-00-00 00:00:00',0),(56,50,'UZLC052',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 19:47:32',833,'2017-01-27 19:47:32',833,'0000-00-00 00:00:00',0),(57,51,'QKHH053',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 19:47:41',833,'2017-01-27 19:47:41',833,'0000-00-00 00:00:00',0),(58,52,'ZNV7054',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 19:48:51',833,'2017-01-27 19:48:51',833,'0000-00-00 00:00:00',0),(59,53,'HWC4055',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 19:59:48',833,'2017-01-27 19:59:48',833,'0000-00-00 00:00:00',0),(60,54,'NWN4056',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 20:00:03',833,'2017-01-27 20:00:03',833,'0000-00-00 00:00:00',0),(61,55,'FYXX057',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 20:04:50',833,'2017-01-27 20:04:50',833,'0000-00-00 00:00:00',0),(62,56,'2ZS5058',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 20:14:56',833,'2017-01-27 20:14:56',833,'0000-00-00 00:00:00',0),(63,57,'9GYZ059',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-27 20:16:15',833,'2017-01-27 20:16:15',833,'0000-00-00 00:00:00',0),(64,58,'Q8P1060',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 06:15:09',833,'2017-01-28 06:15:09',833,'0000-00-00 00:00:00',0),(65,59,'2PIL061',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 06:35:59',833,'2017-01-28 06:35:59',833,'0000-00-00 00:00:00',0),(66,60,'QD5X062',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 06:37:04',833,'2017-01-28 06:37:04',833,'0000-00-00 00:00:00',0),(67,61,'BD69063',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 06:38:30',833,'2017-01-28 06:38:30',833,'0000-00-00 00:00:00',0),(68,62,'XS4J064',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 06:39:22',833,'2017-01-28 06:39:22',833,'0000-00-00 00:00:00',0),(69,63,'BXNR065',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 06:39:52',833,'2017-01-28 06:39:52',833,'0000-00-00 00:00:00',0),(70,64,'YTZZ066',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 06:40:17',833,'2017-01-28 06:40:17',833,'0000-00-00 00:00:00',0),(71,65,'7GPW067',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 06:40:47',833,'2017-01-28 06:40:47',833,'0000-00-00 00:00:00',0),(72,66,'E7IF068',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 06:41:13',833,'2017-01-28 06:41:13',833,'0000-00-00 00:00:00',0),(73,67,'JLBP069',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 06:41:44',833,'2017-01-28 06:41:44',833,'0000-00-00 00:00:00',0),(74,68,'Y5BE070',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 06:46:34',833,'2017-01-28 06:46:34',833,'0000-00-00 00:00:00',0),(75,69,'4S9E071',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 06:47:17',833,'2017-01-28 06:47:17',833,'0000-00-00 00:00:00',0),(76,70,'2DES072',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 06:47:29',833,'2017-01-28 06:47:29',833,'0000-00-00 00:00:00',0),(77,71,'5SQ9073',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 08:00:41',833,'2017-01-28 08:00:41',833,'0000-00-00 00:00:00',0),(78,72,'SZEM074',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 08:10:39',833,'2017-01-28 08:10:39',833,'0000-00-00 00:00:00',0),(79,73,'62PY075',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 08:15:56',833,'2017-01-28 08:15:56',833,'0000-00-00 00:00:00',0),(80,74,'U1E7076',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 08:19:28',833,'2017-01-28 08:19:28',833,'0000-00-00 00:00:00',0),(81,75,'3B4H077',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 08:20:52',833,'2017-01-28 08:20:52',833,'0000-00-00 00:00:00',0),(82,76,'MDPW078',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 08:22:11',833,'2017-01-28 08:22:11',833,'0000-00-00 00:00:00',0),(83,77,'V8BH079',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 08:22:56',833,'2017-01-28 08:22:56',833,'0000-00-00 00:00:00',0),(84,78,'GY3N080',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 08:23:25',833,'2017-01-28 08:23:25',833,'0000-00-00 00:00:00',0),(85,79,'WPYT081',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 08:26:21',833,'2017-01-28 08:26:21',833,'0000-00-00 00:00:00',0),(86,80,'25LS082',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 08:34:57',833,'2017-01-28 08:34:57',833,'0000-00-00 00:00:00',0),(87,81,'4CM1083',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 08:35:22',833,'2017-01-28 08:35:22',833,'0000-00-00 00:00:00',0),(88,82,'8DAD084',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 09:00:09',833,'2017-01-28 09:00:09',833,'0000-00-00 00:00:00',0),(89,83,'M2VH085',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 09:18:14',833,'2017-01-28 09:18:14',833,'0000-00-00 00:00:00',0),(90,84,'GUEE086',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 12:51:19',833,'2017-01-28 12:51:19',833,'0000-00-00 00:00:00',0),(91,85,'SVQG087',1,'<span class=\"vmshipment_name\">Self pick-up</span>',0.0000,'KG',0.00,0.00,0,'2017-01-28 12:57:01',833,'2017-01-28 12:57:01',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_shipment_plg_weight_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_shipmentmethod_shoppergroups`
--

DROP TABLE IF EXISTS `j_virtuemart_shipmentmethod_shoppergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_shipmentmethod_shoppergroups` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_shipmentmethod_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_shoppergroup_id` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_shipmentmethod_id` (`virtuemart_shipmentmethod_id`,`virtuemart_shoppergroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='xref table for shipment to shoppergroup';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_shipmentmethod_shoppergroups`
--

LOCK TABLES `j_virtuemart_shipmentmethod_shoppergroups` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_shipmentmethod_shoppergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_shipmentmethod_shoppergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_shipmentmethods`
--

DROP TABLE IF EXISTS `j_virtuemart_shipmentmethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_shipmentmethods` (
  `virtuemart_shipmentmethod_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1',
  `shipment_jplugin_id` int(1) NOT NULL DEFAULT '0',
  `shipment_element` varchar(50) NOT NULL DEFAULT '',
  `shipment_params` varchar(19000) NOT NULL DEFAULT '',
  `currency_id` int(1) unsigned DEFAULT NULL,
  `ordering` int(1) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_shipmentmethod_id`),
  KEY `shipment_jplugin_id` (`shipment_jplugin_id`),
  KEY `shipment_element` (`shipment_element`,`virtuemart_vendor_id`),
  KEY `ordering` (`ordering`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Shipment created from the shipment plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_shipmentmethods`
--

LOCK TABLES `j_virtuemart_shipmentmethods` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_shipmentmethods` DISABLE KEYS */;
INSERT INTO `j_virtuemart_shipmentmethods` VALUES (1,1,10018,'weight_countries','shipment_logos=\"\"|show_on_pdetails=1|categories=\"\"|blocking_categories=\"\"|countries=\"\"|zip_start=\"\"|zip_stop=\"\"|weight_start=\"\"|weight_stop=\"\"|weight_unit=\"KG\"|nbproducts_start=0|nbproducts_stop=0|orderamount_start=\"\"|orderamount_stop=\"\"|shipment_cost=\"0\"|package_fee=\"0\"|tax_id=\"0\"|free_shipment=\"500\"|',47,0,0,1,'0000-00-00 00:00:00',0,'2017-01-27 10:26:14',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_shipmentmethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_shipmentmethods_en_gb`
--

DROP TABLE IF EXISTS `j_virtuemart_shipmentmethods_en_gb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_shipmentmethods_en_gb` (
  `virtuemart_shipmentmethod_id` int(1) unsigned NOT NULL,
  `shipment_name` varchar(180) NOT NULL DEFAULT '',
  `shipment_desc` varchar(19000) NOT NULL DEFAULT '',
  `slug` varchar(192) NOT NULL DEFAULT '',
  PRIMARY KEY (`virtuemart_shipmentmethod_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_shipmentmethods_en_gb`
--

LOCK TABLES `j_virtuemart_shipmentmethods_en_gb` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_shipmentmethods_en_gb` DISABLE KEYS */;
INSERT INTO `j_virtuemart_shipmentmethods_en_gb` VALUES (1,'Self pick-up','','self-pick-up');
/*!40000 ALTER TABLE `j_virtuemart_shipmentmethods_en_gb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_shoppergroups`
--

DROP TABLE IF EXISTS `j_virtuemart_shoppergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_shoppergroups` (
  `virtuemart_shoppergroup_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1',
  `shopper_group_name` varchar(128) DEFAULT NULL,
  `shopper_group_desc` varchar(255) DEFAULT NULL,
  `custom_price_display` tinyint(1) NOT NULL DEFAULT '0',
  `price_display` blob NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `sgrp_additional` tinyint(1) NOT NULL DEFAULT '0',
  `ordering` int(1) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_shoppergroup_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `shopper_group_name` (`shopper_group_name`),
  KEY `ordering` (`ordering`),
  KEY `shared` (`shared`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Shopper Groups that users can be assigned to';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_shoppergroups`
--

LOCK TABLES `j_virtuemart_shoppergroups` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_shoppergroups` DISABLE KEYS */;
INSERT INTO `j_virtuemart_shoppergroups` VALUES (2,1,'COM_VIRTUEMART_SHOPPERGROUP_DEFAULT','COM_VIRTUEMART_SHOPPERGROUP_DEFAULT_TIP',0,'',1,0,0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(1,1,'COM_VIRTUEMART_SHOPPERGROUP_GUEST','COM_VIRTUEMART_SHOPPERGROUP_GUEST_TIP',0,'',2,0,0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(3,1,'Wholesale','Shoppers that can buy at wholesale.',0,'',0,0,0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(4,1,'Gold Level','Gold Level Shoppers.',0,'',0,0,0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_shoppergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_states`
--

DROP TABLE IF EXISTS `j_virtuemart_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_states` (
  `virtuemart_state_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1',
  `virtuemart_country_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_worldzone_id` int(1) unsigned NOT NULL DEFAULT '0',
  `state_name` varchar(64) DEFAULT NULL,
  `state_3_code` char(3) DEFAULT NULL,
  `state_2_code` char(2) DEFAULT NULL,
  `ordering` int(1) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '1',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_state_id`),
  UNIQUE KEY `state_3_code` (`virtuemart_vendor_id`,`virtuemart_country_id`,`state_3_code`),
  UNIQUE KEY `state_2_code` (`virtuemart_vendor_id`,`virtuemart_country_id`,`state_2_code`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `virtuemart_country_id` (`virtuemart_country_id`),
  KEY `ordering` (`ordering`),
  KEY `shared` (`shared`),
  KEY `published` (`published`)
) ENGINE=MyISAM AUTO_INCREMENT=832 DEFAULT CHARSET=utf8 COMMENT='States that are assigned to a country';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_states`
--

LOCK TABLES `j_virtuemart_states` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_states` DISABLE KEYS */;
INSERT INTO `j_virtuemart_states` VALUES (1,1,223,0,'Alabama','ALA','AL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(2,1,223,0,'Alaska','ALK','AK',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(3,1,223,0,'Arizona','ARZ','AZ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(4,1,223,0,'Arkansas','ARK','AR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(5,1,223,0,'California','CAL','CA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(6,1,223,0,'Colorado','COL','CO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(7,1,223,0,'Connecticut','CCT','CT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(8,1,223,0,'Delaware','DEL','DE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(9,1,223,0,'District Of Columbia','DOC','DC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(10,1,223,0,'Florida','FLO','FL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(11,1,223,0,'Georgia','GEA','GA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(12,1,223,0,'Hawaii','HWI','HI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(13,1,223,0,'Idaho','IDA','ID',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(14,1,223,0,'Illinois','ILL','IL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(15,1,223,0,'Indiana','IND','IN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(16,1,223,0,'Iowa','IOA','IA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(17,1,223,0,'Kansas','KAS','KS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(18,1,223,0,'Kentucky','KTY','KY',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(19,1,223,0,'Louisiana','LOA','LA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(20,1,223,0,'Maine','MAI','ME',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(21,1,223,0,'Maryland','MLD','MD',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(22,1,223,0,'Massachusetts','MSA','MA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(23,1,223,0,'Michigan','MIC','MI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(24,1,223,0,'Minnesota','MIN','MN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(25,1,223,0,'Mississippi','MIS','MS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(26,1,223,0,'Missouri','MIO','MO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(27,1,223,0,'Montana','MOT','MT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(28,1,223,0,'Nebraska','NEB','NE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(29,1,223,0,'Nevada','NEV','NV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(30,1,223,0,'New Hampshire','NEH','NH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(31,1,223,0,'New Jersey','NEJ','NJ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(32,1,223,0,'New Mexico','NEM','NM',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(33,1,223,0,'New York','NEY','NY',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(34,1,223,0,'North Carolina','NOC','NC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(35,1,223,0,'North Dakota','NOD','ND',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(36,1,223,0,'Ohio','OHI','OH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(37,1,223,0,'Oklahoma','OKL','OK',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(38,1,223,0,'Oregon','ORN','OR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(39,1,223,0,'Pennsylvania','PEA','PA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(40,1,223,0,'Rhode Island','RHI','RI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(41,1,223,0,'South Carolina','SOC','SC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(42,1,223,0,'South Dakota','SOD','SD',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(43,1,223,0,'Tennessee','TEN','TN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(44,1,223,0,'Texas','TXS','TX',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(45,1,223,0,'Utah','UTA','UT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(46,1,223,0,'Vermont','VMT','VT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(47,1,223,0,'Virginia','VIA','VA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(48,1,223,0,'Washington','WAS','WA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(49,1,223,0,'West Virginia','WEV','WV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(50,1,223,0,'Wisconsin','WIS','WI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(51,1,223,0,'Wyoming','WYO','WY',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(52,1,38,0,'Alberta','ALB','AB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(53,1,38,0,'British Columbia','BRC','BC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(54,1,38,0,'Manitoba','MAB','MB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(55,1,38,0,'New Brunswick','NEB','NB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(56,1,38,0,'Newfoundland and Labrador','NFL','NL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(57,1,38,0,'Northwest Territories','NWT','NT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(58,1,38,0,'Nova Scotia','NOS','NS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(59,1,38,0,'Nunavut','NUT','NU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(60,1,38,0,'Ontario','ONT','ON',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(61,1,38,0,'Prince Edward Island','PEI','PE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(62,1,38,0,'Quebec','QEC','QC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(63,1,38,0,'Saskatchewan','SAK','SK',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(64,1,38,0,'Yukon','YUT','YT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(65,1,222,0,'England','ENG','EN',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(66,1,222,0,'Northern Ireland','NOI','NI',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(67,1,222,0,'Scotland','SCO','SD',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(68,1,222,0,'Wales','WLS','WS',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(69,1,13,0,'Australian Capital Territory','ACT','AC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(70,1,13,0,'New South Wales','NSW','NS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(71,1,13,0,'Northern Territory','NOT','NT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(72,1,13,0,'Queensland','QLD','QL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(73,1,13,0,'South Australia','SOA','SA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(74,1,13,0,'Tasmania','TAS','TS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(75,1,13,0,'Victoria','VIC','VI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(76,1,13,0,'Western Australia','WEA','WA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(77,1,138,0,'Aguascalientes','AGS','AG',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(78,1,138,0,'Baja California Norte','BCN','BN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(79,1,138,0,'Baja California Sur','BCS','BS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(80,1,138,0,'Campeche','CAM','CA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(81,1,138,0,'Chiapas','CHI','CS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(82,1,138,0,'Chihuahua','CHA','CH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(83,1,138,0,'Coahuila','COA','CO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(84,1,138,0,'Colima','COL','CM',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(85,1,138,0,'Distrito Federal','DFM','DF',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(86,1,138,0,'Durango','DGO','DO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(87,1,138,0,'Guanajuato','GTO','GO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(88,1,138,0,'Guerrero','GRO','GU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(89,1,138,0,'Hidalgo','HGO','HI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(90,1,138,0,'Jalisco','JAL','JA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(91,1,138,0,'M','EDM','EM',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(92,1,138,0,'Michoac','MCN','MI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(93,1,138,0,'Morelos','MOR','MO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(94,1,138,0,'Nayarit','NAY','NY',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(95,1,138,0,'Nuevo Le','NUL','NL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(96,1,138,0,'Oaxaca','OAX','OA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(97,1,138,0,'Puebla','PUE','PU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(98,1,138,0,'Quer','QRO','QU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(99,1,138,0,'Quintana Roo','QUR','QR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(100,1,138,0,'San Luis Potos','SLP','SP',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(101,1,138,0,'Sinaloa','SIN','SI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(102,1,138,0,'Sonora','SON','SO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(103,1,138,0,'Tabasco','TAB','TA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(104,1,138,0,'Tamaulipas','TAM','TM',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(105,1,138,0,'Tlaxcala','TLX','TX',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(106,1,138,0,'Veracruz','VER','VZ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(107,1,138,0,'Yucat','YUC','YU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(108,1,138,0,'Zacatecas','ZAC','ZA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(109,1,30,0,'Acre','ACR','AC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(110,1,30,0,'Alagoas','ALG','AL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(111,1,30,0,'Amapá','AMP','AP',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(112,1,30,0,'Amazonas','AMZ','AM',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(113,1,30,0,'Bahía','BAH','BA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(114,1,30,0,'Ceará','CEA','CE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(115,1,30,0,'Distrito Federal','DFB','DF',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(116,1,30,0,'Espírito Santo','ESS','ES',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(117,1,30,0,'Goiás','GOI','GO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(118,1,30,0,'Maranhão','MAR','MA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(119,1,30,0,'Mato Grosso','MAT','MT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(120,1,30,0,'Mato Grosso do Sul','MGS','MS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(121,1,30,0,'Minas Gerais','MIG','MG',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(122,1,30,0,'Paraná','PAR','PR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(123,1,30,0,'Paraíba','PRB','PB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(124,1,30,0,'Pará','PAB','PA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(125,1,30,0,'Pernambuco','PER','PE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(126,1,30,0,'Piauí','PIA','PI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(127,1,30,0,'Rio Grande do Norte','RGN','RN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(128,1,30,0,'Rio Grande do Sul','RGS','RS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(129,1,30,0,'Rio de Janeiro','RDJ','RJ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(130,1,30,0,'Rondônia','RON','RO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(131,1,30,0,'Roraima','ROR','RR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(132,1,30,0,'Santa Catarina','SAC','SC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(133,1,30,0,'Sergipe','SER','SE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(134,1,30,0,'São Paulo','SAP','SP',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(135,1,30,0,'Tocantins','TOC','TO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(136,1,44,0,'Anhui','ANH','34',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(137,1,44,0,'Beijing','BEI','11',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(138,1,44,0,'Chongqing','CHO','50',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(139,1,44,0,'Fujian','FUJ','35',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(140,1,44,0,'Gansu','GAN','62',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(141,1,44,0,'Guangdong','GUA','44',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(142,1,44,0,'Guangxi Zhuang','GUZ','45',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(143,1,44,0,'Guizhou','GUI','52',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(144,1,44,0,'Hainan','HAI','46',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(145,1,44,0,'Hebei','HEB','13',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(146,1,44,0,'Heilongjiang','HEI','23',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(147,1,44,0,'Henan','HEN','41',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(148,1,44,0,'Hubei','HUB','42',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(149,1,44,0,'Hunan','HUN','43',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(150,1,44,0,'Jiangsu','JIA','32',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(151,1,44,0,'Jiangxi','JIX','36',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(152,1,44,0,'Jilin','JIL','22',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(153,1,44,0,'Liaoning','LIA','21',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(154,1,44,0,'Nei Mongol','NML','15',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(155,1,44,0,'Ningxia Hui','NIH','64',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(156,1,44,0,'Qinghai','QIN','63',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(157,1,44,0,'Shandong','SNG','37',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(158,1,44,0,'Shanghai','SHH','31',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(159,1,44,0,'Shaanxi','SHX','61',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(160,1,44,0,'Sichuan','SIC','51',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(161,1,44,0,'Tianjin','TIA','12',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(162,1,44,0,'Xinjiang Uygur','XIU','65',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(163,1,44,0,'Xizang','XIZ','54',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(164,1,44,0,'Yunnan','YUN','53',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(165,1,44,0,'Zhejiang','ZHE','33',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(166,1,104,0,'Israel','ISL','IL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(167,1,104,0,'Gaza Strip','GZS','GZ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(168,1,104,0,'West Bank','WBK','WB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(169,1,151,0,'St. Maarten','STM','SM',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(170,1,151,0,'Bonaire','BNR','BN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(171,1,151,0,'Curacao','CUR','CR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(172,1,175,0,'Alba','ABA','AB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(173,1,175,0,'Arad','ARD','AR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(174,1,175,0,'Arges','ARG','AG',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(175,1,175,0,'Bacau','BAC','BC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(176,1,175,0,'Bihor','BIH','BH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(177,1,175,0,'Bistrita-Nasaud','BIS','BN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(178,1,175,0,'Botosani','BOT','BT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(179,1,175,0,'Braila','BRL','BR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(180,1,175,0,'Brasov','BRA','BV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(181,1,175,0,'Bucuresti','BUC','B',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(182,1,175,0,'Buzau','BUZ','BZ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(183,1,175,0,'Calarasi','CAL','CL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(184,1,175,0,'Caras Severin','CRS','CS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(185,1,175,0,'Cluj','CLJ','CJ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(186,1,175,0,'Constanta','CST','CT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(187,1,175,0,'Covasna','COV','CV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(188,1,175,0,'Dambovita','DAM','DB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(189,1,175,0,'Dolj','DLJ','DJ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(190,1,175,0,'Galati','GAL','GL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(191,1,175,0,'Giurgiu','GIU','GR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(192,1,175,0,'Gorj','GOR','GJ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(193,1,175,0,'Hargita','HRG','HR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(194,1,175,0,'Hunedoara','HUN','HD',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(195,1,175,0,'Ialomita','IAL','IL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(196,1,175,0,'Iasi','IAS','IS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(197,1,175,0,'Ilfov','ILF','IF',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(198,1,175,0,'Maramures','MAR','MM',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(199,1,175,0,'Mehedinti','MEH','MH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(200,1,175,0,'Mures','MUR','MS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(201,1,175,0,'Neamt','NEM','NT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(202,1,175,0,'Olt','OLT','OT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(203,1,175,0,'Prahova','PRA','PH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(204,1,175,0,'Salaj','SAL','SJ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(205,1,175,0,'Satu Mare','SAT','SM',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(206,1,175,0,'Sibiu','SIB','SB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(207,1,175,0,'Suceava','SUC','SV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(208,1,175,0,'Teleorman','TEL','TR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(209,1,175,0,'Timis','TIM','TM',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(210,1,175,0,'Tulcea','TUL','TL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(211,1,175,0,'Valcea','VAL','VL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(212,1,175,0,'Vaslui','VAS','VS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(213,1,175,0,'Vrancea','VRA','VN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(214,1,105,0,'Agrigento','AGR','AG',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(215,1,105,0,'Alessandria','ALE','AL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(216,1,105,0,'Ancona','ANC','AN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(217,1,105,0,'Aosta','AOS','AO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(218,1,105,0,'Arezzo','ARE','AR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(219,1,105,0,'Ascoli Piceno','API','AP',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(220,1,105,0,'Asti','AST','AT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(221,1,105,0,'Avellino','AVE','AV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(222,1,105,0,'Bari','BAR','BA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(223,1,105,0,'Belluno','BEL','BL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(224,1,105,0,'Benevento','BEN','BN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(225,1,105,0,'Bergamo','BEG','BG',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(226,1,105,0,'Biella','BIE','BI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(227,1,105,0,'Bologna','BOL','BO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(228,1,105,0,'Bolzano','BOZ','BZ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(229,1,105,0,'Brescia','BRE','BS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(230,1,105,0,'Brindisi','BRI','BR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(231,1,105,0,'Cagliari','CAG','CA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(232,1,105,0,'Caltanissetta','CAL','CL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(233,1,105,0,'Campobasso','CBO','CB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(234,1,105,0,'Carbonia-Iglesias','CAR','CI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(235,1,105,0,'Caserta','CAS','CE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(236,1,105,0,'Catania','CAT','CT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(237,1,105,0,'Catanzaro','CTZ','CZ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(238,1,105,0,'Chieti','CHI','CH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(239,1,105,0,'Como','COM','CO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(240,1,105,0,'Cosenza','COS','CS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(241,1,105,0,'Cremona','CRE','CR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(242,1,105,0,'Crotone','CRO','KR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(243,1,105,0,'Cuneo','CUN','CN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(244,1,105,0,'Enna','ENN','EN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(245,1,105,0,'Ferrara','FER','FE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(246,1,105,0,'Firenze','FIR','FI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(247,1,105,0,'Foggia','FOG','FG',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(248,1,105,0,'Forli-Cesena','FOC','FC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(249,1,105,0,'Frosinone','FRO','FR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(250,1,105,0,'Genova','GEN','GE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(251,1,105,0,'Gorizia','GOR','GO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(252,1,105,0,'Grosseto','GRO','GR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(253,1,105,0,'Imperia','IMP','IM',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(254,1,105,0,'Isernia','ISE','IS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(255,1,105,0,'L\'Aquila','AQU','AQ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(256,1,105,0,'La Spezia','LAS','SP',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(257,1,105,0,'Latina','LAT','LT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(258,1,105,0,'Lecce','LEC','LE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(259,1,105,0,'Lecco','LCC','LC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(260,1,105,0,'Livorno','LIV','LI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(261,1,105,0,'Lodi','LOD','LO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(262,1,105,0,'Lucca','LUC','LU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(263,1,105,0,'Macerata','MAC','MC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(264,1,105,0,'Mantova','MAN','MN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(265,1,105,0,'Massa-Carrara','MAS','MS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(266,1,105,0,'Matera','MAA','MT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(267,1,105,0,'Medio Campidano','MED','VS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(268,1,105,0,'Messina','MES','ME',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(269,1,105,0,'Milano','MIL','MI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(270,1,105,0,'Modena','MOD','MO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(271,1,105,0,'Napoli','NAP','NA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(272,1,105,0,'Novara','NOV','NO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(273,1,105,0,'Nuoro','NUR','NU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(274,1,105,0,'Ogliastra','OGL','OG',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(275,1,105,0,'Olbia-Tempio','OLB','OT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(276,1,105,0,'Oristano','ORI','OR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(277,1,105,0,'Padova','PDA','PD',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(278,1,105,0,'Palermo','PAL','PA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(279,1,105,0,'Parma','PAA','PR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(280,1,105,0,'Pavia','PAV','PV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(281,1,105,0,'Perugia','PER','PG',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(282,1,105,0,'Pesaro e Urbino','PES','PU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(283,1,105,0,'Pescara','PSC','PE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(284,1,105,0,'Piacenza','PIA','PC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(285,1,105,0,'Pisa','PIS','PI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(286,1,105,0,'Pistoia','PIT','PT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(287,1,105,0,'Pordenone','POR','PN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(288,1,105,0,'Potenza','PTZ','PZ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(289,1,105,0,'Prato','PRA','PO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(290,1,105,0,'Ragusa','RAG','RG',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(291,1,105,0,'Ravenna','RAV','RA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(292,1,105,0,'Reggio Calabria','REG','RC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(293,1,105,0,'Reggio Emilia','REE','RE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(294,1,105,0,'Rieti','RIE','RI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(295,1,105,0,'Rimini','RIM','RN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(296,1,105,0,'Roma','ROM','RM',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(297,1,105,0,'Rovigo','ROV','RO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(298,1,105,0,'Salerno','SAL','SA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(299,1,105,0,'Sassari','SAS','SS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(300,1,105,0,'Savona','SAV','SV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(301,1,105,0,'Siena','SIE','SI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(302,1,105,0,'Siracusa','SIR','SR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(303,1,105,0,'Sondrio','SOO','SO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(304,1,105,0,'Taranto','TAR','TA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(305,1,105,0,'Teramo','TER','TE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(306,1,105,0,'Terni','TRN','TR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(307,1,105,0,'Torino','TOR','TO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(308,1,105,0,'Trapani','TRA','TP',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(309,1,105,0,'Trento','TRE','TN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(310,1,105,0,'Treviso','TRV','TV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(311,1,105,0,'Trieste','TRI','TS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(312,1,105,0,'Udine','UDI','UD',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(313,1,105,0,'Varese','VAR','VA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(314,1,105,0,'Venezia','VEN','VE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(315,1,105,0,'Verbano Cusio Ossola','VCO','VB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(316,1,105,0,'Vercelli','VER','VC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(317,1,105,0,'Verona','VRN','VR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(318,1,105,0,'Vibo Valenzia','VIV','VV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(319,1,105,0,'Vicenza','VII','VI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(320,1,105,0,'Viterbo','VIT','VT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(321,1,195,0,'A Coru','ACO','15',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(322,1,195,0,'Alava','ALA','01',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(323,1,195,0,'Albacete','ALB','02',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(324,1,195,0,'Alicante','ALI','03',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(325,1,195,0,'Almeria','ALM','04',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(326,1,195,0,'Asturias','AST','33',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(327,1,195,0,'Avila','AVI','05',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(328,1,195,0,'Badajoz','BAD','06',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(329,1,195,0,'Baleares','BAL','07',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(330,1,195,0,'Barcelona','BAR','08',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(331,1,195,0,'Burgos','BUR','09',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(332,1,195,0,'Caceres','CAC','10',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(333,1,195,0,'Cadiz','CAD','11',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(334,1,195,0,'Cantabria','CAN','39',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(335,1,195,0,'Castellon','CAS','12',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(336,1,195,0,'Ceuta','CEU','51',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(337,1,195,0,'Ciudad Real','CIU','13',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(338,1,195,0,'Cordoba','COR','14',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(339,1,195,0,'Cuenca','CUE','16',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(340,1,195,0,'Girona','GIR','17',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(341,1,195,0,'Granada','GRA','18',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(342,1,195,0,'Guadalajara','GUA','19',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(343,1,195,0,'Guipuzcoa','GUI','20',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(344,1,195,0,'Huelva','HUL','21',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(345,1,195,0,'Huesca','HUS','22',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(346,1,195,0,'Jaen','JAE','23',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(347,1,195,0,'La Rioja','LRI','26',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(348,1,195,0,'Las Palmas','LPA','35',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(349,1,195,0,'Leon','LEO','24',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(350,1,195,0,'Lleida','LLE','25',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(351,1,195,0,'Lugo','LUG','27',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(352,1,195,0,'Madrid','MAD','28',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(353,1,195,0,'Malaga','MAL','29',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(354,1,195,0,'Melilla','MEL','52',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(355,1,195,0,'Murcia','MUR','30',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(356,1,195,0,'Navarra','NAV','31',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(357,1,195,0,'Ourense','OUR','32',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(358,1,195,0,'Palencia','PAL','34',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(359,1,195,0,'Pontevedra','PON','36',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(360,1,195,0,'Salamanca','SAL','37',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(361,1,195,0,'Santa Cruz de Tenerife','SCT','38',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(362,1,195,0,'Segovia','SEG','40',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(363,1,195,0,'Sevilla','SEV','41',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(364,1,195,0,'Soria','SOR','42',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(365,1,195,0,'Tarragona','TAR','43',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(366,1,195,0,'Teruel','TER','44',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(367,1,195,0,'Toledo','TOL','45',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(368,1,195,0,'Valencia','VAL','46',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(369,1,195,0,'Valladolid','VLL','47',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(370,1,195,0,'Vizcaya','VIZ','48',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(371,1,195,0,'Zamora','ZAM','49',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(372,1,195,0,'Zaragoza','ZAR','50',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(373,1,10,0,'Buenos Aires','BAS','BA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(374,1,10,0,'Ciudad Autonoma De Buenos Aires','CBA','CB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(375,1,10,0,'Catamarca','CAT','CA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(376,1,10,0,'Chaco','CHO','CH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(377,1,10,0,'Chubut','CTT','CT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(378,1,10,0,'Cordoba','COD','CO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(379,1,10,0,'Corrientes','CRI','CR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(380,1,10,0,'Entre Rios','ERS','ER',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(381,1,10,0,'Formosa','FRM','FR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(382,1,10,0,'Jujuy','JUJ','JU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(383,1,10,0,'La Pampa','LPM','LP',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(384,1,10,0,'La Rioja','LRI','LR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(385,1,10,0,'Mendoza','MED','ME',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(386,1,10,0,'Misiones','MIS','MI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(387,1,10,0,'Neuquen','NQU','NQ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(388,1,10,0,'Rio Negro','RNG','RN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(389,1,10,0,'Salta','SAL','SA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(390,1,10,0,'San Juan','SJN','SJ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(391,1,10,0,'San Luis','SLU','SL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(392,1,10,0,'Santa Cruz','SCZ','SC',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(393,1,10,0,'Santa Fe','SFE','SF',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(394,1,10,0,'Santiago Del Estero','SEN','SE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(395,1,10,0,'Tierra Del Fuego','TFE','TF',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(396,1,10,0,'Tucuman','TUC','TU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(397,1,11,0,'Aragatsotn','ARG','AG',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(398,1,11,0,'Ararat','ARR','AR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(399,1,11,0,'Armavir','ARM','AV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(400,1,11,0,'Gegharkunik','GEG','GR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(401,1,11,0,'Kotayk','KOT','KT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(402,1,11,0,'Lori','LOR','LO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(403,1,11,0,'Shirak','SHI','SH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(404,1,11,0,'Syunik','SYU','SU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(405,1,11,0,'Tavush','TAV','TV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(406,1,11,0,'Vayots-Dzor','VAD','VD',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(407,1,11,0,'Yerevan','YER','ER',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(408,1,99,0,'Andaman & Nicobar Islands','ANI','AI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(409,1,99,0,'Andhra Pradesh','AND','AN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(410,1,99,0,'Arunachal Pradesh','ARU','AR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(411,1,99,0,'Assam','ASS','AS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(412,1,99,0,'Bihar','BIH','BI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(413,1,99,0,'Chandigarh','CHA','CA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(414,1,99,0,'Chhatisgarh','CHH','CH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(415,1,99,0,'Dadra & Nagar Haveli','DAD','DD',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(416,1,99,0,'Daman & Diu','DAM','DA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(417,1,99,0,'Delhi','DEL','DE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(418,1,99,0,'Goa','GOA','GO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(419,1,99,0,'Gujarat','GUJ','GU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(420,1,99,0,'Haryana','HAR','HA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(421,1,99,0,'Himachal Pradesh','HIM','HI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(422,1,99,0,'Jammu & Kashmir','JAM','JA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(423,1,99,0,'Jharkhand','JHA','JH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(424,1,99,0,'Karnataka','KAR','KA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(425,1,99,0,'Kerala','KER','KE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(426,1,99,0,'Lakshadweep','LAK','LA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(427,1,99,0,'Madhya Pradesh','MAD','MD',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(428,1,99,0,'Maharashtra','MAH','MH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(429,1,99,0,'Manipur','MAN','MN',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(430,1,99,0,'Meghalaya','MEG','ME',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(431,1,99,0,'Mizoram','MIZ','MI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(432,1,99,0,'Nagaland','NAG','NA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(433,1,99,0,'Orissa','ORI','OR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(434,1,99,0,'Pondicherry','PON','PO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(435,1,99,0,'Punjab','PUN','PU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(436,1,99,0,'Rajasthan','RAJ','RA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(437,1,99,0,'Sikkim','SIK','SI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(438,1,99,0,'Tamil Nadu','TAM','TA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(439,1,99,0,'Tripura','TRI','TR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(440,1,99,0,'Uttaranchal','UAR','UA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(441,1,99,0,'Uttar Pradesh','UTT','UT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(442,1,99,0,'West Bengal','WES','WE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(443,1,101,0,'Ahmadi va Kohkiluyeh','BOK','BO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(444,1,101,0,'Ardabil','ARD','AR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(445,1,101,0,'Azarbayjan-e Gharbi','AZG','AG',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(446,1,101,0,'Azarbayjan-e Sharqi','AZS','AS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(447,1,101,0,'Bushehr','BUS','BU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(448,1,101,0,'Chaharmahal va Bakhtiari','CMB','CM',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(449,1,101,0,'Esfahan','ESF','ES',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(450,1,101,0,'Fars','FAR','FA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(451,1,101,0,'Gilan','GIL','GI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(452,1,101,0,'Gorgan','GOR','GO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(453,1,101,0,'Hamadan','HAM','HA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(454,1,101,0,'Hormozgan','HOR','HO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(455,1,101,0,'Ilam','ILA','IL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(456,1,101,0,'Kerman','KER','KE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(457,1,101,0,'Kermanshah','BAK','BA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(458,1,101,0,'Khorasan-e Junoubi','KHJ','KJ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(459,1,101,0,'Khorasan-e Razavi','KHR','KR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(460,1,101,0,'Khorasan-e Shomali','KHS','KS',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(461,1,101,0,'Khuzestan','KHU','KH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(462,1,101,0,'Kordestan','KOR','KO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(463,1,101,0,'Lorestan','LOR','LO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(464,1,101,0,'Markazi','MAR','MR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(465,1,101,0,'Mazandaran','MAZ','MZ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(466,1,101,0,'Qazvin','QAS','QA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(467,1,101,0,'Qom','QOM','QO',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(468,1,101,0,'Semnan','SEM','SE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(469,1,101,0,'Sistan va Baluchestan','SBA','SB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(470,1,101,0,'Tehran','TEH','TE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(471,1,101,0,'Yazd','YAZ','YA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(472,1,101,0,'Zanjan','ZAN','ZA',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(535,1,84,0,'ΛΕΥΚΑΔΑΣ','ΛΕΥ','ΛΕ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(532,1,84,0,'ΛΑΡΙΣΑΣ','ΛΑΡ','ΛΡ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(504,1,84,0,'ΑΡΚΑΔΙΑΣ','ΑΡΚ','ΑΚ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(503,1,84,0,'ΑΡΓΟΛΙΔΑΣ','ΑΡΓ','ΑΡ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(533,1,84,0,'ΛΑΣΙΘΙΟΥ','ΛΑΣ','ΛΑ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(534,1,84,0,'ΛΕΣΒΟΥ','ΛΕΣ','ΛΣ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(530,1,84,0,'ΚΥΚΛΑΔΩΝ','ΚΥΚ','ΚΥ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(553,1,84,0,'ΑΙΤΩΛΟΑΚΑΡΝΑΝΙΑΣ','ΑΙΤ','ΑΙ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(529,1,84,0,'ΚΟΡΙΝΘΙΑΣ','ΚΟΡ','ΚΟ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(531,1,84,0,'ΛΑΚΩΝΙΑΣ','ΛΑΚ','ΛK',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(517,1,84,0,'ΗΜΑΘΙΑΣ','ΗΜΑ','ΗΜ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(518,1,84,0,'ΗΡΑΚΛΕΙΟΥ','ΗΡΑ','ΗΡ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(519,1,84,0,'ΘΕΣΠΡΩΤΙΑΣ','ΘΕΠ','ΘΠ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(520,1,84,0,'ΘΕΣΣΑΛΟΝΙΚΗΣ','ΘΕΣ','ΘΕ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(521,1,84,0,'ΙΩΑΝΝΙΝΩΝ','ΙΩΑ','ΙΩ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(522,1,84,0,'ΚΑΒΑΛΑΣ','ΚΑΒ','ΚΒ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(523,1,84,0,'ΚΑΡΔΙΤΣΑΣ','ΚΑΡ','ΚΡ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(524,1,84,0,'ΚΑΣΤΟΡΙΑΣ','ΚΑΣ','ΚΣ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(525,1,84,0,'ΚΕΡΚΥΡΑΣ','ΚΕΡ','ΚΕ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(526,1,84,0,'ΚΕΦΑΛΛΗΝΙΑΣ','ΚΕΦ','ΚΦ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(527,1,84,0,'ΚΙΛΚΙΣ','ΚΙΛ','ΚΙ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(528,1,84,0,'ΚΟΖΑΝΗΣ','ΚΟΖ','ΚZ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(507,1,84,0,'ΑΧΑΪΑΣ','ΑΧΑ','ΑΧ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(508,1,84,0,'ΒΟΙΩΤΙΑΣ','ΒΟΙ','ΒΟ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(509,1,84,0,'ΓΡΕΒΕΝΩΝ','ΓΡΕ','ΓΡ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(510,1,84,0,'ΔΡΑΜΑΣ','ΔΡΑ','ΔΡ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(511,1,84,0,'ΔΩΔΕΚΑΝΗΣΟΥ','ΔΩΔ','ΔΩ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(512,1,84,0,'ΕΒΡΟΥ','ΕΒΡ','ΕΒ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(513,1,84,0,'ΕΥΒΟΙΑΣ','ΕΥΒ','ΕΥ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(514,1,84,0,'ΕΥΡΥΤΑΝΙΑΣ','ΕΥΡ','ΕΡ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(515,1,84,0,'ΖΑΚΥΝΘΟΥ','ΖΑΚ','ΖΑ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(516,1,84,0,'ΗΛΕΙΑΣ','ΗΛΕ','ΗΛ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(505,1,84,0,'ΑΡΤΑΣ','ΑΡΤ','ΑΑ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(506,1,84,0,'ΑΤΤΙΚΗΣ','ΑΤΤ','ΑΤ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(536,1,84,0,'ΜΑΓΝΗΣΙΑΣ','ΜΑΓ','ΜΑ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(537,1,84,0,'ΜΕΣΣΗΝΙΑΣ','ΜΕΣ','ΜΕ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(538,1,84,0,'ΞΑΝΘΗΣ','ΞΑΝ','ΞΑ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(539,1,84,0,'ΠΕΛΛΗΣ','ΠΕΛ','ΠΕ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(540,1,84,0,'ΠΙΕΡΙΑΣ','ΠΙΕ','ΠΙ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(541,1,84,0,'ΠΡΕΒΕΖΑΣ','ΠΡΕ','ΠΡ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(542,1,84,0,'ΡΕΘΥΜΝΗΣ','ΡΕΘ','ΡΕ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(543,1,84,0,'ΡΟΔΟΠΗΣ','ΡΟΔ','ΡΟ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(544,1,84,0,'ΣΑΜΟΥ','ΣΑΜ','ΣΑ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(545,1,84,0,'ΣΕΡΡΩΝ','ΣΕΡ','ΣΕ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(546,1,84,0,'ΤΡΙΚΑΛΩΝ','ΤΡΙ','ΤΡ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(547,1,84,0,'ΦΘΙΩΤΙΔΑΣ','ΦΘΙ','ΦΘ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(548,1,84,0,'ΦΛΩΡΙΝΑΣ','ΦΛΩ','ΦΛ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(549,1,84,0,'ΦΩΚΙΔΑΣ','ΦΩΚ','ΦΩ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(550,1,84,0,'ΧΑΛΚΙΔΙΚΗΣ','ΧΑΛ','ΧΑ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(551,1,84,0,'ΧΑΝΙΩΝ','ΧΑΝ','ΧΝ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(552,1,84,0,'ΧΙΟΥ','ΧΙΟ','ΧΙ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(569,1,81,0,'Schleswig-Holstein','SHO','SH',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(554,1,81,0,'Freie und Hansestadt Hamburg','HAM','HH',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(555,1,81,0,'Niedersachsen','NIS','NI',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(556,1,81,0,'Freie Hansestadt Bremen','HBR','HB',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(557,1,81,0,'Nordrhein-Westfalen','NRW','NW',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(558,1,81,0,'Hessen','HES','HE',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(559,1,81,0,'Rheinland-Pfalz','RLP','RP',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(560,1,81,0,'Baden-Württemberg','BWÜ','BW',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(561,1,81,0,'Freistaat Bayern','BAV','BY',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(562,1,81,0,'Saarland','SLA','SL',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(563,1,81,0,'Berlin','BER','BE',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(564,1,81,0,'Brandenburg','BRB','BB',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(565,1,81,0,'Mecklenburg-Vorpommern','MVO','MV',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(566,1,81,0,'Freistaat Sachsen','SAC','SN',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(567,1,81,0,'Sachsen-Anhalt','SAA','ST',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(568,1,81,0,'Freistaat Thüringen','THÜ','TH',0,1,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(570,1,176,0,'Адыгея Республика','AD','01',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(571,1,176,0,'Алтай Республика','AL','04',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(572,1,176,0,'Алтайский край','ALT','22',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(573,1,176,0,'Амурская область','AMU','28',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(574,1,176,0,'Архангельская область','ARK','29',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(575,1,176,0,'Астраханская область','AST','30',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(576,1,176,0,'Башкортостан Республика','BA','02',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(577,1,176,0,'Белгородская область','BEL','31',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(578,1,176,0,'Брянская область','BRY','32',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(579,1,176,0,'Бурятия Республика','BU','03',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(580,1,176,0,'Владимирская область','VLA','33',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(581,1,176,0,'Волгоградская область','VGG','34',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(582,1,176,0,'Вологодская область','VLG','35',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(583,1,176,0,'Воронежская область','VOR','36',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(584,1,176,0,'Дагестан Республика','DA','05',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(585,1,176,0,'Еврейская автономная область','YEV','79',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(586,1,176,0,'Забайкальский край','ZAB','75',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(587,1,176,0,'Ивановская область','IVA','37',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(588,1,176,0,'Ингушетия Республика','IN','06',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(589,1,176,0,'Иркутская область','IRK','38',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(590,1,176,0,'Кабардино-Балкарская Республика','KB','07',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(591,1,176,0,'Калининградская область','KGD','39',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(592,1,176,0,'Калмыкия Республика','KL','08',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(593,1,176,0,'Калужская область','KLU','40',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(594,1,176,0,'Камчатский край','KAM','41',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(595,1,176,0,'Карачаево-Черкесская Республика','KC','09',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(596,1,176,0,'Карелия Республика','KR','10',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(597,1,176,0,'Кемеровская область','KEM','42',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(598,1,176,0,'Кировская область','KIR','43',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(599,1,176,0,'Коми Республика','KO','11',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(600,1,176,0,'Костромская область','KOS','44',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(601,1,176,0,'Краснодарский край','KDA','23',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(602,1,176,0,'Красноярский край','KIA','24',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(603,1,176,0,'Курганская область','KGN','45',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(604,1,176,0,'Курская область','KRS','46',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(605,1,176,0,'Ленинградская область','LEN','47',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(606,1,176,0,'Липецкая область','LIP','48',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(607,1,176,0,'Магаданская область','MAG','49',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(608,1,176,0,'Марий Эл Республика','ME','12',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(609,1,176,0,'Мордовия Республика','MO','13',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(610,1,176,0,'Москва','MOW','77',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(611,1,176,0,'Московская область','MOS','50',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(612,1,176,0,'Мурманская область','MUR','51',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(613,1,176,0,'Ненецкий автономный округ','NEN','83',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(614,1,176,0,'Нижегородская область','NIZ','52',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(615,1,176,0,'Новгородская область','NGR','53',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(616,1,176,0,'Новосибирская область','NVS','54',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(617,1,176,0,'Омская область','OMS','55',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(618,1,176,0,'Оренбургская область','ORE','56',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(619,1,176,0,'Орловская область','ORL','57',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(620,1,176,0,'Пензенская область','PNZ','58',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(621,1,176,0,'Пермский край','PER','59',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(622,1,176,0,'Приморский край','PRI','25',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(623,1,176,0,'Псковская область','PSK','60',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(624,1,176,0,'Ростовская область','ROS','61',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(625,1,176,0,'Рязанская область','RYA','62',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(626,1,176,0,'Самарская область','SAM','63',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(627,1,176,0,'Санкт-Петербург','SPE','78',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(628,1,176,0,'Саратовская область','SAR','64',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(629,1,176,0,'Саха (Якутия) Республика','SA','14',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(630,1,176,0,'Сахалинская область','SAK','65',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(631,1,176,0,'Свердловская область','SVE','66',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(632,1,176,0,'Северная Осетия-Алания Республика','SE','15',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(633,1,176,0,'Смоленская область','SMO','67',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(634,1,176,0,'Ставропольский край','STA','26',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(635,1,176,0,'Тамбовская область','TAM','68',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(636,1,176,0,'Татарстан Республика','TA','16',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(637,1,176,0,'Тверская область','TVE','69',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(638,1,176,0,'Томская область','TOM','70',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(639,1,176,0,'Тульская область','TUL','71',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(640,1,176,0,'Тыва Республика','TY','17',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(641,1,176,0,'Тюменская область','TYU','72',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(642,1,176,0,'Удмуртская Республика','UD','18',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(643,1,176,0,'Ульяновская область','ULY','73',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(644,1,176,0,'Хакасия Республика','KK','19',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(645,1,176,0,'Челябинская область','CHE','74',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(646,1,176,0,'Чеченская Республика','CE','20',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(647,1,176,0,'Чувашская Республика','CU','21',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(648,1,176,0,'Чукотский автономный округ','CHU','87',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(649,1,176,0,'Хабаровский край','KHA','27',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(650,1,176,0,'Ханты-Мансийский автономный округ','KHM','86',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(651,1,176,0,'Ямало-Ненецкий автономный округ','YAN','89',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(652,1,176,0,'Ярославская область','YAR','76',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(653,1,209,0,'กระบี่','กบ','กบ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(654,1,209,0,'กรุงเทพมหานคร','กทม','กท',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(655,1,209,0,'กาญจนบุรี','กจ','กจ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(656,1,209,0,'กาฬสินธุ์','กส','กส',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(657,1,209,0,'กำแพงเพชร','กพ','กพ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(658,1,209,0,'ขอนแก่น','ขก','ขก',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(659,1,209,0,'จันทบุรี','จบ','จบ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(660,1,209,0,'ฉะเชิงเทรา','ฉช','ฉช',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(661,1,209,0,'ชลบุรี','ชบ','ชบ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(662,1,209,0,'ชัยนาท','ชน','ชน',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(663,1,209,0,'ชัยภูมิ','ชย','ชย',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(664,1,209,0,'ชุมพร','ชพ','ชพ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(665,1,209,0,'เชียงราย','ชร','ชร',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(666,1,209,0,'เชียงใหม่','ชม','ชม',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(667,1,209,0,'ตรัง','ตง','ตง',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(668,1,209,0,'ตราด','ตร','ตร',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(669,1,209,0,'ตาก','ตก','ตก',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(670,1,209,0,'นครนายก','นย','นย',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(671,1,209,0,'นครปฐม','นฐ','นฐ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(672,1,209,0,'นครพนม','นพ','นพ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(673,1,209,0,'นครราชสีมา','นม','นม',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(674,1,209,0,'นครศรีธรรมราช','นศ','นศ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(675,1,209,0,'นครสวรรค์','นว','นว',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(676,1,209,0,'นนทบุรี','นบ','นบ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(677,1,209,0,'นราธิวาส','นธ','นธ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(678,1,209,0,'น่าน','นน','นน',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(679,1,209,0,'บุรีรัมย์','บร','บร',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(680,1,209,0,'บึงกาฬ','บก','บก',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(681,1,209,0,'ปทุมธานี','ปท','ปท',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(682,1,209,0,'ประจวบคีรีขันธ์','ปข','ปข',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(683,1,209,0,'ปราจีนบุรี','ปจ','ปจ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(684,1,209,0,'ปัตตานี','ปน','ปน',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(685,1,209,0,'พระนครศรีอยุธยา','อย','อย',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(686,1,209,0,'พังงา','พง','พง',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(687,1,209,0,'พัทลุง','พท','พท',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(688,1,209,0,'พิจิตร','พจ','พจ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(689,1,209,0,'พิษณุโลก','พล','พล',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(690,1,209,0,'เพชรบุรี','พบ','พบ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(691,1,209,0,'เพชรบูรณ์','พช','พช',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(692,1,209,0,'แพร่','พร','พร',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(693,1,209,0,'พะเยา','พย','พย',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(694,1,209,0,'ภูเก็ต','ภก','ภก',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(695,1,209,0,'มหาสารคาม','มค','มค',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(696,1,209,0,'แม่ฮ่องสอน','มส','มส',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(697,1,209,0,'มุกดาหาร','มห','มห',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(698,1,209,0,'ยะลา','ยล','ยล',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(699,1,209,0,'ยโสธร','ยส','ยส',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(700,1,209,0,'ร้อยเอ็ด','รอ','รอ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(701,1,209,0,'ระนอง','รน','รน',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(702,1,209,0,'ระยอง','รย','รย',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(703,1,209,0,'ราชบุรี','รบ','รบ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(704,1,209,0,'ลพบุรี','ลบ','ลบ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(705,1,209,0,'ลำปาง','ลป','ลป',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(706,1,209,0,'ลำพูน','ลพ','ลพ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(707,1,209,0,'เลย','ลย','ลย',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(708,1,209,0,'ศรีสะเกษ','ศก','ศก',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(709,1,209,0,'สกลนคร','สน','สน',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(710,1,209,0,'สงขลา','สข','สข',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(711,1,209,0,'สตูล','สต','สต',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(712,1,209,0,'สมุทรปราการ','สป','สป',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(713,1,209,0,'สมุทรสงคราม','สส','สส',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(714,1,209,0,'สมุทรสาคร','สค','สค',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(715,1,209,0,'สระบุรี','สบ','สบ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(716,1,209,0,'สระแก้ว','สก','สก',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(717,1,209,0,'สิงห์บุรี','สห','สห',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(718,1,209,0,'สุโขทัย','สท','สท',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(719,1,209,0,'สุพรรณบุรี','สพ','สพ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(720,1,209,0,'สุราษฎร์ธานี','สฎ','สฎ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(721,1,209,0,'สุรินทร์','สร','สร',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(722,1,209,0,'หนองคาย','นค','นค',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(723,1,209,0,'หนองบัวลำภู','นภ','นภ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(724,1,209,0,'อ่างทอง','อท','อท',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(725,1,209,0,'อุดรธานี','อด','อด',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(726,1,209,0,'อุตรดิตถ์','อต','อต',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(727,1,209,0,'อุทัยธานี','อน','อน',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(728,1,209,0,'อุบลราชธานี','อบ','อบ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(729,1,209,0,'อำนาจเจริญ','อจ','อจ',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(730,1,150,0,'Drenthe','DR','DR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(731,1,150,0,'Flevoland','FLV','FL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(732,1,150,0,'Friesland','FR','FR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(733,1,150,0,'Gelderland','GLD','GL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(734,1,150,0,'Groningen','GR','GR',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(735,1,150,0,'Limburg','LB','LB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(736,1,150,0,'Noord-Brabant','NB','NB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(737,1,150,0,'Noord-Holland','NH','NH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(738,1,150,0,'Overijssel','OVR','OV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(739,1,150,0,'Utrecht','UT','UT',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(740,1,150,0,'Zuid-Holland','ZH','ZH',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(741,1,150,0,'Zeeland','ZL','ZL',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(742,1,21,0,'Antwerpen','ant','AW',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(743,1,21,0,'Limburg','lim','LI',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(744,1,21,0,'Oost-Vlaanderen','ov','OV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(745,1,21,0,'Vlaams-Brabant','vb','VB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(746,1,21,0,'West-Vlaanderen','wv','WV',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(747,1,21,0,'Waals-Brabant (Brabant wallon)','wb','WB',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(748,1,21,0,'Henegouwen (Hainaut),','he','HE',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(749,1,21,0,'Luik (Liège/Lüttich)','lui','LU',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(750,1,21,0,'Luxemburg (Luxembourg)','lux','LX',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(751,1,215,0,'Adana','ADN','01',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(752,1,215,0,'Adıyaman','ADY','02',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(753,1,215,0,'Afyon','AFN','03',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(754,1,215,0,'Ağrı','AGR','04',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(755,1,215,0,'Amasya','AMS','05',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(756,1,215,0,'Ankara','ANK','06',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(757,1,215,0,'Antalya','ANT','07',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(758,1,215,0,'Artvin','ART','08',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(759,1,215,0,'Aydın','AYD','09',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(760,1,215,0,'Balıkesir','BLK','10',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(761,1,215,0,'Bilecik','BLC','11',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(762,1,215,0,'Bingöl','BIN','12',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(763,1,215,0,'Bitlis','BIT','13',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(764,1,215,0,'Bolu','BOL','14',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(765,1,215,0,'Burdur','DRD','15',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(766,1,215,0,'Bursa','BUR','16',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(767,1,215,0,'Çanakkale','CNK','17',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(768,1,215,0,'Çankırı','CAK','18',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(769,1,215,0,'Çorum','COR','19',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(770,1,215,0,'Denizli','DEN','20',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(771,1,215,0,'Diyarbakır','DYB','21',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(772,1,215,0,'Edirne','EDR','22',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(773,1,215,0,'Elazığ','ELZ','23',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(774,1,215,0,'Erzincan','ERN','24',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(775,1,215,0,'Erzurum','ERZ','25',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(776,1,215,0,'Eskişehir','ESK','26',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(777,1,215,0,'Gaziantep','GZA','27',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(778,1,215,0,'Giresun','GRS','28',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(779,1,215,0,'Gümüşhane','GMH','29',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(780,1,215,0,'Hakkari','HKK','30',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(781,1,215,0,'Hatay','HTY','31',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(782,1,215,0,'Isparta','ISP','32',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(783,1,215,0,'İçel (Mersin)','ICE','33',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(784,1,215,0,'İstanbul','IST','34',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(785,1,215,0,'İzmir','IZM','35',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(786,1,215,0,'Kars','KRS','36',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(787,1,215,0,'Kastamonu','KST','37',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(788,1,215,0,'Kayseri','KYS','38',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(789,1,215,0,'Kırklareli','KIR','39',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(790,1,215,0,'Kırşehir','KIS','40',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(791,1,215,0,'Kocaeli','KCL','41',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(792,1,215,0,'Konya','KNY','42',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(793,1,215,0,'Kütahya','KTH','43',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(794,1,215,0,'Malatya','MLT','44',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(795,1,215,0,'Manisa','MNS','45',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(796,1,215,0,'K.maraş','KAH','46',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(797,1,215,0,'Mardin','MRD','47',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(798,1,215,0,'Muğla','MGL','48',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(799,1,215,0,'Muş','MUS','49',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(800,1,215,0,'Nevşehir','NEV','50',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(801,1,215,0,'Niğde','NIG','51',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(802,1,215,0,'Ordu','ORD','52',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(803,1,215,0,'Rize','RIZ','53',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(804,1,215,0,'Sakarya','SKR','54',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(805,1,215,0,'Samsun','SMS','55',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(806,1,215,0,'Siirt','SRT','56',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(807,1,215,0,'Sinop','SNP','57',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(808,1,215,0,'Sivas','SVS','58',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(809,1,215,0,'Tekirdağ','TKR','59',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(810,1,215,0,'Tokat','TKT','60',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(811,1,215,0,'Trabzon','TRZ','61',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(812,1,215,0,'Tunceli','TUN','62',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(813,1,215,0,'Şanlıurfa','SNF','63',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(814,1,215,0,'Uşak','USK','64',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(815,1,215,0,'Van','VAN','65',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(816,1,215,0,'Yozgat','YZT','66',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(817,1,215,0,'Zonguldak','ZNG','67',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(818,1,215,0,'Aksaray','AKS','68',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(819,1,215,0,'Bayburt','BYB','69',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(820,1,215,0,'Karaman','KRM','70',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(821,1,215,0,'Kırıkkale','KRK','71',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(822,1,215,0,'Batman','BTM','72',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(823,1,215,0,'Şırnak','SRK','73',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(824,1,215,0,'Bartın','BRT','74',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(825,1,215,0,'Ardahan','ARH','75',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(826,1,215,0,'Iğdır','IGD','76',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(827,1,215,0,'Yalova','TLV','77',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(828,1,215,0,'Karabük','KRB','78',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(829,1,215,0,'Kilis','KLS','79',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(830,1,215,0,'Osmaniye','OSM','80',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(831,1,215,0,'Düzce','DZC','81',0,1,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_userfield_values`
--

DROP TABLE IF EXISTS `j_virtuemart_userfield_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_userfield_values` (
  `virtuemart_userfield_value_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_userfield_id` int(1) unsigned NOT NULL DEFAULT '0',
  `fieldtitle` varchar(255) NOT NULL DEFAULT '',
  `fieldvalue` varchar(255) NOT NULL DEFAULT '',
  `sys` tinyint(4) NOT NULL DEFAULT '0',
  `ordering` int(1) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_userfield_value_id`),
  KEY `virtuemart_userfield_id` (`virtuemart_userfield_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='Holds the different values for dropdown and radio lists';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_userfield_values`
--

LOCK TABLES `j_virtuemart_userfield_values` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_userfield_values` DISABLE KEYS */;
INSERT INTO `j_virtuemart_userfield_values` VALUES (1,23,'COM_VIRTUEMART_SHOPPER_TITLE_MR','Mr',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(2,23,'COM_VIRTUEMART_SHOPPER_TITLE_MRS','Mrs',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(3,51,'None','',0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(4,51,'Non-resident (Canada)','R',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(5,51,'Federal government (United States)','A',0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(6,51,'State government (United States)','B',0,2,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(7,51,'Tribe / Status Indian / Indian Band (both)','C',0,3,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(8,51,'Foreign diplomat (both)','D',0,4,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(9,51,'Charitable or benevolent org (both)','E',0,5,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(10,51,'Religious or educational org (both)','F',0,6,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(11,51,'Resale (both)','G',0,7,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(12,51,'Commercial agricultural production (both)','H',0,8,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(13,51,'Industrial production / manufacturer (both)','I',0,9,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(14,51,'Direct pay permit (United States)','J',0,10,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(15,51,'Direct mail (United States)','K',0,11,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(16,51,'Other (both)','L',0,12,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(17,51,'Local government (United States)','N',0,13,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(18,51,'Commercial aquaculture (Canada)','P',0,14,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(19,51,'Commercial Fishery (Canada)','Q',0,15,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_userfield_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_userfields`
--

DROP TABLE IF EXISTS `j_virtuemart_userfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_userfields` (
  `virtuemart_userfield_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '1',
  `userfield_jplugin_id` int(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(2048) DEFAULT NULL,
  `type` varchar(70) NOT NULL DEFAULT '',
  `maxlength` int(1) DEFAULT NULL,
  `size` int(1) DEFAULT NULL,
  `required` tinyint(4) NOT NULL DEFAULT '0',
  `cols` int(1) DEFAULT NULL,
  `rows` int(1) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `default` varchar(255) DEFAULT NULL,
  `registration` tinyint(1) NOT NULL DEFAULT '0',
  `shipment` tinyint(1) NOT NULL DEFAULT '0',
  `account` tinyint(1) NOT NULL DEFAULT '1',
  `cart` tinyint(1) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  `calculated` tinyint(1) NOT NULL DEFAULT '0',
  `sys` tinyint(4) NOT NULL DEFAULT '0',
  `userfield_params` varchar(17000) NOT NULL DEFAULT '',
  `ordering` int(1) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_userfield_id`),
  UNIQUE KEY `name` (`name`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `ordering` (`ordering`),
  KEY `shared` (`shared`),
  KEY `published` (`published`),
  KEY `account` (`account`),
  KEY `shipment` (`shipment`),
  KEY `cart` (`cart`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='Holds the fields for the user information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_userfields`
--

LOCK TABLES `j_virtuemart_userfields` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_userfields` DISABLE KEYS */;
INSERT INTO `j_virtuemart_userfields` VALUES (5,0,0,'email','COM_VIRTUEMART_REGISTER_EMAIL','','emailaddress',100,30,1,NULL,NULL,NULL,NULL,1,0,1,0,0,0,1,'',4,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(6,0,0,'name','COM_VIRTUEMART_USER_DISPLAYED_NAME','','text',25,30,1,0,0,'',NULL,1,0,1,0,0,0,1,'',8,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(7,0,0,'username','COM_VIRTUEMART_USERNAME','','text',25,30,1,0,0,'',NULL,1,0,1,0,0,0,1,'',6,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(8,0,0,'password','COM_VIRTUEMART_SHOPPER_FORM_PASSWORD_1','','password',25,30,1,NULL,NULL,NULL,NULL,1,0,1,0,0,0,1,'',10,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(9,0,0,'password2','COM_VIRTUEMART_SHOPPER_FORM_PASSWORD_2','','password',25,30,1,NULL,NULL,NULL,NULL,1,0,1,0,0,0,1,'',12,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(15,0,0,'agreed','COM_VIRTUEMART_I_AGREE_TO_TOS','','checkbox',NULL,NULL,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,1,'',13,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(16,0,0,'tos','COM_VIRTUEMART_STORE_FORM_TOS','','custom',NULL,NULL,0,NULL,NULL,NULL,NULL,0,0,0,1,0,0,1,'',14,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(17,0,0,'customer_note','COM_VIRTUEMART_CNOTES_CART','','textarea',2500,NULL,0,60,1,NULL,NULL,0,0,0,1,0,0,1,'',13,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(20,0,0,'address_type_name','COM_VIRTUEMART_USER_FORM_ADDRESS_LABEL','','text',32,30,0,NULL,NULL,NULL,'COM_VIRTUEMART_USER_FORM_ST_LABEL',0,1,0,0,0,0,1,'',16,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(21,0,0,'delimiter_billto','COM_VIRTUEMART_USER_FORM_BILLTO_LBL','','delimiter',25,30,0,NULL,NULL,NULL,NULL,1,0,1,0,0,0,0,'',18,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(22,0,0,'company','COM_VIRTUEMART_SHOPPER_FORM_COMPANY_NAME','','text',64,30,0,NULL,NULL,NULL,NULL,1,1,1,0,0,0,1,'',20,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(23,0,0,'title','COM_VIRTUEMART_SHOPPER_FORM_TITLE','','select',0,210,0,NULL,NULL,NULL,NULL,1,0,1,0,0,0,1,'',22,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(24,0,0,'first_name','COM_VIRTUEMART_SHOPPER_FORM_FIRST_NAME','','text',32,30,1,NULL,NULL,NULL,NULL,1,1,1,0,0,0,1,'',24,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(25,0,0,'middle_name','COM_VIRTUEMART_SHOPPER_FORM_MIDDLE_NAME','','text',32,30,0,NULL,NULL,NULL,NULL,1,1,1,0,0,0,1,'',26,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(26,0,0,'last_name','COM_VIRTUEMART_SHOPPER_FORM_LAST_NAME','','text',32,30,0,NULL,NULL,NULL,NULL,1,1,1,0,0,0,1,'',28,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(27,0,0,'address_1','COM_VIRTUEMART_SHOPPER_FORM_ADDRESS_1','','text',64,30,1,NULL,NULL,NULL,NULL,1,1,1,0,0,0,1,'',30,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(28,0,0,'address_2','COM_VIRTUEMART_SHOPPER_FORM_ADDRESS_2','','text',64,30,0,NULL,NULL,NULL,NULL,1,1,1,0,0,0,1,'',32,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(29,0,0,'zip','COM_VIRTUEMART_SHOPPER_FORM_ZIP','','text',32,30,0,NULL,NULL,NULL,NULL,1,1,1,0,0,0,1,'',34,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(35,0,0,'city','COM_VIRTUEMART_SHOPPER_FORM_CITY','','text',32,30,0,NULL,NULL,NULL,NULL,1,1,1,0,0,0,1,'',36,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(36,0,0,'virtuemart_country_id','COM_VIRTUEMART_SHOPPER_FORM_COUNTRY','','select',0,210,0,NULL,NULL,NULL,NULL,1,1,1,0,0,0,1,'',38,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(37,0,0,'virtuemart_state_id','COM_VIRTUEMART_SHOPPER_FORM_STATE','','select',0,210,0,NULL,NULL,NULL,NULL,1,1,1,0,0,0,1,'',40,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(38,0,0,'phone_1','COM_VIRTUEMART_SHOPPER_FORM_PHONE','','text',32,30,0,NULL,NULL,NULL,NULL,1,1,1,0,0,0,1,'',42,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(39,0,0,'phone_2','COM_VIRTUEMART_SHOPPER_FORM_PHONE2','','text',32,30,0,NULL,NULL,NULL,NULL,1,1,1,0,0,0,1,'',44,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(40,0,0,'fax','COM_VIRTUEMART_SHOPPER_FORM_FAX','','text',32,30,0,NULL,NULL,NULL,NULL,1,1,1,0,0,0,1,'',46,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(41,0,0,'delimiter_sendregistration','COM_VIRTUEMART_BUTTON_SEND_REG','','delimiter',25,30,0,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,'',2,0,1,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(42,0,0,'delimiter_userinfo','COM_VIRTUEMART_ORDER_PRINT_CUST_INFO_LBL','','delimiter',NULL,NULL,0,NULL,NULL,NULL,NULL,1,0,1,0,0,0,0,'',14,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(50,0,0,'tax_exemption_number','COM_VIRTUEMART_SHOPPER_FORM_TAXEXEMPTION_NBR','Vendors can set here a tax exemption number for a shopper. This field is only changeable by administrators.','text',10,0,0,0,0,NULL,NULL,0,0,1,1,0,0,0,'',48,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0),(51,0,0,'tax_usage_type','COM_VIRTUEMART_SHOPPER_FORM_TAX_USAGE','Federal, national, educational, public, or similar often get a special tax. This field is only writable by administrators.','select',0,0,0,0,0,NULL,NULL,0,0,1,1,0,0,0,'',50,0,0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_userfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_userinfos`
--

DROP TABLE IF EXISTS `j_virtuemart_userinfos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_userinfos` (
  `virtuemart_userinfo_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_user_id` int(1) unsigned NOT NULL DEFAULT '0',
  `address_type` char(2) NOT NULL DEFAULT '',
  `address_type_name` varchar(32) NOT NULL DEFAULT '',
  `company` varchar(64) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `last_name` varchar(96) DEFAULT NULL,
  `first_name` varchar(96) DEFAULT NULL,
  `middle_name` varchar(96) DEFAULT NULL,
  `phone_1` varchar(32) DEFAULT NULL,
  `phone_2` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `address_1` varchar(96) NOT NULL DEFAULT '',
  `address_2` varchar(64) DEFAULT NULL,
  `city` varchar(96) NOT NULL DEFAULT '',
  `virtuemart_state_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_country_id` smallint(1) unsigned NOT NULL DEFAULT '0',
  `zip` varchar(32) NOT NULL DEFAULT '',
  `agreed` tinyint(1) NOT NULL DEFAULT '0',
  `tos` tinyint(1) NOT NULL DEFAULT '0',
  `customer_note` varchar(5000) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_userinfo_id`),
  KEY `i_virtuemart_user_id` (`virtuemart_userinfo_id`,`virtuemart_user_id`),
  KEY `virtuemart_user_id` (`virtuemart_user_id`,`address_type`),
  KEY `address_type` (`address_type`),
  KEY `address_type_name` (`address_type_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Customer Information, BT = BillTo and ST = ShipTo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_userinfos`
--

LOCK TABLES `j_virtuemart_userinfos` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_userinfos` DISABLE KEYS */;
INSERT INTO `j_virtuemart_userinfos` VALUES (1,833,'BT','','Sample Company','Mr','John','Doe','','555-555-555','','','PO Box 123','','Seattle',48,223,'98101',0,0,'','2017-01-24 18:34:27',833,'2017-01-24 18:40:31',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_userinfos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_vendor_medias`
--

DROP TABLE IF EXISTS `j_virtuemart_vendor_medias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_vendor_medias` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_media_id` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`,`virtuemart_media_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_vendor_medias`
--

LOCK TABLES `j_virtuemart_vendor_medias` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_vendor_medias` DISABLE KEYS */;
INSERT INTO `j_virtuemart_vendor_medias` VALUES (1,1,1,1);
/*!40000 ALTER TABLE `j_virtuemart_vendor_medias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_vendor_users`
--

DROP TABLE IF EXISTS `j_virtuemart_vendor_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_vendor_users` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_user_id` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`,`virtuemart_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_vendor_users`
--

LOCK TABLES `j_virtuemart_vendor_users` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_vendor_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_vendor_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_vendors`
--

DROP TABLE IF EXISTS `j_virtuemart_vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_vendors` (
  `virtuemart_vendor_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(64) DEFAULT NULL,
  `vendor_currency` int(1) DEFAULT NULL,
  `vendor_accepted_currencies` varchar(1536) NOT NULL DEFAULT '',
  `vendor_params` varchar(17000) NOT NULL DEFAULT '',
  `metarobot` varchar(20) DEFAULT NULL,
  `metaauthor` varchar(64) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_vendor_id`),
  KEY `vendor_name` (`vendor_name`),
  KEY `vendor_currency` (`vendor_currency`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Vendors manage their products in your store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_vendors`
--

LOCK TABLES `j_virtuemart_vendors` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_vendors` DISABLE KEYS */;
INSERT INTO `j_virtuemart_vendors` VALUES (1,'Sample Company',47,'52,26,47,144','max_cats_per_product=-1|vendor_min_pov=0|vendor_min_poq=1|vendor_freeshipment=0|vendor_address_format=\"\"|vendor_date_format=\"\"|vendor_letter_format=\"A4\"|vendor_letter_orientation=\"P\"|vendor_letter_margin_top=55|vendor_letter_margin_left=25|vendor_letter_margin_right=25|vendor_letter_margin_bottom=25|vendor_letter_margin_header=20|vendor_letter_margin_footer=20|vendor_letter_font=\"helvetica\"|vendor_letter_font_size=8|vendor_letter_header_font_size=7|vendor_letter_footer_font_size=6|vendor_letter_header=1|vendor_letter_header_line=1|vendor_letter_header_line_color=\"#000000\"|vendor_letter_header_image=\"1\"|vendor_letter_header_imagesize=60|vendor_letter_header_cell_height_ratio=1|vendor_letter_footer=1|vendor_letter_footer_line=1|vendor_letter_footer_line_color=\"#000000\"|vendor_letter_footer_cell_height_ratio=1|vendor_letter_add_tos=0|vendor_letter_add_tos_newpage=1|vendor_letter_for_product_pdf=0|vendor_mail_width=640|vendor_mail_header=1|vendor_mail_tos=1|vendor_mail_logo=1|vendor_mail_logo_width=200|vendor_mail_font=\"helvetica\"|vendor_mail_header_font_size=11|vendor_mail_font_size=12|vendor_mail_footer_font_size=10|','','','0000-00-00 00:00:00',0,'2017-01-24 18:34:27',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_vendors_en_gb`
--

DROP TABLE IF EXISTS `j_virtuemart_vendors_en_gb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_vendors_en_gb` (
  `virtuemart_vendor_id` int(1) unsigned NOT NULL,
  `vendor_store_desc` text NOT NULL,
  `vendor_terms_of_service` text NOT NULL,
  `vendor_legal_info` text NOT NULL,
  `vendor_letter_css` text NOT NULL,
  `vendor_letter_header_html` varchar(8000) NOT NULL DEFAULT '<h1>{vm:vendorname}</h1><p>{vm:vendoraddress}</p>',
  `vendor_letter_footer_html` varchar(8000) NOT NULL DEFAULT '<p>{vm:vendorlegalinfo}<br />Page {vm:pagenum}/{vm:pagecount}</p>',
  `vendor_store_name` varchar(180) NOT NULL DEFAULT '',
  `vendor_phone` varchar(26) NOT NULL DEFAULT '',
  `vendor_url` varchar(255) NOT NULL DEFAULT '',
  `metadesc` varchar(400) NOT NULL DEFAULT '',
  `metakey` varchar(400) NOT NULL DEFAULT '',
  `customtitle` varchar(255) NOT NULL DEFAULT '',
  `vendor_invoice_free1` varchar(255) NOT NULL DEFAULT '',
  `vendor_invoice_free2` varchar(255) NOT NULL DEFAULT '',
  `vendor_mail_free1` varchar(255) NOT NULL DEFAULT '',
  `vendor_mail_free2` varchar(255) NOT NULL DEFAULT '',
  `vendor_mail_css` varchar(255) NOT NULL DEFAULT '',
  `slug` varchar(192) NOT NULL DEFAULT '',
  PRIMARY KEY (`virtuemart_vendor_id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_vendors_en_gb`
--

LOCK TABLES `j_virtuemart_vendors_en_gb` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_vendors_en_gb` DISABLE KEYS */;
INSERT INTO `j_virtuemart_vendors_en_gb` VALUES (1,'<p>Welcome to VirtueMart the ecommerce managment system. The sample data give you a good insight of the possibilities with VirtueMart. The product description is directly the manual to configure the demonstrated features. \\n </p><p>You see here the store description used to describe your store. Check it out!</p> <p>We were established in 1869 in a time when getting good clothes was expensive, but the quality was good. Now that only a select few of those authentic clothes survive, we have dedicated this store to bringing the experience alive for collectors and master carrier everywhere.</p>','<h5>This is a demo store. Your orders will not proceed. You have not configured any terms of service yet. Click <a href=\"/administrator/index.php?option=com_virtuemart&view=user&task=editshop\">here</a> to change this text.</h5>','VAT-ID: XYZ-DEMO<br />Reg.Nr: DEMONUMBER','.vmdoc-header { }\n.vmdoc-footer { }\n','<h1>{vm:vendorname}</h1><p>{vm:vendoraddress}</p>','{vm:vendorlegalinfo}<br /> Page {vm:pagenum}/{vm:pagecount}','VirtueMart 3 Sample store','','http://cryptocoin.loc/','','','','','','','','','virtuemart-3-sample-store');
/*!40000 ALTER TABLE `j_virtuemart_vendors_en_gb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_vmuser_shoppergroups`
--

DROP TABLE IF EXISTS `j_virtuemart_vmuser_shoppergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_vmuser_shoppergroups` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_user_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_shoppergroup_id` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `virtuemart_user_id` (`virtuemart_user_id`,`virtuemart_shoppergroup_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='xref table for users to shopper group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_vmuser_shoppergroups`
--

LOCK TABLES `j_virtuemart_vmuser_shoppergroups` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_vmuser_shoppergroups` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_vmuser_shoppergroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_vmusers`
--

DROP TABLE IF EXISTS `j_virtuemart_vmusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_vmusers` (
  `virtuemart_user_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned NOT NULL DEFAULT '0',
  `user_is_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `customer_number` varchar(32) DEFAULT NULL,
  `virtuemart_paymentmethod_id` int(1) unsigned DEFAULT NULL,
  `virtuemart_shipmentmethod_id` int(1) unsigned DEFAULT NULL,
  `agreed` tinyint(1) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_user_id`),
  UNIQUE KEY `u_virtuemart_user_id` (`virtuemart_user_id`,`virtuemart_vendor_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`),
  KEY `user_is_vendor` (`user_is_vendor`)
) ENGINE=InnoDB AUTO_INCREMENT=834 DEFAULT CHARSET=utf8 COMMENT='Holds the unique user data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_vmusers`
--

LOCK TABLES `j_virtuemart_vmusers` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_vmusers` DISABLE KEYS */;
INSERT INTO `j_virtuemart_vmusers` VALUES (833,1,1,'AL2db814a',0,0,0,'2017-01-24 18:34:27',833,'2017-01-24 18:40:31',833,'0000-00-00 00:00:00',0);
/*!40000 ALTER TABLE `j_virtuemart_vmusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_waitingusers`
--

DROP TABLE IF EXISTS `j_virtuemart_waitingusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_waitingusers` (
  `virtuemart_waitinguser_id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_product_id` int(1) unsigned NOT NULL DEFAULT '0',
  `virtuemart_user_id` int(1) unsigned NOT NULL DEFAULT '0',
  `notify_email` varchar(150) NOT NULL DEFAULT '',
  `notified` tinyint(1) NOT NULL DEFAULT '0',
  `notify_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ordering` int(1) NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_waitinguser_id`),
  KEY `virtuemart_product_id` (`virtuemart_product_id`),
  KEY `notify_email` (`notify_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores notifications, users waiting f. products out of stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_waitingusers`
--

LOCK TABLES `j_virtuemart_waitingusers` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_waitingusers` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_waitingusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `j_virtuemart_worldzones`
--

DROP TABLE IF EXISTS `j_virtuemart_worldzones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `j_virtuemart_worldzones` (
  `virtuemart_worldzone_id` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `virtuemart_vendor_id` int(1) unsigned DEFAULT NULL,
  `zone_name` varchar(255) DEFAULT NULL,
  `zone_cost` decimal(10,2) DEFAULT NULL,
  `zone_limit` decimal(10,2) DEFAULT NULL,
  `zone_description` varchar(18000) DEFAULT NULL,
  `zone_tax_rate` int(1) unsigned NOT NULL DEFAULT '0',
  `ordering` int(1) NOT NULL DEFAULT '0',
  `shared` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(1) NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(1) NOT NULL DEFAULT '0',
  `locked_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `locked_by` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`virtuemart_worldzone_id`),
  KEY `virtuemart_vendor_id` (`virtuemart_vendor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='The Zones managed by the Zone Shipment Module';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `j_virtuemart_worldzones`
--

LOCK TABLES `j_virtuemart_worldzones` WRITE;
/*!40000 ALTER TABLE `j_virtuemart_worldzones` DISABLE KEYS */;
/*!40000 ALTER TABLE `j_virtuemart_worldzones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-31 23:04:13
