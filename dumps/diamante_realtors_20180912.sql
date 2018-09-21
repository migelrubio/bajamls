-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 12, 2018 at 03:23 PM
-- Server version: 5.5.51-38.2
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diamante_realtors`
--

-- --------------------------------------------------------

--
-- Table structure for table `exp_actions`
--

DROP TABLE IF EXISTS `exp_actions`;
CREATE TABLE `exp_actions` (
  `action_id` int(4) UNSIGNED NOT NULL,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `csrf_exempt` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_actions`
--

INSERT INTO `exp_actions` (`action_id`, `class`, `method`, `csrf_exempt`) VALUES
(1, 'Channel', 'submit_entry', 0),
(2, 'Channel', 'filemanager_endpoint', 0),
(3, 'Channel', 'smiley_pop', 0),
(4, 'Channel', 'combo_loader', 0),
(5, 'Comment', 'insert_new_comment', 0),
(6, 'Comment_mcp', 'delete_comment_notification', 0),
(7, 'Comment', 'comment_subscribe', 0),
(8, 'Comment', 'edit_comment', 0),
(9, 'Rte', 'get_js', 0),
(10, 'Relationship', 'entryList', 0),
(11, 'Search', 'do_search', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_captcha`
--

DROP TABLE IF EXISTS `exp_captcha`;
CREATE TABLE `exp_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `word` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_categories`
--

DROP TABLE IF EXISTS `exp_categories`;
CREATE TABLE `exp_categories` (
  `cat_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(6) UNSIGNED NOT NULL,
  `parent_id` int(4) UNSIGNED NOT NULL,
  `cat_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_url_title` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cat_description` text COLLATE utf8mb4_unicode_ci,
  `cat_image` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_order` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_categories`
--

INSERT INTO `exp_categories` (`cat_id`, `site_id`, `group_id`, `parent_id`, `cat_name`, `cat_url_title`, `cat_description`, `cat_image`, `cat_order`) VALUES
(1, 1, 1, 0, 'News', 'news', NULL, NULL, 1),
(2, 1, 1, 0, 'Personal', 'personal', NULL, NULL, 2),
(3, 1, 1, 0, 'Photos', 'photos', NULL, NULL, 3),
(4, 1, 1, 0, 'Videos', 'videos', NULL, NULL, 4),
(5, 1, 1, 0, 'Music', 'music', NULL, NULL, 5),
(6, 1, 2, 0, 'Not Shown', 'not-shown', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_fields`
--

DROP TABLE IF EXISTS `exp_category_fields`;
CREATE TABLE `exp_category_fields` (
  `field_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(4) UNSIGNED NOT NULL,
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
  `field_order` int(3) UNSIGNED NOT NULL,
  `field_settings` text COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_field_data`
--

DROP TABLE IF EXISTS `exp_category_field_data`;
CREATE TABLE `exp_category_field_data` (
  `cat_id` int(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_category_field_data`
--

INSERT INTO `exp_category_field_data` (`cat_id`, `site_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_groups`
--

DROP TABLE IF EXISTS `exp_category_groups`;
CREATE TABLE `exp_category_groups` (
  `group_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort_order` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'a',
  `exclude_group` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `field_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all',
  `can_edit_categories` text COLLATE utf8mb4_unicode_ci,
  `can_delete_categories` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_category_groups`
--

INSERT INTO `exp_category_groups` (`group_id`, `site_id`, `group_name`, `sort_order`, `exclude_group`, `field_html_formatting`, `can_edit_categories`, `can_delete_categories`) VALUES
(1, 1, 'Blog', 'c', 0, 'all', NULL, NULL),
(2, 1, 'Slideshow', 'a', 0, 'all', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_category_posts`
--

DROP TABLE IF EXISTS `exp_category_posts`;
CREATE TABLE `exp_category_posts` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `cat_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_category_posts`
--

INSERT INTO `exp_category_posts` (`entry_id`, `cat_id`) VALUES
(4, 3),
(5, 4),
(6, 2),
(7, 5),
(9, 1),
(10, 5),
(11, 4);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels`
--

DROP TABLE IF EXISTS `exp_channels`;
CREATE TABLE `exp_channels` (
  `channel_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_name` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `channel_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `channel_lang` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_records` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cat_group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `search_excerpt` int(4) UNSIGNED DEFAULT NULL,
  `deft_category` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deft_comments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_require_membership` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `channel_max_chars` int(5) UNSIGNED DEFAULT NULL,
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
  `comment_max_chars` int(5) UNSIGNED DEFAULT '5000',
  `comment_timelock` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `comment_require_email` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_text_formatting` char(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `comment_html_formatting` char(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'safe',
  `comment_allow_img_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_auto_link_urls` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `comment_notify` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_authors` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `comment_notify_emails` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_expiration` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `search_results_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rss_url` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_versioning` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `max_revisions` smallint(4) UNSIGNED NOT NULL DEFAULT '10',
  `default_entry_title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_field_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Title',
  `url_title_prefix` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_look_template` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `max_entries` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channels`
--

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_records`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `deft_status`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `extra_publish_controls`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `title_field_label`, `url_title_prefix`, `live_look_template`, `max_entries`) VALUES
(2, 1, 'blog', 'Blog', '{path=\'blog/entry\'}', NULL, 'en', 8, 8, 0, 1515540988, 0, '1', 'open', NULL, NULL, 'y', 'y', NULL, 'all', 'n', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'n', 10, NULL, 'Title', NULL, 0, 0),
(3, 1, 'contact', 'Contact', '', NULL, 'en', 1, 1, 0, 1515540988, 0, NULL, 'open', NULL, NULL, 'y', 'y', NULL, 'all', 'n', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'n', 10, NULL, 'Title', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels_channel_fields`
--

DROP TABLE IF EXISTS `exp_channels_channel_fields`;
CREATE TABLE `exp_channels_channel_fields` (
  `channel_id` int(4) UNSIGNED NOT NULL,
  `field_id` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels_channel_field_groups`
--

DROP TABLE IF EXISTS `exp_channels_channel_field_groups`;
CREATE TABLE `exp_channels_channel_field_groups` (
  `channel_id` int(4) UNSIGNED NOT NULL,
  `group_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channels_channel_field_groups`
--

INSERT INTO `exp_channels_channel_field_groups` (`channel_id`, `group_id`) VALUES
(2, 2),
(2, 5),
(3, 3),
(3, 4),
(3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels_statuses`
--

DROP TABLE IF EXISTS `exp_channels_statuses`;
CREATE TABLE `exp_channels_statuses` (
  `channel_id` int(4) UNSIGNED NOT NULL,
  `status_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channels_statuses`
--

INSERT INTO `exp_channels_statuses` (`channel_id`, `status_id`) VALUES
(2, 1),
(2, 2),
(3, 1),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data`
--

DROP TABLE IF EXISTS `exp_channel_data`;
CREATE TABLE `exp_channel_data` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data`
--

INSERT INTO `exp_channel_data` (`entry_id`, `site_id`, `channel_id`) VALUES
(4, 1, 2),
(5, 1, 2),
(6, 1, 2),
(7, 1, 2),
(8, 1, 2),
(9, 1, 2),
(10, 1, 2),
(11, 1, 2),
(12, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_1`
--

DROP TABLE IF EXISTS `exp_channel_data_field_1`;
CREATE TABLE `exp_channel_data_field_1` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_1` text COLLATE utf8mb4_unicode_ci,
  `field_ft_1` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_1`
--

INSERT INTO `exp_channel_data_field_1` (`id`, `entry_id`, `field_id_1`, `field_ft_1`) VALUES
(1, 1, '', 'xhtml'),
(2, 2, '', 'xhtml'),
(3, 3, '', 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_2`
--

DROP TABLE IF EXISTS `exp_channel_data_field_2`;
CREATE TABLE `exp_channel_data_field_2` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_2` text COLLATE utf8mb4_unicode_ci,
  `field_ft_2` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_2`
--

INSERT INTO `exp_channel_data_field_2` (`id`, `entry_id`, `field_id_2`, `field_ft_2`) VALUES
(1, 4, NULL, 'xhtml'),
(2, 5, NULL, 'xhtml'),
(3, 6, NULL, 'xhtml'),
(4, 7, '', 'xhtml'),
(5, 8, NULL, 'xhtml'),
(6, 9, NULL, 'xhtml'),
(7, 10, '', 'xhtml'),
(8, 11, NULL, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_3`
--

DROP TABLE IF EXISTS `exp_channel_data_field_3`;
CREATE TABLE `exp_channel_data_field_3` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_3` text COLLATE utf8mb4_unicode_ci,
  `field_ft_3` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_3`
--

INSERT INTO `exp_channel_data_field_3` (`id`, `entry_id`, `field_id_3`, `field_ft_3`) VALUES
(1, 4, 'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'xhtml'),
(2, 5, 'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'xhtml'),
(3, 6, 'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.', 'xhtml'),
(4, 7, 'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'xhtml'),
(5, 8, 'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'xhtml'),
(6, 9, 'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.', 'xhtml'),
(7, 10, 'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'xhtml'),
(8, 11, 'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_4`
--

DROP TABLE IF EXISTS `exp_channel_data_field_4`;
CREATE TABLE `exp_channel_data_field_4` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_4` text COLLATE utf8mb4_unicode_ci,
  `field_ft_4` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_4`
--

INSERT INTO `exp_channel_data_field_4` (`id`, `entry_id`, `field_id_4`, `field_ft_4`) VALUES
(1, 4, '', 'xhtml'),
(2, 5, NULL, 'xhtml'),
(3, 6, NULL, 'xhtml'),
(4, 7, NULL, 'xhtml'),
(5, 8, NULL, 'xhtml'),
(6, 9, NULL, 'xhtml'),
(7, 10, NULL, 'xhtml'),
(8, 11, NULL, 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_5`
--

DROP TABLE IF EXISTS `exp_channel_data_field_5`;
CREATE TABLE `exp_channel_data_field_5` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_5` text COLLATE utf8mb4_unicode_ci,
  `field_ft_5` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_5`
--

INSERT INTO `exp_channel_data_field_5` (`id`, `entry_id`, `field_id_5`, `field_ft_5`) VALUES
(1, 4, NULL, 'xhtml'),
(2, 5, '', 'xhtml'),
(3, 6, NULL, 'xhtml'),
(4, 7, NULL, 'xhtml'),
(5, 8, NULL, 'xhtml'),
(6, 9, NULL, 'xhtml'),
(7, 10, NULL, 'xhtml'),
(8, 11, '', 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_6`
--

DROP TABLE IF EXISTS `exp_channel_data_field_6`;
CREATE TABLE `exp_channel_data_field_6` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_6` text COLLATE utf8mb4_unicode_ci,
  `field_ft_6` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_6`
--

INSERT INTO `exp_channel_data_field_6` (`id`, `entry_id`, `field_id_6`, `field_ft_6`) VALUES
(1, 1, 'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.', 'xhtml'),
(2, 2, 'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.', 'xhtml'),
(3, 3, 'Bacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n\n<blockquote>Short ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.</blockquote>\n\nLorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.\n\nBacon ipsum dolor amet duis meatball magna irure short loin, aliquip rump ipsum minim chuck pork loin picanha. Velit pancetta pariatur sed. Spare ribs cillum nostrud labore, pariatur commodo proident jerky in velit quis doner sunt. Porchetta andouille aute swine. Culpa ut chuck tri-tip.\n \nShort ribs voluptate deserunt swine, spare ribs in doner elit ipsum do tri-tip. Laboris esse aliquip, reprehenderit magna ea shoulder short loin. Chicken velit eu incididunt prosciutto labore nisi. Et shoulder landjaeger jerky officia corned beef anim. Ea ut brisket, leberkas doner pork belly velit consectetur corned beef ham hock laboris labore. Incididunt magna kevin est ground round labore adipisicing kielbasa deserunt consectetur porchetta. Et strip steak deserunt ullamco.\n\n<ol>\n<li>This is a list item </li>\n<li>And another</li>\n<li>One more list item</li>\n</ol>\n\nIrure ut ut jerky id voluptate. Dolore andouille pancetta chicken, deserunt jowl enim strip steak ea ball tip cillum ham. Dolore picanha in prosciutto esse porchetta ullamco salami cupim. Tri-tip non esse, veniam spare ribs pastrami bresaola fatback.\n \nTail t-bone andouille, aute rump elit culpa in sunt. Hamburger duis irure sint, laborum cillum ea officia proident corned beef et. Beef ribs meatloaf rump short loin turkey nulla cow ex voluptate strip steak dolore occaecat. Esse quis excepteur sirloin reprehenderit lorem shoulder pastrami flank pig shank nisi short ribs bacon.\n\n<ul>\n<li>This is a list item</li>\n<li>And another</li>\n<li>One more list item</li>\n</ul>\n\nExercitation voluptate capicola ut, fatback sed t-bone id. Mollit meatloaf pig meatball brisket ea sed shank cupim spare ribs magna kevin sirloin deserunt. Flank minim incididunt velit consequat. Laborum ground round filet mignon chicken officia. Capicola shankle dolore, veniam adipisicing reprehenderit ut est laborum pork chop. Pork rump cillum turkey, sausage salami non tongue ex t-bone minim duis lorem voluptate. Aute pariatur elit, est rump in corned beef cupidatat pork pig tri-tip culpa aliqua.', 'xhtml'),
(4, 12, 'Cupcake ipsum dolor sit. Amet I love liquorice jujubes pudding croissant I love pudding. Apple pie macaroon toffee jujubes pie tart cookie applicake caramels. Halvah macaroon I love lollipop. Wypas I love pudding brownie cheesecake tart jelly-o. Bear claw cookie chocolate bar jujubes toffee.', 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_7`
--

DROP TABLE IF EXISTS `exp_channel_data_field_7`;
CREATE TABLE `exp_channel_data_field_7` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_7` text COLLATE utf8mb4_unicode_ci,
  `field_ft_7` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_7`
--

INSERT INTO `exp_channel_data_field_7` (`id`, `entry_id`, `field_id_7`, `field_ft_7`) VALUES
(1, 12, '', 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_8`
--

DROP TABLE IF EXISTS `exp_channel_data_field_8`;
CREATE TABLE `exp_channel_data_field_8` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_8` text COLLATE utf8mb4_unicode_ci,
  `field_ft_8` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_8`
--

INSERT INTO `exp_channel_data_field_8` (`id`, `entry_id`, `field_id_8`, `field_ft_8`) VALUES
(1, 12, 'user@example.com', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_9`
--

DROP TABLE IF EXISTS `exp_channel_data_field_9`;
CREATE TABLE `exp_channel_data_field_9` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_9` text COLLATE utf8mb4_unicode_ci,
  `field_ft_9` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_9`
--

INSERT INTO `exp_channel_data_field_9` (`id`, `entry_id`, `field_id_9`, `field_ft_9`) VALUES
(1, 12, '(555) 123-4567', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_10`
--

DROP TABLE IF EXISTS `exp_channel_data_field_10`;
CREATE TABLE `exp_channel_data_field_10` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_10` text COLLATE utf8mb4_unicode_ci,
  `field_ft_10` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_10`
--

INSERT INTO `exp_channel_data_field_10` (`id`, `entry_id`, `field_id_10`, `field_ft_10`) VALUES
(1, 1, 'This is a site to show you the power of ExpressionEngine, you can remove it, you can base your next site on it, you can just use it straight.', 'xhtml'),
(2, 2, 'Sub page examples', 'xhtml'),
(3, 3, 'Sub page examples', 'xhtml'),
(4, 4, 'This is a very nice photograph I found, and I wanted to share.', 'xhtml'),
(5, 5, 'This is how it\'s done, the incomparable Jackie Chan shows us the way.', 'xhtml'),
(6, 6, 'This is a blog post about Bacon!', 'xhtml'),
(7, 7, 'An album for the intelligent and uncommon.', 'xhtml'),
(8, 8, 'Super old entry', 'xhtml'),
(9, 9, 'A blog post about the hippest of the hipsters.', 'xhtml'),
(10, 10, 'This is how you shake it off, haters take note.', 'xhtml'),
(11, 11, 'This is a quick video teaching you how to cut a rope.', 'xhtml'),
(12, 12, 'Contact us, phone, mailing, email.', 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_11`
--

DROP TABLE IF EXISTS `exp_channel_data_field_11`;
CREATE TABLE `exp_channel_data_field_11` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_11` text COLLATE utf8mb4_unicode_ci,
  `field_ft_11` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_11`
--

INSERT INTO `exp_channel_data_field_11` (`id`, `entry_id`, `field_id_11`, `field_ft_11`) VALUES
(1, 1, 'About {site_name}', 'none'),
(2, 2, 'Sub page one', 'none'),
(3, 3, 'Sub page two', 'none'),
(4, 4, 'A beautiful photograph', 'none'),
(5, 5, 'Action Comedy', 'none'),
(6, 6, 'A blog all about the joys of Bacon', 'none'),
(7, 7, 'Marrow and the broken bones.', 'none'),
(8, 8, 'Super old entry', 'none'),
(9, 9, 'This is one that is hipper than most.', 'none'),
(10, 10, 'Shaking it Off, a cover.', 'none'),
(11, 11, 'The one about cutting rope.', 'none'),
(12, 12, 'Contact {site_name}', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_entries_autosave`
--

DROP TABLE IF EXISTS `exp_channel_entries_autosave`;
CREATE TABLE `exp_channel_entries_autosave` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `original_entry_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_two` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_three` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_four` int(10) UNSIGNED NOT NULL DEFAULT '0',
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
  `comment_total` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `entry_data` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_entries_autosave`
--

INSERT INTO `exp_channel_entries_autosave` (`entry_id`, `original_entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`, `entry_data`) VALUES
(2, 0, 1, 2, 1, NULL, '0', 'help me relocate', 'help-me-relocate', 'open', 'n', 0, 0, 0, 0, 'y', 'n', 0, '0', '0', '0', 0, 0, 1536346413, NULL, 0, '{\"title\":\"help me relocate\",\"url_title\":\"help-me-relocate\",\"field_id_3\":\"<h1>\\u200bdsfds<b>sdf<\\/b><\\/h1>\\n\\n<h1><br>\\n<\\/h1>\\n\\n<p>sdafsdfasdfsadfad<br>\\n<b><\\/b><\\/p>\\n\\n<figure class=\\\"rte-img-chosen\\\" style=\\\"text-align: center;\\\"><b><img alt=\\\"\\\" src=\\\"\\/themes\\/ee\\/site\\/default\\/asset\\/img\\/blog\\/blog.jpg\\\"><\\/b><\\/figure>\",\"field_id_11\":\"\",\"field_ft_11\":\"none\",\"field_id_10\":\"\",\"field_ft_10\":\"xhtml\",\"entry_date\":\"9\\/7\\/2018 6:23 PM\",\"expiration_date\":\"\",\"comment_expiration_date\":\"\",\"categories\":{\"cat_group_id_1\":[\"\"]},\"channel_id\":\"2\",\"status\":\"open\",\"author_id\":\"1\",\"sticky\":\"n\",\"allow_comments\":\"y\"}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_fields`
--

DROP TABLE IF EXISTS `exp_channel_fields`;
CREATE TABLE `exp_channel_fields` (
  `field_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED DEFAULT '1',
  `field_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_label` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_instructions` text COLLATE utf8mb4_unicode_ci,
  `field_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `field_list_items` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_pre_populate` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_pre_channel_id` int(6) UNSIGNED DEFAULT NULL,
  `field_pre_field_id` int(6) UNSIGNED DEFAULT NULL,
  `field_ta_rows` tinyint(2) DEFAULT '8',
  `field_maxl` smallint(3) DEFAULT NULL,
  `field_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_text_direction` char(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ltr',
  `field_search` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_is_hidden` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `field_fmt` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'xhtml',
  `field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `field_order` int(3) UNSIGNED NOT NULL,
  `field_content_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'any',
  `field_settings` text COLLATE utf8mb4_unicode_ci,
  `legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_fields`
--

INSERT INTO `exp_channel_fields` (`field_id`, `site_id`, `field_name`, `field_label`, `field_instructions`, `field_type`, `field_list_items`, `field_pre_populate`, `field_pre_channel_id`, `field_pre_field_id`, `field_ta_rows`, `field_maxl`, `field_required`, `field_text_direction`, `field_search`, `field_is_hidden`, `field_fmt`, `field_show_fmt`, `field_order`, `field_content_type`, `field_settings`, `legacy_field_data`) VALUES
(1, 0, 'about_image', 'About Image', 'Image for the about page.', 'grid', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 7, 'any', 'YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==', 'n'),
(2, 0, 'blog_audio', 'Audio', 'Audio clip for this blog.', 'grid', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 3, 'any', 'YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==', 'n'),
(3, 0, 'blog_content', 'Content', 'Content for this blog entry.', 'rte', '', 'n', NULL, NULL, 6, NULL, 'n', 'ltr', 'y', 'n', 'xhtml', 'n', 1, 'any', 'YToyOntzOjE0OiJmaWVsZF9zaG93X2ZtdCI7czoxOiJuIjtzOjEzOiJmaWVsZF90YV9yb3dzIjtzOjE6IjYiO30=', 'n'),
(4, 0, 'blog_image', 'Image', 'Photograph, comic, any image you like.', 'grid', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 4, 'any', 'YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==', 'n'),
(5, 0, 'blog_video', 'Video', 'Video for this blog.', 'grid', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 2, 'any', 'YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==', 'n'),
(6, 0, 'page_content', 'Page Content', 'Content for this page.', 'textarea', '', 'n', NULL, NULL, 10, NULL, 'n', 'ltr', 'y', 'n', 'xhtml', 'y', 3, 'any', 'YTozOntzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO30=', 'n'),
(7, 0, 'contact_address', 'Contact Address', 'Address where someone can send mail.', 'grid', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 4, 'any', 'YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==', 'n'),
(8, 0, 'contact_email', 'Contact Email', 'Email address someone can send Email to.', 'text', '', 'n', NULL, NULL, 8, 256, 'n', 'ltr', 'n', 'n', 'none', 'y', 6, '', 'YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtpOjI1NjtzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO30=', 'n'),
(9, 0, 'contact_phone', 'Contact Phone', 'Phone number someone can call.', 'text', '', 'n', NULL, NULL, 8, 256, 'n', 'ltr', 'n', 'n', 'none', 'y', 5, '', 'YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtpOjI1NjtzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO30=', 'n'),
(10, 0, 'seo_desc', 'SEO Description', 'Page Description for use in HTML meta description tag, generally only seen by machines.', 'textarea', '', 'n', NULL, NULL, 2, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 6, 'any', 'YTozOntzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO30=', 'n'),
(11, 0, 'seo_title', 'SEO Title', 'Page title that will be added to browser titlebar/tab.', 'text', '', 'n', NULL, NULL, 8, 256, 'n', 'ltr', 'n', 'n', 'none', 'y', 5, '', 'YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtpOjI1NjtzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO30=', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_field_groups_fields`
--

DROP TABLE IF EXISTS `exp_channel_field_groups_fields`;
CREATE TABLE `exp_channel_field_groups_fields` (
  `field_id` int(6) UNSIGNED NOT NULL,
  `group_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_field_groups_fields`
--

INSERT INTO `exp_channel_field_groups_fields` (`field_id`, `group_id`) VALUES
(1, 1),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 3),
(7, 4),
(8, 4),
(9, 4),
(10, 5),
(11, 5);

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_form_settings`
--

DROP TABLE IF EXISTS `exp_channel_form_settings`;
CREATE TABLE `exp_channel_form_settings` (
  `channel_form_settings_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `channel_id` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `default_status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `allow_guest_posts` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `default_author` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_grid_field_1`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_1`;
CREATE TABLE `exp_channel_grid_field_1` (
  `row_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED DEFAULT NULL,
  `row_order` int(10) UNSIGNED DEFAULT NULL,
  `fluid_field_data_id` int(10) UNSIGNED DEFAULT '0',
  `col_id_1` text COLLATE utf8mb4_unicode_ci,
  `col_id_2` text COLLATE utf8mb4_unicode_ci,
  `col_id_3` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_grid_field_1`
--

INSERT INTO `exp_channel_grid_field_1` (`row_id`, `entry_id`, `row_order`, `fluid_field_data_id`, `col_id_1`, `col_id_2`, `col_id_3`) VALUES
(1, 1, 0, 0, '{filedir_7}common.jpg', 'Dharmafrog, 2014', 'right'),
(2, 2, 0, 0, '{filedir_7}common.jpg', 'Dharmafrog, 2014', 'left'),
(3, 3, 0, 0, '{filedir_7}common.jpg', 'Dharmafrog, 2014', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_grid_field_2`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_2`;
CREATE TABLE `exp_channel_grid_field_2` (
  `row_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED DEFAULT NULL,
  `row_order` int(10) UNSIGNED DEFAULT NULL,
  `fluid_field_data_id` int(10) UNSIGNED DEFAULT '0',
  `col_id_4` text COLLATE utf8mb4_unicode_ci,
  `col_id_5` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_grid_field_2`
--

INSERT INTO `exp_channel_grid_field_2` (`row_id`, `entry_id`, `row_order`, `fluid_field_data_id`, `col_id_4`, `col_id_5`) VALUES
(1, 7, 0, 0, '3925868830', 'bandcamp'),
(2, 10, 0, 0, '164768245', 'soundcloud');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_grid_field_4`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_4`;
CREATE TABLE `exp_channel_grid_field_4` (
  `row_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED DEFAULT NULL,
  `row_order` int(10) UNSIGNED DEFAULT NULL,
  `fluid_field_data_id` int(10) UNSIGNED DEFAULT '0',
  `col_id_6` text COLLATE utf8mb4_unicode_ci,
  `col_id_7` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_grid_field_4`
--

INSERT INTO `exp_channel_grid_field_4` (`row_id`, `entry_id`, `row_order`, `fluid_field_data_id`, `col_id_6`, `col_id_7`) VALUES
(1, 4, 0, 0, '{filedir_6}blog.jpg', 'Dharmafrog, 2014');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_grid_field_5`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_5`;
CREATE TABLE `exp_channel_grid_field_5` (
  `row_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED DEFAULT NULL,
  `row_order` int(10) UNSIGNED DEFAULT NULL,
  `fluid_field_data_id` int(10) UNSIGNED DEFAULT '0',
  `col_id_8` text COLLATE utf8mb4_unicode_ci,
  `col_id_9` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_grid_field_5`
--

INSERT INTO `exp_channel_grid_field_5` (`row_id`, `entry_id`, `row_order`, `fluid_field_data_id`, `col_id_8`, `col_id_9`) VALUES
(1, 5, 0, 0, '113439313', 'vimeo'),
(2, 11, 0, 0, 'eCNwxqP7l44', 'youtube');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_grid_field_7`
--

DROP TABLE IF EXISTS `exp_channel_grid_field_7`;
CREATE TABLE `exp_channel_grid_field_7` (
  `row_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED DEFAULT NULL,
  `row_order` int(10) UNSIGNED DEFAULT NULL,
  `fluid_field_data_id` int(10) UNSIGNED DEFAULT '0',
  `col_id_10` text COLLATE utf8mb4_unicode_ci,
  `col_id_11` text COLLATE utf8mb4_unicode_ci,
  `col_id_12` text COLLATE utf8mb4_unicode_ci,
  `col_id_13` text COLLATE utf8mb4_unicode_ci,
  `col_id_14` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_grid_field_7`
--

INSERT INTO `exp_channel_grid_field_7` (`row_id`, `entry_id`, `row_order`, `fluid_field_data_id`, `col_id_10`, `col_id_11`, `col_id_12`, `col_id_13`, `col_id_14`) VALUES
(1, 12, 0, 0, '1234 Any Street', 'Suite 2', 'Anywhere', 'ES', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_member_groups`
--

DROP TABLE IF EXISTS `exp_channel_member_groups`;
CREATE TABLE `exp_channel_member_groups` (
  `group_id` smallint(4) UNSIGNED NOT NULL,
  `channel_id` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_titles`
--

DROP TABLE IF EXISTS `exp_channel_titles`;
CREATE TABLE `exp_channel_titles` (
  `entry_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `forum_topic_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(4) UNSIGNED NOT NULL,
  `versioning_enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `view_count_one` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_two` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_three` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `view_count_four` int(10) UNSIGNED NOT NULL DEFAULT '0',
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
  `comment_total` int(4) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_titles`
--

INSERT INTO `exp_channel_titles` (`entry_id`, `site_id`, `channel_id`, `author_id`, `forum_topic_id`, `ip_address`, `title`, `url_title`, `status`, `status_id`, `versioning_enabled`, `view_count_one`, `view_count_two`, `view_count_three`, `view_count_four`, `allow_comments`, `sticky`, `entry_date`, `year`, `month`, `day`, `expiration_date`, `comment_expiration_date`, `edit_date`, `recent_comment_date`, `comment_total`) VALUES
(4, 1, 2, 1, NULL, '192.168.33.1', 'EEntry with large photograph', 'a-photograph-for-the-ages', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1515540988, '2018', '01', '09', 0, 0, NULL, NULL, 0),
(5, 1, 2, 1, NULL, '192.168.33.1', 'Entry with vimeo video, lots of comments', 'action-comedy-how-to', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1515540988, '2018', '01', '09', 0, 0, NULL, 1515541007, 11),
(6, 1, 2, 1, NULL, '192.168.33.1', 'Entry with a lot of text, and comments disabled.', 'bacon-blog', 'open', 1, 'n', 0, 0, 0, 0, 'n', 'n', 1515540988, '2018', '01', '09', 0, 0, NULL, NULL, 0),
(7, 1, 2, 1, NULL, '192.168.33.1', 'Entry with BandCamp audio, comments, and comments disabled', 'marrow-and-the-broken-bones', 'open', 1, 'n', 0, 0, 0, 0, 'n', 'n', 1515540988, '2018', '01', '09', 0, 0, NULL, 1515540999, 2),
(8, 1, 2, 1, NULL, '192.168.33.1', 'Super old entry.', 'super-old-entry', 'open', 1, 'n', 0, 0, 0, 0, 'n', 'n', 1515540988, '2018', '01', '09', 0, 0, NULL, NULL, 0),
(9, 1, 2, 1, NULL, '192.168.33.1', 'Entry with text, and comments', 'the-hip-one', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1515540988, '2018', '01', '09', 0, 0, NULL, 1515541000, 2),
(10, 1, 2, 1, NULL, '192.168.33.1', 'Entry with SoundCloud audio', 'the-one-where-we-shake-it-ff', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1515540988, '2018', '01', '09', 0, 0, NULL, NULL, 0),
(11, 1, 2, 1, NULL, '192.168.33.1', 'Entry with YouTube video', 'the-one-with-rope-cutting', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1515540988, '2018', '01', '09', 0, 0, NULL, NULL, 0),
(12, 1, 3, 1, NULL, '192.168.33.1', 'Contact Us', 'contact-us', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1515540988, '2018', '01', '09', 0, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_comments`
--

DROP TABLE IF EXISTS `exp_comments`;
CREATE TABLE `exp_comments` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) DEFAULT '1',
  `entry_id` int(10) UNSIGNED DEFAULT '0',
  `channel_id` int(4) UNSIGNED DEFAULT '1',
  `author_id` int(10) UNSIGNED DEFAULT '0',
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_date` int(10) DEFAULT NULL,
  `edit_date` int(10) DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_comments`
--

INSERT INTO `exp_comments` (`comment_id`, `site_id`, `entry_id`, `channel_id`, `author_id`, `status`, `name`, `email`, `url`, `location`, `ip_address`, `comment_date`, `edit_date`, `comment`) VALUES
(1, 1, 5, 2, 1, 'o', 'mrubio', 'miguelantonio.rubio@gmail.com', 'http://bajamls.local/', NULL, '127.0.0.1', 1515540995, NULL, 'This is a great video! Thanks for sharing!'),
(2, 1, 5, 2, 1, 'o', 'mrubio', 'miguelantonio.rubio@gmail.com', 'http://bajamls.local/', NULL, '127.0.0.1', 1515540996, NULL, 'Woot, love it!'),
(3, 1, 5, 2, 0, 'o', 'Guest one', 'example@example.com', 'http://example.com/', 'Everywhere', '127.0.0.1', 1515540998, NULL, 'This is a comment by a guest to the site, unregistered, with a url and a location.'),
(4, 1, 5, 2, 0, 'o', 'Guest two', 'example@example.com', '', '', '127.0.0.1', 1515540999, NULL, 'This is a comment by an unregistered guest without a url, or a location.'),
(5, 1, 5, 2, 1, 'o', 'mrubio', 'miguelantonio.rubio@gmail.com', 'http://bajamls.local/', NULL, '127.0.0.1', 1515541000, NULL, 'I really can\'t get enough of this kind of appraisal.'),
(6, 1, 5, 2, 0, 'o', 'Mr. Meanie', 'example@example.com', '', '', '127.0.0.1', 1515541001, NULL, 'I\'m a bad person, and people should not like me, and I say troll things all the time.'),
(7, 1, 5, 2, 1, 'o', 'mrubio', 'miguelantonio.rubio@gmail.com', 'http://bajamls.local/', NULL, '127.0.0.1', 1515541002, NULL, 'Ugh, what a troll.'),
(8, 1, 5, 2, 0, 'o', 'Peter Winkle', 'peter@example.com', '', '', '127.0.0.1', 1515541004, NULL, 'This is a guest comment, from one Mr. Peter Winkle.'),
(9, 1, 5, 2, 0, 'o', 'Fancy Falls', 'fancy@example.com', 'http://example.com', 'Fancy Factory', '127.0.0.1', 1515541005, NULL, 'Fancy, I do say!'),
(10, 1, 5, 2, 0, 'o', 'Pauline Paxton', 'pauline@example.com', '', '', '127.0.0.1', 1515541006, NULL, 'Hello my name is Pauline Paxton, and I lurve Jackie Chan.'),
(11, 1, 5, 2, 1, 'o', 'mrubio', 'miguelantonio.rubio@gmail.com', 'http://bajamls.local/', NULL, '127.0.0.1', 1515541007, NULL, 'Test'),
(12, 1, 7, 2, 1, 'o', 'mrubio', 'miguelantonio.rubio@gmail.com', 'http://bajamls.local/', NULL, '127.0.0.1', 1515540998, NULL, 'This is a comment.\n\nfugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(13, 1, 7, 2, 0, 'o', 'Quest one', 'example@example.com', '', '', '127.0.0.1', 1515540999, NULL, 'This is a comment from a Quest ;)\n\nfugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(14, 1, 9, 2, 1, 'o', 'mrubio', 'miguelantonio.rubio@gmail.com', 'http://bajamls.local/', NULL, '127.0.0.1', 1515540999, NULL, 'This is an author comment.'),
(15, 1, 9, 2, 0, 'o', 'Guest one', 'example@example.com', '', '', '127.0.0.1', 1515541000, NULL, 'This is a guest comment.');

-- --------------------------------------------------------

--
-- Table structure for table `exp_comment_subscriptions`
--

DROP TABLE IF EXISTS `exp_comment_subscriptions`;
CREATE TABLE `exp_comment_subscriptions` (
  `subscription_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED DEFAULT NULL,
  `member_id` int(10) DEFAULT '0',
  `email` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_date` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_sent` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  `hash` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_content_types`
--

DROP TABLE IF EXISTS `exp_content_types`;
CREATE TABLE `exp_content_types` (
  `content_type_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_content_types`
--

INSERT INTO `exp_content_types` (`content_type_id`, `name`) VALUES
(2, 'channel'),
(1, 'grid');

-- --------------------------------------------------------

--
-- Table structure for table `exp_cp_log`
--

DROP TABLE IF EXISTS `exp_cp_log`;
CREATE TABLE `exp_cp_log` (
  `id` int(10) NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `act_date` int(10) NOT NULL,
  `action` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_cp_log`
--

INSERT INTO `exp_cp_log` (`id`, `site_id`, `member_id`, `username`, `ip_address`, `act_date`, `action`) VALUES
(1, 1, 1, 'mrubio', '192.168.33.1', 1515541014, 'Logged in'),
(2, 1, 1, 'mrubio', '192.168.33.1', 1515547260, 'Logged in'),
(3, 1, 1, 'mrubio', '192.168.33.1', 1515549362, 'Logged in'),
(4, 1, 1, 'mrubio', '192.168.33.1', 1515619016, 'Logged in'),
(5, 1, 1, 'mrubio', '192.168.33.1', 1515699557, 'Logged in'),
(6, 1, 1, 'mrubio', '192.168.33.1', 1515801445, 'Logged in'),
(7, 1, 1, 'mrubio', '192.168.33.1', 1515813571, 'Logged in'),
(8, 1, 1, 'mrubio', '192.168.33.1', 1516125435, 'Logged in'),
(9, 1, 1, 'mrubio', '192.168.33.1', 1516131087, 'Logged in'),
(10, 1, 1, 'mrubio', '192.168.33.1', 1516144566, 'Logged in'),
(11, 1, 1, 'mrubio', '192.168.33.1', 1516221040, 'Logged in'),
(12, 1, 1, 'mrubio', '192.168.33.1', 1516312262, 'Logged in'),
(13, 1, 1, 'mrubio', '192.168.33.1', 1516316323, 'Logged in'),
(14, 1, 1, 'mrubio', '192.168.33.1', 1516416780, 'Logged in'),
(15, 1, 1, 'mrubio', '192.168.33.1', 1516658352, 'Logged in'),
(16, 1, 1, 'mrubio', '192.168.33.1', 1516760971, 'Logged in'),
(17, 1, 1, 'mrubio', '192.168.33.1', 1530074351, 'Logged in'),
(18, 1, 1, 'mrubio', '192.168.33.1', 1530769388, 'Logged in'),
(19, 1, 1, 'mrubio', '192.168.33.1', 1532380408, 'Logged in'),
(20, 1, 1, 'mrubio', '192.168.33.1', 1532733319, 'Logged in'),
(21, 1, 1, 'mrubio', '192.168.33.1', 1536095461, 'Logged in'),
(22, 1, 1, 'mrubio', '187.131.106.207', 1536266961, 'Logged in'),
(23, 1, 1, 'mrubio', '187.131.106.207', 1536267020, 'Logged in'),
(24, 1, 1, 'mrubio', '187.131.106.207', 1536344543, 'Logged in');

-- --------------------------------------------------------

--
-- Table structure for table `exp_developer_log`
--

DROP TABLE IF EXISTS `exp_developer_log`;
CREATE TABLE `exp_developer_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL,
  `viewed` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `description` text COLLATE utf8mb4_unicode_ci,
  `function` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int(10) UNSIGNED DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deprecated_since` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_instead` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `template_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_group` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_module` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snippets` text COLLATE utf8mb4_unicode_ci,
  `hash` char(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache`
--

DROP TABLE IF EXISTS `exp_email_cache`;
CREATE TABLE `exp_email_cache` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `cache_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_sent` int(6) UNSIGNED NOT NULL,
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
  `attachments` mediumtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_mg`
--

DROP TABLE IF EXISTS `exp_email_cache_mg`;
CREATE TABLE `exp_email_cache_mg` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `group_id` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_cache_ml`
--

DROP TABLE IF EXISTS `exp_email_cache_ml`;
CREATE TABLE `exp_email_cache_ml` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `list_id` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_email_console_cache`
--

DROP TABLE IF EXISTS `exp_email_console_cache`;
CREATE TABLE `exp_email_console_cache` (
  `cache_id` int(6) UNSIGNED NOT NULL,
  `cache_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `member_id` int(10) UNSIGNED NOT NULL,
  `member_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `recipient` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recipient_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_entry_versioning`
--

DROP TABLE IF EXISTS `exp_entry_versioning`;
CREATE TABLE `exp_entry_versioning` (
  `version_id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(4) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL,
  `version_date` int(10) NOT NULL,
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_extensions`
--

DROP TABLE IF EXISTS `exp_extensions`;
CREATE TABLE `exp_extensions` (
  `extension_id` int(10) UNSIGNED NOT NULL,
  `class` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hook` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `settings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `priority` int(2) NOT NULL DEFAULT '10',
  `version` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enabled` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_extensions`
--

INSERT INTO `exp_extensions` (`extension_id`, `class`, `method`, `hook`, `settings`, `priority`, `version`, `enabled`) VALUES
(1, 'Comment_ext', 'addCommentMenu', 'cp_custom_menu', 'a:0:{}', 10, '2.3.3', 'y'),
(2, 'Rte_ext', 'myaccount_nav_setup', 'myaccount_nav_setup', '', 10, '1.0.1', 'y'),
(3, 'Rte_ext', 'cp_menu_array', 'cp_menu_array', '', 10, '1.0.1', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_fieldtypes`
--

DROP TABLE IF EXISTS `exp_fieldtypes`;
CREATE TABLE `exp_fieldtypes` (
  `fieldtype_id` int(4) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `has_global_settings` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_fieldtypes`
--

INSERT INTO `exp_fieldtypes` (`fieldtype_id`, `name`, `version`, `settings`, `has_global_settings`) VALUES
(1, 'select', '1.0.0', 'YTowOnt9', 'n'),
(2, 'text', '1.0.0', 'YTowOnt9', 'n'),
(3, 'textarea', '1.0.0', 'YTowOnt9', 'n'),
(4, 'date', '1.0.0', 'YTowOnt9', 'n'),
(5, 'duration', '1.0.0', 'YTowOnt9', 'n'),
(6, 'email_address', '1.0.0', 'YTowOnt9', 'n'),
(7, 'file', '1.0.0', 'YTowOnt9', 'n'),
(8, 'fluid_field', '1.0.0', 'YTowOnt9', 'n'),
(9, 'grid', '1.0.0', 'YTowOnt9', 'n'),
(10, 'multi_select', '1.0.0', 'YTowOnt9', 'n'),
(11, 'checkboxes', '1.0.0', 'YTowOnt9', 'n'),
(12, 'radio', '1.0.0', 'YTowOnt9', 'n'),
(13, 'relationship', '1.0.0', 'YTowOnt9', 'n'),
(14, 'rte', '1.0.1', 'YTowOnt9', 'n'),
(15, 'toggle', '1.0.0', 'YTowOnt9', 'n'),
(16, 'url', '1.0.0', 'YTowOnt9', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_field_groups`
--

DROP TABLE IF EXISTS `exp_field_groups`;
CREATE TABLE `exp_field_groups` (
  `group_id` int(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_field_groups`
--

INSERT INTO `exp_field_groups` (`group_id`, `site_id`, `group_name`) VALUES
(1, 0, 'about'),
(2, 0, 'blog'),
(3, 0, 'common'),
(4, 0, 'contact'),
(5, 0, 'seo');

-- --------------------------------------------------------

--
-- Table structure for table `exp_files`
--

DROP TABLE IF EXISTS `exp_files`;
CREATE TABLE `exp_files` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED DEFAULT '1',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `upload_location_id` int(4) UNSIGNED DEFAULT '0',
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_size` int(10) DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `credit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uploaded_by_member_id` int(10) UNSIGNED DEFAULT '0',
  `upload_date` int(10) DEFAULT NULL,
  `modified_by_member_id` int(10) UNSIGNED DEFAULT '0',
  `modified_date` int(10) DEFAULT NULL,
  `file_hw_original` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_files`
--

INSERT INTO `exp_files` (`file_id`, `site_id`, `title`, `upload_location_id`, `mime_type`, `file_name`, `file_size`, `description`, `credit`, `location`, `uploaded_by_member_id`, `upload_date`, `modified_by_member_id`, `modified_date`, `file_hw_original`) VALUES
(1, 1, 'blog.jpg', 6, 'image/jpeg', 'blog.jpg', 339111, NULL, NULL, NULL, 1, 1515540994, 1, 1515540994, '900 1200'),
(2, 1, 'common.jpg', 7, 'image/jpeg', 'common.jpg', 339111, NULL, NULL, NULL, 1, 1515540994, 1, 1515540994, '900 1200'),
(3, 1, 'lake.jpg', 8, 'image/jpeg', 'lake.jpg', 286878, NULL, NULL, NULL, 1, 1515540994, 1, 1515540994, '502 1200'),
(4, 1, 'ocean.jpg', 8, 'image/jpeg', 'ocean.jpg', 111529, NULL, NULL, NULL, 1, 1515540994, 1, 1515540994, '502 1200'),
(5, 1, 'path.jpg', 8, 'image/jpeg', 'path.jpg', 289200, NULL, NULL, NULL, 1, 1515540994, 1, 1515540994, '502 1200'),
(6, 1, 'sky.jpg', 8, 'image/jpeg', 'sky.jpg', 62326, NULL, NULL, NULL, 1, 1515540994, 1, 1515540994, '502 1200');

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_categories`
--

DROP TABLE IF EXISTS `exp_file_categories`;
CREATE TABLE `exp_file_categories` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `cat_id` int(10) UNSIGNED NOT NULL,
  `sort` int(10) UNSIGNED DEFAULT '0',
  `is_cover` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_dimensions`
--

DROP TABLE IF EXISTS `exp_file_dimensions`;
CREATE TABLE `exp_file_dimensions` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `upload_location_id` int(4) UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `resize_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `width` int(10) DEFAULT '0',
  `height` int(10) DEFAULT '0',
  `quality` tinyint(1) UNSIGNED DEFAULT '90',
  `watermark_id` int(4) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_file_watermarks`
--

DROP TABLE IF EXISTS `exp_file_watermarks`;
CREATE TABLE `exp_file_watermarks` (
  `wm_id` int(4) UNSIGNED NOT NULL,
  `wm_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `wm_image_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_test_image_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_font` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_font` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_font_size` int(3) UNSIGNED DEFAULT NULL,
  `wm_text` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_vrt_alignment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'top',
  `wm_hor_alignment` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'left',
  `wm_padding` int(3) UNSIGNED DEFAULT NULL,
  `wm_opacity` int(3) UNSIGNED DEFAULT NULL,
  `wm_hor_offset` int(4) UNSIGNED DEFAULT NULL,
  `wm_vrt_offset` int(4) UNSIGNED DEFAULT NULL,
  `wm_x_transp` int(4) DEFAULT NULL,
  `wm_y_transp` int(4) DEFAULT NULL,
  `wm_font_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wm_use_drop_shadow` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `wm_shadow_distance` int(3) UNSIGNED DEFAULT NULL,
  `wm_shadow_color` varchar(7) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_fluid_field_data`
--

DROP TABLE IF EXISTS `exp_fluid_field_data`;
CREATE TABLE `exp_fluid_field_data` (
  `id` int(11) UNSIGNED NOT NULL,
  `fluid_field_id` int(11) UNSIGNED NOT NULL,
  `entry_id` int(11) UNSIGNED NOT NULL,
  `field_id` int(11) UNSIGNED NOT NULL,
  `field_data_id` int(11) UNSIGNED NOT NULL,
  `order` int(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_global_variables`
--

DROP TABLE IF EXISTS `exp_global_variables`;
CREATE TABLE `exp_global_variables` (
  `variable_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `variable_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variable_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `edit_date` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_global_variables`
--

INSERT INTO `exp_global_variables` (`variable_id`, `site_id`, `variable_name`, `variable_data`, `edit_date`) VALUES
(1, 0, 'gv_comment_disabled', 'Commenting for this entry is <b>disabled</b>.', 1536097648),
(2, 0, 'gv_comment_expired', 'Commenting for this entry has <b>expired</b>.', 1536097648),
(3, 0, 'gv_comment_ignore', 'You are ignoring', 1536097648),
(4, 0, 'gv_comment_none', 'There are <b>no</b> comments on this entry.', 1536097648),
(5, 0, 'gv_entries_none', 'There are <b>no</b> entries in this channel.', 1536097649),
(6, 0, 'gv_sep', '&nbsp;/&nbsp;', 1536097649);

-- --------------------------------------------------------

--
-- Table structure for table `exp_grid_columns`
--

DROP TABLE IF EXISTS `exp_grid_columns`;
CREATE TABLE `exp_grid_columns` (
  `col_id` int(10) UNSIGNED NOT NULL,
  `field_id` int(10) UNSIGNED DEFAULT NULL,
  `content_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_order` int(3) UNSIGNED DEFAULT NULL,
  `col_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_label` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_name` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_instructions` text COLLATE utf8mb4_unicode_ci,
  `col_required` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_search` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `col_width` int(3) UNSIGNED DEFAULT NULL,
  `col_settings` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_grid_columns`
--

INSERT INTO `exp_grid_columns` (`col_id`, `field_id`, `content_type`, `col_order`, `col_type`, `col_label`, `col_name`, `col_instructions`, `col_required`, `col_search`, `col_width`, `col_settings`) VALUES
(1, 1, 'channel', 0, 'file', 'Image', 'image', 'Upload the image you want to use.', 'n', 'n', 0, '{\"field_content_type\":\"image\",\"allowed_directories\":\"all\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_fmt\":\"none\",\"field_required\":\"n\"}'),
(2, 1, 'channel', 1, 'text', 'Caption', 'caption', 'Credit and copyright for this image.', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(3, 1, 'channel', 2, 'select', 'Alignment?', 'align', 'Align this image ot the left or right?', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_pre_populate\":\"n\",\"field_list_items\":\"none\\nleft\\nright\",\"value_label_pairs\":[],\"field_required\":\"n\"}'),
(4, 2, 'channel', 0, 'text', 'ID', 'id', 'Audio ID, i.e. 177363559', 'n', 'y', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(5, 2, 'channel', 1, 'select', 'Type', 'type', 'Type of audio, choose one.', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_pre_populate\":\"n\",\"field_list_items\":\"soundcloud\\nbandcamp\",\"value_label_pairs\":[],\"field_required\":\"n\"}'),
(6, 4, 'channel', 0, 'file', 'Image', 'image', 'Upload the image you want to use.', 'n', 'y', 0, '{\"field_content_type\":\"image\",\"allowed_directories\":\"all\",\"show_existing\":\"y\",\"num_existing\":\"50\",\"field_fmt\":\"none\",\"field_required\":\"n\"}'),
(7, 4, 'channel', 1, 'text', 'Caption', 'caption', 'Credit and copyright for this image.', 'n', 'y', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(8, 5, 'channel', 0, 'text', 'ID', 'id', 'Video ID, i.e. 8OcydG0RiqI', 'n', 'y', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(9, 5, 'channel', 1, 'select', 'Type', 'type', 'Type of video, choose one.', 'n', 'y', 0, '{\"field_fmt\":\"none\",\"field_pre_populate\":\"n\",\"field_list_items\":\"youtube\\nvimeo\",\"value_label_pairs\":[],\"field_required\":\"n\"}'),
(10, 7, 'channel', 0, 'text', 'Street', 'street', 'Street address', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(11, 7, 'channel', 1, 'text', 'Street 2', 'street_2', 'Street address continued, e.g. Suite 2', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(12, 7, 'channel', 2, 'text', 'City', 'city', '', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(13, 7, 'channel', 3, 'text', 'State', 'state', '', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}'),
(14, 7, 'channel', 4, 'text', 'ZIP', 'zip', '', 'n', 'n', 0, '{\"field_fmt\":\"none\",\"field_content_type\":\"all\",\"field_text_direction\":\"ltr\",\"field_maxl\":\"256\",\"field_required\":\"n\"}');

-- --------------------------------------------------------

--
-- Table structure for table `exp_html_buttons`
--

DROP TABLE IF EXISTS `exp_html_buttons`;
CREATE TABLE `exp_html_buttons` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `tag_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_open` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_close` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `accesskey` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_order` int(3) UNSIGNED NOT NULL,
  `tag_row` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `classname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_html_buttons`
--

INSERT INTO `exp_html_buttons` (`id`, `site_id`, `member_id`, `tag_name`, `tag_open`, `tag_close`, `accesskey`, `tag_order`, `tag_row`, `classname`) VALUES
(1, 1, 0, 'html_btn_bold', '<strong>', '</strong>', 'b', 1, '1', 'html-bold'),
(2, 1, 0, 'html_btn_italic', '<em>', '</em>', 'i', 2, '1', 'html-italic'),
(3, 1, 0, 'html_btn_blockquote', '<blockquote>', '</blockquote>', 'q', 3, '1', 'html-quote'),
(4, 1, 0, 'html_btn_anchor', '<a href=\"[![Link:!:http://]!]\"(!( title=\"[![Title]!]\")!)>', '</a>', 'a', 4, '1', 'html-link'),
(5, 1, 0, 'html_btn_picture', '<img src=\"[![Link:!:http://]!]\" alt=\"[![Alternative text]!]\" />', '', '', 5, '1', 'html-upload');

-- --------------------------------------------------------

--
-- Table structure for table `exp_layout_publish`
--

DROP TABLE IF EXISTS `exp_layout_publish`;
CREATE TABLE `exp_layout_publish` (
  `layout_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `channel_id` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `layout_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_layout` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_layout_publish_member_groups`
--

DROP TABLE IF EXISTS `exp_layout_publish_member_groups`;
CREATE TABLE `exp_layout_publish_member_groups` (
  `layout_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_members`
--

DROP TABLE IF EXISTS `exp_members`;
CREATE TABLE `exp_members` (
  `member_id` int(10) UNSIGNED NOT NULL,
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
  `avatar_width` int(4) UNSIGNED DEFAULT NULL,
  `avatar_height` int(4) UNSIGNED DEFAULT NULL,
  `photo_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo_width` int(4) UNSIGNED DEFAULT NULL,
  `photo_height` int(4) UNSIGNED DEFAULT NULL,
  `sig_img_filename` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sig_img_width` int(4) UNSIGNED DEFAULT NULL,
  `sig_img_height` int(4) UNSIGNED DEFAULT NULL,
  `ignore_list` text COLLATE utf8mb4_unicode_ci,
  `private_messages` int(4) UNSIGNED NOT NULL DEFAULT '0',
  `accept_messages` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `last_view_bulletins` int(10) NOT NULL DEFAULT '0',
  `last_bulletin_date` int(10) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `join_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_visit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_entries` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) UNSIGNED NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_email_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
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
  `cp_homepage_custom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_members`
--

INSERT INTO `exp_members` (`member_id`, `group_id`, `username`, `screen_name`, `password`, `salt`, `unique_id`, `crypt_key`, `authcode`, `email`, `signature`, `avatar_filename`, `avatar_width`, `avatar_height`, `photo_filename`, `photo_width`, `photo_height`, `sig_img_filename`, `sig_img_width`, `sig_img_height`, `ignore_list`, `private_messages`, `accept_messages`, `last_view_bulletins`, `last_bulletin_date`, `ip_address`, `join_date`, `last_visit`, `last_activity`, `total_entries`, `total_comments`, `total_forum_topics`, `total_forum_posts`, `last_entry_date`, `last_comment_date`, `last_forum_post_date`, `last_email_date`, `in_authorlist`, `accept_admin_email`, `accept_user_email`, `notify_by_default`, `notify_of_pm`, `display_avatars`, `display_signatures`, `parse_smileys`, `smart_notifications`, `language`, `timezone`, `time_format`, `date_format`, `include_seconds`, `profile_theme`, `forum_theme`, `tracker`, `template_size`, `notepad`, `notepad_size`, `bookmarklets`, `quick_links`, `quick_tabs`, `show_sidebar`, `pmember_id`, `rte_enabled`, `rte_toolset_id`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`) VALUES
(1, 1, 'mrubio', 'mrubio', '4ff70e65bb20ff03cd8550bbaf372112d36855d7fd8154be3e1b8eba4a5672a206900f992a8c4a173ecda8865ba5dc81d84b012f1ad8fbcbeaccc64b9a3e8a8b', '$o2O{F$AV^\"NBtWwby9};m)4+(1:fsIYDn(,CaLIY&|+&A@ykl[JSB_!z[?k&&!k=IVfii;fb\\8Y^]nUshzu|GNY06$#QvDO{aq/&zWF=E4d>,,L$WJExhe1ty//Q&{/', '7449bb75968a239825a280749854d389b8037848', '48ac06b7ff22abf620b9277e3de9dd2bf77a9913', NULL, 'miguelantonio.rubio@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '192.168.33.1', 1515540988, 1536269601, 1536346353, 9, 7, 0, 0, 1515540988, 1515541007, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', NULL, NULL, NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, '', NULL, 'n', 0, 'y', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_bulletin_board`
--

DROP TABLE IF EXISTS `exp_member_bulletin_board`;
CREATE TABLE `exp_member_bulletin_board` (
  `bulletin_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL,
  `bulletin_group` int(8) UNSIGNED NOT NULL,
  `bulletin_date` int(10) UNSIGNED NOT NULL,
  `hash` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bulletin_expires` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `bulletin_message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_data`
--

DROP TABLE IF EXISTS `exp_member_data`;
CREATE TABLE `exp_member_data` (
  `member_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_member_data`
--

INSERT INTO `exp_member_data` (`member_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_fields`
--

DROP TABLE IF EXISTS `exp_member_fields`;
CREATE TABLE `exp_member_fields` (
  `m_field_id` int(4) UNSIGNED NOT NULL,
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
  `m_field_order` int(3) UNSIGNED DEFAULT NULL,
  `m_field_text_direction` char(3) COLLATE utf8mb4_unicode_ci DEFAULT 'ltr',
  `m_field_settings` text COLLATE utf8mb4_unicode_ci,
  `m_legacy_field_data` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_groups`
--

DROP TABLE IF EXISTS `exp_member_groups`;
CREATE TABLE `exp_member_groups` (
  `group_id` smallint(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `menu_set_id` int(5) UNSIGNED NOT NULL DEFAULT '1',
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
  `search_flood_control` mediumint(5) UNSIGNED NOT NULL,
  `can_send_private_messages` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `prv_msg_send_limit` smallint(5) UNSIGNED NOT NULL DEFAULT '20',
  `prv_msg_storage_limit` smallint(5) UNSIGNED NOT NULL DEFAULT '60',
  `can_attach_in_private_messages` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_send_bulletins` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_authorlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `include_in_memberlist` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `cp_homepage` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cp_homepage_channel` int(10) UNSIGNED NOT NULL DEFAULT '0',
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
  `can_moderate_spam` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_member_groups`
--

INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `menu_set_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_footer_report_bug`, `can_access_footer_new_ticket`, `can_access_footer_user_guide`, `can_view_homepage_news`, `can_access_files`, `can_access_design`, `can_access_addons`, `can_access_members`, `can_access_sys_prefs`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_design`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_addons`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_cached_email`, `can_email_member_groups`, `can_email_from_profile`, `can_view_profiles`, `can_edit_html_buttons`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `can_create_entries`, `can_edit_self_entries`, `can_upload_new_files`, `can_edit_files`, `can_delete_files`, `can_upload_new_toolsets`, `can_edit_toolsets`, `can_delete_toolsets`, `can_create_upload_directories`, `can_edit_upload_directories`, `can_delete_upload_directories`, `can_create_channels`, `can_edit_channels`, `can_delete_channels`, `can_create_channel_fields`, `can_edit_channel_fields`, `can_delete_channel_fields`, `can_create_statuses`, `can_delete_statuses`, `can_edit_statuses`, `can_create_categories`, `can_create_member_groups`, `can_delete_member_groups`, `can_edit_member_groups`, `can_create_members`, `can_edit_members`, `can_create_new_templates`, `can_edit_templates`, `can_delete_templates`, `can_create_template_groups`, `can_edit_template_groups`, `can_delete_template_groups`, `can_create_template_partials`, `can_edit_template_partials`, `can_delete_template_partials`, `can_create_template_variables`, `can_delete_template_variables`, `can_edit_template_variables`, `can_access_security_settings`, `can_access_translate`, `can_access_import`, `can_access_sql_manager`, `can_moderate_spam`) VALUES
(1, 1, 1, 'Super Admin', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', NULL, 'y', 'y', 'y', 0, 'y', 20, 60, 'y', 'y', 'y', 'y', NULL, 0, NULL, 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y'),
(2, 1, 1, 'Banned', '', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', NULL, 'n', 'n', 'n', 60, 'n', 20, 60, 'n', 'n', 'n', 'n', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(3, 1, 1, 'Guests', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', NULL, 'n', 'n', 'n', 10, 'n', 20, 60, 'n', 'n', 'n', 'y', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(4, 1, 1, 'Pending', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', NULL, 'n', 'n', 'n', 10, 'n', 20, 60, 'n', 'n', 'n', 'y', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(5, 1, 1, 'Members', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'y', 'y', NULL, 'n', 'n', 'n', 10, 'y', 20, 60, 'y', 'n', 'n', 'y', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_news_views`
--

DROP TABLE IF EXISTS `exp_member_news_views`;
CREATE TABLE `exp_member_news_views` (
  `news_id` int(10) UNSIGNED NOT NULL,
  `version` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_member_news_views`
--

INSERT INTO `exp_member_news_views` (`news_id`, `version`, `member_id`) VALUES
(1, '4.0.4', 1);

-- --------------------------------------------------------

--
-- Table structure for table `exp_member_search`
--

DROP TABLE IF EXISTS `exp_member_search`;
CREATE TABLE `exp_member_search` (
  `search_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `search_date` int(10) UNSIGNED NOT NULL,
  `keywords` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fields` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `total_results` int(8) UNSIGNED NOT NULL,
  `query` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_menu_items`
--

DROP TABLE IF EXISTS `exp_menu_items`;
CREATE TABLE `exp_menu_items` (
  `item_id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) NOT NULL DEFAULT '0',
  `set_id` int(10) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_menu_sets`
--

DROP TABLE IF EXISTS `exp_menu_sets`;
CREATE TABLE `exp_menu_sets` (
  `set_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_menu_sets`
--

INSERT INTO `exp_menu_sets` (`set_id`, `name`) VALUES
(1, 'Default');

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_attachments`
--

DROP TABLE IF EXISTS `exp_message_attachments`;
CREATE TABLE `exp_message_attachments` (
  `attachment_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `attachment_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_extension` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_location` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attachment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `attachment_size` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `is_temp` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_copies`
--

DROP TABLE IF EXISTS `exp_message_copies`;
CREATE TABLE `exp_message_copies` (
  `copy_id` int(10) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `recipient_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_received` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_read` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_time_read` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `attachment_downloaded` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_folder` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `message_authcode` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_deleted` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_status` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_data`
--

DROP TABLE IF EXISTS `exp_message_data`;
CREATE TABLE `exp_message_data` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `sender_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `message_subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_tracking` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `message_attachments` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_recipients` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_cc` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_hide_cc` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `message_sent_copy` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `total_recipients` int(5) UNSIGNED NOT NULL DEFAULT '0',
  `message_status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_folders`
--

DROP TABLE IF EXISTS `exp_message_folders`;
CREATE TABLE `exp_message_folders` (
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `folder1_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'InBox',
  `folder2_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Sent',
  `folder3_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder4_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder5_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder6_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder7_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder8_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder9_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `folder10_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_message_listed`
--

DROP TABLE IF EXISTS `exp_message_listed`;
CREATE TABLE `exp_message_listed` (
  `listed_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `listed_member` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `listed_description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `listed_type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'blocked'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_modules`
--

DROP TABLE IF EXISTS `exp_modules`;
CREATE TABLE `exp_modules` (
  `module_id` int(4) UNSIGNED NOT NULL,
  `module_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_cp_backend` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `has_publish_fields` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_modules`
--

INSERT INTO `exp_modules` (`module_id`, `module_name`, `module_version`, `has_cp_backend`, `has_publish_fields`) VALUES
(1, 'Channel', '2.0.1', 'n', 'n'),
(2, 'Comment', '2.3.3', 'y', 'n'),
(3, 'Stats', '2.0.0', 'n', 'n'),
(4, 'Rte', '1.0.1', 'y', 'n'),
(5, 'File', '1.0.0', 'n', 'n'),
(6, 'Filepicker', '1.0', 'y', 'n'),
(7, 'Relationship', '1.0.0', 'n', 'n'),
(8, 'Search', '2.2.2', 'n', 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_module_member_groups`
--

DROP TABLE IF EXISTS `exp_module_member_groups`;
CREATE TABLE `exp_module_member_groups` (
  `group_id` smallint(4) UNSIGNED NOT NULL,
  `module_id` mediumint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_online_users`
--

DROP TABLE IF EXISTS `exp_online_users`;
CREATE TABLE `exp_online_users` (
  `online_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `in_forum` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `anon` char(1) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_password_lockout`
--

DROP TABLE IF EXISTS `exp_password_lockout`;
CREATE TABLE `exp_password_lockout` (
  `lockout_id` int(10) UNSIGNED NOT NULL,
  `login_date` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_password_lockout`
--

INSERT INTO `exp_password_lockout` (`lockout_id`, `login_date`, `ip_address`, `user_agent`, `username`) VALUES
(1, 1515699534, '192.168.33.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 'miguelrubio'),
(2, 1536093868, '192.168.33.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'admin'),
(3, 1536093872, '192.168.33.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'admin'),
(4, 1536093877, '192.168.33.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'admin'),
(5, 1536093885, '192.168.33.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `exp_plugins`
--

DROP TABLE IF EXISTS `exp_plugins`;
CREATE TABLE `exp_plugins` (
  `plugin_id` int(10) UNSIGNED NOT NULL,
  `plugin_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_package` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plugin_version` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_typography_related` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_relationships`
--

DROP TABLE IF EXISTS `exp_relationships`;
CREATE TABLE `exp_relationships` (
  `relationship_id` int(6) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `child_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `field_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `fluid_field_data_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `grid_field_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `grid_col_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `grid_row_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `order` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_remember_me`
--

DROP TABLE IF EXISTS `exp_remember_me`;
CREATE TABLE `exp_remember_me` (
  `remember_me_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int(10) DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `admin_sess` tinyint(1) DEFAULT '0',
  `site_id` int(4) DEFAULT '1',
  `expiration` int(10) DEFAULT '0',
  `last_refresh` int(10) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_remember_me`
--

INSERT INTO `exp_remember_me` (`remember_me_id`, `member_id`, `ip_address`, `user_agent`, `admin_sess`, `site_id`, `expiration`, `last_refresh`) VALUES
('4841580417fe1bcd591a7985b598adad30c0e926', 1, '192.168.33.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 0, 1, 1536089671, 1534880071),
('5b6289249b36ac8b8bc454d0834f2d7c2acf6c23', 1, '187.131.106.207', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.81 Safari/537.36', 0, 1, 1537554143, 1536344543),
('81d097d3fd46c733023a9bbbc40ba93493bd068d', 1, '192.168.33.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0', 0, 1, 1531414591, 1530204991),
('a7aa85e39478f1a2e638b0549be633b664cb8608', 1, '192.168.33.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0', 0, 1, 1516828616, 1515619016);

-- --------------------------------------------------------

--
-- Table structure for table `exp_reset_password`
--

DROP TABLE IF EXISTS `exp_reset_password`;
CREATE TABLE `exp_reset_password` (
  `reset_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `resetcode` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_revision_tracker`
--

DROP TABLE IF EXISTS `exp_revision_tracker`;
CREATE TABLE `exp_revision_tracker` (
  `tracker_id` int(10) UNSIGNED NOT NULL,
  `item_id` int(10) UNSIGNED NOT NULL,
  `item_table` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_field` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `item_date` int(10) NOT NULL,
  `item_author_id` int(10) UNSIGNED NOT NULL,
  `item_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_tools`
--

DROP TABLE IF EXISTS `exp_rte_tools`;
CREATE TABLE `exp_rte_tools` (
  `tool_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(75) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_rte_tools`
--

INSERT INTO `exp_rte_tools` (`tool_id`, `name`, `class`, `enabled`) VALUES
(1, 'Blockquote', 'Blockquote_rte', 'y'),
(2, 'Bold', 'Bold_rte', 'y'),
(3, 'Headings', 'Headings_rte', 'y'),
(4, 'Image', 'Image_rte', 'y'),
(5, 'Italic', 'Italic_rte', 'y'),
(6, 'Link', 'Link_rte', 'y'),
(7, 'Ordered List', 'Ordered_list_rte', 'y'),
(8, 'Underline', 'Underline_rte', 'y'),
(9, 'Unordered List', 'Unordered_list_rte', 'y'),
(10, 'View Source', 'View_source_rte', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_rte_toolsets`
--

DROP TABLE IF EXISTS `exp_rte_toolsets`;
CREATE TABLE `exp_rte_toolsets` (
  `toolset_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) DEFAULT '0',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tools` text COLLATE utf8mb4_unicode_ci,
  `enabled` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_rte_toolsets`
--

INSERT INTO `exp_rte_toolsets` (`toolset_id`, `member_id`, `name`, `tools`, `enabled`) VALUES
(1, 0, 'Default', '3|2|5|1|9|7|6|4|10', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `exp_search`
--

DROP TABLE IF EXISTS `exp_search`;
CREATE TABLE `exp_search` (
  `search_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int(4) NOT NULL DEFAULT '1',
  `search_date` int(10) NOT NULL,
  `keywords` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_results` int(6) NOT NULL,
  `per_page` tinyint(3) UNSIGNED NOT NULL,
  `query` mediumtext COLLATE utf8mb4_unicode_ci,
  `custom_fields` mediumtext COLLATE utf8mb4_unicode_ci,
  `result_page` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_search_log`
--

DROP TABLE IF EXISTS `exp_search_log`;
CREATE TABLE `exp_search_log` (
  `id` int(10) NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `member_id` int(10) UNSIGNED NOT NULL,
  `screen_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `search_date` int(10) NOT NULL,
  `search_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `search_terms` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_security_hashes`
--

DROP TABLE IF EXISTS `exp_security_hashes`;
CREATE TABLE `exp_security_hashes` (
  `hash_id` int(10) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `hash` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_security_hashes`
--

INSERT INTO `exp_security_hashes` (`hash_id`, `date`, `session_id`, `hash`) VALUES
(35, 1536266961, '2aaf8a791e4fe777394680e07aa55c4d70a835fb', '04571e7168a25863c0c190775cd0c677dbbbc5c8'),
(36, 1536267022, '55ae721be477981594130450fb06433fc81421b1', '67ec3b377e41aecdb8f9851236d0d1817a948078'),
(37, 1536344544, '606d4c43e7205001acda3d473de4f396740a90c6', 'd7a72e019e91d05753ecd54f89a2986ff51dd15b');

-- --------------------------------------------------------

--
-- Table structure for table `exp_sessions`
--

DROP TABLE IF EXISTS `exp_sessions`;
CREATE TABLE `exp_sessions` (
  `session_id` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `member_id` int(10) NOT NULL DEFAULT '0',
  `admin_sess` tinyint(1) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `login_state` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fingerprint` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sess_start` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `can_debug` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_sites`
--

DROP TABLE IF EXISTS `exp_sites`;
CREATE TABLE `exp_sites` (
  `site_id` int(5) UNSIGNED NOT NULL,
  `site_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `site_description` text COLLATE utf8mb4_unicode_ci,
  `site_system_preferences` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_member_preferences` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_template_preferences` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_channel_preferences` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_bootstrap_checksums` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_pages` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_sites`
--

INSERT INTO `exp_sites` (`site_id`, `site_label`, `site_name`, `site_description`, `site_system_preferences`, `site_member_preferences`, `site_template_preferences`, `site_channel_preferences`, `site_bootstrap_checksums`, `site_pages`) VALUES
(1, 'Diamante Realtors', 'baja_mls', NULL, 'YTo5MTp7czoxMDoiaXNfc2l0ZV9vbiI7czoxOiJ5IjtzOjg6ImJhc2VfdXJsIjtzOjE6Ii8iO3M6OToiYmFzZV9wYXRoIjtzOjI3OiIvaG9tZS9kaWFtYW50ZS9wdWJsaWNfaHRtbC8iO3M6MTA6InNpdGVfaW5kZXgiO3M6MDoiIjtzOjg6InNpdGVfdXJsIjtzOjEwOiJ7YmFzZV91cmx9IjtzOjY6ImNwX3VybCI7czoxOToie2Jhc2VfdXJsfWFkbWluLnBocCI7czoxNjoidGhlbWVfZm9sZGVyX3VybCI7czoxNzoie2Jhc2VfdXJsfXRoZW1lcy8iO3M6MTc6InRoZW1lX2ZvbGRlcl9wYXRoIjtzOjE4OiJ7YmFzZV9wYXRofXRoZW1lcy8iO3M6MTU6IndlYm1hc3Rlcl9lbWFpbCI7czoyOToibWlndWVsYW50b25pby5ydWJpb0BnbWFpbC5jb20iO3M6MTQ6IndlYm1hc3Rlcl9uYW1lIjtzOjA6IiI7czoyMDoiY2hhbm5lbF9ub21lbmNsYXR1cmUiO3M6NzoiY2hhbm5lbCI7czoxMDoibWF4X2NhY2hlcyI7czozOiIxNTAiO3M6MTE6ImNhcHRjaGFfdXJsIjtzOjI2OiJ7YmFzZV91cmx9aW1hZ2VzL2NhcHRjaGFzLyI7czoxMjoiY2FwdGNoYV9wYXRoIjtzOjI3OiJ7YmFzZV9wYXRofWltYWdlcy9jYXB0Y2hhcy8iO3M6MTI6ImNhcHRjaGFfZm9udCI7czoxOiJ5IjtzOjEyOiJjYXB0Y2hhX3JhbmQiO3M6MToieSI7czoyMzoiY2FwdGNoYV9yZXF1aXJlX21lbWJlcnMiO3M6MToibiI7czoxNToicmVxdWlyZV9jYXB0Y2hhIjtzOjE6Im4iO3M6MTg6ImVuYWJsZV9zcWxfY2FjaGluZyI7czoxOiJuIjtzOjE4OiJmb3JjZV9xdWVyeV9zdHJpbmciO3M6MToibiI7czoxMzoic2hvd19wcm9maWxlciI7czoxOiJuIjtzOjE1OiJpbmNsdWRlX3NlY29uZHMiO3M6MToibiI7czoxMzoiY29va2llX2RvbWFpbiI7czowOiIiO3M6MTE6ImNvb2tpZV9wYXRoIjtzOjE6Ii8iO3M6MTU6ImNvb2tpZV9odHRwb25seSI7TjtzOjEzOiJjb29raWVfc2VjdXJlIjtOO3M6MjA6IndlYnNpdGVfc2Vzc2lvbl90eXBlIjtzOjE6ImMiO3M6MTU6ImNwX3Nlc3Npb25fdHlwZSI7czoxOiJjIjtzOjIxOiJhbGxvd191c2VybmFtZV9jaGFuZ2UiO3M6MToieSI7czoxODoiYWxsb3dfbXVsdGlfbG9naW5zIjtzOjE6InkiO3M6MTY6InBhc3N3b3JkX2xvY2tvdXQiO3M6MToieSI7czoyNToicGFzc3dvcmRfbG9ja291dF9pbnRlcnZhbCI7czoxOiIxIjtzOjIwOiJyZXF1aXJlX2lwX2Zvcl9sb2dpbiI7czoxOiJ5IjtzOjIyOiJyZXF1aXJlX2lwX2Zvcl9wb3N0aW5nIjtzOjE6InkiO3M6MjQ6InJlcXVpcmVfc2VjdXJlX3Bhc3N3b3JkcyI7czoxOiJuIjtzOjE5OiJhbGxvd19kaWN0aW9uYXJ5X3B3IjtzOjE6InkiO3M6MjM6Im5hbWVfb2ZfZGljdGlvbmFyeV9maWxlIjtzOjA6IiI7czoxNzoieHNzX2NsZWFuX3VwbG9hZHMiO3M6MToieSI7czoxNToicmVkaXJlY3RfbWV0aG9kIjtzOjg6InJlZGlyZWN0IjtzOjk6ImRlZnRfbGFuZyI7czo3OiJlbmdsaXNoIjtzOjg6InhtbF9sYW5nIjtzOjI6ImVuIjtzOjEyOiJzZW5kX2hlYWRlcnMiO3M6MToieSI7czoxMToiZ3ppcF9vdXRwdXQiO3M6MToibiI7czoyMToiZGVmYXVsdF9zaXRlX3RpbWV6b25lIjtzOjA6IiI7czoxMToiZGF0ZV9mb3JtYXQiO3M6ODoiJW4vJWovJVkiO3M6MTE6InRpbWVfZm9ybWF0IjtzOjI6IjEyIjtzOjEzOiJtYWlsX3Byb3RvY29sIjtzOjQ6Im1haWwiO3M6MTM6ImVtYWlsX25ld2xpbmUiO3M6MjoiXG4iO3M6MTE6InNtdHBfc2VydmVyIjtzOjA6IiI7czo5OiJzbXRwX3BvcnQiO047czoxMzoic210cF91c2VybmFtZSI7czowOiIiO3M6MTM6InNtdHBfcGFzc3dvcmQiO3M6MDoiIjtzOjE3OiJlbWFpbF9zbXRwX2NyeXB0byI7czozOiJzc2wiO3M6MTE6ImVtYWlsX2RlYnVnIjtzOjE6Im4iO3M6MTM6ImVtYWlsX2NoYXJzZXQiO3M6NToidXRmLTgiO3M6MTU6ImVtYWlsX2JhdGNobW9kZSI7czoxOiJuIjtzOjE2OiJlbWFpbF9iYXRjaF9zaXplIjtzOjA6IiI7czoxMToibWFpbF9mb3JtYXQiO3M6NToicGxhaW4iO3M6OToid29yZF93cmFwIjtzOjE6InkiO3M6MjI6ImVtYWlsX2NvbnNvbGVfdGltZWxvY2siO3M6MToiNSI7czoyMjoibG9nX2VtYWlsX2NvbnNvbGVfbXNncyI7czoxOiJ5IjtzOjE2OiJsb2dfc2VhcmNoX3Rlcm1zIjtzOjE6InkiO3M6MTk6ImRlbnlfZHVwbGljYXRlX2RhdGEiO3M6MToieSI7czoyNDoicmVkaXJlY3Rfc3VibWl0dGVkX2xpbmtzIjtzOjE6Im4iO3M6MTY6ImVuYWJsZV9jZW5zb3JpbmciO3M6MToibiI7czoxNDoiY2Vuc29yZWRfd29yZHMiO3M6MDoiIjtzOjE4OiJjZW5zb3JfcmVwbGFjZW1lbnQiO3M6MDoiIjtzOjEwOiJiYW5uZWRfaXBzIjtzOjA6IiI7czoxMzoiYmFubmVkX2VtYWlscyI7czowOiIiO3M6MTY6ImJhbm5lZF91c2VybmFtZXMiO3M6MDoiIjtzOjE5OiJiYW5uZWRfc2NyZWVuX25hbWVzIjtzOjA6IiI7czoxMDoiYmFuX2FjdGlvbiI7czo4OiJyZXN0cmljdCI7czoxMToiYmFuX21lc3NhZ2UiO3M6MzQ6IlRoaXMgc2l0ZSBpcyBjdXJyZW50bHkgdW5hdmFpbGFibGUiO3M6MTU6ImJhbl9kZXN0aW5hdGlvbiI7czoyMToiaHR0cDovL3d3dy55YWhvby5jb20vIjtzOjE2OiJlbmFibGVfZW1vdGljb25zIjtzOjE6InkiO3M6MTI6ImVtb3RpY29uX3VybCI7czoyNToie2Jhc2VfdXJsfWltYWdlcy9zbWlsZXlzLyI7czoxOToicmVjb3VudF9iYXRjaF90b3RhbCI7czo0OiIxMDAwIjtzOjE3OiJuZXdfdmVyc2lvbl9jaGVjayI7czoxOiJ5IjtzOjE3OiJlbmFibGVfdGhyb3R0bGluZyI7czoxOiJuIjtzOjE3OiJiYW5pc2hfbWFza2VkX2lwcyI7czoxOiJ5IjtzOjE0OiJtYXhfcGFnZV9sb2FkcyI7czoyOiIxMCI7czoxMzoidGltZV9pbnRlcnZhbCI7czoxOiI4IjtzOjEyOiJsb2Nrb3V0X3RpbWUiO3M6MjoiMzAiO3M6MTU6ImJhbmlzaG1lbnRfdHlwZSI7czo3OiJtZXNzYWdlIjtzOjE0OiJiYW5pc2htZW50X3VybCI7czowOiIiO3M6MTg6ImJhbmlzaG1lbnRfbWVzc2FnZSI7czo1MDoiWW91IGhhdmUgZXhjZWVkZWQgdGhlIGFsbG93ZWQgcGFnZSBsb2FkIGZyZXF1ZW5jeS4iO3M6MTc6ImVuYWJsZV9zZWFyY2hfbG9nIjtzOjE6InkiO3M6MTk6Im1heF9sb2dnZWRfc2VhcmNoZXMiO3M6MzoiNTAwIjtzOjExOiJydGVfZW5hYmxlZCI7czoxOiJ5IjtzOjIyOiJydGVfZGVmYXVsdF90b29sc2V0X2lkIjtzOjE6IjEiO3M6MTM6ImZvcnVtX3RyaWdnZXIiO047fQ==', 'YTo0Nzp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjA6ImRlZmF1bHRfbWVtYmVyX2dyb3VwIjtzOjE6IjUiO3M6MTU6InByb2ZpbGVfdHJpZ2dlciI7czo2OiJtZW1iZXIiO3M6MTI6Im1lbWJlcl90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjE0OiJlbmFibGVfYXZhdGFycyI7czoxOiJ5IjtzOjIwOiJhbGxvd19hdmF0YXJfdXBsb2FkcyI7czoxOiJuIjtzOjEwOiJhdmF0YXJfdXJsIjtzOjI1OiJ7YmFzZV91cmx9aW1hZ2VzL2F2YXRhcnMvIjtzOjExOiJhdmF0YXJfcGF0aCI7czoyNjoie2Jhc2VfcGF0aH1pbWFnZXMvYXZhdGFycy8iO3M6MTY6ImF2YXRhcl9tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE3OiJhdmF0YXJfbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTM6ImF2YXRhcl9tYXhfa2IiO3M6MjoiNTAiO3M6MTM6ImVuYWJsZV9waG90b3MiO3M6MToibiI7czo5OiJwaG90b191cmwiO3M6MzE6IntiYXNlX3VybH1pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTA6InBob3RvX3BhdGgiO3M6MzI6IntiYXNlX3BhdGh9aW1hZ2VzL21lbWJlcl9waG90b3MvIjtzOjE1OiJwaG90b19tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE2OiJwaG90b19tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMjoicGhvdG9fbWF4X2tiIjtzOjI6IjUwIjtzOjE2OiJhbGxvd19zaWduYXR1cmVzIjtzOjE6InkiO3M6MTM6InNpZ19tYXhsZW5ndGgiO3M6MzoiNTAwIjtzOjIxOiJzaWdfYWxsb3dfaW1nX2hvdGxpbmsiO3M6MToibiI7czoyMDoic2lnX2FsbG93X2ltZ191cGxvYWQiO3M6MToibiI7czoxMToic2lnX2ltZ191cmwiO3M6Mzk6IntiYXNlX3VybH1pbWFnZXMvc2lnbmF0dXJlX2F0dGFjaG1lbnRzLyI7czoxMjoic2lnX2ltZ19wYXRoIjtzOjQwOiJ7YmFzZV9wYXRofWltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjE3OiJzaWdfaW1nX21heF93aWR0aCI7czozOiI0ODAiO3M6MTg6InNpZ19pbWdfbWF4X2hlaWdodCI7czoyOiI4MCI7czoxNDoic2lnX2ltZ19tYXhfa2IiO3M6MjoiMzAiO3M6MTU6InBydl9tc2dfZW5hYmxlZCI7czoxOiJ5IjtzOjI1OiJwcnZfbXNnX2FsbG93X2F0dGFjaG1lbnRzIjtzOjE6InkiO3M6MTk6InBydl9tc2dfdXBsb2FkX3BhdGgiO3M6MzM6IntiYXNlX3BhdGh9aW1hZ2VzL3BtX2F0dGFjaG1lbnRzLyI7czoyMzoicHJ2X21zZ19tYXhfYXR0YWNobWVudHMiO3M6MToiMyI7czoyMjoicHJ2X21zZ19hdHRhY2hfbWF4c2l6ZSI7czozOiIyNTAiO3M6MjA6InBydl9tc2dfYXR0YWNoX3RvdGFsIjtzOjM6IjEwMCI7czoxOToicHJ2X21zZ19odG1sX2Zvcm1hdCI7czo0OiJzYWZlIjtzOjE4OiJwcnZfbXNnX2F1dG9fbGlua3MiO3M6MToieSI7czoxNzoicHJ2X21zZ19tYXhfY2hhcnMiO3M6NDoiNjAwMCI7czoxOToibWVtYmVybGlzdF9vcmRlcl9ieSI7czoxMToidG90YWxfcG9zdHMiO3M6MjE6Im1lbWJlcmxpc3Rfc29ydF9vcmRlciI7czo0OiJkZXNjIjtzOjIwOiJtZW1iZXJsaXN0X3Jvd19saW1pdCI7czoyOiIyMCI7czoyODoiYXBwcm92ZWRfbWVtYmVyX25vdGlmaWNhdGlvbiI7TjtzOjI4OiJkZWNsaW5lZF9tZW1iZXJfbm90aWZpY2F0aW9uIjtOO30=', 'YTo2OntzOjIyOiJlbmFibGVfdGVtcGxhdGVfcm91dGVzIjtzOjE6InkiO3M6MTE6InN0cmljdF91cmxzIjtzOjE6InkiO3M6ODoic2l0ZV80MDQiO3M6MTA6Im1haW4vaW5kZXgiO3M6MTk6InNhdmVfdG1wbF9yZXZpc2lvbnMiO3M6MToibiI7czoxODoibWF4X3RtcGxfcmV2aXNpb25zIjtzOjE6IjUiO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7Tjt9', 'YToxMzp7czoyMzoiYXV0b19hc3NpZ25fY2F0X3BhcmVudHMiO3M6MToieSI7czoyMzoiYXV0b19jb252ZXJ0X2hpZ2hfYXNjaWkiO3M6MToibiI7czoyMzoiY29tbWVudF9lZGl0X3RpbWVfbGltaXQiO047czoyNzoiY29tbWVudF9tb2RlcmF0aW9uX292ZXJyaWRlIjtOO3M6MjI6ImNvbW1lbnRfd29yZF9jZW5zb3JpbmciO047czoxNToiZW5hYmxlX2NvbW1lbnRzIjtzOjE6InkiO3M6MTg6ImltYWdlX2xpYnJhcnlfcGF0aCI7czowOiIiO3M6MjE6ImltYWdlX3Jlc2l6ZV9wcm90b2NvbCI7czozOiJnZDIiO3M6MjI6Im5ld19wb3N0c19jbGVhcl9jYWNoZXMiO3M6MToieSI7czoyMjoicmVzZXJ2ZWRfY2F0ZWdvcnlfd29yZCI7czo4OiJjYXRlZ29yeSI7czoxNjoidGh1bWJuYWlsX3ByZWZpeCI7czo1OiJ0aHVtYiI7czoxNzoidXNlX2NhdGVnb3J5X25hbWUiO3M6MToibiI7czoxNDoid29yZF9zZXBhcmF0b3IiO3M6NDoiZGFzaCI7fQ==', 'YToyOntzOjM2OiIvaG9tZS9kaWFtYW50ZS9wdWJsaWNfaHRtbC9pbmRleC5waHAiO3M6MzI6IjdkZDBiM2ZmNTAzZWE5ZWIxNTUzMzM1YzZmODM1Yzg3IjtzOjc6ImVtYWlsZWQiO2E6MDp7fX0=', 'YToxOntpOjE7YTozOntzOjQ6InVyaXMiO2E6MDp7fXM6OToidGVtcGxhdGVzIjthOjA6e31zOjM6InVybCI7czoxMToie2Jhc2VfdXJsfS8iO319');

-- --------------------------------------------------------

--
-- Table structure for table `exp_snippets`
--

DROP TABLE IF EXISTS `exp_snippets`;
CREATE TABLE `exp_snippets` (
  `snippet_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) NOT NULL,
  `snippet_name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `snippet_contents` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_snippets`
--

INSERT INTO `exp_snippets` (`snippet_id`, `site_id`, `snippet_name`, `snippet_contents`, `edit_date`) VALUES
(1, 0, 'snp_blog_list', '<div class=\"entry\">\n	{!-- title --}\n	<h2><a href=\"{path=\'{p_url}/{p_url_entry}/{url_title}\'}\">{title}</a></h2>\n	<p><b>on:</b> {entry_date format=\'%n/%j/%Y\'}, <b>by:</b> <a href=\"{path=\'member/{author_id}\'}\">{author}</a>, <a href=\"{path=\'{p_url}/{p_url_entry}/{url_title}#comments\'}\">{comment_total} comment{if comment_total != 1}s{/if}</a></p>\n</div>', 1536097646),
(2, 0, 'snp_blog_list_paginate', '{!-- pagination --}\n{paginate}\n	<div class=\"paginate\">\n		{pagination_links page_padding=\'1\'}\n			<ul>\n				{previous_page}\n					<li><a href=\"{pagination_url}\">Previous Page</a></li>\n				{/previous_page}\n				{page}\n					<li><a href=\"{pagination_url}\"{if current_page} class=\"act\"{/if}>{pagination_page_number}</a></li>\n				{/page}\n				{next_page}\n					<li><a href=\"{pagination_url}\">Next Page</a></li>\n				{/next_page}\n			</ul>\n		{/pagination_links}\n	</div>\n{/paginate}', 1536097646),
(3, 0, 'snp_main_nav', '					<ul class=\"main-nav\">\n						<li><a{if segment_1 == \'\'} class=\"act\"{/if} href=\"{homepage}\">Home</a></li>\n						<li><a{if segment_1 == \'about\'} class=\"act\"{/if} href=\"{path=\'about\'}\">About</a></li>\n						<li><a{if segment_1 == \'blog\'} class=\"act\"{/if} href=\"{path=\'blog\'}\">Blog</a></li>\n						<li><a{if segment_1 == \'contact\'} class=\"act\"{/if} href=\"{path=\'contact\'}\">Contact</a></li>\n					</ul>', 1536097646);

-- --------------------------------------------------------

--
-- Table structure for table `exp_specialty_templates`
--

DROP TABLE IF EXISTS `exp_specialty_templates`;
CREATE TABLE `exp_specialty_templates` (
  `template_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `enable_template` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `template_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_title` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_subtype` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_notes` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_specialty_templates`
--

INSERT INTO `exp_specialty_templates` (`template_id`, `site_id`, `enable_template`, `template_name`, `data_title`, `template_type`, `template_subtype`, `template_data`, `template_notes`, `edit_date`, `last_author_id`) VALUES
(1, 1, 'y', 'offline_template', '', 'system', NULL, '<html>\n<head>\n\n<title>System Offline</title>\n\n<style type=\"text/css\">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#999999 1px solid;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>System Offline</h1>\n\n<p>This site is currently offline</p>\n\n</div>\n\n</body>\n\n</html>', NULL, 1515540989, 0),
(2, 1, 'y', 'message_template', '', 'system', NULL, '<html>\n<head>\n\n<title>{title}</title>\n\n<meta http-equiv=\'content-type\' content=\'text/html; charset={charset}\' />\n\n{meta_refresh}\n\n<style type=\"text/css\">\n\nbody {\nbackground-color:	#ffffff;\nmargin:				50px;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size:			11px;\ncolor:				#000;\nbackground-color:	#fff;\n}\n\na {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nletter-spacing:		.09em;\ntext-decoration:	none;\ncolor:			  #330099;\nbackground-color:	transparent;\n}\n\na:visited {\ncolor:				#330099;\nbackground-color:	transparent;\n}\n\na:active {\ncolor:				#ccc;\nbackground-color:	transparent;\n}\n\na:hover {\ncolor:				#000;\ntext-decoration:	underline;\nbackground-color:	transparent;\n}\n\n#content  {\nborder:				#000 1px solid;\nbackground-color: 	#DEDFE3;\npadding:			22px 25px 14px 25px;\n}\n\nh1 {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-weight:		bold;\nfont-size:			14px;\ncolor:				#000;\nmargin-top: 		0;\nmargin-bottom:		14px;\n}\n\np {\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		12px;\nmargin-bottom: 		14px;\ncolor: 				#000;\n}\n\nul {\nmargin-bottom: 		16px;\n}\n\nli {\nlist-style:			square;\nfont-family:		Verdana, Arial, Tahoma, Trebuchet MS, Sans-serif;\nfont-size: 			12px;\nfont-weight: 		normal;\nmargin-top: 		8px;\nmargin-bottom: 		8px;\ncolor: 				#000;\n}\n\n</style>\n\n</head>\n\n<body>\n\n<div id=\"content\">\n\n<h1>{heading}</h1>\n\n{content}\n\n<p>{link}</p>\n\n</div>\n\n</body>\n\n</html>', NULL, 1515540989, 0),
(3, 1, 'y', 'admin_notify_reg', 'Notification of new member registration', 'email', 'members', 'New member registration site: {site_name}\n\nScreen name: {name}\nUser name: {username}\nEmail: {email}\n\nYour control panel URL: {control_panel_url}', NULL, 1515540989, 0),
(4, 1, 'y', 'admin_notify_entry', 'A new channel entry has been posted', 'email', 'content', 'A new entry has been posted in the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nPosted by: {name}\nEmail: {email}\n\nTo read the entry please visit:\n{entry_url}\n', NULL, 1515540989, 0),
(5, 1, 'y', 'admin_notify_comment', 'You have just received a comment', 'email', 'comments', 'You have just received a comment for the following channel:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nLocated at:\n{comment_url}\n\nPosted by: {name}\nEmail: {email}\nURL: {url}\nLocation: {location}\n\n{comment}', NULL, 1515540989, 0),
(6, 1, 'y', 'mbr_activation_instructions', 'Enclosed is your activation code', 'email', 'members', 'Thank you for your new member registration.\n\nTo activate your new account, please visit the following URL:\n\n{unwrap}{activation_url}{/unwrap}\n\nThank You!\n\n{site_name}\n\n{site_url}', NULL, 1515540989, 0),
(7, 1, 'y', 'forgot_password_instructions', 'Login information', 'email', 'members', '{name},\n\nTo reset your password, please go to the following page:\n\n{reset_url}\n\nThen log in with your username: {username}\n\nIf you do not wish to reset your password, ignore this message. It will expire in 24 hours.\n\n{site_name}\n{site_url}', NULL, 1515540989, 0),
(8, 1, 'y', 'validated_member_notify', 'Your membership account has been activated', 'email', 'members', '{name},\n\nYour membership account has been activated and is ready for use.\n\nThank You!\n\n{site_name}\n{site_url}', NULL, 1515540989, 0),
(9, 1, 'y', 'decline_member_validation', 'Your membership account has been declined', 'email', 'members', '{name},\n\nWe\'re sorry but our staff has decided not to validate your membership.\n\n{site_name}\n{site_url}', NULL, 1515540989, 0),
(10, 1, 'y', 'comment_notification', 'Someone just responded to your comment', 'email', 'comments', '{name_of_commenter} just responded to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comment at the following URL:\n{comment_url}\n\n{comment}\n\nTo stop receiving notifications for this comment, click here:\n{notification_removal_url}', NULL, 1515540989, 0),
(11, 1, 'y', 'comments_opened_notification', 'New comments have been added', 'email', 'comments', 'Responses have been added to the entry you subscribed to at:\n{channel_name}\n\nThe title of the entry is:\n{entry_title}\n\nYou can see the comments at the following URL:\n{comment_url}\n\n{comments}\n{comment}\n{/comments}\n\nTo stop receiving notifications for this entry, click here:\n{notification_removal_url}', NULL, 1515540989, 0),
(12, 1, 'y', 'private_message_notification', 'Someone has sent you a Private Message', 'email', 'private_messages', '\n{recipient_name},\n\n{sender_name} has just sent you a Private Message titled ‘{message_subject}’.\n\nYou can see the Private Message by logging in and viewing your inbox at:\n{site_url}\n\nContent:\n\n{message_content}\n\nTo stop receiving notifications of Private Messages, turn the option off in your Email Settings.\n\n{site_name}\n{site_url}', NULL, 1515540989, 0),
(13, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', 'email', 'private_messages', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}', NULL, 1515540989, 0);

-- --------------------------------------------------------

--
-- Table structure for table `exp_stats`
--

DROP TABLE IF EXISTS `exp_stats`;
CREATE TABLE `exp_stats` (
  `stat_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `total_members` mediumint(7) NOT NULL DEFAULT '0',
  `recent_member_id` int(10) NOT NULL DEFAULT '0',
  `recent_member` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_entries` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_topics` mediumint(8) NOT NULL DEFAULT '0',
  `total_forum_posts` mediumint(8) NOT NULL DEFAULT '0',
  `total_comments` mediumint(8) NOT NULL DEFAULT '0',
  `last_entry_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_forum_post_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_comment_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_visitor_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `most_visitors` mediumint(7) NOT NULL DEFAULT '0',
  `most_visitor_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_cache_clear` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_stats`
--

INSERT INTO `exp_stats` (`stat_id`, `site_id`, `total_members`, `recent_member_id`, `recent_member`, `total_entries`, `total_forum_topics`, `total_forum_posts`, `total_comments`, `last_entry_date`, `last_forum_post_date`, `last_comment_date`, `last_visitor_date`, `most_visitors`, `most_visitor_date`, `last_cache_clear`) VALUES
(1, 1, 1, 1, 'mrubio', 9, 0, 0, 15, 1515540988, 0, 1515541007, 0, 0, 0, 1537304919);

-- --------------------------------------------------------

--
-- Table structure for table `exp_statuses`
--

DROP TABLE IF EXISTS `exp_statuses`;
CREATE TABLE `exp_statuses` (
  `status_id` int(6) UNSIGNED NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_order` int(3) UNSIGNED NOT NULL,
  `highlight` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_statuses`
--

INSERT INTO `exp_statuses` (`status_id`, `status`, `status_order`, `highlight`) VALUES
(1, 'open', 1, '009933'),
(2, 'closed', 2, '990000'),
(3, 'Default Page', 3, '2051B3');

-- --------------------------------------------------------

--
-- Table structure for table `exp_status_no_access`
--

DROP TABLE IF EXISTS `exp_status_no_access`;
CREATE TABLE `exp_status_no_access` (
  `status_id` int(6) UNSIGNED NOT NULL,
  `member_group` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_templates`
--

DROP TABLE IF EXISTS `exp_templates`;
CREATE TABLE `exp_templates` (
  `template_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_id` int(6) UNSIGNED NOT NULL,
  `template_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `template_type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'webpage',
  `template_data` mediumtext COLLATE utf8mb4_unicode_ci,
  `template_notes` text COLLATE utf8mb4_unicode_ci,
  `edit_date` int(10) NOT NULL DEFAULT '0',
  `last_author_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `cache` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `refresh` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `no_auth_bounce` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `enable_http_auth` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `allow_php` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `php_parse_location` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'o',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `protect_javascript` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_templates`
--

INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`) VALUES
(22, 1, 8, 'index', 'webpage', '{layout=\'layouts/_main-layout\'}\r\n\r\n{layout:set name=\"styles\"}\r\n    <style>\r\n        #home-carousel {\r\n            top:-64px;\r\n            height:calc(100vh + 64px);\r\n        }\r\n        #home-carousel .carousel-item{\r\n            height:100%;\r\n            background-position: center center;\r\n            background-size: cover;\r\n        }\r\n    </style>\r\n{/layout:set}\r\n\r\n<?php\r\n    \r\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/app/config.php\");\r\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/flexmlsAPI.php\");\r\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/lang/lang.php\");\r\n    \r\n    //$cities = [\"la-paz\",\"la-ventana\",\"todos-santos\",\"cabo-san-lucas\",\"san-jose-del-cabo\",\"east-cape\"];\r\n    $city = isset($cities[\"{segment_1}\"]) ? \"{segment_1}\" : \"all\";\r\n    $city_name = isset($cities[$city][\"name\"]) ? $cities[$city][\"name\"] : \"\";\r\n    $property_type = \"all\";\r\n    $list_price = \"all\";\r\n    $portal = 0;\r\n    $language = isset($_GET[\'lang\']) ? trim($_GET[\'lang\']) : \'en\';\r\n\r\n    $protocol = strtolower(substr($_SERVER[\"SERVER_PROTOCOL\"],0,5))==\'https://\'?\'https://\':\'http://\';\r\n    $hostName = $_SERVER[\'HTTP_HOST\'];\r\n    $base_url = $protocol.$hostName;\r\n    $api = new flexmlsAPI(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\");\r\n    $api->SetApplicationName(\"Diamante-MLS-Search/1.0\");\r\n    $api->SetDeveloperMode(false);\r\n    $auth = $api->Authenticate();\r\n    if ($auth === false) api_error_thrown($api);\r\n    $exchange_rate = 1;\r\n\r\n    $parameters = null;\r\n    $listings = null;\r\n    \r\n    if($language == \'es\') {\r\n        $xml = simplexml_load_file(\"http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml\")->Cube[0]->Cube[0];\r\n        $usd = 0;\r\n        $mxn = 0;\r\n        foreach ($xml->Cube as $item) {\r\n            if((string)$item[\'currency\'] === \'USD\')\r\n                $usd = (real)$item[\'rate\'];\r\n                \r\n            if((string)$item[\'currency\'] === \'MXN\')\r\n                $mxn = (real)$item[\'rate\'];\r\n        }\r\n\r\n        $exchange_rate = $mxn/$usd;\r\n    }\r\n\r\n    $cityQuery = \"\";\r\n    if (isset($cities[$city][\"query\"])) $cityQuery = $cities[$city][\"query\"];\r\n\r\n    $parameters = array(\"_filter\" => $cityQuery, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 8, \"_orderby\" => \'-ListPrice\');\r\n    $listings = $api->GetMyListings($parameters);\r\n    //$listings = $api->GetMyListings();\r\n    //$listings = $api->GetListings($parameters);\r\n?>\r\n<div id=\"home-carousel\" class=\"carousel carousel-slider\">\r\n    <?php\r\n        $images = [];\r\n        if ($city_name == \"\") {\r\n            foreach($cities as $key => $item) {\r\n                $imgs = array_slice(scandir($_SERVER[\'DOCUMENT_ROOT\'].\"/images/layout/slider/hd/\".$key),2);\r\n                foreach ($imgs as $img) {\r\n                    array_push($images,$key.\"/\".$img);\r\n                }\r\n            }\r\n            shuffle($images); \r\n            foreach($images as $image) { ?>\r\n                <a class=\"carousel-item\" href=\"#\" style=\"background-image: url(\'/images/layout/slider/hd/<?=$image?>\')\"></a>\r\n            <?php }\r\n        } else {\r\n            $images = array_slice(scandir($_SERVER[\'DOCUMENT_ROOT\'].\"/images/layout/slider/hd/\".$city),2); //array_slice to get rid of . and .. elements\r\n        }\r\n        //print_r($images);\r\n        shuffle($images);\r\n        foreach($images as $image) { ?>\r\n            <a class=\"carousel-item\" href=\"#\" style=\"background-image: url(\'/images/layout/slider/hd/<?=$city?>/<?=$image?>\')\"></a>\r\n        <?php }\r\n    ?>\r\n</div><!--home-carousel-->\r\n\r\n    <div class=\"card quickSearch\">\r\n        <div class=\"card-content\">\r\n            <div class=\"container\">\r\n                <div class=\"card-title center\">\r\n                    Quick Search <?php if ($city_name != \"\") echo \" in \".$city_name; ?> \r\n                </div>\r\n                <div class=\"row\">\r\n                    <form class=\"col s12\">\r\n                    <div class=\"row\">\r\n                        <!--div class=\"input-field col s12 m6 l3\">\r\n                            <input id=\"mls_number\" type=\"text\" class=\"validate\">\r\n                            <label for=\"mls_number\">MLS Number</label>\r\n                        </div-->\r\n                        <div class=\"input-field col s12 m6 l3\">\r\n                            <select id=\"city\">\r\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\r\n                                <?php \r\n                                    foreach($cities as $k => $i) {\r\n                                ?>\r\n                                        <option value=\"<?=$k?>\" <?=$k==$city ? \"selected\" : \"\"?>><?=$i[\"name\"]?></option>\r\n                                <?php\r\n                                    }\r\n                                ?>\r\n                            </select>\r\n                            <label>City</label>\r\n                        </div>\r\n                        <div class=\"input-field col s12 m6 l3\">\r\n                            <select id=\"property_type\">\r\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\r\n                                <option value=\"condos\" <?php echo $property_type == \"condos\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'condos\']; ?></option>\r\n                                <option value=\"houses\" <?php echo $property_type == \"houses\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'houses\']; ?></option>\r\n                                <option value=\"townhouses\" <?php echo $property_type == \"townhouses\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'townhouses\']; ?></option>\r\n                                <option value=\"land\" <?php echo $property_type == \"land\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'land\']; ?></option>\r\n                                <option value=\"commercial\" <?php echo $property_type == \"commercial\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'commercial\']; ?></option>\r\n                                <option value=\"business\" <?php echo $property_type == \"business\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'business\']; ?></option>\r\n                                <option value=\"multifamily\" <?php echo $property_type == \"multifamily\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'multifamily\']; ?></option>\r\n                            </select>\r\n                            <label>Property type</label>\r\n                        </div>\r\n                        <div class=\"input-field col s12 m6 l3\">\r\n                            <select id=\"list_price\">\r\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\r\n                                <option value=\"0\" <?php echo $list_price == \"0\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'under\']; ?> 200,000 USD</option>\r\n                                <option value=\"200K\" <?php echo $list_price == \"200K\" ? \"selected\" : \"\"?>>200,000 - 500,000 USD</option>\r\n                                <option value=\"500K\" <?php echo $list_price == \"500K\" ? \"selected\" : \"\"?>>500,000 - 1,000,000 USD</option>\r\n                                <option value=\"1M\" <?php echo $list_price == \"1M\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'over\']; ?> 1,000,000 USD</option>\r\n                            </select>\r\n                            <label>Price</label>\r\n                        </div>\r\n                        <div class=\"input-field col s12 m6 l3 center\">\r\n                            <a id=\"searchBtn\" class=\"btn waves-effect waves-light white blue-text text-darken-4\">Search\r\n                                <i class=\"material-icons right\">search</i>\r\n                            </a>\r\n                        </div>\r\n                    </div>\r\n                </div><!--row-->\r\n            </div><!--container-->\r\n        </div>\r\n    </div><!--quickSearch card-->\r\n\r\n\r\n\r\n<div class=\"container ctas\">\r\n    <div class=\"row\">\r\n        <div class=\"col s12 m6 l3\">\r\n            <div class=\"card\">\r\n                <div class=\"card-image\">\r\n                    <a href=\"\">\r\n                        <img src=\"/images/layout/cta1.jpg\">\r\n                        <div class=\"card-overlay\"></div>\r\n                        <p class=\"card-title\"><span class=\"t1\">Find my</span><br><span class=\"t2\">dream home</span></p>\r\n                    </a>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div class=\"col s12 m6 l3\">\r\n            <div class=\"card\">\r\n                <div class=\"card-image\">\r\n                    <a href=\"\">\r\n                        <img src=\"/images/layout/cta2.jpg\">\r\n                        <div class=\"card-overlay\"></div>\r\n                        <p class=\"card-title\"><span class=\"t1\">What\'s my</span><br><span class=\"t2\">home worth?</span></p>\r\n                    </a>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div class=\"col s12 m6 l3\">\r\n            <div class=\"card\">\r\n                <div class=\"card-image\">\r\n                    <a href=\"\">\r\n                        <img src=\"/images/layout/cta3.jpg\">\r\n                        <div class=\"card-overlay\"></div>\r\n                        <p class=\"card-title\"><span class=\"t1\">Help me</span><br><span class=\"t2\">relocate</span></p>\r\n                    </a>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div class=\"col s12 m6 l3\">\r\n            <div class=\"card\">\r\n                <div class=\"card-image\">\r\n                    <a href=\"\">\r\n                        <img src=\"/images/layout/cta4.jpg\">\r\n                        <div class=\"card-overlay\"></div>\r\n                        <p class=\"card-title\"><span class=\"t1\">Sign up for</span><br><span class=\"t2\">email updates</span></p>\r\n                    </a>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n\r\n<div class=\"row\">\r\n    <div class=\"col s12 m3\"><hr></div>\r\n    <div class=\"col s12 m6\"><h2>Featured Listings</h2></div>\r\n    <div class=\"col s12 m3\"><hr></div>\r\n</div>\r\n\r\n<div class=\"carousel featured\">\r\n    <?php \r\n    shuffle($listings);\r\n    foreach($listings as $listing) {\r\n        if($language == \'es\'){\r\n            $price = \"$\" . number_format($listing[\"StandardFields\"][\"ListPrice\"] * $exchange_rate,2) . \" MXN\";\r\n        }\r\n        else{\r\n            $price = \"$\" . number_format($listing[\"StandardFields\"][\"ListPrice\"],2) . \" USD\";\r\n        }\r\n\r\n        if (sizeof($listing[\"StandardFields\"][\"Photos\"]) > 0) {\r\n            $thumb = $listing[\"StandardFields\"][\"Photos\"][0][\"Uri800\"];\r\n        } else {\r\n            $thumb = \'http://www.placehold.it/800x250?text=NO+PHOTO\';\r\n        }\r\n\r\n        $stai = $listing[\"StandardFields\"][\"StreetAdditionalInfo\"];\r\n        $stnu = $listing[\"StandardFields\"][\"StreetNumber\"];\r\n        $stna = $listing[\"StandardFields\"][\"StreetName\"];\r\n        //echo $stai . $stnu . $stna;\r\n        $street = $stai != \'********\' ? $stai . \' \' : \'\';\r\n        $street .= $stnu != \'********\' ? $stnu . \' \' : \'\';\r\n        $street .= $stna != \'********\' ? $stna . \' \' : \'\'; ?>\r\n\r\n        <div class=\"card hoverable sticky-action carousel-item\">\r\n            <div class=\"card-image\" style=\"height:100%; width:100%; background-repeat: no-repeat; background-size: cover; background-position: center;background-image:url(\'<?php echo $thumb ?>\');\">\r\n                <a href=\"<?php echo $base_url.\"/listing/detail/\".$listing[\"StandardFields\"][\"ListingId\"] ?>\"\r\n                    <span class=\"card-title\"><?php echo $price ?></span><br>\r\n                    <span class=\"truncate\"><?php echo $street ?></span>\r\n                </a>\r\n            </div>\r\n        </div>\r\n    <?php } ?>\r\n</div>\r\n\r\n<div class=\"row welcome\" style=\"background-image: url(\'/images/layout/welcome-bg.jpg\')\">\r\n    <div class=\"col s12 m6\">\r\n        <p class=\"center\"><img src=\"/images/logo2.png\"></p>\r\n        <hr>\r\n        <p> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis lectus metus. Nunc sollicitudin diam at nisi dignissim varius. Morbi tempus felis in accumsan facilisis. Aliquam in mi sit amet justo dictum molestie. Vivamus sit amet sem sit amet lorem pharetra efficitur. Etiam feugiat suscipit luctus. Donec ac est a mi scelerisque vulputate.</p>\r\n        <p>In vehicula, metus in fringilla rhoncus, dolor ligula aliquam velit, vehicula porta enim justo eget dui. Nam luctus est id ex ornare, in blandit nunc ornare. Nulla commodo ipsum ut arcu ullamcorper ullamcorper. Fusce accumsan varius velit. Vivamus sollicitudin, nibh vitae malesuada ornare, metus libero dictum nibh, sit amet faucibus diam nisi eget arcu. Aenean imperdiet odio accumsan pulvinar consequat. Suspendisse malesuada nisi est, non pretium dolor condimentum non. Vestibulum nibh nunc, fringilla sed mollis non, pellentesque vitae leo. </p>\r\n    </div>\r\n</div>\r\n\r\n\r\n<div class=\"row\">\r\n    <div class=\"col s12 m3\"><hr></div>\r\n    <div class=\"col s12 m6\"><h2>Featured Developments</h2></div>\r\n    <div class=\"col s12 m3\"><hr></div>\r\n</div>\r\n\r\n<div class=\"container ctas\">\r\n    <div class=\"row\">\r\n        <div class=\"col s12 m12 l4\">\r\n            <div class=\"card\">\r\n                <div class=\"card-image\">\r\n                    <a href=\"\">\r\n                        <img src=\"/images/layout/terrazas.jpg\">\r\n                        <div class=\"card-overlay\"></div>\r\n                        <p class=\"card-title\"><span class=\"t2\">terrazas by alttus</span></p>\r\n                    </a>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div class=\"col s12 m12 l4\">\r\n            <div class=\"card\">\r\n                <div class=\"card-image\">\r\n                    <a href=\"\">\r\n                        <img src=\"/images/layout/costa-baja.jpg\">\r\n                        <div class=\"card-overlay\"></div>\r\n                        <p class=\"card-title\"><span class=\"t2\">costa baja resort</span></p>\r\n                    </a>\r\n                </div>\r\n            </div>\r\n        </div>\r\n        <div class=\"col s12 m12 l4\">\r\n            <div class=\"card\">\r\n                <div class=\"card-image\">\r\n                    <a href=\"\">\r\n                        <img src=\"/images/layout/pedregal.jpg\">\r\n                        <div class=\"card-overlay\"></div>\r\n                        <p class=\"card-title\"><span class=\"t2\">pedregal de la paz</span></p>\r\n                    </a>\r\n                </div>\r\n            </div>\r\n        </div>\r\n    </div>\r\n</div>\r\n<?php print_r($cities) ?>\r\n{layout:set name=\"scripts\"}\r\n    <script>\r\n        $(\'.carousel.carousel-slider\').carousel({fullWidth: true});\r\n        autoplay();\r\n        function autoplay() {\r\n            $(\'.carousel\').carousel(\'next\');\r\n            setTimeout(autoplay, 5000);\r\n        }\r\n        $(\'.carousel.featured\').carousel();\r\n\r\n        $(\"#searchBtn\").click(function(){\r\n            var redirect = \"/listing\";\r\n                redirect += \"/\"+$(\"#city\").val();\r\n                redirect += \"/\"+$(\"#property_type\").val();\r\n                redirect += \"/\"+$(\"#list_price\").val();\r\n            console.log(redirect);\r\n            $(this).addClass(\'disabled\');\r\n            window.location.href = redirect;\r\n        });\r\n    </script>\r\n{/layout:set}', NULL, 1533160191, 1, 'n', 0, '24', 'n', 'y', 'o', 0, 'n'),
(23, 1, 9, 'index', 'webpage', '', NULL, 1516132757, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(24, 1, 9, '_main-layout', 'webpage', '<!doctype html>\r\n<html dir=\"ltr\" lang=\"{lang}\">\r\n	<head>\r\n		<meta charset=\"utf-8\">\r\n		<title>{layout:title}{site_name}</title>\r\n		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\r\n\r\n		<!-- meta data -->\r\n		{if layout:meta_author}<meta name=\"author\" content=\"{layout:meta_author}\">{/if}\r\n		{if layout:meta_description}<meta name=\"description\" content=\"{layout:meta_description}\">{/if}\r\n\r\n		<!-- open graph common -->\r\n		<meta property=\"og:site_name\" content=\"{site_name}\">\r\n		<meta property=\"og:type\" content=\"website\">\r\n		<meta property=\"og:image\" content=\"{theme_folder_url}site/default/asset/img/og/default.jpg\"> {!-- square, 50*50 min --}\r\n\r\n		{if layout:og_title != \'\'}\r\n			<!-- open graph per page -->\r\n			<meta property=\"og:title\" content=\"{layout:og_title}\">\r\n			<meta property=\"og:url\" content=\"{layout:og_url}\">\r\n			<meta property=\"og:description\" content=\"{layout:og_description}\">\r\n		{/if}\r\n		<link href=\"{site_url}favicon1.ico\" rel=\"shortcut icon\">\r\n		<!-- Font Awesome -->\r\n    	<!--link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\"-->\r\n		<!--Import Google Icon Font-->\r\n      	<link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\r\n		<!--Import materialize.css-->\r\n  		<!--link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css\"-->\r\n		<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css\">\r\n		<!-- Bootstrap Core -->\r\n        <!--link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css\" integrity=\"sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy\" crossorigin=\"anonymous\"-->\r\n		<!-- Material Design Bootstrap -->\r\n		<!--link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/css/mdb.min.css\"-->\r\n		<!--<link href=\"{theme_folder_url}site/default/asset/style/default.min.css\" title=\"common-styles\" rel=\"stylesheet\">-->\r\n		<!-- <link href=\"{theme_folder_url}site/default/asset/style/debug.min.css\" title=\"common-styles\" rel=\"stylesheet\"> -->\r\n		<!-- Custom Styles -->\r\n        <link href=\"{theme_folder_url}asset/css/custom.css\" title=\"common-styles\" rel=\"stylesheet\">\r\n		{layout:styles}\r\n	</head>\r\n	<?php\r\n		require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/app/config.php\");\r\n		require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/flexmlsAPI.php\");\r\n		require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/lang/lang.php\");\r\n		$lang = substr($_SERVER[\'HTTP_ACCEPT_LANGUAGE\'], 0, 2);\r\n		switch ($lang){\r\n			case \"es\":\r\n				//echo \"PAGE ES\";\r\n				include(\"index_fr.php\");//include check session FR\r\n				break;\r\n			default:\r\n				//echo \"PAGE EN - Setting Default\";\r\n				include(\"index_en.php\");//include EN in all other cases of different lang detection\r\n				break;\r\n		}\r\n	?>\r\n    <body class=\"blue-grey lighten-5\">\r\n		<div class=\"navbar-fixed\">\r\n			<nav class=\"nav-center\">\r\n				<div class=\"nav-wrapper center-align\">\r\n					<div class=\"brand-logo center hide-on-large-only\">\r\n						<a href=\"/\"><img src=\"/images/diamante_shiny.jpg\" height=\"50px\"></a>\r\n					</div>\r\n					<a href=\"#\" data-target=\"mobile-demo\" class=\"sidenav-trigger button-collapse\"><i class=\"material-icons\">menu</i></a>\r\n					<ul class=\"hide-on-med-and-down center\">\r\n						<li><a href=\"#\">Agents</a></li>\r\n						<li><a href=\"/listing\">Properties</a></li>\r\n						<li><a class=\"dropdown-trigger\" href=\"#\" data-target=\"buyers-dropdown\">Buyers/Sellers</a></li>\r\n						<li><a href=\"/\" class=\"logo\"><img src=\"/images/diamante_shiny.jpg\" height=\"100px\"></a></li>\r\n						<li><a class=\"dropdown-trigger\" href=\"#\" data-target=\"locations-dropdown\">Communities</a></li>\r\n						<li><a href=\"#\">Resources</a></li>\r\n						<li><a href=\"#\">Contact</a></li>\r\n						<!--li><a href=\"#\">Español</a></li-->\r\n					</ul>	\r\n					<ul class=\"sidenav side-nav\" id=\"mobile-demo\">\r\n						<li><img src=\"/images/logo2.png\"></li>\r\n						<li><a href=\"#\">Agents</a></li>\r\n						<li><a href=\"#\">Properties</a></li>\r\n						<li><a href=\"#\">Communities</a></li>\r\n						<li><a href=\"#\">Resources</a></li>\r\n						<li><a href=\"#\">Contact</a></li>\r\n					</ul>\r\n				</div>\r\n			</nav>\r\n		</div>\r\n\r\n		<div id=\"buyers-dropdown\" class=\"subnav\">\r\n			<ul>\r\n				<li><a href=\"#\">buyers</a></li>\r\n				<li><a href=\"#!\">sellers</a></li>\r\n			</ul>\r\n		</div>\r\n\r\n		<div id=\"locations-dropdown\" class=\"subnav\">\r\n			<ul>\r\n				<?php\r\n					foreach ($cities as $k => $i) {\r\n				?>\r\n					<li><a href=\"/<?=$k?>\"><?=$i[\"name\"]?></a></li>\r\n				<?php\r\n					}\r\n				?>\r\n			</ul>\r\n		</div>\r\n		\r\n		\r\n		\r\n\r\n\r\n\r\n        \r\n		{layout:contents}\r\n\r\n		<footer>\r\n			<div class=\"footer-top\"></div>\r\n			<div class=\"footer-bottom\">\r\n				<p class=\"center\">© 2015 Diamante Asociados S. de R. L. de C. V.</p>\r\n			</div>\r\n		</footer>\r\n\r\n		<!-- JQuery -->\r\n		<script src=\"https://code.jquery.com/jquery-3.2.1.min.js\" integrity=\"sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=\" crossorigin=\"anonymous\"></script>\r\n		<!-- Materialize -->\r\n  		<!--script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js\"></script-->\r\n		<script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js\"></script>\r\n        <!-- Bootstrap dropdown -->\r\n		<!--script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script-->\r\n		<!-- Bootstrap core JavaScript -->\r\n        <!--script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js\" integrity=\"sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4\" crossorigin=\"anonymous\"></script-->\r\n		<!-- MDB core JavaScript -->\r\n		<!--script src=\"https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/js/mdb.min.js\" crossorigin=\"anonymous\"></script-->\r\n		<script>\r\n			$( document ).ready(function(){\r\n				/* 1.0.0-rc.2 */\r\n				/*\r\n				$(\".sidenav\").sidenav();\r\n				$(\'select\').formSelect();\r\n				*/\r\n				/* 0.100.2 */\r\n				$(\".sidenav-trigger\").sideNav();\r\n				$(\'select\').material_select();\r\n\r\n				boundDropdowns();\r\n				/*$(\'.carousel.fullWidth\').carousel({\r\n					fullWidth:true,\r\n					indicators:true\r\n				});\r\n				$(\'.materialboxed\').materialbox();*/\r\n				$(\'.slider\').slider();\r\n			});\r\n			$( document ).on(\"scroll\", function(){\r\n				//changes navbar alpha on scroll\r\n				var scroll = $( document ).scrollTop();\r\n				$(\"nav, .subnav ul\").css(\"background-color\",\"rgba(255,255,255,\"+(scroll + 80) / 100 +\")\");\r\n				if (scroll < 240) {\r\n					//$(\"nav ul\").css(\"margin\", 30 - (scroll * .1) + \"px 0\");\r\n					$(\".subnav\").css(\"padding-top\", $(\".nav-center\").height());\r\n					$(\".logo img\").height(100 - (scroll/6));\r\n				}\r\n			});\r\n			function boundDropdowns() {\r\n				$(\".dropdown-trigger\").hover(function(){\r\n					pos = $(this).position();\r\n					width = $(this).outerWidth();\r\n					height = $(this).height();\r\n					//margin = $(this).css(\"margin-left\");\r\n					//top = $(\".nav-center\").height();\r\n					//console.log($(\".nav-center\").height());\r\n					subnav = $(\"#\"+$(this).data(\"target\"));\r\n					center = pos.left + (width/2);\r\n					left = center - (subnav.outerWidth()/2);\r\n					subnav.css(\"padding-top\", $(\".nav-center\").height() + \"px\").css(\"left\", left).css(\"min-width\", width);\r\n					subnav.slideDown(\"normal\", function(){\r\n						$(\".subnav\").css(\"z-index\",998);\r\n					});\r\n					\r\n				}, function(){\r\n					//$(\"#\"+$(this).data(\"target\")).slideUp();\r\n					dummy = 0;\r\n				});\r\n				$(\".subnav\").hover(function(){\r\n					//nothing;\r\n					dummy = 0;\r\n				},function(){\r\n					$(\".subnav\").css(\"z-index\", 990);\r\n					$(this).slideUp();\r\n				});\r\n				$(\".subnav\").hide();\r\n			}\r\n		</script>\r\n		{layout:scripts}\r\n	</body>\r\n</html>', NULL, 1533165403, 1, 'n', 0, '24', 'n', 'y', 'o', 0, 'n'),
(25, 1, 10, 'index', 'webpage', '{layout=\'layouts/_main-layout\'}\r\n\r\n{layout:set name=\"styles\"}\r\n    <style>\r\n        .search-card .card-content {\r\n            padding-bottom:0;\r\n        }\r\n        .search-car .card-content row {\r\n            margin-bottom:0;\r\n        }\r\n        main {\r\n            margin-top: 150px;\r\n        }\r\n    </style>\r\n{/layout:set}\r\n\r\n<?php\r\n    error_reporting( E_ALL ); //debug\r\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/flexmlsAPI.php\");\r\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/lang/lang.php\");\r\n    $protocol = strtolower(substr($_SERVER[\"SERVER_PROTOCOL\"],0,5))==\'https://\'?\'https://\':\'http://\';\r\n    $hostName = $_SERVER[\'HTTP_HOST\'];\r\n    $base_url = $protocol.$hostName;\r\n    $api = new flexmlsAPI(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\");\r\n    $api->SetApplicationName(\"Diamante-MLS-Search/1.0\");\r\n    $api->SetDeveloperMode(false);\r\n    $auth = $api->Authenticate();\r\n    if ($auth === false) api_error_thrown($api);\r\n\r\n    $portal = isset($_GET[\'portal\']) ? trim($_GET[\'portal\']) : 0;\r\n    $mls_number = isset($_GET[\'mls_number\']) ? trim($_GET[\'mls_number\']) : \'\';\r\n    //$city = isset($_GET[\'city\']) ? trim($_GET[\'city\']) : \'\';\r\n    $city = \"{segment_2}\" != \"\" ? \"{segment_2}\" : \"all\";\r\n    //$property_type = isset($_GET[\'property_type\']) ? trim($_GET[\'property_type\']) : \'\';\r\n    $property_type  = \"{segment_3}\" != \"\" ? \"{segment_3}\" : \"all\";\r\n    //$list_price = isset($_GET[\'list_price\']) ? trim($_GET[\'list_price\']) : \'\';\r\n    $list_price = \"{segment_4}\" != \"\" ? \"{segment_4}\" : \"all\";\r\n    $development = isset($_GET[\'development\']) ? trim($_GET[\'development\']) : \'\';\r\n    $language = isset($_GET[\'lang\']) ? trim($_GET[\'lang\']) : \'en\';\r\n    //$page = isset($_GET[\'page\']) ? trim($_GET[\'page\']) : 1;\r\n    $page = is_numeric(\"{segment_5}\") ? \"{segment_5}\"  : 1;\r\n    $featured = isset($_GET[\'featured\']) ? $_GET[\'featured\'] : 0;\r\n\r\n    $exchange_rate = 1;\r\n    $parameters = null;\r\n    $listings = null;\r\n    \r\n    if($language == \'es\') {\r\n        $xml = simplexml_load_file(\"http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml\")->Cube[0]->Cube[0];\r\n        $usd = 0;\r\n        $mxn = 0;\r\n        foreach ($xml->Cube as $item) {\r\n            if((string)$item[\'currency\'] === \'USD\')\r\n                $usd = (real)$item[\'rate\'];\r\n                \r\n            if((string)$item[\'currency\'] === \'MXN\')\r\n                $mxn = (real)$item[\'rate\'];\r\n        }\r\n\r\n        $exchange_rate = $mxn/$usd;\r\n    }\r\n\r\n    switch ($city) {\r\n        case \"la-paz\" : $cityQuery = \"City Eq \'La Paz\'\"; break;\r\n        case \"la-ventana\" : $cityQuery = \"SubdivisionName Eq \'La Ventana\' Or SubdivisionName Eq \'El Sargento\'\"; break;\r\n        case \"cabo-san-lucas\" : $cityQuery = \"City Eq \'Cabo San Lucas\'\"; break;\r\n        case \"cabo-corridor\" : $cityQuery = \"City Eq \'Cabo Corridor\'\"; break;\r\n        case \"san-jose-del-cabo\" : $cityQuery = \"City Eq \'San Jose del Cabo\'\"; break;\r\n        case \"san-jose-corridor\" : $cityQuery = \"City Eq \'San Jose Corridor\'\"; break;\r\n        case \"east-cape\" : $cityQuery = \"City Eq \'East Cape\' Or City Eq \'Los Barriles\'\"; break;\r\n        case \"pacific-side\" : $cityQuery = \"City Eq \'Pacific Or City Eq \'Pacific Side\' Or City Eq \'Todos Santos\'\"; break;\r\n        default : $cityQuery = \"\";\r\n    }\r\n\r\n    switch ($property_type) {\r\n        case \"condos\" : $propertyQuery = \"A\"; break;\r\n        case \"houses\" : $propertyQuery = \"B\"; break;\r\n        case \"townhouses\" : $propertyQuery = \"C\"; break;\r\n        case \"land\" : $propertyQuery = \"E\"; break;\r\n        case \"commercial\" : $propertyQuery = \"F\"; break;\r\n        case \"business\" : $propertyQuery = \"G\"; break;\r\n        case \"multifamily\" : $propertyQuery = \"I\"; break;\r\n        default : $propertyQuery = \"\";\r\n    }\r\n\r\n    switch ($list_price) {\r\n        case \"0\" : $listQuery = \"Le 200000.0\"; break;\r\n        case \"200K\" : $listQuery = \"Ge 200000.0 And ListPrice Le 500000.0\"; break;\r\n        case \"500K\" : $listQuery = \"Ge 500000.0 And ListPrice Le 1000000.0\"; break;\r\n        case \"1M\" : $listQuery = \"Ge 1000000.0\"; break;\r\n        default : $listQuery = \"\";\r\n    }\r\n\r\n\r\n    if($mls_number != \'\') {\r\n        $parameters = array(\"_filter\" => \"ListingId Eq \'$mls_number\'\", \"_expand\" => \'PrimaryPhoto\', \"_limit\" => \"1\", \"_pagination\" => true);\r\n        $listings = $api->GetListings($parameters);\r\n    }\r\n    else {\r\n        $filter = \'\';\r\n        $p_type = ($propertyQuery != \"\") ? \"PropertyType Eq \'$propertyQuery\'\": \"Not PropertyType Eq \'H\'\";\r\n        $filter .= ($filter != \'\') ? \" And $p_type\" : \"$p_type\" ;\r\n        $filter .= ($cityQuery != \'\') ? (($filter != \'\') ? \" And $cityQuery\" : \"$cityQuery\" ) : \'\';\r\n        $filter .= ($listQuery != \'\') ? (($filter != \'\') ? \" And ListPrice $listQuery\" : \"ListPrice $listQuery\" ) : \'\';\r\n        if ($development == \'Terrazas\' || $development == \'Torres Cantera\' || $development == \'Vista Coral\' || $development == \'Paseo del Malecon\' || $development == \'Puerto Ilusion\' || $development == \'Querencia\' || $development == \'Palmilla\') {\r\n            $filter .= ($filter != \'\') ? \" And StreetAdditionalInfo Eq \'$development*\'\" : \"StreetAdditionalInfo Eq \'$development*\'\";\r\n        }\r\n        else {\r\n            $filter .= ($development != \'\') ? (($filter != \'\') ? \" And SubdivisionName Eq \'$development\'\" : \"SubdivisionName Eq \'$development\'\" ) : \'\';\r\n        }\r\n        $filter = stripslashes($filter);\r\n\r\n        //echo $filter;\r\n\r\n        if($featured == 1) {\r\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 24, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\r\n            $listings = $api->GetMyListings($parameters);\r\n        }\r\n        else {\r\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 24, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\r\n            $listings = $api->GetListings($parameters);\r\n        }\r\n    }\r\n    $listings[count($listings)] = array(\"LastCount\" => $api->last_count, \"PageSize\" => $api->page_size, \"TotalPages\" => $api->total_pages, \"CurrentPage\" => $api->current_page);\r\n    //var_dump($listings[count($listings)-1]);\r\n    //echo json_encode($listings);\r\n?>\r\n\r\n<main>\r\n    <div class=\"container\">\r\n\r\n        <div class=\"card search-card\">\r\n            <div class=\"card-content\">\r\n                <div class=\"card-title\">\r\n                    MLS Search\r\n                </div>\r\n                <div class=\"row\">\r\n                    <form class=\"col s12\">\r\n                    <div class=\"row\">\r\n                        <div class=\"input-field col s12 m6 l3\">\r\n                            <input id=\"mls_number\" type=\"text\" class=\"validate\">\r\n                            <label for=\"mls_number\">MLS Number</label>\r\n                        </div>\r\n                        <div class=\"input-field col s12 m6 l3\">\r\n                            <select id=\"city\">\r\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\r\n                                <?php if($portal == 1) { ?>\r\n                                    <option value=\"la-ventana\" <?php echo $city == \"la-ventana\" ? \"selected\" : \"\"?>>La Ventana</option>\r\n                                <option value=\"la-paz\" <?php echo $city == \"la-paz\" ? \"selected\" : \"\"?>>La Paz</option>\r\n                                <option value=\"cabo-san-lucas\" <?php echo $city == \"cabo-san-lucas\" ? \"selected\" : \"\"?>>Cabo San Lucas</option>\r\n                                <option value=\"cabo-corridor\" <?php echo $city == \"cabo-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'cabo_corridor\']; ?></option>\r\n                                <option value=\"san-jose-del-cabo\" <?php echo $city == \"san-jose-del-cabo\" ? \"selected\" : \"\"?>>San Jose del Cabo</option>\r\n                                <option value=\"san-jose-corridor\" <?php echo $city == \"san-jose-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'san_jose_corridor\']; ?></option>\r\n                                <option value=\"east-cape\" <?php echo $city == \"east-cape\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'east_cape\']; ?></option>\r\n                                <option value=\"pacific-side\" <?php echo $city == \"pacific-side\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'pacific_side\']; ?></option>\r\n                                <?php } elseif($portal == 3 || $portal == 4 || $portal == 5) { ?>\r\n                                <option value=\"cabo-san-lucas\" <?php echo $city == \"cabo-san-lucas\" ? \"selected\" : \"\"?>>Cabo San Lucas</option>\r\n                                <option value=\"cabo-corridor\" <?php echo $city == \"cabo-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'cabo_corridor\']; ?></option>\r\n                                <option value=\"san-jose-del-cabo\" <?php echo $city == \"san-jose-del-cabo\" ? \"selected\" : \"\"?>>San Jose del Cabo</option>\r\n                                <option value=\"san-jose-corridor\" <?php echo $city == \"san-jose-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'san_jose_corridor\']; ?></option>\r\n                                <option value=\"east-cape\" <?php echo $city == \"east-cape\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'east_cape\']; ?></option>\r\n                                <option value=\"pacific-side\" <?php echo $city == \"pacific-side\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'pacific_side\']; ?></option>\r\n                                <option value=\"la-paz\" <?php echo $city == \"la-paz\" ? \"selected\" : \"\"?>>La Paz</option>\r\n                                <option value=\"la-ventana\" <?php echo $city == \"la-ventana\" ? \"selected\" : \"\"?>>La Ventana</option>\r\n                                <?php } else { ?>\r\n                                <option value=\"la-paz\" <?php echo $city == \"la-paz\" ? \"selected\" : \"\"?>>La Paz</option>\r\n                                <option value=\"la-ventana\" <?php echo $city == \"la-ventana\" ? \"selected\" : \"\"?>>La Ventana</option>\r\n                                <option value=\"cabo-san-lucas\" <?php echo $city == \"cabo-san-lucas\" ? \"selected\" : \"\"?>>Cabo San Lucas</option>\r\n                                <option value=\"cabo-corridor\" <?php echo $city == \"cabo-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'cabo_corridor\']; ?></option>\r\n                                <option value=\"san-jose-del-cabo\" <?php echo $city == \"san-jose-del-cabo\" ? \"selected\" : \"\"?>>San Jose del Cabo</option>\r\n                                <option value=\"san-jose-corridor\" <?php echo $city == \"san-jose-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'san_jose_corridor\']; ?></option>\r\n                                <option value=\"east-cape\" <?php echo $city == \"east-cape\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'east_cape\']; ?></option>\r\n                                <option value=\"pacific-side\" <?php echo $city == \"pacific-side\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'pacific_side\']; ?></option>\r\n                                <?php } ?>\r\n                            </select>\r\n                            <label>City</label>\r\n                        </div>\r\n                        <div class=\"input-field col s12 m6 l3\">\r\n                            <select id=\"property_type\">\r\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\r\n                                <option value=\"condos\" <?php echo $property_type == \"condos\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'condos\']; ?></option>\r\n                                <option value=\"houses\" <?php echo $property_type == \"houses\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'houses\']; ?></option>\r\n                                <option value=\"townhouses\" <?php echo $property_type == \"townhouses\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'townhouses\']; ?></option>\r\n                                <option value=\"land\" <?php echo $property_type == \"land\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'land\']; ?></option>\r\n                                <option value=\"commercial\" <?php echo $property_type == \"commercial\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'commercial\']; ?></option>\r\n                                <option value=\"business\" <?php echo $property_type == \"business\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'business\']; ?></option>\r\n                                <option value=\"multifamily\" <?php echo $property_type == \"multifamily\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'multifamily\']; ?></option>\r\n                            </select>\r\n                            <label>Property type</label>\r\n                        </div>\r\n                        <div class=\"input-field col s12 m6 l3\">\r\n                            <select id=\"list_price\">\r\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\r\n                                <option value=\"0\" <?php echo $list_price == \"0\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'under\']; ?> 200,000 USD</option>\r\n                                <option value=\"200K\" <?php echo $list_price == \"200K\" ? \"selected\" : \"\"?>>200,000 - 500,000 USD</option>\r\n                                <option value=\"500K\" <?php echo $list_price == \"500K\" ? \"selected\" : \"\"?>>500,000 - 1,000,000 USD</option>\r\n                                <option value=\"1M\" <?php echo $list_price == \"1M\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'over\']; ?> 1,000,000 USD</option>\r\n                            </select>\r\n                            <label>Price</label>\r\n                        </div>\r\n                    </div>\r\n                </div>\r\n\r\n            </div>\r\n            <div class=\"card-action right-align\">\r\n                <div class=\"left\">Total results: <?php echo $listings[sizeof($listings)-1][\"LastCount\"] ?></div>\r\n                <a id=\"searchBtn\" class=\"btn waves-effect waves-light\">Search\r\n                    <i class=\"material-icons right\">search</i>\r\n                </a>\r\n            </div>\r\n        </div>\r\n\r\n        <ul class=\"pagination center-align\">\r\n            <?php if ($page > 1) { ?>\r\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page-1) ?>\"><i class=\"material-icons\">chevron_left</i></a></li>\r\n            <?php } ?>\r\n                \r\n            <?php \r\n                $total_pages = $listings[sizeof($listings)-1][\"TotalPages\"];\r\n                for($x = $page - 3; $x <= $page + 3; $x++) { \r\n                    if ($x > 0 && $x <= $total_pages) {?>\r\n                        <li class=\"waves-effect <?php echo $x == $page ? \'active indigo\' : \'\' ?>\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".$x ?>\"><?php echo $x ?></a></li>\r\n                <?php } }\r\n            ?>\r\n\r\n            <?php if ($page < $total_pages) { ?>\r\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page+1) ?>\"><i class=\"material-icons\">chevron_right</i></a></li>\r\n            <?php } ?>   \r\n        </ul>\r\n\r\n        <hr>\r\n\r\n        <?php \r\n            //var_dump($listings);\r\n            $count = 0;\r\n            foreach($listings as $listing){ \r\n                $count++;\r\n                if ($count < sizeof($listings)){\r\n                    //setlocale(LC_MONETARY, \'en_US.utf8\');\r\n                    if($language == \'es\'){\r\n                        $price = \"$\" . number_format($listing[\"StandardFields\"][\"ListPrice\"] * $exchange_rate,2) . \" MXN\";\r\n                    }\r\n                    else{\r\n                        $price = \"$\" . number_format($listing[\"StandardFields\"][\"ListPrice\"],2) . \" USD\";\r\n                    }\r\n\r\n                    if (sizeof($listing[\"StandardFields\"][\"Photos\"]) > 0) {\r\n                        $thumb = $listing[\"StandardFields\"][\"Photos\"][0][\"Uri800\"];\r\n                    } else {\r\n                        $thumb = \'http://www.placehold.it/800x250?text=NO+PHOTO\';\r\n                    }\r\n\r\n                    $stai = $listing[\"StandardFields\"][\"StreetAdditionalInfo\"];\r\n					$stnu = $listing[\"StandardFields\"][\"StreetNumber\"];\r\n                    $stna = $listing[\"StandardFields\"][\"StreetName\"];\r\n                    //echo $stai . $stnu . $stna;\r\n                    $street = $stai != \'********\' ? $stai . \' \' : \'\';\r\n                    $street .= $stnu != \'********\' ? $stnu . \' \' : \'\';\r\n                    $street .= $stna != \'********\' ? $stna . \' \' : \'\';\r\n\r\n                    if (($count+2)%3 == 0) { ?> <div class=\"row mt-5 wow\"> <?php } ?>\r\n\r\n            <div class=\"col m4 s12 wow fadeIn\" data-wow-delay=\"0.2s\">\r\n            \r\n                <div class=\"card hoverable sticky-action\">\r\n                    <div class=\"card-image\">\r\n                        <div class=\"view overlay hm-white-slight activator\" style=\"height:250px; background-repeat: no-repeat; background-size: cover; background-position: center;background-image:url(\'<?php echo $thumb ?>\');\"></div>\r\n                        <!--a href=\"<?php echo $base_url.\"/listing/detail/\".$listing[\"StandardFields\"][\"ListingId\"] ?>\" class=\"btn-floating halfway-fab waves-effect waves-light indigo\"><i class=\"material-icons\">add</i></a-->\r\n                    </div>\r\n                    <div class=\"card-content\">\r\n                        <!--Title-->\r\n                        <h4 class=\"card-title activator right-align\"><?php echo $price ?><i class=\"material-icons right\">more_vert</i></h4>\r\n                        \r\n                        <!--Text-->\r\n                        <div class=\"card-text\">\r\n                            <p class=\"truncate\"><?php echo $street ?></p>\r\n                            <p><?php echo $listing[\"StandardFields\"][\"City\"] ?></p>\r\n                            <!--p>MLS Number: <?php echo $listing[\"StandardFields\"][\"ListingId\"] ?></p-->\r\n                        </div>\r\n                        <!--a href=\"#\" class=\"btn btn-primary\">Button</a-->\r\n                    </div>\r\n                    <div class=\"card-action\">\r\n                        <a href=\"<?php echo $base_url.\"/listing/detail/\".$listing[\"StandardFields\"][\"ListingId\"] ?>\" class=\"btn halfway-fab waves-effect waves-light indigo right\"><i class=\"material-icons\">add</i></a>\r\n                        <p><?php echo $listing[\"StandardFields\"][\"ListingId\"]?></p>\r\n                    </div>\r\n                    <div class=\"card-reveal activator\">\r\n                        <span class=\"card-title grey-text text-darken-4\"><i class=\"material-icons right activator\">close</i><?php echo $street ?></span>\r\n                        <p><?php echo $listing[\"StandardFields\"][\"City\"] ?></p>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n                    \r\n            <?php if (($count)%3 == 0 || $count == sizeof($listings) -1) { ?> </div> <?php } } }?>\r\n            \r\n\r\n        <hr>\r\n\r\n        <ul class=\"pagination center-align\">\r\n            <?php if ($page > 1) { ?>\r\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page-1) ?>\"><i class=\"material-icons\">chevron_left</i></a></li>\r\n            <?php } ?>\r\n                \r\n            <?php \r\n                $total_pages = $listings[sizeof($listings)-1][\"TotalPages\"];\r\n                for($x = $page - 3; $x <= $page + 3; $x++) { \r\n                    if ($x > 0 && $x <= $total_pages) {?>\r\n                        <li class=\"waves-effect <?php echo $x == $page ? \'active indigo\' : \'\' ?>\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".$x ?>\"><?php echo $x ?></a></li>\r\n                <?php } }\r\n            ?>\r\n\r\n            <?php if ($page < $total_pages) { ?>\r\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page+1) ?>\"><i class=\"material-icons\">chevron_right</i></a></li>\r\n            <?php } ?>   \r\n        </ul>\r\n        \r\n    </div>\r\n</main>\r\n\r\n{layout:set name=\"scripts\"}\r\n    <!--script src=\"{theme_folder_url}site/default/asset/js/mls.js\" ></script>\r\n    <script>\r\n        var portal = <?php echo $portal; ?>;\r\n        var language = \'<?php echo $language; ?>\';\r\n        var exchange_rate = <?php echo $exchange_rate; ?>;\r\n        var selectedListing = \'\';\r\n        \r\n        function autoLoad(){\r\n            $(\'#mls_number\').val(\'<?php echo $mls_number; ?>\');\r\n            $(\'#city\').val(\'<?php echo $city; ?>\');\r\n            $(\'#property_type\').val(\'<?php echo $property_type; ?>\');\r\n            $(\'#list_price\').val(\'<?php echo $list_price; ?>\');\r\n            $(\'#development\').val(\'<?php echo $development; ?>\');\r\n            $(\'#submit\').click();\r\n        }\r\n        \r\n        $(function(){\r\n            $(\'#property_type\').change(function(){\r\n                if ($(this).val() != \'E\') {\r\n                    $(\"#list_price option[value=\'Le 200000.0\']\").remove();\r\n                } else if ($(\"#list_price option[value=\'Le 200000.0\']\").length == 0) {\r\n                    $(\'#list_price option:first\').after(\'<option value=\"Le 200000.0\"><?php echo $lang[$language][\'under\']; ?> 200,000 USD</option>\');\r\n                }\r\n            });\r\n        });\r\n    </script-->\r\n    <script>\r\n        //$(\'select\').formSelect();\r\n\r\n        $(\"#searchBtn\").click(function(){\r\n            var redirect = \"/listing\";\r\n            if ($.trim($(\"#mls_number\").val()) != \"\"){\r\n                redirect += \"/detail/\" + $(\"#mls_number\").val();\r\n            } else {\r\n                redirect += \"/\"+$(\"#city\").val();\r\n                redirect += \"/\"+$(\"#property_type\").val();\r\n                redirect += \"/\"+$(\"#list_price\").val();\r\n            }\r\n            console.log(redirect);\r\n            $(this).addClass(\'disabled\');\r\n            window.location.href = redirect;\r\n        });\r\n\r\n    </script>\r\n{/layout:set}', NULL, 1533062816, 1, 'n', 0, '24', 'n', 'y', 'o', 0, 'n');
INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`) VALUES
(26, 1, 10, 'index_bkp', 'webpage', '{layout=\'layouts/_main-layout\'}\r\n\r\n<?php\r\n    $portal = isset($_GET[\'portal\']) ? trim($_GET[\'portal\']) : 0;\r\n    $mls_number = isset($_GET[\'mls_number\']) ? trim($_GET[\'mls_number\']) : \'\';\r\n    $city = isset($_GET[\'city\']) ? trim($_GET[\'city\']) : \'\';\r\n    $property_type = isset($_GET[\'property_type\']) ? trim($_GET[\'property_type\']) : \'\';\r\n    $list_price = isset($_GET[\'list_price\']) ? trim($_GET[\'list_price\']) : \'\';\r\n    $development = isset($_GET[\'development\']) ? trim($_GET[\'development\']) : \'\';\r\n    $language = isset($_GET[\'lang\']) ? trim($_GET[\'lang\']) : \'en\';\r\n    $exchange_rate = 1;\r\n\r\n    if($language == \'es\') {\r\n        $xml = simplexml_load_file(\"http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml\")->Cube[0]->Cube[0];\r\n        $usd = 0;\r\n        $mxn = 0;\r\n        foreach ($xml->Cube as $item) {\r\n            if((string)$item[\'currency\'] === \'USD\')\r\n                $usd = (real)$item[\'rate\'];\r\n                \r\n            if((string)$item[\'currency\'] === \'MXN\')\r\n                $mxn = (real)$item[\'rate\'];\r\n        }\r\n\r\n        $exchange_rate = $mxn/$usd;\r\n    }\r\n\r\n    //*** English ***\r\n    $lang[\'en\'][\'mls_number\'] = \'MLS number\';\r\n    $lang[\'en\'][\'city\'] = \'City\';\r\n    $lang[\'en\'][\'property_type\'] = \'Property type\';\r\n    $lang[\'en\'][\'price\'] = \'Price\';\r\n    $lang[\'en\'][\'any\'] = \'Any\';\r\n    $lang[\'en\'][\'submit\'] = \'Submit\';\r\n    $lang[\'en\'][\'cabo_corridor\'] = \'Cabo Corridor\';\r\n    $lang[\'en\'][\'san_jose_corridor\'] = \'San Jose Corridor\';\r\n    $lang[\'en\'][\'east_cape\'] = \'East Cape\';\r\n    $lang[\'en\'][\'pacific_side\'] = \'Pacific Side\';\r\n    $lang[\'en\'][\'condos\'] = \'Condos\';\r\n    $lang[\'en\'][\'houses\'] = \'Houses\';\r\n    $lang[\'en\'][\'townhouses\'] = \'Townhouses\';\r\n    $lang[\'en\'][\'land\'] = \'Land\';\r\n    $lang[\'en\'][\'commercial\'] = \'Commercial\';\r\n    $lang[\'en\'][\'business\'] = \'Business\';\r\n    $lang[\'en\'][\'fractional\'] = \'Fractional\';\r\n    $lang[\'en\'][\'multifamily\'] = \'MultiFamily\';\r\n    $lang[\'en\'][\'under\'] = \'Under\';\r\n    $lang[\'en\'][\'over\'] = \'Over\';\r\n    $lang[\'en\'][\'results\'] = \'Results\';\r\n    $lang[\'en\'][\'email_the_agent\'] = \'Email The Agent\';\r\n    $lang[\'en\'][\'login\'] = \'Login\';\r\n    $lang[\'en\'][\'property_consultation\'] = \'Property Consultation\';\r\n    $lang[\'en\'][\'details\'] = \'Details\';\r\n    $lang[\'en\'][\'photos\'] = \'Photos\';\r\n    $lang[\'en\'][\'map\'] = \'Map\';\r\n    $lang[\'en\'][\'yes\'] = \'Yes\';\r\n    $lang[\'en\'][\'no\'] = \'No\';\r\n    $lang[\'en\'][\'developments\'] = \'Developments\';\r\n    //*** Spanish ***\r\n    $lang[\'es\'][\'mls_number\'] = \'N&uacute;mero MLS\';\r\n    $lang[\'es\'][\'city\'] = \'Ciudad\';\r\n    $lang[\'es\'][\'property_type\'] = \'Tipo de propiedad\';\r\n    $lang[\'es\'][\'price\'] = \'Precio\';\r\n    $lang[\'es\'][\'any\'] = \'Cualquiera\';\r\n    $lang[\'es\'][\'submit\'] = \'Enviar\';\r\n    $lang[\'es\'][\'cabo_corridor\'] = \'Corredor - San Lucas\';\r\n    $lang[\'es\'][\'san_jose_corridor\'] = \'Corredor - San Jose\';\r\n    $lang[\'es\'][\'east_cape\'] = \'Cabo del Este\';\r\n    $lang[\'es\'][\'pacific_side\'] = \'Pac&iacute;fico\';\r\n    $lang[\'es\'][\'condos\'] = \'Condominios\';\r\n    $lang[\'es\'][\'houses\'] = \'Casas\';\r\n    $lang[\'es\'][\'townhouses\'] = \'Residencias\';\r\n    $lang[\'es\'][\'land\'] = \'Terrenos\';\r\n    $lang[\'es\'][\'commercial\'] = \'Comercial\';\r\n    $lang[\'es\'][\'business\'] = \'Negocio\';\r\n    $lang[\'es\'][\'fractional\'] = \'Fraccionamiento\';\r\n    $lang[\'es\'][\'multifamily\'] = \'Multi-Familiar\';\r\n    $lang[\'es\'][\'under\'] = \'Menos de\';\r\n    $lang[\'es\'][\'over\'] = \'Mas de\';\r\n    $lang[\'es\'][\'results\'] = \'Resultados\';\r\n    $lang[\'es\'][\'email_the_agent\'] = \'Enviar Email al Agente\';\r\n    $lang[\'es\'][\'login\'] = \'Acceder\';\r\n    $lang[\'es\'][\'property_consultation\'] = \'Consulta de Propiedad\';\r\n    $lang[\'es\'][\'details\'] = \'Detalles\';\r\n    $lang[\'es\'][\'photos\'] = \'Fotos\';\r\n    $lang[\'es\'][\'map\'] = \'Mapa\';\r\n    $lang[\'es\'][\'yes\'] = \'Si\';\r\n    $lang[\'es\'][\'no\'] = \'No\';\r\n    $lang[\'es\'][\'developments\'] = \'Desarrollos\';\r\n\r\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/flexmlsAPI.php\");\r\n    $api = new flexmlsAPI(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\");\r\n    $api->SetApplicationName(\"Diamante-MLS-Search/1.0\");\r\n    $api->SetDeveloperMode(false);\r\n    $auth = $api->Authenticate();\r\n    if ($auth === false) api_error_thrown($api);\r\n\r\n    $parameters = null;\r\n    $listings = null;\r\n    $mls_number = $_GET[\'mls_number\'];\r\n    $city = urldecode($_GET[\'city\']);\r\n    $property_type = $_GET[\'property_type\'];\r\n    $list_price = $_GET[\'list_price\'];\r\n    $page = isset($_GET[\'page\']) ? trim($_GET[\'page\']) : 1;\r\n    $featured = isset($_GET[\'featured\']) ? $_GET[\'featured\'] : 0;\r\n    $development = isset($_GET[\'development\']) ? $_GET[\'development\'] : \'\';\r\n\r\n    if($mls_number != \'\') {\r\n        $parameters = array(\"_filter\" => \"ListingId Eq \'$mls_number\'\", \"_expand\" => \'PrimaryPhoto\', \"_limit\" => \"1\", \"_pagination\" => true);\r\n        $listings = $api->GetListings($parameters);\r\n    }\r\n    else {\r\n        $filter = \'\';\r\n        $p_type = ($property_type != \"\") ? \"PropertyType Eq \'$property_type\'\": \"Not PropertyType Eq \'H\'\";\r\n        $filter .= ($filter != \'\') ? \" And $p_type\" : \"$p_type\" ;\r\n        $filter .= ($city != \'\') ? (($filter != \'\') ? \" And $city\" : \"$city\" ) : \'\';\r\n        $filter .= ($list_price != \'\') ? (($filter != \'\') ? \" And ListPrice $list_price\" : \"ListPrice $list_price\" ) : \'\';\r\n        if ($development == \'Terrazas\' || $development == \'Torres Cantera\' || $development == \'Vista Coral\' || $development == \'Paseo del Malecon\' || $development == \'Puerto Ilusion\' || $development == \'Querencia\' || $development == \'Palmilla\') {\r\n            $filter .= ($filter != \'\') ? \" And StreetAdditionalInfo Eq \'$development*\'\" : \"StreetAdditionalInfo Eq \'$development*\'\";\r\n        }\r\n        else {\r\n            $filter .= ($development != \'\') ? (($filter != \'\') ? \" And SubdivisionName Eq \'$development\'\" : \"SubdivisionName Eq \'$development\'\" ) : \'\';\r\n        }\r\n        $filter = stripslashes($filter);\r\n\r\n        if($featured == 1) {\r\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 25, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\r\n            $listings = $api->GetMyListings($parameters);\r\n        }\r\n        else {\r\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 25, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\r\n            $listings = $api->GetListings($parameters);\r\n        }\r\n    }\r\n    $listings[count($listings)] = array(\"LastCount\" => $api->last_count, \"PageSize\" => $api->page_size, \"TotalPages\" => $api->total_pages, \"CurrentPage\" => $api->current_page);\r\n    echo json_encode($listings);\r\n?>\r\n\r\n<div class=\"container-fluid content\" style=\"margin-top:100px;\">\r\n    <input id=\"submit\" type=\"button\" value=\"<?php echo $lang[$language][\'submit\']; ?>\" />\r\n    <div class=\"results\">\r\n        <div id=\"listings\"></div>\r\n    </div>\r\n</div>\r\n\r\n{layout:set name=\"scripts\"}\r\n    <script src=\"{theme_folder_url}site/default/asset/js/mls.js\" ></script>\r\n    <script>\r\n        var portal = <?php echo $portal; ?>;\r\n        var language = \'<?php echo $language; ?>\';\r\n        var exchange_rate = <?php echo $exchange_rate; ?>;\r\n        var selectedListing = \'\';\r\n        \r\n        function autoLoad(){\r\n            $(\'#mls_number\').val(\'<?php echo $mls_number; ?>\');\r\n            $(\'#city\').val(\'<?php echo $city; ?>\');\r\n            $(\'#property_type\').val(\'<?php echo $property_type; ?>\');\r\n            $(\'#list_price\').val(\'<?php echo $list_price; ?>\');\r\n            $(\'#development\').val(\'<?php echo $development; ?>\');\r\n            $(\'#submit\').click();\r\n        }\r\n        \r\n        $(function(){\r\n            $(\'#property_type\').change(function(){\r\n                if ($(this).val() != \'E\') {\r\n                    $(\"#list_price option[value=\'Le 200000.0\']\").remove();\r\n                } else if ($(\"#list_price option[value=\'Le 200000.0\']\").length == 0) {\r\n                    $(\'#list_price option:first\').after(\'<option value=\"Le 200000.0\"><?php echo $lang[$language][\'under\']; ?> 200,000 USD</option>\');\r\n                }\r\n            });\r\n        });\r\n    </script>\r\n{/layout:set}', NULL, 1516418005, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(27, 1, 10, 'detail', 'webpage', '{layout=\'layouts/_main-layout\'}\r\n\r\n<?php\r\n    error_reporting( E_ALL ); //debug\r\n    //require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/Core.php\");\r\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/flexmlsAPI.php\");\r\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/lang/lang.php\");\r\n    $language = isset($_GET[\'lang\']) ? trim($_GET[\'lang\']) : \'en\';\r\n    $protocol = strtolower(substr($_SERVER[\"SERVER_PROTOCOL\"],0,5))==\'https://\'?\'https://\':\'http://\';\r\n    $hostName = $_SERVER[\'HTTP_HOST\'];\r\n    $base_url = $protocol.$hostName;\r\n    $search_results = \"\";\r\n    //var_dump($_SERVER);\r\n    if (isset($_SERVER[\'HTTP_REFERER\']) && strpos($_SERVER[\'HTTP_REFERER\'], $base_url.\'/listing\') > -1 ) { $search_results =  $_SERVER[\'HTTP_REFERER\']; }\r\n    //$api = new SparkAPI_APIAuth(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\"); //Core.php\r\n    $api = new flexmlsAPI(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\"); //flexmlsAPI.php\r\n    $api->SetApplicationName(\"Diamante-MLS-Search/1.0\");\r\n    $api->SetDeveloperMode(false);\r\n    $auth = $api->Authenticate();\r\n    if ($auth === false) api_error_thrown($api);\r\n\r\n    $id = \"{segment_3}\";\r\n    //echo $id;\r\n    $parameters = array(\"_expand\" => \'CustomFields,Photos\');\r\n    $listing = $api->GetListings(array(\"_filter\" => \"ListingId Eq \'\" . $id . \"\'\" , \"_expand\" => \'CustomFields,Photos\', \"_limit\" => \"1\", \"_pagination\" => true));\r\n    //$listing = $api->GetListing($id,$parameters);\r\n\r\n    //var_dump($listing);\r\n    if ($listing != null){\r\n        $standard = $listing[0][\'StandardFields\'];\r\n        $custom = $listing[0][\'CustomFields\'][0];\r\n\r\n        $main_photo = \'\';\r\n        $main_photo_name = \'\';\r\n        $photos = $standard[\'Photos\'];\r\n\r\n        foreach ($photos as $item) {\r\n            if ($item[\'Primary\'] == 1) {\r\n                $main_photo = $item[\'Uri1600\'];\r\n                $main_photo_name = $item[\'Name\'];\r\n            }\r\n        }\r\n\r\n        $general_desc = null;\r\n\r\n        $main = null;\r\n        $details = null;\r\n\r\n        $stai = $standard[\"StreetAdditionalInfo\"];\r\n        $stnu = $standard[\"StreetNumber\"];\r\n        $stna = $standard[\"StreetName\"];\r\n        //echo $stai . $stnu . $stna;\r\n        $street = $stai != \'********\' ? $stai . \' \' : \'\';\r\n        $street .= $stnu != \'********\' ? $stnu . \' \' : \'\';\r\n        $street .= $stna != \'********\' ? $stna . \' \' : \'\';\r\n\r\n        $exchange_rate = 1;\r\n\r\n        if($language == \'es\') {\r\n            $xml = simplexml_load_file(\"http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml\")->Cube[0]->Cube[0];\r\n            $usd = 0;\r\n            $mxn = 0;\r\n            foreach ($xml->Cube as $item) {\r\n                if((string)$item[\'currency\'] === \'USD\')\r\n                    $usd = (real)$item[\'rate\'];\r\n                    \r\n                if((string)$item[\'currency\'] === \'MXN\')\r\n                    $mxn = (real)$item[\'rate\'];\r\n            }\r\n    \r\n            $exchange_rate = $mxn/$usd;\r\n        }\r\n\r\n        if($language == \'es\'){\r\n            $price = \"$\" . number_format($standard[\"ListPrice\"] * $exchange_rate,2) . \" MXN\";\r\n        }\r\n        else{\r\n            $price = \"$\" . number_format($standard[\"ListPrice\"],2) . \" USD\";\r\n        }\r\n\r\n        $description = \'\';\r\n\r\n        if($language == \'es\'){\r\n            error_reporting(0);\r\n            $json = file_get_contents(\'https://www.googleapis.com/language/translate/v2?key=AIzaSyA2XBI0Wlol8wIHwZ28nGvtpk01VBgdDAQ&q=\' . urlencode($standard[\'PublicRemarks\']) . \'&source=en&target=es\');\r\n            $json = json_decode($json, true);\r\n            $translations = $json[\'data\'][\'translations\'];\r\n            \r\n            foreach($translations as $translation) {\r\n                $description .= \"{$translation[\'translatedText\']}\";\r\n            }\r\n            \r\n            if(trim($description) == \'\')\r\n                $description = preg_replace(\'/[^a-zA-Z0-9\\s\\.,()-]/\',\'\', $standard[\'PublicRemarks\']);\r\n\r\n            echo \'<em style=\"font-size:10px;\">&bull; Los precios en pesos son calculados en base al tipo de cambio al momento de la consulta; el precio puede variar.<br />&bull; La información mostrada se tradujo de forma automatizada por lo tanto puede ser imprecisa.</em><br /><br />\';\r\n        }\r\n        else{\r\n            $description = preg_replace(\'/[^a-zA-Z0-9\\s\\.,()-]/\',\'\', $standard[\'PublicRemarks\']);\r\n        }\r\n\r\n        $map_lat = (str_replace(\"*\", \"\", number_format($standard[\'Latitude\'],6,\'.\',\'\')) == \"\") ? 24.161754 : $standard[\'Latitude\'];\r\n        $map_lon = (str_replace(\"*\", \"\", number_format($standard[\'Longitude\'],6,\'.\',\'\')) == \"\") ? -110.318013 : $standard[\'Longitude\'];\r\n\r\n    } //if listing != null\r\n?>\r\n\r\n{layout:set name=\"styles\"}\r\n    <style>\r\n        .hero{\r\n            height:400px;\r\n            width:100%;\r\n            background: url(\'<?=$main_photo?>\');\r\n            background-position: center;\r\n            background-size: cover;\r\n        }\r\n\r\n        #map_container {\r\n            width:100%;\r\n            height:500px;\r\n        }\r\n    </style>\r\n{/layout:set}\r\n\r\n\r\n<?php if($listing == null) { ?>\r\n    <main>\r\n        <div class=\"container\">\r\n            <h4 class=\"center\">Sorry, property not found</h4>\r\n\r\n            <p class=\"center\">\r\n                <?php if ($search_results != \"\") {?>\r\n                    <a href=\"<?=$search_results?>\" class=\"waves-effect waves-light btn\"><i class=\"material-icons left\">chevron_left</i> Back to search results  </a>\r\n                <?php } else { ?>\r\n                    <a href=\"/listing\" class=\"waves-effect waves-light btn\"><i class=\"material-icons left\">chevron_left</i> Back to listing </a>\r\n                <?php } ?>\r\n            </p>\r\n        </div>\r\n    </main>\r\n\r\n<?php } else { ?> \r\n\r\n    <div class=\"hero\">\r\n\r\n    </div>\r\n\r\n    <main>\r\n\r\n        <div class=\"container\">\r\n            <div class=\"row\">\r\n                <div class=\"col s12 m10\">\r\n\r\n                    <div id=\"description\" class=\"section scrollspy\">\r\n                        <h4><?= $id ?> / <?= $street ?></h4>\r\n                        <h5><?= $price ?></h5>  \r\n\r\n                        <p class=\"flow-text\"><?= $description ?> </p>\r\n                    </div>\r\n\r\n                    <div id=\"features\" class=\"section scrollspy\">\r\n                        <h5>Features</h5>\r\n                    </div>\r\n\r\n                    <div id=\"gallery\" class=\"section scrollspy\">\r\n                        <h5>Gallery</h5>\r\n\r\n                        <div class=\"carousel carousel-slider\">\r\n                            \r\n                                <?php foreach ($standard[\'Photos\'] as $photo) { ?>\r\n                                    <a class=\"carousel-item\" href=\"#<?=$photo[\'Id\']?>\">\r\n                                        <img src=\"<?=$photo[\'Uri800\']?>\">\r\n                                    </a>\r\n                                <?php } ?>\r\n                            \r\n                        </div>\r\n                    </div>\r\n\r\n                    <div id=\"map\" class=\"section scrollspy\">\r\n                        <h5>Map</h5>\r\n                        <div id=\"map_container\"></div>\r\n                    </div>\r\n\r\n                    \r\n                </div>\r\n                <div class=\"col hide-on-small-only m2\">\r\n                    <div class=\"pushpin\">            \r\n                        <h6>\r\n                            <?php if ($search_results != \"\") {?>\r\n                                <a href=\"<?=$search_results?>\"><i class=\"material-icons left\">chevron_left</i> Back to search results  </a>\r\n                            <?php } else { ?>\r\n                                <a href=\"/listing\"><i class=\"material-icons left\">chevron_left</i> Back to listing </a>\r\n                            <?php } ?>\r\n                        </h6>\r\n                        <ul class=\"section table-of-contents\">\r\n                            <li><a href=\"#description\">Description</a></li>\r\n                            <li><a href=\"#features\">Features</a></li>\r\n                            <li><a href=\"#gallery\">Gallery</a></li>\r\n                            <li><a href=\"#map\">Map</a></li>\r\n                        </ul>\r\n                    </div>\r\n                    <?php //var_dump($listing) ?>\r\n                </div>\r\n            </div>\r\n        </div>\r\n\r\n    </main>\r\n<?php } ?>\r\n\r\n\r\n{layout:set name=\"scripts\"}\r\n    <script src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyAnEhkVDYEAhWmyleuk7rvrVD6XcJ72q5A&callback=loadMap\" async defer></script>\r\n    <script>\r\n        function loadMap(){\r\n            var latlng = new google.maps.LatLng(<?php echo $map_lat . \',\' . $map_lon; ?>);\r\n            var opt = {\r\n                zoom: 15,\r\n                center: latlng,\r\n                mapTypeId: google.maps.MapTypeId.HYBRID\r\n            }\r\n            var map = new google.maps.Map(document.getElementById(\"map_container\"), opt);\r\n\r\n            var info = \'<p class=\"map_info\"><div class=\"thumb\"><img src=\"<?php echo $photos[0][\'UriThumb\']; ?>\" /></div>\'+\r\n                \'<b> <?php echo $price; ?></b><br />\'+\r\n                \'<?php echo $street; ?><br /><?php echo $standard[\'City\']; ?><br />\'+\r\n                \'<i class=\"\"><?php echo $standard[\'ListingId\']; ?></i></p>\';\r\n\r\n            var infowindow = new google.maps.InfoWindow({\r\n                content: info\r\n            });\r\n\r\n            var marker = new google.maps.Marker({\r\n                position: latlng,\r\n                animation: google.maps.Animation.DROP,\r\n                map: map,\r\n                title:\"<?php echo $street; ?>\"\r\n            });\r\n            \r\n            infowindow.open(map,marker);\r\n            \r\n            google.maps.event.addListener(marker, \'click\', function() {\r\n                infowindow.open(map,marker);\r\n            });\r\n        }\r\n\r\n        $( document ).ready(function(){\r\n            //$(\'.slider\').slider();\r\n            $(\'.carousel.carousel-slider\').carousel({\r\n                fullWidth: true,\r\n                indicators: true\r\n            });\r\n            $(\'.scrollspy\').scrollSpy();\r\n            $(\'.pushpin\').pushpin();\r\n            /*$(\'#fullscreen-btn\').click(function(){\r\n                var elem = document.querySelector(\'.slider\');\r\n                var instance = M.Slider.getInstance(elem);\r\n                instance.destroy(); \r\n                //$(\'.slider\').slider(\'destroy\');\r\n                $(\'.slider\').addClass(\'fullscreen\');\r\n                $(\'.slider\').slider();\r\n            });*/\r\n        });\r\n        \r\n    </script>\r\n{/layout:set}', NULL, 1522968217, 1, 'n', 0, '24', 'n', 'y', 'o', 0, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_groups`
--

DROP TABLE IF EXISTS `exp_template_groups`;
CREATE TABLE `exp_template_groups` (
  `group_id` int(6) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
  `group_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_order` int(3) UNSIGNED NOT NULL,
  `is_site_default` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_template_groups`
--

INSERT INTO `exp_template_groups` (`group_id`, `site_id`, `group_name`, `group_order`, `is_site_default`) VALUES
(8, 1, 'main', 1, 'y'),
(9, 1, 'layouts', 2, 'n'),
(10, 1, 'listing', 3, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_member_groups`
--

DROP TABLE IF EXISTS `exp_template_member_groups`;
CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) UNSIGNED NOT NULL,
  `template_group_id` mediumint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_no_access`
--

DROP TABLE IF EXISTS `exp_template_no_access`;
CREATE TABLE `exp_template_no_access` (
  `template_id` int(6) UNSIGNED NOT NULL,
  `member_group` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_routes`
--

DROP TABLE IF EXISTS `exp_template_routes`;
CREATE TABLE `exp_template_routes` (
  `route_id` int(10) UNSIGNED NOT NULL,
  `template_id` int(10) UNSIGNED NOT NULL,
  `order` int(10) UNSIGNED DEFAULT NULL,
  `route` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_parsed` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `route_required` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_throttle`
--

DROP TABLE IF EXISTS `exp_throttle`;
CREATE TABLE `exp_throttle` (
  `throttle_id` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `hits` int(10) UNSIGNED NOT NULL,
  `locked_out` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_update_log`
--

DROP TABLE IF EXISTS `exp_update_log`;
CREATE TABLE `exp_update_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `timestamp` int(10) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `method` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line` int(10) UNSIGNED DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_update_log`
--

INSERT INTO `exp_update_log` (`log_id`, `timestamp`, `message`, `method`, `line`, `file`) VALUES
(1, 1515540988, 'Smartforge::add_key failed. Table \'exp_comments\' does not exist.', 'Smartforge::add_key', 105, '/var/www/bajamls/system/ee/EllisLab/Addons/comment/upd.comment.php');

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_no_access`
--

DROP TABLE IF EXISTS `exp_upload_no_access`;
CREATE TABLE `exp_upload_no_access` (
  `upload_id` int(6) UNSIGNED NOT NULL,
  `member_group` smallint(4) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_upload_prefs`
--

DROP TABLE IF EXISTS `exp_upload_prefs`;
CREATE TABLE `exp_upload_prefs` (
  `id` int(4) UNSIGNED NOT NULL,
  `site_id` int(4) UNSIGNED NOT NULL DEFAULT '1',
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
  `module_id` int(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_upload_prefs`
--

INSERT INTO `exp_upload_prefs` (`id`, `site_id`, `name`, `server_path`, `url`, `allowed_types`, `default_modal_view`, `max_size`, `max_height`, `max_width`, `properties`, `pre_format`, `post_format`, `file_properties`, `file_pre_format`, `file_post_format`, `cat_group`, `batch_location`, `module_id`) VALUES
(1, 1, 'Avatars', '{base_path}images/avatars/', '{base_url}images/avatars/', 'img', 'list', '50', '100', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(2, 1, 'Default Avatars', '{base_path}images/avatars/default/', '{base_url}images/avatars/default/', 'img', 'list', '50', '100', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(3, 1, 'Member Photos', '{base_path}images/member_photos/', '{base_url}images/member_photos/', 'img', 'list', '50', '100', '100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(4, 1, 'Signature Attachments', '{base_path}images/signature_attachments/', '{base_url}images/signature_attachments/', 'img', 'list', '30', '80', '480', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(5, 1, 'PM Attachments', '{base_path}images/pm_attachments/', '{base_url}images/pm_attachments/', 'img', 'list', '250', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
(6, 1, 'Blog', '{base_path}themes/ee/site/default/asset/img/blog/', '{base_url}themes/ee/site/default/asset/img/blog/', 'img', 'list', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(7, 1, 'Common', '{base_path}themes/ee/site/default/asset/img/common/', '{base_url}themes/ee/site/default/asset/img/common/', 'img', 'list', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(8, 1, 'Home', '{base_path}themes/ee/site/default/asset/img/home/', '{base_url}themes/ee/site/default/asset/img/home/', 'img', 'list', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exp_actions`
--
ALTER TABLE `exp_actions`
  ADD PRIMARY KEY (`action_id`);

--
-- Indexes for table `exp_captcha`
--
ALTER TABLE `exp_captcha`
  ADD PRIMARY KEY (`captcha_id`),
  ADD KEY `word` (`word`);

--
-- Indexes for table `exp_categories`
--
ALTER TABLE `exp_categories`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `cat_name` (`cat_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_category_fields`
--
ALTER TABLE `exp_category_fields`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `exp_category_field_data`
--
ALTER TABLE `exp_category_field_data`
  ADD PRIMARY KEY (`cat_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `exp_category_groups`
--
ALTER TABLE `exp_category_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_category_posts`
--
ALTER TABLE `exp_category_posts`
  ADD PRIMARY KEY (`entry_id`,`cat_id`);

--
-- Indexes for table `exp_channels`
--
ALTER TABLE `exp_channels`
  ADD PRIMARY KEY (`channel_id`),
  ADD KEY `cat_group` (`cat_group`(191)),
  ADD KEY `channel_name` (`channel_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_channels_channel_fields`
--
ALTER TABLE `exp_channels_channel_fields`
  ADD PRIMARY KEY (`channel_id`,`field_id`);

--
-- Indexes for table `exp_channels_channel_field_groups`
--
ALTER TABLE `exp_channels_channel_field_groups`
  ADD PRIMARY KEY (`channel_id`,`group_id`);

--
-- Indexes for table `exp_channels_statuses`
--
ALTER TABLE `exp_channels_statuses`
  ADD PRIMARY KEY (`channel_id`,`status_id`);

--
-- Indexes for table `exp_channel_data`
--
ALTER TABLE `exp_channel_data`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_channel_data_field_1`
--
ALTER TABLE `exp_channel_data_field_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_2`
--
ALTER TABLE `exp_channel_data_field_2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_3`
--
ALTER TABLE `exp_channel_data_field_3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_4`
--
ALTER TABLE `exp_channel_data_field_4`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_5`
--
ALTER TABLE `exp_channel_data_field_5`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_6`
--
ALTER TABLE `exp_channel_data_field_6`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_7`
--
ALTER TABLE `exp_channel_data_field_7`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_8`
--
ALTER TABLE `exp_channel_data_field_8`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_9`
--
ALTER TABLE `exp_channel_data_field_9`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_10`
--
ALTER TABLE `exp_channel_data_field_10`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_11`
--
ALTER TABLE `exp_channel_data_field_11`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_entries_autosave`
--
ALTER TABLE `exp_channel_entries_autosave`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `url_title` (`url_title`(191)),
  ADD KEY `status` (`status`),
  ADD KEY `entry_date` (`entry_date`),
  ADD KEY `expiration_date` (`expiration_date`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_channel_fields`
--
ALTER TABLE `exp_channel_fields`
  ADD PRIMARY KEY (`field_id`),
  ADD KEY `field_type` (`field_type`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_channel_field_groups_fields`
--
ALTER TABLE `exp_channel_field_groups_fields`
  ADD PRIMARY KEY (`field_id`,`group_id`);

--
-- Indexes for table `exp_channel_form_settings`
--
ALTER TABLE `exp_channel_form_settings`
  ADD PRIMARY KEY (`channel_form_settings_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `exp_channel_grid_field_1`
--
ALTER TABLE `exp_channel_grid_field_1`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_grid_field_2`
--
ALTER TABLE `exp_channel_grid_field_2`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_grid_field_4`
--
ALTER TABLE `exp_channel_grid_field_4`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_grid_field_5`
--
ALTER TABLE `exp_channel_grid_field_5`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_grid_field_7`
--
ALTER TABLE `exp_channel_grid_field_7`
  ADD PRIMARY KEY (`row_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_member_groups`
--
ALTER TABLE `exp_channel_member_groups`
  ADD PRIMARY KEY (`group_id`,`channel_id`);

--
-- Indexes for table `exp_channel_titles`
--
ALTER TABLE `exp_channel_titles`
  ADD PRIMARY KEY (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `url_title` (`url_title`(191)),
  ADD KEY `status` (`status`),
  ADD KEY `entry_date` (`entry_date`),
  ADD KEY `expiration_date` (`expiration_date`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `sticky_date_id_idx` (`sticky`,`entry_date`,`entry_id`);

--
-- Indexes for table `exp_comments`
--
ALTER TABLE `exp_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `entry_id` (`entry_id`),
  ADD KEY `channel_id` (`channel_id`),
  ADD KEY `author_id` (`author_id`),
  ADD KEY `status` (`status`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_comment_subscriptions`
--
ALTER TABLE `exp_comment_subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `entry_id` (`entry_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `exp_content_types`
--
ALTER TABLE `exp_content_types`
  ADD PRIMARY KEY (`content_type_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `exp_cp_log`
--
ALTER TABLE `exp_cp_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_developer_log`
--
ALTER TABLE `exp_developer_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `exp_email_cache`
--
ALTER TABLE `exp_email_cache`
  ADD PRIMARY KEY (`cache_id`);

--
-- Indexes for table `exp_email_cache_mg`
--
ALTER TABLE `exp_email_cache_mg`
  ADD PRIMARY KEY (`cache_id`,`group_id`);

--
-- Indexes for table `exp_email_cache_ml`
--
ALTER TABLE `exp_email_cache_ml`
  ADD PRIMARY KEY (`cache_id`,`list_id`);

--
-- Indexes for table `exp_email_console_cache`
--
ALTER TABLE `exp_email_console_cache`
  ADD PRIMARY KEY (`cache_id`);

--
-- Indexes for table `exp_entry_versioning`
--
ALTER TABLE `exp_entry_versioning`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_extensions`
--
ALTER TABLE `exp_extensions`
  ADD PRIMARY KEY (`extension_id`);

--
-- Indexes for table `exp_fieldtypes`
--
ALTER TABLE `exp_fieldtypes`
  ADD PRIMARY KEY (`fieldtype_id`);

--
-- Indexes for table `exp_field_groups`
--
ALTER TABLE `exp_field_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_files`
--
ALTER TABLE `exp_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `upload_location_id` (`upload_location_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_file_categories`
--
ALTER TABLE `exp_file_categories`
  ADD PRIMARY KEY (`file_id`,`cat_id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Indexes for table `exp_file_dimensions`
--
ALTER TABLE `exp_file_dimensions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `upload_location_id` (`upload_location_id`);

--
-- Indexes for table `exp_file_watermarks`
--
ALTER TABLE `exp_file_watermarks`
  ADD PRIMARY KEY (`wm_id`);

--
-- Indexes for table `exp_fluid_field_data`
--
ALTER TABLE `exp_fluid_field_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fluid_field_id_entry_id` (`fluid_field_id`,`entry_id`);

--
-- Indexes for table `exp_global_variables`
--
ALTER TABLE `exp_global_variables`
  ADD PRIMARY KEY (`variable_id`),
  ADD KEY `variable_name` (`variable_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_grid_columns`
--
ALTER TABLE `exp_grid_columns`
  ADD PRIMARY KEY (`col_id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indexes for table `exp_html_buttons`
--
ALTER TABLE `exp_html_buttons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_layout_publish`
--
ALTER TABLE `exp_layout_publish`
  ADD PRIMARY KEY (`layout_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `channel_id` (`channel_id`);

--
-- Indexes for table `exp_layout_publish_member_groups`
--
ALTER TABLE `exp_layout_publish_member_groups`
  ADD PRIMARY KEY (`layout_id`,`group_id`);

--
-- Indexes for table `exp_members`
--
ALTER TABLE `exp_members`
  ADD PRIMARY KEY (`member_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `unique_id` (`unique_id`),
  ADD KEY `password` (`password`);

--
-- Indexes for table `exp_member_bulletin_board`
--
ALTER TABLE `exp_member_bulletin_board`
  ADD PRIMARY KEY (`bulletin_id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `hash` (`hash`);

--
-- Indexes for table `exp_member_data`
--
ALTER TABLE `exp_member_data`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `exp_member_fields`
--
ALTER TABLE `exp_member_fields`
  ADD PRIMARY KEY (`m_field_id`);

--
-- Indexes for table `exp_member_groups`
--
ALTER TABLE `exp_member_groups`
  ADD PRIMARY KEY (`group_id`,`site_id`);

--
-- Indexes for table `exp_member_news_views`
--
ALTER TABLE `exp_member_news_views`
  ADD PRIMARY KEY (`news_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `exp_member_search`
--
ALTER TABLE `exp_member_search`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_menu_items`
--
ALTER TABLE `exp_menu_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `set_id` (`set_id`);

--
-- Indexes for table `exp_menu_sets`
--
ALTER TABLE `exp_menu_sets`
  ADD PRIMARY KEY (`set_id`);

--
-- Indexes for table `exp_message_attachments`
--
ALTER TABLE `exp_message_attachments`
  ADD PRIMARY KEY (`attachment_id`);

--
-- Indexes for table `exp_message_copies`
--
ALTER TABLE `exp_message_copies`
  ADD PRIMARY KEY (`copy_id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `exp_message_data`
--
ALTER TABLE `exp_message_data`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `sender_id` (`sender_id`);

--
-- Indexes for table `exp_message_folders`
--
ALTER TABLE `exp_message_folders`
  ADD PRIMARY KEY (`member_id`);

--
-- Indexes for table `exp_message_listed`
--
ALTER TABLE `exp_message_listed`
  ADD PRIMARY KEY (`listed_id`);

--
-- Indexes for table `exp_modules`
--
ALTER TABLE `exp_modules`
  ADD PRIMARY KEY (`module_id`);

--
-- Indexes for table `exp_module_member_groups`
--
ALTER TABLE `exp_module_member_groups`
  ADD PRIMARY KEY (`group_id`,`module_id`);

--
-- Indexes for table `exp_online_users`
--
ALTER TABLE `exp_online_users`
  ADD PRIMARY KEY (`online_id`),
  ADD KEY `date` (`date`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_password_lockout`
--
ALTER TABLE `exp_password_lockout`
  ADD PRIMARY KEY (`lockout_id`),
  ADD KEY `login_date` (`login_date`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `user_agent` (`user_agent`);

--
-- Indexes for table `exp_plugins`
--
ALTER TABLE `exp_plugins`
  ADD PRIMARY KEY (`plugin_id`);

--
-- Indexes for table `exp_relationships`
--
ALTER TABLE `exp_relationships`
  ADD PRIMARY KEY (`relationship_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `child_id` (`child_id`),
  ADD KEY `field_id` (`field_id`),
  ADD KEY `fluid_field_data_id` (`fluid_field_data_id`),
  ADD KEY `grid_row_id` (`grid_row_id`);

--
-- Indexes for table `exp_remember_me`
--
ALTER TABLE `exp_remember_me`
  ADD PRIMARY KEY (`remember_me_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `exp_reset_password`
--
ALTER TABLE `exp_reset_password`
  ADD PRIMARY KEY (`reset_id`);

--
-- Indexes for table `exp_revision_tracker`
--
ALTER TABLE `exp_revision_tracker`
  ADD PRIMARY KEY (`tracker_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `exp_rte_tools`
--
ALTER TABLE `exp_rte_tools`
  ADD PRIMARY KEY (`tool_id`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `exp_rte_toolsets`
--
ALTER TABLE `exp_rte_toolsets`
  ADD PRIMARY KEY (`toolset_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `exp_search`
--
ALTER TABLE `exp_search`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_search_log`
--
ALTER TABLE `exp_search_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_security_hashes`
--
ALTER TABLE `exp_security_hashes`
  ADD PRIMARY KEY (`hash_id`),
  ADD KEY `session_id` (`session_id`);

--
-- Indexes for table `exp_sessions`
--
ALTER TABLE `exp_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `exp_sites`
--
ALTER TABLE `exp_sites`
  ADD PRIMARY KEY (`site_id`),
  ADD KEY `site_name` (`site_name`);

--
-- Indexes for table `exp_snippets`
--
ALTER TABLE `exp_snippets`
  ADD PRIMARY KEY (`snippet_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_specialty_templates`
--
ALTER TABLE `exp_specialty_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `template_name` (`template_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_stats`
--
ALTER TABLE `exp_stats`
  ADD PRIMARY KEY (`stat_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_statuses`
--
ALTER TABLE `exp_statuses`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `exp_status_no_access`
--
ALTER TABLE `exp_status_no_access`
  ADD PRIMARY KEY (`status_id`,`member_group`);

--
-- Indexes for table `exp_templates`
--
ALTER TABLE `exp_templates`
  ADD PRIMARY KEY (`template_id`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `template_name` (`template_name`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_template_groups`
--
ALTER TABLE `exp_template_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `group_name_idx` (`group_name`),
  ADD KEY `group_order_idx` (`group_order`);

--
-- Indexes for table `exp_template_member_groups`
--
ALTER TABLE `exp_template_member_groups`
  ADD PRIMARY KEY (`group_id`,`template_group_id`);

--
-- Indexes for table `exp_template_no_access`
--
ALTER TABLE `exp_template_no_access`
  ADD PRIMARY KEY (`template_id`,`member_group`);

--
-- Indexes for table `exp_template_routes`
--
ALTER TABLE `exp_template_routes`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `exp_throttle`
--
ALTER TABLE `exp_throttle`
  ADD PRIMARY KEY (`throttle_id`),
  ADD KEY `ip_address` (`ip_address`),
  ADD KEY `last_activity` (`last_activity`);

--
-- Indexes for table `exp_update_log`
--
ALTER TABLE `exp_update_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `exp_upload_no_access`
--
ALTER TABLE `exp_upload_no_access`
  ADD PRIMARY KEY (`upload_id`,`member_group`);

--
-- Indexes for table `exp_upload_prefs`
--
ALTER TABLE `exp_upload_prefs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `site_id` (`site_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exp_actions`
--
ALTER TABLE `exp_actions`
  MODIFY `action_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `exp_captcha`
--
ALTER TABLE `exp_captcha`
  MODIFY `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_categories`
--
ALTER TABLE `exp_categories`
  MODIFY `cat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exp_category_fields`
--
ALTER TABLE `exp_category_fields`
  MODIFY `field_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_category_groups`
--
ALTER TABLE `exp_category_groups`
  MODIFY `group_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exp_channels`
--
ALTER TABLE `exp_channels`
  MODIFY `channel_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_1`
--
ALTER TABLE `exp_channel_data_field_1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_2`
--
ALTER TABLE `exp_channel_data_field_2`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_3`
--
ALTER TABLE `exp_channel_data_field_3`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_4`
--
ALTER TABLE `exp_channel_data_field_4`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_5`
--
ALTER TABLE `exp_channel_data_field_5`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_6`
--
ALTER TABLE `exp_channel_data_field_6`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_7`
--
ALTER TABLE `exp_channel_data_field_7`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_8`
--
ALTER TABLE `exp_channel_data_field_8`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_9`
--
ALTER TABLE `exp_channel_data_field_9`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_10`
--
ALTER TABLE `exp_channel_data_field_10`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_11`
--
ALTER TABLE `exp_channel_data_field_11`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `exp_channel_entries_autosave`
--
ALTER TABLE `exp_channel_entries_autosave`
  MODIFY `entry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exp_channel_fields`
--
ALTER TABLE `exp_channel_fields`
  MODIFY `field_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `exp_channel_form_settings`
--
ALTER TABLE `exp_channel_form_settings`
  MODIFY `channel_form_settings_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_channel_grid_field_1`
--
ALTER TABLE `exp_channel_grid_field_1`
  MODIFY `row_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_channel_grid_field_2`
--
ALTER TABLE `exp_channel_grid_field_2`
  MODIFY `row_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exp_channel_grid_field_4`
--
ALTER TABLE `exp_channel_grid_field_4`
  MODIFY `row_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_channel_grid_field_5`
--
ALTER TABLE `exp_channel_grid_field_5`
  MODIFY `row_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exp_channel_grid_field_7`
--
ALTER TABLE `exp_channel_grid_field_7`
  MODIFY `row_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_channel_titles`
--
ALTER TABLE `exp_channel_titles`
  MODIFY `entry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `exp_comments`
--
ALTER TABLE `exp_comments`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `exp_comment_subscriptions`
--
ALTER TABLE `exp_comment_subscriptions`
  MODIFY `subscription_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_content_types`
--
ALTER TABLE `exp_content_types`
  MODIFY `content_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exp_cp_log`
--
ALTER TABLE `exp_cp_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `exp_developer_log`
--
ALTER TABLE `exp_developer_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_email_cache`
--
ALTER TABLE `exp_email_cache`
  MODIFY `cache_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_email_console_cache`
--
ALTER TABLE `exp_email_console_cache`
  MODIFY `cache_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_entry_versioning`
--
ALTER TABLE `exp_entry_versioning`
  MODIFY `version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_extensions`
--
ALTER TABLE `exp_extensions`
  MODIFY `extension_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_fieldtypes`
--
ALTER TABLE `exp_fieldtypes`
  MODIFY `fieldtype_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `exp_field_groups`
--
ALTER TABLE `exp_field_groups`
  MODIFY `group_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exp_files`
--
ALTER TABLE `exp_files`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exp_file_dimensions`
--
ALTER TABLE `exp_file_dimensions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_file_watermarks`
--
ALTER TABLE `exp_file_watermarks`
  MODIFY `wm_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_fluid_field_data`
--
ALTER TABLE `exp_fluid_field_data`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_global_variables`
--
ALTER TABLE `exp_global_variables`
  MODIFY `variable_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exp_grid_columns`
--
ALTER TABLE `exp_grid_columns`
  MODIFY `col_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `exp_html_buttons`
--
ALTER TABLE `exp_html_buttons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exp_layout_publish`
--
ALTER TABLE `exp_layout_publish`
  MODIFY `layout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_members`
--
ALTER TABLE `exp_members`
  MODIFY `member_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_member_bulletin_board`
--
ALTER TABLE `exp_member_bulletin_board`
  MODIFY `bulletin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_member_fields`
--
ALTER TABLE `exp_member_fields`
  MODIFY `m_field_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_member_news_views`
--
ALTER TABLE `exp_member_news_views`
  MODIFY `news_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_menu_items`
--
ALTER TABLE `exp_menu_items`
  MODIFY `item_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_menu_sets`
--
ALTER TABLE `exp_menu_sets`
  MODIFY `set_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_message_attachments`
--
ALTER TABLE `exp_message_attachments`
  MODIFY `attachment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_message_copies`
--
ALTER TABLE `exp_message_copies`
  MODIFY `copy_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_message_data`
--
ALTER TABLE `exp_message_data`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_message_listed`
--
ALTER TABLE `exp_message_listed`
  MODIFY `listed_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_modules`
--
ALTER TABLE `exp_modules`
  MODIFY `module_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `exp_online_users`
--
ALTER TABLE `exp_online_users`
  MODIFY `online_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_password_lockout`
--
ALTER TABLE `exp_password_lockout`
  MODIFY `lockout_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `exp_plugins`
--
ALTER TABLE `exp_plugins`
  MODIFY `plugin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_relationships`
--
ALTER TABLE `exp_relationships`
  MODIFY `relationship_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_reset_password`
--
ALTER TABLE `exp_reset_password`
  MODIFY `reset_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_revision_tracker`
--
ALTER TABLE `exp_revision_tracker`
  MODIFY `tracker_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_rte_tools`
--
ALTER TABLE `exp_rte_tools`
  MODIFY `tool_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `exp_rte_toolsets`
--
ALTER TABLE `exp_rte_toolsets`
  MODIFY `toolset_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_search_log`
--
ALTER TABLE `exp_search_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_security_hashes`
--
ALTER TABLE `exp_security_hashes`
  MODIFY `hash_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `exp_sites`
--
ALTER TABLE `exp_sites`
  MODIFY `site_id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_snippets`
--
ALTER TABLE `exp_snippets`
  MODIFY `snippet_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_specialty_templates`
--
ALTER TABLE `exp_specialty_templates`
  MODIFY `template_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `exp_stats`
--
ALTER TABLE `exp_stats`
  MODIFY `stat_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_statuses`
--
ALTER TABLE `exp_statuses`
  MODIFY `status_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_templates`
--
ALTER TABLE `exp_templates`
  MODIFY `template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `exp_template_groups`
--
ALTER TABLE `exp_template_groups`
  MODIFY `group_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `exp_template_routes`
--
ALTER TABLE `exp_template_routes`
  MODIFY `route_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_throttle`
--
ALTER TABLE `exp_throttle`
  MODIFY `throttle_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_update_log`
--
ALTER TABLE `exp_update_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_upload_prefs`
--
ALTER TABLE `exp_upload_prefs`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
