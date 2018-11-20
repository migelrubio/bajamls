-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 02, 2018 at 12:16 AM
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
(11, 'Search', 'do_search', 1),
(12, 'Member', 'registration_form', 0),
(13, 'Member', 'register_member', 0),
(14, 'Member', 'activate_member', 0),
(15, 'Member', 'member_login', 0),
(16, 'Member', 'member_logout', 0),
(17, 'Member', 'send_reset_token', 0),
(18, 'Member', 'process_reset_password', 0),
(19, 'Member', 'send_member_email', 0),
(20, 'Member', 'update_un_pw', 0),
(21, 'Member', 'member_search', 0),
(22, 'Member', 'member_delete', 0),
(23, 'Consent', 'grantConsent', 0),
(24, 'Consent', 'submitConsent', 0),
(25, 'Consent', 'withdrawConsent', 0),
(26, 'Email', 'send_email', 0),
(27, 'Formgrab', 'submit_form', 0);

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
  `max_entries` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `preview_url` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channels`
--

INSERT INTO `exp_channels` (`channel_id`, `site_id`, `channel_name`, `channel_title`, `channel_url`, `channel_description`, `channel_lang`, `total_entries`, `total_records`, `total_comments`, `last_entry_date`, `last_comment_date`, `cat_group`, `deft_status`, `search_excerpt`, `deft_category`, `deft_comments`, `channel_require_membership`, `channel_max_chars`, `channel_html_formatting`, `extra_publish_controls`, `channel_allow_img_urls`, `channel_auto_link_urls`, `channel_notify`, `channel_notify_emails`, `comment_url`, `comment_system_enabled`, `comment_require_membership`, `comment_moderate`, `comment_max_chars`, `comment_timelock`, `comment_require_email`, `comment_text_formatting`, `comment_html_formatting`, `comment_allow_img_urls`, `comment_auto_link_urls`, `comment_notify`, `comment_notify_authors`, `comment_notify_emails`, `comment_expiration`, `search_results_url`, `rss_url`, `enable_versioning`, `max_revisions`, `default_entry_title`, `title_field_label`, `url_title_prefix`, `max_entries`, `preview_url`) VALUES
(2, 1, 'blog', 'Blog', '{path=\'blog/entry\'}', NULL, 'en', 10, 10, 0, 1539310320, 0, '1', 'open', NULL, NULL, 'y', 'y', NULL, 'all', 'n', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'n', 10, NULL, 'Title', NULL, 0, NULL),
(3, 1, 'contact', 'Contact', '', NULL, 'en', 1, 1, 0, 1515540988, 0, NULL, 'open', NULL, NULL, 'y', 'y', NULL, 'all', 'n', 'y', 'n', 'n', NULL, NULL, 'y', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', NULL, 0, NULL, NULL, 'n', 10, NULL, 'Title', NULL, 0, NULL),
(4, 1, 'communities', 'Communities', '//', '', 'en', 3, 3, 0, 1537322040, 0, '', 'open', NULL, '', 'y', 'y', NULL, 'all', 'n', 'y', 'n', 'n', '', '', 'y', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', 10, '', 'Community Name', '', 0, NULL),
(5, 1, 'agents', 'Agents', 'http://diamanterealtors.com/', '', 'en', 4, 4, 0, 1541131980, 0, '', 'open', NULL, '', 'y', 'y', NULL, 'all', 'n', 'y', 'n', 'n', '', '', 'y', 'n', 'n', 5000, 0, 'y', 'xhtml', 'safe', 'n', 'y', 'n', 'n', '', 0, '', '', 'n', 10, '', 'Title', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channels_channel_fields`
--

