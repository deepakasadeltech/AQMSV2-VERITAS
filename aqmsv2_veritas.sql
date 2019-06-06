-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 06, 2019 at 10:56 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aqmsv2_veritas`
--

-- --------------------------------------------------------

--
-- Table structure for table `calls`
--

CREATE TABLE `calls` (
  `id` int(10) UNSIGNED NOT NULL,
  `queue_id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `counter_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `number` int(11) NOT NULL,
  `priority` int(6) DEFAULT '4' COMMENT '1=platinum,2=Gold,3=Silver,4=Normal',
  `view_status` tinyint(1) NOT NULL DEFAULT '0',
  `called_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `doctor_work_start` int(11) DEFAULT '0',
  `doctor_work_start_date` datetime DEFAULT NULL,
  `doctor_work_end` int(11) DEFAULT '0',
  `doctor_work_end_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `calls`
--

INSERT INTO `calls` (`id`, `queue_id`, `department_id`, `counter_id`, `user_id`, `number`, `priority`, `view_status`, `called_date`, `created_at`, `updated_at`, `pid`, `doctor_work_start`, `doctor_work_start_date`, `doctor_work_end`, `doctor_work_end_date`) VALUES
(1, 2, 4, 3, 45, 4001, 2, 3, '2019-05-24', '2019-05-24 05:22:23', '2019-05-24 05:23:02', 2, 1, '2019-05-24 10:52:59', 1, '2019-05-24 10:53:02');

-- --------------------------------------------------------

--
-- Table structure for table `counters`
--

CREATE TABLE `counters` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_sequence` int(10) DEFAULT NULL,
  `pid` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `counters`
--

