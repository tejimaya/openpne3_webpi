GRANT ALL PRIVILEGES ON *.* to 'PlaceHolderForUser'@'PlaceholderForServer' IDENTIFIED BY 'PlaceHolderForPassword';
CREATE DATABASE IF NOT EXISTS PlaceHolderForDb;
USE PlaceHolderForDb;

-- MySQL dump 10.13  Distrib 5.5.8, for osx10.6 (i386)
--
-- Host: localhost    Database: op36
-- ------------------------------------------------------
-- Server version	5.5.8

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
-- Table structure for table `activity_data`
--

DROP TABLE IF EXISTS `activity_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `in_reply_to_activity_id` int(11) DEFAULT NULL COMMENT 'Activity data id is in reply to',
  `body` varchar(140) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Activity body',
  `uri` text COLLATE utf8_unicode_ci COMMENT 'Activity URI',
  `public_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Public flag of activity',
  `is_pc` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Display this in PC?',
  `is_mobile` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Display this in Mobile?',
  `source` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'The source caption',
  `source_uri` text COLLATE utf8_unicode_ci COMMENT 'The source URI',
  `foreign_table` text COLLATE utf8_unicode_ci COMMENT 'Reference table name',
  `foreign_id` bigint(20) DEFAULT NULL COMMENT 'The id of reference table',
  `template` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Template name',
  `template_param` longtext COLLATE utf8_unicode_ci COMMENT 'Params for template',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `in_reply_to_activity_id_idx` (`in_reply_to_activity_id`),
  CONSTRAINT `activity_data_in_reply_to_activity_id_activity_data_id` FOREIGN KEY (`in_reply_to_activity_id`) REFERENCES `activity_data` (`id`) ON DELETE CASCADE,
  CONSTRAINT `activity_data_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves activities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_data`
--