DROP TABLE IF EXISTS `exp_channels_channel_fields`;
CREATE TABLE `exp_channels_channel_fields` (
  `channel_id` int(4) UNSIGNED NOT NULL,
  `field_id` int(6) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channels_channel_fields`
--

INSERT INTO `exp_channels_channel_fields` (`channel_id`, `field_id`) VALUES
(4, 12),
(4, 13);

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
(3, 5),
(4, 5),
(5, 6);

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
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2);

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
(12, 1, 3),
(13, 1, 4),
(14, 1, 4),
(15, 1, 4),
(17, 1, 2),
(18, 1, 2),
(19, 1, 5),
(20, 1, 5),
(21, 1, 5),
(22, 1, 5);

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
(1, 1, ' ', 'xhtml'),
(2, 2, ' ', 'xhtml'),
(3, 3, ' ', 'xhtml');

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
(1, 4, ' ', 'xhtml'),
(2, 5, ' ', 'xhtml'),
(3, 6, ' ', 'xhtml'),
(4, 7, ' ', 'xhtml'),
(5, 8, ' ', 'xhtml'),
(6, 9, ' ', 'xhtml'),
(7, 10, ' ', 'xhtml'),
(8, 11, ' ', 'xhtml');

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
(8, 11, 'Lorem ipsum dolor sit amet, <b>this is bold text</b> consectetur <strong>this text is strongly emphasized</strong> adipisicing elit, sed do eiusmod tempor incididunt <i>this is italic text</i> ut labore <em>this text is emphasized</em> et dolore magna aliqua. Ut enim ad minim veniam, <a href=\"\">this is a link</a> quis nostrud <a href=\"\" rel=\"external\">this is an external link</a> laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse <del>This text is deleted</del> <ins>this text is inserted</ins> cillum <code>this is a code sample</code> dolore eu <mark>this text is highlighted</mark> fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 'xhtml'),
(9, 17, '<h4>PROPERTIES IN MEXICO</h4>\n\n <p>Buying property in Mexico, weather it’s a condominium, a home or land can give good value to your money compared to prices in other countries. although prices have risen recently and care must be taken when evaluating a property.</p>\n\n <p>México’s costs can be lesser when talking about land, construction, building, labor, maintenance, taxes and utilities and&nbsp; Although there are some horror stories related to real estate transactions here (as in any other place in the world) the vast majority go through rightfully.&nbsp;</p>\n\n <p>An important thing to consider when acquiring property is the developed state of the surrounding area in the location you are considering, not areas are nicely developed and you can expect cheaper prices, however if you see a road or highway leading to a remote area, you can expect significant growth in the upcoming years.&nbsp;</p>\n\n <p>thousands of foreigners that fell in love with the culture of Mexico and its exquisite landscapes have bought properties in Mexico. with the right advisor, there is no reason that you can’t be one of them.&nbsp;</p>\n\n <h4>PROPERTY OWNERSHIP</h4>\n\n <p>Mexican law is very specific about the way land rights should be transferred from seller to a foreigner buyer. a Public Notary will guide you through the details but generally:</p>\n\n <p>property can be owned by foreign nationals outside of the 100km restricted land border zone or 50km outside coastal zone&nbsp;</p>\n\n <p>inside the restricted border/coastal zones, foreign nationals can own land through a fideicomiso (a trust) which allows ownership of the property in all aspects except in name and is set up through a bank.</p>\n\n <p>this law was passed to prevent an invasion in Mexican soil</p>\n\n <h4>FIDEICOMISO</h4>\n\n <p>In order to have foreigners nationals invest in Mexico, the Government introduced a system of land trusts, so now if you’re not a mexican citizen you could buy your ocean view or beachfront dream home inside the restricted zones through a trust set up through any of the most importantes banks of mexico. this trusts holds the deeds to the property and you are the sole beneficiary. In this trust you can name a beneficiary upon your death and you don\'t need a will in mexico in order to have your wishes granted.&nbsp;</p>\n\n <p>you don’t need to be a resident in Mexico in order to own a property so there’s no need to go through the process of qualifying for resident status before buying your property.&nbsp;</p>\n\n <p>Notary Public</p>\n\n <p>Contrary to the role of the notary public in the Us, in Mexico it’s the most important person you will have to deal with in legal matters.</p>\n\n <p>a Notary Public in México, has the power to certify important documents and also has responsibility over the management and security of the storage of original records&nbsp;</p>\n\n <p> </p>\n\n <p>Under the Mexican Laq, a Notary Public must be the person to prepare the deed of a property, once you have decided to buy a property&nbsp; the Notary Public will determine if all the documents and permits are in order to continue with the process of the transactions.</p>', 'xhtml'),
(10, 18, '<h4>​Blaha blah</h4>\n\n<p><a href=\"google.com\" title=\"link\" target=\"_blank\">sdasdfsafsafasdfs</a></p>\n\n<p></p>', 'xhtml');

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
(1, 4, ' ', 'xhtml'),
(2, 5, ' ', 'xhtml'),
(3, 6, ' ', 'xhtml'),
(4, 7, ' ', 'xhtml'),
(5, 8, ' ', 'xhtml'),
(6, 9, ' ', 'xhtml'),
(7, 10, ' ', 'xhtml'),
(8, 11, ' ', 'xhtml');

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
(1, 4, ' ', 'xhtml'),
(2, 5, ' ', 'xhtml'),
(3, 6, ' ', 'xhtml'),
(4, 7, ' ', 'xhtml'),
(5, 8, ' ', 'xhtml'),
(6, 9, ' ', 'xhtml'),
(7, 10, ' ', 'xhtml'),
(8, 11, ' ', 'xhtml');

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
(1, 12, ' ', 'xhtml');

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
(12, 12, 'Contact us, phone, mailing, email.', 'xhtml'),
(13, 13, '', 'xhtml'),
(14, 14, '', 'xhtml'),
(15, 15, '', 'xhtml'),
(17, 17, '', 'xhtml'),
(18, 18, '', 'xhtml');

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
(12, 12, 'Contact {site_name}', 'none'),
(13, 13, '', 'none'),
(14, 14, '', 'none'),
(15, 15, '', 'none'),
(17, 17, '', 'none'),
(18, 18, '', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_12`
--

DROP TABLE IF EXISTS `exp_channel_data_field_12`;
CREATE TABLE `exp_channel_data_field_12` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_12` text COLLATE utf8mb4_unicode_ci,
  `field_ft_12` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_12`
--

INSERT INTO `exp_channel_data_field_12` (`id`, `entry_id`, `field_id_12`, `field_ft_12`) VALUES
(1, 13, '<p>La Paz is the capital of the state of Baja California Sur, the 4th largest municipality in México in geographical size, with a population of 290,000 people. A very popular destiny in national and international tourism given the first class services you can find without losing the charm and coziness of a small town.&nbsp;</p>\n\n<p>Due to its distinctive relaxed lifestyle La Paz is the perfect place to enjoy long walks on the boardwalk, beaches fusioned with dessert and a wide variety of aquatic recreations such as sport fishing, excursions to Espírito Santo island where you can practice diving and snorkeling, swimming with sea lions and whale sharks, whale sighting, etc...</p>\n\n <p>La&nbsp; Paz has the international airport Manuel Márquez de León, with daily flights to the most important cities of Mexico like Guadalajara, Mexico city and Monterrey, it also has two ferries that connect the peninsula with mainland.</p>\n\n <p> </p>\n\n <p>It is the ideal place for the investor due to its peculiarity of being able to offer an opening field for the hotel and restaurant industry since it’s a city that has an economic level above the national average, and has a very large potential market because of its characteristics, of urban renewal and its geopolitical location. In addition to having a community highly committed to ecology, sustainability, and renewable energy.</p>', 'xhtml'),
(2, 14, '<p>Cabo San Lucas, a coastal city of 56,000 inhabitants, located at the southern tip of the Baja California peninsula, it known for its luxurious resorts, nightlife and one of the biggest fishing tournaments. Playa El Medano is the main beach of the city, with restaurant and many outdoor bars. Among its tourist attractions include, the Marina, Playa del Amor and El Arco, a natural arch of granite drilled in the cliffs that separates two oceans also known as “land’s end”. Cabo San Lucas is designed to welcome people who appreciate nautical activities and natural landscapes, relax on the beach, rent a boat to fish in the open sea, play at golf and live a fancy life of comfort.</p>', 'xhtml'),
(3, 15, '<p>San José del Cabo has retained its colonial charm. We can discover the &nbsp;missionary church of San José rebuilt in 1940, located in front of the Plaza Mijares, in the heart of the historic district. the Arroyo San José, the paseo del Estero lined with palm trees where you can observe a wide variety of birds ... It is pleasant to walk around the streets to enjoy its pretty terraces and find &nbsp;a lot of galleries that have local and international art exhibitions all year round.</p>\n\n <p> </p>\n\n <p> </p>\n\n <p>The city consists of two parts:&nbsp;the colonial village, its chic shops and good restaurants (inland) and the hotel zone, by the sea where almost any water sport can be practiced.</p>', 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_13`
--

DROP TABLE IF EXISTS `exp_channel_data_field_13`;
CREATE TABLE `exp_channel_data_field_13` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_13` text COLLATE utf8mb4_unicode_ci,
  `field_ft_13` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_13`
--

INSERT INTO `exp_channel_data_field_13` (`id`, `entry_id`, `field_id_13`, `field_ft_13`) VALUES
(1, 13, '<p>La Paz es la capital del estado de Baja California Sur, el 4to municipio más grande de México en territorio con una población de 290,000 habitantes. Un destino popular entre el turismo nacional y extranjero, debido a que ofrece servicios de primera clase sin perder el encanto de una ciudad pequeña y acogedora.</p>\n\n <p>Gracias a su característico estilo de vida relajado es el lugar ideal para disfrutar largas caminatas en el malecón, playas fusionadas con el desierto e inagotables recreaciones acuáticas, otras de sus atracciones son la pesca deportiva (marlin, pez vela y otros) excursiones a la isla Espíritu Santo para practicar buceo y snorkel, avistamiento de ballenas. &nbsp;</p>\n\n <p>La&nbsp;Paz cuenta con el aeropuerto internacional Manuel Márquez de León con vuelos desde las ciudades más importante de México, Guadalajara, Cd de México, Monterrey, operan dos ferries desde el puerto de pichilingue que conectan a la península con el interior de la república.</p>\n\n <p> </p>\n\n <p>Es el lugar ideal para &nbsp;el inversionista debido a su peculiaridad de poder &nbsp;ofrecer un campo de apertura para la industria hotelera y restaurantera, &nbsp;ya que es una ciudad que tiene un nivel económico arriba de la media nacional, &nbsp;y cuenta con un mercado potencial muy grande, debido a sus características, de renovación urbana, su localización &nbsp;geopolítica. Además de contar con una comunidad altamente comprometida con la ecología, la sustentabilidad, y las energías &nbsp;renovables.</p>', 'xhtml'),
(2, 14, '<p>Cabo San Lucas, una ciudad costera en el extremo sur de la península de Baja California, es conocida por sus playas, actividades náuticas y vida nocturna. Playa El Médano es la playa principal de la ciudad, con restaurantes y muchos bares al aire libre. Entre sus atractivos turísticos destacan &nbsp;el \"Promontorio del fin del mundo\", el sitio de la Playa del Amor y El Arco, un arco natural de granito perforado en los acantilados que separa dos oceános. Cabo San Lucas está diseñado para recibir a personas que disfruta de las actividades náuticas y los paisajes naturales que dibuja el mar, a los que les gusta pasear sin rumbo, descansar en la playa, alquilar una embarcación para pescar en mar abierto, jugar al golf y simplemente tener una lujosa vida de confort.</p>', 'xhtml'),
(3, 15, '<p>San José del Cabo ha conservado su encanto colonial. Podemos descubrir la iglesia misionera de San José reconstruida en 1940, ubicada frente a la Plaza Mijares, en el corazón del distrito histórico. El Arroyo San José, el paseo del Estero bordeado de palmeras donde se puede observar una gran cantidad de aves Es agradable pasear por las calles de la plaza, disfrutar de sus bonitas terrazas y encontrar muchas galerías que tienen exposiciones de arte locales e internacionales a lo largo del año.</p>\n\n <p> </p>\n\n <p> </p>\n\n <p><span>La ciudad consta de dos partes:&nbsp;</span>el pueblo colonial, sus tiendas elegantes y buenos restaurantes y la zona hotelera a 1 km del centro, junto al mar donde se puede practicar infinidad de deportes acuáticos</p>', 'xhtml');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_14`
--

DROP TABLE IF EXISTS `exp_channel_data_field_14`;
CREATE TABLE `exp_channel_data_field_14` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_14` text COLLATE utf8mb4_unicode_ci,
  `field_ft_14` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_14`
--

INSERT INTO `exp_channel_data_field_14` (`id`, `entry_id`, `field_id_14`, `field_ft_14`) VALUES
(1, 19, '6121410871', 'none'),
(2, 20, '6121277427', 'none'),
(3, 21, '6121670963', 'none'),
(4, 22, '6121554235', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_15`
--

DROP TABLE IF EXISTS `exp_channel_data_field_15`;
CREATE TABLE `exp_channel_data_field_15` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_15` text COLLATE utf8mb4_unicode_ci,
  `field_ft_15` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_15`
--

INSERT INTO `exp_channel_data_field_15` (`id`, `entry_id`, `field_id_15`, `field_ft_15`) VALUES
(1, 19, 'annie@diamanteassociates.com', 'none'),
(2, 20, 'donna@diamanteassociates.com', 'none'),
(3, 21, 'anamaria@diamanteassociates.com', 'none'),
(4, 22, 'ken@diamanteassociates.com', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `exp_channel_data_field_17`
--

DROP TABLE IF EXISTS `exp_channel_data_field_17`;
CREATE TABLE `exp_channel_data_field_17` (
  `id` int(10) UNSIGNED NOT NULL,
  `entry_id` int(10) UNSIGNED NOT NULL,
  `field_id_17` text COLLATE utf8mb4_unicode_ci,
  `field_ft_17` tinytext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_channel_data_field_17`
--

INSERT INTO `exp_channel_data_field_17` (`id`, `entry_id`, `field_id_17`, `field_ft_17`) VALUES
(1, 19, '{filedir_7}0_(1).jpg', 'none'),
(2, 20, '{filedir_7}0_(3).jpg', 'none'),
(3, 21, '{filedir_7}0.jpg', 'none'),
(4, 22, '{filedir_7}0_(6).jpg', 'none');

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
(1, 0, 1, 5, 1, NULL, '0', 'Donna Green', 'donna-green', 'open', 'n', 0, 0, 0, 0, 'y', 'n', 0, '0', '0', '0', 0, 0, 1541131932, NULL, 0, '{\"title\":\"Donna Green\",\"url_title\":\"donna-green\",\"field_id_14\":\"6121277427\",\"field_id_15\":\"donna@diamanteassociates.com\",\"field_id_17\":\"{filedir_7}0.jpg\",\"entry_date\":\"11\\/2\\/2018 4:11 AM\",\"expiration_date\":\"\",\"comment_expiration_date\":\"\",\"channel_id\":\"5\",\"status\":\"open\",\"author_id\":\"1\",\"sticky\":\"n\",\"allow_comments\":\"y\"}');

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
(3, 0, 'blog_content', 'Content', 'Content for this blog entry.', 'rte', '', 'n', NULL, NULL, 6, NULL, 'n', 'ltr', 'y', 'n', 'xhtml', 'n', 1, 'any', 'YToyOntzOjE0OiJmaWVsZF9zaG93X2ZtdCI7czoxOiJuIjtzOjEzOiJmaWVsZF90YV9yb3dzIjtzOjE6IjYiO30=', 'n'),
(6, 0, 'page_content', 'Page Content', 'Content for this page.', 'textarea', '', 'n', NULL, NULL, 10, NULL, 'n', 'ltr', 'y', 'n', 'xhtml', 'y', 3, 'any', 'YTozOntzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO30=', 'n'),
(7, 0, 'contact_address', 'Contact Address', 'Address where someone can send mail.', 'grid', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 4, 'any', 'YTozOntzOjEzOiJncmlkX21pbl9yb3dzIjtpOjA7czoxMzoiZ3JpZF9tYXhfcm93cyI7czowOiIiO3M6MTM6ImFsbG93X3Jlb3JkZXIiO3M6MToieSI7fQ==', 'n'),
(8, 0, 'contact_email', 'Contact Email', 'Email address someone can send Email to.', 'text', '', 'n', NULL, NULL, 8, 256, 'n', 'ltr', 'n', 'n', 'none', 'y', 6, '', 'YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtpOjI1NjtzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO30=', 'n'),
(9, 0, 'contact_phone', 'Contact Phone', 'Phone number someone can call.', 'text', '', 'n', NULL, NULL, 8, 256, 'n', 'ltr', 'n', 'n', 'none', 'y', 5, '', 'YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtpOjI1NjtzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO30=', 'n'),
(10, 0, 'seo_desc', 'SEO Description', 'Page Description for use in HTML meta description tag, generally only seen by machines.', 'textarea', '', 'n', NULL, NULL, 2, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'y', 6, 'any', 'YTozOntzOjI0OiJmaWVsZF9zaG93X2ZpbGVfc2VsZWN0b3IiO3M6MToibiI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjY6ImZpZWxkX3Nob3dfZm9ybWF0dGluZ19idG5zIjtzOjE6Im4iO30=', 'n'),
(11, 0, 'seo_title', 'SEO Title', 'Page title that will be added to browser titlebar/tab.', 'text', '', 'n', NULL, NULL, 8, 256, 'n', 'ltr', 'n', 'n', 'none', 'y', 5, '', 'YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtpOjI1NjtzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6MDoiIjtzOjE4OiJmaWVsZF9zaG93X3NtaWxleXMiO3M6MToibiI7czoyNDoiZmllbGRfc2hvd19maWxlX3NlbGVjdG9yIjtzOjE6Im4iO30=', 'n'),
(12, 0, 'communities_about', 'About', '', 'rte', '', 'n', NULL, NULL, 6, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 12, 'any', 'YToyOntzOjE0OiJmaWVsZF9zaG93X2ZtdCI7czoxOiJuIjtzOjEzOiJmaWVsZF90YV9yb3dzIjtzOjE6IjYiO30=', 'n'),
(13, 0, 'communities_about_esp', 'About Español', '', 'rte', '', 'n', NULL, NULL, 6, NULL, 'n', 'ltr', 'n', 'n', 'xhtml', 'n', 13, 'any', 'YToyOntzOjE0OiJmaWVsZF9zaG93X2ZtdCI7czoxOiJuIjtzOjEzOiJmaWVsZF90YV9yb3dzIjtzOjE6IjYiO30=', 'n'),
(14, 0, 'mobile', 'Mobile', '', 'text', '', 'n', NULL, NULL, 8, 256, 'n', 'ltr', 'n', 'n', 'none', 'n', 11, 'all', 'YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjM6IjI1NiI7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjt9', 'n'),
(15, 0, 'agent_email', 'Email', '', 'text', '', 'n', NULL, NULL, 8, 256, 'n', 'ltr', 'n', 'n', 'none', 'n', 12, 'all', 'YTo0OntzOjEwOiJmaWVsZF9tYXhsIjtzOjM6IjI1NiI7czoxODoiZmllbGRfY29udGVudF90eXBlIjtzOjM6ImFsbCI7czoxODoiZmllbGRfc2hvd19zbWlsZXlzIjtzOjE6Im4iO3M6MjQ6ImZpZWxkX3Nob3dfZmlsZV9zZWxlY3RvciI7czoxOiJuIjt9', 'n'),
(17, 0, 'avatar', 'Avatar', '', 'file', '', 'n', NULL, NULL, 8, NULL, 'n', 'ltr', 'n', 'n', 'none', 'y', 13, 'image', 'YTo1OntzOjE4OiJmaWVsZF9jb250ZW50X3R5cGUiO3M6NToiaW1hZ2UiO3M6MTk6ImFsbG93ZWRfZGlyZWN0b3JpZXMiO3M6MToiNyI7czoxMzoic2hvd19leGlzdGluZyI7czoxOiJ5IjtzOjEyOiJudW1fZXhpc3RpbmciO3M6MjoiNTAiO3M6OToiZmllbGRfZm10IjtzOjQ6Im5vbmUiO30=', 'n');

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
(3, 2),
(6, 3),
(7, 4),
(8, 4),
(9, 4),
(10, 5),
(11, 5),
(14, 6),
(15, 6),
(17, 6);

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

--
-- Dumping data for table `exp_channel_form_settings`
--

INSERT INTO `exp_channel_form_settings` (`channel_form_settings_id`, `site_id`, `channel_id`, `default_status`, `allow_guest_posts`, `default_author`) VALUES
(1, 1, 4, '', 'n', 1),
(2, 1, 5, '', 'n', 2);

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

--
-- Dumping data for table `exp_channel_member_groups`
--

INSERT INTO `exp_channel_member_groups` (`group_id`, `channel_id`) VALUES
(6, 2),
(6, 3),
(6, 4);

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
(12, 1, 3, 1, NULL, '192.168.33.1', 'Contact Us', 'contact-us', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1515540988, '2018', '01', '09', 0, 0, NULL, NULL, 0),
(13, 1, 4, 1, NULL, '192.168.33.1', 'La Paz', 'la-paz', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1537306740, '2018', '09', '18', 0, 0, 1537314572, NULL, 0),
(14, 1, 4, 1, NULL, '192.168.33.1', 'Cabo San Lucas', 'cabo-san-lucas', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1537321860, '2018', '09', '19', 0, 0, 1537321995, NULL, 0),
(15, 1, 4, 1, NULL, '192.168.33.1', 'San José del Cabo', 'san-jose-del-cabo', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1537322040, '2018', '09', '19', 0, 0, 1537322161, NULL, 0),
(17, 1, 2, 1, NULL, '192.168.33.1', 'Buyers', 'buyers', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1539308280, '2018', '10', '12', 0, 0, 1539308888, NULL, 0),
(18, 1, 2, 2, NULL, '187.131.21.56', 'Blog Entry de Etsample', 'blog-entry-de-etsample', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1539310320, '2018', '10', '12', 0, 0, 1539310478, NULL, 0),
(19, 1, 5, 1, NULL, '187.131.23.196', 'Annie Espinoza', 'annie-espinoza', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1541131740, '2018', '11', '02', 0, 0, 1541131861, NULL, 0),
(20, 1, 5, 1, NULL, '187.131.23.196', 'Donna Green', 'donna-green', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1541131860, '2018', '11', '02', 0, 0, 1541131965, NULL, 0),
(21, 1, 5, 1, NULL, '187.131.23.196', 'Ana Maria Carranza', 'ana-maria-carranza', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1541131920, '2018', '11', '02', 0, 0, 1541132014, NULL, 0),
(22, 1, 5, 1, NULL, '187.131.23.196', 'Kenneth Mckenna', 'kenneth-mckenna', 'open', 1, 'n', 0, 0, 0, 0, 'y', 'n', 1541131980, '2018', '11', '02', 0, 0, 1541132082, NULL, 0);

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
-- Table structure for table `exp_consents`
--

DROP TABLE IF EXISTS `exp_consents`;
CREATE TABLE `exp_consents` (
  `consent_id` int(10) UNSIGNED NOT NULL,
  `consent_request_id` int(10) UNSIGNED NOT NULL,
  `consent_request_version_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `request_copy` mediumtext COLLATE utf8mb4_unicode_ci,
  `request_format` tinytext COLLATE utf8mb4_unicode_ci,
  `consent_given` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `consent_given_via` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiration_date` int(10) DEFAULT NULL,
  `response_date` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_consent_audit_log`
--

DROP TABLE IF EXISTS `exp_consent_audit_log`;
CREATE TABLE `exp_consent_audit_log` (
  `consent_audit_id` int(10) UNSIGNED NOT NULL,
  `consent_request_id` int(10) UNSIGNED NOT NULL,
  `member_id` int(10) UNSIGNED NOT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exp_consent_requests`
--

DROP TABLE IF EXISTS `exp_consent_requests`;
CREATE TABLE `exp_consent_requests` (
  `consent_request_id` int(10) UNSIGNED NOT NULL,
  `consent_request_version_id` int(10) UNSIGNED DEFAULT NULL,
  `user_created` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consent_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `double_opt_in` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `retention_period` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_consent_requests`
--

INSERT INTO `exp_consent_requests` (`consent_request_id`, `consent_request_version_id`, `user_created`, `title`, `consent_name`, `double_opt_in`, `retention_period`) VALUES
(1, 1, 'n', 'Functionality Cookies', 'ee:cookies_functionality', 'n', NULL),
(2, 2, 'n', 'Performance Cookies', 'ee:cookies_performance', 'n', NULL),
(3, 3, 'n', 'Targeting Cookies', 'ee:cookies_targeting', 'n', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_consent_request_versions`
--

DROP TABLE IF EXISTS `exp_consent_request_versions`;
CREATE TABLE `exp_consent_request_versions` (
  `consent_request_version_id` int(10) UNSIGNED NOT NULL,
  `consent_request_id` int(10) UNSIGNED NOT NULL,
  `request` mediumtext COLLATE utf8mb4_unicode_ci,
  `request_format` tinytext COLLATE utf8mb4_unicode_ci,
  `create_date` int(10) NOT NULL DEFAULT '0',
  `author_id` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_consent_request_versions`
--

INSERT INTO `exp_consent_request_versions` (`consent_request_version_id`, `consent_request_id`, `request`, `request_format`, `create_date`, `author_id`) VALUES
(1, 1, 'These cookies help us personalize content and functionality for you, including remembering changes you have made to parts of the website that you can customize, or selections for services made on previous visits. If you do not allow these cookies, some portions of our website may be less friendly and easy to use, forcing you to enter content or set your preferences on each visit.', 'none', 1537475793, 0),
(2, 2, 'These cookies allow us measure how visitors use our website, which pages are popular, and what our traffic sources are. This helps us improve how our website works and make it easier for all visitors to find what they are looking for. The information is aggregated and anonymous, and cannot be used to identify you. If you do not allow these cookies, we will be unable to use your visits to our website to help make improvements.', 'none', 1537475793, 0),
(3, 3, 'These cookies are usually placed by third-party advertising networks, which may use information about your website visits to develop a profile of your interests. This information may be shared with other advertisers and/or websites to deliver more relevant advertising to you across multiple websites. If you do not allow these cookies, visits to this website will not be shared with advertising partners and will not contribute to targeted advertising on other websites.', 'none', 1537475793, 0);

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
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL
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
(24, 1, 1, 'mrubio', '187.131.106.207', 1536344543, 'Logged in'),
(25, 1, 1, 'mrubio', '192.168.33.1', 1536783202, 'Logged in'),
(26, 1, 1, 'mrubio', '192.168.33.1', 1537306431, 'Channel Created&nbsp;&nbsp;Communities'),
(27, 1, 1, 'mrubio', '192.168.33.1', 1537314172, 'Logged in'),
(28, 1, 1, 'mrubio', '192.168.33.1', 1537314201, 'Logged in'),
(29, 1, 1, 'mrubio', '192.168.33.1', 1537473564, 'Logged in'),
(30, 1, 1, 'mrubio', '192.168.33.1', 1537554972, 'Logged in'),
(31, 1, 1, 'mrubio', '187.131.18.39', 1537992351, 'Logged in'),
(32, 1, 1, 'mrubio', '187.131.18.39', 1537992389, 'New member created:&nbsp;cguemez'),
(33, 1, 2, 'cguemez', '187.131.18.39', 1537992558, 'Logged in'),
(34, 1, 2, 'cguemez', '187.131.18.39', 1538000602, 'Logged in'),
(35, 1, 2, 'cguemez', '187.131.18.39', 1538000796, 'Logged in'),
(36, 1, 1, 'mrubio', '192.168.33.1', 1538264258, 'Logged in'),
(37, 1, 1, 'mrubio', '192.168.33.1', 1538267948, 'Logged in'),
(38, 1, 1, 'mrubio', '192.168.33.1', 1538440330, 'Logged in'),
(39, 1, 1, 'mrubio', '192.168.33.1', 1539308098, 'The following field was removed and its data was deleted: <b>Audio</b>'),
(40, 1, 1, 'mrubio', '192.168.33.1', 1539308098, 'The following field was removed and its data was deleted: <b>Image</b>'),
(41, 1, 1, 'mrubio', '192.168.33.1', 1539308098, 'The following field was removed and its data was deleted: <b>Video</b>'),
(42, 1, 2, 'cguemez', '187.131.21.56', 1539310238, 'Logged in'),
(43, 1, 1, 'mrubio', '187.131.21.56', 1539575929, 'Logged in'),
(44, 1, 1, 'mrubio', '187.131.23.196', 1541114351, 'Logged in'),
(45, 1, 1, 'mrubio', '187.131.23.196', 1541123513, 'Logged in'),
(46, 1, 1, 'mrubio', '187.131.23.196', 1541131131, 'The following field was removed and its data was deleted: <b>Avatar</b>'),
(47, 1, 1, 'mrubio', '187.131.23.196', 1541131300, 'Channel Created&nbsp;&nbsp;Agents');

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
-- Table structure for table `exp_email_tracker`
--

DROP TABLE IF EXISTS `exp_email_tracker`;
CREATE TABLE `exp_email_tracker` (
  `email_id` int(10) UNSIGNED NOT NULL,
  `email_date` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sender_ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_email` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sender_username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_recipients` int(4) UNSIGNED NOT NULL DEFAULT '1'
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
(5, 0, 'seo'),
(6, 0, 'agents');

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
(6, 1, 'sky.jpg', 8, 'image/jpeg', 'sky.jpg', 62326, NULL, NULL, NULL, 1, 1515540994, 1, 1515540994, '502 1200'),
(7, 1, '0_(1).jpg', 7, 'image/jpeg', '0_(1).jpg', 6369, '', '', '', 1, 1541131838, 1, 1541131838, '200 200'),
(8, 1, '0.jpg', 7, 'image/jpeg', '0.jpg', 6164, '', '', '', 1, 1541131911, 1, 1541131911, '200 200'),
(9, 1, '0_(3).jpg', 7, 'image/jpeg', '0_(3).jpg', 118968, '', '', '', 1, 1541131957, 1, 1541131957, '720 1080'),
(10, 1, '0_(6).jpg', 7, 'image/jpeg', '0_(6).jpg', 85320, '', '', '', 1, 1541132080, 1, 1541132080, '960 960');

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
-- Table structure for table `exp_formgrab_forms`
--

DROP TABLE IF EXISTS `exp_formgrab_forms`;
CREATE TABLE `exp_formgrab_forms` (
  `form_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(10) UNSIGNED DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `save_submission` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'y',
  `status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT 'open',
  `return_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email_notification` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'n',
  `email_to` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `email_from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `email_from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `view_order` int(10) UNSIGNED DEFAULT '0',
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_formgrab_forms`
--

INSERT INTO `exp_formgrab_forms` (`form_id`, `site_id`, `name`, `title`, `save_submission`, `status`, `return_url`, `email_notification`, `email_to`, `email_subject`, `email_body`, `email_from_email`, `email_from_name`, `view_order`, `created_at`, `updated_at`) VALUES
(1, 1, 'contact_form', 'Contact Form', 'y', 'open', 'contact/thanks', 'y', 'miguelantonio.rubio@gmail.com', 'New Contact Us Submission', 'Submission Date: {submission_date}\n\nName: {from}\nPhone: {phone}\nEmail: {email}\nSubject: {subject}\nMessage: {message}', 'info@diamanterealtors.com', 'Diamante Realtors', 1, 1538591231, 1538591231);

-- --------------------------------------------------------

--
-- Table structure for table `exp_formgrab_submissions`
--

DROP TABLE IF EXISTS `exp_formgrab_submissions`;
CREATE TABLE `exp_formgrab_submissions` (
  `submission_id` int(10) UNSIGNED NOT NULL,
  `site_id` int(10) UNSIGNED DEFAULT '0',
  `form_id` int(10) UNSIGNED DEFAULT '0',
  `member_id` int(10) UNSIGNED DEFAULT '0',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT 'new',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_formgrab_submissions`
--

INSERT INTO `exp_formgrab_submissions` (`submission_id`, `site_id`, `form_id`, `member_id`, `ip_address`, `status`, `url`, `data`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '192.168.33.1', 'read', 'contact', '{\"name\":\"Miguel Rubio\",\"email\":\"mig.el@hotmail.com\",\"message\":\"Some sample message\"}', 1538591231, 1538591231),
(2, 1, 1, 1, '192.168.33.1', 'new', 'contact', '{\"name\":\"Some Name\",\"phone\":\"1234567890\",\"email\":\"some@mail.com\",\"subject\":\"Question\",\"message\":\"Some sample message  \",\"submit\":\"Submit Form\"}', 1538593792, 1538593792);

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
(1, 0, 'gv_comment_disabled', 'Commenting for this entry is <b>disabled</b>.', 1537487129),
(2, 0, 'gv_comment_expired', 'Commenting for this entry has <b>expired</b>.', 1537487129),
(3, 0, 'gv_comment_ignore', 'You are ignoring', 1537487129),
(4, 0, 'gv_comment_none', 'There are <b>no</b> comments on this entry.', 1537487134),
(5, 0, 'gv_entries_none', 'There are <b>no</b> entries in this channel.', 1537487130),
(6, 0, 'gv_sep', '&nbsp;/&nbsp;', 1537487131);

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
(1, 1, 'mrubio', 'mrubio', '4ff70e65bb20ff03cd8550bbaf372112d36855d7fd8154be3e1b8eba4a5672a206900f992a8c4a173ecda8865ba5dc81d84b012f1ad8fbcbeaccc64b9a3e8a8b', '$o2O{F$AV^\"NBtWwby9};m)4+(1:fsIYDn(,CaLIY&|+&A@ykl[JSB_!z[?k&&!k=IVfii;fb\\8Y^]nUshzu|GNY06$#QvDO{aq/&zWF=E4d>,,L$WJExhe1ty//Q&{/', '7449bb75968a239825a280749854d389b8037848', '48ac06b7ff22abf620b9277e3de9dd2bf77a9913', NULL, 'miguelantonio.rubio@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '192.168.33.1', 1515540988, 1541118552, 1541132070, 17, 7, 0, 0, 1541131980, 1515541007, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', 'UTC', NULL, NULL, NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, '', NULL, 'n', 0, 'y', 0, NULL, NULL, NULL),
(2, 6, 'cguemez', 'cguemez', '8b8fcecbe76536927070fee0abf066df97286d425a2da08989f7bd1e6375f020204f82c24bbebd1b04c29b78b5f51c9ed9701b3090877efcc35108c7a50ca395', 'wK-`$V(x7K1h%X2$(oOAPx_HUMf6@|0kl5s\\5Fc3WI:&(6~b@)1mskx\'c/q\"1g9{e9C]\"H3+,jP,}m@y!yBtObJh<t(3?jgCAWr@=Mw5XF~!En6K1DE/mBf[1\\Yd$^a%', 'f7164f448925141a6f4b36624dbc28851b45e58c', 'f48813e3560dec854f7714ed27dba2f652c651b2', NULL, 'carlaguemez@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'y', 0, 0, '187.131.18.39', 1537992389, 1538001776, 1539313273, 1, 0, 0, 0, 1539310320, 0, 0, 0, 'n', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'english', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28', NULL, '18', NULL, NULL, NULL, 'n', 0, 'y', 0, NULL, NULL, NULL);

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
(1),
(2);

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
  `m_field_fmt` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `m_field_show_fmt` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'y',
  `m_field_exclude_from_anon` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
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
  `can_moderate_spam` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `can_manage_consents` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_member_groups`
--

INSERT INTO `exp_member_groups` (`group_id`, `site_id`, `menu_set_id`, `group_title`, `group_description`, `is_locked`, `can_view_offline_system`, `can_view_online_system`, `can_access_cp`, `can_access_footer_report_bug`, `can_access_footer_new_ticket`, `can_access_footer_user_guide`, `can_view_homepage_news`, `can_access_files`, `can_access_design`, `can_access_addons`, `can_access_members`, `can_access_sys_prefs`, `can_access_comm`, `can_access_utilities`, `can_access_data`, `can_access_logs`, `can_admin_channels`, `can_admin_design`, `can_delete_members`, `can_admin_mbr_groups`, `can_admin_mbr_templates`, `can_ban_users`, `can_admin_addons`, `can_edit_categories`, `can_delete_categories`, `can_view_other_entries`, `can_edit_other_entries`, `can_assign_post_authors`, `can_delete_self_entries`, `can_delete_all_entries`, `can_view_other_comments`, `can_edit_own_comments`, `can_delete_own_comments`, `can_edit_all_comments`, `can_delete_all_comments`, `can_moderate_comments`, `can_send_cached_email`, `can_email_member_groups`, `can_email_from_profile`, `can_view_profiles`, `can_edit_html_buttons`, `can_delete_self`, `mbr_delete_notify_emails`, `can_post_comments`, `exclude_from_moderation`, `can_search`, `search_flood_control`, `can_send_private_messages`, `prv_msg_send_limit`, `prv_msg_storage_limit`, `can_attach_in_private_messages`, `can_send_bulletins`, `include_in_authorlist`, `include_in_memberlist`, `cp_homepage`, `cp_homepage_channel`, `cp_homepage_custom`, `can_create_entries`, `can_edit_self_entries`, `can_upload_new_files`, `can_edit_files`, `can_delete_files`, `can_upload_new_toolsets`, `can_edit_toolsets`, `can_delete_toolsets`, `can_create_upload_directories`, `can_edit_upload_directories`, `can_delete_upload_directories`, `can_create_channels`, `can_edit_channels`, `can_delete_channels`, `can_create_channel_fields`, `can_edit_channel_fields`, `can_delete_channel_fields`, `can_create_statuses`, `can_delete_statuses`, `can_edit_statuses`, `can_create_categories`, `can_create_member_groups`, `can_delete_member_groups`, `can_edit_member_groups`, `can_create_members`, `can_edit_members`, `can_create_new_templates`, `can_edit_templates`, `can_delete_templates`, `can_create_template_groups`, `can_edit_template_groups`, `can_delete_template_groups`, `can_create_template_partials`, `can_edit_template_partials`, `can_delete_template_partials`, `can_create_template_variables`, `can_delete_template_variables`, `can_edit_template_variables`, `can_access_security_settings`, `can_access_translate`, `can_access_import`, `can_access_sql_manager`, `can_moderate_spam`, `can_manage_consents`) VALUES
(1, 1, 1, 'Super Admin', '', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', NULL, 'y', 'y', 'y', 0, 'y', 20, 60, 'y', 'y', 'y', 'y', NULL, 0, NULL, 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y', 'y'),
(2, 1, 1, 'Banned', '', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', NULL, 'n', 'n', 'n', 60, 'n', 20, 60, 'n', 'n', 'n', 'n', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(3, 1, 1, 'Guests', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', NULL, 'n', 'n', 'n', 10, 'n', 20, 60, 'n', 'n', 'n', 'y', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(4, 1, 1, 'Pending', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', NULL, 'n', 'n', 'n', 10, 'n', 20, 60, 'n', 'n', 'n', 'y', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(5, 1, 1, 'Members', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'y', 'y', NULL, 'n', 'n', 'n', 10, 'y', 20, 60, 'y', 'n', 'n', 'y', NULL, 0, NULL, 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(6, 1, 1, 'Author', '', 'y', 'y', 'y', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'y', 'y', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'y', '', 'n', 'n', 'y', 0, 'y', 0, 0, 'y', 'y', 'y', 'y', 'overview', 2, '', 'y', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n'),
(7, 1, 1, 'Agents', '', 'n', 'n', 'y', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'y', 'n', 'n', '', 'y', 'n', 'y', 0, 'y', 0, 0, 'n', 'n', 'n', 'y', NULL, 2, '', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n', 'n');

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
(1, '4.3.4', 1);

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
(8, 'Search', '2.2.2', 'n', 'n'),
(9, 'Member', '2.1.0', 'n', 'n'),
(10, 'Consent', '1.0.0', 'n', 'n'),
(11, 'Email', '2.1.0', 'n', 'n'),
(12, 'Formgrab', '1.0.2', 'y', 'n');

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
('5434aeb949e622d6cdae05a2869f6e8d15acaf56', 1, '187.131.18.39', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 0, 1, 1539201951, 1537992351),
('98025fd1600ed4291d2d7ab131249e6a6aef6f02', 1, '187.131.21.56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 0, 1, 1541102423, 1539892823),
('dc6442f17f6360277d717d93618ad995ef429d02', 1, '192.168.33.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.100 Safari/537.36', 0, 1, 1540515344, 1539305744),
('f8fa99fc5b586fc5d9d3d73873c8fccc532dde0f', 2, '187.131.18.39', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/69.0.3497.92 Safari/537.36', 0, 1, 1539202158, 1537992558);

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
(51, 1538000603, '2f017aa904f65f54741fc57c04998f6df649f2a5', 'cce0e905f3aa0bd70fc10f4a38257ae08f975448'),
(52, 1538000799, '6bfedb69cea6437c8811e51c09116e4b55e73d74', '86b4a229a0df5afe319c0888e2fd3a5704a6d6bf'),
(53, 1538013259, 'fe6051926459f4c21717be24a514c87fc9062ba3', '33270bef882ef0182a6a47547a54d3d03fc425e2'),
(54, 1538264286, '7a11f9cd562f72edbdc39d3ec1d533bbdfa6a87f', '64f5d4a27104e58f838f29812ff002b558d9105c'),
(55, 1538267969, '9f6886778e1da038b4c04c94da922fc49469e22c', 'b7b43315ccceb5bbcd6e3ca620866f9ef6a5830a'),
(56, 1538440348, '511a5ec57279d45a3e4457bebb500dd66362d289', 'cd74511efdabc740b9e0fdbd0ba90d502833318b'),
(57, 1538527806, '003c5ca86be255ffaf42f898dd3fd5efcd5b438d', '0c2a9d479c8e333130066fb64cf74d3a06d2d5af'),
(58, 1538590113, '41aed562966c37e801de04c92f91ea22fb84d313', 'eeb3aa2ccaee04728c14dcc4d0624fd295ddfc06'),
(59, 1539305744, 'e41874b00aaf97649a17ca10619f134598873751', '490697a5be527ea00d0d1cc9e1f7062da61952e4'),
(60, 1539310239, '501acb126994efae7537611f2f174d0e4f0d17f6', 'b8448af5a5de161029baf0cf4aa324d700708f49'),
(61, 1539575930, 'b07e027c0917ac6f864591e15d06390a527cc5ae', '0fbc3580f7676811771e8abaa2b779c4d5d99a6b'),
(62, 1539892823, 'f9e7153f4008f1cd168c8cc9056a981f5dc4c3f4', 'c829ca9d897102e23661b3802eb1dfef3da98bac'),
(63, 1539908932, '308e73da2ef227de83912d6baa98089fc77f12bb', 'f8728e685b576f700cd3f71d4b7e3cc505d27e10'),
(64, 1541114352, '270e46a5c26768bb0bf7299ba08e257e1f487d48', 'ff4b4915133425f1ac7d72206713c105b490e42e'),
(65, 1541118552, 'bbd6499a8a272ceb95ec33f1ed62d6e9684f45f5', '73db084e6385b93ef101ba8c3aa0088dd253d469'),
(66, 1541123513, '3d085ff3833630c5bbf458888fbbb6dae12e5bf3', '6a5249e970ece2e1a1265c468ba92e20a28cdf03');

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
  `auth_timeout` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `can_debug` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_sessions`
--

INSERT INTO `exp_sessions` (`session_id`, `member_id`, `admin_sess`, `ip_address`, `user_agent`, `login_state`, `fingerprint`, `sess_start`, `auth_timeout`, `last_activity`, `can_debug`) VALUES
('3d085ff3833630c5bbf458888fbbb6dae12e5bf3', 1, 1, '187.131.23.196', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36', NULL, '776ca122fea09a48f5f79eef73fc9a3b', 1541130140, 0, 1541132127, 'n');

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
(1, 'Diamante Realtors', 'baja_mls', NULL, 'YTo5MTp7czoxMDoiaXNfc2l0ZV9vbiI7czoxOiJ5IjtzOjg6ImJhc2VfdXJsIjtzOjI4OiJodHRwOi8vZGlhbWFudGVyZWFsdG9ycy5jb20vIjtzOjk6ImJhc2VfcGF0aCI7czoyNzoiL2hvbWUvZGlhbWFudGUvcHVibGljX2h0bWwvIjtzOjEwOiJzaXRlX2luZGV4IjtzOjA6IiI7czo4OiJzaXRlX3VybCI7czoxMDoie2Jhc2VfdXJsfSI7czo2OiJjcF91cmwiO3M6MTk6IntiYXNlX3VybH1hZG1pbi5waHAiO3M6MTY6InRoZW1lX2ZvbGRlcl91cmwiO3M6MTc6IntiYXNlX3VybH10aGVtZXMvIjtzOjE3OiJ0aGVtZV9mb2xkZXJfcGF0aCI7czoxODoie2Jhc2VfcGF0aH10aGVtZXMvIjtzOjE1OiJ3ZWJtYXN0ZXJfZW1haWwiO3M6Mjk6Im1pZ3VlbGFudG9uaW8ucnViaW9AZ21haWwuY29tIjtzOjE0OiJ3ZWJtYXN0ZXJfbmFtZSI7czowOiIiO3M6MjA6ImNoYW5uZWxfbm9tZW5jbGF0dXJlIjtzOjc6ImNoYW5uZWwiO3M6MTA6Im1heF9jYWNoZXMiO3M6MzoiMTUwIjtzOjExOiJjYXB0Y2hhX3VybCI7czoyNjoie2Jhc2VfdXJsfWltYWdlcy9jYXB0Y2hhcy8iO3M6MTI6ImNhcHRjaGFfcGF0aCI7czoyNzoie2Jhc2VfcGF0aH1pbWFnZXMvY2FwdGNoYXMvIjtzOjEyOiJjYXB0Y2hhX2ZvbnQiO3M6MToieSI7czoxMjoiY2FwdGNoYV9yYW5kIjtzOjE6InkiO3M6MjM6ImNhcHRjaGFfcmVxdWlyZV9tZW1iZXJzIjtzOjE6Im4iO3M6MTU6InJlcXVpcmVfY2FwdGNoYSI7czoxOiJuIjtzOjE4OiJlbmFibGVfc3FsX2NhY2hpbmciO3M6MToibiI7czoxODoiZm9yY2VfcXVlcnlfc3RyaW5nIjtzOjE6Im4iO3M6MTM6InNob3dfcHJvZmlsZXIiO3M6MToibiI7czoxNToiaW5jbHVkZV9zZWNvbmRzIjtzOjE6Im4iO3M6MTM6ImNvb2tpZV9kb21haW4iO3M6MDoiIjtzOjExOiJjb29raWVfcGF0aCI7czoxOiIvIjtzOjE1OiJjb29raWVfaHR0cG9ubHkiO047czoxMzoiY29va2llX3NlY3VyZSI7TjtzOjIwOiJ3ZWJzaXRlX3Nlc3Npb25fdHlwZSI7czoxOiJjIjtzOjE1OiJjcF9zZXNzaW9uX3R5cGUiO3M6MToiYyI7czoyMToiYWxsb3dfdXNlcm5hbWVfY2hhbmdlIjtzOjE6InkiO3M6MTg6ImFsbG93X211bHRpX2xvZ2lucyI7czoxOiJ5IjtzOjE2OiJwYXNzd29yZF9sb2Nrb3V0IjtzOjE6InkiO3M6MjU6InBhc3N3b3JkX2xvY2tvdXRfaW50ZXJ2YWwiO3M6MToiMSI7czoyMDoicmVxdWlyZV9pcF9mb3JfbG9naW4iO3M6MToieSI7czoyMjoicmVxdWlyZV9pcF9mb3JfcG9zdGluZyI7czoxOiJ5IjtzOjI0OiJyZXF1aXJlX3NlY3VyZV9wYXNzd29yZHMiO3M6MToibiI7czoxOToiYWxsb3dfZGljdGlvbmFyeV9wdyI7czoxOiJ5IjtzOjIzOiJuYW1lX29mX2RpY3Rpb25hcnlfZmlsZSI7czowOiIiO3M6MTc6Inhzc19jbGVhbl91cGxvYWRzIjtzOjE6InkiO3M6MTU6InJlZGlyZWN0X21ldGhvZCI7czo4OiJyZWRpcmVjdCI7czo5OiJkZWZ0X2xhbmciO3M6NzoiZW5nbGlzaCI7czo4OiJ4bWxfbGFuZyI7czoyOiJlbiI7czoxMjoic2VuZF9oZWFkZXJzIjtzOjE6InkiO3M6MTE6Imd6aXBfb3V0cHV0IjtzOjE6Im4iO3M6MjE6ImRlZmF1bHRfc2l0ZV90aW1lem9uZSI7czowOiIiO3M6MTE6ImRhdGVfZm9ybWF0IjtzOjg6IiVuLyVqLyVZIjtzOjExOiJ0aW1lX2Zvcm1hdCI7czoyOiIxMiI7czoxMzoibWFpbF9wcm90b2NvbCI7czo0OiJtYWlsIjtzOjEzOiJlbWFpbF9uZXdsaW5lIjtzOjI6IlxuIjtzOjExOiJzbXRwX3NlcnZlciI7czowOiIiO3M6OToic210cF9wb3J0IjtOO3M6MTM6InNtdHBfdXNlcm5hbWUiO3M6MDoiIjtzOjEzOiJzbXRwX3Bhc3N3b3JkIjtzOjA6IiI7czoxNzoiZW1haWxfc210cF9jcnlwdG8iO3M6Mzoic3NsIjtzOjExOiJlbWFpbF9kZWJ1ZyI7czoxOiJuIjtzOjEzOiJlbWFpbF9jaGFyc2V0IjtzOjU6InV0Zi04IjtzOjE1OiJlbWFpbF9iYXRjaG1vZGUiO3M6MToibiI7czoxNjoiZW1haWxfYmF0Y2hfc2l6ZSI7czowOiIiO3M6MTE6Im1haWxfZm9ybWF0IjtzOjU6InBsYWluIjtzOjk6IndvcmRfd3JhcCI7czoxOiJ5IjtzOjIyOiJlbWFpbF9jb25zb2xlX3RpbWVsb2NrIjtzOjE6IjUiO3M6MjI6ImxvZ19lbWFpbF9jb25zb2xlX21zZ3MiO3M6MToieSI7czoxNjoibG9nX3NlYXJjaF90ZXJtcyI7czoxOiJ5IjtzOjE5OiJkZW55X2R1cGxpY2F0ZV9kYXRhIjtzOjE6InkiO3M6MjQ6InJlZGlyZWN0X3N1Ym1pdHRlZF9saW5rcyI7czoxOiJuIjtzOjE2OiJlbmFibGVfY2Vuc29yaW5nIjtzOjE6Im4iO3M6MTQ6ImNlbnNvcmVkX3dvcmRzIjtzOjA6IiI7czoxODoiY2Vuc29yX3JlcGxhY2VtZW50IjtzOjA6IiI7czoxMDoiYmFubmVkX2lwcyI7czowOiIiO3M6MTM6ImJhbm5lZF9lbWFpbHMiO3M6MDoiIjtzOjE2OiJiYW5uZWRfdXNlcm5hbWVzIjtzOjA6IiI7czoxOToiYmFubmVkX3NjcmVlbl9uYW1lcyI7czowOiIiO3M6MTA6ImJhbl9hY3Rpb24iO3M6ODoicmVzdHJpY3QiO3M6MTE6ImJhbl9tZXNzYWdlIjtzOjM0OiJUaGlzIHNpdGUgaXMgY3VycmVudGx5IHVuYXZhaWxhYmxlIjtzOjE1OiJiYW5fZGVzdGluYXRpb24iO3M6MjE6Imh0dHA6Ly93d3cueWFob28uY29tLyI7czoxNjoiZW5hYmxlX2Vtb3RpY29ucyI7czoxOiJ5IjtzOjEyOiJlbW90aWNvbl91cmwiO3M6MjU6IntiYXNlX3VybH1pbWFnZXMvc21pbGV5cy8iO3M6MTk6InJlY291bnRfYmF0Y2hfdG90YWwiO3M6NDoiMTAwMCI7czoxNzoibmV3X3ZlcnNpb25fY2hlY2siO3M6MToieSI7czoxNzoiZW5hYmxlX3Rocm90dGxpbmciO3M6MToibiI7czoxNzoiYmFuaXNoX21hc2tlZF9pcHMiO3M6MToieSI7czoxNDoibWF4X3BhZ2VfbG9hZHMiO3M6MjoiMTAiO3M6MTM6InRpbWVfaW50ZXJ2YWwiO3M6MToiOCI7czoxMjoibG9ja291dF90aW1lIjtzOjI6IjMwIjtzOjE1OiJiYW5pc2htZW50X3R5cGUiO3M6NzoibWVzc2FnZSI7czoxNDoiYmFuaXNobWVudF91cmwiO3M6MDoiIjtzOjE4OiJiYW5pc2htZW50X21lc3NhZ2UiO3M6NTA6IllvdSBoYXZlIGV4Y2VlZGVkIHRoZSBhbGxvd2VkIHBhZ2UgbG9hZCBmcmVxdWVuY3kuIjtzOjE3OiJlbmFibGVfc2VhcmNoX2xvZyI7czoxOiJ5IjtzOjE5OiJtYXhfbG9nZ2VkX3NlYXJjaGVzIjtzOjM6IjUwMCI7czoxMToicnRlX2VuYWJsZWQiO3M6MToieSI7czoyMjoicnRlX2RlZmF1bHRfdG9vbHNldF9pZCI7czoxOiIxIjtzOjEzOiJmb3J1bV90cmlnZ2VyIjtOO30=', 'YTo0Nzp7czoxMDoidW5fbWluX2xlbiI7czoxOiI0IjtzOjEwOiJwd19taW5fbGVuIjtzOjE6IjUiO3M6MjU6ImFsbG93X21lbWJlcl9yZWdpc3RyYXRpb24iO3M6MToibiI7czoyNToiYWxsb3dfbWVtYmVyX2xvY2FsaXphdGlvbiI7czoxOiJ5IjtzOjE4OiJyZXFfbWJyX2FjdGl2YXRpb24iO3M6NToiZW1haWwiO3M6MjM6Im5ld19tZW1iZXJfbm90aWZpY2F0aW9uIjtzOjE6Im4iO3M6MjM6Im1icl9ub3RpZmljYXRpb25fZW1haWxzIjtzOjA6IiI7czoyNDoicmVxdWlyZV90ZXJtc19vZl9zZXJ2aWNlIjtzOjE6InkiO3M6MjA6ImRlZmF1bHRfbWVtYmVyX2dyb3VwIjtzOjE6IjUiO3M6MTU6InByb2ZpbGVfdHJpZ2dlciI7czo2OiJtZW1iZXIiO3M6MTI6Im1lbWJlcl90aGVtZSI7czo3OiJkZWZhdWx0IjtzOjE0OiJlbmFibGVfYXZhdGFycyI7czoxOiJ5IjtzOjIwOiJhbGxvd19hdmF0YXJfdXBsb2FkcyI7czoxOiJuIjtzOjEwOiJhdmF0YXJfdXJsIjtzOjI1OiJ7YmFzZV91cmx9aW1hZ2VzL2F2YXRhcnMvIjtzOjExOiJhdmF0YXJfcGF0aCI7czoyNjoie2Jhc2VfcGF0aH1pbWFnZXMvYXZhdGFycy8iO3M6MTY6ImF2YXRhcl9tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE3OiJhdmF0YXJfbWF4X2hlaWdodCI7czozOiIxMDAiO3M6MTM6ImF2YXRhcl9tYXhfa2IiO3M6MjoiNTAiO3M6MTM6ImVuYWJsZV9waG90b3MiO3M6MToibiI7czo5OiJwaG90b191cmwiO3M6MzE6IntiYXNlX3VybH1pbWFnZXMvbWVtYmVyX3Bob3Rvcy8iO3M6MTA6InBob3RvX3BhdGgiO3M6MzI6IntiYXNlX3BhdGh9aW1hZ2VzL21lbWJlcl9waG90b3MvIjtzOjE1OiJwaG90b19tYXhfd2lkdGgiO3M6MzoiMTAwIjtzOjE2OiJwaG90b19tYXhfaGVpZ2h0IjtzOjM6IjEwMCI7czoxMjoicGhvdG9fbWF4X2tiIjtzOjI6IjUwIjtzOjE2OiJhbGxvd19zaWduYXR1cmVzIjtzOjE6InkiO3M6MTM6InNpZ19tYXhsZW5ndGgiO3M6MzoiNTAwIjtzOjIxOiJzaWdfYWxsb3dfaW1nX2hvdGxpbmsiO3M6MToibiI7czoyMDoic2lnX2FsbG93X2ltZ191cGxvYWQiO3M6MToibiI7czoxMToic2lnX2ltZ191cmwiO3M6Mzk6IntiYXNlX3VybH1pbWFnZXMvc2lnbmF0dXJlX2F0dGFjaG1lbnRzLyI7czoxMjoic2lnX2ltZ19wYXRoIjtzOjQwOiJ7YmFzZV9wYXRofWltYWdlcy9zaWduYXR1cmVfYXR0YWNobWVudHMvIjtzOjE3OiJzaWdfaW1nX21heF93aWR0aCI7czozOiI0ODAiO3M6MTg6InNpZ19pbWdfbWF4X2hlaWdodCI7czoyOiI4MCI7czoxNDoic2lnX2ltZ19tYXhfa2IiO3M6MjoiMzAiO3M6MTU6InBydl9tc2dfZW5hYmxlZCI7czoxOiJ5IjtzOjI1OiJwcnZfbXNnX2FsbG93X2F0dGFjaG1lbnRzIjtzOjE6InkiO3M6MTk6InBydl9tc2dfdXBsb2FkX3BhdGgiO3M6MzM6IntiYXNlX3BhdGh9aW1hZ2VzL3BtX2F0dGFjaG1lbnRzLyI7czoyMzoicHJ2X21zZ19tYXhfYXR0YWNobWVudHMiO3M6MToiMyI7czoyMjoicHJ2X21zZ19hdHRhY2hfbWF4c2l6ZSI7czozOiIyNTAiO3M6MjA6InBydl9tc2dfYXR0YWNoX3RvdGFsIjtzOjM6IjEwMCI7czoxOToicHJ2X21zZ19odG1sX2Zvcm1hdCI7czo0OiJzYWZlIjtzOjE4OiJwcnZfbXNnX2F1dG9fbGlua3MiO3M6MToieSI7czoxNzoicHJ2X21zZ19tYXhfY2hhcnMiO3M6NDoiNjAwMCI7czoxOToibWVtYmVybGlzdF9vcmRlcl9ieSI7czoxMToidG90YWxfcG9zdHMiO3M6MjE6Im1lbWJlcmxpc3Rfc29ydF9vcmRlciI7czo0OiJkZXNjIjtzOjIwOiJtZW1iZXJsaXN0X3Jvd19saW1pdCI7czoyOiIyMCI7czoyODoiYXBwcm92ZWRfbWVtYmVyX25vdGlmaWNhdGlvbiI7TjtzOjI4OiJkZWNsaW5lZF9tZW1iZXJfbm90aWZpY2F0aW9uIjtOO30=', 'YTo2OntzOjIyOiJlbmFibGVfdGVtcGxhdGVfcm91dGVzIjtzOjE6InkiO3M6MTE6InN0cmljdF91cmxzIjtzOjE6InkiO3M6ODoic2l0ZV80MDQiO3M6MTA6Im1haW4vaW5kZXgiO3M6MTk6InNhdmVfdG1wbF9yZXZpc2lvbnMiO3M6MToibiI7czoxODoibWF4X3RtcGxfcmV2aXNpb25zIjtzOjE6IjUiO3M6MTg6InRtcGxfZmlsZV9iYXNlcGF0aCI7Tjt9', 'YToxMzp7czoyMzoiYXV0b19hc3NpZ25fY2F0X3BhcmVudHMiO3M6MToieSI7czoyMzoiYXV0b19jb252ZXJ0X2hpZ2hfYXNjaWkiO3M6MToibiI7czoyMzoiY29tbWVudF9lZGl0X3RpbWVfbGltaXQiO047czoyNzoiY29tbWVudF9tb2RlcmF0aW9uX292ZXJyaWRlIjtOO3M6MjI6ImNvbW1lbnRfd29yZF9jZW5zb3JpbmciO047czoxNToiZW5hYmxlX2NvbW1lbnRzIjtzOjE6InkiO3M6MTg6ImltYWdlX2xpYnJhcnlfcGF0aCI7czowOiIiO3M6MjE6ImltYWdlX3Jlc2l6ZV9wcm90b2NvbCI7czozOiJnZDIiO3M6MjI6Im5ld19wb3N0c19jbGVhcl9jYWNoZXMiO3M6MToieSI7czoyMjoicmVzZXJ2ZWRfY2F0ZWdvcnlfd29yZCI7czo4OiJjYXRlZ29yeSI7czoxNjoidGh1bWJuYWlsX3ByZWZpeCI7czo1OiJ0aHVtYiI7czoxNzoidXNlX2NhdGVnb3J5X25hbWUiO3M6MToibiI7czoxNDoid29yZF9zZXBhcmF0b3IiO3M6NDoiZGFzaCI7fQ==', 'YToyOntzOjc6ImVtYWlsZWQiO2E6MDp7fXM6MzY6Ii9ob21lL2RpYW1hbnRlL3B1YmxpY19odG1sL2luZGV4LnBocCI7czozMjoiN2RkMGIzZmY1MDNlYTllYjE1NTMzMzVjNmY4MzVjODciO30=', 'YToxOntpOjE7YTozOntzOjQ6InVyaXMiO2E6MDp7fXM6OToidGVtcGxhdGVzIjthOjA6e31zOjM6InVybCI7czoxMToie2Jhc2VfdXJsfS8iO319');

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
(1, 0, 'snp_blog_list', '<div class=\"entry\">\n	{!-- title --}\n	<h2><a href=\"{path=\'{p_url}/{p_url_entry}/{url_title}\'}\">{title}</a></h2>\n	<p><b>on:</b> {entry_date format=\'%n/%j/%Y\'}, <b>by:</b> <a href=\"{path=\'member/{author_id}\'}\">{author}</a>, <a href=\"{path=\'{p_url}/{p_url_entry}/{url_title}#comments\'}\">{comment_total} comment{if comment_total != 1}s{/if}</a></p>\n</div>', 1537487128),
(2, 0, 'snp_blog_list_paginate', '{!-- pagination --}\n{paginate}\n	<div class=\"paginate\">\n		{pagination_links page_padding=\'1\'}\n			<ul>\n				{previous_page}\n					<li><a href=\"{pagination_url}\">Previous Page</a></li>\n				{/previous_page}\n				{page}\n					<li><a href=\"{pagination_url}\"{if current_page} class=\"act\"{/if}>{pagination_page_number}</a></li>\n				{/page}\n				{next_page}\n					<li><a href=\"{pagination_url}\">Next Page</a></li>\n				{/next_page}\n			</ul>\n		{/pagination_links}\n	</div>\n{/paginate}', 1537487128),
(3, 0, 'snp_main_nav', '					<ul class=\"main-nav\">\n						<li><a{if segment_1 == \'\'} class=\"act\"{/if} href=\"{homepage}\">Home</a></li>\n						<li><a{if segment_1 == \'about\'} class=\"act\"{/if} href=\"{path=\'about\'}\">About</a></li>\n						<li><a{if segment_1 == \'blog\'} class=\"act\"{/if} href=\"{path=\'blog\'}\">Blog</a></li>\n						<li><a{if segment_1 == \'contact\'} class=\"act\"{/if} href=\"{path=\'contact\'}\">Contact</a></li>\n					</ul>', 1537487128);

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
(13, 1, 'y', 'pm_inbox_full', 'Your private message mailbox is full', 'email', 'private_messages', '{recipient_name},\n\n{sender_name} has just attempted to send you a Private Message,\nbut your inbox is full, exceeding the maximum of {pm_storage_limit}.\n\nPlease log in and remove unwanted messages from your inbox at:\n{site_url}', NULL, 1515540989, 0),
(14, 1, 'y', 'password_changed_notification', 'Password changed', 'email', 'members', '{name},\n\nYour password was just changed.\n\nIf you didn\'t make this change yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}', NULL, 1537475741, 0),
(15, 1, 'y', 'email_changed_notification', 'Email address changed', 'email', 'members', '{name},\n\nYour email address has been changed, and this email address is no longer associated with your account.\n\nIf you didn\'t make this change yourself, please contact an administrator right away.\n\n{site_name}\n{site_url}', NULL, 1537475741, 0);

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
(1, 1, 2, 2, 'cguemez', 18, 0, 0, 15, 1541131980, 0, 1515541007, 0, 0, 0, 1541733753);

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
(22, 1, 8, 'index', 'webpage', '{layout=\'layouts/_main-layout\'}\n\n{layout:set name=\"styles\"}\n    <style>\n        #home-carousel {\n            /*top:-64px;*/\n            height:100vh;\n        }\n        #home-carousel .carousel-item{\n            height:100%;\n            background-position: center center;\n            background-size: cover;\n        }\n    </style>\n{/layout:set}\n\n<?php\n    require($_SERVER[\'DOCUMENT_ROOT\'] . \"/app/config.php\");\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/flexmlsAPI.php\");\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/lang/lang.php\");\n    //$lang = substr($_SERVER[\'HTTP_ACCEPT_LANGUAGE\'], 0, 2);\n    $api = new flexmlsAPI(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\");\n    $api->SetApplicationName(\"Diamante-MLS-Search/1.0\");\n    $api->SetDeveloperMode(false);\n    $auth = $api->Authenticate();\n    if ($auth === false) api_error_thrown($api);\n    $city = isset($cities[\"{segment_1}\"]) ? \"{segment_1}\" : \"all\";\n    $city_name = isset($cities[$city][\"name\"]) ? $cities[$city][\"name\"] : \"\";\n    $property_type = \"all\";\n    $list_price = \"all\";\n    $portal = 0;\n    $language = isset($_GET[\'lang\']) ? trim($_GET[\'lang\']) : \'en\';\n\n    $protocol = strtolower(substr($_SERVER[\"SERVER_PROTOCOL\"],0,5))==\'https://\'?\'https://\':\'http://\';\n    $hostName = $_SERVER[\'HTTP_HOST\'];\n    $base_url = $protocol.$hostName;\n    \n    $exchange_rate = 1;\n\n    $parameters = null;\n    $listings = null;\n    \n    if($language == \'es\') {\n        $xml = simplexml_load_file(\"http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml\")->Cube[0]->Cube[0];\n        $usd = 0;\n        $mxn = 0;\n        foreach ($xml->Cube as $item) {\n            if((string)$item[\'currency\'] === \'USD\')\n                $usd = (real)$item[\'rate\'];\n                \n            if((string)$item[\'currency\'] === \'MXN\')\n                $mxn = (real)$item[\'rate\'];\n        }\n\n        $exchange_rate = $mxn/$usd;\n    }\n\n    $cityQuery = \"\";\n    if (isset($cities[$city][\"query\"])) $cityQuery = $cities[$city][\"query\"];\n\n    $parameters = array(\"_filter\" => $cityQuery, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 8, \"_orderby\" => \'-ListPrice\');\n    $listings = $api->GetMyListings($parameters);\n    //$listings = $api->GetMyListings();\n    //$listings = $api->GetListings($parameters);\n?>\n<div id=\"home-carousel\" class=\"carousel carousel-slider\">\n    <?php\n        $images = [];\n        /*if ($city_name == \"\") {\n            foreach($cities as $key => $item) {\n                $imgs = array_slice(scandir($_SERVER[\'DOCUMENT_ROOT\'].\"/images/layout/slider/hd/\".$key),2);\n                foreach ($imgs as $img) {\n                    $i = [\"url\" => $key.\"/\".$img, \"caption\" => $item[\"name\"]];\n                    array_push($images,$i);\n                }\n            }\n            shuffle($images); \n            foreach($images as $image) { ?>\n                <a class=\"carousel-item\" href=\"#\" style=\"background-image: url(\'/images/layout/slider/hd/<?=$image[\"url\"]?>\')\">\n                    <h3 class=\"slide-caption\"><?=$image[\"caption\"]?></h3>\n                </a>\n            <?php }\n        } else {\n            $images = array_slice(scandir($_SERVER[\'DOCUMENT_ROOT\'].\"/images/layout/slider/hd/\".$city),2); //array_slice to get rid of . and .. elements\n            shuffle($images);\n            foreach($images as $image) { ?>\n                <a class=\"carousel-item\" href=\"#\" style=\"background-image: url(\'/images/layout/slider/hd/<?=$city?>/<?=$image?>\')\">\n                    <h3 class=\"slide-caption\"><?=$city_name?></h3>\n                </a>\n            <?php }\n        }*/\n        /*poner solo las imagenes que estan en la carpeta raiz para todas las ciudades y sin el nombre de la ciudad (temporalmente) */\n        $images = array_slice(scandir($_SERVER[\'DOCUMENT_ROOT\'].\"/images/layout/slider/min/\"),2); //array_slice to get rid of . and .. elements\n            shuffle($images);\n            foreach($images as $image) { ?>\n                <a class=\"carousel-item\" href=\"#\" style=\"background-image: url(\'/images/layout/slider/min/<?=$image?>\')\"></a>\n            <?php }\n    ?>\n</div><!--home-carousel-->\n\n    <div class=\"card quickSearch\">\n        <div class=\"card-content\">\n            <div class=\"container\">\n                <div class=\"card-title center\">\n                    Quick Search <?php if ($city_name != \"\") echo \" in \".$city_name; ?> \n                </div>\n                <div class=\"row\">\n                    <form class=\"col s12\">\n                    <div class=\"row\">\n                        <!--div class=\"input-field col s12 m6 l3\">\n                            <input id=\"mls_number\" type=\"text\" class=\"validate\">\n                            <label for=\"mls_number\">MLS Number</label>\n                        </div-->\n                        <div class=\"input-field col s12 m6 l3\">\n                            <select id=\"city\">\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\n                                <?php \n                                    foreach($cities as $k => $i) {\n                                ?>\n                                        <option value=\"<?=$k?>\" <?=$k==$city ? \"selected\" : \"\"?>><?=$i[\"name\"]?></option>\n                                <?php\n                                    }\n                                ?>\n                            </select>\n                            <label>City</label>\n                        </div>\n                        <div class=\"input-field col s12 m6 l3\">\n                            <select id=\"property_type\">\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\n                                <option value=\"condos\" <?php echo $property_type == \"condos\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'condos\']; ?></option>\n                                <option value=\"houses\" <?php echo $property_type == \"houses\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'houses\']; ?></option>\n                                <option value=\"townhouses\" <?php echo $property_type == \"townhouses\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'townhouses\']; ?></option>\n                                <option value=\"land\" <?php echo $property_type == \"land\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'land\']; ?></option>\n                                <option value=\"commercial\" <?php echo $property_type == \"commercial\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'commercial\']; ?></option>\n                                <option value=\"business\" <?php echo $property_type == \"business\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'business\']; ?></option>\n                                <option value=\"multifamily\" <?php echo $property_type == \"multifamily\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'multifamily\']; ?></option>\n                            </select>\n                            <label>Property type</label>\n                        </div>\n                        <div class=\"input-field col s12 m6 l3\">\n                            <select id=\"list_price\">\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\n                                <option value=\"0\" <?php echo $list_price == \"0\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'under\']; ?> 200,000 USD</option>\n                                <option value=\"200K\" <?php echo $list_price == \"200K\" ? \"selected\" : \"\"?>>200,000 - 500,000 USD</option>\n                                <option value=\"500K\" <?php echo $list_price == \"500K\" ? \"selected\" : \"\"?>>500,000 - 1,000,000 USD</option>\n                                <option value=\"1M\" <?php echo $list_price == \"1M\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'over\']; ?> 1,000,000 USD</option>\n                            </select>\n                            <label>Price</label>\n                        </div>\n                        <div class=\"input-field col s12 m6 l3 center\">\n                            <a id=\"searchBtn\" class=\"btn waves-effect waves-light white blue-text text-darken-4\">Search\n                                <i class=\"material-icons right\">search</i>\n                            </a>\n                        </div>\n                    </div>\n                </div><!--row-->\n            </div><!--container-->\n        </div>\n    </div><!--quickSearch card-->\n\n<?php\nif ($city_name != \"\") {\n?>\n    {exp:channel:entries channel=\"communities\" limit=\"1\" url_title=\"{segment_1}\"}\n    <div class=\"row\">\n        <div class=\"col s12 m3\"><hr></div>\n        <div class=\"col s12 m6\"><h2>About {title}</h2></div>\n        <div class=\"col s12 m3\"><hr></div>\n    </div>\n    <div class=\"container\">\n        {communities_about}\n    </div>\n    {/exp:channel:entries}\n<?php\n}\n?>\n\n<div class=\"spacer-100\"></div>\n\n<div class=\"container ctas\">\n    <div class=\"row\">\n        <div class=\"col s12 m6 l3\">\n            <div class=\"card\">\n                <div class=\"card-image\">\n                    <a href=\"{path=themes}/ee/site/default/asset/img/common/LaPazMexico-LandOfEnchantment.pdf\" target=\"_blank\">\n                        <img src=\"/images/layout/cta1.jpg\">\n                        <div class=\"card-overlay\"></div>\n                        <p class=\"card-title\"><span class=\"t1\">Welcome to</span><br><span class=\"t2\">la paz</span></p>\n                    </a>\n                </div>\n            </div>\n        </div>\n        <div class=\"col s12 m6 l3\">\n            <div class=\"card\">\n                <div class=\"card-image\">\n                    <a href=\"\">\n                        <img src=\"/images/layout/cta2.jpg\">\n                        <div class=\"card-overlay\"></div>\n                        <p class=\"card-title\"><span class=\"t1\">What\'s my</span><br><span class=\"t2\">home worth?</span></p>\n                    </a>\n                </div>\n            </div>\n        </div>\n        <div class=\"col s12 m6 l3\">\n            <div class=\"card\">\n                <div class=\"card-image\">\n                    <a href=\"\">\n                        <img src=\"/images/layout/cta3.jpg\">\n                        <div class=\"card-overlay\"></div>\n                        <p class=\"card-title\"><span class=\"t1\">Help me</span><br><span class=\"t2\">relocate</span></p>\n                    </a>\n                </div>\n            </div>\n        </div>\n        <div class=\"col s12 m6 l3\">\n            <div class=\"card\">\n                <div class=\"card-image\">\n                    <a href=\"\">\n                        <img src=\"/images/layout/cta4.jpg\">\n                        <div class=\"card-overlay\"></div>\n                        <p class=\"card-title\"><span class=\"t1\">Sign up for</span><br><span class=\"t2\">email updates</span></p>\n                    </a>\n                </div>\n            </div>\n        </div>\n    </div>\n</div>\n\n<div class=\"row\">\n    <div class=\"col s12 m3\"><hr></div>\n    <div class=\"col s12 m6\"><h2>Featured Listings</h2></div>\n    <div class=\"col s12 m3\"><hr></div>\n</div>\n\n<div class=\"carousel featured\">\n    <?php \n    shuffle($listings);\n    foreach($listings as $listing) {\n        if($language == \'es\'){\n            $price = \"$\" . number_format($listing[\"StandardFields\"][\"ListPrice\"] * $exchange_rate,2) . \" MXN\";\n        }\n        else{\n            $price = \"$\" . number_format($listing[\"StandardFields\"][\"ListPrice\"],2) . \" USD\";\n        }\n\n        if (sizeof($listing[\"StandardFields\"][\"Photos\"]) > 0) {\n            $thumb = $listing[\"StandardFields\"][\"Photos\"][0][\"Uri800\"];\n        } else {\n            $thumb = \'http://www.placehold.it/800x250?text=NO+PHOTO\';\n        }\n\n        $stai = $listing[\"StandardFields\"][\"StreetAdditionalInfo\"];\n        $stnu = $listing[\"StandardFields\"][\"StreetNumber\"];\n        $stna = $listing[\"StandardFields\"][\"StreetName\"];\n        //echo $stai . $stnu . $stna;\n        $street = $stai != \'********\' ? $stai . \' \' : \'\';\n        $street .= $stnu != \'********\' ? $stnu . \' \' : \'\';\n        $street .= $stna != \'********\' ? $stna . \' \' : \'\'; ?>\n\n        <div class=\"card hoverable sticky-action carousel-item\">\n            <div class=\"card-image\" style=\"height:100%; width:100%; background-repeat: no-repeat; background-size: cover; background-position: center;background-image:url(\'<?php echo $thumb ?>\');\">\n                <a href=\"<?php echo $base_url.\"/listing/detail/\".$listing[\"StandardFields\"][\"ListingId\"] ?>\"\n                    <span class=\"card-title\"><?php echo $price ?></span><br>\n                    <span class=\"truncate\"><?php echo $street ?></span>\n                </a>\n            </div>\n        </div>\n    <?php } ?>\n</div>\n\n\n<div class=\"row welcome\" style=\"background-color:#dbe5ef; /*background-image: url(\'/images/layout/welcome-bg.jpg\')*/\">\n    <div class=\"container\">\n        <div class=\"col s12 m6\">\n            <p class=\"center\"><img src=\"/images/logo2.png\"></p>\n            <hr>\n            <p>Diamante Realtors has been in business for 15 years in the Baja.  Under the able leadership of its broker, Brian Westerlund (originally from Vancouver, Canada) Diamante is the premiere brokerage for foreign and Mexican buyers in La Paz.</p>\n\n            <p>With 15 bilingual agents in total and offices in Cabo, La Ventana and La Paz, Diamante works throughout the region providing honest and professional advice and assistance to buyers and sellers.  We have completed over 700 sales and have represented buyers and sellers alike in negotiating all kinds of closings.  We have successfully worked with eight developers and have sold out numerous projects. Our most recent project Torres Cantera condominiums, (84 units) sold out in under 2 years.  We worked with the developer from design stage to closing.</p> \n\n            <p>Our expertise and knowledge of real estate in the Baja is legendary.  We know every aspect of the business and we are well connected to notaries, other brokers, accountants, closing attorneys and tradespeople.  We actively work to protect our clients from any pitfall we may encounter and we work to ensure that our clients not only find the perfect property but are happily settled in it as well.  Most of our clients become friends… and recommend us to their friends.  That is something we are proud of!</p>\n\n            <p>We are proud of our team and if you are looking for the best, the most knowledgeable and honest brokerage in the Baja … you have come to the right place.</p>\n\n            <p>Welcome home!</p>\n</p>\n        </div>\n    </div>\n</div>\n\n\n<div class=\"row\">\n    <div class=\"col s12 m3\"><hr></div>\n    <div class=\"col s12 m6\"><h2>Featured Developments</h2></div>\n    <div class=\"col s12 m3\"><hr></div>\n</div>\n\n<div class=\"container ctas\">\n    <div class=\"row\">\n        <div class=\"col s12 m12 l4\">\n            <div class=\"card\">\n                <div class=\"card-image\">\n                    <a href=\"\">\n                        <img src=\"/images/layout/terrazas.jpg\">\n                        <div class=\"card-overlay\"></div>\n                        <p class=\"card-title\"><span class=\"t2\">terrazas by alttus</span></p>\n                    </a>\n                </div>\n            </div>\n        </div>\n        <div class=\"col s12 m12 l4\">\n            <div class=\"card\">\n                <div class=\"card-image\">\n                    <a href=\"\">\n                        <img src=\"/images/layout/costa-baja.jpg\">\n                        <div class=\"card-overlay\"></div>\n                        <p class=\"card-title\"><span class=\"t2\">costa baja resort</span></p>\n                    </a>\n                </div>\n            </div>\n        </div>\n        <div class=\"col s12 m12 l4\">\n            <div class=\"card\">\n                <div class=\"card-image\">\n                    <a href=\"\">\n                        <img src=\"/images/layout/pedregal.jpg\">\n                        <div class=\"card-overlay\"></div>\n                        <p class=\"card-title\"><span class=\"t2\">pedregal de la paz</span></p>\n                    </a>\n                </div>\n            </div>\n        </div>\n    </div>\n</div>\n\n{layout:set name=\"scripts\"}\n    <script>\n        $(\'.carousel.carousel-slider\').carousel({fullWidth: true});\n        autoplay();\n        function autoplay() {\n            $(\'.carousel\').carousel(\'next\');\n            setTimeout(autoplay, 5000);\n        }\n        $(\'.carousel.featured\').carousel();\n\n        $(\"#searchBtn\").click(function(){\n            var redirect = \"/listing\";\n                redirect += \"/\"+$(\"#city\").val();\n                redirect += \"/\"+$(\"#property_type\").val();\n                redirect += \"/\"+$(\"#list_price\").val();\n            console.log(redirect);\n            $(this).addClass(\'disabled\');\n            window.location.href = redirect;\n        });\n    </script>\n{/layout:set}', NULL, 1541127325, 1, 'n', 0, '24', 'n', 'y', 'o', 0, 'n'),
(23, 1, 9, 'index', 'webpage', '', NULL, 1536097852, 0, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(24, 1, 9, '_main-layout', 'webpage', '<!doctype html>\n<html dir=\"ltr\" lang=\"{lang}\">\n	<head>\n		<meta charset=\"utf-8\">\n		<title>{layout:title}{site_name}</title>\n		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n\n		<!-- meta data -->\n		{if layout:meta_author}<meta name=\"author\" content=\"{layout:meta_author}\">{/if}\n		{if layout:meta_description}<meta name=\"description\" content=\"{layout:meta_description}\">{/if}\n\n		<!-- open graph common -->\n		<meta property=\"og:site_name\" content=\"{site_name}\">\n		<meta property=\"og:type\" content=\"website\">\n		<meta property=\"og:image\" content=\"{theme_folder_url}site/default/asset/img/og/default.jpg\"> {!-- square, 50*50 min --}\n\n		{if layout:og_title != \'\'}\n			<!-- open graph per page -->\n			<meta property=\"og:title\" content=\"{layout:og_title}\">\n			<meta property=\"og:url\" content=\"{layout:og_url}\">\n			<meta property=\"og:description\" content=\"{layout:og_description}\">\n		{/if}\n		<link href=\"/favicon1.ico\" rel=\"shortcut icon\">\n		<!-- Font Awesome -->\n    	<!--link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\"-->\n		<!--Import Google Icon Font-->\n      	<link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\n		<!--Import materialize.css-->\n  		<!--link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css\"-->\n		<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css\">\n		<!-- Bootstrap Core -->\n        <!--link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css\" integrity=\"sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy\" crossorigin=\"anonymous\"-->\n		<!-- Material Design Bootstrap -->\n		<!--link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/css/mdb.min.css\"-->\n		<!--<link href=\"{theme_folder_url}site/default/asset/style/default.min.css\" title=\"common-styles\" rel=\"stylesheet\">-->\n		<!-- <link href=\"{theme_folder_url}site/default/asset/style/debug.min.css\" title=\"common-styles\" rel=\"stylesheet\"> -->\n		<!-- Custom Styles -->\n        <link href=\"/asset/css/custom.css\" title=\"common-styles\" rel=\"stylesheet\">\n		{layout:styles}\n	</head>\n	<?php\n		require($_SERVER[\'DOCUMENT_ROOT\'] . \"/app/config.php\");\n	?>\n    <body class=\"blue-grey lighten-5\">\n		<div class=\"navbar-fixed\">\n			<nav class=\"nav-center\">\n				<div class=\"nav-wrapper center-align\">\n					<div class=\"brand-logo center hide-on-large-only\">\n						<a href=\"/\"><img src=\"/images/logo2.png\"></a>\n					</div>\n					<a href=\"#\" data-target=\"mobile-demo\" data-activates=\"mobile-demo\" class=\"sidenav-trigger button-collapse\"><i class=\"material-icons\">menu</i></a>\n					<ul class=\"hide-on-med-and-down\">\n						<li>\n							<a href=\"/\" class=\"logo\">\n								<img src=\"/images/logo2.png\">\n							</a>\n						</li>\n						<li>\n							<a href=\"#\">\n								<?=$lang[\"agents\"]?>\n							</a>\n						</li>\n						<li>\n							<a href=\"/properties\">\n								<?=$lang[\"properties\"]?>\n							</a>\n						</li>\n						<li>\n							<a class=\"dropdown-trigger\" href=\"#\" data-target=\"buyers-dropdown\">\n							<?=$lang[\"buyers\"].\"/\".$lang[\"sellers\"]?>\n							</a>\n						</li>\n						\n						<li>\n							<a class=\"dropdown-trigger\" href=\"#\" data-target=\"locations-dropdown\">\n								<?=$lang[\"communities\"]?>\n							</a>\n						</li>\n						<li>\n							<a href=\"#\">\n								<?=$lang[\"resources\"]?>\n							</a>\n						</li>\n						<li>\n							<a href=\"/contact\">\n								<?=$lang[\"contact\"]?>\n							</a>\n						</li>\n						<!--li>\n							<?php \n							echo $def_lang;\n							if ($language == \'en\') { ?>\n							<a href=\"<?=$_SERVER[\'REQUEST_URI\'] . \'/esp\' ?>\">Español</a>\n							<?php } else { ?>\n							<a href=\"\">English</a>\n							<?php } ?>\n						</li-->\n					</ul>	\n					\n				</div>\n			</nav>\n		</div>\n\n		<div id=\"buyers-dropdown\" class=\"subnav\">\n			<ul>\n				<li><a href=\"{path=\'article/buyers\'}\">buyers</a></li>\n				<li><a href=\"#!\">sellers</a></li>\n			</ul>\n		</div>\n\n		<div id=\"locations-dropdown\" class=\"subnav\">\n			<ul>\n				<?php\n					foreach ($cities as $k => $i) {\n				?>\n					<li><a href=\"/<?=$k?>\"><?=$i[\"name\"]?></a></li>\n				<?php\n					}\n				?>\n			</ul>\n		</div>\n		\n		<ul class=\"sidenav side-nav\" id=\"mobile-demo\">\n			<li class=\"center\">\n				<img src=\"/images/diamante_shiny.jpg\" height=\"100\">\n			</li>\n			<li>\n				<a href=\"#\">\n					<?=$lang[\"agents\"]?>\n				</a>\n			</li>\n			<li>\n				<a href=\"/listing\">\n					<?=$lang[\"properties\"]?>\n				</a>\n			</li>\n			<li>\n				<a class=\"subnav-trigger\" href=\"#\" data-target=\"buyers-dropdown\">\n				<?=$lang[\"buyers\"].\"/\".$lang[\"sellers\"]?>\n				</a>\n			</li>\n			<li>\n				<a class=\"subnav-trigger\" href=\"#\" data-target=\"locations-dropdown\">\n					<?=$lang[\"communities\"]?>\n				</a>\n			</li>\n			<li>\n				<a href=\"#\">\n					<?=$lang[\"resources\"]?>\n				</a>\n			</li>\n			<li>\n				<a href=\"#\">\n					<?=$lang[\"contact\"]?>\n				</a>\n			</li>\n		</ul>\n		\n		\n\n\n\n        \n		{layout:contents}\n		\n		<footer>\n			<div class=\"footer-top\"></div>\n			<div class=\"footer-bottom\">\n				<p class=\"center\">© 2015 Diamante Asociados S. de R. L. de C. V.</p>\n			</div>\n		</footer>\n\n		<!-- JQuery -->\n		<script src=\"https://code.jquery.com/jquery-3.2.1.min.js\" integrity=\"sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=\" crossorigin=\"anonymous\"></script>\n		<!-- Materialize -->\n  		<!--script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js\"></script-->\n		<script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js\"></script>\n        <!-- Bootstrap dropdown -->\n		<!--script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js\" integrity=\"sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q\" crossorigin=\"anonymous\"></script-->\n		<!-- Bootstrap core JavaScript -->\n        <!--script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js\" integrity=\"sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4\" crossorigin=\"anonymous\"></script-->\n		<!-- MDB core JavaScript -->\n		<!--script src=\"https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.4.5/js/mdb.min.js\" crossorigin=\"anonymous\"></script-->\n		<script>\n			$( document ).ready(function(){\n				/* 1.0.0-rc.2 */\n				/*\n				$(\".sidenav\").sidenav();\n				$(\'select\').formSelect();\n				*/\n				/* 0.100.2 */\n				$(\".sidenav-trigger\").sideNav();\n				$(\'select\').material_select();\n\n				boundDropdowns();\n				/*$(\'.carousel.fullWidth\').carousel({\n					fullWidth:true,\n					indicators:true\n				});\n				$(\'.materialboxed\').materialbox();*/\n				$(\'.slider\').slider();\n			});\n			$( document ).on(\"scroll\", function(){\n				//changes navbar alpha on scroll\n				var scroll = $( document ).scrollTop();\n				$(\"nav, .subnav ul\").css(\"background-color\",\"rgba(255,255,255,\"+(scroll + 80) / 100 +\")\");\n				if (scroll < 240) {\n					$(\"nav ul\").css(\"margin\", 30 - (scroll * .1) + \"px 0\");\n					$(\".subnav\").css(\"padding-top\", $(\".nav-center\").height());\n					//$(\".logo img\").height(100 - (scroll/6));\n				}\n			});\n			function boundDropdowns() {\n				$(\".dropdown-trigger\").hover(function(){\n					pos = $(this).position();\n					width = $(this).outerWidth();\n					height = $(this).height();\n					//margin = $(this).css(\"margin-left\");\n					//top = $(\".nav-center\").height();\n					//console.log($(\".nav-center\").height());\n					subnav = $(\"#\"+$(this).data(\"target\"));\n					center = pos.left + (width/2);\n					left = center - (subnav.outerWidth()/2);\n					subnav.css(\"padding-top\", $(\".nav-center\").height() + \"px\").css(\"left\", left).css(\"min-width\", width);\n					subnav.slideDown(\"normal\", function(){\n						$(\".subnav\").css(\"z-index\",998);\n					});\n					\n				}, function(){\n					//$(\"#\"+$(this).data(\"target\")).slideUp();\n					dummy = 0;\n				});\n				$(\".subnav\").hover(function(){\n					//nothing;\n					dummy = 0;\n				},function(){\n					$(\".subnav\").css(\"z-index\", 990);\n					$(this).slideUp();\n				});\n				$(\".subnav\").hide();\n			}\n		</script>\n		{layout:scripts}\n	</body>\n</html>', NULL, 1539310107, 1, 'n', 0, '24', 'n', 'y', 'o', 0, 'n');
INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`) VALUES
(25, 1, 10, 'index', 'webpage', '{layout=\'layouts/_main-layout\'}\n\n{layout:set name=\"styles\"}\n    <style>\n        .search-card .card-content {\n            padding-bottom:0;\n        }\n        .search-car .card-content row {\n            margin-bottom:0;\n        }\n        main {\n            margin-top: 150px;\n        }\n    </style>\n{/layout:set}\n\n<?php\n    error_reporting( E_ALL ); //debug\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/flexmlsAPI.php\");\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/lang/lang.php\");\n    $protocol = strtolower(substr($_SERVER[\"SERVER_PROTOCOL\"],0,5))==\'https://\'?\'https://\':\'http://\';\n    $hostName = $_SERVER[\'HTTP_HOST\'];\n    $base_url = $protocol.$hostName;\n    $api = new flexmlsAPI(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\");\n    $api->SetApplicationName(\"Diamante-MLS-Search/1.0\");\n    $api->SetDeveloperMode(false);\n    $auth = $api->Authenticate();\n    if ($auth === false) api_error_thrown($api);\n\n    $portal = isset($_GET[\'portal\']) ? trim($_GET[\'portal\']) : 0;\n    $mls_number = isset($_GET[\'mls_number\']) ? trim($_GET[\'mls_number\']) : \'\';\n    //$city = isset($_GET[\'city\']) ? trim($_GET[\'city\']) : \'\';\n    $city = \"{segment_2}\" != \"\" ? \"{segment_2}\" : \"all\";\n    //$property_type = isset($_GET[\'property_type\']) ? trim($_GET[\'property_type\']) : \'\';\n    $property_type  = \"{segment_3}\" != \"\" ? \"{segment_3}\" : \"all\";\n    //$list_price = isset($_GET[\'list_price\']) ? trim($_GET[\'list_price\']) : \'\';\n    $list_price = \"{segment_4}\" != \"\" ? \"{segment_4}\" : \"all\";\n    $development = isset($_GET[\'development\']) ? trim($_GET[\'development\']) : \'\';\n    $language = isset($_GET[\'lang\']) ? trim($_GET[\'lang\']) : \'en\';\n    //$page = isset($_GET[\'page\']) ? trim($_GET[\'page\']) : 1;\n    $page = is_numeric(\"{segment_5}\") ? \"{segment_5}\"  : 1;\n    $featured = isset($_GET[\'featured\']) ? $_GET[\'featured\'] : 0;\n\n    $exchange_rate = 1;\n    $parameters = null;\n    $listings = null;\n    \n    if($language == \'es\') {\n        $xml = simplexml_load_file(\"http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml\")->Cube[0]->Cube[0];\n        $usd = 0;\n        $mxn = 0;\n        foreach ($xml->Cube as $item) {\n            if((string)$item[\'currency\'] === \'USD\')\n                $usd = (real)$item[\'rate\'];\n                \n            if((string)$item[\'currency\'] === \'MXN\')\n                $mxn = (real)$item[\'rate\'];\n        }\n\n        $exchange_rate = $mxn/$usd;\n    }\n\n    switch ($city) {\n        case \"la-paz\" : $cityQuery = \"City Eq \'La Paz\'\"; break;\n        case \"la-ventana\" : $cityQuery = \"SubdivisionName Eq \'La Ventana\' Or SubdivisionName Eq \'El Sargento\'\"; break;\n        case \"cabo-san-lucas\" : $cityQuery = \"City Eq \'Cabo San Lucas\'\"; break;\n        case \"cabo-corridor\" : $cityQuery = \"City Eq \'Cabo Corridor\'\"; break;\n        case \"san-jose-del-cabo\" : $cityQuery = \"City Eq \'San Jose del Cabo\'\"; break;\n        case \"san-jose-corridor\" : $cityQuery = \"City Eq \'San Jose Corridor\'\"; break;\n        case \"east-cape\" : $cityQuery = \"City Eq \'East Cape\' Or City Eq \'Los Barriles\'\"; break;\n        case \"pacific-side\" : $cityQuery = \"City Eq \'Pacific Or City Eq \'Pacific Side\' Or City Eq \'Todos Santos\'\"; break;\n        default : $cityQuery = \"\";\n    }\n\n    switch ($property_type) {\n        case \"condos\" : $propertyQuery = \"A\"; break;\n        case \"houses\" : $propertyQuery = \"B\"; break;\n        case \"townhouses\" : $propertyQuery = \"C\"; break;\n        case \"land\" : $propertyQuery = \"E\"; break;\n        case \"commercial\" : $propertyQuery = \"F\"; break;\n        case \"business\" : $propertyQuery = \"G\"; break;\n        case \"multifamily\" : $propertyQuery = \"I\"; break;\n        default : $propertyQuery = \"\";\n    }\n\n    switch ($list_price) {\n        case \"0\" : $listQuery = \"Le 200000.0\"; break;\n        case \"200K\" : $listQuery = \"Ge 200000.0 And ListPrice Le 500000.0\"; break;\n        case \"500K\" : $listQuery = \"Ge 500000.0 And ListPrice Le 1000000.0\"; break;\n        case \"1M\" : $listQuery = \"Ge 1000000.0\"; break;\n        default : $listQuery = \"\";\n    }\n\n\n    if($mls_number != \'\') {\n        $parameters = array(\"_filter\" => \"ListingId Eq \'$mls_number\'\", \"_expand\" => \'PrimaryPhoto\', \"_limit\" => \"1\", \"_pagination\" => true);\n        $listings = $api->GetListings($parameters);\n    }\n    else {\n        $filter = \'\';\n        $p_type = ($propertyQuery != \"\") ? \"PropertyType Eq \'$propertyQuery\'\": \"Not PropertyType Eq \'H\'\";\n        $filter .= ($filter != \'\') ? \" And $p_type\" : \"$p_type\" ;\n        $filter .= ($cityQuery != \'\') ? (($filter != \'\') ? \" And $cityQuery\" : \"$cityQuery\" ) : \'\';\n        $filter .= ($listQuery != \'\') ? (($filter != \'\') ? \" And ListPrice $listQuery\" : \"ListPrice $listQuery\" ) : \'\';\n        if ($development == \'Terrazas\' || $development == \'Torres Cantera\' || $development == \'Vista Coral\' || $development == \'Paseo del Malecon\' || $development == \'Puerto Ilusion\' || $development == \'Querencia\' || $development == \'Palmilla\') {\n            $filter .= ($filter != \'\') ? \" And StreetAdditionalInfo Eq \'$development*\'\" : \"StreetAdditionalInfo Eq \'$development*\'\";\n        }\n        else {\n            $filter .= ($development != \'\') ? (($filter != \'\') ? \" And SubdivisionName Eq \'$development\'\" : \"SubdivisionName Eq \'$development\'\" ) : \'\';\n        }\n        $filter = stripslashes($filter);\n\n        //echo $filter;\n\n        if($featured == 1) {\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 24, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\n            $listings = $api->GetMyListings($parameters);\n        }\n        else {\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 24, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\n            $listings = $api->GetListings($parameters);\n        }\n    }\n    $listings[count($listings)] = array(\"LastCount\" => $api->last_count, \"PageSize\" => $api->page_size, \"TotalPages\" => $api->total_pages, \"CurrentPage\" => $api->current_page);\n    //var_dump($listings[count($listings)-1]);\n    //echo json_encode($listings);\n?>\n\n<main>\n    <div class=\"container\">\n\n        <div class=\"card search-card\">\n            <div class=\"card-content\">\n                <div class=\"card-title\">\n                    MLS Search\n                </div>\n                <div class=\"row\">\n                    <form class=\"col s12\">\n                    <div class=\"row\">\n                        <div class=\"input-field col s12 m6 l3\">\n                            <input id=\"mls_number\" type=\"text\" class=\"validate\">\n                            <label for=\"mls_number\">MLS Number</label>\n                        </div>\n                        <div class=\"input-field col s12 m6 l3\">\n                            <select id=\"city\">\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\n                                <?php if($portal == 1) { ?>\n                                    <option value=\"la-ventana\" <?php echo $city == \"la-ventana\" ? \"selected\" : \"\"?>>La Ventana</option>\n                                <option value=\"la-paz\" <?php echo $city == \"la-paz\" ? \"selected\" : \"\"?>>La Paz</option>\n                                <option value=\"cabo-san-lucas\" <?php echo $city == \"cabo-san-lucas\" ? \"selected\" : \"\"?>>Cabo San Lucas</option>\n                                <option value=\"cabo-corridor\" <?php echo $city == \"cabo-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'cabo_corridor\']; ?></option>\n                                <option value=\"san-jose-del-cabo\" <?php echo $city == \"san-jose-del-cabo\" ? \"selected\" : \"\"?>>San Jose del Cabo</option>\n                                <option value=\"san-jose-corridor\" <?php echo $city == \"san-jose-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'san_jose_corridor\']; ?></option>\n                                <option value=\"east-cape\" <?php echo $city == \"east-cape\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'east_cape\']; ?></option>\n                                <option value=\"pacific-side\" <?php echo $city == \"pacific-side\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'pacific_side\']; ?></option>\n                                <?php } elseif($portal == 3 || $portal == 4 || $portal == 5) { ?>\n                                <option value=\"cabo-san-lucas\" <?php echo $city == \"cabo-san-lucas\" ? \"selected\" : \"\"?>>Cabo San Lucas</option>\n                                <option value=\"cabo-corridor\" <?php echo $city == \"cabo-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'cabo_corridor\']; ?></option>\n                                <option value=\"san-jose-del-cabo\" <?php echo $city == \"san-jose-del-cabo\" ? \"selected\" : \"\"?>>San Jose del Cabo</option>\n                                <option value=\"san-jose-corridor\" <?php echo $city == \"san-jose-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'san_jose_corridor\']; ?></option>\n                                <option value=\"east-cape\" <?php echo $city == \"east-cape\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'east_cape\']; ?></option>\n                                <option value=\"pacific-side\" <?php echo $city == \"pacific-side\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'pacific_side\']; ?></option>\n                                <option value=\"la-paz\" <?php echo $city == \"la-paz\" ? \"selected\" : \"\"?>>La Paz</option>\n                                <option value=\"la-ventana\" <?php echo $city == \"la-ventana\" ? \"selected\" : \"\"?>>La Ventana</option>\n                                <?php } else { ?>\n                                <option value=\"la-paz\" <?php echo $city == \"la-paz\" ? \"selected\" : \"\"?>>La Paz</option>\n                                <option value=\"la-ventana\" <?php echo $city == \"la-ventana\" ? \"selected\" : \"\"?>>La Ventana</option>\n                                <option value=\"cabo-san-lucas\" <?php echo $city == \"cabo-san-lucas\" ? \"selected\" : \"\"?>>Cabo San Lucas</option>\n                                <option value=\"cabo-corridor\" <?php echo $city == \"cabo-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'cabo_corridor\']; ?></option>\n                                <option value=\"san-jose-del-cabo\" <?php echo $city == \"san-jose-del-cabo\" ? \"selected\" : \"\"?>>San Jose del Cabo</option>\n                                <option value=\"san-jose-corridor\" <?php echo $city == \"san-jose-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'san_jose_corridor\']; ?></option>\n                                <option value=\"east-cape\" <?php echo $city == \"east-cape\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'east_cape\']; ?></option>\n                                <option value=\"pacific-side\" <?php echo $city == \"pacific-side\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'pacific_side\']; ?></option>\n                                <?php } ?>\n                            </select>\n                            <label>City</label>\n                        </div>\n                        <div class=\"input-field col s12 m6 l3\">\n                            <select id=\"property_type\">\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\n                                <option value=\"condos\" <?php echo $property_type == \"condos\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'condos\']; ?></option>\n                                <option value=\"houses\" <?php echo $property_type == \"houses\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'houses\']; ?></option>\n                                <option value=\"townhouses\" <?php echo $property_type == \"townhouses\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'townhouses\']; ?></option>\n                                <option value=\"land\" <?php echo $property_type == \"land\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'land\']; ?></option>\n                                <option value=\"commercial\" <?php echo $property_type == \"commercial\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'commercial\']; ?></option>\n                                <option value=\"business\" <?php echo $property_type == \"business\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'business\']; ?></option>\n                                <option value=\"multifamily\" <?php echo $property_type == \"multifamily\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'multifamily\']; ?></option>\n                            </select>\n                            <label>Property type</label>\n                        </div>\n                        <div class=\"input-field col s12 m6 l3\">\n                            <select id=\"list_price\">\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\n                                <option value=\"0\" <?php echo $list_price == \"0\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'under\']; ?> 200,000 USD</option>\n                                <option value=\"200K\" <?php echo $list_price == \"200K\" ? \"selected\" : \"\"?>>200,000 - 500,000 USD</option>\n                                <option value=\"500K\" <?php echo $list_price == \"500K\" ? \"selected\" : \"\"?>>500,000 - 1,000,000 USD</option>\n                                <option value=\"1M\" <?php echo $list_price == \"1M\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'over\']; ?> 1,000,000 USD</option>\n                            </select>\n                            <label>Price</label>\n                        </div>\n                    </div>\n                </div>\n\n            </div>\n            <div class=\"card-action right-align\">\n                <div class=\"left\">Total results: <?php echo $listings[sizeof($listings)-1][\"LastCount\"] ?></div>\n                <a id=\"searchBtn\" class=\"btn waves-effect waves-light\">Search\n                    <i class=\"material-icons right\">search</i>\n                </a>\n            </div>\n        </div>\n\n        <ul class=\"pagination center-align\">\n            <?php if ($page > 1) { ?>\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page-1) ?>\"><i class=\"material-icons\">chevron_left</i></a></li>\n            <?php } ?>\n                \n            <?php \n                $total_pages = $listings[sizeof($listings)-1][\"TotalPages\"];\n                for($x = $page - 3; $x <= $page + 3; $x++) { \n                    if ($x > 0 && $x <= $total_pages) {?>\n                        <li class=\"waves-effect <?php echo $x == $page ? \'active indigo\' : \'\' ?>\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".$x ?>\"><?php echo $x ?></a></li>\n                <?php } }\n            ?>\n\n            <?php if ($page < $total_pages) { ?>\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page+1) ?>\"><i class=\"material-icons\">chevron_right</i></a></li>\n            <?php } ?>   \n        </ul>\n\n        <hr>\n\n        <?php \n            //var_dump($listings);\n            $count = 0;\n            foreach($listings as $listing){ \n                $count++;\n                if ($count < sizeof($listings)){\n                    //setlocale(LC_MONETARY, \'en_US.utf8\');\n                    if($language == \'es\'){\n                        $price = \"$\" . number_format($listing[\"StandardFields\"][\"ListPrice\"] * $exchange_rate,2) . \" MXN\";\n                    }\n                    else{\n                        $price = \"$\" . number_format($listing[\"StandardFields\"][\"ListPrice\"],2) . \" USD\";\n                    }\n\n                    if (sizeof($listing[\"StandardFields\"][\"Photos\"]) > 0) {\n                        $thumb = $listing[\"StandardFields\"][\"Photos\"][0][\"Uri800\"];\n                    } else {\n                        $thumb = \'http://www.placehold.it/800x250?text=NO+PHOTO\';\n                    }\n\n                    $stai = $listing[\"StandardFields\"][\"StreetAdditionalInfo\"];\n					$stnu = $listing[\"StandardFields\"][\"StreetNumber\"];\n                    $stna = $listing[\"StandardFields\"][\"StreetName\"];\n                    //echo $stai . $stnu . $stna;\n                    $street = $stai != \'********\' ? $stai . \' \' : \'\';\n                    $street .= $stnu != \'********\' ? $stnu . \' \' : \'\';\n                    $street .= $stna != \'********\' ? $stna . \' \' : \'\';\n\n                    if (($count+2)%3 == 0) { ?> <div class=\"row mt-5 wow\"> <?php } ?>\n\n            <div class=\"col m4 s12 wow fadeIn\" data-wow-delay=\"0.2s\">\n            \n                <div class=\"card hoverable sticky-action\">\n                    <div class=\"card-image\">\n                        <div class=\"view overlay hm-white-slight activator\" style=\"height:250px; background-repeat: no-repeat; background-size: cover; background-position: center;background-image:url(\'<?php echo $thumb ?>\');\"></div>\n                        <!--a href=\"<?php echo $base_url.\"/listing/detail/\".$listing[\"StandardFields\"][\"ListingId\"] ?>\" class=\"btn-floating halfway-fab waves-effect waves-light indigo\"><i class=\"material-icons\">add</i></a-->\n                    </div>\n                    <div class=\"card-content\">\n                        <!--Title-->\n                        <h4 class=\"card-title activator right-align\"><?php echo $price ?><i class=\"material-icons right\">more_vert</i></h4>\n                        \n                        <!--Text-->\n                        <div class=\"card-text\">\n                            <p class=\"truncate\"><?php echo $street ?></p>\n                            <p><?php echo $listing[\"StandardFields\"][\"City\"] ?></p>\n                            <!--p>MLS Number: <?php echo $listing[\"StandardFields\"][\"ListingId\"] ?></p-->\n                        </div>\n                        <!--a href=\"#\" class=\"btn btn-primary\">Button</a-->\n                    </div>\n                    <div class=\"card-action\">\n                        <a href=\"<?php echo $base_url.\"/listing/detail/\".$listing[\"StandardFields\"][\"ListingId\"] ?>\" class=\"btn halfway-fab waves-effect waves-light indigo right\"><i class=\"material-icons\">add</i></a>\n                        <p><?php echo $listing[\"StandardFields\"][\"ListingId\"]?></p>\n                    </div>\n                    <div class=\"card-reveal activator\">\n                        <span class=\"card-title grey-text text-darken-4\"><i class=\"material-icons right activator\">close</i><?php echo $street ?></span>\n                        <p><?php echo $listing[\"StandardFields\"][\"City\"] ?></p>\n                    </div>\n                </div>\n            </div>\n                    \n            <?php if (($count)%3 == 0 || $count == sizeof($listings) -1) { ?> </div> <?php } } }?>\n            \n\n        <hr>\n\n        <ul class=\"pagination center-align\">\n            <?php if ($page > 1) { ?>\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page-1) ?>\"><i class=\"material-icons\">chevron_left</i></a></li>\n            <?php } ?>\n                \n            <?php \n                $total_pages = $listings[sizeof($listings)-1][\"TotalPages\"];\n                for($x = $page - 3; $x <= $page + 3; $x++) { \n                    if ($x > 0 && $x <= $total_pages) {?>\n                        <li class=\"waves-effect <?php echo $x == $page ? \'active indigo\' : \'\' ?>\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".$x ?>\"><?php echo $x ?></a></li>\n                <?php } }\n            ?>\n\n            <?php if ($page < $total_pages) { ?>\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/listing\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page+1) ?>\"><i class=\"material-icons\">chevron_right</i></a></li>\n            <?php } ?>   \n        </ul>\n        \n    </div>\n</main>\n\n{layout:set name=\"scripts\"}\n    <!--script src=\"{theme_folder_url}site/default/asset/js/mls.js\" ></script>\n    <script>\n        var portal = <?php echo $portal; ?>;\n        var language = \'<?php echo $language; ?>\';\n        var exchange_rate = <?php echo $exchange_rate; ?>;\n        var selectedListing = \'\';\n        \n        function autoLoad(){\n            $(\'#mls_number\').val(\'<?php echo $mls_number; ?>\');\n            $(\'#city\').val(\'<?php echo $city; ?>\');\n            $(\'#property_type\').val(\'<?php echo $property_type; ?>\');\n            $(\'#list_price\').val(\'<?php echo $list_price; ?>\');\n            $(\'#development\').val(\'<?php echo $development; ?>\');\n            $(\'#submit\').click();\n        }\n        \n        $(function(){\n            $(\'#property_type\').change(function(){\n                if ($(this).val() != \'E\') {\n                    $(\"#list_price option[value=\'Le 200000.0\']\").remove();\n                } else if ($(\"#list_price option[value=\'Le 200000.0\']\").length == 0) {\n                    $(\'#list_price option:first\').after(\'<option value=\"Le 200000.0\"><?php echo $lang[$language][\'under\']; ?> 200,000 USD</option>\');\n                }\n            });\n        });\n    </script-->\n    <script>\n        //$(\'select\').formSelect();\n\n        $(\"#searchBtn\").click(function(){\n            var redirect = \"/listing\";\n            if ($.trim($(\"#mls_number\").val()) != \"\"){\n                redirect += \"/detail/\" + $(\"#mls_number\").val();\n            } else {\n                redirect += \"/\"+$(\"#city\").val();\n                redirect += \"/\"+$(\"#property_type\").val();\n                redirect += \"/\"+$(\"#list_price\").val();\n            }\n            console.log(redirect);\n            $(this).addClass(\'disabled\');\n            window.location.href = redirect;\n        });\n\n    </script>\n{/layout:set}', NULL, 1538270130, 1, 'n', 0, '24', 'n', 'y', 'o', 0, 'n'),
(26, 1, 10, 'index_bkp', 'webpage', '{layout=\'layouts/_main-layout\'}\n\n<?php\n    $portal = isset($_GET[\'portal\']) ? trim($_GET[\'portal\']) : 0;\n    $mls_number = isset($_GET[\'mls_number\']) ? trim($_GET[\'mls_number\']) : \'\';\n    $city = isset($_GET[\'city\']) ? trim($_GET[\'city\']) : \'\';\n    $property_type = isset($_GET[\'property_type\']) ? trim($_GET[\'property_type\']) : \'\';\n    $list_price = isset($_GET[\'list_price\']) ? trim($_GET[\'list_price\']) : \'\';\n    $development = isset($_GET[\'development\']) ? trim($_GET[\'development\']) : \'\';\n    $language = isset($_GET[\'lang\']) ? trim($_GET[\'lang\']) : \'en\';\n    $exchange_rate = 1;\n\n    if($language == \'es\') {\n        $xml = simplexml_load_file(\"http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml\")->Cube[0]->Cube[0];\n        $usd = 0;\n        $mxn = 0;\n        foreach ($xml->Cube as $item) {\n            if((string)$item[\'currency\'] === \'USD\')\n                $usd = (real)$item[\'rate\'];\n                \n            if((string)$item[\'currency\'] === \'MXN\')\n                $mxn = (real)$item[\'rate\'];\n        }\n\n        $exchange_rate = $mxn/$usd;\n    }\n\n    //*** English ***\n    $lang[\'en\'][\'mls_number\'] = \'MLS number\';\n    $lang[\'en\'][\'city\'] = \'City\';\n    $lang[\'en\'][\'property_type\'] = \'Property type\';\n    $lang[\'en\'][\'price\'] = \'Price\';\n    $lang[\'en\'][\'any\'] = \'Any\';\n    $lang[\'en\'][\'submit\'] = \'Submit\';\n    $lang[\'en\'][\'cabo_corridor\'] = \'Cabo Corridor\';\n    $lang[\'en\'][\'san_jose_corridor\'] = \'San Jose Corridor\';\n    $lang[\'en\'][\'east_cape\'] = \'East Cape\';\n    $lang[\'en\'][\'pacific_side\'] = \'Pacific Side\';\n    $lang[\'en\'][\'condos\'] = \'Condos\';\n    $lang[\'en\'][\'houses\'] = \'Houses\';\n    $lang[\'en\'][\'townhouses\'] = \'Townhouses\';\n    $lang[\'en\'][\'land\'] = \'Land\';\n    $lang[\'en\'][\'commercial\'] = \'Commercial\';\n    $lang[\'en\'][\'business\'] = \'Business\';\n    $lang[\'en\'][\'fractional\'] = \'Fractional\';\n    $lang[\'en\'][\'multifamily\'] = \'MultiFamily\';\n    $lang[\'en\'][\'under\'] = \'Under\';\n    $lang[\'en\'][\'over\'] = \'Over\';\n    $lang[\'en\'][\'results\'] = \'Results\';\n    $lang[\'en\'][\'email_the_agent\'] = \'Email The Agent\';\n    $lang[\'en\'][\'login\'] = \'Login\';\n    $lang[\'en\'][\'property_consultation\'] = \'Property Consultation\';\n    $lang[\'en\'][\'details\'] = \'Details\';\n    $lang[\'en\'][\'photos\'] = \'Photos\';\n    $lang[\'en\'][\'map\'] = \'Map\';\n    $lang[\'en\'][\'yes\'] = \'Yes\';\n    $lang[\'en\'][\'no\'] = \'No\';\n    $lang[\'en\'][\'developments\'] = \'Developments\';\n    //*** Spanish ***\n    $lang[\'es\'][\'mls_number\'] = \'N&uacute;mero MLS\';\n    $lang[\'es\'][\'city\'] = \'Ciudad\';\n    $lang[\'es\'][\'property_type\'] = \'Tipo de propiedad\';\n    $lang[\'es\'][\'price\'] = \'Precio\';\n    $lang[\'es\'][\'any\'] = \'Cualquiera\';\n    $lang[\'es\'][\'submit\'] = \'Enviar\';\n    $lang[\'es\'][\'cabo_corridor\'] = \'Corredor - San Lucas\';\n    $lang[\'es\'][\'san_jose_corridor\'] = \'Corredor - San Jose\';\n    $lang[\'es\'][\'east_cape\'] = \'Cabo del Este\';\n    $lang[\'es\'][\'pacific_side\'] = \'Pac&iacute;fico\';\n    $lang[\'es\'][\'condos\'] = \'Condominios\';\n    $lang[\'es\'][\'houses\'] = \'Casas\';\n    $lang[\'es\'][\'townhouses\'] = \'Residencias\';\n    $lang[\'es\'][\'land\'] = \'Terrenos\';\n    $lang[\'es\'][\'commercial\'] = \'Comercial\';\n    $lang[\'es\'][\'business\'] = \'Negocio\';\n    $lang[\'es\'][\'fractional\'] = \'Fraccionamiento\';\n    $lang[\'es\'][\'multifamily\'] = \'Multi-Familiar\';\n    $lang[\'es\'][\'under\'] = \'Menos de\';\n    $lang[\'es\'][\'over\'] = \'Mas de\';\n    $lang[\'es\'][\'results\'] = \'Resultados\';\n    $lang[\'es\'][\'email_the_agent\'] = \'Enviar Email al Agente\';\n    $lang[\'es\'][\'login\'] = \'Acceder\';\n    $lang[\'es\'][\'property_consultation\'] = \'Consulta de Propiedad\';\n    $lang[\'es\'][\'details\'] = \'Detalles\';\n    $lang[\'es\'][\'photos\'] = \'Fotos\';\n    $lang[\'es\'][\'map\'] = \'Mapa\';\n    $lang[\'es\'][\'yes\'] = \'Si\';\n    $lang[\'es\'][\'no\'] = \'No\';\n    $lang[\'es\'][\'developments\'] = \'Desarrollos\';\n\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/flexmlsAPI.php\");\n    $api = new flexmlsAPI(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\");\n    $api->SetApplicationName(\"Diamante-MLS-Search/1.0\");\n    $api->SetDeveloperMode(false);\n    $auth = $api->Authenticate();\n    if ($auth === false) api_error_thrown($api);\n\n    $parameters = null;\n    $listings = null;\n    $mls_number = $_GET[\'mls_number\'];\n    $city = urldecode($_GET[\'city\']);\n    $property_type = $_GET[\'property_type\'];\n    $list_price = $_GET[\'list_price\'];\n    $page = isset($_GET[\'page\']) ? trim($_GET[\'page\']) : 1;\n    $featured = isset($_GET[\'featured\']) ? $_GET[\'featured\'] : 0;\n    $development = isset($_GET[\'development\']) ? $_GET[\'development\'] : \'\';\n\n    if($mls_number != \'\') {\n        $parameters = array(\"_filter\" => \"ListingId Eq \'$mls_number\'\", \"_expand\" => \'PrimaryPhoto\', \"_limit\" => \"1\", \"_pagination\" => true);\n        $listings = $api->GetListings($parameters);\n    }\n    else {\n        $filter = \'\';\n        $p_type = ($property_type != \"\") ? \"PropertyType Eq \'$property_type\'\": \"Not PropertyType Eq \'H\'\";\n        $filter .= ($filter != \'\') ? \" And $p_type\" : \"$p_type\" ;\n        $filter .= ($city != \'\') ? (($filter != \'\') ? \" And $city\" : \"$city\" ) : \'\';\n        $filter .= ($list_price != \'\') ? (($filter != \'\') ? \" And ListPrice $list_price\" : \"ListPrice $list_price\" ) : \'\';\n        if ($development == \'Terrazas\' || $development == \'Torres Cantera\' || $development == \'Vista Coral\' || $development == \'Paseo del Malecon\' || $development == \'Puerto Ilusion\' || $development == \'Querencia\' || $development == \'Palmilla\') {\n            $filter .= ($filter != \'\') ? \" And StreetAdditionalInfo Eq \'$development*\'\" : \"StreetAdditionalInfo Eq \'$development*\'\";\n        }\n        else {\n            $filter .= ($development != \'\') ? (($filter != \'\') ? \" And SubdivisionName Eq \'$development\'\" : \"SubdivisionName Eq \'$development\'\" ) : \'\';\n        }\n        $filter = stripslashes($filter);\n\n        if($featured == 1) {\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 25, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\n            $listings = $api->GetMyListings($parameters);\n        }\n        else {\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 25, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\n            $listings = $api->GetListings($parameters);\n        }\n    }\n    $listings[count($listings)] = array(\"LastCount\" => $api->last_count, \"PageSize\" => $api->page_size, \"TotalPages\" => $api->total_pages, \"CurrentPage\" => $api->current_page);\n    echo json_encode($listings);\n?>\n\n<div class=\"container-fluid content\" style=\"margin-top:100px;\">\n    <input id=\"submit\" type=\"button\" value=\"<?php echo $lang[$language][\'submit\']; ?>\" />\n    <div class=\"results\">\n        <div id=\"listings\"></div>\n    </div>\n</div>\n\n{layout:set name=\"scripts\"}\n    <script src=\"{theme_folder_url}site/default/asset/js/mls.js\" ></script>\n    <script>\n        var portal = <?php echo $portal; ?>;\n        var language = \'<?php echo $language; ?>\';\n        var exchange_rate = <?php echo $exchange_rate; ?>;\n        var selectedListing = \'\';\n        \n        function autoLoad(){\n            $(\'#mls_number\').val(\'<?php echo $mls_number; ?>\');\n            $(\'#city\').val(\'<?php echo $city; ?>\');\n            $(\'#property_type\').val(\'<?php echo $property_type; ?>\');\n            $(\'#list_price\').val(\'<?php echo $list_price; ?>\');\n            $(\'#development\').val(\'<?php echo $development; ?>\');\n            $(\'#submit\').click();\n        }\n        \n        $(function(){\n            $(\'#property_type\').change(function(){\n                if ($(this).val() != \'E\') {\n                    $(\"#list_price option[value=\'Le 200000.0\']\").remove();\n                } else if ($(\"#list_price option[value=\'Le 200000.0\']\").length == 0) {\n                    $(\'#list_price option:first\').after(\'<option value=\"Le 200000.0\"><?php echo $lang[$language][\'under\']; ?> 200,000 USD</option>\');\n                }\n            });\n        });\n    </script>\n{/layout:set}', NULL, 1538270131, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(27, 1, 10, 'detail', 'webpage', '{layout=\'layouts/_main-layout\'}\n\n<?php\n    error_reporting( E_ALL ); //debug\n    //require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/Core.php\");\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/flexmlsAPI.php\");\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/lang/lang.php\");\n    $language = isset($_GET[\'lang\']) ? trim($_GET[\'lang\']) : \'en\';\n    $protocol = strtolower(substr($_SERVER[\"SERVER_PROTOCOL\"],0,5))==\'https://\'?\'https://\':\'http://\';\n    $hostName = $_SERVER[\'HTTP_HOST\'];\n    $base_url = $protocol.$hostName;\n    $search_results = \"\";\n    //var_dump($_SERVER);\n    if (isset($_SERVER[\'HTTP_REFERER\']) && strpos($_SERVER[\'HTTP_REFERER\'], $base_url.\'/listing\') > -1 ) { $search_results =  $_SERVER[\'HTTP_REFERER\']; }\n    //$api = new SparkAPI_APIAuth(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\"); //Core.php\n    $api = new flexmlsAPI(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\"); //flexmlsAPI.php\n    $api->SetApplicationName(\"Diamante-MLS-Search/1.0\");\n    $api->SetDeveloperMode(false);\n    $auth = $api->Authenticate();\n    if ($auth === false) api_error_thrown($api);\n\n    $id = \"{segment_3}\";\n    //echo $id;\n    $parameters = array(\"_expand\" => \'CustomFields,Photos\');\n    $listing = $api->GetListings(array(\"_filter\" => \"ListingId Eq \'\" . $id . \"\'\" , \"_expand\" => \'CustomFields,Photos\', \"_limit\" => \"1\", \"_pagination\" => true));\n    //$listing = $api->GetListing($id,$parameters);\n\n    //var_dump($listing);\n    if ($listing != null){\n        $standard = $listing[0][\'StandardFields\'];\n        $custom = $listing[0][\'CustomFields\'][0];\n\n        $main_photo = \'\';\n        $main_photo_name = \'\';\n        $photos = $standard[\'Photos\'];\n\n        foreach ($photos as $item) {\n            if ($item[\'Primary\'] == 1) {\n                $main_photo = $item[\'Uri1600\'];\n                $main_photo_name = $item[\'Name\'];\n            }\n        }\n\n        $general_desc = null;\n\n        $main = null;\n        $details = null;\n\n        $stai = $standard[\"StreetAdditionalInfo\"];\n        $stnu = $standard[\"StreetNumber\"];\n        $stna = $standard[\"StreetName\"];\n        //echo $stai . $stnu . $stna;\n        $street = $stai != \'********\' ? $stai . \' \' : \'\';\n        $street .= $stnu != \'********\' ? $stnu . \' \' : \'\';\n        $street .= $stna != \'********\' ? $stna . \' \' : \'\';\n\n        $exchange_rate = 1;\n\n        if($language == \'es\') {\n            $xml = simplexml_load_file(\"http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml\")->Cube[0]->Cube[0];\n            $usd = 0;\n            $mxn = 0;\n            foreach ($xml->Cube as $item) {\n                if((string)$item[\'currency\'] === \'USD\')\n                    $usd = (real)$item[\'rate\'];\n                    \n                if((string)$item[\'currency\'] === \'MXN\')\n                    $mxn = (real)$item[\'rate\'];\n            }\n    \n            $exchange_rate = $mxn/$usd;\n        }\n\n        if($language == \'es\'){\n            $price = \"$\" . number_format($standard[\"ListPrice\"] * $exchange_rate,2) . \" MXN\";\n        }\n        else{\n            $price = \"$\" . number_format($standard[\"ListPrice\"],2) . \" USD\";\n        }\n\n        $description = \'\';\n\n        if($language == \'es\'){\n            error_reporting(0);\n            $json = file_get_contents(\'https://www.googleapis.com/language/translate/v2?key=AIzaSyA2XBI0Wlol8wIHwZ28nGvtpk01VBgdDAQ&q=\' . urlencode($standard[\'PublicRemarks\']) . \'&source=en&target=es\');\n            $json = json_decode($json, true);\n            $translations = $json[\'data\'][\'translations\'];\n            \n            foreach($translations as $translation) {\n                $description .= \"{$translation[\'translatedText\']}\";\n            }\n            \n            if(trim($description) == \'\')\n                $description = preg_replace(\'/[^a-zA-Z0-9\\s\\.,()-]/\',\'\', $standard[\'PublicRemarks\']);\n\n            echo \'<em style=\"font-size:10px;\">&bull; Los precios en pesos son calculados en base al tipo de cambio al momento de la consulta; el precio puede variar.<br />&bull; La información mostrada se tradujo de forma automatizada por lo tanto puede ser imprecisa.</em><br /><br />\';\n        }\n        else{\n            $description = preg_replace(\'/[^a-zA-Z0-9\\s\\.,()-]/\',\'\', $standard[\'PublicRemarks\']);\n        }\n\n        $map_lat = (str_replace(\"*\", \"\", number_format($standard[\'Latitude\'],6,\'.\',\'\')) == \"\") ? 24.161754 : $standard[\'Latitude\'];\n        $map_lon = (str_replace(\"*\", \"\", number_format($standard[\'Longitude\'],6,\'.\',\'\')) == \"\") ? -110.318013 : $standard[\'Longitude\'];\n\n    } //if listing != null\n?>\n\n{layout:set name=\"styles\"}\n    <style>\n        .hero{\n            height:400px;\n            width:100%;\n            background: url(\'<?=$main_photo?>\');\n            background-position: center;\n            background-size: cover;\n        }\n\n        #map_container {\n            width:100%;\n            height:500px;\n        }\n    </style>\n{/layout:set}\n\n\n<?php if($listing == null) { ?>\n    <main>\n        <div class=\"container\">\n            <h4 class=\"center\">Sorry, property not found</h4>\n\n            <p class=\"center\">\n                <?php if ($search_results != \"\") {?>\n                    <a href=\"<?=$search_results?>\" class=\"waves-effect waves-light btn\"><i class=\"material-icons left\">chevron_left</i> Back to search results  </a>\n                <?php } else { ?>\n                    <a href=\"/listing\" class=\"waves-effect waves-light btn\"><i class=\"material-icons left\">chevron_left</i> Back to listing </a>\n                <?php } ?>\n            </p>\n        </div>\n    </main>\n\n<?php } else { ?> \n\n    <div class=\"hero\">\n\n    </div>\n\n    <main>\n\n        <div class=\"container\">\n            <div class=\"row\">\n                <div class=\"col s12 m10\">\n\n                    <div id=\"description\" class=\"section scrollspy\">\n                        <h4><?= $id ?> / <?= $street ?></h4>\n                        <h5><?= $price ?></h5>  \n\n                        <p class=\"flow-text\"><?= $description ?> </p>\n                    </div>\n\n                    <div id=\"features\" class=\"section scrollspy\">\n                        <h5>Features</h5>\n                    </div>\n\n                    <div id=\"gallery\" class=\"section scrollspy\">\n                        <h5>Gallery</h5>\n\n                        <div class=\"carousel carousel-slider\">\n                            \n                                <?php foreach ($standard[\'Photos\'] as $photo) { ?>\n                                    <a class=\"carousel-item\" href=\"#<?=$photo[\'Id\']?>\">\n                                        <img src=\"<?=$photo[\'Uri800\']?>\">\n                                    </a>\n                                <?php } ?>\n                            \n                        </div>\n                    </div>\n\n                    <div id=\"map\" class=\"section scrollspy\">\n                        <h5>Map</h5>\n                        <div id=\"map_container\"></div>\n                    </div>\n\n                    \n                </div>\n                <div class=\"col hide-on-small-only m2\">\n                    <div class=\"pushpin\">            \n                        <h6>\n                            <?php if ($search_results != \"\") {?>\n                                <a href=\"<?=$search_results?>\"><i class=\"material-icons left\">chevron_left</i> Back to search results  </a>\n                            <?php } else { ?>\n                                <a href=\"/listing\"><i class=\"material-icons left\">chevron_left</i> Back to listing </a>\n                            <?php } ?>\n                        </h6>\n                        <ul class=\"section table-of-contents\">\n                            <li><a href=\"#description\">Description</a></li>\n                            <li><a href=\"#features\">Features</a></li>\n                            <li><a href=\"#gallery\">Gallery</a></li>\n                            <li><a href=\"#map\">Map</a></li>\n                        </ul>\n                    </div>\n                    <?php //var_dump($listing) ?>\n                </div>\n            </div>\n        </div>\n\n    </main>\n<?php } ?>\n\n\n{layout:set name=\"scripts\"}\n    <script src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyAnEhkVDYEAhWmyleuk7rvrVD6XcJ72q5A&callback=loadMap\" async defer></script>\n    <script>\n        function loadMap(){\n            var latlng = new google.maps.LatLng(<?php echo $map_lat . \',\' . $map_lon; ?>);\n            var opt = {\n                zoom: 15,\n                center: latlng,\n                mapTypeId: google.maps.MapTypeId.HYBRID\n            }\n            var map = new google.maps.Map(document.getElementById(\"map_container\"), opt);\n\n            var info = \'<p class=\"map_info\"><div class=\"thumb\"><img src=\"<?php echo $photos[0][\'UriThumb\']; ?>\" /></div>\'+\n                \'<b> <?php echo $price; ?></b><br />\'+\n                \'<?php echo $street; ?><br /><?php echo $standard[\'City\']; ?><br />\'+\n                \'<i class=\"\"><?php echo $standard[\'ListingId\']; ?></i></p>\';\n\n            var infowindow = new google.maps.InfoWindow({\n                content: info\n            });\n\n            var marker = new google.maps.Marker({\n                position: latlng,\n                animation: google.maps.Animation.DROP,\n                map: map,\n                title:\"<?php echo $street; ?>\"\n            });\n            \n            infowindow.open(map,marker);\n            \n            google.maps.event.addListener(marker, \'click\', function() {\n                infowindow.open(map,marker);\n            });\n        }\n\n        $( document ).ready(function(){\n            //$(\'.slider\').slider();\n            $(\'.carousel.carousel-slider\').carousel({\n                fullWidth: true,\n                indicators: true\n            });\n            $(\'.scrollspy\').scrollSpy();\n            $(\'.pushpin\').pushpin();\n            /*$(\'#fullscreen-btn\').click(function(){\n                var elem = document.querySelector(\'.slider\');\n                var instance = M.Slider.getInstance(elem);\n                instance.destroy(); \n                //$(\'.slider\').slider(\'destroy\');\n                $(\'.slider\').addClass(\'fullscreen\');\n                $(\'.slider\').slider();\n            });*/\n        });\n        \n    </script>\n{/layout:set}', NULL, 1538270130, 1, 'n', 0, '24', 'n', 'y', 'o', 0, 'n');
INSERT INTO `exp_templates` (`template_id`, `site_id`, `group_id`, `template_name`, `template_type`, `template_data`, `template_notes`, `edit_date`, `last_author_id`, `cache`, `refresh`, `no_auth_bounce`, `enable_http_auth`, `allow_php`, `php_parse_location`, `hits`, `protect_javascript`) VALUES
(28, 1, 11, 'index', 'webpage', '{layout=\'layouts/_main-layout\'}\n\n{layout:set name=\"styles\"}\n    <style>\n        .search-card .card-content {\n            padding-bottom:0;\n        }\n        .search-car .card-content row {\n            margin-bottom:0;\n        }\n        main {\n            margin-top: 150px;\n        }\n    </style>\n{/layout:set}\n\n<?php\n    error_reporting( E_ALL ); //debug\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/flexmlsAPI.php\");\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/lang/lang.php\");\n    $protocol = strtolower(substr($_SERVER[\"SERVER_PROTOCOL\"],0,5))==\'https://\'?\'https://\':\'http://\';\n    $hostName = $_SERVER[\'HTTP_HOST\'];\n    $base_url = $protocol.$hostName;\n    $api = new flexmlsAPI(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\");\n    $api->SetApplicationName(\"Diamante-MLS-Search/1.0\");\n    $api->SetDeveloperMode(false);\n    $auth = $api->Authenticate();\n    if ($auth === false) api_error_thrown($api);\n\n    $portal = isset($_GET[\'portal\']) ? trim($_GET[\'portal\']) : 0;\n    $mls_number = isset($_GET[\'mls_number\']) ? trim($_GET[\'mls_number\']) : \'\';\n    //$city = isset($_GET[\'city\']) ? trim($_GET[\'city\']) : \'\';\n    $city = \"{segment_2}\" != \"\" ? \"{segment_2}\" : \"all\";\n    //$property_type = isset($_GET[\'property_type\']) ? trim($_GET[\'property_type\']) : \'\';\n    $property_type  = \"{segment_3}\" != \"\" ? \"{segment_3}\" : \"all\";\n    //$list_price = isset($_GET[\'list_price\']) ? trim($_GET[\'list_price\']) : \'\';\n    $list_price = \"{segment_4}\" != \"\" ? \"{segment_4}\" : \"all\";\n    $development = isset($_GET[\'development\']) ? trim($_GET[\'development\']) : \'\';\n    $language = isset($_GET[\'lang\']) ? trim($_GET[\'lang\']) : \'en\';\n    //$page = isset($_GET[\'page\']) ? trim($_GET[\'page\']) : 1;\n    $page = is_numeric(\"{segment_5}\") ? \"{segment_5}\"  : 1;\n    $featured = isset($_GET[\'featured\']) ? $_GET[\'featured\'] : 0;\n\n    $exchange_rate = 1;\n    $parameters = null;\n    $listings = null;\n    \n    if($language == \'es\') {\n        $xml = simplexml_load_file(\"http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml\")->Cube[0]->Cube[0];\n        $usd = 0;\n        $mxn = 0;\n        foreach ($xml->Cube as $item) {\n            if((string)$item[\'currency\'] === \'USD\')\n                $usd = (real)$item[\'rate\'];\n                \n            if((string)$item[\'currency\'] === \'MXN\')\n                $mxn = (real)$item[\'rate\'];\n        }\n\n        $exchange_rate = $mxn/$usd;\n    }\n\n    switch ($city) {\n        case \"la-paz\" : $cityQuery = \"City Eq \'La Paz\'\"; break;\n        case \"la-ventana\" : $cityQuery = \"SubdivisionName Eq \'La Ventana\' Or SubdivisionName Eq \'El Sargento\'\"; break;\n        case \"cabo-san-lucas\" : $cityQuery = \"City Eq \'Cabo San Lucas\'\"; break;\n        case \"cabo-corridor\" : $cityQuery = \"City Eq \'Cabo Corridor\'\"; break;\n        case \"san-jose-del-cabo\" : $cityQuery = \"City Eq \'San Jose del Cabo\'\"; break;\n        case \"san-jose-corridor\" : $cityQuery = \"City Eq \'San Jose Corridor\'\"; break;\n        case \"east-cape\" : $cityQuery = \"City Eq \'East Cape\' Or City Eq \'Los Barriles\'\"; break;\n        case \"pacific-side\" : $cityQuery = \"City Eq \'Pacific Or City Eq \'Pacific Side\' Or City Eq \'Todos Santos\'\"; break;\n        default : $cityQuery = \"\";\n    }\n\n    switch ($property_type) {\n        case \"condos\" : $propertyQuery = \"A\"; break;\n        case \"houses\" : $propertyQuery = \"B\"; break;\n        case \"townhouses\" : $propertyQuery = \"C\"; break;\n        case \"land\" : $propertyQuery = \"E\"; break;\n        case \"commercial\" : $propertyQuery = \"F\"; break;\n        case \"business\" : $propertyQuery = \"G\"; break;\n        case \"multifamily\" : $propertyQuery = \"I\"; break;\n        default : $propertyQuery = \"\";\n    }\n\n    switch ($list_price) {\n        case \"0\" : $listQuery = \"Le 200000.0\"; break;\n        case \"200K\" : $listQuery = \"Ge 200000.0 And ListPrice Le 500000.0\"; break;\n        case \"500K\" : $listQuery = \"Ge 500000.0 And ListPrice Le 1000000.0\"; break;\n        case \"1M\" : $listQuery = \"Ge 1000000.0\"; break;\n        default : $listQuery = \"\";\n    }\n\n\n    if($mls_number != \'\') {\n        $parameters = array(\"_filter\" => \"ListingId Eq \'$mls_number\'\", \"_expand\" => \'PrimaryPhoto\', \"_limit\" => \"1\", \"_pagination\" => true);\n        $listings = $api->GetListings($parameters);\n    }\n    else {\n        $filter = \'\';\n        $p_type = ($propertyQuery != \"\") ? \"PropertyType Eq \'$propertyQuery\'\": \"Not PropertyType Eq \'H\'\";\n        $filter .= ($filter != \'\') ? \" And $p_type\" : \"$p_type\" ;\n        $filter .= ($cityQuery != \'\') ? (($filter != \'\') ? \" And $cityQuery\" : \"$cityQuery\" ) : \'\';\n        $filter .= ($listQuery != \'\') ? (($filter != \'\') ? \" And ListPrice $listQuery\" : \"ListPrice $listQuery\" ) : \'\';\n        if ($development == \'Terrazas\' || $development == \'Torres Cantera\' || $development == \'Vista Coral\' || $development == \'Paseo del Malecon\' || $development == \'Puerto Ilusion\' || $development == \'Querencia\' || $development == \'Palmilla\') {\n            $filter .= ($filter != \'\') ? \" And StreetAdditionalInfo Eq \'$development*\'\" : \"StreetAdditionalInfo Eq \'$development*\'\";\n        }\n        else {\n            $filter .= ($development != \'\') ? (($filter != \'\') ? \" And SubdivisionName Eq \'$development\'\" : \"SubdivisionName Eq \'$development\'\" ) : \'\';\n        }\n        $filter = stripslashes($filter);\n\n        //echo $filter;\n\n        if($featured == 1) {\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 24, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\n            $listings = $api->GetMyListings($parameters);\n        }\n        else {\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 24, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\n            $listings = $api->GetListings($parameters);\n        }\n    }\n    $listings[count($listings)] = array(\"LastCount\" => $api->last_count, \"PageSize\" => $api->page_size, \"TotalPages\" => $api->total_pages, \"CurrentPage\" => $api->current_page);\n    //var_dump($listings[count($listings)-1]);\n    //echo json_encode($listings);\n?>\n\n<main>\n    <div class=\"container\">\n\n        <div class=\"card search-card\">\n            <div class=\"card-content\">\n                <div class=\"card-title\">\n                    MLS Search\n                </div>\n                <div class=\"row\">\n                    <form class=\"col s12\">\n                    <div class=\"row\">\n                        <div class=\"input-field col s12 m6 l3\">\n                            <input id=\"mls_number\" type=\"text\" class=\"validate\">\n                            <label for=\"mls_number\">MLS Number</label>\n                        </div>\n                        <div class=\"input-field col s12 m6 l3\">\n                            <select id=\"city\">\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\n                                <?php if($portal == 1) { ?>\n                                    <option value=\"la-ventana\" <?php echo $city == \"la-ventana\" ? \"selected\" : \"\"?>>La Ventana</option>\n                                <option value=\"la-paz\" <?php echo $city == \"la-paz\" ? \"selected\" : \"\"?>>La Paz</option>\n                                <option value=\"cabo-san-lucas\" <?php echo $city == \"cabo-san-lucas\" ? \"selected\" : \"\"?>>Cabo San Lucas</option>\n                                <option value=\"cabo-corridor\" <?php echo $city == \"cabo-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'cabo_corridor\']; ?></option>\n                                <option value=\"san-jose-del-cabo\" <?php echo $city == \"san-jose-del-cabo\" ? \"selected\" : \"\"?>>San Jose del Cabo</option>\n                                <option value=\"san-jose-corridor\" <?php echo $city == \"san-jose-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'san_jose_corridor\']; ?></option>\n                                <option value=\"east-cape\" <?php echo $city == \"east-cape\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'east_cape\']; ?></option>\n                                <option value=\"pacific-side\" <?php echo $city == \"pacific-side\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'pacific_side\']; ?></option>\n                                <?php } elseif($portal == 3 || $portal == 4 || $portal == 5) { ?>\n                                <option value=\"cabo-san-lucas\" <?php echo $city == \"cabo-san-lucas\" ? \"selected\" : \"\"?>>Cabo San Lucas</option>\n                                <option value=\"cabo-corridor\" <?php echo $city == \"cabo-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'cabo_corridor\']; ?></option>\n                                <option value=\"san-jose-del-cabo\" <?php echo $city == \"san-jose-del-cabo\" ? \"selected\" : \"\"?>>San Jose del Cabo</option>\n                                <option value=\"san-jose-corridor\" <?php echo $city == \"san-jose-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'san_jose_corridor\']; ?></option>\n                                <option value=\"east-cape\" <?php echo $city == \"east-cape\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'east_cape\']; ?></option>\n                                <option value=\"pacific-side\" <?php echo $city == \"pacific-side\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'pacific_side\']; ?></option>\n                                <option value=\"la-paz\" <?php echo $city == \"la-paz\" ? \"selected\" : \"\"?>>La Paz</option>\n                                <option value=\"la-ventana\" <?php echo $city == \"la-ventana\" ? \"selected\" : \"\"?>>La Ventana</option>\n                                <?php } else { ?>\n                                <option value=\"la-paz\" <?php echo $city == \"la-paz\" ? \"selected\" : \"\"?>>La Paz</option>\n                                <option value=\"la-ventana\" <?php echo $city == \"la-ventana\" ? \"selected\" : \"\"?>>La Ventana</option>\n                                <option value=\"cabo-san-lucas\" <?php echo $city == \"cabo-san-lucas\" ? \"selected\" : \"\"?>>Cabo San Lucas</option>\n                                <option value=\"cabo-corridor\" <?php echo $city == \"cabo-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'cabo_corridor\']; ?></option>\n                                <option value=\"san-jose-del-cabo\" <?php echo $city == \"san-jose-del-cabo\" ? \"selected\" : \"\"?>>San Jose del Cabo</option>\n                                <option value=\"san-jose-corridor\" <?php echo $city == \"san-jose-corridor\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'san_jose_corridor\']; ?></option>\n                                <option value=\"east-cape\" <?php echo $city == \"east-cape\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'east_cape\']; ?></option>\n                                <option value=\"pacific-side\" <?php echo $city == \"pacific-side\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'pacific_side\']; ?></option>\n                                <?php } ?>\n                            </select>\n                            <label>City</label>\n                        </div>\n                        <div class=\"input-field col s12 m6 l3\">\n                            <select id=\"property_type\">\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\n                                <option value=\"condos\" <?php echo $property_type == \"condos\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'condos\']; ?></option>\n                                <option value=\"houses\" <?php echo $property_type == \"houses\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'houses\']; ?></option>\n                                <option value=\"townhouses\" <?php echo $property_type == \"townhouses\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'townhouses\']; ?></option>\n                                <option value=\"land\" <?php echo $property_type == \"land\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'land\']; ?></option>\n                                <option value=\"commercial\" <?php echo $property_type == \"commercial\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'commercial\']; ?></option>\n                                <option value=\"business\" <?php echo $property_type == \"business\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'business\']; ?></option>\n                                <option value=\"multifamily\" <?php echo $property_type == \"multifamily\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'multifamily\']; ?></option>\n                            </select>\n                            <label>Property type</label>\n                        </div>\n                        <div class=\"input-field col s12 m6 l3\">\n                            <select id=\"list_price\">\n                                <option value=\"all\"><?php echo $lang[$language][\'any\']; ?></option>\n                                <option value=\"0\" <?php echo $list_price == \"0\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'under\']; ?> 200,000 USD</option>\n                                <option value=\"200K\" <?php echo $list_price == \"200K\" ? \"selected\" : \"\"?>>200,000 - 500,000 USD</option>\n                                <option value=\"500K\" <?php echo $list_price == \"500K\" ? \"selected\" : \"\"?>>500,000 - 1,000,000 USD</option>\n                                <option value=\"1M\" <?php echo $list_price == \"1M\" ? \"selected\" : \"\"?>><?php echo $lang[$language][\'over\']; ?> 1,000,000 USD</option>\n                            </select>\n                            <label>Price</label>\n                        </div>\n                    </div>\n                </div>\n\n            </div>\n            <div class=\"card-action right-align\">\n                <div class=\"left\">Total results: <?php echo $listings[sizeof($listings)-1][\"LastCount\"] ?></div>\n                <a id=\"searchBtn\" class=\"btn waves-effect waves-light\">Search\n                    <i class=\"material-icons right\">search</i>\n                </a>\n            </div>\n        </div>\n\n        <ul class=\"pagination center-align\">\n            <?php if ($page > 1) { ?>\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/properties\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page-1) ?>\"><i class=\"material-icons\">chevron_left</i></a></li>\n            <?php } ?>\n                \n            <?php \n                $total_pages = $listings[sizeof($listings)-1][\"TotalPages\"];\n                for($x = $page - 3; $x <= $page + 3; $x++) { \n                    if ($x > 0 && $x <= $total_pages) {?>\n                        <li class=\"waves-effect <?php echo $x == $page ? \'active indigo\' : \'\' ?>\"><a href=\"<?php echo $base_url.\"/properties\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".$x ?>\"><?php echo $x ?></a></li>\n                <?php } }\n            ?>\n\n            <?php if ($page < $total_pages) { ?>\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/properties\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page+1) ?>\"><i class=\"material-icons\">chevron_right</i></a></li>\n            <?php } ?>   \n        </ul>\n\n        <hr>\n\n        <?php \n            //var_dump($listings);\n            $count = 0;\n            foreach($listings as $listing){ \n                $count++;\n                if ($count < sizeof($listings)){\n                    //setlocale(LC_MONETARY, \'en_US.utf8\');\n                    if($language == \'es\'){\n                        $price = \"$\" . number_format($listing[\"StandardFields\"][\"ListPrice\"] * $exchange_rate,2) . \" MXN\";\n                    }\n                    else{\n                        $price = \"$\" . number_format($listing[\"StandardFields\"][\"ListPrice\"],2) . \" USD\";\n                    }\n\n                    if (sizeof($listing[\"StandardFields\"][\"Photos\"]) > 0) {\n                        $thumb = $listing[\"StandardFields\"][\"Photos\"][0][\"Uri800\"];\n                    } else {\n                        $thumb = \'http://www.placehold.it/800x250?text=NO+PHOTO\';\n                    }\n\n                    $stai = $listing[\"StandardFields\"][\"StreetAdditionalInfo\"];\n					$stnu = $listing[\"StandardFields\"][\"StreetNumber\"];\n                    $stna = $listing[\"StandardFields\"][\"StreetName\"];\n                    //echo $stai . $stnu . $stna;\n                    $street = $stai != \'********\' ? $stai . \' \' : \'\';\n                    $street .= $stnu != \'********\' ? $stnu . \' \' : \'\';\n                    $street .= $stna != \'********\' ? $stna . \' \' : \'\';\n\n                    if (($count+2)%3 == 0) { ?> <div class=\"row mt-5 wow\"> <?php } ?>\n\n            <div class=\"col m4 s12 wow fadeIn\" data-wow-delay=\"0.2s\">\n            \n                <div class=\"card hoverable sticky-action\">\n                    <div class=\"card-image\">\n                        <div class=\"view overlay hm-white-slight activator\" style=\"height:250px; background-repeat: no-repeat; background-size: cover; background-position: center;background-image:url(\'<?php echo $thumb ?>\');\"></div>\n                        <!--a href=\"<?php echo $base_url.\"/properties/detail/\".$listing[\"StandardFields\"][\"ListingId\"] ?>\" class=\"btn-floating halfway-fab waves-effect waves-light indigo\"><i class=\"material-icons\">add</i></a-->\n                    </div>\n                    <div class=\"card-content\">\n                        <!--Title-->\n                        <h4 class=\"card-title activator right-align\"><?php echo $price ?><i class=\"material-icons right\">more_vert</i></h4>\n                        \n                        <!--Text-->\n                        <div class=\"card-text\">\n                            <p class=\"truncate\"><?php echo $street ?></p>\n                            <p><?php echo $listing[\"StandardFields\"][\"City\"] ?></p>\n                            <!--p>MLS Number: <?php echo $listing[\"StandardFields\"][\"ListingId\"] ?></p-->\n                        </div>\n                        <!--a href=\"#\" class=\"btn btn-primary\">Button</a-->\n                    </div>\n                    <div class=\"card-action\">\n                        <a href=\"<?php echo $base_url.\"/properties/detail/\".$listing[\"StandardFields\"][\"ListingId\"] ?>\" class=\"btn halfway-fab waves-effect waves-light indigo right\"><i class=\"material-icons\">visibility</i></a>\n                        <p><?php echo $listing[\"StandardFields\"][\"ListingId\"]?></p>\n                    </div>\n                    <div class=\"card-reveal activator\">\n                        <span class=\"card-title grey-text text-darken-4\"><i class=\"material-icons right activator\">close</i><?php echo $street ?></span>\n                        <p><?php echo $listing[\"StandardFields\"][\"City\"] ?></p>\n                        <p><?= $listing[\"StandardFields\"][\"PublicRemarks\"] ?></p>\n                    </div>\n                </div>\n            </div>\n                    \n            <?php if (($count)%3 == 0 || $count == sizeof($listings) -1) { ?> </div> <?php } } }?>\n            \n\n        <hr>\n\n        <ul class=\"pagination center-align\">\n            <?php if ($page > 1) { ?>\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/properties\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page-1) ?>\"><i class=\"material-icons\">chevron_left</i></a></li>\n            <?php } ?>\n                \n            <?php \n                $total_pages = $listings[sizeof($listings)-1][\"TotalPages\"];\n                for($x = $page - 3; $x <= $page + 3; $x++) { \n                    if ($x > 0 && $x <= $total_pages) {?>\n                        <li class=\"waves-effect <?php echo $x == $page ? \'active indigo\' : \'\' ?>\"><a href=\"<?php echo $base_url.\"/properties\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".$x ?>\"><?php echo $x ?></a></li>\n                <?php } }\n            ?>\n\n            <?php if ($page < $total_pages) { ?>\n                <li class=\"waves-effect\"><a href=\"<?php echo $base_url.\"/properties\".\"/\".$city.\"/\".$property_type.\"/\".$list_price.\"/\".($page+1) ?>\"><i class=\"material-icons\">chevron_right</i></a></li>\n            <?php } ?>   \n        </ul>\n        \n    </div>\n</main>\n\n{layout:set name=\"scripts\"}\n    <!--script src=\"{theme_folder_url}site/default/asset/js/mls.js\" ></script>\n    <script>\n        var portal = <?php echo $portal; ?>;\n        var language = \'<?php echo $language; ?>\';\n        var exchange_rate = <?php echo $exchange_rate; ?>;\n        var selectedListing = \'\';\n        \n        function autoLoad(){\n            $(\'#mls_number\').val(\'<?php echo $mls_number; ?>\');\n            $(\'#city\').val(\'<?php echo $city; ?>\');\n            $(\'#property_type\').val(\'<?php echo $property_type; ?>\');\n            $(\'#list_price\').val(\'<?php echo $list_price; ?>\');\n            $(\'#development\').val(\'<?php echo $development; ?>\');\n            $(\'#submit\').click();\n        }\n        \n        $(function(){\n            $(\'#property_type\').change(function(){\n                if ($(this).val() != \'E\') {\n                    $(\"#list_price option[value=\'Le 200000.0\']\").remove();\n                } else if ($(\"#list_price option[value=\'Le 200000.0\']\").length == 0) {\n                    $(\'#list_price option:first\').after(\'<option value=\"Le 200000.0\"><?php echo $lang[$language][\'under\']; ?> 200,000 USD</option>\');\n                }\n            });\n        });\n    </script-->\n    <script>\n        //$(\'select\').formSelect();\n\n        $(\"#searchBtn\").click(function(){\n            var redirect = \"/properties\";\n            if ($.trim($(\"#mls_number\").val()) != \"\"){\n                redirect += \"/detail/\" + $(\"#mls_number\").val();\n            } else {\n                redirect += \"/\"+$(\"#city\").val();\n                redirect += \"/\"+$(\"#property_type\").val();\n                redirect += \"/\"+$(\"#list_price\").val();\n            }\n            console.log(redirect);\n            $(this).addClass(\'disabled\');\n            window.location.href = redirect;\n        });\n\n    </script>\n{/layout:set}', NULL, 1541128972, 1, 'n', 0, '', 'n', 'y', 'o', 0, 'n'),
(29, 1, 12, 'index', 'webpage', '{layout=\'layouts/_main-layout\'}\n\n<?php\n    $images = array_slice(scandir($_SERVER[\'DOCUMENT_ROOT\'].\"/images/layout/slider/min/\"),2);\n    shuffle($images);\n?>\n<div class=\"hero\" style=\"background-image: url(\'/images/layout/slider/min/<?=$images[0]?>\')\"></div>\n\n<main>\n  <div class=\"container\">\n    {exp:channel:entries channel=\"blog\" limit=\"1\" dynamic=\"yes\"}\n      <h2>{title}</h2>\n      {blog_content}\n    {/exp:channel:entries}\n  </div>\n</main>\n\n<div class=\"spacer-100\"></div>', NULL, 1539310105, 1, 'n', 0, '', 'n', 'y', 'o', 0, 'n'),
(30, 1, 11, 'detail', 'webpage', '{layout=\'layouts/_main-layout\'}\n\n<?php\n    error_reporting( E_ALL ); //debug\n    //require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/Core.php\");\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/flexmlsAPI.php\");\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/lang/lang.php\");\n    $language = isset($_GET[\'lang\']) ? trim($_GET[\'lang\']) : \'en\';\n    $protocol = strtolower(substr($_SERVER[\"SERVER_PROTOCOL\"],0,5))==\'https://\'?\'https://\':\'http://\';\n    $hostName = $_SERVER[\'HTTP_HOST\'];\n    $base_url = $protocol.$hostName;\n    $search_results = \"\";\n    //var_dump($_SERVER);\n    if (isset($_SERVER[\'HTTP_REFERER\']) && strpos($_SERVER[\'HTTP_REFERER\'], $base_url.\'/listing\') > -1 ) { $search_results =  $_SERVER[\'HTTP_REFERER\']; }\n    //$api = new SparkAPI_APIAuth(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\"); //Core.php\n    $api = new flexmlsAPI(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\"); //flexmlsAPI.php\n    $api->SetApplicationName(\"Diamante-MLS-Search/1.0\");\n    $api->SetDeveloperMode(false);\n    $auth = $api->Authenticate();\n    if ($auth === false) api_error_thrown($api);\n\n    $id = \"{segment_3}\";\n    //echo $id;\n    $parameters = array(\"_expand\" => \'CustomFields,Photos\');\n    $listing = $api->GetListings(array(\"_filter\" => \"ListingId Eq \'\" . $id . \"\'\" , \"_expand\" => \'CustomFields,Photos\', \"_limit\" => \"1\", \"_pagination\" => true));\n    //$listing = $api->GetListing($id,$parameters);\n\n    //var_dump($listing);\n    if ($listing != null){\n        $standard = $listing[0][\'StandardFields\'];\n        $custom = $listing[0][\'CustomFields\'][0];\n\n        $main_photo = \'\';\n        $main_photo_name = \'\';\n        $photos = $standard[\'Photos\'];\n\n        foreach ($photos as $item) {\n            if ($item[\'Primary\'] == 1) {\n                $main_photo = $item[\'Uri1600\'];\n                $main_photo_name = $item[\'Name\'];\n            }\n        }\n\n        $general_desc = null;\n\n        $main = null;\n        $details = null;\n\n        $stai = $standard[\"StreetAdditionalInfo\"];\n        $stnu = $standard[\"StreetNumber\"];\n        $stna = $standard[\"StreetName\"];\n        //echo $stai . $stnu . $stna;\n        $street = $stai != \'********\' ? $stai . \' \' : \'\';\n        $street .= $stnu != \'********\' ? $stnu . \' \' : \'\';\n        $street .= $stna != \'********\' ? $stna . \' \' : \'\';\n\n        $exchange_rate = 1;\n\n        if($language == \'es\') {\n            $xml = simplexml_load_file(\"http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml\")->Cube[0]->Cube[0];\n            $usd = 0;\n            $mxn = 0;\n            foreach ($xml->Cube as $item) {\n                if((string)$item[\'currency\'] === \'USD\')\n                    $usd = (real)$item[\'rate\'];\n                    \n                if((string)$item[\'currency\'] === \'MXN\')\n                    $mxn = (real)$item[\'rate\'];\n            }\n    \n            $exchange_rate = $mxn/$usd;\n        }\n\n        if($language == \'es\'){\n            $price = \"$\" . number_format($standard[\"ListPrice\"] * $exchange_rate,2) . \" MXN\";\n        }\n        else{\n            $price = \"$\" . number_format($standard[\"ListPrice\"],2) . \" USD\";\n        }\n\n        $description = \'\';\n\n        if($language == \'es\'){\n            error_reporting(0);\n            $json = file_get_contents(\'https://www.googleapis.com/language/translate/v2?key=AIzaSyA2XBI0Wlol8wIHwZ28nGvtpk01VBgdDAQ&q=\' . urlencode($standard[\'PublicRemarks\']) . \'&source=en&target=es\');\n            $json = json_decode($json, true);\n            $translations = $json[\'data\'][\'translations\'];\n            \n            foreach($translations as $translation) {\n                $description .= \"{$translation[\'translatedText\']}\";\n            }\n            \n            if(trim($description) == \'\')\n                $description = preg_replace(\'/[^a-zA-Z0-9\\s\\.,()-]/\',\'\', $standard[\'PublicRemarks\']);\n\n            echo \'<em style=\"font-size:10px;\">&bull; Los precios en pesos son calculados en base al tipo de cambio al momento de la consulta; el precio puede variar.<br />&bull; La información mostrada se tradujo de forma automatizada por lo tanto puede ser imprecisa.</em><br /><br />\';\n        }\n        else{\n            $description = preg_replace(\'/[^a-zA-Z0-9\\s\\.,()-]/\',\'\', $standard[\'PublicRemarks\']);\n        }\n\n        $map_lat = (str_replace(\"*\", \"\", number_format($standard[\'Latitude\'],6,\'.\',\'\')) == \"\") ? 24.161754 : $standard[\'Latitude\'];\n        $map_lon = (str_replace(\"*\", \"\", number_format($standard[\'Longitude\'],6,\'.\',\'\')) == \"\") ? -110.318013 : $standard[\'Longitude\'];\n\n    } //if listing != null\n?>\n\n{layout:set name=\"styles\"}\n    <style>\n        .hero{\n            background-image: url(\'<?=$main_photo?>\');\n        }\n\n        #map_container {\n            width:100%;\n            height:500px;\n        }\n    </style>\n{/layout:set}\n\n\n<?php if($listing == null) { ?>\n    <main>\n        <div class=\"container\">\n            <h4 class=\"center\">Sorry, property not found</h4>\n\n            <p class=\"center\">\n                <?php if ($search_results != \"\") {?>\n                    <a href=\"<?=$search_results?>\" class=\"waves-effect waves-light btn\"><i class=\"material-icons left\">chevron_left</i> Back to search results  </a>\n                <?php } else { ?>\n                    <a href=\"/listing\" class=\"waves-effect waves-light btn\"><i class=\"material-icons left\">chevron_left</i> Back to listing </a>\n                <?php } ?>\n            </p>\n        </div>\n    </main>\n\n<?php } else { ?> \n\n    <div class=\"hero\">\n\n    </div>\n\n    <main>\n\n        <div class=\"container\">\n            <div class=\"row\">\n                <div class=\"col s12 m10\">\n\n                    <div id=\"description\" class=\"section scrollspy\">\n                        <h4><?= $id ?> / <?= $street ?></h4>\n                        <h5><?= $price ?></h5>  \n\n                        <p class=\"flow-text\"><?= $description ?> </p>\n                    </div>\n\n                    <div id=\"features\" class=\"section scrollspy\">\n                        <h5>Features</h5>\n                    </div>\n\n                    <div id=\"gallery\" class=\"section scrollspy\">\n                        <h5>Gallery</h5>\n\n                        <div class=\"carousel carousel-slider\">\n                            \n                                <?php foreach ($standard[\'Photos\'] as $photo) { ?>\n                                    <a class=\"carousel-item\" href=\"#<?=$photo[\'Id\']?>\">\n                                        <img src=\"<?=$photo[\'Uri800\']?>\">\n                                    </a>\n                                <?php } ?>\n                            \n                        </div>\n                    </div>\n\n                    <div id=\"map\" class=\"section scrollspy\">\n                        <h5>Map</h5>\n                        <div id=\"map_container\"></div>\n                    </div>\n\n                    \n                </div>\n                <div class=\"col hide-on-small-only m2\">\n                    <div class=\"pushpin\">            \n                        <h6>\n                            <?php if ($search_results != \"\") {?>\n                                <a href=\"<?=$search_results?>\"><i class=\"material-icons left\">chevron_left</i> Back to search results  </a>\n                            <?php } else { ?>\n                                <a href=\"/listing\"><i class=\"material-icons left\">chevron_left</i> Back to listing </a>\n                            <?php } ?>\n                        </h6>\n                        <ul class=\"section table-of-contents\">\n                            <li><a href=\"#description\">Description</a></li>\n                            <li><a href=\"#features\">Features</a></li>\n                            <li><a href=\"#gallery\">Gallery</a></li>\n                            <li><a href=\"#map\">Map</a></li>\n                        </ul>\n                    </div>\n                    <?php //var_dump($listing) ?>\n                </div>\n            </div>\n        </div>\n\n    </main>\n<?php } ?>\n\n\n{layout:set name=\"scripts\"}\n    <script src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyAnEhkVDYEAhWmyleuk7rvrVD6XcJ72q5A&callback=loadMap\" async defer></script>\n    <script>\n        function loadMap(){\n            var latlng = new google.maps.LatLng(<?php echo $map_lat . \',\' . $map_lon; ?>);\n            var opt = {\n                zoom: 15,\n                center: latlng,\n                mapTypeId: google.maps.MapTypeId.HYBRID\n            }\n            var map = new google.maps.Map(document.getElementById(\"map_container\"), opt);\n\n            var info = \'<p class=\"map_info\"><div class=\"thumb\"><img src=\"<?php echo $photos[0][\'UriThumb\']; ?>\" /></div>\'+\n                \'<b> <?php echo $price; ?></b><br />\'+\n                \'<?php echo $street; ?><br /><?php echo $standard[\'City\']; ?><br />\'+\n                \'<i class=\"\"><?php echo $standard[\'ListingId\']; ?></i></p>\';\n\n            var infowindow = new google.maps.InfoWindow({\n                content: info\n            });\n\n            var marker = new google.maps.Marker({\n                position: latlng,\n                animation: google.maps.Animation.DROP,\n                map: map,\n                title:\"<?php echo $street; ?>\"\n            });\n            \n            infowindow.open(map,marker);\n            \n            google.maps.event.addListener(marker, \'click\', function() {\n                infowindow.open(map,marker);\n            });\n        }\n\n        $( document ).ready(function(){\n            //$(\'.slider\').slider();\n            $(\'.carousel.carousel-slider\').carousel({\n                fullWidth: true,\n                indicators: true\n            });\n            $(\'.scrollspy\').scrollSpy();\n            $(\'.pushpin\').pushpin();\n            /*$(\'#fullscreen-btn\').click(function(){\n                var elem = document.querySelector(\'.slider\');\n                var instance = M.Slider.getInstance(elem);\n                instance.destroy(); \n                //$(\'.slider\').slider(\'destroy\');\n                $(\'.slider\').addClass(\'fullscreen\');\n                $(\'.slider\').slider();\n            });*/\n        });\n        \n    </script>\n{/layout:set}', NULL, 1538356809, 1, 'n', 0, '', 'n', 'y', 'o', 0, 'n'),
(31, 1, 11, 'index_bkp', 'webpage', '{layout=\'layouts/_main-layout\'}\n\n<?php\n    $portal = isset($_GET[\'portal\']) ? trim($_GET[\'portal\']) : 0;\n    $mls_number = isset($_GET[\'mls_number\']) ? trim($_GET[\'mls_number\']) : \'\';\n    $city = isset($_GET[\'city\']) ? trim($_GET[\'city\']) : \'\';\n    $property_type = isset($_GET[\'property_type\']) ? trim($_GET[\'property_type\']) : \'\';\n    $list_price = isset($_GET[\'list_price\']) ? trim($_GET[\'list_price\']) : \'\';\n    $development = isset($_GET[\'development\']) ? trim($_GET[\'development\']) : \'\';\n    $language = isset($_GET[\'lang\']) ? trim($_GET[\'lang\']) : \'en\';\n    $exchange_rate = 1;\n\n    if($language == \'es\') {\n        $xml = simplexml_load_file(\"http://www.ecb.int/stats/eurofxref/eurofxref-daily.xml\")->Cube[0]->Cube[0];\n        $usd = 0;\n        $mxn = 0;\n        foreach ($xml->Cube as $item) {\n            if((string)$item[\'currency\'] === \'USD\')\n                $usd = (real)$item[\'rate\'];\n                \n            if((string)$item[\'currency\'] === \'MXN\')\n                $mxn = (real)$item[\'rate\'];\n        }\n\n        $exchange_rate = $mxn/$usd;\n    }\n\n    //*** English ***\n    $lang[\'en\'][\'mls_number\'] = \'MLS number\';\n    $lang[\'en\'][\'city\'] = \'City\';\n    $lang[\'en\'][\'property_type\'] = \'Property type\';\n    $lang[\'en\'][\'price\'] = \'Price\';\n    $lang[\'en\'][\'any\'] = \'Any\';\n    $lang[\'en\'][\'submit\'] = \'Submit\';\n    $lang[\'en\'][\'cabo_corridor\'] = \'Cabo Corridor\';\n    $lang[\'en\'][\'san_jose_corridor\'] = \'San Jose Corridor\';\n    $lang[\'en\'][\'east_cape\'] = \'East Cape\';\n    $lang[\'en\'][\'pacific_side\'] = \'Pacific Side\';\n    $lang[\'en\'][\'condos\'] = \'Condos\';\n    $lang[\'en\'][\'houses\'] = \'Houses\';\n    $lang[\'en\'][\'townhouses\'] = \'Townhouses\';\n    $lang[\'en\'][\'land\'] = \'Land\';\n    $lang[\'en\'][\'commercial\'] = \'Commercial\';\n    $lang[\'en\'][\'business\'] = \'Business\';\n    $lang[\'en\'][\'fractional\'] = \'Fractional\';\n    $lang[\'en\'][\'multifamily\'] = \'MultiFamily\';\n    $lang[\'en\'][\'under\'] = \'Under\';\n    $lang[\'en\'][\'over\'] = \'Over\';\n    $lang[\'en\'][\'results\'] = \'Results\';\n    $lang[\'en\'][\'email_the_agent\'] = \'Email The Agent\';\n    $lang[\'en\'][\'login\'] = \'Login\';\n    $lang[\'en\'][\'property_consultation\'] = \'Property Consultation\';\n    $lang[\'en\'][\'details\'] = \'Details\';\n    $lang[\'en\'][\'photos\'] = \'Photos\';\n    $lang[\'en\'][\'map\'] = \'Map\';\n    $lang[\'en\'][\'yes\'] = \'Yes\';\n    $lang[\'en\'][\'no\'] = \'No\';\n    $lang[\'en\'][\'developments\'] = \'Developments\';\n    //*** Spanish ***\n    $lang[\'es\'][\'mls_number\'] = \'N&uacute;mero MLS\';\n    $lang[\'es\'][\'city\'] = \'Ciudad\';\n    $lang[\'es\'][\'property_type\'] = \'Tipo de propiedad\';\n    $lang[\'es\'][\'price\'] = \'Precio\';\n    $lang[\'es\'][\'any\'] = \'Cualquiera\';\n    $lang[\'es\'][\'submit\'] = \'Enviar\';\n    $lang[\'es\'][\'cabo_corridor\'] = \'Corredor - San Lucas\';\n    $lang[\'es\'][\'san_jose_corridor\'] = \'Corredor - San Jose\';\n    $lang[\'es\'][\'east_cape\'] = \'Cabo del Este\';\n    $lang[\'es\'][\'pacific_side\'] = \'Pac&iacute;fico\';\n    $lang[\'es\'][\'condos\'] = \'Condominios\';\n    $lang[\'es\'][\'houses\'] = \'Casas\';\n    $lang[\'es\'][\'townhouses\'] = \'Residencias\';\n    $lang[\'es\'][\'land\'] = \'Terrenos\';\n    $lang[\'es\'][\'commercial\'] = \'Comercial\';\n    $lang[\'es\'][\'business\'] = \'Negocio\';\n    $lang[\'es\'][\'fractional\'] = \'Fraccionamiento\';\n    $lang[\'es\'][\'multifamily\'] = \'Multi-Familiar\';\n    $lang[\'es\'][\'under\'] = \'Menos de\';\n    $lang[\'es\'][\'over\'] = \'Mas de\';\n    $lang[\'es\'][\'results\'] = \'Resultados\';\n    $lang[\'es\'][\'email_the_agent\'] = \'Enviar Email al Agente\';\n    $lang[\'es\'][\'login\'] = \'Acceder\';\n    $lang[\'es\'][\'property_consultation\'] = \'Consulta de Propiedad\';\n    $lang[\'es\'][\'details\'] = \'Detalles\';\n    $lang[\'es\'][\'photos\'] = \'Fotos\';\n    $lang[\'es\'][\'map\'] = \'Mapa\';\n    $lang[\'es\'][\'yes\'] = \'Si\';\n    $lang[\'es\'][\'no\'] = \'No\';\n    $lang[\'es\'][\'developments\'] = \'Desarrollos\';\n\n    require_once($_SERVER[\'DOCUMENT_ROOT\'] . \"/flexmls/flexmlsAPI.php\");\n    $api = new flexmlsAPI(\"cab_westerlund_key_1\", \"5lCZrVg8d4uYSviaNIN4t\");\n    $api->SetApplicationName(\"Diamante-MLS-Search/1.0\");\n    $api->SetDeveloperMode(false);\n    $auth = $api->Authenticate();\n    if ($auth === false) api_error_thrown($api);\n\n    $parameters = null;\n    $listings = null;\n    $mls_number = $_GET[\'mls_number\'];\n    $city = urldecode($_GET[\'city\']);\n    $property_type = $_GET[\'property_type\'];\n    $list_price = $_GET[\'list_price\'];\n    $page = isset($_GET[\'page\']) ? trim($_GET[\'page\']) : 1;\n    $featured = isset($_GET[\'featured\']) ? $_GET[\'featured\'] : 0;\n    $development = isset($_GET[\'development\']) ? $_GET[\'development\'] : \'\';\n\n    if($mls_number != \'\') {\n        $parameters = array(\"_filter\" => \"ListingId Eq \'$mls_number\'\", \"_expand\" => \'PrimaryPhoto\', \"_limit\" => \"1\", \"_pagination\" => true);\n        $listings = $api->GetListings($parameters);\n    }\n    else {\n        $filter = \'\';\n        $p_type = ($property_type != \"\") ? \"PropertyType Eq \'$property_type\'\": \"Not PropertyType Eq \'H\'\";\n        $filter .= ($filter != \'\') ? \" And $p_type\" : \"$p_type\" ;\n        $filter .= ($city != \'\') ? (($filter != \'\') ? \" And $city\" : \"$city\" ) : \'\';\n        $filter .= ($list_price != \'\') ? (($filter != \'\') ? \" And ListPrice $list_price\" : \"ListPrice $list_price\" ) : \'\';\n        if ($development == \'Terrazas\' || $development == \'Torres Cantera\' || $development == \'Vista Coral\' || $development == \'Paseo del Malecon\' || $development == \'Puerto Ilusion\' || $development == \'Querencia\' || $development == \'Palmilla\') {\n            $filter .= ($filter != \'\') ? \" And StreetAdditionalInfo Eq \'$development*\'\" : \"StreetAdditionalInfo Eq \'$development*\'\";\n        }\n        else {\n            $filter .= ($development != \'\') ? (($filter != \'\') ? \" And SubdivisionName Eq \'$development\'\" : \"SubdivisionName Eq \'$development\'\" ) : \'\';\n        }\n        $filter = stripslashes($filter);\n\n        if($featured == 1) {\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 25, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\n            $listings = $api->GetMyListings($parameters);\n        }\n        else {\n            $parameters = array(\"_filter\" => $filter, \"_expand\" => \'PrimaryPhoto\', \"_limit\" => 25, \"_pagination\" => true, \"_page\" => $page, \"_orderby\" => \'ListPrice\');\n            $listings = $api->GetListings($parameters);\n        }\n    }\n    $listings[count($listings)] = array(\"LastCount\" => $api->last_count, \"PageSize\" => $api->page_size, \"TotalPages\" => $api->total_pages, \"CurrentPage\" => $api->current_page);\n    echo json_encode($listings);\n?>\n\n<div class=\"container-fluid content\" style=\"margin-top:100px;\">\n    <input id=\"submit\" type=\"button\" value=\"<?php echo $lang[$language][\'submit\']; ?>\" />\n    <div class=\"results\">\n        <div id=\"listings\"></div>\n    </div>\n</div>\n\n{layout:set name=\"scripts\"}\n    <script src=\"{theme_folder_url}site/default/asset/js/mls.js\" ></script>\n    <script>\n        var portal = <?php echo $portal; ?>;\n        var language = \'<?php echo $language; ?>\';\n        var exchange_rate = <?php echo $exchange_rate; ?>;\n        var selectedListing = \'\';\n        \n        function autoLoad(){\n            $(\'#mls_number\').val(\'<?php echo $mls_number; ?>\');\n            $(\'#city\').val(\'<?php echo $city; ?>\');\n            $(\'#property_type\').val(\'<?php echo $property_type; ?>\');\n            $(\'#list_price\').val(\'<?php echo $list_price; ?>\');\n            $(\'#development\').val(\'<?php echo $development; ?>\');\n            $(\'#submit\').click();\n        }\n        \n        $(function(){\n            $(\'#property_type\').change(function(){\n                if ($(this).val() != \'E\') {\n                    $(\"#list_price option[value=\'Le 200000.0\']\").remove();\n                } else if ($(\"#list_price option[value=\'Le 200000.0\']\").length == 0) {\n                    $(\'#list_price option:first\').after(\'<option value=\"Le 200000.0\"><?php echo $lang[$language][\'under\']; ?> 200,000 USD</option>\');\n                }\n            });\n        });\n    </script>\n{/layout:set}', NULL, 1538270133, 1, 'n', 0, '', 'n', 'n', 'o', 0, 'n'),
(32, 1, 13, 'index', 'webpage', '{layout=\'layouts/_main-layout\'}\n\n<?php\n    $images = array_slice(scandir($_SERVER[\'DOCUMENT_ROOT\'].\"/images/layout/slider/min/\"),2);\n    shuffle($images);\n?>\n<div class=\"hero\" style=\"background-image: url(\'/images/layout/slider/min/<?=$images[0]?>\')\"></div>\n\n<main>\n  <div class=\"container\">\n    <h2>Contact Us</h2>\n    <p>\n      Please feel free to contact us for more detailed information, while Diamante Associates is based in the Southern Baja with our main offices in La Paz and La Ventana, we do provide US based phone numbers forwarded to us for easier communications with our clients.\n    </p>\n    <div class=\"row\">\n      <div class=\"col s12 m6\">\n        <h4>United States</h4>\n        <p>Cell: 1-360-836-6058<br>\n        Fax: 1-888-650-4092</p>\n        \n        <h4>La Paz</h4>\n        <p>Tel: (612)-122-8363</p>\n\n        <h4>La Ventana</h4>\n        <p>Tel: (612)-114-0374</p>\n\n        <h4>Cabo San Lucas</h4>\n        <p>Tel : 624-143-0372</p>\n\n      </div>\n      <div class=\"col s12 m6\">\n        \n        {exp:formgrab:form name=\"contact_form\" title=\"Contact Form\"}       \n        <div class=\"row\">\n          <div class=\"col s12 m6\">\n            <p>\n              <label for=\"from\">Name:</label><br />\n              <input type=\"text\" id=\"from\" name=\"from\" size=\"40\" maxlength=\"35\" value=\"\" />\n            </p>\n          </div>\n          <div class=\"col s12 m6\">\n            <p>\n              <label for=\"phone\">Phone:</label><br />\n              <input type=\"text\" id=\"phone\" name=\"phone\" size=\"40\" maxlength=\"35\" value=\"\" />\n            </p>\n          </div>\n        </div>\n        <div class=\"row\">\n          <div class=\"col s12 m6\">\n            <p>\n              <label for=\"emial\">Email:</label><br />\n              <input type=\"text\" id=\"email\" name=\"email\" size=\"40\" maxlength=\"35\" value=\"\" />\n            </p>\n          </div>\n          <div class=\"col s12 m6\">\n            <p>\n              <label for=\"subject\">Subject:</label><br />\n              <input type=\"text\" id=\"subject\" name=\"subject\" size=\"40\" value=\"\" />\n            </p>\n          </div>\n        </div>\n\n        <p>\n          <label for=\"message\">Message:</label><br />\n          <textarea id=\"message\" name=\"message\" rows=\"20\" style=\"height:300px\"> </textarea>\n        </p>\n        <p>\n          <input name=\"submit\" class=\"btn\" type=\'submit\' value=\'Submit Form\' />\n        </p>\n        {/exp:formgrab:form}\n      </div>\n    </div>\n  </div>\n</main>\n<div class=\"spacer-100\"></div>', NULL, 1539310105, 1, 'n', 0, '', 'n', 'y', 'o', 0, 'n'),
(33, 1, 13, 'thanks', 'webpage', '{layout=\'layouts/_main-layout\'}\n\n<?php\n    $images = array_slice(scandir($_SERVER[\'DOCUMENT_ROOT\'].\"/images/layout/slider/min/\"),2);\n    shuffle($images);\n?>\n<div class=\"hero\" style=\"background-image: url(\'/images/layout/slider/min/<?=$images[0]?>\')\"></div>\n\n<main>\n    <div class=\"container\">\n        <h2>Contact Us</h2>\n    </div>\n    <p class=\"center\">Thank you for your comments.</p>\n</main>\n<div class=\"spacer-100\"></div>', NULL, 1538597912, 1, 'n', 0, '', 'n', 'y', 'o', 0, 'n'),
(34, 1, 14, 'index', 'webpage', '', NULL, 1541131432, 1, 'n', 0, '', 'n', 'y', 'o', 0, 'n');

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
(10, 1, 'listing', 3, 'n'),
(11, 1, 'properties', 4, 'n'),
(12, 1, 'article', 5, 'n'),
(13, 1, 'contact', 6, 'n'),
(14, 1, 'agents', 7, 'n');

-- --------------------------------------------------------

--
-- Table structure for table `exp_template_member_groups`
--

DROP TABLE IF EXISTS `exp_template_member_groups`;
CREATE TABLE `exp_template_member_groups` (
  `group_id` smallint(4) UNSIGNED NOT NULL,
  `template_group_id` mediumint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_template_member_groups`
--

INSERT INTO `exp_template_member_groups` (`group_id`, `template_group_id`) VALUES
(3, 11);

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
(1, 1515540988, 'Smartforge::add_key failed. Table \'exp_comments\' does not exist.', 'Smartforge::add_key', 105, '/var/www/bajamls/system/ee/EllisLab/Addons/comment/upd.comment.php'),
(2, 1537474898, 'Update complete. Now running version 4.0.4', NULL, NULL, NULL),
(3, 1537475712, 'Updating to 4.0.5', NULL, NULL, NULL),
(4, 1537475720, 'Updating to 4.0.6', NULL, NULL, NULL),
(5, 1537475726, 'Updating to 4.0.7', NULL, NULL, NULL),
(6, 1537475731, 'Updating to 4.0.8', NULL, NULL, NULL),
(7, 1537475736, 'Updating to 4.0.9', NULL, NULL, NULL),
(8, 1537475741, 'Updating to 4.1.0', NULL, NULL, NULL),
(9, 1537475750, 'Updating to 4.1.1', NULL, NULL, NULL),
(10, 1537475755, 'Updating to 4.1.2', NULL, NULL, NULL),
(11, 1537475763, 'Updating to 4.1.3', NULL, NULL, NULL),
(12, 1537475771, 'Updating to 4.2.0', NULL, NULL, NULL),
(13, 1537475776, 'Updating to 4.2.1', NULL, NULL, NULL),
(14, 1537475780, 'Updating to 4.2.2', NULL, NULL, NULL),
(15, 1537475788, 'Updating to 4.2.3', NULL, NULL, NULL),
(16, 1537475793, 'Updating to 4.3.0', NULL, NULL, NULL),
(17, 1537475805, 'Updating to 4.3.1', NULL, NULL, NULL),
(18, 1537475810, 'Updating to 4.3.2', NULL, NULL, NULL),
(19, 1537475815, 'Updating to 4.3.3', NULL, NULL, NULL),
(20, 1537475823, 'Updating to 4.3.4', NULL, NULL, NULL),
(21, 1537475828, 'Update complete. Now running version 4.3.4.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `exp_update_notices`
--

DROP TABLE IF EXISTS `exp_update_notices`;
CREATE TABLE `exp_update_notices` (
  `notice_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `version` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_header` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exp_update_notices`
--

INSERT INTO `exp_update_notices` (`notice_id`, `message`, `version`, `is_header`) VALUES
(1, 'File upload directory found in themes/ee/', '4.2.2', 1),
(2, 'The themes/ee/ folder may be overwritten during upgrade. The following directories should be moved:<br><br>Blog: /var/www/bajamls/themes/ee/site/default/asset/img/blog/<br>Common: /var/www/bajamls/themes/ee/site/default/asset/img/common/<br>Home: /var/www/bajamls/themes/ee/site/default/asset/img/home/<br>See the <a href=\"https://docs.expressionengine.com/v4/installation/version_notes_4.2.2.html\">version notes</a> for details.', '4.2.2', 0);

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
-- Indexes for table `exp_channel_data_field_12`
--
ALTER TABLE `exp_channel_data_field_12`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_13`
--
ALTER TABLE `exp_channel_data_field_13`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_14`
--
ALTER TABLE `exp_channel_data_field_14`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_15`
--
ALTER TABLE `exp_channel_data_field_15`
  ADD PRIMARY KEY (`id`),
  ADD KEY `entry_id` (`entry_id`);

--
-- Indexes for table `exp_channel_data_field_17`
--
ALTER TABLE `exp_channel_data_field_17`
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
-- Indexes for table `exp_consents`
--
ALTER TABLE `exp_consents`
  ADD PRIMARY KEY (`consent_id`),
  ADD KEY `consent_request_version_id` (`consent_request_version_id`),
  ADD KEY `member_id` (`member_id`);

--
-- Indexes for table `exp_consent_audit_log`
--
ALTER TABLE `exp_consent_audit_log`
  ADD PRIMARY KEY (`consent_audit_id`),
  ADD KEY `consent_request_id` (`consent_request_id`);

--
-- Indexes for table `exp_consent_requests`
--
ALTER TABLE `exp_consent_requests`
  ADD PRIMARY KEY (`consent_request_id`),
  ADD KEY `consent_name` (`consent_name`);

--
-- Indexes for table `exp_consent_request_versions`
--
ALTER TABLE `exp_consent_request_versions`
  ADD PRIMARY KEY (`consent_request_version_id`),
  ADD KEY `consent_request_id` (`consent_request_id`);

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
-- Indexes for table `exp_email_tracker`
--
ALTER TABLE `exp_email_tracker`
  ADD PRIMARY KEY (`email_id`);

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
-- Indexes for table `exp_formgrab_forms`
--
ALTER TABLE `exp_formgrab_forms`
  ADD PRIMARY KEY (`form_id`),
  ADD KEY `site_id` (`site_id`);

--
-- Indexes for table `exp_formgrab_submissions`
--
ALTER TABLE `exp_formgrab_submissions`
  ADD PRIMARY KEY (`submission_id`),
  ADD KEY `site_id` (`site_id`),
  ADD KEY `form_id` (`form_id`);

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
-- Indexes for table `exp_update_notices`
--
ALTER TABLE `exp_update_notices`
  ADD PRIMARY KEY (`notice_id`);

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
  MODIFY `action_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

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
  MODIFY `channel_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_11`
--
ALTER TABLE `exp_channel_data_field_11`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_12`
--
ALTER TABLE `exp_channel_data_field_12`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_13`
--
ALTER TABLE `exp_channel_data_field_13`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_14`
--
ALTER TABLE `exp_channel_data_field_14`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_15`
--
ALTER TABLE `exp_channel_data_field_15`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exp_channel_data_field_17`
--
ALTER TABLE `exp_channel_data_field_17`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `exp_channel_entries_autosave`
--
ALTER TABLE `exp_channel_entries_autosave`
  MODIFY `entry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_channel_fields`
--
ALTER TABLE `exp_channel_fields`
  MODIFY `field_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `exp_channel_form_settings`
--
ALTER TABLE `exp_channel_form_settings`
  MODIFY `channel_form_settings_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `entry_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
-- AUTO_INCREMENT for table `exp_consents`
--
ALTER TABLE `exp_consents`
  MODIFY `consent_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_consent_audit_log`
--
ALTER TABLE `exp_consent_audit_log`
  MODIFY `consent_audit_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exp_consent_requests`
--
ALTER TABLE `exp_consent_requests`
  MODIFY `consent_request_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_consent_request_versions`
--
ALTER TABLE `exp_consent_request_versions`
  MODIFY `consent_request_version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exp_content_types`
--
ALTER TABLE `exp_content_types`
  MODIFY `content_type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exp_cp_log`
--
ALTER TABLE `exp_cp_log`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

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
-- AUTO_INCREMENT for table `exp_email_tracker`
--
ALTER TABLE `exp_email_tracker`
  MODIFY `email_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `group_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `exp_files`
--
ALTER TABLE `exp_files`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- AUTO_INCREMENT for table `exp_formgrab_forms`
--
ALTER TABLE `exp_formgrab_forms`
  MODIFY `form_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `exp_formgrab_submissions`
--
ALTER TABLE `exp_formgrab_submissions`
  MODIFY `submission_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `member_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `module_id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
  MODIFY `hash_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

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
  MODIFY `template_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `template_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `exp_template_groups`
--
ALTER TABLE `exp_template_groups`
  MODIFY `group_id` int(6) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `exp_update_notices`
--
ALTER TABLE `exp_update_notices`
  MODIFY `notice_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exp_upload_prefs`
--
ALTER TABLE `exp_upload_prefs`
  MODIFY `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