INSERT INTO `counters` (`id`, `name`, `display_sequence`, `pid`, `department_id`, `created_at`, `updated_at`) VALUES
(1, 'PHY-309', 1, '1', '1', '2019-02-18 08:05:15', '2019-02-18 08:05:15'),
(2, 'ORTH-310A', 2, '2', '4', '2019-02-18 08:05:42', '2019-02-18 08:05:42'),
(3, 'ORTH-310B', 3, '2', '4', '2019-02-18 08:06:08', '2019-02-18 08:06:08'),
(4, 'ORTH-310C', 4, '2', '4', '2019-02-18 08:06:26', '2019-02-18 08:06:26'),
(5, 'SURG-311A', 5, '3', '5', '2019-02-18 08:07:00', '2019-02-18 08:07:00'),
(6, 'SURG-311B', 6, '3', '5', '2019-02-18 08:07:17', '2019-02-18 08:07:17'),
(7, 'SURG-311C', 7, '3', '5', '2019-02-18 08:07:32', '2019-02-18 08:07:32'),
(8, 'EYE-322A', 8, '4', '7', '2019-02-18 08:31:09', '2019-02-18 08:31:09'),
(9, 'EYE-322B', 9, '4', '7', '2019-02-18 08:31:28', '2019-02-18 08:31:28'),
(10, 'EYE-322C', 10, '4', '7', '2019-02-18 08:31:45', '2019-02-18 08:31:45'),
(11, 'ENT-321A', 11, '5', '8', '2019-02-18 08:32:10', '2019-02-18 08:32:10'),
(12, 'ENT-321B', 12, '5', '8', '2019-02-18 08:32:28', '2019-02-18 08:32:28'),
(13, 'ENT-321C', 13, '5', '8', '2019-02-18 08:32:46', '2019-02-18 08:32:46'),
(14, 'DEN-319', 14, '7', '9', '2019-02-18 08:33:12', '2019-02-18 08:33:12'),
(15, 'DEN-318', 15, '7', '9', '2019-02-18 08:34:12', '2019-02-18 08:34:12'),
(16, 'DEN-317', 16, '7', '9', '2019-02-18 08:34:47', '2019-02-18 08:34:47'),
(17, 'FAM-408', 17, '8', '10', '2019-02-18 08:35:48', '2019-02-18 08:35:48'),
(18, 'GYN-409A', 18, '9', '11', '2019-02-18 08:36:08', '2019-02-18 08:36:08'),
(19, 'GYN-409B', 19, '9', '11', '2019-02-18 08:36:28', '2019-02-18 08:36:28'),
(20, 'GYN-409C', 20, '9', '11', '2019-02-18 08:36:48', '2019-02-18 08:36:48'),
(21, 'GYN-407', 21, '9', '11', '2019-02-18 08:37:14', '2019-02-18 08:37:14'),
(22, 'PED-410A', 22, '6', '2', '2019-02-18 08:37:32', '2019-02-18 08:37:32'),
(23, 'PED-410B', 23, '6', '2', '2019-02-18 08:37:51', '2019-02-18 08:37:51'),
(24, 'PED-410C', 24, '6', '2', '2019-02-18 08:38:15', '2019-02-18 08:38:15'),
(25, 'AYU-411A', 25, '10', '12', '2019-02-18 08:38:41', '2019-02-18 08:38:41'),
(26, 'AYU-411B', 26, '10', '12', '2019-02-18 08:39:02', '2019-02-18 08:39:02'),
(27, 'AYU-411C', 27, '10', '12', '2019-02-18 08:39:37', '2019-02-18 08:39:37'),
(28, 'CHE-423A', 28, '11', '13', '2019-02-18 08:40:04', '2019-02-18 08:40:04'),
(29, 'CHE-423B', 29, '11', '13', '2019-02-18 08:41:45', '2019-02-18 08:41:45'),
(30, 'CHE-423C', 30, '11', '13', '2019-02-18 08:42:33', '2019-02-18 08:42:33'),
(31, 'MED-422A', 31, '14', '14', '2019-02-18 08:42:52', '2019-02-18 08:42:52'),
(32, 'MED-422B', 32, '14', '14', '2019-02-18 08:43:10', '2019-02-18 08:43:10'),
(33, 'MED-422C', 33, '14', '14', '2019-02-18 08:43:33', '2019-02-18 08:43:33'),
(34, 'PSY-421A', 34, '12', '3', '2019-02-18 11:37:56', '2019-02-18 11:37:56'),
(35, 'PSY-421B', 35, '12', '3', '2019-02-18 11:38:17', '2019-02-18 11:38:17'),
(36, 'PSY-421C', 36, '12', '3', '2019-02-18 11:38:38', '2019-02-18 11:38:38'),
(37, 'SKI-419A', 37, '13', '6', '2019-02-18 11:38:57', '2019-02-18 11:38:57'),
(38, 'SKI-419B', 38, '13', '6', '2019-02-18 11:39:18', '2019-02-18 11:39:18'),
(39, 'LAB-LG-01', 39, '16', '16', '2019-02-18 11:39:50', '2019-02-18 11:39:50'),
(40, 'LAB-LG-02', 40, '16', '16', '2019-02-18 11:40:11', '2019-02-18 11:40:11');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `letter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `is_uhid_required` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `letter`, `start`, `created_at`, `updated_at`, `pid`, `is_uhid_required`) VALUES
(1, 'Physiotherapy', '', 1000, '2019-02-07 10:09:10', '2019-02-19 08:57:08', 1, 2),
(2, 'Pediatric', '', 2000, '2019-02-07 10:09:41', '2019-02-17 08:58:06', 6, 2),
(3, 'Psychiatry', '', 3000, '2019-02-07 10:11:42', '2019-02-17 08:58:26', 12, 2),
(4, 'Orthopedic', '', 4000, '2019-02-07 10:14:23', '2019-05-24 05:14:20', 2, 2),
(5, 'Surgery', '', 5000, '2019-02-07 10:15:01', '2019-02-23 17:05:08', 3, 1),
(6, 'Skin', '', 6000, '2019-02-07 10:15:55', '2019-02-17 08:59:25', 13, 2),
(7, 'Eye', '', 7000, '2019-02-07 10:19:31', '2019-02-17 08:59:42', 4, 2),
(8, 'ENT', '', 8000, '2019-02-07 10:19:57', '2019-02-17 08:59:57', 5, 2),
(9, 'Dental', '', 9000, '2019-02-07 10:20:22', '2019-02-17 09:00:15', 7, 2),
(10, 'Family Planning', '', 1600, '2019-02-07 10:20:42', '2019-02-17 09:00:41', 8, 2),
(11, 'Gynecology', '', 2500, '2019-02-07 10:21:05', '2019-02-17 09:01:02', 9, 2),
(12, 'Ayurvedic', '', 3500, '2019-02-07 10:21:31', '2019-02-17 09:01:23', 10, 2),
(13, 'Chest', '', 4500, '2019-02-07 10:21:50', '2019-02-17 09:01:40', 11, 2),
(14, 'Medical', '', 5500, '2019-02-07 10:22:20', '2019-02-17 09:02:02', 14, 2),
(15, 'Medicine', 'M', 100, '2019-02-07 10:22:56', '2019-02-07 10:22:56', 15, 2),
(16, 'Laboratory', '', 6500, '2019-02-07 12:04:39', '2019-02-23 19:13:30', 16, 1);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_reports`
--