LOCK TABLES `activity_data` WRITE;
/*!40000 ALTER TABLE `activity_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_image`
--

DROP TABLE IF EXISTS `activity_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `activity_data_id` int(11) NOT NULL COMMENT 'Activity data id',
  `mime_type` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT 'MIME type',
  `uri` text COLLATE utf8_unicode_ci COMMENT 'Image URI',
  `file_id` int(11) DEFAULT NULL COMMENT 'File id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_data_id_idx` (`activity_data_id`),
  KEY `file_id_idx` (`file_id`),
  CONSTRAINT `activity_image_activity_data_id_activity_data_id` FOREIGN KEY (`activity_data_id`) REFERENCES `activity_data` (`id`) ON DELETE CASCADE,
  CONSTRAINT `activity_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves image information of activity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_image`
--

LOCK TABLES `activity_image` WRITE;
/*!40000 ALTER TABLE `activity_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_user`
--

DROP TABLE IF EXISTS `admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `username` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Administrator''s username',
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Administrator''s password',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE_idx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations to login administration page';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_user`
--

LOCK TABLES `admin_user` WRITE;
/*!40000 ALTER TABLE `admin_user` DISABLE KEYS */;
INSERT INTO `admin_user` VALUES (1,'admin','5f4dcc3b5aa765d61d8327deb882cf99','2011-04-28 23:30:55','2011-04-28 23:30:55');
/*!40000 ALTER TABLE `admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `public_flag` tinyint(4) NOT NULL DEFAULT '1',
  `file_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `file_id_idx` (`file_id`),
  CONSTRAINT `album_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  CONSTRAINT `album_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `album_image`
--

DROP TABLE IF EXISTS `album_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `description` text,
  `filesize` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id_idx` (`album_id`),
  KEY `file_id_idx` (`file_id`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `album_image_album_id_album_id` FOREIGN KEY (`album_id`) REFERENCES `album` (`id`) ON DELETE CASCADE,
  CONSTRAINT `album_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  CONSTRAINT `album_image_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_image`
--

LOCK TABLES `album_image` WRITE;
/*!40000 ALTER TABLE `album_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `album_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `url` varchar(128) NOT NULL,
  `height` bigint(20) DEFAULT NULL,
  `scrolling` tinyint(1) NOT NULL DEFAULT '0',
  `singleton` tinyint(1) NOT NULL DEFAULT '1',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_pc` tinyint(1) NOT NULL DEFAULT '1',
  `is_mobile` tinyint(1) NOT NULL DEFAULT '0',
  `links` longtext,
  `consumer_key` varchar(16) NOT NULL DEFAULT '',
  `consumer_secret` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `application_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` VALUES (1,NULL,'http://labs.spicebox.jp/opensocial/apps/paypalbutton.xml',NULL,0,1,1,1,0,NULL,'','');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_invite`
--

DROP TABLE IF EXISTS `application_invite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_invite` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `application_id` bigint(20) NOT NULL,
  `to_member_id` int(11) NOT NULL,
  `from_member_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `application_id_idx` (`application_id`),
  KEY `to_member_id_idx` (`to_member_id`),
  KEY `from_member_id_idx` (`from_member_id`),
  CONSTRAINT `application_invite_application_id_application_id` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`) ON DELETE CASCADE,
  CONSTRAINT `application_invite_from_member_id_member_id` FOREIGN KEY (`from_member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  CONSTRAINT `application_invite_to_member_id_member_id` FOREIGN KEY (`to_member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_invite`
--

LOCK TABLES `application_invite` WRITE;
/*!40000 ALTER TABLE `application_invite` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_invite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_lifecycle_event_queue`
--

DROP TABLE IF EXISTS `application_lifecycle_event_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_lifecycle_event_queue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `application_id` bigint(20) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `name` varchar(128) NOT NULL,
  `params` longtext,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `application_id_idx` (`application_id`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `application_lifecycle_event_queue_application_id_application_id` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`) ON DELETE CASCADE,
  CONSTRAINT `application_lifecycle_event_queue_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_lifecycle_event_queue`
--

LOCK TABLES `application_lifecycle_event_queue` WRITE;
/*!40000 ALTER TABLE `application_lifecycle_event_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_lifecycle_event_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_persistent_data`
--

DROP TABLE IF EXISTS `application_persistent_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_persistent_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `application_id` bigint(20) NOT NULL,
  `member_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`application_id`,`member_id`,`name`),
  KEY `application_id_idx` (`application_id`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `application_persistent_data_application_id_application_id` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`) ON DELETE CASCADE,
  CONSTRAINT `application_persistent_data_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_persistent_data`
--

LOCK TABLES `application_persistent_data` WRITE;
/*!40000 ALTER TABLE `application_persistent_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `application_persistent_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application_translation`
--

DROP TABLE IF EXISTS `application_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `application_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `title_url` varchar(128) DEFAULT NULL,
  `description` text,
  `directory_title` varchar(128) DEFAULT NULL,
  `screenshot` varchar(128) DEFAULT NULL,
  `thumbnail` varchar(128) DEFAULT NULL,
  `author` varchar(128) DEFAULT NULL,
  `author_aboutme` text,
  `author_affiliation` varchar(128) DEFAULT NULL,
  `author_email` varchar(128) DEFAULT NULL,
  `author_photo` varchar(128) DEFAULT NULL,
  `author_link` varchar(128) DEFAULT NULL,
  `author_quote` text,
  `settings` longtext,
  `views` longtext,
  `lang` char(5) NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `application_translation_id_application_id` FOREIGN KEY (`id`) REFERENCES `application` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application_translation`
--

LOCK TABLES `application_translation` WRITE;
/*!40000 ALTER TABLE `application_translation` DISABLE KEYS */;
INSERT INTO `application_translation` VALUES (1,'PayPal ボタン（寄付・購入）',NULL,'PayPal（ペイパル）の決済サービスを簡単に設置・利用できるアプリです。会費の集金、アイテム購入の支払いに使える「購入ボタン」と、SNSへの寄付や募金に使える「寄付」ボタンがあります。PayPal ボタンのご利用には PayPal アカウントの登録が必要です。',NULL,'http://labs.spicebox.jp/opensocial/apps/paypalbutton/ppbutton_screenshot280.png','http://labs.spicebox.jp/opensocial/apps/paypalbutton/ppgadget.png','スパイスボックスラボラトリ','神部竜二','SPICEBOX LABORATORY','lab@spicebox.co.jp','http://labs.spicebox.jp/about/images/members/member002.jpg','http://labs.spicebox.jp/','spicebox.NEXT をつくる',NULL,NULL,'ja_JP','2011-04-28 23:30:55','1989-01-08 00:00:00');
/*!40000 ALTER TABLE `application_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ashiato`
--

DROP TABLE IF EXISTS `ashiato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ashiato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id_from` int(11) DEFAULT NULL,
  `member_id_to` int(11) DEFAULT NULL,
  `r_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_at_idx` (`created_at`),
  KEY `member_id_to_member_id_from_updated_at_idx` (`member_id_to`,`member_id_from`,`updated_at`),
  KEY `member_id_to_r_date_idx` (`member_id_to`,`r_date`),
  KEY `member_id_to_idx` (`member_id_to`),
  KEY `member_id_from_idx` (`member_id_from`),
  CONSTRAINT `ashiato_member_id_from_member_id` FOREIGN KEY (`member_id_from`) REFERENCES `member` (`id`) ON DELETE SET NULL,
  CONSTRAINT `ashiato_member_id_to_member_id` FOREIGN KEY (`member_id_to`) REFERENCES `member` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ashiato`
--

LOCK TABLES `ashiato` WRITE;
/*!40000 ALTER TABLE `ashiato` DISABLE KEYS */;
/*!40000 ALTER TABLE `ashiato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Banner name',
  `html` text COLLATE utf8_unicode_ci COMMENT 'HTML of free input banner',
  `is_use_html` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'This is free HTML banner',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations about banner';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,'top_before',NULL,0),(2,'side_before',NULL,0),(3,'top_after',NULL,0),(4,'side_after',NULL,0);
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_image`
--

DROP TABLE IF EXISTS `banner_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `file_id` int(11) NOT NULL COMMENT 'An image''s file id',
  `url` text COLLATE utf8_unicode_ci COMMENT 'URL of linked Web page',
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Banner image name',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `file_id_idx` (`file_id`),
  CONSTRAINT `banner_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations about banner image files';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_image`
--

LOCK TABLES `banner_image` WRITE;
/*!40000 ALTER TABLE `banner_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_translation`
--

DROP TABLE IF EXISTS `banner_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_translation` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial number',
  `caption` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Description',
  `lang` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `banner_translation_id_banner_id` FOREIGN KEY (`id`) REFERENCES `banner` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_translation`
--

LOCK TABLES `banner_translation` WRITE;
/*!40000 ALTER TABLE `banner_translation` DISABLE KEYS */;
INSERT INTO `banner_translation` VALUES (1,'Top banner(before login)','en'),(1,'トップバナー（ログイン前）','ja_JP'),(2,'Side banner(before login)','en'),(2,'サイドバナー（ログイン前）','ja_JP'),(3,'Top banner (after login)','en'),(3,'トップバナー（ログイン後）','ja_JP'),(4,'Side banner (after login)','en'),(4,'サイドバナー（ログイン後）','ja_JP');
/*!40000 ALTER TABLE `banner_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banner_use_image`
--

DROP TABLE IF EXISTS `banner_use_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `banner_use_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `banner_id` int(11) NOT NULL COMMENT 'Banner id',
  `banner_image_id` int(11) NOT NULL COMMENT 'BannerImage id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `banner_id_idx` (`banner_id`),
  KEY `banner_image_id_idx` (`banner_image_id`),
  CONSTRAINT `banner_use_image_banner_id_banner_id` FOREIGN KEY (`banner_id`) REFERENCES `banner` (`id`),
  CONSTRAINT `banner_use_image_banner_image_id_banner_image_id` FOREIGN KEY (`banner_image_id`) REFERENCES `banner_image` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves relations between banners and their images';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner_use_image`
--

LOCK TABLES `banner_use_image` WRITE;
/*!40000 ALTER TABLE `banner_use_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `banner_use_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blacklist`
--

DROP TABLE IF EXISTS `blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `uid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Mobile identified number',
  `memo` text COLLATE utf8_unicode_ci COMMENT 'Free memo',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_UNIQUE_idx` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of blacklist';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blacklist`
--

LOCK TABLES `blacklist` WRITE;
/*!40000 ALTER TABLE `blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_rss_cache`
--

DROP TABLE IF EXISTS `blog_rss_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_rss_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `title` text,
  `description` text,
  `link` text,
  `date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `date_INDEX_idx` (`date`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `blog_rss_cache_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_rss_cache`
--

LOCK TABLES `blog_rss_cache` WRITE;
/*!40000 ALTER TABLE `blog_rss_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_rss_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Community name',
  `file_id` int(11) DEFAULT NULL COMMENT 'Top image file id',
  `community_category_id` int(11) DEFAULT NULL COMMENT 'Community category id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`),
  KEY `file_id_idx` (`file_id`),
  KEY `community_category_id_idx` (`community_category_id`),
  CONSTRAINT `community_community_category_id_community_category_id` FOREIGN KEY (`community_category_id`) REFERENCES `community_category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `community_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of communities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_category`
--

DROP TABLE IF EXISTS `community_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Category name',
  `is_allow_member_community` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Member can create this category community',
  `tree_key` int(11) DEFAULT NULL COMMENT 'Nested tree key',
  `sort_order` int(11) DEFAULT NULL COMMENT 'Order to sort',
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lft_INDEX_idx` (`lft`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves categories of community';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_category`
--

LOCK TABLES `community_category` WRITE;
/*!40000 ALTER TABLE `community_category` DISABLE KEYS */;
INSERT INTO `community_category` VALUES (1,'コミュニティカテゴリ',1,1,NULL,1,8,0,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(2,'地域',1,1,NULL,2,3,1,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(3,'グルメ',1,1,NULL,4,5,1,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(4,'スポーツ',1,1,NULL,6,7,1,'2011-04-28 23:30:55','2011-04-28 23:30:55');
/*!40000 ALTER TABLE `community_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_config`
--

DROP TABLE IF EXISTS `community_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `community_id` int(11) NOT NULL COMMENT 'Community id',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Configuration name',
  `value` text COLLATE utf8_unicode_ci COMMENT 'Configuration value',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `community_id_idx` (`community_id`),
  CONSTRAINT `community_config_community_id_community_id` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of communities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_config`
--

LOCK TABLES `community_config` WRITE;
/*!40000 ALTER TABLE `community_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_event`
--

DROP TABLE IF EXISTS `community_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `body` text NOT NULL,
  `event_updated_at` datetime DEFAULT NULL,
  `open_date` datetime NOT NULL,
  `open_date_comment` text NOT NULL,
  `area` text NOT NULL,
  `application_deadline` datetime DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `community_id_idx` (`community_id`),
  CONSTRAINT `community_event_community_id_community_id` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE,
  CONSTRAINT `community_event_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_event`
--

LOCK TABLES `community_event` WRITE;
/*!40000 ALTER TABLE `community_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_event_comment`
--

DROP TABLE IF EXISTS `community_event_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_event_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_event_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `community_event_id_idx` (`community_event_id`),
  CONSTRAINT `community_event_comment_community_event_id_community_event_id` FOREIGN KEY (`community_event_id`) REFERENCES `community_event` (`id`) ON DELETE CASCADE,
  CONSTRAINT `community_event_comment_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_event_comment`
--

LOCK TABLES `community_event_comment` WRITE;
/*!40000 ALTER TABLE `community_event_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_event_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_event_comment_image`
--

DROP TABLE IF EXISTS `community_event_comment_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_event_comment_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_number_idx` (`id`,`number`),
  KEY `post_id_idx` (`post_id`),
  KEY `file_id_idx` (`file_id`),
  CONSTRAINT `community_event_comment_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  CONSTRAINT `community_event_comment_image_post_id_community_event_comment_id` FOREIGN KEY (`post_id`) REFERENCES `community_event_comment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_event_comment_image`
--

LOCK TABLES `community_event_comment_image` WRITE;
/*!40000 ALTER TABLE `community_event_comment_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_event_comment_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_event_image`
--

DROP TABLE IF EXISTS `community_event_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_event_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_number_idx` (`id`,`number`),
  KEY `post_id_idx` (`post_id`),
  KEY `file_id_idx` (`file_id`),
  CONSTRAINT `community_event_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  CONSTRAINT `community_event_image_post_id_community_event_id` FOREIGN KEY (`post_id`) REFERENCES `community_event` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_event_image`
--

LOCK TABLES `community_event_image` WRITE;
/*!40000 ALTER TABLE `community_event_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_event_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_event_member`
--

DROP TABLE IF EXISTS `community_event_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_event_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_event_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `community_event_id_idx` (`community_event_id`),
  CONSTRAINT `community_event_member_community_event_id_community_event_id` FOREIGN KEY (`community_event_id`) REFERENCES `community_event` (`id`) ON DELETE CASCADE,
  CONSTRAINT `community_event_member_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_event_member`
--

LOCK TABLES `community_event_member` WRITE;
/*!40000 ALTER TABLE `community_event_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_event_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_member`
--

DROP TABLE IF EXISTS `community_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `community_id` int(11) NOT NULL COMMENT 'Community id',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `is_pre` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Is pre member?',
  `is_receive_mail_pc` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Notification of posting in community by computer E-mail.',
  `is_receive_mail_mobile` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Notification of posting in community by mobile E-mail.',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `community_id_idx` (`community_id`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `community_member_community_id_community_id` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE,
  CONSTRAINT `community_member_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of members joined';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_member`
--

LOCK TABLES `community_member` WRITE;
/*!40000 ALTER TABLE `community_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_member_position`
--

DROP TABLE IF EXISTS `community_member_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_member_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `community_id` int(11) NOT NULL COMMENT 'Community id',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `community_member_id` int(11) NOT NULL COMMENT 'Community Member id',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Member''s position name in this community',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`community_member_id`,`name`),
  KEY `community_id_idx` (`community_id`),
  KEY `member_id_idx` (`member_id`),
  KEY `community_member_id_idx` (`community_member_id`),
  CONSTRAINT `ccci` FOREIGN KEY (`community_member_id`) REFERENCES `community_member` (`id`) ON DELETE CASCADE,
  CONSTRAINT `community_member_position_community_id_community_id` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE,
  CONSTRAINT `community_member_position_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of the Community''''s member roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_member_position`
--

LOCK TABLES `community_member_position` WRITE;
/*!40000 ALTER TABLE `community_member_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_member_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_topic`
--

DROP TABLE IF EXISTS `community_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `name` text NOT NULL,
  `body` text NOT NULL,
  `topic_updated_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `community_id_idx` (`community_id`),
  CONSTRAINT `community_topic_community_id_community_id` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`) ON DELETE CASCADE,
  CONSTRAINT `community_topic_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_topic`
--

LOCK TABLES `community_topic` WRITE;
/*!40000 ALTER TABLE `community_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_topic_comment`
--

DROP TABLE IF EXISTS `community_topic_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_topic_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_topic_id` int(11) NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `body` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `community_topic_id_idx` (`community_topic_id`),
  CONSTRAINT `community_topic_comment_community_topic_id_community_topic_id` FOREIGN KEY (`community_topic_id`) REFERENCES `community_topic` (`id`) ON DELETE CASCADE,
  CONSTRAINT `community_topic_comment_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_topic_comment`
--

LOCK TABLES `community_topic_comment` WRITE;
/*!40000 ALTER TABLE `community_topic_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_topic_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_topic_comment_image`
--

DROP TABLE IF EXISTS `community_topic_comment_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_topic_comment_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_number_idx` (`id`,`number`),
  KEY `post_id_idx` (`post_id`),
  KEY `file_id_idx` (`file_id`),
  CONSTRAINT `community_topic_comment_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  CONSTRAINT `community_topic_comment_image_post_id_community_topic_comment_id` FOREIGN KEY (`post_id`) REFERENCES `community_topic_comment` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_topic_comment_image`
--

LOCK TABLES `community_topic_comment_image` WRITE;
/*!40000 ALTER TABLE `community_topic_comment_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_topic_comment_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_topic_image`
--

DROP TABLE IF EXISTS `community_topic_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `community_topic_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `file_id` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_number_idx` (`id`,`number`),
  KEY `post_id_idx` (`post_id`),
  KEY `file_id_idx` (`file_id`),
  CONSTRAINT `community_topic_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  CONSTRAINT `community_topic_image_post_id_community_topic_id` FOREIGN KEY (`post_id`) REFERENCES `community_topic` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_topic_image`
--

LOCK TABLES `community_topic_image` WRITE;
/*!40000 ALTER TABLE `community_topic_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `community_topic_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deleted_message`
--

DROP TABLE IF EXISTS `deleted_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deleted_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `message_id` int(11) NOT NULL,
  `message_send_list_id` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `deleted_message_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_message`
--

LOCK TABLES `deleted_message` WRITE;
/*!40000 ALTER TABLE `deleted_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `deleted_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diary`
--

DROP TABLE IF EXISTS `diary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `body` text NOT NULL,
  `public_flag` tinyint(4) NOT NULL DEFAULT '1',
  `is_open` tinyint(1) NOT NULL DEFAULT '0',
  `has_images` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_at_idx` (`created_at`),
  KEY `member_id_created_at_idx` (`member_id`,`created_at`),
  KEY `public_flag_craeted_at_idx` (`public_flag`,`created_at`),
  KEY `is_open_created_at_idx` (`is_open`,`created_at`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `diary_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diary`
--

LOCK TABLES `diary` WRITE;
/*!40000 ALTER TABLE `diary` DISABLE KEYS */;
/*!40000 ALTER TABLE `diary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diary_comment`
--

DROP TABLE IF EXISTS `diary_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diary_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diary_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `body` text NOT NULL,
  `has_images` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `diary_id_number_idx` (`diary_id`,`number`),
  KEY `diary_id_idx` (`diary_id`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `diary_comment_diary_id_diary_id` FOREIGN KEY (`diary_id`) REFERENCES `diary` (`id`) ON DELETE CASCADE,
  CONSTRAINT `diary_comment_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diary_comment`
--

LOCK TABLES `diary_comment` WRITE;
/*!40000 ALTER TABLE `diary_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `diary_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diary_comment_image`
--

DROP TABLE IF EXISTS `diary_comment_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diary_comment_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diary_comment_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `diary_comment_id_idx` (`diary_comment_id`),
  KEY `file_id_idx` (`file_id`),
  CONSTRAINT `diary_comment_image_diary_comment_id_diary_comment_id` FOREIGN KEY (`diary_comment_id`) REFERENCES `diary_comment` (`id`) ON DELETE CASCADE,
  CONSTRAINT `diary_comment_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diary_comment_image`
--

LOCK TABLES `diary_comment_image` WRITE;
/*!40000 ALTER TABLE `diary_comment_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `diary_comment_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diary_comment_unread`
--

DROP TABLE IF EXISTS `diary_comment_unread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diary_comment_unread` (
  `diary_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`diary_id`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `diary_comment_unread_diary_id_diary_id` FOREIGN KEY (`diary_id`) REFERENCES `diary` (`id`) ON DELETE CASCADE,
  CONSTRAINT `diary_comment_unread_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diary_comment_unread`
--

LOCK TABLES `diary_comment_unread` WRITE;
/*!40000 ALTER TABLE `diary_comment_unread` DISABLE KEYS */;
/*!40000 ALTER TABLE `diary_comment_unread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diary_comment_update`
--

DROP TABLE IF EXISTS `diary_comment_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diary_comment_update` (
  `diary_id` int(11) NOT NULL DEFAULT '0',
  `member_id` int(11) NOT NULL DEFAULT '0',
  `last_comment_time` datetime NOT NULL,
  `my_last_comment_time` datetime NOT NULL,
  PRIMARY KEY (`diary_id`,`member_id`),
  KEY `member_id_last_comment_time_idx` (`member_id`,`last_comment_time`),
  CONSTRAINT `diary_comment_update_diary_id_diary_id` FOREIGN KEY (`diary_id`) REFERENCES `diary` (`id`) ON DELETE CASCADE,
  CONSTRAINT `diary_comment_update_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diary_comment_update`
--

LOCK TABLES `diary_comment_update` WRITE;
/*!40000 ALTER TABLE `diary_comment_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `diary_comment_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diary_image`
--

DROP TABLE IF EXISTS `diary_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `diary_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `diary_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `diary_id_number_idx` (`diary_id`,`number`),
  KEY `diary_id_idx` (`diary_id`),
  KEY `file_id_idx` (`file_id`),
  CONSTRAINT `diary_image_diary_id_diary_id` FOREIGN KEY (`diary_id`) REFERENCES `diary` (`id`) ON DELETE CASCADE,
  CONSTRAINT `diary_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diary_image`
--

LOCK TABLES `diary_image` WRITE;
/*!40000 ALTER TABLE `diary_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `diary_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id_to` int(11) NOT NULL,
  `member_id_from` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_from_INDEX_idx` (`member_id_from`),
  KEY `member_id_to_idx` (`member_id_to`),
  CONSTRAINT `favorite_member_id_from_member_id` FOREIGN KEY (`member_id_from`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  CONSTRAINT `favorite_member_id_to_member_id` FOREIGN KEY (`member_id_to`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'File name',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of this file',
  `filesize` int(11) NOT NULL DEFAULT '0' COMMENT 'File size',
  `original_filename` text COLLATE utf8_unicode_ci COMMENT 'Original filename',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of files uploaded';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_bin`
--

DROP TABLE IF EXISTS `file_bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_bin` (
  `file_id` int(11) NOT NULL DEFAULT '0' COMMENT 'File id',
  `bin` longblob COMMENT 'Content of file',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`file_id`),
  CONSTRAINT `file_bin_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves content of files';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_bin`
--

LOCK TABLES `file_bin` WRITE;
/*!40000 ALTER TABLE `file_bin` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_bin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gadget`
--

DROP TABLE IF EXISTS `gadget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gadget` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Gadget type',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Gadget name',
  `sort_order` int(11) DEFAULT NULL COMMENT 'Order to sort',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sort_order_INDEX_idx` (`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of gadget';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gadget`
--

LOCK TABLES `gadget` WRITE;
/*!40000 ALTER TABLE `gadget` DISABLE KEYS */;
INSERT INTO `gadget` VALUES (1,'top','birthdayBox',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(2,'top','searchBox',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(3,'top','informationBox',20,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(4,'sideMenu','memberImageBox',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(5,'sideMenu','friendListBox',20,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(6,'sideMenu','communityJoinListBox',30,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(7,'sideBannerContents','languageSelecterBox',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(8,'sideBannerContents','sideBanner',20,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(9,'mobileTop','birthdayBox',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(10,'mobileTop','informationBox',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(11,'loginTop','loginForm',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(12,'mobileLoginContents','loginForm',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(13,'profileTop','birthdayBox',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(14,'profileSideMenu','memberImageBox',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(15,'profileSideMenu','friendListBox',20,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(16,'profileSideMenu','communityJoinListBox',30,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(17,'profileContents','profileListBox',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(18,'mobileProfileTop','birthdayBox',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(19,'mobileProfileBottom','friendListBox',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(20,'mobileProfileBottom','communityJoinListBox',20,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(21,'contents','albumFriendList',141,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(22,'contents','albumList',142,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(23,'contents','albumMyList',143,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(24,'profileContents','albumMemberList',141,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(25,'contents','blogFriend',100,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(26,'contents','blogUser',110,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(27,'profileContents','blogUser',100,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(28,'contents','recentCommunityTopicComment',131,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(29,'mobileContents','recentCommunityTopicComment',110,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(30,'contents','recentCommunityEventComment',132,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(31,'mobileContents','recentCommunityEventComment',111,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(32,'contents','diaryFriendList',101,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(33,'contents','diaryList',102,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(34,'contents','diaryCommentHistory',103,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(35,'contents','diaryMyList',104,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(36,'profileContents','diaryMemberList',101,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(37,'mobileContents','diaryFriendList',101,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(38,'mobileContents','diaryList',102,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(39,'mobileContents','diaryCommentHistory',103,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(40,'mobileContents','diaryMyList',104,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(41,'mobileProfileContents','diaryMemberList',101,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(42,'sideMenu','favoriteListBox',40,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(43,'contents','favoriteDiaryNews',103,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(44,'contents','favoriteBlogNews',104,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(45,'mobileContents','favoriteDiaryNews',105,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(46,'contents','applicationBoxes',110,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(47,'profileContents','applicationBoxes',110,'2011-04-28 23:30:55','2011-04-28 23:30:55');
/*!40000 ALTER TABLE `gadget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gadget_config`
--

DROP TABLE IF EXISTS `gadget_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gadget_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Configuration name',
  `gadget_id` int(11) DEFAULT NULL COMMENT 'Gadget id',
  `value` text COLLATE utf8_unicode_ci COMMENT 'Configuration value',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `gadget_id_idx` (`gadget_id`),
  CONSTRAINT `gadget_config_gadget_id_gadget_id` FOREIGN KEY (`gadget_id`) REFERENCES `gadget` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of gadget';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gadget_config`
--

LOCK TABLES `gadget_config` WRITE;
/*!40000 ALTER TABLE `gadget_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `gadget_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intro_friend`
--

DROP TABLE IF EXISTS `intro_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `intro_friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id_to` int(11) NOT NULL,
  `member_id_from` int(11) NOT NULL,
  `content` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `created_at_idx` (`created_at`),
  KEY `member_id_from_member_id_to_idx` (`member_id_from`,`member_id_to`),
  KEY `member_id_to_idx` (`member_id_to`),
  KEY `member_id_from_idx` (`member_id_from`),
  CONSTRAINT `intro_friend_member_id_from_member_id` FOREIGN KEY (`member_id_from`) REFERENCES `member` (`id`),
  CONSTRAINT `intro_friend_member_id_to_member_id` FOREIGN KEY (`member_id_to`) REFERENCES `member` (`id`),
  CONSTRAINT `intro_friend_member_id_to_member_relationship_member_id_to` FOREIGN KEY (`member_id_to`) REFERENCES `member_relationship` (`member_id_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intro_friend`
--

LOCK TABLES `intro_friend` WRITE;
/*!40000 ALTER TABLE `intro_friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `intro_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Nickname',
  `invite_member_id` int(11) DEFAULT NULL COMMENT 'Member id of the person who invited this member',
  `is_login_rejected` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Rejected member',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `is_active_INDEX_idx` (`is_active`),
  KEY `invite_member_id_idx` (`invite_member_id`),
  CONSTRAINT `member_invite_member_id_member_id` FOREIGN KEY (`invite_member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'OpenPNE君',NULL,0,'2011-04-28 23:30:55','2011-04-28 23:30:55',1);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_application`
--

DROP TABLE IF EXISTS `member_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) NOT NULL,
  `application_id` bigint(20) NOT NULL,
  `public_flag` varchar(255) NOT NULL DEFAULT 'public',
  `sort_order` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `application_id_idx` (`application_id`),
  CONSTRAINT `member_application_application_id_application_id` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`) ON DELETE CASCADE,
  CONSTRAINT `member_application_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_application`
--

LOCK TABLES `member_application` WRITE;
/*!40000 ALTER TABLE `member_application` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_application_setting`
--

DROP TABLE IF EXISTS `member_application_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_application_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `member_application_id` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'application',
  `name` varchar(255) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hash_UNIQUE_idx` (`hash`),
  KEY `member_application_id_idx` (`member_application_id`),
  CONSTRAINT `mmmi` FOREIGN KEY (`member_application_id`) REFERENCES `member_application` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_application_setting`
--

LOCK TABLES `member_application_setting` WRITE;
/*!40000 ALTER TABLE `member_application_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_application_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_config`
--

DROP TABLE IF EXISTS `member_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Configuration name',
  `value` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Configuration value',
  `value_datetime` datetime DEFAULT NULL COMMENT 'Configuration datetime value',
  `name_value_hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Hash value for searching name & value',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_INDEX_idx` (`name`),
  KEY `name_value_hash_INDEX_idx` (`name_value_hash`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `member_config_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of each members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_config`
--

LOCK TABLES `member_config` WRITE;
/*!40000 ALTER TABLE `member_config` DISABLE KEYS */;
INSERT INTO `member_config` VALUES (1,1,'pc_address','sns@example.com',NULL,'885654aa381dfadbc6ea2c47a4a30f6a','2011-04-28 23:30:55','2011-04-28 23:30:55'),(2,1,'password','5f4dcc3b5aa765d61d8327deb882cf99',NULL,'927246e0e2492bb1c4334e89edfa252f','2011-04-28 23:30:55','2011-04-28 23:30:55'),(3,1,'secret_question','5',NULL,'0ca0709b3ef4d5c7bde5e0f67c2021e1','2011-04-28 23:30:55','2011-04-28 23:30:55'),(4,1,'secret_answer','c81c00cad27aa757b313626c3c02094f',NULL,'8e460ad7facdeae96bfb1871f5d7a5b3','2011-04-28 23:30:55','2011-04-28 23:30:55');
/*!40000 ALTER TABLE `member_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_image`
--

DROP TABLE IF EXISTS `member_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `file_id` int(11) NOT NULL COMMENT 'Image file id in the ''file'' table',
  `is_primary` tinyint(1) DEFAULT NULL COMMENT 'This is primary',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `file_id_idx` (`file_id`),
  CONSTRAINT `member_image_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  CONSTRAINT `member_image_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves images in member profiles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_image`
--

LOCK TABLES `member_image` WRITE;
/*!40000 ALTER TABLE `member_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_profile`
--

DROP TABLE IF EXISTS `member_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `member_id` int(11) NOT NULL COMMENT 'Member id',
  `profile_id` int(11) NOT NULL COMMENT 'Profile id',
  `profile_option_id` int(11) DEFAULT NULL COMMENT 'Profile option id',
  `value` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Text content for this profile item',
  `value_datetime` datetime DEFAULT NULL COMMENT 'Profile datetime value',
  `public_flag` tinyint(4) DEFAULT NULL COMMENT 'Public flag',
  `tree_key` bigint(20) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lft_INDEX_idx` (`lft`),
  KEY `member_id_idx` (`member_id`),
  KEY `profile_id_idx` (`profile_id`),
  KEY `profile_option_id_idx` (`profile_option_id`),
  CONSTRAINT `member_profile_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  CONSTRAINT `member_profile_profile_id_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE,
  CONSTRAINT `member_profile_profile_option_id_profile_option_id` FOREIGN KEY (`profile_option_id`) REFERENCES `profile_option` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of every member''''s profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_profile`
--

LOCK TABLES `member_profile` WRITE;
/*!40000 ALTER TABLE `member_profile` DISABLE KEYS */;
INSERT INTO `member_profile` VALUES (1,1,1,NULL,'Man',NULL,1,1,1,2,0,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(2,1,2,NULL,'1988-04-23','1988-04-23 00:00:00',1,2,1,2,0,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(3,1,3,NULL,'Tokyo',NULL,1,3,1,2,0,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(4,1,4,NULL,'よろしくお願いします。',NULL,1,4,1,2,0,'2011-04-28 23:30:55','2011-04-28 23:30:55');
/*!40000 ALTER TABLE `member_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member_relationship`
--

DROP TABLE IF EXISTS `member_relationship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member_relationship` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `member_id_to` int(11) NOT NULL COMMENT 'Target member id',
  `member_id_from` int(11) NOT NULL COMMENT 'Subject member id',
  `is_friend` tinyint(1) DEFAULT NULL COMMENT 'The members are friends',
  `is_friend_pre` tinyint(1) DEFAULT NULL COMMENT 'The members are going to be friends',
  `is_access_block` tinyint(1) DEFAULT NULL COMMENT 'The subject member is blocked the target',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `member_id_to_from_UNIQUE_idx` (`member_id_to`,`member_id_from`),
  UNIQUE KEY `member_id_from_to_UNIQUE_idx` (`member_id_from`,`member_id_to`),
  KEY `member_id_to_idx` (`member_id_to`),
  KEY `member_id_from_idx` (`member_id_from`),
  CONSTRAINT `member_relationship_member_id_from_member_id` FOREIGN KEY (`member_id_from`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  CONSTRAINT `member_relationship_member_id_to_member_id` FOREIGN KEY (`member_id_to`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves ralationships of each members';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_relationship`
--

LOCK TABLES `member_relationship` WRITE;
/*!40000 ALTER TABLE `member_relationship` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_relationship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `subject` text,
  `body` text,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `is_send` tinyint(1) NOT NULL DEFAULT '0',
  `thread_message_id` int(11) DEFAULT '0',
  `return_message_id` int(11) DEFAULT '0',
  `message_type_id` int(11) DEFAULT NULL,
  `foreign_id` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `message_type_id_idx` (`message_type_id`),
  CONSTRAINT `message_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL,
  CONSTRAINT `message_message_type_id_message_type_id` FOREIGN KEY (`message_type_id`) REFERENCES `message_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_file`
--

DROP TABLE IF EXISTS `message_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_id_idx` (`message_id`),
  KEY `file_id_idx` (`file_id`),
  CONSTRAINT `message_file_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE CASCADE,
  CONSTRAINT `message_file_message_id_message_id` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_file`
--

LOCK TABLES `message_file` WRITE;
/*!40000 ALTER TABLE `message_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_send_list`
--

DROP TABLE IF EXISTS `message_send_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_send_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `message_id` int(11) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id_idx` (`member_id`),
  KEY `message_id_idx` (`message_id`),
  CONSTRAINT `message_send_list_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE SET NULL,
  CONSTRAINT `message_send_list_message_id_message_id` FOREIGN KEY (`message_id`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_send_list`
--

LOCK TABLES `message_send_list` WRITE;
/*!40000 ALTER TABLE `message_send_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `message_send_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_type`
--

DROP TABLE IF EXISTS `message_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` text NOT NULL,
  `foreign_table` text,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_type`
--

LOCK TABLES `message_type` WRITE;
/*!40000 ALTER TABLE `message_type` DISABLE KEYS */;
INSERT INTO `message_type` VALUES (1,'message',NULL,0,'2011-04-28 23:30:56','2011-04-28 23:30:56'),(2,'friend_link',NULL,0,'2011-04-28 23:30:56','2011-04-28 23:30:56'),(3,'community_message','community',0,'2011-04-28 23:30:56','2011-04-28 23:30:56'),(4,'community_taking_over','community',0,'2011-04-28 23:30:56','2011-04-28 23:30:56'),(5,'community_joining_request','community_member',0,'2011-04-28 23:30:56','2011-04-28 23:30:56');
/*!40000 ALTER TABLE `message_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_type_translation`
--

DROP TABLE IF EXISTS `message_type_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message_type_translation` (
  `id` int(11) NOT NULL DEFAULT '0',
  `body` text,
  `subject` text,
  `caption` text NOT NULL,
  `info` text,
  `lang` char(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `message_type_translation_id_message_type_id` FOREIGN KEY (`id`) REFERENCES `message_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message_type_translation`
--

LOCK TABLES `message_type_translation` WRITE;
/*!40000 ALTER TABLE `message_type_translation` DISABLE KEYS */;
INSERT INTO `message_type_translation` VALUES (1,NULL,NULL,'通常のメッセージ',NULL,'ja_JP'),(2,NULL,NULL,'フレンド申請',NULL,'ja_JP'),(3,NULL,NULL,'コミュニティ一括メッセージ',NULL,'ja_JP'),(4,NULL,NULL,'コミュニティ管理者交代メッセージ',NULL,'ja_JP'),(5,NULL,NULL,'コミュニティ参加申請メッセージ',NULL,'ja_JP');
/*!40000 ALTER TABLE `message_type_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation`
--

DROP TABLE IF EXISTS `navigation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Navigation type',
  `uri` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Linked page''s URI',
  `sort_order` int(11) DEFAULT NULL COMMENT 'Order to sort',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type_sort_order_INDEX_idx` (`type`,`sort_order`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of navigation items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation`
--

LOCK TABLES `navigation` WRITE;
/*!40000 ALTER TABLE `navigation` DISABLE KEYS */;
INSERT INTO `navigation` VALUES (1,'secure_global','@homepage',0,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(2,'secure_global','@member_search',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(3,'secure_global','@community_search',20,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(4,'secure_global','@member_config',30,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(5,'secure_global','@member_invite',40,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(6,'secure_global','@member_logout',50,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(7,'default','@homepage',0,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(8,'default','@friend_list',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(9,'default','@member_profile_mine',20,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(10,'default','@member_editProfile',30,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(11,'friend','@member_profile',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(12,'friend','@friend_list',20,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(13,'community','@community_home',0,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(14,'community','@community_join',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(15,'community','@community_quit',20,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(16,'mobile_home_side','@member_invite',0,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(17,'mobile_home','@friend_list',0,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(18,'mobile_home','@community_joinlist',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(19,'mobile_home_center','@member_profile_mine',0,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(20,'backend_side','member/index',10,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(21,'backend_side','monitoring/index',20,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(22,'backend_side','community/index',30,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(23,'backend_side','sns/config',40,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(24,'backend_side','@mail_config',35,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(25,'backend_side','design/index',50,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(26,'backend_side','navigation/index',60,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(27,'backend_side','profile/list',70,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(28,'backend_side','plugin/list',80,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(29,'backend_side','admin/index',90,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(30,'secure_global','@album_list',25,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(31,'default','@album_list_mine',15,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(32,'friend','@album_list_member',15,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(33,'default','ashiato/list',12,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(34,'mobile_home','ashiato/list',12,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(35,'secure_global','blog/index',26,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(36,'community','communityTopic/listCommunity',5,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(37,'community','communityEvent/listCommunity',6,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(38,'backend_side','communityTopic/topicList',25,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(39,'secure_global','diary/index',25,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(40,'default','diary/listMember',15,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(41,'friend','diary/listMember',15,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(42,'mobile_home_side','@diary_new',15,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(43,'mobile_home_side','@diary_list',16,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(44,'default','favorite/list',19,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(45,'friend','favorite/add',21,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(46,'mobile_home_side','favorite/list',25,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(47,'friend','@obj_member_introfriend',21,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(48,'default','message/index',11,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(49,'friend','message/sendToFriend',22,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(50,'mobile_home_side','message/index',20,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(51,'default','@application',15,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(52,'friend','@application_list',25,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(53,'secure_global','@ranking',23,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(54,'mobile_home_side','@ranking',23,'2011-04-28 23:30:55','2011-04-28 23:30:55');
/*!40000 ALTER TABLE `navigation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `navigation_translation`
--

DROP TABLE IF EXISTS `navigation_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_translation` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial number',
  `caption` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Description',
  `lang` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `navigation_translation_id_navigation_id` FOREIGN KEY (`id`) REFERENCES `navigation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `navigation_translation`
--

LOCK TABLES `navigation_translation` WRITE;
/*!40000 ALTER TABLE `navigation_translation` DISABLE KEYS */;
INSERT INTO `navigation_translation` VALUES (1,'My Home','en'),(1,'マイホーム','ja_JP'),(2,'Search Members','en'),(2,'メンバー検索','ja_JP'),(3,'Search Communities','en'),(3,'コミュニティ検索','ja_JP'),(4,'Settings','en'),(4,'設定変更','ja_JP'),(5,'Invite','en'),(5,'友人を招待する','ja_JP'),(6,'Logout','en'),(6,'ログアウト','ja_JP'),(7,'Home','en'),(7,'ホーム','ja_JP'),(8,'My Friends','en'),(8,'マイフレンド','ja_JP'),(9,'Profile','en'),(9,'プロフィール確認','ja_JP'),(10,'Edit Profile','en'),(10,'プロフィール編集','ja_JP'),(11,'Home','en'),(11,'ホーム','ja_JP'),(12,'Friends','en'),(12,'フレンドリスト','ja_JP'),(13,'Community Top','en'),(13,'コミュニティトップ','ja_JP'),(14,'Join Community','en'),(14,'コミュニティに参加','ja_JP'),(15,'Leave Community','en'),(15,'コミュニティを退会','ja_JP'),(16,'Invite','en'),(16,'[i:140]友人を誘う','ja_JP'),(17,'My Friends','en'),(17,'[i:140]ﾏｲﾌﾚﾝﾄﾞ','ja_JP'),(18,'Communities','en'),(18,'[i:155]参加ｺﾐｭﾆﾃｨ','ja_JP'),(19,'Profile','en'),(19,'[i:140]ﾌﾟﾛﾌｨｰﾙ','ja_JP'),(20,'Members','en'),(20,'メンバー管理','ja_JP'),(21,'Media','en'),(21,'画像・書き込み管理','ja_JP'),(22,'Communities','en'),(22,'コミュニティ管理','ja_JP'),(23,'SNS','en'),(23,'SNS設定','ja_JP'),(24,'Email','en'),(24,'メール設定','ja_JP'),(25,'Appearance','en'),(25,'デザイン設定','ja_JP'),(26,'Navigations','en'),(26,'ナビゲーション設定','ja_JP'),(27,'Profile','en'),(27,'プロフィール項目設定','ja_JP'),(28,'Plugins','en'),(28,'プラグイン設定','ja_JP'),(29,'Administration settings','en'),(29,'管理画面設定','ja_JP'),(30,'Album','en'),(30,'アルバム','ja_JP'),(31,'Album','en'),(31,'アルバム','ja_JP'),(32,'Album','en'),(32,'アルバム','ja_JP'),(33,'Footprint','en'),(33,'あしあと','ja_JP'),(34,'Footprint','en'),(34,'[i:91]あしあと','ja_JP'),(35,'Newest Blog','en'),(35,'最新Blog','ja_JP'),(36,'Topics','en'),(36,'トピックリスト','ja_JP'),(37,'Events','en'),(37,'イベントリスト','ja_JP'),(38,'トピック管理','ja_JP'),(39,'Diary','en'),(39,'日記','ja_JP'),(40,'Diary','en'),(40,'日記','ja_JP'),(41,'Diary','en'),(41,'日記','ja_JP'),(42,'Post a Diary','en'),(42,'日記を書く','ja_JP'),(43,'Recently Posted Diaries','en'),(43,'最新日記','ja_JP'),(44,'Favorite','en'),(44,'お気に入り','ja_JP'),(45,'Add to favorite','en'),(45,'お気に入りに追加','ja_JP'),(46,'Favorite','en'),(46,'お気に入り','ja_JP'),(47,'Write introductory','en'),(47,'紹介文を書く','ja_JP'),(48,'Message','en'),(48,'メッセージ','ja_JP'),(49,'Send Message','en'),(49,'メッセージを送る','ja_JP'),(50,'Message','en'),(50,'ﾒｯｾｰｼﾞ','ja_JP'),(51,'Apps','en'),(51,'アプリ','ja_JP'),(52,'Apps','en'),(52,'アプリ','ja_JP'),(53,'Ranking','en'),(53,'ランキング','ja_JP'),(54,'Rankingﾞ','en'),(54,'[i:191]ﾗﾝｷﾝｸﾞ','ja_JP');
/*!40000 ALTER TABLE `navigation_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_mail`
--

DROP TABLE IF EXISTS `notification_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Notification Identifier Name',
  `renderer` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'twig' COMMENT 'Notification Template Renderer',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Notification Enabled',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`),
  KEY `is_enabled_INDEX_idx` (`is_enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configuration of notification mail';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_mail`
--

LOCK TABLES `notification_mail` WRITE;
/*!40000 ALTER TABLE `notification_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_mail_translation`
--

DROP TABLE IF EXISTS `notification_mail_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification_mail_translation` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial number',
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Notification Title',
  `template` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Notification Template',
  `lang` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `notification_mail_translation_id_notification_mail_id` FOREIGN KEY (`id`) REFERENCES `notification_mail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_mail_translation`
--

LOCK TABLES `notification_mail_translation` WRITE;
/*!40000 ALTER TABLE `notification_mail_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification_mail_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_auth_admin_token`
--

DROP TABLE IF EXISTS `o_auth_admin_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_auth_admin_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `oauth_consumer_id` int(11) NOT NULL COMMENT 'OAuth Consumer id',
  `key_string` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Key string of this token',
  `secret` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Secret string of this token',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'request' COMMENT 'Token type',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Activation flag',
  `callback_url` text COLLATE utf8_unicode_ci COMMENT 'Callback url',
  `verifier` text COLLATE utf8_unicode_ci COMMENT 'Token verifier',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_secret_UNIQUE_idx` (`key_string`,`secret`),
  KEY `oauth_consumer_id_idx` (`oauth_consumer_id`),
  CONSTRAINT `o_auth_admin_token_oauth_consumer_id_oauth_consumer_id` FOREIGN KEY (`oauth_consumer_id`) REFERENCES `oauth_consumer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves administration tokens of OAuth';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_auth_admin_token`
--

LOCK TABLES `o_auth_admin_token` WRITE;
/*!40000 ALTER TABLE `o_auth_admin_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_auth_admin_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `o_auth_member_token`
--

DROP TABLE IF EXISTS `o_auth_member_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `o_auth_member_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `oauth_consumer_id` int(11) NOT NULL COMMENT 'OAuth Consumer id',
  `key_string` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Key string of this token',
  `secret` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Secret string of this token',
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'request' COMMENT 'Token type',
  `is_active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Activation flag',
  `callback_url` text COLLATE utf8_unicode_ci COMMENT 'Callback url',
  `verifier` text COLLATE utf8_unicode_ci COMMENT 'Token verifier',
  `member_id` int(11) DEFAULT NULL COMMENT 'Member id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_secret_UNIQUE_idx` (`key_string`,`secret`),
  KEY `oauth_consumer_id_idx` (`oauth_consumer_id`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `o_auth_member_token_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE,
  CONSTRAINT `o_auth_member_token_oauth_consumer_id_oauth_consumer_id` FOREIGN KEY (`oauth_consumer_id`) REFERENCES `oauth_consumer` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves memebr tokens of OAuth';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `o_auth_member_token`
--

LOCK TABLES `o_auth_member_token` WRITE;
/*!40000 ALTER TABLE `o_auth_member_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `o_auth_member_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_consumer`
--

DROP TABLE IF EXISTS `oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_consumer` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Consumer name',
  `description` text COLLATE utf8_unicode_ci COMMENT 'Consumer description',
  `key_string` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Token for this consumer',
  `secret` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Password for this consumer',
  `file_id` int(11) DEFAULT NULL COMMENT 'Image file id of this consumer',
  `using_apis` longtext COLLATE utf8_unicode_ci COMMENT 'API list that this consumer uses',
  `member_id` int(11) DEFAULT NULL COMMENT 'Member id',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key_secret_UNIQUE_idx` (`key_string`,`secret`),
  KEY `member_id_idx` (`member_id`),
  KEY `file_id_idx` (`file_id`),
  CONSTRAINT `oauth_consumer_file_id_file_id` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`) ON DELETE SET NULL,
  CONSTRAINT `oauth_consumer_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of OAuth Consumer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_consumer`
--

LOCK TABLES `oauth_consumer` WRITE;
/*!40000 ALTER TABLE `oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `openid_trust_log`
--

DROP TABLE IF EXISTS `openid_trust_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `openid_trust_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `member_id` int(11) DEFAULT NULL COMMENT 'Member id',
  `uri` text COLLATE utf8_unicode_ci COMMENT 'URI for RP',
  `uri_key` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Hashed URI for RP',
  `is_permanent` tinyint(1) DEFAULT NULL COMMENT 'A permanent flag',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uri_key_INDEX_idx` (`uri_key`),
  KEY `member_id_idx` (`member_id`),
  CONSTRAINT `openid_trust_log_member_id_member_id` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves logs of trusted OpenID RP';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `openid_trust_log`
--

LOCK TABLES `openid_trust_log` WRITE;
/*!40000 ALTER TABLE `openid_trust_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `openid_trust_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugin`
--

DROP TABLE IF EXISTS `plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Nickname',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Notification Enabled',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`),
  KEY `is_enabled_INDEX_idx` (`is_enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of plugins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugin`
--

LOCK TABLES `plugin` WRITE;
/*!40000 ALTER TABLE `plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Identified profile name (ASCII)',
  `is_required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'This is a required',
  `is_unique` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cannot select duplicate item',
  `is_edit_public_flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Settable public flag',
  `default_public_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Default of public flag',
  `form_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Form type to input/select',
  `value_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of input value',
  `is_disp_regist` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Shows when registeration',
  `is_disp_config` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Shows when edit',
  `is_disp_search` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Shows when searching',
  `is_public_web` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flag for adding public_flag for publishing to web',
  `value_regexp` text COLLATE utf8_unicode_ci COMMENT 'Regular expression',
  `value_min` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Minimum value',
  `value_max` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Maximum value',
  `sort_order` int(11) DEFAULT NULL COMMENT 'Order to sort',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves input/select items for the member profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'op_preset_sex',1,0,0,1,'select','string',1,1,1,0,NULL,NULL,NULL,110,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(2,'op_preset_birthday',0,0,0,1,'date','string',1,1,1,0,NULL,NULL,NULL,120,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(3,'op_preset_region',0,0,0,1,'region_select','JP',1,1,1,0,NULL,NULL,NULL,125,'2011-04-28 23:30:55','2011-04-28 23:30:55'),(4,'op_preset_self_introduction',0,0,0,1,'textarea','string',1,1,1,0,NULL,NULL,NULL,130,'2011-04-28 23:30:55','2011-04-28 23:30:55');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_option`
--

DROP TABLE IF EXISTS `profile_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `profile_id` int(11) NOT NULL COMMENT 'Profile id',
  `sort_order` int(11) DEFAULT NULL COMMENT 'Order to sort',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `profile_id_idx` (`profile_id`),
  CONSTRAINT `profile_option_profile_id_profile_id` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves options of profile items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_option`
--

LOCK TABLES `profile_option` WRITE;
/*!40000 ALTER TABLE `profile_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_option_translation`
--

DROP TABLE IF EXISTS `profile_option_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_option_translation` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial number',
  `value` text COLLATE utf8_unicode_ci COMMENT 'Choice',
  `lang` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `profile_option_translation_id_profile_option_id` FOREIGN KEY (`id`) REFERENCES `profile_option` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_option_translation`
--

LOCK TABLES `profile_option_translation` WRITE;
/*!40000 ALTER TABLE `profile_option_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_option_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile_translation`
--

DROP TABLE IF EXISTS `profile_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile_translation` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial number',
  `caption` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Item name to show',
  `info` text COLLATE utf8_unicode_ci COMMENT 'Description',
  `lang` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `profile_translation_id_profile_id` FOREIGN KEY (`id`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile_translation`
--

LOCK TABLES `profile_translation` WRITE;
/*!40000 ALTER TABLE `profile_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `profile_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `id` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `session_data` text COLLATE utf8_unicode_ci COMMENT 'Session information',
  `time` text COLLATE utf8_unicode_ci COMMENT 'Timestamp of generated time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves session data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skin_config`
--

DROP TABLE IF EXISTS `skin_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skin_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `plugin` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Plugin name',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Configuration name',
  `value` text COLLATE utf8_unicode_ci COMMENT 'Configuration value',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugin_name_UNIQUE_idx` (`plugin`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of this SNS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skin_config`
--

LOCK TABLES `skin_config` WRITE;
/*!40000 ALTER TABLE `skin_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `skin_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sns_config`
--

DROP TABLE IF EXISTS `sns_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sns_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Configuration name',
  `value` text COLLATE utf8_unicode_ci COMMENT 'Configuration value',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of this SNS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sns_config`
--

LOCK TABLES `sns_config` WRITE;
/*!40000 ALTER TABLE `sns_config` DISABLE KEYS */;
INSERT INTO `sns_config` VALUES (1,'OpenPNE_revision','46'),(2,'opAshiatoPlugin_revision','3'),(3,'opAuthMobileUIDPlugin_revision','1'),(4,'opBlogPlugin_revision','2'),(5,'opCommunityTopicPlugin_revision','5'),(6,'opDiaryPlugin_revision','8'),(7,'opFavoritePlugin_revision','4'),(8,'opIntroFriendPlugin_revision','2'),(9,'opMessagePlugin_revision','4'),(10,'opOpenSocialPlugin_revision','16'),(11,'shindig_token_cipher_key','37c4b8be784d02328e671703e921a693'),(12,'shindig_token_hmac_key','3be023eb5bc1e14bfd1c1c0391836ce4'),(13,'op_web_api_plugin_auth_type','1'),(14,'op_web_api_plugin_using_cdata','1');
/*!40000 ALTER TABLE `sns_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sns_term`
--

DROP TABLE IF EXISTS `sns_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sns_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Term name',
  `application` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pc_frontend' COMMENT 'Application name',
  PRIMARY KEY (`id`),
  KEY `application_INDEX_idx` (`application`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves terms of this SNS';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sns_term`
--

LOCK TABLES `sns_term` WRITE;
/*!40000 ALTER TABLE `sns_term` DISABLE KEYS */;
INSERT INTO `sns_term` VALUES (1,'friend','pc_frontend'),(2,'friend','mobile_frontend'),(3,'my_friend','pc_frontend'),(4,'my_friend','mobile_frontend'),(5,'community','pc_frontend'),(6,'community','mobile_frontend'),(7,'nickname','pc_frontend'),(8,'nickname','mobile_frontend'),(9,'activity','pc_frontend'),(10,'activity','mobile_frontend'),(11,'post_activity','pc_frontend'),(12,'post_activity','mobile_frontend');
/*!40000 ALTER TABLE `sns_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sns_term_translation`
--

DROP TABLE IF EXISTS `sns_term_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sns_term_translation` (
  `id` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial number',
  `value` text COLLATE utf8_unicode_ci COMMENT 'Term value',
  `lang` char(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `sns_term_translation_id_sns_term_id` FOREIGN KEY (`id`) REFERENCES `sns_term` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sns_term_translation`
--

LOCK TABLES `sns_term_translation` WRITE;
/*!40000 ALTER TABLE `sns_term_translation` DISABLE KEYS */;
INSERT INTO `sns_term_translation` VALUES (1,'friend','en'),(1,'フレンド','ja_JP'),(2,'friend','en'),(2,'ﾌﾚﾝﾄﾞ','ja_JP'),(3,'my friend','en'),(3,'マイフレンド','ja_JP'),(4,'my friend','en'),(4,'ﾏｲﾌﾚﾝﾄﾞ','ja_JP'),(5,'community','en'),(5,'コミュニティ','ja_JP'),(6,'community','en'),(6,'ｺﾐｭﾆﾃｨ','ja_JP'),(7,'nickname','en'),(7,'ニックネーム','ja_JP'),(8,'nickname','en'),(8,'ﾆｯｸﾈｰﾑ','ja_JP'),(9,'activity','en'),(9,'アクティビティ','ja_JP'),(10,'activity','en'),(10,'ｱｸﾃｨﾋﾞﾃｨ','ja_JP'),(11,'Post Activity','en'),(11,'アクティビティ投稿','ja_JP'),(12,'Post Activity','en'),(12,'投稿','ja_JP');
/*!40000 ALTER TABLE `sns_term_translation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;