-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bajamls
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Table structure for table `exp_actions`
--

DROP TABLE IF EXISTS `exp_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_actions` (
  `action_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `csrf_exempt` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_actions`
--

LOCK TABLES `exp_actions` WRITE;
/*!40000 ALTER TABLE `exp_actions` DISABLE KEYS */;
INSERT INTO `exp_actions` VALUES (1,'Channel','submit_entry',0),(2,'Channel','filemanager_endpoint',0),(3,'Channel','smiley_pop',0),(4,'Channel','combo_loader',0),(5,'Comment','insert_new_comment',0),(6,'Comment_mcp','delete_comment_notification',0),(7,'Comment','comment_subscribe',0),(8,'Comment','edit_comment',0),(9,'Rte','get_js',0),(10,'Relationship','entryList',0),(11,'Search','do_search',1);
/*!40000 ALTER TABLE `exp_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_captcha`
--

DROP TABLE IF EXISTS `exp_captcha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `word` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_captcha`
--

LOCK TABLES `exp_captcha` WRITE;
/*!40000 ALTER TABLE `exp_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_captcha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_categories`
--

DROP TABLE IF EXISTS `exp_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_categories` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `parent_id` int(4) unsigned NOT NULL,
  `cat_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_url_title` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_description` text COLLATE utf8mb4_unicode_ci,
  `cat_image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_order` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `group_id` (`group_id`),
  KEY `cat_name` (`cat_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_categories`
--

LOCK TABLES `exp_categories` WRITE;
/*!40000 ALTER TABLE `exp_categories` DISABLE KEYS */;
INSERT INTO `exp_categories` VALUES (1,1,1,0,'News','news',NULL,NULL,1),(2,1,1,0,'Personal','personal',NULL,NULL,2),(3,1,1,0,'Photos','photos',NULL,NULL,3),(4,1,1,0,'Videos','videos',NULL,NULL,4),(5,1,1,0,'Music','music',NULL,NULL,5),(6,1,2,0,'Not Shown','not-shown',NULL,NULL,1);
/*!40000 ALTER TABLE `exp_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_field_data`
--

DROP TABLE IF EXISTS `exp_category_field_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`cat_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_field_data`
--

LOCK TABLES `exp_category_field_data` WRITE;
/*!40000 ALTER TABLE `exp_category_field_data` DISABLE KEYS */;
INSERT INTO `exp_category_field_data` VALUES (1,1,1),(2,1,1),(3,1,1),(4,1,1),(5,1,1),(6,1,2);
/*!40000 ALTER TABLE `exp_category_field_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_fields`
--

DROP TABLE IF EXISTS `exp_category_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(4) unsigned NOT NULL,
  `field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `field_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_maxl` smallint(3) NOT NULL DEFAULT '128',
  `field_ta_rows` tinyint(2) NOT NULL DEFAULT '8',
  `field_default_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_text_direction` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_order` int(3) unsigned NOT NULL,
  `field_settings` text COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`field_id`),
  KEY `site_id` (`site_id`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_fields`
--

LOCK TABLES `exp_category_fields` WRITE;
/*!40000 ALTER TABLE `exp_category_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_category_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_groups`
--

DROP TABLE IF EXISTS `exp_category_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `can_edit_categories` text COLLATE utf8mb4_unicode_ci,
  `can_delete_categories` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_groups`
--

LOCK TABLES `exp_category_groups` WRITE;
/*!40000 ALTER TABLE `exp_category_groups` DISABLE KEYS */;
INSERT INTO `exp_category_groups` VALUES (1,1,'Blog','c',0,'all',NULL,NULL),(2,1,'Slideshow','a',0,'all',NULL,NULL);
/*!40000 ALTER TABLE `exp_category_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_category_posts`
--

DROP TABLE IF EXISTS `exp_category_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`,`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_category_posts`
--

LOCK TABLES `exp_category_posts` WRITE;
/*!40000 ALTER TABLE `exp_category_posts` DISABLE KEYS */;
INSERT INTO `exp_category_posts` VALUES (4,3),(5,4),(6,2),(7,5),(9,1),(10,5),(11,4);
/*!40000 ALTER TABLE `exp_category_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data`
--

DROP TABLE IF EXISTS `exp_channel_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data`
--

LOCK TABLES `exp_channel_data` WRITE;
/*!40000 ALTER TABLE `exp_channel_data` DISABLE KEYS */;
INSERT INTO `exp_channel_data` VALUES (4,1,2),(5,1,2),(6,1,2),(7,1,2),(8,1,2),(9,1,2),(10,1,2),(11,1,2),(12,1,3);
/*!40000 ALTER TABLE `exp_channel_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data_field_1`
--

DROP TABLE IF EXISTS `exp_channel_data_field_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data_field_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `field_id_1` text COLLATE utf8mb4_unicode_ci,
  `field_ft_1` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data_field_1`
--

LOCK TABLES `exp_channel_data_field_1` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_1` DISABLE KEYS */;
INSERT INTO `exp_channel_data_field_1` VALUES (1,1,'','xhtml'),(2,2,'','xhtml'),(3,3,'','xhtml');
/*!40000 ALTER TABLE `exp_channel_data_field_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data_field_10`
--

DROP TABLE IF EXISTS `exp_channel_data_field_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data_field_10` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `field_id_10` text COLLATE utf8mb4_unicode_ci,
  `field_ft_10` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data_field_10`
--

LOCK TABLES `exp_channel_data_field_10` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_10` DISABLE KEYS */;
INSERT INTO `exp_channel_data_field_10` VALUES (1,1,'This is a site to show you the power of ExpressionEngine, you can remove it, you can base your next site on it, you can just use it straight.','xhtml'),(2,2,'Sub page examples','xhtml'),(3,3,'Sub page examples','xhtml'),(4,4,'This is a very nice photograph I found, and I wanted to share.','xhtml'),(5,5,'This is how it\'s done, the incomparable Jackie Chan shows us the way.','xhtml'),(6,6,'This is a blog post about Bacon!','xhtml'),(7,7,'An album for the intelligent and uncommon.','xhtml'),(8,8,'Super old entry','xhtml'),(9,9,'A blog post about the hippest of the hipsters.','xhtml'),(10,10,'This is how you shake it off, haters take note.','xhtml'),(11,11,'This is a quick video teaching you how to cut a rope.','xhtml'),(12,12,'Contact us, phone, mailing, email.','xhtml');
/*!40000 ALTER TABLE `exp_channel_data_field_10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data_field_11`
--

DROP TABLE IF EXISTS `exp_channel_data_field_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data_field_11` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `field_id_11` text COLLATE utf8mb4_unicode_ci,
  `field_ft_11` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data_field_11`
--

LOCK TABLES `exp_channel_data_field_11` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_11` DISABLE KEYS */;
INSERT INTO `exp_channel_data_field_11` VALUES (1,1,'About {site_name}','none'),(2,2,'Sub page one','none'),(3,3,'Sub page two','none'),(4,4,'A beautiful photograph','none'),(5,5,'Action Comedy','none'),(6,6,'A blog all about the joys of Bacon','none'),(7,7,'Marrow and the broken bones.','none'),(8,8,'Super old entry','none'),(9,9,'This is one that is hipper than most.','none'),(10,10,'Shaking it Off, a cover.','none'),(11,11,'The one about cutting rope.','none'),(12,12,'Contact {site_name}','none');
/*!40000 ALTER TABLE `exp_channel_data_field_11` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data_field_2`
--

DROP TABLE IF EXISTS `exp_channel_data_field_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data_field_2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `field_id_2` text COLLATE utf8mb4_unicode_ci,
  `field_ft_2` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data_field_2`
--

LOCK TABLES `exp_channel_data_field_2` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_2` DISABLE KEYS */;
INSERT INTO `exp_channel_data_field_2` VALUES (1,4,NULL,'xhtml'),(2,5,NULL,'xhtml'),(3,6,NULL,'xhtml'),(4,7,'','xhtml'),(5,8,NULL,'xhtml'),(6,9,NULL,'xhtml'),(7,10,'','xhtml'),(8,11,NULL,'xhtml');
/*!40000 ALTER TABLE `exp_channel_data_field_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data_field_3`
--

DROP TABLE IF EXISTS `exp_channel_data_field_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data_field_3` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `field_id_3` text COLLATE utf8mb4_unicode_ci,
  `field_ft_3` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data_field_3`
--

LOCK TABLES `exp_channel_data_field_3` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_3` DISABLE KEYS */;
INSERT INTO `exp_channel_data_field_3` VALUES (1,4,'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','xhtml'),(2,5,'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','xhtml'),(3,6,'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.','xhtml'),(4,7,'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','xhtml'),(5,8,'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','xhtml'),(6,9,'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.','xhtml'),(7,10,'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','xhtml'),(8,11,'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.','xhtml');
/*!40000 ALTER TABLE `exp_channel_data_field_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data_field_4`
--

DROP TABLE IF EXISTS `exp_channel_data_field_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data_field_4` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `field_id_4` text COLLATE utf8mb4_unicode_ci,
  `field_ft_4` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data_field_4`
--

LOCK TABLES `exp_channel_data_field_4` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_4` DISABLE KEYS */;
INSERT INTO `exp_channel_data_field_4` VALUES (1,4,'','xhtml'),(2,5,NULL,'xhtml'),(3,6,NULL,'xhtml'),(4,7,NULL,'xhtml'),(5,8,NULL,'xhtml'),(6,9,NULL,'xhtml'),(7,10,NULL,'xhtml'),(8,11,NULL,'xhtml');
/*!40000 ALTER TABLE `exp_channel_data_field_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data_field_5`
--

DROP TABLE IF EXISTS `exp_channel_data_field_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data_field_5` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `field_id_5` text COLLATE utf8mb4_unicode_ci,
  `field_ft_5` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data_field_5`
--

LOCK TABLES `exp_channel_data_field_5` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_5` DISABLE KEYS */;
INSERT INTO `exp_channel_data_field_5` VALUES (1,4,NULL,'xhtml'),(2,5,'','xhtml'),(3,6,NULL,'xhtml'),(4,7,NULL,'xhtml'),(5,8,NULL,'xhtml'),(6,9,NULL,'xhtml'),(7,10,NULL,'xhtml'),(8,11,'','xhtml');
/*!40000 ALTER TABLE `exp_channel_data_field_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data_field_6`
--

DROP TABLE IF EXISTS `exp_channel_data_field_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data_field_6` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `field_id_6` text COLLATE utf8mb4_unicode_ci,
  `field_ft_6` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data_field_6`
--

LOCK TABLES `exp_channel_data_field_6` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_6` DISABLE KEYS */;
INSERT INTO `exp_channel_data_field_6` VALUES (1,1,'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.','xhtml'),(2,2,'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.','xhtml'),(3,3,'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.','xhtml'),(4,12,'Cupcake ipsum dolor sit. Amet I love liquorice jujubes pudding croissant I love pudding. Apple pie macaroon toffee jujubes pie tart cookie applicake caramels. Halvah macaroon I love lollipop. Wypas I love pudding brownie cheesecake tart jelly-o. Bear claw cookie chocolate bar jujubes toffee.','xhtml');
/*!40000 ALTER TABLE `exp_channel_data_field_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data_field_7`
--

DROP TABLE IF EXISTS `exp_channel_data_field_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data_field_7` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `field_id_7` text COLLATE utf8mb4_unicode_ci,
  `field_ft_7` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data_field_7`
--

LOCK TABLES `exp_channel_data_field_7` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_7` DISABLE KEYS */;
INSERT INTO `exp_channel_data_field_7` VALUES (1,12,'','xhtml');
/*!40000 ALTER TABLE `exp_channel_data_field_7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data_field_8`
--

DROP TABLE IF EXISTS `exp_channel_data_field_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data_field_8` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `field_id_8` text COLLATE utf8mb4_unicode_ci,
  `field_ft_8` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data_field_8`
--

LOCK TABLES `exp_channel_data_field_8` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_8` DISABLE KEYS */;
INSERT INTO `exp_channel_data_field_8` VALUES (1,12,'user@example.com','none');
/*!40000 ALTER TABLE `exp_channel_data_field_8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_data_field_9`
--

DROP TABLE IF EXISTS `exp_channel_data_field_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_data_field_9` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `field_id_9` text COLLATE utf8mb4_unicode_ci,
  `field_ft_9` tinytext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_data_field_9`
--

LOCK TABLES `exp_channel_data_field_9` WRITE;
/*!40000 ALTER TABLE `exp_channel_data_field_9` DISABLE KEYS */;
INSERT INTO `exp_channel_data_field_9` VALUES (1,12,'(555) 123-4567','none');
/*!40000 ALTER TABLE `exp_channel_data_field_9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_entries_autosave`
--

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `original_entry_id` int(10) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  `entry_data` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`(191)),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_entries_autosave`
--

LOCK TABLES `exp_channel_entries_autosave` WRITE;
/*!40000 ALTER TABLE `exp_channel_entries_autosave` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_entries_autosave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_field_groups_fields`
--

DROP TABLE IF EXISTS `exp_channel_field_groups_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_field_groups_fields` (
  `field_id` int(6) unsigned NOT NULL,
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`field_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_field_groups_fields`
--

LOCK TABLES `exp_channel_field_groups_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_field_groups_fields` DISABLE KEYS */;
INSERT INTO `exp_channel_field_groups_fields` VALUES (1,1),(2,2),(3,2),(4,2),(5,2),(6,3),(7,4),(8,4),(9,4),(10,5),(11,5);
/*!40000 ALTER TABLE `exp_channel_field_groups_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_fields`
--

DROP TABLE IF EXISTS `exp_channel_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_instructions` text COLLATE utf8mb4_unicode_ci,
  `field_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_pre_populate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) unsigned DEFAULT NULL,
  `field_pre_field_id` int(6) unsigned DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_order` int(3) unsigned NOT NULL,
  `field_content_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'any',
  `field_settings` text COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`field_id`),
  KEY `field_type` (`field_type`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_fields`
--

LOCK TABLES `exp_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channel_fields` DISABLE KEYS */;
INSERT INTO `exp_channel_fields` VALUES (1,0,'about_image','About Image','Image for the about page.','grid','','n',NULL,NULL,8,NULL,'n','ltr','n','n','xhtml','y',7,'any','YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==','n'),(2,0,'blog_audio','Audio','Audio clip for this blog.','grid','','n',NULL,NULL,8,NULL,'n','ltr','n','n','xhtml','y',3,'any','YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==','n'),(3,0,'blog_content','Content','Content for this blog entry.','textarea','','n',NULL,NULL,10,NULL,'n','ltr','y','n','xhtml','y',1,'any','YTozOntzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO30=','n'),(4,0,'blog_image','Image','Photograph, comic, any image you like.','grid','','n',NULL,NULL,8,NULL,'n','ltr','n','n','xhtml','y',4,'any','YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==','n'),(5,0,'blog_video','Video','Video for this blog.','grid','','n',NULL,NULL,8,NULL,'n','ltr','n','n','xhtml','y',2,'any','YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==','n'),(6,0,'page_content','Page Content','Content for this page.','textarea','','n',NULL,NULL,10,NULL,'n','ltr','y','n','xhtml','y',3,'any','YTozOntzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO30=','n'),(7,0,'contact_address','Contact Address','Address where someone can send mail.','grid','','n',NULL,NULL,8,NULL,'n','ltr','n','n','xhtml','y',4,'any','YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==','n'),(8,0,'contact_email','Contact Email','Email address someone can send Email to.','text','','n',NULL,NULL,8,256,'n','ltr','n','n','none','y',6,'','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtpOjI1NjtzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO30=','n'),(9,0,'contact_phone','Contact Phone','Phone number someone can call.','text','','n',NULL,NULL,8,256,'n','ltr','n','n','none','y',5,'','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtpOjI1NjtzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO30=','n'),(10,0,'seo_desc','SEO Description','Page Description for use in HTML meta description tag, generally only seen by machines.','textarea','','n',NULL,NULL,2,NULL,'n','ltr','n','n','xhtml','y',6,'any','YTozOntzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO30=','n'),(11,0,'seo_title','SEO Title','Page title that will be added to browser titlebar/tab.','text','','n',NULL,NULL,8,256,'n','ltr','n','n','none','y',5,'','YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtpOjI1NjtzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO30=','n');
/*!40000 ALTER TABLE `exp_channel_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_form_settings`
--

DROP TABLE IF EXISTS `exp_channel_form_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '0',
  `channel_id` int(6) unsigned NOT NULL DEFAULT '0',
  `default_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `allow_guest_posts` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `default_author` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_form_settings_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_form_settings`
--

LOCK TABLES `exp_channel_form_settings` WRITE;
/*!40000 ALTER TABLE `exp_channel_form_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_form_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_1`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_1` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `fluid_field_data_id` int(10) unsigned DEFAULT '0',
  `col_id_1` text COLLATE utf8mb4_unicode_ci,
  `col_id_2` text COLLATE utf8mb4_unicode_ci,
  `col_id_3` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_1`
--

LOCK TABLES `exp_channel_grid_field_1` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_1` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_1` VALUES (1,1,0,0,'{filedir_7}common.jpg','Dharmafrog, 2014','right'),(2,2,0,0,'{filedir_7}common.jpg','Dharmafrog, 2014','left'),(3,3,0,0,'{filedir_7}common.jpg','Dharmafrog, 2014','none');
/*!40000 ALTER TABLE `exp_channel_grid_field_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_2`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_2` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `fluid_field_data_id` int(10) unsigned DEFAULT '0',
  `col_id_4` text COLLATE utf8mb4_unicode_ci,
  `col_id_5` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_2`
--

LOCK TABLES `exp_channel_grid_field_2` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_2` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_2` VALUES (1,7,0,0,'3925868830','bandcamp'),(2,10,0,0,'164768245','soundcloud');
/*!40000 ALTER TABLE `exp_channel_grid_field_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_4`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_4` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `fluid_field_data_id` int(10) unsigned DEFAULT '0',
  `col_id_6` text COLLATE utf8mb4_unicode_ci,
  `col_id_7` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_4`
--

LOCK TABLES `exp_channel_grid_field_4` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_4` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_4` VALUES (1,4,0,0,'{filedir_6}blog.jpg','Dharmafrog, 2014');
/*!40000 ALTER TABLE `exp_channel_grid_field_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_5`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_5` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `fluid_field_data_id` int(10) unsigned DEFAULT '0',
  `col_id_8` text COLLATE utf8mb4_unicode_ci,
  `col_id_9` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_5`
--

LOCK TABLES `exp_channel_grid_field_5` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_5` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_5` VALUES (1,5,0,0,'113439313','vimeo'),(2,11,0,0,'eCNwxqP7l44','youtube');
/*!40000 ALTER TABLE `exp_channel_grid_field_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_grid_field_7`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_grid_field_7` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `row_order` int(10) unsigned DEFAULT NULL,
  `fluid_field_data_id` int(10) unsigned DEFAULT '0',
  `col_id_10` text COLLATE utf8mb4_unicode_ci,
  `col_id_11` text COLLATE utf8mb4_unicode_ci,
  `col_id_12` text COLLATE utf8mb4_unicode_ci,
  `col_id_13` text COLLATE utf8mb4_unicode_ci,
  `col_id_14` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`row_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_grid_field_7`
--

LOCK TABLES `exp_channel_grid_field_7` WRITE;
/*!40000 ALTER TABLE `exp_channel_grid_field_7` DISABLE KEYS */;
INSERT INTO `exp_channel_grid_field_7` VALUES (1,12,0,0,'1234 Any Street','Suite 2','Anywhere','ES','12345');
/*!40000 ALTER TABLE `exp_channel_grid_field_7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_member_groups`
--

DROP TABLE IF EXISTS `exp_channel_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `channel_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_member_groups`
--

LOCK TABLES `exp_channel_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_channel_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channel_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channel_titles`
--

DROP TABLE IF EXISTS `exp_channel_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(4) unsigned NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_two` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_three` int(10) unsigned NOT NULL DEFAULT '0',
  `view_count_four` int(10) unsigned NOT NULL DEFAULT '0',
  `allow_comments` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `sticky` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `entry_date` int(10) NOT NULL,
  `year` char(4) COLLATE utf8mb4_unicode_ci NOT NULL,
  `month` char(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` char(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration_date` int(10) NOT NULL DEFAULT '0',
  `comment_expiration_date` int(10) NOT NULL DEFAULT '0',
  `edit_date` bigint(14) DEFAULT NULL,
  `recent_comment_date` int(10) DEFAULT NULL,
  `comment_total` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `url_title` (`url_title`(191)),
  KEY `status` (`status`),
  KEY `entry_date` (`entry_date`),
  KEY `expiration_date` (`expiration_date`),
  KEY `site_id` (`site_id`),
  KEY `sticky_date_id_idx` (`sticky`,`entry_date`,`entry_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channel_titles`
--

LOCK TABLES `exp_channel_titles` WRITE;
/*!40000 ALTER TABLE `exp_channel_titles` DISABLE KEYS */;
INSERT INTO `exp_channel_titles` VALUES (4,1,2,1,NULL,'192.168.33.1','EEntry with large photograph','a-photograph-for-the-ages','open',1,'n',0,0,0,0,'y','n',1515540988,'2018','01','09',0,0,NULL,NULL,0),(5,1,2,1,NULL,'192.168.33.1','Entry with vimeo video, lots of comments','action-comedy-how-to','open',1,'n',0,0,0,0,'y','n',1515540988,'2018','01','09',0,0,NULL,1515541007,11),(6,1,2,1,NULL,'192.168.33.1','Entry with a lot of text, and comments disabled.','bacon-blog','open',1,'n',0,0,0,0,'n','n',1515540988,'2018','01','09',0,0,NULL,NULL,0),(7,1,2,1,NULL,'192.168.33.1','Entry with BandCamp audio, comments, and comments disabled','marrow-and-the-broken-bones','open',1,'n',0,0,0,0,'n','n',1515540988,'2018','01','09',0,0,NULL,1515540999,2),(8,1,2,1,NULL,'192.168.33.1','Super old entry.','super-old-entry','open',1,'n',0,0,0,0,'n','n',1515540988,'2018','01','09',0,0,NULL,NULL,0),(9,1,2,1,NULL,'192.168.33.1','Entry with text, and comments','the-hip-one','open',1,'n',0,0,0,0,'y','n',1515540988,'2018','01','09',0,0,NULL,1515541000,2),(10,1,2,1,NULL,'192.168.33.1','Entry with SoundCloud audio','the-one-where-we-shake-it-ff','open',1,'n',0,0,0,0,'y','n',1515540988,'2018','01','09',0,0,NULL,NULL,0),(11,1,2,1,NULL,'192.168.33.1','Entry with YouTube video','the-one-with-rope-cutting','open',1,'n',0,0,0,0,'y','n',1515540988,'2018','01','09',0,0,NULL,NULL,0),(12,1,3,1,NULL,'192.168.33.1','Contact Us','contact-us','open',1,'n',0,0,0,0,'y','n',1515540988,'2018','01','09',0,0,NULL,NULL,0);
/*!40000 ALTER TABLE `exp_channel_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channels`
--

DROP TABLE IF EXISTS `exp_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channels` (
  `channel_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_lang` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_records` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `search_excerpt` int(4) unsigned DEFAULT NULL,
  `deft_category` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) unsigned DEFAULT NULL,
  `channel_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `extra_publish_controls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_allow_img_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_auto_link_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `channel_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_system_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_require_membership` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_moderate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_max_chars` int(5) unsigned DEFAULT '5000',
  `comment_timelock` int(5) unsigned NOT NULL DEFAULT '0',
  `comment_require_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_notify` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_expiration` int(4) unsigned NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rss_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_versioning` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) unsigned NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_field_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Title',
  `url_title_prefix` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_look_template` int(10) unsigned NOT NULL DEFAULT '0',
  `max_entries` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`channel_id`),
  KEY `cat_group` (`cat_group`(191)),
  KEY `channel_name` (`channel_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channels`
--

LOCK TABLES `exp_channels` WRITE;
/*!40000 ALTER TABLE `exp_channels` DISABLE KEYS */;
INSERT INTO `exp_channels` VALUES (2,1,'blog','Blog','{path=\'blog/entry\'}',NULL,'en',8,8,0,1515540988,0,'1','open',NULL,NULL,'y','y',NULL,'all','n','y','n','n',NULL,NULL,'y','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'n',10,NULL,'Title',NULL,0,0),(3,1,'contact','Contact','',NULL,'en',1,1,0,1515540988,0,NULL,'open',NULL,NULL,'y','y',NULL,'all','n','y','n','n',NULL,NULL,'y','n','n',5000,0,'y','xhtml','safe','n','y','n','n',NULL,0,NULL,NULL,'n',10,NULL,'Title',NULL,0,0);
/*!40000 ALTER TABLE `exp_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channels_channel_field_groups`
--

DROP TABLE IF EXISTS `exp_channels_channel_field_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channels_channel_field_groups` (
  `channel_id` int(4) unsigned NOT NULL,
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channels_channel_field_groups`
--

LOCK TABLES `exp_channels_channel_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_channels_channel_field_groups` DISABLE KEYS */;
INSERT INTO `exp_channels_channel_field_groups` VALUES (2,2),(2,5),(3,3),(3,4),(3,5);
/*!40000 ALTER TABLE `exp_channels_channel_field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channels_channel_fields`
--

DROP TABLE IF EXISTS `exp_channels_channel_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channels_channel_fields` (
  `channel_id` int(4) unsigned NOT NULL,
  `field_id` int(6) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channels_channel_fields`
--

LOCK TABLES `exp_channels_channel_fields` WRITE;
/*!40000 ALTER TABLE `exp_channels_channel_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_channels_channel_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_channels_statuses`
--

DROP TABLE IF EXISTS `exp_channels_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_channels_statuses` (
  `channel_id` int(4) unsigned NOT NULL,
  `status_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`channel_id`,`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_channels_statuses`
--

LOCK TABLES `exp_channels_statuses` WRITE;
/*!40000 ALTER TABLE `exp_channels_statuses` DISABLE KEYS */;
INSERT INTO `exp_channels_statuses` VALUES (2,1),(2,2),(3,1),(3,2);
/*!40000 ALTER TABLE `exp_channels_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_comment_subscriptions`
--

DROP TABLE IF EXISTS `exp_comment_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_date` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_sent` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  `hash` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`subscription_id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_comment_subscriptions`
--

LOCK TABLES `exp_comment_subscriptions` WRITE;
/*!40000 ALTER TABLE `exp_comment_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_comment_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_comments`
--

DROP TABLE IF EXISTS `exp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_comments` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) unsigned DEFAULT '0',
  `channel_id` int(4) unsigned DEFAULT '1',
  `author_id` int(10) unsigned DEFAULT '0',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`comment_id`),
  KEY `entry_id` (`entry_id`),
  KEY `channel_id` (`channel_id`),
  KEY `author_id` (`author_id`),
  KEY `status` (`status`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_comments`
--

LOCK TABLES `exp_comments` WRITE;
/*!40000 ALTER TABLE `exp_comments` DISABLE KEYS */;
INSERT INTO `exp_comments` VALUES (1,1,5,2,1,'o','mrubio','miguelantonio.rubio@gmail.com','http://bajamls.local/',NULL,'127.0.0.1',1515540995,NULL,'This is a great video! Thanks for sharing!'),(2,1,5,2,1,'o','mrubio','miguelantonio.rubio@gmail.com','http://bajamls.local/',NULL,'127.0.0.1',1515540996,NULL,'Woot, love it!'),(3,1,5,2,0,'o','Guest one','example@example.com','http://example.com/','Everywhere','127.0.0.1',1515540998,NULL,'This is a comment by a guest to the site, unregistered, with a url and a location.'),(4,1,5,2,0,'o','Guest two','example@example.com','','','127.0.0.1',1515540999,NULL,'This is a comment by an unregistered guest without a url, or a location.'),(5,1,5,2,1,'o','mrubio','miguelantonio.rubio@gmail.com','http://bajamls.local/',NULL,'127.0.0.1',1515541000,NULL,'I really can\'t get enough of this kind of appraisal.'),(6,1,5,2,0,'o','Mr. Meanie','example@example.com','','','127.0.0.1',1515541001,NULL,'I\'m a bad person, and people should not like me, and I say troll things all the time.'),(7,1,5,2,1,'o','mrubio','miguelantonio.rubio@gmail.com','http://bajamls.local/',NULL,'127.0.0.1',1515541002,NULL,'Ugh, what a troll.'),(8,1,5,2,0,'o','Peter Winkle','peter@example.com','','','127.0.0.1',1515541004,NULL,'This is a guest comment, from one Mr. Peter Winkle.'),(9,1,5,2,0,'o','Fancy Falls','fancy@example.com','http://example.com','Fancy Factory','127.0.0.1',1515541005,NULL,'Fancy, I do say!'),(10,1,5,2,0,'o','Pauline Paxton','pauline@example.com','','','127.0.0.1',1515541006,NULL,'Hello my name is Pauline Paxton, and I lurve Jackie Chan.'),(11,1,5,2,1,'o','mrubio','miguelantonio.rubio@gmail.com','http://bajamls.local/',NULL,'127.0.0.1',1515541007,NULL,'Test'),(12,1,7,2,1,'o','mrubio','miguelantonio.rubio@gmail.com','http://bajamls.local/',NULL,'127.0.0.1',1515540998,NULL,'This is a comment.\n\nfugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(13,1,7,2,0,'o','Quest one','example@example.com','','','127.0.0.1',1515540999,NULL,'This is a comment from a Quest ;)\n\nfugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),(14,1,9,2,1,'o','mrubio','miguelantonio.rubio@gmail.com','http://bajamls.local/',NULL,'127.0.0.1',1515540999,NULL,'This is an author comment.'),(15,1,9,2,0,'o','Guest one','example@example.com','','','127.0.0.1',1515541000,NULL,'This is a guest comment.');
/*!40000 ALTER TABLE `exp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_content_types`
--

DROP TABLE IF EXISTS `exp_content_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_content_types` (
  `content_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`content_type_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_content_types`
--

LOCK TABLES `exp_content_types` WRITE;
/*!40000 ALTER TABLE `exp_content_types` DISABLE KEYS */;
INSERT INTO `exp_content_types` VALUES (2,'channel'),(1,'grid');
/*!40000 ALTER TABLE `exp_content_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_cp_log`
--

DROP TABLE IF EXISTS `exp_cp_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_cp_log`
--

LOCK TABLES `exp_cp_log` WRITE;
/*!40000 ALTER TABLE `exp_cp_log` DISABLE KEYS */;
INSERT INTO `exp_cp_log` VALUES (1,1,1,'mrubio','192.168.33.1',1515541014,'Logged in'),(2,1,1,'mrubio','192.168.33.1',1515547260,'Logged in'),(3,1,1,'mrubio','192.168.33.1',1515549362,'Logged in'),(4,1,1,'mrubio','192.168.33.1',1515619016,'Logged in'),(5,1,1,'mrubio','192.168.33.1',1515699557,'Logged in'),(6,1,1,'mrubio','192.168.33.1',1515801445,'Logged in'),(7,1,1,'mrubio','192.168.33.1',1515813571,'Logged in'),(8,1,1,'mrubio','192.168.33.1',1516125435,'Logged in'),(9,1,1,'mrubio','192.168.33.1',1516131087,'Logged in'),(10,1,1,'mrubio','192.168.33.1',1516144566,'Logged in'),(11,1,1,'mrubio','192.168.33.1',1516221040,'Logged in'),(12,1,1,'mrubio','192.168.33.1',1516312262,'Logged in'),(13,1,1,'mrubio','192.168.33.1',1516316323,'Logged in'),(14,1,1,'mrubio','192.168.33.1',1516416780,'Logged in'),(15,1,1,'mrubio','192.168.33.1',1516658352,'Logged in'),(16,1,1,'mrubio','192.168.33.1',1516760971,'Logged in');
/*!40000 ALTER TABLE `exp_cp_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_developer_log`
--

DROP TABLE IF EXISTS `exp_developer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_developer_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL,
  `viewed` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `description` text COLLATE utf8mb4_unicode_ci,
  `function` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deprecated_since` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_instead` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` int(10) unsigned NOT NULL DEFAULT '0',
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_group` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snippets` text COLLATE utf8mb4_unicode_ci,
  `hash` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_developer_log`
--

LOCK TABLES `exp_developer_log` WRITE;
/*!40000 ALTER TABLE `exp_developer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_developer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache`
--

DROP TABLE IF EXISTS `exp_email_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `total_sent` int(6) unsigned NOT NULL,
  `from_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `cc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bcc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_array` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `plaintext_alt` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailtype` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `wordwrap` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `attachments` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache`
--

LOCK TABLES `exp_email_cache` WRITE;
/*!40000 ALTER TABLE `exp_email_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache_mg`
--

DROP TABLE IF EXISTS `exp_email_cache_mg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) unsigned NOT NULL,
  `group_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache_mg`
--

LOCK TABLES `exp_email_cache_mg` WRITE;
/*!40000 ALTER TABLE `exp_email_cache_mg` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache_mg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_cache_ml`
--

DROP TABLE IF EXISTS `exp_email_cache_ml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) unsigned NOT NULL,
  `list_id` smallint(4) NOT NULL,
  PRIMARY KEY (`cache_id`,`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_cache_ml`
--

LOCK TABLES `exp_email_cache_ml` WRITE;
/*!40000 ALTER TABLE `exp_email_cache_ml` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_cache_ml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_email_console_cache`
--

DROP TABLE IF EXISTS `exp_email_console_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `cache_date` int(10) unsigned NOT NULL DEFAULT '0',
  `member_id` int(10) unsigned NOT NULL,
  `member_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `recipient` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_email_console_cache`
--

LOCK TABLES `exp_email_console_cache` WRITE;
/*!40000 ALTER TABLE `exp_email_console_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_email_console_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_entry_versioning`
--

DROP TABLE IF EXISTS `exp_entry_versioning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(10) unsigned NOT NULL,
  `channel_id` int(4) unsigned NOT NULL,
  `author_id` int(10) unsigned NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version_id`),
  KEY `entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_entry_versioning`
--

LOCK TABLES `exp_entry_versioning` WRITE;
/*!40000 ALTER TABLE `exp_entry_versioning` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_entry_versioning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_extensions`
--

DROP TABLE IF EXISTS `exp_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_extensions` (
  `extension_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hook` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`extension_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_extensions`
--

LOCK TABLES `exp_extensions` WRITE;
/*!40000 ALTER TABLE `exp_extensions` DISABLE KEYS */;
INSERT INTO `exp_extensions` VALUES (1,'Comment_ext','addCommentMenu','cp_custom_menu','a:0:{}',10,'2.3.3','y'),(2,'Rte_ext','myaccount_nav_setup','myaccount_nav_setup','',10,'1.0.1','y'),(3,'Rte_ext','cp_menu_array','cp_menu_array','',10,'1.0.1','y');
/*!40000 ALTER TABLE `exp_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_field_groups`
--

DROP TABLE IF EXISTS `exp_field_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_field_groups` (
  `group_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_field_groups`
--

LOCK TABLES `exp_field_groups` WRITE;
/*!40000 ALTER TABLE `exp_field_groups` DISABLE KEYS */;
INSERT INTO `exp_field_groups` VALUES (1,0,'about'),(2,0,'blog'),(3,0,'common'),(4,0,'contact'),(5,0,'seo');
/*!40000 ALTER TABLE `exp_field_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_fieldtypes`
--

DROP TABLE IF EXISTS `exp_fieldtypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `has_global_settings` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  PRIMARY KEY (`fieldtype_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_fieldtypes`
--

LOCK TABLES `exp_fieldtypes` WRITE;
/*!40000 ALTER TABLE `exp_fieldtypes` DISABLE KEYS */;
INSERT INTO `exp_fieldtypes` VALUES (1,'select','1.0.0','YTowOnt9','n'),(2,'text','1.0.0','YTowOnt9','n'),(3,'textarea','1.0.0','YTowOnt9','n'),(4,'date','1.0.0','YTowOnt9','n'),(5,'duration','1.0.0','YTowOnt9','n'),(6,'email_address','1.0.0','YTowOnt9','n'),(7,'file','1.0.0','YTowOnt9','n'),(8,'fluid_field','1.0.0','YTowOnt9','n'),(9,'grid','1.0.0','YTowOnt9','n'),(10,'multi_select','1.0.0','YTowOnt9','n'),(11,'checkboxes','1.0.0','YTowOnt9','n'),(12,'radio','1.0.0','YTowOnt9','n'),(13,'relationship','1.0.0','YTowOnt9','n'),(14,'rte','1.0.1','YTowOnt9','n'),(15,'toggle','1.0.0','YTowOnt9','n'),(16,'url','1.0.0','YTowOnt9','n');
/*!40000 ALTER TABLE `exp_fieldtypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_categories`
--

DROP TABLE IF EXISTS `exp_file_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_file_categories` (
  `file_id` int(10) unsigned NOT NULL,
  `cat_id` int(10) unsigned NOT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `is_cover` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  PRIMARY KEY (`file_id`,`cat_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_categories`
--

LOCK TABLES `exp_file_categories` WRITE;
/*!40000 ALTER TABLE `exp_file_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_file_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_dimensions`
--

DROP TABLE IF EXISTS `exp_file_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_file_dimensions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `upload_location_id` int(4) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `resize_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `quality` tinyint(1) unsigned DEFAULT '90',
  `watermark_id` int(4) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `upload_location_id` (`upload_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_dimensions`
--

LOCK TABLES `exp_file_dimensions` WRITE;
/*!40000 ALTER TABLE `exp_file_dimensions` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_file_dimensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_file_watermarks`
--

DROP TABLE IF EXISTS `exp_file_watermarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `wm_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `wm_image_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_test_image_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_font` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_font` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_font_size` int(3) unsigned DEFAULT NULL,
  `wm_text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'top',
  `wm_hor_alignment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'left',
  `wm_padding` int(3) unsigned DEFAULT NULL,
  `wm_opacity` int(3) unsigned DEFAULT NULL,
  `wm_hor_offset` int(4) unsigned DEFAULT NULL,
  `wm_vrt_offset` int(4) unsigned DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_drop_shadow` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_shadow_distance` int(3) unsigned DEFAULT NULL,
  `wm_shadow_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`wm_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_file_watermarks`
--

LOCK TABLES `exp_file_watermarks` WRITE;
/*!40000 ALTER TABLE `exp_file_watermarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_file_watermarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_files`
--

DROP TABLE IF EXISTS `exp_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned DEFAULT '1',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_location_id` int(4) unsigned DEFAULT '0',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `credit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by_member_id` int(10) unsigned DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) unsigned DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`file_id`),
  KEY `upload_location_id` (`upload_location_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_files`
--

LOCK TABLES `exp_files` WRITE;
/*!40000 ALTER TABLE `exp_files` DISABLE KEYS */;
INSERT INTO `exp_files` VALUES (1,1,'blog.jpg',6,'image/jpeg','blog.jpg',339111,NULL,NULL,NULL,1,1515540994,1,1515540994,'900 1200'),(2,1,'common.jpg',7,'image/jpeg','common.jpg',339111,NULL,NULL,NULL,1,1515540994,1,1515540994,'900 1200'),(3,1,'lake.jpg',8,'image/jpeg','lake.jpg',286878,NULL,NULL,NULL,1,1515540994,1,1515540994,'502 1200'),(4,1,'ocean.jpg',8,'image/jpeg','ocean.jpg',111529,NULL,NULL,NULL,1,1515540994,1,1515540994,'502 1200'),(5,1,'path.jpg',8,'image/jpeg','path.jpg',289200,NULL,NULL,NULL,1,1515540994,1,1515540994,'502 1200'),(6,1,'sky.jpg',8,'image/jpeg','sky.jpg',62326,NULL,NULL,NULL,1,1515540994,1,1515540994,'502 1200');
/*!40000 ALTER TABLE `exp_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_fluid_field_data`
--

DROP TABLE IF EXISTS `exp_fluid_field_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_fluid_field_data` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fluid_field_id` int(11) unsigned NOT NULL,
  `entry_id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `field_data_id` int(11) unsigned NOT NULL,
  `order` int(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fluid_field_id_entry_id` (`fluid_field_id`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_fluid_field_data`
--

LOCK TABLES `exp_fluid_field_data` WRITE;
/*!40000 ALTER TABLE `exp_fluid_field_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_fluid_field_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_global_variables`
--

DROP TABLE IF EXISTS `exp_global_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `variable_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variable_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`variable_id`),
  KEY `variable_name` (`variable_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_global_variables`
--

LOCK TABLES `exp_global_variables` WRITE;
/*!40000 ALTER TABLE `exp_global_variables` DISABLE KEYS */;
INSERT INTO `exp_global_variables` VALUES (1,0,'gv_comment_disabled','Commenting for this entry is <b>disabled</b>.',1515540972),(2,0,'gv_comment_expired','Commenting for this entry has <b>expired</b>.',1515540972),(3,0,'gv_comment_ignore','You are ignoring',1515540972),(4,0,'gv_comment_none','There are <b>no</b> comments on this entry.',1515540972),(5,0,'gv_entries_none','There are <b>no</b> entries in this channel.',1515540972),(6,0,'gv_sep','&nbsp;/&nbsp;',1515540973);
/*!40000 ALTER TABLE `exp_global_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_grid_columns`
--

DROP TABLE IF EXISTS `exp_grid_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_grid_columns` (
  `col_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(10) unsigned DEFAULT NULL,
  `content_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_order` int(3) unsigned DEFAULT NULL,
  `col_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_instructions` text COLLATE utf8mb4_unicode_ci,
  `col_required` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_search` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_width` int(3) unsigned DEFAULT NULL,
  `col_settings` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`col_id`),
  KEY `field_id` (`field_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_grid_columns`
--

LOCK TABLES `exp_grid_columns` WRITE;
/*!40000 ALTER TABLE `exp_grid_columns` DISABLE KEYS */;
INSERT INTO `exp_grid_columns` VALUES (1,1,'channel',0,'file','Image','image','Upload the image you want to use.','n','n',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"all\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_fmt\":\"none\",\"field_required\":\"n\"}'),(2,1,'channel',1,'text','Caption','caption','Credit and copyright for this image.','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(3,1,'channel',2,'select','Alignment?','align','Align this image ot the left or right?','n','n',0,'{\"field_fmt\":\"none\",\"field_pre_populate\":\"n\",\"field_list_items\":\"none\\nleft\\nright\",\"value_label_pairs\":[],\"field_required\":\"n\"}'),(4,2,'channel',0,'text','ID','id','Audio ID, i.e. 177363559','n','y',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(5,2,'channel',1,'select','Type','type','Type of audio, choose one.','n','n',0,'{\"field_fmt\":\"none\",\"field_pre_populate\":\"n\",\"field_list_items\":\"soundcloud\\nbandcamp\",\"value_label_pairs\":[],\"field_required\":\"n\"}'),(6,4,'channel',0,'file','Image','image','Upload the image you want to use.','n','y',0,'{\"field_content_type\":\"image\",\"allowed_directories\":\"all\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_fmt\":\"none\",\"field_required\":\"n\"}'),(7,4,'channel',1,'text','Caption','caption','Credit and copyright for this image.','n','y',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(8,5,'channel',0,'text','ID','id','Video ID, i.e. 8OcydG0RiqI','n','y',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(9,5,'channel',1,'select','Type','type','Type of video, choose one.','n','y',0,'{\"field_fmt\":\"none\",\"field_pre_populate\":\"n\",\"field_list_items\":\"youtube\\nvimeo\",\"value_label_pairs\":[],\"field_required\":\"n\"}'),(10,7,'channel',0,'text','Street','street','Street address','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(11,7,'channel',1,'text','Street 2','street_2','Street address continued, e.g. Suite 2','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(12,7,'channel',2,'text','City','city','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(13,7,'channel',3,'text','State','state','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),(14,7,'channel',4,'text','ZIP','zip','','n','n',0,'{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}');
/*!40000 ALTER TABLE `exp_grid_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_html_buttons`
--

DROP TABLE IF EXISTS `exp_html_buttons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_html_buttons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_open` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_close` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accesskey` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_order` int(3) unsigned NOT NULL,
  `tag_row` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `classname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_html_buttons`
--

LOCK TABLES `exp_html_buttons` WRITE;
/*!40000 ALTER TABLE `exp_html_buttons` DISABLE KEYS */;
INSERT INTO `exp_html_buttons` VALUES (1,1,0,'html_btn_bold','<strong>','</strong>','b',1,'1','html-bold'),(2,1,0,'html_btn_italic','<em>','</em>','i',2,'1','html-italic'),(3,1,0,'html_btn_blockquote','<blockquote>','</blockquote>','q',3,'1','html-quote'),(4,1,0,'html_btn_anchor','<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>','</a>','a',4,'1','html-link'),(5,1,0,'html_btn_picture','<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />','','',5,'1','html-upload');
/*!40000 ALTER TABLE `exp_html_buttons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_layout_publish`
--

DROP TABLE IF EXISTS `exp_layout_publish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `channel_id` int(4) unsigned NOT NULL DEFAULT '0',
  `layout_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_layout` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`layout_id`),
  KEY `site_id` (`site_id`),
  KEY `channel_id` (`channel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_layout_publish`
--

LOCK TABLES `exp_layout_publish` WRITE;
/*!40000 ALTER TABLE `exp_layout_publish` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_layout_publish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_layout_publish_member_groups`
--

DROP TABLE IF EXISTS `exp_layout_publish_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_layout_publish_member_groups` (
  `layout_id` int(10) unsigned NOT NULL,
  `group_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`layout_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_layout_publish_member_groups`
--

LOCK TABLES `exp_layout_publish_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_layout_publish_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_layout_publish_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_bulletin_board`
--

DROP TABLE IF EXISTS `exp_member_bulletin_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `bulletin_group` int(8) unsigned NOT NULL,
  `bulletin_date` int(10) unsigned NOT NULL,
  `hash` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bulletin_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `bulletin_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`bulletin_id`),
  KEY `sender_id` (`sender_id`),
  KEY `hash` (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_bulletin_board`
--

LOCK TABLES `exp_member_bulletin_board` WRITE;
/*!40000 ALTER TABLE `exp_member_bulletin_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_bulletin_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_data`
--

DROP TABLE IF EXISTS `exp_member_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_data` (
  `member_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_data`
--

LOCK TABLES `exp_member_data` WRITE;
/*!40000 ALTER TABLE `exp_member_data` DISABLE KEYS */;
INSERT INTO `exp_member_data` VALUES (1);
/*!40000 ALTER TABLE `exp_member_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_fields`
--

DROP TABLE IF EXISTS `exp_member_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `m_field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_type` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `m_field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `m_field_ta_rows` tinyint(2) DEFAULT '8',
  `m_field_maxl` smallint(3) DEFAULT NULL,
  `m_field_width` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_field_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_public` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_reg` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_cp_reg` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `m_field_fmt` char(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `m_field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_order` int(3) unsigned DEFAULT NULL,
  `m_field_text_direction` char(3) COLLATE utf8mb4_unicode_ci DEFAULT 'ltr',
  `m_field_settings` text COLLATE utf8mb4_unicode_ci,
  `m_legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`m_field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_fields`
--

LOCK TABLES `exp_member_fields` WRITE;
/*!40000 ALTER TABLE `exp_member_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_groups`
--

DROP TABLE IF EXISTS `exp_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `menu_set_id` int(5) unsigned NOT NULL DEFAULT '1',
  `group_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_locked` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_offline_system` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_online_system` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `can_access_cp` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `can_access_footer_report_bug` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_footer_new_ticket` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_footer_user_guide` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_homepage_news` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `can_access_files` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_design` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_addons` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_members` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_sys_prefs` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_comm` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_utilities` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_logs` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_channels` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_design` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_members` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_mbr_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_mbr_templates` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_ban_users` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_admin_addons` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_categories` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_categories` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_other_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_other_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_assign_post_authors` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_self_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_all_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_other_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_own_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_own_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_all_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_all_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_moderate_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_send_cached_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_email_member_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_email_from_profile` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_view_profiles` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_html_buttons` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_self` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `mbr_delete_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_post_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `exclude_from_moderation` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `search_flood_control` mediumint(5) unsigned NOT NULL,
  `can_send_private_messages` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) unsigned NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) unsigned NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `cp_homepage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` int(10) unsigned NOT NULL DEFAULT '0',
  `cp_homepage_custom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `can_create_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_self_entries` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_upload_new_files` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_files` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_files` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_upload_new_toolsets` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_toolsets` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_toolsets` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_upload_directories` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_upload_directories` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_upload_directories` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_channels` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_channels` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_channels` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_channel_fields` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_channel_fields` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_channel_fields` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_statuses` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_statuses` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_statuses` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_categories` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_member_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_member_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_member_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_members` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_members` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_new_templates` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_templates` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_templates` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_template_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_template_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_template_groups` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_template_partials` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_template_partials` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_template_partials` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_create_template_variables` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_delete_template_variables` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_edit_template_variables` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_security_settings` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_translate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_import` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_access_sql_manager` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_moderate_spam` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`,`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_groups`
--

LOCK TABLES `exp_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_member_groups` DISABLE KEYS */;
INSERT INTO `exp_member_groups` VALUES (1,1,1,'Super Admin','','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y',NULL,'y','y','y',0,'y',20,60,'y','y','y','y',NULL,0,NULL,'y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y','y'),(2,1,1,'Banned','','n','n','n','n','n','n','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n',NULL,'n','n','n',60,'n',20,60,'n','n','n','n',NULL,0,NULL,'n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n'),(3,1,1,'Guests','','n','n','y','n','n','n','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n',NULL,'n','n','n',10,'n',20,60,'n','n','n','y',NULL,0,NULL,'n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n'),(4,1,1,'Pending','','n','n','y','n','n','n','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n',NULL,'n','n','n',10,'n',20,60,'n','n','n','y',NULL,0,NULL,'n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n'),(5,1,1,'Members','','n','n','y','n','n','n','n','y','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','y','y','y','y',NULL,'n','n','n',10,'y',20,60,'y','n','n','y',NULL,0,NULL,'n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n','n');
/*!40000 ALTER TABLE `exp_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_news_views`
--

DROP TABLE IF EXISTS `exp_member_news_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_news_views` (
  `news_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_news_views`
--

LOCK TABLES `exp_member_news_views` WRITE;
/*!40000 ALTER TABLE `exp_member_news_views` DISABLE KEYS */;
INSERT INTO `exp_member_news_views` VALUES (1,'4.0.4',1);
/*!40000 ALTER TABLE `exp_member_news_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_member_search`
--

DROP TABLE IF EXISTS `exp_member_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `search_date` int(10) unsigned NOT NULL,
  `keywords` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_results` int(8) unsigned NOT NULL,
  `query` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `member_id` (`member_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_member_search`
--

LOCK TABLES `exp_member_search` WRITE;
/*!40000 ALTER TABLE `exp_member_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_member_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_members`
--

DROP TABLE IF EXISTS `exp_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_members` (
  `member_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` smallint(4) NOT NULL DEFAULT '0',
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `screen_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `unique_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `crypt_key` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authcode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `signature` text COLLATE utf8mb4_unicode_ci,
  `avatar_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_width` int(4) unsigned DEFAULT NULL,
  `avatar_height` int(4) unsigned DEFAULT NULL,
  `photo_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_width` int(4) unsigned DEFAULT NULL,
  `photo_height` int(4) unsigned DEFAULT NULL,
  `sig_img_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sig_img_width` int(4) unsigned DEFAULT NULL,
  `sig_img_height` int(4) unsigned DEFAULT NULL,
  `ignore_list` text COLLATE utf8mb4_unicode_ci,
  `private_messages` int(4) unsigned NOT NULL DEFAULT '0',
  `accept_messages` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `join_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visit` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_email_date` int(10) unsigned NOT NULL DEFAULT '0',
  `in_authorlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `accept_admin_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `accept_user_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `notify_by_default` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `notify_of_pm` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `display_avatars` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `display_signatures` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `parse_smileys` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `smart_notifications` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `language` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `timezone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time_format` char(2) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_format` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `include_seconds` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profile_theme` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `forum_theme` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracker` text COLLATE utf8mb4_unicode_ci,
  `template_size` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '28',
  `notepad` text COLLATE utf8mb4_unicode_ci,
  `notepad_size` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '18',
  `bookmarklets` text COLLATE utf8mb4_unicode_ci,
  `quick_links` text COLLATE utf8mb4_unicode_ci,
  `quick_tabs` text COLLATE utf8mb4_unicode_ci,
  `show_sidebar` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `pmember_id` int(10) NOT NULL DEFAULT '0',
  `rte_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `rte_toolset_id` int(10) NOT NULL DEFAULT '0',
  `cp_homepage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_custom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `group_id` (`group_id`),
  KEY `unique_id` (`unique_id`),
  KEY `password` (`password`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_members`
--

LOCK TABLES `exp_members` WRITE;
/*!40000 ALTER TABLE `exp_members` DISABLE KEYS */;
INSERT INTO `exp_members` VALUES (1,1,'mrubio','mrubio','4ff70e65bb20ff03cd8550bbaf372112d36855d7fd8154be3e1b8eba4a5672a206900f992a8c4a173ecda8865ba5dc81d84b012f1ad8fbcbeaccc64b9a3e8a8b','$o2O{F$AV^\"NBtWwby9};m)4+(1:fsIYDn(,CaLIY&|+&A@ykl[JSB_!z[?k&&!k=IVfii;fb\\8Y^]nUshzu|GNY06$#QvDO{aq/&zWF=E4d>,,L$WJExhe1ty//Q&{/','7449bb75968a239825a280749854d389b8037848','48ac06b7ff22abf620b9277e3de9dd2bf77a9913',NULL,'miguelantonio.rubio@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,'y',0,0,'192.168.33.1',1515540988,1516697574,1516765098,9,7,0,0,1515540988,1515541007,0,0,'n','y','y','y','y','y','y','y','y','english','UTC',NULL,NULL,NULL,NULL,NULL,NULL,'28',NULL,'18',NULL,'',NULL,'n',0,'y',0,NULL,NULL,NULL);
/*!40000 ALTER TABLE `exp_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_menu_items`
--

DROP TABLE IF EXISTS `exp_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_menu_items` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `set_id` int(10) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `set_id` (`set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_menu_items`
--

LOCK TABLES `exp_menu_items` WRITE;
/*!40000 ALTER TABLE `exp_menu_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_menu_sets`
--

DROP TABLE IF EXISTS `exp_menu_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_menu_sets` (
  `set_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_menu_sets`
--

LOCK TABLES `exp_menu_sets` WRITE;
/*!40000 ALTER TABLE `exp_menu_sets` DISABLE KEYS */;
INSERT INTO `exp_menu_sets` VALUES (1,'Default');
/*!40000 ALTER TABLE `exp_menu_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_attachments`
--

DROP TABLE IF EXISTS `exp_message_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_location` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_size` int(10) unsigned NOT NULL DEFAULT '0',
  `is_temp` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_attachments`
--

LOCK TABLES `exp_message_attachments` WRITE;
/*!40000 ALTER TABLE `exp_message_attachments` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_copies`
--

DROP TABLE IF EXISTS `exp_message_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `message_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `recipient_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_received` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_read` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_time_read` int(10) unsigned NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_folder` int(10) unsigned NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_deleted` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`copy_id`),
  KEY `message_id` (`message_id`),
  KEY `recipient_id` (`recipient_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_copies`
--

LOCK TABLES `exp_message_copies` WRITE;
/*!40000 ALTER TABLE `exp_message_copies` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_data`
--

DROP TABLE IF EXISTS `exp_message_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_data` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL DEFAULT '0',
  `message_date` int(10) unsigned NOT NULL DEFAULT '0',
  `message_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_tracking` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `message_attachments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_cc` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_hide_cc` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `total_recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `message_status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`message_id`),
  KEY `sender_id` (`sender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_data`
--

LOCK TABLES `exp_message_data` WRITE;
/*!40000 ALTER TABLE `exp_message_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_folders`
--

DROP TABLE IF EXISTS `exp_message_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_folders` (
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder4_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder5_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder6_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder7_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder8_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder9_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder10_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_folders`
--

LOCK TABLES `exp_message_folders` WRITE;
/*!40000 ALTER TABLE `exp_message_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_message_listed`
--

DROP TABLE IF EXISTS `exp_message_listed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_member` int(10) unsigned NOT NULL DEFAULT '0',
  `listed_description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `listed_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blocked',
  PRIMARY KEY (`listed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_message_listed`
--

LOCK TABLES `exp_message_listed` WRITE;
/*!40000 ALTER TABLE `exp_message_listed` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_message_listed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_module_member_groups`
--

DROP TABLE IF EXISTS `exp_module_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `module_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_module_member_groups`
--

LOCK TABLES `exp_module_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_module_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_module_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_modules`
--

DROP TABLE IF EXISTS `exp_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_modules` (
  `module_id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `module_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_cp_backend` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_modules`
--

LOCK TABLES `exp_modules` WRITE;
/*!40000 ALTER TABLE `exp_modules` DISABLE KEYS */;
INSERT INTO `exp_modules` VALUES (1,'Channel','2.0.1','n','n'),(2,'Comment','2.3.3','y','n'),(3,'Stats','2.0.0','n','n'),(4,'Rte','1.0.1','y','n'),(5,'File','1.0.0','n','n'),(6,'Filepicker','1.0','y','n'),(7,'Relationship','1.0.0','n','n'),(8,'Search','2.2.2','n','n');
/*!40000 ALTER TABLE `exp_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_online_users`
--

DROP TABLE IF EXISTS `exp_online_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_online_users` (
  `online_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `date` int(10) unsigned NOT NULL DEFAULT '0',
  `anon` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`online_id`),
  KEY `date` (`date`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_online_users`
--

LOCK TABLES `exp_online_users` WRITE;
/*!40000 ALTER TABLE `exp_online_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_online_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_password_lockout`
--

DROP TABLE IF EXISTS `exp_password_lockout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_date` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lockout_id`),
  KEY `login_date` (`login_date`),
  KEY `ip_address` (`ip_address`),
  KEY `user_agent` (`user_agent`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_password_lockout`
--

LOCK TABLES `exp_password_lockout` WRITE;
/*!40000 ALTER TABLE `exp_password_lockout` DISABLE KEYS */;
INSERT INTO `exp_password_lockout` VALUES (1,1515699534,'192.168.33.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','miguelrubio');
/*!40000 ALTER TABLE `exp_password_lockout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_plugins`
--

DROP TABLE IF EXISTS `exp_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_plugins` (
  `plugin_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `plugin_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_package` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_typography_related` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`plugin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_plugins`
--

LOCK TABLES `exp_plugins` WRITE;
/*!40000 ALTER TABLE `exp_plugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_relationships`
--

DROP TABLE IF EXISTS `exp_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_relationships` (
  `relationship_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `child_id` int(10) unsigned NOT NULL DEFAULT '0',
  `field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `fluid_field_data_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_field_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_col_id` int(10) unsigned NOT NULL DEFAULT '0',
  `grid_row_id` int(10) unsigned NOT NULL DEFAULT '0',
  `order` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`relationship_id`),
  KEY `parent_id` (`parent_id`),
  KEY `child_id` (`child_id`),
  KEY `field_id` (`field_id`),
  KEY `fluid_field_data_id` (`fluid_field_data_id`),
  KEY `grid_row_id` (`grid_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_relationships`
--

LOCK TABLES `exp_relationships` WRITE;
/*!40000 ALTER TABLE `exp_relationships` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_remember_me`
--

DROP TABLE IF EXISTS `exp_remember_me`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0',
  PRIMARY KEY (`remember_me_id`),
  KEY `member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_remember_me`
--

LOCK TABLES `exp_remember_me` WRITE;
/*!40000 ALTER TABLE `exp_remember_me` DISABLE KEYS */;
INSERT INTO `exp_remember_me` VALUES ('a7aa85e39478f1a2e638b0549be633b664cb8608',1,'192.168.33.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0',0,1,1516828616,1515619016);
/*!40000 ALTER TABLE `exp_remember_me` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_reset_password`
--

DROP TABLE IF EXISTS `exp_reset_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) unsigned NOT NULL,
  `resetcode` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int(10) NOT NULL,
  PRIMARY KEY (`reset_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_reset_password`
--

LOCK TABLES `exp_reset_password` WRITE;
/*!40000 ALTER TABLE `exp_reset_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_reset_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_revision_tracker`
--

DROP TABLE IF EXISTS `exp_revision_tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item_id` int(10) unsigned NOT NULL,
  `item_table` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_field` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) unsigned NOT NULL,
  `item_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`tracker_id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_revision_tracker`
--

LOCK TABLES `exp_revision_tracker` WRITE;
/*!40000 ALTER TABLE `exp_revision_tracker` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_revision_tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_rte_tools`
--

DROP TABLE IF EXISTS `exp_rte_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_rte_tools` (
  `tool_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  PRIMARY KEY (`tool_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_rte_tools`
--

LOCK TABLES `exp_rte_tools` WRITE;
/*!40000 ALTER TABLE `exp_rte_tools` DISABLE KEYS */;
INSERT INTO `exp_rte_tools` VALUES (1,'Blockquote','Blockquote_rte','y'),(2,'Bold','Bold_rte','y'),(3,'Headings','Headings_rte','y'),(4,'Image','Image_rte','y'),(5,'Italic','Italic_rte','y'),(6,'Link','Link_rte','y'),(7,'Ordered List','Ordered_list_rte','y'),(8,'Underline','Underline_rte','y'),(9,'Unordered List','Unordered_list_rte','y'),(10,'View Source','View_source_rte','y');
/*!40000 ALTER TABLE `exp_rte_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_rte_toolsets`
--

DROP TABLE IF EXISTS `exp_rte_toolsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tools` text COLLATE utf8mb4_unicode_ci,
  `enabled` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  PRIMARY KEY (`toolset_id`),
  KEY `member_id` (`member_id`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_rte_toolsets`
--

LOCK TABLES `exp_rte_toolsets` WRITE;
/*!40000 ALTER TABLE `exp_rte_toolsets` DISABLE KEYS */;
INSERT INTO `exp_rte_toolsets` VALUES (1,0,'Default','3|2|5|1|9|7|6|4|10','y');
/*!40000 ALTER TABLE `exp_rte_toolsets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_search`
--

DROP TABLE IF EXISTS `exp_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_search` (
  `search_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) unsigned NOT NULL,
  `query` mediumtext COLLATE utf8mb4_unicode_ci,
  `custom_fields` mediumtext COLLATE utf8mb4_unicode_ci,
  `result_page` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`search_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_search`
--

LOCK TABLES `exp_search` WRITE;
/*!40000 ALTER TABLE `exp_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_search_log`
--

DROP TABLE IF EXISTS `exp_search_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `member_id` int(10) unsigned NOT NULL,
  `screen_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `search_terms` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_search_log`
--

LOCK TABLES `exp_search_log` WRITE;
/*!40000 ALTER TABLE `exp_search_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_search_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_security_hashes`
--

DROP TABLE IF EXISTS `exp_security_hashes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`hash_id`),
  KEY `session_id` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_security_hashes`
--

LOCK TABLES `exp_security_hashes` WRITE;
/*!40000 ALTER TABLE `exp_security_hashes` DISABLE KEYS */;
INSERT INTO `exp_security_hashes` VALUES (1,1515541015,'4146c6545f6d59eea989583797293c2a4d420aad','dbac655d41ad1686ddd20d19751137d17f872ee2'),(2,1515547261,'fef3d4afb8aff5dd984ab4bc1eeb904290585910','550fdac1f18f5c2e7056056969a4b7d399eaffe5'),(3,1515549363,'127c51ea68efe1e1e037508fc285906eacbbaf5b','d67ae5ec8b4142cc047e5bd684859aebea2ee383'),(4,1515619018,'fd149478ed43fa7dceba129b138a38b4a24e95eb','f815294d2e69124d5fe6bd7987678cb5d85f57af'),(5,1515699559,'291f18001b48a4999821308f395931cdbe385578','0a4dbcb22060e8574cdf3c844cb1a70e2e1a6ba8'),(6,1515801447,'ecbb93a4f61839a425f4924847f52edfe1bb81b7','d7b4dd18c70b485d6d167a43f68540d717e390f3'),(7,1515813573,'49d5468b0a0c502e6d2041f136648f009fd3bd71','caf59c8da5df867fa79d6d46741dee5e9afd0307'),(8,1516125437,'a64a11582aecfb49f43524e93a5fd7e555ae7cc5','7cb2c27cbacbcc1c96c1793d490103775a1a8f55'),(9,1516131089,'91bd677b4b9a4a0adf94710adeb251e5d20312d2','666201dfd0310138f447f36f52a50337d0611f01'),(10,1516144568,'c637555454bf0e4e264a07a2c5776614482932ef','cdaf26a3930219f5af07ac76c93369fc7b079d9c'),(11,1516221044,'0cdf5a2b9a9abef7ef72e5dfa060055de66136b0','ef80c3610fa83d08b302189b131be3c14d985c37'),(12,1516312264,'0e4a518b959aa93fd11204e967514a63bd7b5661','27eecf15eada7635b899aab9a36da21cf782f99a'),(13,1516316325,'7431c428534ce21c45e7e72ad2b7bc130b543550','64e87d9b7974df618a9883ffa8f636099bad2612'),(14,1516416781,'80f3ea404a498557f8838bdb0a945b5ee269016b','feba2f0fe2bdbdbd6f8f6bb3a55c2f54cb30aba9'),(15,1516658354,'972bc8911d345d85f929be1f196527a48f76e7b6','bf33f786377b7c33c2c14efcc7b9773e447cd028'),(16,1516760973,'66d2f73517fb1ec7edc237473f08f29ea52039d0','394e2cb31a22fafb22d28566121a4d2df60cbbfb');
/*!40000 ALTER TABLE `exp_security_hashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_sessions`
--

DROP TABLE IF EXISTS `exp_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_state` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fingerprint` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sess_start` int(10) unsigned NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `can_debug` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`session_id`),
  KEY `member_id` (`member_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_sessions`
--

LOCK TABLES `exp_sessions` WRITE;
/*!40000 ALTER TABLE `exp_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_sites`
--

DROP TABLE IF EXISTS `exp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_sites` (
  `site_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `site_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_description` text COLLATE utf8mb4_unicode_ci,
  `site_system_preferences` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_member_preferences` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_template_preferences` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_channel_preferences` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_bootstrap_checksums` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_pages` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`site_id`),
  KEY `site_name` (`site_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_sites`
--

LOCK TABLES `exp_sites` WRITE;
/*!40000 ALTER TABLE `exp_sites` DISABLE KEYS */;
INSERT INTO `exp_sites` VALUES (1,'Baja MLS','baja_mls',NULL,'YTo5MTp7czoxMDoiaXNfc2l0ZV9vbiI7czoxOiJ5IjtzOjg6ImJhc2VfdXJsIjtzOjIxOiJodHRwOi8vYmFqYW1scy5sb2NhbC8iO3M6OToiYmFzZV9wYXRoIjtzOjE3OiIvdmFyL3d3dy9iYWphbWxzLyI7czoxMDoic2l0ZV9pbmRleCI7czowOiIiO3M6ODoic2l0ZV91cmwiO3M6MTA6IntiYXNlX3VybH0iO3M6NjoiY3BfdXJsIjtzOjE5OiJ7YmFzZV91cmx9YWRtaW4ucGhwIjtzOjE2OiJ0aGVtZV9mb2xkZXJfdXJsIjtzOjE3OiJ7YmFzZV91cmx9dGhlbWVzLyI7czoxNzoidGhlbWVfZm9sZGVyX3BhdGgiO3M6MTg6IntiYXNlX3BhdGh9dGhlbWVzLyI7czoxNToid2VibWFzdGVyX2VtYWlsIjtzOjI5OiJtaWd1ZWxhbnRvbmlvLnJ1YmlvQGdtYWlsLmNvbSI7czoxNDoid2VibWFzdGVyX25hbWUiO3M6MDoiIjtzOjIwOiJjaGFubmVsX25vbWVuY2xhdHVyZSI7czo3OiJjaGFubmVsIjtzOjEwOiJtYXhfY2FjaGVzIjtzOjM6IjE1MCI7czoxMToiY2FwdGNoYV91cmwiO3M6MjY6IntiYXNlX3VybH1pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX3BhdGgiO3M6Mjc6IntiYXNlX3BhdGh9aW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9mb250IjtzOjE6InkiO3M6MTI6ImNhcHRjaGFfcmFuZCI7czoxOiJ5IjtzOjIzOiJjYXB0Y2hhX3JlcXVpcmVfbWVtYmVycyI7czoxOiJuIjtzOjE1OiJyZXF1aXJlX2NhcHRjaGEiO3M6MToibiI7czoxODoiZW5hYmxlX3NxbF9jYWNoaW5nIjtzOjE6Im4iO3M6MTg6ImZvcmNlX3F1ZXJ5X3N0cmluZyI7czoxOiJuIjtzOjEzOiJzaG93X3Byb2ZpbGVyIjtzOjE6Im4iO3M6MTU6ImluY2x1ZGVfc2Vjb25kcyI7czoxOiJuIjtzOjEzOiJjb29raWVfZG9tYWluIjtzOjA6IiI7czoxMToiY29va2llX3BhdGgiO3M6MToiLyI7czoxNToiY29va2llX2h0dHBvbmx5IjtOO3M6MTM6ImNvb2tpZV9zZWN1cmUiO047czoyMDoid2Vic2l0ZV9zZXNzaW9uX3R5cGUiO3M6MToiYyI7czoxNToiY3Bfc2Vzc2lvbl90eXBlIjtzOjE6ImMiO3M6MjE6ImFsbG93X3VzZXJuYW1lX2NoYW5nZSI7czoxOiJ5IjtzOjE4OiJhbGxvd19tdWx0aV9sb2dpbnMiO3M6MToieSI7czoxNjoicGFzc3dvcmRfbG9ja291dCI7czoxOiJ5IjtzOjI1OiJwYXNzd29yZF9sb2Nrb3V0X2ludGVydmFsIjtzOjE6IjEiO3M6MjA6InJlcXVpcmVfaXBfZm9yX2xvZ2luIjtzOjE6InkiO3M6MjI6InJlcXVpcmVfaXBfZm9yX3Bvc3RpbmciO3M6MToieSI7czoyNDoicmVxdWlyZV9zZWN1cmVfcGFzc3dvcmRzIjtzOjE6Im4iO3M6MTk6ImFsbG93X2RpY3Rpb25hcnlfcHciO3M6MToieSI7czoyMzoibmFtZV9vZl9kaWN0aW9uYXJ5X2ZpbGUiO3M6MDoiIjtzOjE3OiJ4c3NfY2xlYW5fdXBsb2FkcyI7czoxOiJ5IjtzOjE1OiJyZWRpcmVjdF9tZXRob2QiO3M6ODoicmVkaXJlY3QiO3M6OToiZGVmdF9sYW5nIjtzOjc6ImVuZ2xpc2giO3M6ODoieG1sX2xhbmciO3M6MjoiZW4iO3M6MTI6InNlbmRfaGVhZGVycyI7czoxOiJ5IjtzOjExOiJnemlwX291dHB1dCI7czoxOiJuIjtzOjIxOiJkZWZhdWx0X3NpdGVfdGltZXpvbmUiO3M6MDoiIjtzOjExOiJkYXRlX2Zvcm1hdCI7czo4OiIlbi8lai8lWSI7czoxMToidGltZV9mb3JtYXQiO3M6MjoiMTIiO3M6MTM6Im1haWxfcHJvdG9jb2wiO3M6NDoibWFpbCI7czoxMzoiZW1haWxfbmV3bGluZSI7czoyOiJcbiI7czoxMToic210cF9zZXJ2ZXIiO3M6MDoiIjtzOjk6InNtdHBfcG9ydCI7TjtzOjEzOiJzbXRwX3VzZXJuYW1lIjtzOjA6IiI7czoxMzoic210cF9wYXNzd29yZCI7czowOiIiO3M6MTc6ImVtYWlsX3NtdHBfY3J5cHRvIjtzOjM6InNzbCI7czoxMToiZW1haWxfZGVidWciO3M6MToibiI7czoxMzoiZW1haWxfY2hhcnNldCI7czo1OiJ1dGYtOCI7czoxNToiZW1haWxfYmF0Y2htb2RlIjtzOjE6Im4iO3M6MTY6ImVtYWlsX2JhdGNoX3NpemUiO3M6MDoiIjtzOjExOiJtYWlsX2Zvcm1hdCI7czo1OiJwbGFpbiI7czo5OiJ3b3JkX3dyYXAiO3M6MToieSI7czoyMjoiZW1haWxfY29uc29sZV90aW1lbG9jayI7czoxOiI1IjtzOjIyOiJsb2dfZW1haWxfY29uc29sZV9tc2dzIjtzOjE6InkiO3M6MTY6ImxvZ19zZWFyY2hfdGVybXMiO3M6MToieSI7czoxOToiZGVueV9kdXBsaWNhdGVfZGF0YSI7czoxOiJ5IjtzOjI0OiJyZWRpcmVjdF9zdWJtaXR0ZWRfbGlua3MiO3M6MToibiI7czoxNjoiZW5hYmxlX2NlbnNvcmluZyI7czoxOiJuIjtzOjE0OiJjZW5zb3JlZF93b3JkcyI7czowOiIiO3M6MTg6ImNlbnNvcl9yZXBsYWNlbWVudCI7czowOiIiO3M6MTA6ImJhbm5lZF9pcHMiO3M6MDoiIjtzOjEzOiJiYW5uZWRfZW1haWxzIjtzOjA6IiI7czoxNjoiYmFubmVkX3VzZXJuYW1lcyI7czowOiIiO3M6MTk6ImJhbm5lZF9zY3JlZW5fbmFtZXMiO3M6MDoiIjtzOjEwOiJiYW5fYWN0aW9uIjtzOjg6InJlc3RyaWN0IjtzOjExOiJiYW5fbWVzc2FnZSI7czozNDoiVGhpcyBzaXRlIGlzIGN1cnJlbnRseSB1bmF2YWlsYWJsZSI7czoxNToiYmFuX2Rlc3RpbmF0aW9uIjtzOjIxOiJodHRwOi8vd3d3LnlhaG9vLmNvbS8iO3M6MTY6ImVuYWJsZV9lbW90aWNvbnMiO3M6MToieSI7czoxMjoiZW1vdGljb25fdXJsIjtzOjI1OiJ7YmFzZV91cmx9aW1hZ2VzL3NtaWxleXMvIjtzOjE5OiJyZWNvdW50X2JhdGNoX3RvdGFsIjtzOjQ6IjEwMDAiO3M6MTc6Im5ld192ZXJzaW9uX2NoZWNrIjtzOjE6InkiO3M6MTc6ImVuYWJsZV90aHJvdHRsaW5nIjtzOjE6Im4iO3M6MTc6ImJhbmlzaF9tYXNrZWRfaXBzIjtzOjE6InkiO3M6MTQ6Im1heF9wYWdlX2xvYWRzIjtzOjI6IjEwIjtzOjEzOiJ0aW1lX2ludGVydmFsIjtzOjE6IjgiO3M6MTI6ImxvY2tvdXRfdGltZSI7czoyOiIzMCI7czoxNToiYmFuaXNobWVudF90eXBlIjtzOjc6Im1lc3NhZ2UiO3M6MTQ6ImJhbmlzaG1lbnRfdXJsIjtzOjA6IiI7czoxODoiYmFuaXNobWVudF9tZXNzYWdlIjtzOjUwOiJZb3UgaGF2ZSBleGNlZWRlZCB0aGUgYWxsb3dlZCBwYWdlIGxvYWQgZnJlcXVlbmN5LiI7czoxNzoiZW5hYmxlX3NlYXJjaF9sb2ciO3M6MToieSI7czoxOToibWF4X2xvZ2dlZF9zZWFyY2hlcyI7czozOiI1MDAiO3M6MTE6InJ0ZV9lbmFibGVkIjtzOjE6InkiO3M6MjI6InJ0ZV9kZWZhdWx0X3Rvb2xzZXRfaWQiO3M6MToiMSI7czoxMzoiZm9ydW1fdHJpZ2dlciI7Tjt9','YTo0Nzp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjA6ImRlZmF1bHRfbWVtYmVyX2dyb3VwIjtzOjE6IjUiO3M6MTU6InByb2ZpbGVfdHJpZ2dlciI7czo2OiJtZW1iZXIiO3M6MTI6Im1lbWJlcl90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjE0OiJlbmFibGVfYXZhdGFycyI7czoxOiJ5IjtzOjIwOiJhbGxvd19hdmF0YXJfdXBsb2FkcyI7czoxOiJuIjtzOjEwOiJhdmF0YXJfdXJsIjtzOjI1OiJ7YmFzZV91cmx9aW1hZ2VzL2F2YXRhcnMvIjtzOjExOiJhdmF0YXJfcGF0aCI7czoyNjoie2Jhc2VfcGF0aH1pbWFnZXMvYXZhdGFycy8iO3M6MTY6ImF2YXRhcl9tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE3OiJhdmF0YXJfbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTM6ImF2YXRhcl9tYXhfa2IiO3M6MjoiNTAiO3M6MTM6ImVuYWJsZV9waG90b3MiO3M6MToibiI7czo5OiJwaG90b191cmwiO3M6MzE6IntiYXNlX3VybH1pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTA6InBob3RvX3BhdGgiO3M6MzI6IntiYXNlX3BhdGh9aW1hZ2VzL21lbWJlcl9waG90b3MvIjtzOjE1OiJwaG90b19tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE2OiJwaG90b19tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMjoicGhvdG9fbWF4X2tiIjtzOjI6IjUwIjtzOjE2OiJhbGxvd19zaWduYXR1cmVzIjtzOjE6InkiO3M6MTM6InNpZ19tYXhsZW5ndGgiO3M6MzoiNTAwIjtzOjIxOiJzaWdfYWxsb3dfaW1nX2hvdGxpbmsiO3M6MToibiI7czoyMDoic2lnX2FsbG93X2ltZ191cGxvYWQiO3M6MToibiI7czoxMToic2lnX2ltZ191cmwiO3M6Mzk6IntiYXNlX3VybH1pbWFnZXMvc2lnbmF0dXJlX2F0dGFjaG1lbnRzLyI7czoxMjoic2lnX2ltZ19wYXRoIjtzOjQwOiJ7YmFzZV9wYXRofWltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjE3OiJzaWdfaW1nX21heF93aWR0aCI7czozOiI0ODAiO3M6MTg6InNpZ19pbWdfbWF4X2hlaWdodCI7czoyOiI4MCI7czoxNDoic2lnX2ltZ19tYXhfa2IiO3M6MjoiMzAiO3M6MTU6InBydl9tc2dfZW5hYmxlZCI7czoxOiJ5IjtzOjI1OiJwcnZfbXNnX2FsbG93X2F0dGFjaG1lbnRzIjtzOjE6InkiO3M6MTk6InBydl9tc2dfdXBsb2FkX3BhdGgiO3M6MzM6IntiYXNlX3BhdGh9aW1hZ2VzL3BtX2F0dGFjaG1lbnRzLyI7czoyMzoicHJ2X21zZ19tYXhfYXR0YWNobWVudHMiO3M6MToiMyI7czoyMjoicHJ2X21zZ19hdHRhY2hfbWF4c2l6ZSI7czozOiIyNTAiO3M6MjA6InBydl9tc2dfYXR0YWNoX3RvdGFsIjtzOjM6IjEwMCI7czoxOToicHJ2X21zZ19odG1sX2Zvcm1hdCI7czo0OiJzYWZlIjtzOjE4OiJwcnZfbXNnX2F1dG9fbGlua3MiO3M6MToieSI7czoxNzoicHJ2X21zZ19tYXhfY2hhcnMiO3M6NDoiNjAwMCI7czoxOToibWVtYmVybGlzdF9vcmRlcl9ieSI7czoxMToidG90YWxfcG9zdHMiO3M6MjE6Im1lbWJlcmxpc3Rfc29ydF9vcmRlciI7czo0OiJkZXNjIjtzOjIwOiJtZW1iZXJsaXN0X3Jvd19saW1pdCI7czoyOiIyMCI7czoyODoiYXBwcm92ZWRfbWVtYmVyX25vdGlmaWNhdGlvbiI7TjtzOjI4OiJkZWNsaW5lZF9tZW1iZXJfbm90aWZpY2F0aW9uIjtOO30=','YTo2OntzOjIyOiJlbmFibGVfdGVtcGxhdGVfcm91dGVzIjtzOjE6InkiO3M6MTE6InN0cmljdF91cmxzIjtzOjE6InkiO3M6ODoic2l0ZV80MDQiO3M6ODoiaG9tZS80MDQiO3M6MTk6InNhdmVfdG1wbF9yZXZpc2lvbnMiO3M6MToibiI7czoxODoibWF4X3RtcGxfcmV2aXNpb25zIjtzOjE6IjUiO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7Tjt9','YToxMzp7czoyMzoiYXV0b19hc3NpZ25fY2F0X3BhcmVudHMiO3M6MToieSI7czoyMzoiYXV0b19jb252ZXJ0X2hpZ2hfYXNjaWkiO3M6MToibiI7czoyMzoiY29tbWVudF9lZGl0X3RpbWVfbGltaXQiO047czoyNzoiY29tbWVudF9tb2RlcmF0aW9uX292ZXJyaWRlIjtOO3M6MjI6ImNvbW1lbnRfd29yZF9jZW5zb3JpbmciO047czoxNToiZW5hYmxlX2NvbW1lbnRzIjtzOjE6InkiO3M6MTg6ImltYWdlX2xpYnJhcnlfcGF0aCI7czowOiIiO3M6MjE6ImltYWdlX3Jlc2l6ZV9wcm90b2NvbCI7czozOiJnZDIiO3M6MjI6Im5ld19wb3N0c19jbGVhcl9jYWNoZXMiO3M6MToieSI7czoyMjoicmVzZXJ2ZWRfY2F0ZWdvcnlfd29yZCI7czo4OiJjYXRlZ29yeSI7czoxNjoidGh1bWJuYWlsX3ByZWZpeCI7czo1OiJ0aHVtYiI7czoxNzoidXNlX2NhdGVnb3J5X25hbWUiO3M6MToibiI7czoxNDoid29yZF9zZXBhcmF0b3IiO3M6NDoiZGFzaCI7fQ==','YToxOntzOjI2OiIvdmFyL3d3dy9iYWphbWxzL2luZGV4LnBocCI7czozMjoiN2RkMGIzZmY1MDNlYTllYjE1NTMzMzVjNmY4MzVjODciO30=','YToxOntpOjE7YTozOntzOjQ6InVyaXMiO2E6MDp7fXM6OToidGVtcGxhdGVzIjthOjA6e31zOjM6InVybCI7czoxMToie2Jhc2VfdXJsfS8iO319');
/*!40000 ALTER TABLE `exp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_snippets`
--

DROP TABLE IF EXISTS `exp_snippets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snippet_contents` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`snippet_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_snippets`
--

LOCK TABLES `exp_snippets` WRITE;
/*!40000 ALTER TABLE `exp_snippets` DISABLE KEYS */;
INSERT INTO `exp_snippets` VALUES (1,0,'snp_blog_list','<div class=\"entry\">\n	{!-- title --}\n	<h2><a href=\"{path=\'{p_url}/{p_url_entry}/{url_title}\'}\">{title}</a></h2>\n	<p><b>on:</b> {entry_date format=\'%n/%j/%Y\'}, <b>by:</b> <a href=\"{path=\'member/{author_id}\'}\">{author}</a>, <a href=\"{path=\'{p_url}/{p_url_entry}/{url_title}#comments\'}\">{comment_total} comment{if comment_total != 1}s{/if}</a></p>\n</div>',1515540972),(2,0,'snp_blog_list_paginate','{!-- pagination --}\n{paginate}\n	<div class=\"paginate\">\n		{pagination_links page_padding=\'1\'}\n			<ul>\n				{previous_page}\n					<li><a href=\"{pagination_url}\">Previous Page</a></li>\n				{/previous_page}\n				{page}\n					<li><a href=\"{pagination_url}\"{if current_page} class=\"act\"{/if}>{pagination_page_number}</a></li>\n				{/page}\n				{next_page}\n					<li><a href=\"{pagination_url}\">Next Page</a></li>\n				{/next_page}\n			</ul>\n		{/pagination_links}\n	</div>\n{/paginate}',1515540972),(3,0,'snp_main_nav','					<ul class=\"main-nav\">\n						<li><a{if segment_1 == \'\'} class=\"act\"{/if} href=\"{homepage}\">Home</a></li>\n						<li><a{if segment_1 == \'about\'} class=\"act\"{/if} href=\"{path=\'about\'}\">About</a></li>\n						<li><a{if segment_1 == \'blog\'} class=\"act\"{/if} href=\"{path=\'blog\'}\">Blog</a></li>\n						<li><a{if segment_1 == \'contact\'} class=\"act\"{/if} href=\"{path=\'contact\'}\">Contact</a></li>\n					</ul>',1515540972);
/*!40000 ALTER TABLE `exp_snippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_specialty_templates`
--

DROP TABLE IF EXISTS `exp_specialty_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `enable_template` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `template_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_subtype` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_notes` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`template_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_specialty_templates`
--

LOCK TABLES `exp_specialty_templates` WRITE;
/*!40000 ALTER TABLE `exp_specialty_templates` DISABLE KEYS */;
INSERT INTO `exp_specialty_templates` VALUES (1,1,'y','offline_template','','system',NULL,'<html>\n<head>\n\n<title>System Offline</title>\n\n<style type=\"text/css\">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>',NULL,1515540989,0),(2,1,'y','message_template','','system',NULL,'<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type=\"text/css\">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>',NULL,1515540989,0),(3,1,'y','admin_notify_reg','Notification of new member registration','email','members','New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}',NULL,1515540989,0),(4,1,'y','admin_notify_entry','A new channel entry has been posted','email','content','A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit:\n{entry_url}\n',NULL,1515540989,0),(5,1,'y','admin_notify_comment','You have just received a comment','email','comments','You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at:\n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}',NULL,1515540989,0),(6,1,'y','mbr_activation_instructions','Enclosed is your activation code','email','members','Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}',NULL,1515540989,0),(7,1,'y','forgot_password_instructions','Login information','email','members','{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nThen log in with your username: {username}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}',NULL,1515540989,0),(8,1,'y','validated_member_notify','Your membership account has been activated','email','members','{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}',NULL,1515540989,0),(9,1,'y','decline_member_validation','Your membership account has been declined','email','members','{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}',NULL,1515540989,0),(10,1,'y','comment_notification','Someone just responded to your comment','email','comments','{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}',NULL,1515540989,0),(11,1,'y','comments_opened_notification','New comments have been added','email','comments','Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment}\n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}',NULL,1515540989,0),(12,1,'y','private_message_notification','Someone has sent you a Private Message','email','private_messages','\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}',NULL,1515540989,0),(13,1,'y','pm_inbox_full','Your private message mailbox is full','email','private_messages','{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}',NULL,1515540989,0);
/*!40000 ALTER TABLE `exp_specialty_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_stats`
--

DROP TABLE IF EXISTS `exp_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_stats` (
  `stat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_comment_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) unsigned NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`stat_id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_stats`
--

LOCK TABLES `exp_stats` WRITE;
/*!40000 ALTER TABLE `exp_stats` DISABLE KEYS */;
INSERT INTO `exp_stats` VALUES (1,1,1,1,'mrubio',9,0,0,15,1515540988,0,1515541007,0,0,0,1523477001);
/*!40000 ALTER TABLE `exp_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_status_no_access`
--

DROP TABLE IF EXISTS `exp_status_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`status_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_status_no_access`
--

LOCK TABLES `exp_status_no_access` WRITE;
/*!40000 ALTER TABLE `exp_status_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_status_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_statuses`
--

DROP TABLE IF EXISTS `exp_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_statuses` (
  `status_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_order` int(3) unsigned NOT NULL,
  `highlight` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_statuses`
--

LOCK TABLES `exp_statuses` WRITE;
/*!40000 ALTER TABLE `exp_statuses` DISABLE KEYS */;
INSERT INTO `exp_statuses` VALUES (1,'open',1,'009933'),(2,'closed',2,'990000'),(3,'Default Page',3,'2051B3');
/*!40000 ALTER TABLE `exp_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_groups`
--

DROP TABLE IF EXISTS `exp_template_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_groups` (
  `group_id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_order` int(3) unsigned NOT NULL,
  `is_site_default` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`group_id`),
  KEY `site_id` (`site_id`),
  KEY `group_name_idx` (`group_name`),
  KEY `group_order_idx` (`group_order`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_groups`
--

LOCK TABLES `exp_template_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_groups` DISABLE KEYS */;
INSERT INTO `exp_template_groups` VALUES (8,1,'main',1,'y'),(9,1,'layouts',2,'n'),(10,1,'listing',3,'n');
/*!40000 ALTER TABLE `exp_template_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_member_groups`
--

DROP TABLE IF EXISTS `exp_template_member_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) unsigned NOT NULL,
  `template_group_id` mediumint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`template_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_member_groups`
--

LOCK TABLES `exp_template_member_groups` WRITE;
/*!40000 ALTER TABLE `exp_template_member_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_template_member_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_no_access`
--

DROP TABLE IF EXISTS `exp_template_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`template_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_no_access`
--

LOCK TABLES `exp_template_no_access` WRITE;
/*!40000 ALTER TABLE `exp_template_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_template_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_template_routes`
--

DROP TABLE IF EXISTS `exp_template_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_template_routes` (
  `route_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(10) unsigned NOT NULL,
  `order` int(10) unsigned DEFAULT NULL,
  `route` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_parsed` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`route_id`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_template_routes`
--

LOCK TABLES `exp_template_routes` WRITE;
/*!40000 ALTER TABLE `exp_template_routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_template_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_templates`
--

DROP TABLE IF EXISTS `exp_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_templates` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `group_id` int(6) unsigned NOT NULL,
  `template_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `template_notes` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) unsigned NOT NULL DEFAULT '0',
  `cache` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `refresh` int(6) unsigned NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enable_http_auth` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `allow_php` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'o',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `protect_javascript` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`template_id`),
  KEY `group_id` (`group_id`),
  KEY `template_name` (`template_name`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_templates`
--

LOCK TABLES `exp_templates` WRITE;
/*!40000 ALTER TABLE `exp_templates` DISABLE KEYS */;
INSERT INTO `exp_templates` VALUES (22,1,8,'index','webpage','{layout=\'layouts/_main-layout\'}\r\n\r\n{layout:set name=\"styles\"}\r\n    <style>\r\n        #home-carousel {\r\n            top:-64px;\r\n        }\r\n    </style>\r\n{/layout:set}\r\n\r\n<div id=\"home-carousel\" class=\"carousel carousel-slider\">\r\n    <a class=\"carousel-item\" href=\"#one!\"><img src=\"https://loremflickr.com/1600/920/baja,mexico/all?random=1\"></a>\r\n    <a class=\"carousel-item\" href=\"#two!\"><img src=\"https://loremflickr.com/1600/920/baja,mexico/all?random=2\"></a>\r\n    <a class=\"carousel-item\" href=\"#three!\"><img src=\"https://loremflickr.com/1600/920/baja,mexico/all?random=3\"></a>\r\n    <a class=\"carousel-item\" href=\"#four!\"><img src=\"https://loremflickr.com/1600/920/baja,mexico/all?random=4\"></a>\r\n    <a class=\"carousel-item\" href=\"#four!\"><img src=\"https://loremflickr.com/1600/920/baja,mexico/all?random=5\"></a>\r\n</div>\r\n\r\n{layout:set name=\"scripts\"}\r\n    <script>\r\n        $(\'.carousel.carousel-slider\').carousel({fullWidth: true});\r\n        autoplay();\r\n        function autoplay() {\r\n            $(\'.carousel\').carousel(\'next\');\r\n            setTimeout(autoplay, 5000);\r\n        }\r\n    </script>\r\n{/layout:set}',NULL,1516596622,0,'n',0,'','n','n','o',0,'n'),(23,1,9,'index','webpage','',NULL,1516132757,0,'n',0,'','n','n','o',0,'n'),(24,1,9,'_main-layout','webpage','<!doctype html>\r\n<html dir=\"ltr\" lang=\"{lang}\">\r\n	<head>\r\n		<meta charset=\"utf-8\">\r\n		<title>{layout:title}{site_name}</title>\r\n		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n\r\n		<!-- meta data -->\r\n		{if layout:meta_author}<meta name=\"author\" content=\"{layout:meta_author}\">{/if}\r\n		{if layout:meta_description}<meta name=\"description\" content=\"{layout:meta_description}\">{/if}\r\n\r\n		<!-- open graph common -->\r\n		<meta property=\"og:site_name\" content=\"{site_name}\">\r\n		<meta property=\"og:type\" content=\"website\">\r\n		<meta property=\"og:image\" content=\"{theme_folder_url}site/default/asset/img/og/default.jpg\"> {!-- square, 50*50 min --}\r\n\r\n		{if layout:og_title != \'\'}\r\n			<!-- open graph per page -->\r\n			<meta property=\"og:title\" content=\"{layout:og_title}\">\r\n			<meta property=\"og:url\" content=\"{layout:og_url}\">\r\n			<meta property=\"og:description\" content=\"{layout:og_description}\">\r\n		{/if}\r\n		<!-- Font Awesome -->\r\n    	<!--link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\"-->\r\n		<!--Import Google Icon Font-->\r\n      	<link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\r\n		<!--Import materialize.css-->\r\n  		<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css\">\r\n		<!-- Bootstrap Core -->\r\n        <!--link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css\" integrity=\"sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy\" crossorigin=\"anonymous\"-->\r\n		<!-- Material Design Bootstrap -->\r\n		<!--link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/css/mdb.min.css\"-->\r\n		<!--<link href=\"{theme_folder_url}site/default/asset/style/default.min.css\" title=\"common-styles\" rel=\"stylesheet\">-->\r\n		<!-- <link href=\"{theme_folder_url}site/default/asset/style/debug.min.css\" title=\"common-styles\" rel=\"stylesheet\"> -->\r\n		<!-- Custom Styles -->\r\n        <link href=\"{theme_folder_url}site/default/asset/style/custom.css\" title=\"common-styles\" rel=\"stylesheet\">\r\n		<style>\r\n			.navbar-fixed {\r\n				height:none:\r\n			}\r\n			nav {\r\n				background-color:rgba(255,255,255,.8);\r\n			}\r\n			.brand-logo img {\r\n				margin-top:10px\r\n			}\r\n			.nav-wrapper ul li a {\r\n				color:#6197c2;\r\n			}\r\n			nav ul a:hover {\r\n				background-color:transparent;\r\n			}\r\n			nav.nav-center ul {\r\n				text-align: center;\r\n			}\r\n			nav.nav-center ul li {\r\n				display: inline;\r\n				float: none;\r\n			}\r\n			nav.nav-center ul li a {\r\n				display: inline-block;\r\n				text-transform: uppercase;\r\n    			font-size: 1.1rem;\r\n			}\r\n			nav.nav-center ul li a.logo {\r\n				margin-top : 10px;\r\n			}\r\n			.breadcrumb:before {\r\n				color: #6197c2;\r\n			}\r\n		</style>\r\n		{layout:styles}\r\n	</head>\r\n    <body class=\"blue-grey lighten-5\">\r\n		<div class=\"navbar-fixed\">\r\n			<nav class=\"nav-center\">\r\n				<div class=\"nav-wrapper center-align\">\r\n					<div class=\"brand-logo center hide-on-large-only\">\r\n						<a href=\"/\"><img src=\"/images/logo2.png\"></a>\r\n					</div>\r\n					<a href=\"#\" data-activates=\"mobile-demo\" class=\"button-collapse\"><i class=\"material-icons\">menu</i></a>\r\n					<ul class=\"hide-on-med-and-down center\">\r\n						<li><a href=\"#\">About</a></li>\r\n						<li><a href=\"#\">Locations</a></li>\r\n						<li><a href=\"/\" class=\"logo\"><img src=\"/images/logo2.png\"></a></li>\r\n						<li><a href=\"/listing\">Listing</a></li>\r\n						<li><a href=\"#\">Contact</a></li>\r\n					</ul>\r\n					<ul class=\"side-nav\" id=\"mobile-demo\">\r\n						<li><a href=\"#\">About</a></li>\r\n						<li><a href=\"#\">Locations</a></li>\r\n						<li><a href=\"/listing\">Listing</a></li>\r\n						<li><a href=\"#\">Contact</a></li>\r\n					</ul>\r\n				</div>\r\n			</nav>\r\n		</div>\r\n\r\n\r\n        \r\n		{layout:contents}\r\n		\r\n\r\n\r\n		<!-- JQuery -->\r\n		<script src=\"https://code.jquery.com/jquery-3.2.1.min.js\" integrity=\"sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=\" crossorigin=\"anonymous\"></script>\r\n		<!-- Materialize -->\r\n  		<script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js\"></script>\r\n        <!-- Bootstrap dropdown -->\r\n		<!--script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script-->\r\n		<!-- Bootstrap core JavaScript -->\r\n        <!--script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js\" integrity=\"sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4\" crossorigin=\"anonymous\"></script-->\r\n		<!-- MDB core JavaScript -->\r\n		<!--script src=\"https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/js/mdb.min.js\" crossorigin=\"anonymous\"></script-->\r\n		<script>\r\n			$( document ).ready(function(){\r\n				$(\".button-collapse\").sideNav();\r\n			});\r\n			$( document ).on(\"scroll\", function(){\r\n				//changes navbar alpha on scroll\r\n				$(\"nav\").css(\"background-color\",\"rgba(255,255,255,\"+($( document ).scrollTop() + 80) / 100 +\")\");\r\n			});\r\n		</script>\r\n		{layout:scripts}\r\n	</body>\r\n</html>',NULL,1516687458,1,'n',0,'24','n','n','o',0,'n'),(25,1,10,'index','webpage','{layout=\'layouts/_main-layout\'}\r\n\r\n{layout:set name=\"styles\"}\r\n    <style>\r\n        .search-card .card-content {\r\n            padding-bottom:0;\r\n        }\r\n        .search-car .card-content row {\r\n            margin-bottom:0;\r\n        }\r\n    </style>\r\n{/layout:set}\r\n\r\n<?php\r\n    error_reporting( E_ALL ); //debug\r\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/flexmlsAPI.php\");\r\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/lang/lang.php\");\r\n    $protocol = strtolower(substr($_SERVER[\"SERVER_PROTOCOL\"],0,5))==\'https://\'?\'https://\':\'http://\';\r\n    $hostName = $_SERVER[\'HTTP_HOST\'];\r\n    $base_url = $protocol.$hostName;\r\n    $api = new flexmlsAPI(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\");\r\n    $api->SetApplicationName(\"Diamante-MLS-Search/1.0\");\r\n    $api->SetDeveloperMode(false);\r\n    $auth = $api->Authenticate();\r\n    if ($auth === false) api_error_thrown($api);\r\n\r\n    $portal = isset($_GET[\'portal\']) ? trim($_GET[\'portal\']) : 0;\r\n    $mls_number = isset($_GET[\'mls_number\']) ? trim($_GET[\'mls_number\']) : \'\';\r\n    //$city = isset($_GET[\'city\']) ? trim($_GET[\'city\']) : \'\';\r\n    $city = \"{segment_2}\" != \"\" ? \"{segment_2}\" : \"all\";\r\n    //$property_type = isset($_GET[\'property_type\']) ? trim($_GET[\'property_type\']) : \'\';\r\n    $property_type  = \"{segment_3}\" != \"\" ? \"{segment_3}\" : \"all\";\r\n    //$list_price = isset($_GET[\'list_price\']) ? trim($_GET[\'list_price\']) : \'\';\r\n    $list_price = \"{segment_4}\" != \"\" ? \"{segment_4}\" : \"all\";\r\n    $development = isset($_GET[\'development\']) ? trim($_GET[\'development\']) : \'\';\r\n    $language = isset($_GET[\'lang\']) ? trim($_GET[\'lang\']) : \'en\';\r\n    //$page = isset($_GET[\'page\']) ? trim($_GET[\'page\']) : 1;\r\n    $page = is_numeric(\"{segment_5}\") ? {segment_5}  : 1;\r\n    $featured = isset($_GET[\'featured\']) ? $_GET[\'featured\'] : 0;\r\n\r\n    $exchange_rate = 1;\r\n    $parameters = null;\r\n    $listings = null;\r\n    \r\n    if($language == \'es\') {\r\n        $xml = simplexml_load_file(\"http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml\")->Cube[0]->Cube[0];\r\n        $usd = 0;\r\n        $mxn = 0;\r\n        foreach ($xml->Cube as $item) {\r\n            if((string)$item[\'currency\'] === \'USD\')\r\n                $usd = (real)$item[\'rate\'];\r\n                \r\n            if((string)$item[\'currency\'] === \'MXN\')\r\n                $mxn = (real)$item[\'rate\'];\r\n        }\r\n\r\n        $exchange_rate = $mxn/$usd;\r\n    }\r\n\r\n    switch ($city) {\r\n        case \"la-paz\" : $cityQuery = \"City Eq \'La Paz\'\"; break;\r\n        case \"la-ventana\" : $cityQuery = \"SubdivisionName Eq \'La Ventana\' Or SubdivisionName Eq \'El Sargento\'\"; break;\r\n        case \"cabo-san-lucas\" : $cityQuery = \"City Eq \'Cabo San Lucas\'\"; break;\r\n        case \"cabo-corridor\" : $cityQuery = \"City Eq \'Cabo Corridor\'\"; break;\r\n        case \"san-jose-del-cabo\" : $cityQuery = \"City Eq \'San Jose del Cabo\'\"; break;\r\n        case \"san-jose-corridor\" : $cityQuery = \"City Eq \'San Jose Corridor\'\"; break;\r\n        case \"east-cape\" : $cityQuery = \"City Eq \'East Cape\' Or City Eq \'Los Barriles\'\"; break;\r\n        case \"pacific-side\" : $cityQuery = \"City Eq \'Pacific Or City Eq \'Pacific Side\' Or City Eq \'Todos Santos\'\"; break;\r\n        default : $cityQuery = \"\";\r\n    }\r\n\r\n    switch ($property_type) {\r\n        case \"condos\" : $propertyQuery = \"A\"; break;\r\n        case \"houses\" : $propertyQuery = \"B\"; break;\r\n        case \"townhouses\" : $propertyQuery = \"C\"; break;\r\n        case \"land\" : $propertyQuery = \"E\"; break;\r\n        case \"commercial\" : $propertyQuery = \"F\"; break;\r\n        case \"business\" : $propertyQuery = \"G\"; break;\r\n        case \"multifamily\" : $propertyQuery = \"I\"; break;\r\n        default : $propertyQuery = \"\";\r\n    }\r\n\r\n    switch ($list_price) {\r\n        case \"0\" : $listQuery = \"Le 200000.0\"; break;\r\n        case \"200K\" : $listQuery = \"Ge 200000.0 And ListPrice Le 500000.0\"; break;\r\n        case \"500K\" : $listQuery = \"Ge 500000.0 And ListPrice Le 1000000.0\"; break;\r\n        case \"1M\" : $listQuery = \"Ge 1000000.0\"; break;\r\n        default : $listQuery = \"\";\r\n    }\r\n\r\n\r\n    if($mls_number != \'\') {\r\n        $parameters = array(\"_filter\" => \"ListingId Eq \'$mls_number\'\", \"_expand\" => \'PrimaryPhoto\', \"_limit\" => \"1\", \"_pagination\" => true);\r\n        $listings = $api->GetListings($parameters);\r\n    }\r\n    else {\r\n        $filter = \'\';\r\n        $p_type = ($propertyQuery != \"\") ? \"PropertyType Eq \'$propertyQuery\'\": \"Not PropertyType Eq \'H\'\";\r\n        $filter .= ($filter != \'\') ? \" And $p_type\" : \"$p_type\" ;\r\n        $filter .= ($cityQuery != \'\') ? (($filter != \'\') ? \" And $cityQuery\" : \"$cityQuery\" ) : \'\';\r\n        $filter .= ($listQuery != \'\') ? (($filter != \'\') ? \" And ListPrice $listQuery\" : \"ListPrice $listQuery\" ) : \'\';\r\n        if ($development == \'Terrazas\' || $development == \'Torres Cantera\' || $development == \'Vista Coral\' || $development == \'Paseo del Malecon\' || $development == \'Puerto Ilusion\' || $development == \'Querencia\' || $development == \'Palmilla\') {\r\n            $filter .= ($filter != \'\') ? \" And StreetAdditionalInfo Eq \'$development*\'\" : \"StreetAdditionalInfo Eq \'$development*\'\";\r\n        }\r\n        else {\r\n            $filter .= ($development != \'\') ? (($filter != \'\') ? \" And SubdivisionName Eq \'$development\'\" : \"SubdivisionName Eq \'$development\'\" ) : \'\';\r\n        }\r\n        $filter = stripslashes($filter);\r\n\r\n        //echo $filter;\r\n\r\n        if($featured == 1) {\r\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 24, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\r\n            $listings = $api->GetMyListings($parameters);\r\n        }\r\n        else {\r\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 24, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\r\n            $listings = $api->GetListings($parameters);\r\n        }\r\n    }\r\n    $listings[count($listings)] = array(\"LastCount\" => $api->last_count, \"PageSize\" => $api->page_size, \"TotalPages\" => $api->total_pages, \"CurrentPage\" => $api->current_page);\r\n    //var_dump($listings[count($listings)-1]);\r\n    //echo json_encode($listings);\r\n?>\r\n\r\n<main>\r\n    <div class=\"container\">\r\n\r\n        <div class=\"card search-card\">\r\n            <div class=\"card-content\">\r\n                <div class=\"card-title\">\r\n                    MLS Search\r\n                </div>\r\n                <div class=\"row\">\r\n                    <form class=\"col s12\">\r\n                    <div class=\"row\">\r\n                        <div class=\"input-field col s12 m6 l3\">\r\n                            <input id=\"mls_number\" type=\"text\" class=\"validate\">\r\n                            <label for=\"mls_number\">MLS Number</label>\r\n                        </div>\r\n                        <div class=\"input-field col s12 m6 l3\">\r\n                            <select id=\"city\">\r\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\r\n                                <?php if($portal == 1) { ?>\r\n                                    <option value=\"la-ventana\" <?php echo $city == \"la-ventana\" ? \"selected\" : \"\"?>>La Ventana</option>\r\n                                <option value=\"la-paz\" <?php echo $city == \"la-paz\" ? \"selected\" : \"\"?>>La Paz</option>\r\n                                <option value=\"cabo-san-lucas\" <?php echo $city == \"cabo-san-lucas\" ? \"selected\" : \"\"?>>Cabo San Lucas</option>\r\n                                <option value=\"cabo-corridor\" <?php echo $city == \"cabo-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'cabo_corridor\']; ?></option>\r\n                                <option value=\"san-jose-del-cabo\" <?php echo $city == \"san-jose-del-cabo\" ? \"selected\" : \"\"?>>San Jose del Cabo</option>\r\n                                <option value=\"san-jose-corridor\" <?php echo $city == \"san-jose-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'san_jose_corridor\']; ?></option>\r\n                                <option value=\"east-cape\" <?php echo $city == \"east-cape\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'east_cape\']; ?></option>\r\n                                <option value=\"pacific-side\" <?php echo $city == \"pacific-side\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'pacific_side\']; ?></option>\r\n                                <?php } elseif($portal == 3 || $portal == 4 || $portal == 5) { ?>\r\n                                <option value=\"cabo-san-lucas\" <?php echo $city == \"cabo-san-lucas\" ? \"selected\" : \"\"?>>Cabo San Lucas</option>\r\n                                <option value=\"cabo-corridor\" <?php echo $city == \"cabo-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'cabo_corridor\']; ?></option>\r\n                                <option value=\"san-jose-del-cabo\" <?php echo $city == \"san-jose-del-cabo\" ? \"selected\" : \"\"?>>San Jose del Cabo</option>\r\n                                <option value=\"san-jose-corridor\" <?php echo $city == \"san-jose-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'san_jose_corridor\']; ?></option>\r\n                                <option value=\"east-cape\" <?php echo $city == \"east-cape\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'east_cape\']; ?></option>\r\n                                <option value=\"pacific-side\" <?php echo $city == \"pacific-side\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'pacific_side\']; ?></option>\r\n                                <option value=\"la-paz\" <?php echo $city == \"la-paz\" ? \"selected\" : \"\"?>>La Paz</option>\r\n                                <option value=\"la-ventana\" <?php echo $city == \"la-ventana\" ? \"selected\" : \"\"?>>La Ventana</option>\r\n                                <?php } else { ?>\r\n                                <option value=\"la-paz\" <?php echo $city == \"la-paz\" ? \"selected\" : \"\"?>>La Paz</option>\r\n                                <option value=\"la-ventana\" <?php echo $city == \"la-ventana\" ? \"selected\" : \"\"?>>La Ventana</option>\r\n                                <option value=\"cabo-san-lucas\" <?php echo $city == \"cabo-san-lucas\" ? \"selected\" : \"\"?>>Cabo San Lucas</option>\r\n                                <option value=\"cabo-corridor\" <?php echo $city == \"cabo-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'cabo_corridor\']; ?></option>\r\n                                <option value=\"san-jose-del-cabo\" <?php echo $city == \"san-jose-del-cabo\" ? \"selected\" : \"\"?>>San Jose del Cabo</option>\r\n                                <option value=\"san-jose-corridor\" <?php echo $city == \"san-jose-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'san_jose_corridor\']; ?></option>\r\n                                <option value=\"east-cape\" <?php echo $city == \"east-cape\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'east_cape\']; ?></option>\r\n                                <option value=\"pacific-side\" <?php echo $city == \"pacific-side\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'pacific_side\']; ?></option>\r\n                                <?php } ?>\r\n                            </select>\r\n                            <label>City</label>\r\n                        </div>\r\n                        <div class=\"input-field col s12 m6 l3\">\r\n                            <select id=\"property_type\">\r\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\r\n                                <option value=\"condos\" <?php echo $property_type == \"condos\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'condos\']; ?></option>\r\n                                <option value=\"houses\" <?php echo $property_type == \"houses\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'houses\']; ?></option>\r\n                                <option value=\"townhouses\" <?php echo $property_type == \"townhouses\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'townhouses\']; ?></option>\r\n                                <option value=\"land\" <?php echo $property_type == \"land\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'land\']; ?></option>\r\n                                <option value=\"commercial\" <?php echo $property_type == \"commercial\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'commercial\']; ?></option>\r\n                                <option value=\"business\" <?php echo $property_type == \"business\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'business\']; ?></option>\r\n                                <option value=\"multifamily\" <?php echo $property_type == \"multifamily\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'multifamily\']; ?></option>\r\n                            </select>\r\n                            <label>Property type</label>\r\n                        </div>\r\n                        <div class=\"input-field col s12 m6 l3\">\r\n                            <select id=\"list_price\">\r\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\r\n                                <option value=\"0\" <?php echo $list_price == \"0\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'under\']; ?> 200,000 USD</option>\r\n                                <option value=\"200K\" <?php echo $list_price == \"200K\" ? \"selected\" : \"\"?>>200,000 - 500,000 USD</option>\r\n                                <option value=\"500K\" <?php echo $list_price == \"500K\" ? \"selected\" : \"\"?>>500,000 - 1,000,000 USD</option>\r\n                                <option value=\"1M\" <?php echo $list_price == \"1M\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'over\']; ?> 1,000,000 USD</option>\r\n                            </select>\r\n                            <label>Price</label>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n\r\n            </div>\r\n            <div class=\"card-action right-align\">\r\n                <div class=\"left\">Total results: <?php echo $listings[sizeof($listings)-1][\"LastCount\"] ?></div>\r\n                <a id=\"searchBtn\" class=\"btn waves-effect waves-light\">Search\r\n                    <i class=\"material-icons right\">search</i>\r\n                </a>\r\n            </div>\r\n        </div>\r\n\r\n        <ul class=\"pagination center-align\">\r\n            <?php if ($page > 1) { ?>\r\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page-1) ?>\"><i class=\"material-icons\">chevron_left</i></a></li>\r\n            <?php } ?>\r\n                \r\n            <?php \r\n                $total_pages = $listings[sizeof($listings)-1][\"TotalPages\"];\r\n                for($x = $page - 3; $x <= $page + 3; $x++) { \r\n                    if ($x > 0 && $x <= $total_pages) {?>\r\n                        <li class=\"waves-effect <?php echo $x == $page ? \'active indigo\' : \'\' ?>\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".$x ?>\"><?php echo $x ?></a></li>\r\n                <?php } }\r\n            ?>\r\n\r\n            <?php if ($page < $total_pages) { ?>\r\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page+1) ?>\"><i class=\"material-icons\">chevron_right</i></a></li>\r\n            <?php } ?>   \r\n        </ul>\r\n\r\n        <hr>\r\n\r\n        <?php \r\n            //var_dump($listings);\r\n            $count = 0;\r\n            foreach($listings as $listing){ \r\n                $count++;\r\n                if ($count < sizeof($listings)){\r\n                    //setlocale(LC_MONETARY, \'en_US.utf8\');\r\n                    if($language == \'es\'){\r\n                        $price = \"$\" . number_format($listing[\"StandardFields\"][\"ListPrice\"] * $exchange_rate,2) . \" MXN\";\r\n                    }\r\n                    else{\r\n                        $price = \"$\" . number_format($listing[\"StandardFields\"][\"ListPrice\"],2) . \" USD\";\r\n                    }\r\n\r\n                    if (sizeof($listing[\"StandardFields\"][\"Photos\"]) > 0) {\r\n                        $thumb = $listing[\"StandardFields\"][\"Photos\"][0][\"Uri800\"];\r\n                    } else {\r\n                        $thumb = \'http://www.placehold.it/800x250?text=NO+PHOTO\';\r\n                    }\r\n\r\n                    $stai = $listing[\"StandardFields\"][\"StreetAdditionalInfo\"];\r\n					$stnu = $listing[\"StandardFields\"][\"StreetNumber\"];\r\n                    $stna = $listing[\"StandardFields\"][\"StreetName\"];\r\n                    //echo $stai . $stnu . $stna;\r\n                    $street = $stai != \'********\' ? $stai . \' \' : \'\';\r\n                    $street .= $stnu != \'********\' ? $stnu . \' \' : \'\';\r\n                    $street .= $stna != \'********\' ? $stna . \' \' : \'\';\r\n\r\n                    if (($count+2)%3 == 0) { ?> <div class=\"row mt-5 wow\"> <?php } ?>\r\n\r\n            <div class=\"col m4 s12 wow fadeIn\" data-wow-delay=\"0.2s\">\r\n            \r\n                <div class=\"card hoverable sticky-action\">\r\n                    <div class=\"card-image\">\r\n                        <div class=\"view overlay hm-white-slight activator\" style=\"height:250px; background-repeat: no-repeat; background-size: cover; background-position: center;background-image:url(\'<?php echo $thumb ?>\');\"></div>\r\n                        <!--a href=\"<?php echo $base_url.\"/listing/detail/\".$listing[\"StandardFields\"][\"ListingId\"] ?>\" class=\"btn-floating halfway-fab waves-effect waves-light indigo\"><i class=\"material-icons\">add</i></a-->\r\n                    </div>\r\n                    <div class=\"card-content\">\r\n                        <!--Title-->\r\n                        <h4 class=\"card-title activator right-align\"><?php echo $price ?><i class=\"material-icons right\">more_vert</i></h4>\r\n                        \r\n                        <!--Text-->\r\n                        <div class=\"card-text\">\r\n                            <p class=\"truncate\"><?php echo $street ?></p>\r\n                            <p><?php echo $listing[\"StandardFields\"][\"City\"] ?></p>\r\n                            <!--p>MLS Number: <?php echo $listing[\"StandardFields\"][\"ListingId\"] ?></p-->\r\n                        </div>\r\n                        <!--a href=\"#\" class=\"btn btn-primary\">Button</a-->\r\n                    </div>\r\n                    <div class=\"card-action\">\r\n                        <a href=\"<?php echo $base_url.\"/listing/detail/\".$listing[\"StandardFields\"][\"ListingId\"] ?>\" class=\"btn halfway-fab waves-effect waves-light indigo right\"><i class=\"material-icons\">add</i></a>\r\n                        <p><?php echo $listing[\"StandardFields\"][\"ListingId\"]?></p>\r\n                    </div>\r\n                    <div class=\"card-reveal activator\">\r\n                        <span class=\"card-title grey-text text-darken-4\"><i class=\"material-icons right activator\">close</i><?php echo $street ?></span>\r\n                        <p><?php echo $listing[\"StandardFields\"][\"City\"] ?></p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n                    \r\n            <?php if (($count)%3 == 0 || $count == sizeof($listings) -1) { ?> </div> <?php } } }?>\r\n            \r\n\r\n        <hr>\r\n\r\n        <ul class=\"pagination center-align\">\r\n            <?php if ($page > 1) { ?>\r\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page-1) ?>\"><i class=\"material-icons\">chevron_left</i></a></li>\r\n            <?php } ?>\r\n                \r\n            <?php \r\n                $total_pages = $listings[sizeof($listings)-1][\"TotalPages\"];\r\n                for($x = $page - 3; $x <= $page + 3; $x++) { \r\n                    if ($x > 0 && $x <= $total_pages) {?>\r\n                        <li class=\"waves-effect <?php echo $x == $page ? \'active indigo\' : \'\' ?>\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".$x ?>\"><?php echo $x ?></a></li>\r\n                <?php } }\r\n            ?>\r\n\r\n            <?php if ($page < $total_pages) { ?>\r\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page+1) ?>\"><i class=\"material-icons\">chevron_right</i></a></li>\r\n            <?php } ?>   \r\n        </ul>\r\n        \r\n    </div>\r\n</main>\r\n\r\n{layout:set name=\"scripts\"}\r\n    <!--script src=\"{theme_folder_url}site/default/asset/js/mls.js\" ></script>\r\n    <script>\r\n        var portal = <?php echo $portal; ?>;\r\n        var language = \'<?php echo $language; ?>\';\r\n        var exchange_rate = <?php echo $exchange_rate; ?>;\r\n        var selectedListing = \'\';\r\n        \r\n        function autoLoad(){\r\n            $(\'#mls_number\').val(\'<?php echo $mls_number; ?>\');\r\n            $(\'#city\').val(\'<?php echo $city; ?>\');\r\n            $(\'#property_type\').val(\'<?php echo $property_type; ?>\');\r\n            $(\'#list_price\').val(\'<?php echo $list_price; ?>\');\r\n            $(\'#development\').val(\'<?php echo $development; ?>\');\r\n            $(\'#submit\').click();\r\n        }\r\n        \r\n        $(function(){\r\n            $(\'#property_type\').change(function(){\r\n                if ($(this).val() != \'E\') {\r\n                    $(\"#list_price option[value=\'Le 200000.0\']\").remove();\r\n                } else if ($(\"#list_price option[value=\'Le 200000.0\']\").length == 0) {\r\n                    $(\'#list_price option:first\').after(\'<option value=\"Le 200000.0\"><?php echo $lang[$language][\'under\']; ?> 200,000 USD</option>\');\r\n                }\r\n            });\r\n        });\r\n    </script-->\r\n    <script>\r\n        $(\'select\').material_select();\r\n\r\n        $(\"#searchBtn\").click(function(){\r\n            var redirect = \"/listing\";\r\n            if ($.trim($(\"#mls_number\").val()) != \"\"){\r\n                redirect += \"/detail/\" + $(\"#mls_number\").val();\r\n            } else {\r\n                redirect += \"/\"+$(\"#city\").val();\r\n                redirect += \"/\"+$(\"#property_type\").val();\r\n                redirect += \"/\"+$(\"#list_price\").val();\r\n            }\r\n            console.log(redirect);\r\n            $(this).addClass(\'disabled\');\r\n            window.location.href = redirect;\r\n        });\r\n\r\n    </script>\r\n{/layout:set}',NULL,1516697583,1,'n',0,'24','n','y','o',0,'n'),(26,1,10,'index_bkp','webpage','{layout=\'layouts/_main-layout\'}\r\n\r\n<?php\r\n    $portal = isset($_GET[\'portal\']) ? trim($_GET[\'portal\']) : 0;\r\n    $mls_number = isset($_GET[\'mls_number\']) ? trim($_GET[\'mls_number\']) : \'\';\r\n    $city = isset($_GET[\'city\']) ? trim($_GET[\'city\']) : \'\';\r\n    $property_type = isset($_GET[\'property_type\']) ? trim($_GET[\'property_type\']) : \'\';\r\n    $list_price = isset($_GET[\'list_price\']) ? trim($_GET[\'list_price\']) : \'\';\r\n    $development = isset($_GET[\'development\']) ? trim($_GET[\'development\']) : \'\';\r\n    $language = isset($_GET[\'lang\']) ? trim($_GET[\'lang\']) : \'en\';\r\n    $exchange_rate = 1;\r\n\r\n    if($language == \'es\') {\r\n        $xml = simplexml_load_file(\"http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml\")->Cube[0]->Cube[0];\r\n        $usd = 0;\r\n        $mxn = 0;\r\n        foreach ($xml->Cube as $item) {\r\n            if((string)$item[\'currency\'] === \'USD\')\r\n                $usd = (real)$item[\'rate\'];\r\n                \r\n            if((string)$item[\'currency\'] === \'MXN\')\r\n                $mxn = (real)$item[\'rate\'];\r\n        }\r\n\r\n        $exchange_rate = $mxn/$usd;\r\n    }\r\n\r\n    //*** English ***\r\n    $lang[\'en\'][\'mls_number\'] = \'MLS number\';\r\n    $lang[\'en\'][\'city\'] = \'City\';\r\n    $lang[\'en\'][\'property_type\'] = \'Property type\';\r\n    $lang[\'en\'][\'price\'] = \'Price\';\r\n    $lang[\'en\'][\'any\'] = \'Any\';\r\n    $lang[\'en\'][\'submit\'] = \'Submit\';\r\n    $lang[\'en\'][\'cabo_corridor\'] = \'Cabo Corridor\';\r\n    $lang[\'en\'][\'san_jose_corridor\'] = \'San Jose Corridor\';\r\n    $lang[\'en\'][\'east_cape\'] = \'East Cape\';\r\n    $lang[\'en\'][\'pacific_side\'] = \'Pacific Side\';\r\n    $lang[\'en\'][\'condos\'] = \'Condos\';\r\n    $lang[\'en\'][\'houses\'] = \'Houses\';\r\n    $lang[\'en\'][\'townhouses\'] = \'Townhouses\';\r\n    $lang[\'en\'][\'land\'] = \'Land\';\r\n    $lang[\'en\'][\'commercial\'] = \'Commercial\';\r\n    $lang[\'en\'][\'business\'] = \'Business\';\r\n    $lang[\'en\'][\'fractional\'] = \'Fractional\';\r\n    $lang[\'en\'][\'multifamily\'] = \'MultiFamily\';\r\n    $lang[\'en\'][\'under\'] = \'Under\';\r\n    $lang[\'en\'][\'over\'] = \'Over\';\r\n    $lang[\'en\'][\'results\'] = \'Results\';\r\n    $lang[\'en\'][\'email_the_agent\'] = \'Email The Agent\';\r\n    $lang[\'en\'][\'login\'] = \'Login\';\r\n    $lang[\'en\'][\'property_consultation\'] = \'Property Consultation\';\r\n    $lang[\'en\'][\'details\'] = \'Details\';\r\n    $lang[\'en\'][\'photos\'] = \'Photos\';\r\n    $lang[\'en\'][\'map\'] = \'Map\';\r\n    $lang[\'en\'][\'yes\'] = \'Yes\';\r\n    $lang[\'en\'][\'no\'] = \'No\';\r\n    $lang[\'en\'][\'developments\'] = \'Developments\';\r\n    //*** Spanish ***\r\n    $lang[\'es\'][\'mls_number\'] = \'N&uacute;mero MLS\';\r\n    $lang[\'es\'][\'city\'] = \'Ciudad\';\r\n    $lang[\'es\'][\'property_type\'] = \'Tipo de propiedad\';\r\n    $lang[\'es\'][\'price\'] = \'Precio\';\r\n    $lang[\'es\'][\'any\'] = \'Cualquiera\';\r\n    $lang[\'es\'][\'submit\'] = \'Enviar\';\r\n    $lang[\'es\'][\'cabo_corridor\'] = \'Corredor - San Lucas\';\r\n    $lang[\'es\'][\'san_jose_corridor\'] = \'Corredor - San Jose\';\r\n    $lang[\'es\'][\'east_cape\'] = \'Cabo del Este\';\r\n    $lang[\'es\'][\'pacific_side\'] = \'Pac&iacute;fico\';\r\n    $lang[\'es\'][\'condos\'] = \'Condominios\';\r\n    $lang[\'es\'][\'houses\'] = \'Casas\';\r\n    $lang[\'es\'][\'townhouses\'] = \'Residencias\';\r\n    $lang[\'es\'][\'land\'] = \'Terrenos\';\r\n    $lang[\'es\'][\'commercial\'] = \'Comercial\';\r\n    $lang[\'es\'][\'business\'] = \'Negocio\';\r\n    $lang[\'es\'][\'fractional\'] = \'Fraccionamiento\';\r\n    $lang[\'es\'][\'multifamily\'] = \'Multi-Familiar\';\r\n    $lang[\'es\'][\'under\'] = \'Menos de\';\r\n    $lang[\'es\'][\'over\'] = \'Mas de\';\r\n    $lang[\'es\'][\'results\'] = \'Resultados\';\r\n    $lang[\'es\'][\'email_the_agent\'] = \'Enviar Email al Agente\';\r\n    $lang[\'es\'][\'login\'] = \'Acceder\';\r\n    $lang[\'es\'][\'property_consultation\'] = \'Consulta de Propiedad\';\r\n    $lang[\'es\'][\'details\'] = \'Detalles\';\r\n    $lang[\'es\'][\'photos\'] = \'Fotos\';\r\n    $lang[\'es\'][\'map\'] = \'Mapa\';\r\n    $lang[\'es\'][\'yes\'] = \'Si\';\r\n    $lang[\'es\'][\'no\'] = \'No\';\r\n    $lang[\'es\'][\'developments\'] = \'Desarrollos\';\r\n\r\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/flexmlsAPI.php\");\r\n    $api = new flexmlsAPI(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\");\r\n    $api->SetApplicationName(\"Diamante-MLS-Search/1.0\");\r\n    $api->SetDeveloperMode(false);\r\n    $auth = $api->Authenticate();\r\n    if ($auth === false) api_error_thrown($api);\r\n\r\n    $parameters = null;\r\n    $listings = null;\r\n    $mls_number = $_GET[\'mls_number\'];\r\n    $city = urldecode($_GET[\'city\']);\r\n    $property_type = $_GET[\'property_type\'];\r\n    $list_price = $_GET[\'list_price\'];\r\n    $page = isset($_GET[\'page\']) ? trim($_GET[\'page\']) : 1;\r\n    $featured = isset($_GET[\'featured\']) ? $_GET[\'featured\'] : 0;\r\n    $development = isset($_GET[\'development\']) ? $_GET[\'development\'] : \'\';\r\n\r\n    if($mls_number != \'\') {\r\n        $parameters = array(\"_filter\" => \"ListingId Eq \'$mls_number\'\", \"_expand\" => \'PrimaryPhoto\', \"_limit\" => \"1\", \"_pagination\" => true);\r\n        $listings = $api->GetListings($parameters);\r\n    }\r\n    else {\r\n        $filter = \'\';\r\n        $p_type = ($property_type != \"\") ? \"PropertyType Eq \'$property_type\'\": \"Not PropertyType Eq \'H\'\";\r\n        $filter .= ($filter != \'\') ? \" And $p_type\" : \"$p_type\" ;\r\n        $filter .= ($city != \'\') ? (($filter != \'\') ? \" And $city\" : \"$city\" ) : \'\';\r\n        $filter .= ($list_price != \'\') ? (($filter != \'\') ? \" And ListPrice $list_price\" : \"ListPrice $list_price\" ) : \'\';\r\n        if ($development == \'Terrazas\' || $development == \'Torres Cantera\' || $development == \'Vista Coral\' || $development == \'Paseo del Malecon\' || $development == \'Puerto Ilusion\' || $development == \'Querencia\' || $development == \'Palmilla\') {\r\n            $filter .= ($filter != \'\') ? \" And StreetAdditionalInfo Eq \'$development*\'\" : \"StreetAdditionalInfo Eq \'$development*\'\";\r\n        }\r\n        else {\r\n            $filter .= ($development != \'\') ? (($filter != \'\') ? \" And SubdivisionName Eq \'$development\'\" : \"SubdivisionName Eq \'$development\'\" ) : \'\';\r\n        }\r\n        $filter = stripslashes($filter);\r\n\r\n        if($featured == 1) {\r\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 25, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\r\n            $listings = $api->GetMyListings($parameters);\r\n        }\r\n        else {\r\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 25, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\r\n            $listings = $api->GetListings($parameters);\r\n        }\r\n    }\r\n    $listings[count($listings)] = array(\"LastCount\" => $api->last_count, \"PageSize\" => $api->page_size, \"TotalPages\" => $api->total_pages, \"CurrentPage\" => $api->current_page);\r\n    echo json_encode($listings);\r\n?>\r\n\r\n<div class=\"container-fluid content\" style=\"margin-top:100px;\">\r\n    <input id=\"submit\" type=\"button\" value=\"<?php echo $lang[$language][\'submit\']; ?>\" />\r\n    <div class=\"results\">\r\n        <div id=\"listings\"></div>\r\n    </div>\r\n</div>\r\n\r\n{layout:set name=\"scripts\"}\r\n    <script src=\"{theme_folder_url}site/default/asset/js/mls.js\" ></script>\r\n    <script>\r\n        var portal = <?php echo $portal; ?>;\r\n        var language = \'<?php echo $language; ?>\';\r\n        var exchange_rate = <?php echo $exchange_rate; ?>;\r\n        var selectedListing = \'\';\r\n        \r\n        function autoLoad(){\r\n            $(\'#mls_number\').val(\'<?php echo $mls_number; ?>\');\r\n            $(\'#city\').val(\'<?php echo $city; ?>\');\r\n            $(\'#property_type\').val(\'<?php echo $property_type; ?>\');\r\n            $(\'#list_price\').val(\'<?php echo $list_price; ?>\');\r\n            $(\'#development\').val(\'<?php echo $development; ?>\');\r\n            $(\'#submit\').click();\r\n        }\r\n        \r\n        $(function(){\r\n            $(\'#property_type\').change(function(){\r\n                if ($(this).val() != \'E\') {\r\n                    $(\"#list_price option[value=\'Le 200000.0\']\").remove();\r\n                } else if ($(\"#list_price option[value=\'Le 200000.0\']\").length == 0) {\r\n                    $(\'#list_price option:first\').after(\'<option value=\"Le 200000.0\"><?php echo $lang[$language][\'under\']; ?> 200,000 USD</option>\');\r\n                }\r\n            });\r\n        });\r\n    </script>\r\n{/layout:set}',NULL,1516418005,1,'n',0,'','n','n','o',0,'n'),(27,1,10,'detail','webpage','{layout=\'layouts/_main-layout\'}\r\n\r\n<main>\r\n    <div class=\"container\">\r\n            <?=$_SERVER[\'HTTP_REFERER\'];?>\r\n            <div class=\"col s12\">\r\n                <a href=\"/\" class=\"breadcrumb indigo-text\">Home</a>\r\n                <a href=\"/listing\" class=\"breadcrumb indigo-text\">Listing</a>\r\n                <a href=\"\" class=\"breadcrumb indigo-text\">{segment_3}</a>\r\n            </div>\r\n\r\n            <hr>\r\n\r\n    </div>\r\n</main>',NULL,1516761028,1,'n',0,'24','n','y','o',0,'n');
/*!40000 ALTER TABLE `exp_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_throttle`
--

DROP TABLE IF EXISTS `exp_throttle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL,
  `locked_out` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  PRIMARY KEY (`throttle_id`),
  KEY `ip_address` (`ip_address`),
  KEY `last_activity` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_throttle`
--

LOCK TABLES `exp_throttle` WRITE;
/*!40000 ALTER TABLE `exp_throttle` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_throttle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_update_log`
--

DROP TABLE IF EXISTS `exp_update_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_update_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int(10) unsigned DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_update_log`
--

LOCK TABLES `exp_update_log` WRITE;
/*!40000 ALTER TABLE `exp_update_log` DISABLE KEYS */;
INSERT INTO `exp_update_log` VALUES (1,1515540988,'Smartforge::add_key failed. Table \'exp_comments\' does not exist.','Smartforge::add_key',105,'/var/www/bajamls/system/ee/EllisLab/Addons/comment/upd.comment.php');
/*!40000 ALTER TABLE `exp_update_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_upload_no_access`
--

DROP TABLE IF EXISTS `exp_upload_no_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) unsigned NOT NULL,
  `member_group` smallint(4) unsigned NOT NULL,
  PRIMARY KEY (`upload_id`,`member_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_upload_no_access`
--

LOCK TABLES `exp_upload_no_access` WRITE;
/*!40000 ALTER TABLE `exp_upload_no_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `exp_upload_no_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exp_upload_prefs`
--

DROP TABLE IF EXISTS `exp_upload_prefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exp_upload_prefs` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `site_id` int(4) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `server_path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allowed_types` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'img',
  `default_modal_view` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'list',
  `max_size` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_height` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `max_width` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pre_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_properties` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_pre_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_post_format` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `batch_location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_id` int(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exp_upload_prefs`
--

LOCK TABLES `exp_upload_prefs` WRITE;
/*!40000 ALTER TABLE `exp_upload_prefs` DISABLE KEYS */;
INSERT INTO `exp_upload_prefs` VALUES (1,1,'Avatars','{base_path}images/avatars/','{base_url}images/avatars/','img','list','50','100','100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(2,1,'Default Avatars','{base_path}images/avatars/default/','{base_url}images/avatars/default/','img','list','50','100','100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(3,1,'Member Photos','{base_path}images/member_photos/','{base_url}images/member_photos/','img','list','50','100','100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(4,1,'Signature Attachments','{base_path}images/signature_attachments/','{base_url}images/signature_attachments/','img','list','30','80','480',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(5,1,'PM Attachments','{base_path}images/pm_attachments/','{base_url}images/pm_attachments/','img','list','250',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(6,1,'Blog','{base_path}themes/ee/site/default/asset/img/blog/','{base_url}themes/ee/site/default/asset/img/blog/','img','list',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(7,1,'Common','{base_path}themes/ee/site/default/asset/img/common/','{base_url}themes/ee/site/default/asset/img/common/','img','list',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0),(8,1,'Home','{base_path}themes/ee/site/default/asset/img/home/','{base_url}themes/ee/site/default/asset/img/home/','img','list',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `exp_upload_prefs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-13 16:40:42