CREATE TABLE `doctor_reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `call_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctor_reports`
--

INSERT INTO `doctor_reports` (`id`, `call_id`, `department_id`, `pid`, `user_id`, `token_number`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 2, 45, '4001', '2019-05-24 10:52:59', '2019-05-24 10:53:02', '2019-05-24 05:23:02', '2019-05-24 05:23:02');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `code`, `name`, `display`, `image`, `created_at`, `updated_at`) VALUES
(1, 'gb', 'English', 'Google UK English Female', 'United-Kingdom.png', '2019-01-22 03:43:45', '2019-01-22 03:43:45'),
(2, 'tr', 'Turkish', 'Turkish Female', 'Turkey.png', '2019-01-22 03:43:45', '2019-01-22 03:43:45'),
(3, 'de', 'German', 'Deutsch Female', 'Germany.png', '2019-01-22 03:43:45', '2019-01-22 03:43:45'),
(4, 'es', 'Spanish', 'Spanish Female', 'Spain.png', '2019-01-22 03:43:45', '2019-01-22 03:43:45'),
(5, 'fr', 'French', 'French Female', 'France.png', '2019-01-22 03:43:45', '2019-01-22 03:43:45'),
(6, 'in', 'Hindi', 'Google हिन्दी', 'India.png', '2019-01-22 03:43:45', '2019-01-22 03:43:45'),
(7, 'it', 'Italian', 'Italian Female', 'Italy.png', '2019-01-22 03:43:45', '2019-01-22 03:43:45'),
(8, 'pt', 'Portuguese', 'Portuguese Female', 'Portugal.png', '2019-01-22 03:43:45', '2019-01-22 03:43:45'),
(9, 'ru', 'Russian', 'Russian Female', 'Russia.png', '2019-01-22 03:43:46', '2019-01-22 03:43:46'),
(10, 'sa', 'Arabic', 'Arabic Male', 'Saudi-Arabia.png', '2019-01-22 03:43:46', '2019-01-22 03:43:46'),
(11, 'sk', 'Slovak', 'Slovak Female', 'Slovakia.png', '2019-01-22 03:43:46', '2019-01-22 03:43:46'),
(12, 'th', 'Thai', 'Thai Female', 'Thailand.png', '2019-01-22 03:43:46', '2019-01-22 03:43:46'),
(13, 'id', 'Indonesian', 'Indonesian Female', 'Indonesia.png', '2019-01-22 03:43:46', '2019-01-22 03:43:46');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_07_16_161740_create_departments_table', 1),
(4, '2016_07_16_180929_create_counters_table', 1),
(5, '2016_07_16_190715_create_queues_table', 1),
(6, '2016_07_19_170334_create_calls_table', 1),
(7, '2016_08_24_231859_create_languages_table', 1),
(8, '2016_09_28_123908_create_settings_table', 1),
(10, '2019_01_25_111036_create_parent_departments_table', 2),
(12, '2019_01_25_164519_add_pid_to_departments', 3),
(13, '2019_01_25_210736_add_pid_to_calls', 4),
(14, '2019_01_25_222612_add_pid_to_queues', 5),
(15, '2019_01_25_224152_add_uhid_to_queues', 6),
(16, '2019_01_25_224359_add_priority_to_queues', 6),
(17, '2019_01_26_052008_add_is_uhid_required_to_departments', 7),
(18, '2019_01_26_055620_create_uhid_masters_table', 8),
(19, '2019_01_27_144115_create_doctor_reports_table', 9),
(20, '2019_01_29_152923_add_counter_id_to_users_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `parent_departments`
--

CREATE TABLE `parent_departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `parent_departments`
--

INSERT INTO `parent_departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Physiotherapy', '2019-02-07 10:00:41', '2019-02-07 10:00:41'),
(2, 'Orthopedic', '2019-02-07 10:00:57', '2019-02-07 10:00:57'),
(3, 'Surgery', '2019-02-07 10:01:07', '2019-02-07 10:01:07'),
(4, 'Eye', '2019-02-07 10:01:17', '2019-02-07 10:01:17'),
(5, 'ENT', '2019-02-07 10:01:26', '2019-02-07 10:01:26'),
(6, 'Pediatric', '2019-02-07 10:01:52', '2019-02-07 10:01:52'),
(7, 'Dental', '2019-02-07 10:02:03', '2019-02-07 10:02:03'),
(8, 'Family Planning', '2019-02-07 10:02:16', '2019-02-07 10:02:16'),
(9, 'Gynecology', '2019-02-07 10:02:45', '2019-02-07 10:02:45'),
(10, 'Ayurvedic', '2019-02-07 10:03:18', '2019-02-07 10:03:18'),
(11, 'Chest', '2019-02-07 10:03:28', '2019-02-07 10:03:28'),
(12, 'Psychiatry', '2019-02-07 10:05:20', '2019-02-07 10:05:20'),
(13, 'Skin', '2019-02-07 10:06:34', '2019-02-07 10:06:34'),
(14, 'Medical', '2019-02-07 10:06:45', '2019-02-07 10:06:45'),
(15, 'Medicine', '2019-02-07 10:06:53', '2019-02-07 10:06:53'),
(16, 'Laboratory', '2019-02-07 10:38:49', '2019-02-07 10:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('anujmishra.it@gmail.com', 'fe6c1fc8e98981f46a24c5e4125042697a0434b66ea00b797fc6b874d5929dc8', '2019-01-24 14:22:22'),
('anujmishra.it@gmail.com', 'fe6c1fc8e98981f46a24c5e4125042697a0434b66ea00b797fc6b874d5929dc8', '2019-01-24 14:22:22'),
('deepak@asadeltech.com', '58ad24437156749fcd068d9db60e752a253e948719f2bb4ff2eaec0910f215d6', '2019-02-26 09:41:20');

-- --------------------------------------------------------

--
-- Table structure for table `patientcalls`
--

CREATE TABLE `patientcalls` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `token_number` varchar(20) NOT NULL,
  `room_number` varchar(20) NOT NULL,
  `patient_status` int(5) DEFAULT '0',
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `queues`
--

CREATE TABLE `queues` (
  `id` int(10) UNSIGNED NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `number` int(11) NOT NULL,
  `called` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `uhid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '4' COMMENT '1=platinum,2=Gold,3=Silver,4=Normal',
  `customer_waiting` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `queue_status` int(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `queues`
--

INSERT INTO `queues` (`id`, `department_id`, `number`, `called`, `created_at`, `updated_at`, `pid`, `uhid`, `priority`, `customer_waiting`, `queue_status`) VALUES
(1, 4, 4000, 0, '2019-05-24 05:14:28', '2019-05-24 05:21:22', 2, '500', 4, '0', 1),
(2, 4, 4001, 1, '2019-05-24 05:14:35', '2019-05-24 05:23:02', 2, '789', 2, '1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bus_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notification` text COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `over_time` int(11) NOT NULL,
  `missed_time` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `language_id`, `name`, `bus_no`, `address`, `email`, `phone`, `location`, `notification`, `size`, `color`, `logo`, `over_time`, `missed_time`, `created_at`, `updated_at`) VALUES
(1, 6, 'VERITAAS, GURGAON', '', '', 'info@veritaas.com', '', '', 'Welcome To Veritaas Hospital, Gurgaon :::: वेरिटास गुडगाँव अस्पताल में आपका स्वागत है।', 30, '#f7184e', '', 30, 30, '2019-01-22 03:43:46', '2019-05-16 12:49:43');

-- --------------------------------------------------------

--
-- Table structure for table `uhid_masters`
--

CREATE TABLE `uhid_masters` (
  `id` int(10) UNSIGNED NOT NULL,
  `uhid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `priority_type` int(6) NOT NULL DEFAULT '5' COMMENT '1=platinum,2=Gold,3=Silver,4=Normal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uhid_masters`
--

INSERT INTO `uhid_masters` (`id`, `uhid`, `uid`, `priority_type`, `created_at`, `updated_at`) VALUES
(1, '123', '48789541254785', 1, '2019-01-26 13:59:18', '2019-01-26 13:59:24'),
(2, '456', '9876789', 3, '2019-01-26 14:00:04', '2019-01-26 14:00:04'),
(3, '789', '', 2, NULL, NULL),
(4, '500', '', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `counter_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `user_status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `role`, `pid`, `department_id`, `counter_id`, `password`, `user_status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'your_email@rxample.com', 'A', NULL, NULL, NULL, '$2y$10$ChrwtsItXpqh1MXNGnBiu.5Nm7XZEYXWLgWrt3eRVZ.i5pY8R2lJq', '1', 'saf2LSphIeTgHouidGsF29DQlfZS4Zgu0WIkSPaBgYHF64R3xDT11PtOcu8F', '2019-01-22 03:43:45', '2019-05-24 05:21:56'),
(42, 'Dr Hem', 'hem123', 'hem@asadeltech.com', 'D', 3, 5, '7', '$2y$10$07f6LZGkaBthCCDX2NuuAOSHQbvFz5Yq8grxsh7511fqo./Aj9f9a', '1', 'LYbDdAfZfb7hD5OBkF7DZVQqjHnbCQKD7luzCL2xypTp3jAGT5iCTIUIWev9', '2019-02-18 08:11:06', '2019-03-16 14:37:12'),
(45, 'Dr Tarun', 'tarun123', 'tarun@asadeltech.com', 'D', 2, 4, '3', '$2y$10$YqWFQI5CaaUpMX1zDAN2G.ky2snnrcz2ZXWhfWpjQA3rEIqpHM24G', '1', 'bR2TISDzXqkoOrPUY5OCB2JxjSCJaaVfGuuaXFDsBnTrmq8rtmFNaIFzNRCY', '2019-02-18 09:40:42', '2019-05-24 05:23:17'),
(46, 'Dr Puran', 'puran123', 'puran@asadeltech.com', 'D', 16, 16, '40', '$2y$10$ZwxXMTR399eGZGkbTxu/durWAY061oPi9eAe75OtH5EGBt3eDRb7O', '1', 'GiKMJLaeaEPYLw3gWrw2BHKNdo4OnIxSBtnS4j4smuw8ApMulLR9lvcpGg0W', '2019-02-18 11:33:45', '2019-02-18 12:29:39'),
(54, 'Deepak', 'deepak', 'deepak@asadeltech.com', 'D', 3, 5, '6', '$2y$10$KYTJFuxA7tr.q0FvX7BPY.7OZGYf.91qvWQCXwE2Yg3cqX/Vgrmi6', '1', 'eupfoyHyWFGGfbIdB0vcb5EwzutWjNoe3021Ymkbvc3o6TdrjgdwYf65Ve70', '2019-02-24 04:28:25', '2019-05-23 09:48:52'),
(55, 'sanju', 'sanju123', 'sanju@gmail.com', 'S', NULL, NULL, NULL, '$2y$10$IGmj1z.jLzi58huMaIdGVeIPYd5oemqvu3M1pkqrPXHP437HGEK/G', '1', 'cRR6G2vUEGOoCTqnyWD3Eb87e4sQSEIxMMlbfHTQ7TtCUQoy9vbEoXnl3Gui', '2019-03-05 14:31:29', '2019-05-24 05:24:14'),
(57, 'Ranjan Rana', 'ranjanrana', 'ranjan@gmail.com', 'I', NULL, NULL, NULL, '$2y$10$WYabWESpA7B2cFHNdSs9geWXcQPFxhbDzKYVu82r.W76d7HIMrX2i', '1', '9mBLXWMe99eAwGAXPR77fKDa4kFD7a5Ezod7pU5nOdOVjr9SpwUzBeRoUrIf', '2019-03-08 08:09:00', '2019-05-16 12:32:45'),
(58, 'Sarita Sinha', 'sarita123', 'sarita@gmail.com', 'C', NULL, NULL, NULL, '$2y$10$mau6TwY/Q2/hrA67aB77J.C96agJmDztZguEqSt1g9e2Ldlmej796', '1', '7mo6txa8cllW8rR5SWkY2iDVqoEHx6mKbOYsC90u2dvNUxqk9MrwUK25EcFQ', '2019-03-08 08:09:51', '2019-05-24 05:08:47'),
(59, 'Manju Singh', 'manju123', 'manju@gmail.com', 'H', NULL, NULL, NULL, '$2y$10$.nbcsrimd/2uAsdt2idsAOZiWJwETOJRt7RccAnBZMoMoTRNGMOE2', '1', 'EQ9fad3RSOxzHnDGEbYp7Z9U0Qym9NcT94Yf0cVDF41jqzp6CzlqgMzmmSqo', '2019-03-11 05:32:41', '2019-03-16 10:30:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calls`
--
ALTER TABLE `calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calls_queue_id_foreign` (`queue_id`),
  ADD KEY `calls_department_id_foreign` (`department_id`),
  ADD KEY `calls_counter_id_foreign` (`counter_id`),
  ADD KEY `calls_user_id_foreign` (`user_id`);

--
-- Indexes for table `counters`
--
ALTER TABLE `counters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctor_reports`
--
ALTER TABLE `doctor_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `languages_code_unique` (`code`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parent_departments`
--
ALTER TABLE `parent_departments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `patientcalls`
--
ALTER TABLE `patientcalls`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queues`
--
ALTER TABLE `queues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queues_department_id_foreign` (`department_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_language_id_foreign` (`language_id`);

--
-- Indexes for table `uhid_masters`
--
ALTER TABLE `uhid_masters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calls`
--
ALTER TABLE `calls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `counters`
--
ALTER TABLE `counters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `doctor_reports`
--
ALTER TABLE `doctor_reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `parent_departments`
--
ALTER TABLE `parent_departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `patientcalls`
--
ALTER TABLE `patientcalls`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `queues`
--
ALTER TABLE `queues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uhid_masters`
--
ALTER TABLE `uhid_masters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `calls`
--
ALTER TABLE `calls`
  ADD CONSTRAINT `calls_counter_id_foreign` FOREIGN KEY (`counter_id`) REFERENCES `counters` (`id`),
  ADD CONSTRAINT `calls_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `calls_queue_id_foreign` FOREIGN KEY (`queue_id`) REFERENCES `queues` (`id`),
  ADD CONSTRAINT `calls_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `queues`
--
ALTER TABLE `queues`
  ADD CONSTRAINT `queues_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
