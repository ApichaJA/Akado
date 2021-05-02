-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 02, 2021 at 02:34 PM
-- Server version: 8.0.23-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `K-Dorm`
--

-- --------------------------------------------------------

--
-- Table structure for table `ADMIN`
--

CREATE TABLE `ADMIN` (
  `user_user_id` int NOT NULL,
  `hostel_hostel_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ADMIN`
--

INSERT INTO `ADMIN` (`user_user_id`, `hostel_hostel_id`) VALUES
(12, 1),
(18, 2),
(20, 3),
(21, 4),
(19, 5),
(22, 6),
(25, 7),
(29, 8),
(27, 9),
(31, 10);

-- --------------------------------------------------------

--
-- Table structure for table `BOOKING`
--

CREATE TABLE `BOOKING` (
  `booking_id` int NOT NULL,
  `price` float(8,2) NOT NULL,
  `deposit` float(8,2) NOT NULL,
  `room_room_id` int NOT NULL,
  `user_user_id` int NOT NULL,
  `date_check_in` date NOT NULL,
  `date_check_out` date NOT NULL,
  `hostel_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `BOOKING`
--

INSERT INTO `BOOKING` (`booking_id`, `price`, `deposit`, `room_room_id`, `user_user_id`, `date_check_in`, `date_check_out`, `hostel_name`) VALUES
(1, 5500.00, 5500.00, 1, 16, '2021-04-30', '2022-04-30', 'AJpark'),
(2, 3500.00, 0.00, 5, 8, '2021-05-01', '2021-08-01', 'J&W'),
(3, 2500.00, 2500.00, 4, 14, '2021-05-01', '2021-11-01', 'ณิชา'),
(4, 3500.00, 1800.00, 2, 4, '2021-05-01', '2021-11-01', 'นาคบำรุงศรี'),
(5, 2500.00, 2500.00, 1, 26, '2021-05-01', '2021-12-01', 'ขวัญพยงค์'),
(6, 4200.00, 4200.00, 7, 2, '2021-05-01', '2021-12-01', 'พี531'),
(7, 8400.00, 5000.00, 1, 11, '2021-05-01', '2022-04-29', 'พี631'),
(8, 6000.00, 6000.00, 9, 20, '2021-05-01', '2021-10-01', 'ออมสิน'),
(9, 5600.00, 5600.00, 10, 4, '2021-05-01', '2021-08-01', 'เหมกรณ์'),
(10, 5000.00, 5000.00, 11, 12, '2021-05-01', '4000-05-01', 'เฉลิมศรี');

-- --------------------------------------------------------

--
-- Table structure for table `CHAT_LOG`
--

CREATE TABLE `CHAT_LOG` (
  `id_log` int NOT NULL,
  `id_chat_log` int DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `role` enum('member','admin') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `CHAT_LOG`
--

INSERT INTO `CHAT_LOG` (`id_log`, `id_chat_log`, `message`, `role`, `timestamp`) VALUES
(2, 1, 'สอบถามหน่อยครับ', 'member', '2021-04-30 16:32:24'),
(3, 1, 'ฝ่าย Support ยินดีตอบคำถามข่ะ', 'admin', '2021-04-30 16:32:25'),
(4, 1, 'หอพัก Aj เดือนละเท่าไหร่ครับ', 'member', '2021-04-30 16:32:26'),
(5, 1, 'เดือนละ 5500 บาทข่ะ', 'admin', '2021-04-30 16:32:27'),
(6, 1, 'แพงจังเลย', 'member', '2021-04-30 16:32:28'),
(7, 1, 'ทางหอพักเรา มี บริการ Service หลายอย่างมาก จึงทำให้มีค่าเช่า หอพักที่แพง', 'admin', '2021-04-30 16:32:29'),
(8, 1, 'ดีครับ งั้นผมของจอง 1 ห้อง ครับ', 'member', '2021-04-30 16:32:30'),
(9, 1, 'ตอนนี้ห้องเต็มข่ะ', 'admin', '2021-04-30 16:32:31'),
(10, 1, 'แพงจังเลย', 'member', '2021-04-30 16:32:32'),
(11, 1, 'โอเคครับ ขอบคุณครับ', 'admin', '2021-04-30 16:32:33'),
(12, 2, 'สวัสดีค่ะ', 'member', '2021-04-30 16:37:55'),
(13, 2, 'ฝ่าย Support ยินดีตอบคำถามค่ะ', 'admin', '2021-04-30 16:37:55'),
(14, 2, 'ไม่ทราบว่าทางหอพักมีบริการนวดไหมคะ', 'member', '2021-04-30 16:37:55'),
(15, 2, 'ไม่มีค่ะ', 'admin', '2021-04-30 16:37:55'),
(16, 2, 'อ่อ โอเคค่ะ', 'member', '2021-04-30 16:37:55'),
(17, 2, 'ค่ะ มีอะรสอบถามอีกไหมคะ', 'admin', '2021-04-30 16:37:55'),
(18, 2, 'ไม่มีค่ะ', 'member', '2021-04-30 16:37:55');

-- --------------------------------------------------------

--
-- Table structure for table `CHAT_SUPPORT`
--

CREATE TABLE `CHAT_SUPPORT` (
  `chat_id` int NOT NULL,
  `admin_user_id` int DEFAULT NULL,
  `user_user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `CHAT_SUPPORT`
--

INSERT INTO `CHAT_SUPPORT` (`chat_id`, `admin_user_id`, `user_user_id`) VALUES
(1, 12, 1),
(2, 12, 5),
(3, 12, 2),
(4, 12, 3),
(5, 12, 4),
(6, 12, 5),
(7, 12, 7),
(8, 12, 8),
(9, 12, 9),
(10, 12, 10);

-- --------------------------------------------------------

--
-- Table structure for table `FURNITURE`
--

CREATE TABLE `FURNITURE` (
  `furniture_id` int NOT NULL,
  `type` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `FURNITURE`
--

INSERT INTO `FURNITURE` (`furniture_id`, `type`, `name`, `description`) VALUES
(1, 'พัดลม', 'พัดลม', 'พัดลม'),
(2, 'เครื่องปรับอากาศ', 'เครื่องปรับอากาศ', 'เครื่องปรับอากาศ'),
(3, 'โซฟา', 'โซฟา', 'โซฟา'),
(4, 'ครัว', 'ครัว', 'ครัว'),
(5, 'โต็ะทำงาน', 'โต็ะทำงาน', 'โต็ะทำงาน'),
(6, 'เตียงนอน', 'เตียงนอน', 'เตียงนอน'),
(7, 'ตู้เสื้อผ้า', 'ตู้เสื้อผ้า', 'ตู้เสื้อผ้า'),
(8, 'ตู้เย็น', 'ตู้เย็น', 'ตู้เย็น'),
(9, 'อ่างอาบน้ำ ', 'อ่างอาบน้ำ ', 'อ่างอาบน้ำ '),
(10, 'ไมโครเวฟ', 'ไมโครเวฟ', 'ไมโครเวฟ');

-- --------------------------------------------------------

--
-- Table structure for table `HOSTEL`
--

CREATE TABLE `HOSTEL` (
  `hostel_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_home` char(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `latitude` double DEFAULT NULL,
  `longtitude` double DEFAULT NULL,
  `min_price` double DEFAULT NULL,
  `max_price` double DEFAULT NULL,
  `gender` enum('female','male','all') COLLATE utf8_unicode_ci DEFAULT NULL,
  `verify` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `HOSTEL`
--

INSERT INTO `HOSTEL` (`hostel_id`, `name`, `phone`, `phone_home`, `address`, `latitude`, `longtitude`, `min_price`, `max_price`, `gender`, `verify`) VALUES
(1, 'AJ park', '0970919724', '025485169', '701 ซอย ฉลองกรุง 1 แขวง ลาดกระบัง เขตลาดกระบัง กรุงเทพมหานคร 10520', 13.7258326, 100.7656573, 5500, 6500, 'all', 0),
(2, 'นาคบำรุงศรี', '0958745215', '027589452', '531 ซอย เกกีงาม 3 แขวง ลาดกระบัง เขตลาดกระบัง กรุงเทพมหานคร 10520', 13.7256933, 100.76897, 3500, 5000, 'all', 1),
(3, 'ขวัญพยงค์', '094920921', NULL, '421 ซอย เกกีงาม 1 แขวง ลาดกระบัง เขตลาดกระบัง กรุงเทพมหานคร 10520', 13.7267302, 100.7702714, 2500, 3000, 'male', 1),
(4, 'หอพักหญิง J&W', NULL, NULL, NULL, 13.7270485, 100.7706385, 3500, 3500, 'female', 0),
(5, 'De Ratazapa', '0911121112', NULL, 'S’Kala \r\nLand', 13.7577853022, 100.507204638, 21000, 2000000, 'all', 1),
(6, 'หอพักหญิงณิชา', NULL, NULL, 'ซอย เกกีงาม 3 แขวง ลาดกระบัง เขตลาดกระบัง กรุงเทพมหานคร 10520', 13.7265977, 100.7699791, 6000, 6000, 'female', 1),
(7, 'หอพักพี531', '0895124088', NULL, '531 ซอย เกกีงาม 3 แขวง ลาดกระบัง เขตลาดกระบัง กรุงเทพมหานคร 10520', 13.7258926, 100.7694474, 3500, 4200, 'all', NULL),
(8, 'หอพักออมสิน', NULL, NULL, '567 ซอย เกกีงาม 3 แขวง ลาดกระบัง เขตลาดกระบัง กรุงเทพมหานคร 10520', 13.7261532, 100.7695547, 2500, 2500, 'all', NULL),
(9, 'หอเหมกรณ์', '0851093115', NULL, 'แขวง ลาดกระบัง เขตลาดกระบัง กรุงเทพมหานคร 10520', 13.7261532, 100.7695547, 2800, 2800, 'all', NULL),
(10, 'หอพักเฉลิมศรี', NULL, NULL, '531 ซอย เกกีงาม 3 แขวง ลาดกระบัง เขตลาดกระบัง กรุงเทพมหานคร 10520', 13.7258926, 100.7692095, 2900, 2900, 'all', NULL),
(11, 'De Ratazapa', '0911121112', NULL, 'S’Kala Land', 13.7577853022, 100.507204638, 21000, 2000000, 'all', 1);

-- --------------------------------------------------------

--
-- Table structure for table `LOCATION`
--

CREATE TABLE `LOCATION` (
  `location_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `latitude` double DEFAULT NULL,
  `longtitude` double DEFAULT NULL,
  `type` enum('place','restaurant') COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `LOCATION`
--

INSERT INTO `LOCATION` (`location_id`, `name`, `address`, `latitude`, `longtitude`, `type`, `image`) VALUES
(1, 'นายพล จุ่มแซ่บ อาหารไทย อีสาน ( by ตี๋จุ่มแซป )', '653/1 ถนน ฉลองกรุง 1 แขวง ลาดกระบัง เขตลาดกระบัง กรุงเทพมหานคร 10520', 13.7263652, 100.7642675, 'restaurant', 'https://lh5.googleusercontent.com/p/AF1QipMDp5QHG4YuN8eMYoeUd-51vEKy1IMH7-REH0BU=w520-h240-k-no'),
(3, 'smooth', '647 1 Chalong Krung 1 Alley, Lat Krabang, Bangkok 10520', 13.7272411, 100.7627293, 'restaurant', 'https://lh5.googleusercontent.com/p/AF1QipPxWT6aBFtesJ0DmXP0RFyFrsRqwkD94dwAi9Sl=w408-h544-k-no'),
(4, 'Timber Cafe Thailand', '661/5 Chalong Krung 1 Alley, Lat Krabang, Bangkok 10520', 13.7276446, 100.7612431, 'restaurant', 'https://lh5.googleusercontent.com/p/AF1QipOlfoGiurX6ljqlQ5hkLqiHeTBWyC_qXou-iDdk=w426-h240-k-no'),
(5, 'washi', '655, 1 Chalong Krung 1 Alley, Lat Krabang, Bangkok 10520', 13.7269596, 100.764549, 'restaurant', 'https://lh4.googleusercontent.com/n6MI4dSYA-GMLONaeUhflZ0Cz271B-4-_rrssa0wqYMj-5fUA_N1aK-KcxR5Gp6HKg=w408-h306-k-no'),
(6, 'chick strong', 'billion park, Chalong Krung 1 Alley, Lat Krabang, Bangkok 10520', 13.7270259, 100.7648846, 'restaurant', 'https://lh5.googleusercontent.com/p/AF1QipOtLeI20Cl-BQ-KTHnST6ZP91iCG3CcieHj-pEe=w408-h544-k-no'),
(7, 'food sugar', 'billion park Chalong Krung 1 Alley, Lat Krabang, Bangkok 10520', 13.7272007, 100.7642005, 'restaurant', 'https://lh5.googleusercontent.com/p/AF1QipOVqjBoLa9oWHyCuTonDAT46oOwInF5fnRkRVE4=w408-h408-k-no'),
(8, 'chada cafe', 'แขวง ลาดกระบัง เขตลาดกระบัง กรุงเทพมหานคร 10520', 13.7221282, 100.7638325, 'restaurant', 'https://lh5.googleusercontent.com/p/AF1QipMEloa7ASJ4l361Havz_IrIPfT1fFWT-3zYqci6=w408-h306-k-no'),
(9, 'malong', 'เลขที่ 659 Chalong Krung 1 Alley, Khwaeng Lat Krabang, Lat Krabang, Bangkok 10520', 13.7277174, 100.767199, 'restaurant', 'https://lh5.googleusercontent.com/p/AF1QipMYNP3bl1hL4XgK-WIzZ73bKNn6P1im5STY9hQm=w408-h544-k-no'),
(10, 'yum society', 'Chalong Krung 1 Alley, Lam Prathew, Lat Krabang, Bangkok 10520', 13.7272334, 100.7645824, 'restaurant', 'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=_57agLaxgbIjSz-IKYsNyQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=265.8377&pitch=0&thumbfov=100'),
(11, 'lanna', '1566, 3 Lat Krabang Rd, Lat Krabang, Bangkok 10520', 13.7211885, 100.7705283, 'restaurant', 'https://lh5.googleusercontent.com/p/AF1QipNwlf0-WgobMU7BLRGo0wyubAOqMxGfwqxAKMeL=w408-h544-k-no'),
(12, 'ครัวบะช่อ', '647/1 โครงการบิลเลี่ยนปาร์ค 1 ถนน ฉลองกรุง Lat Krabang, Bangkok 10520', 13.7272792, 100.7643153, 'restaurant', 'https://lh5.googleusercontent.com/p/AF1QipNoM3rc04Bxy8nGDVhKTjIF32II7Z8jRW4sv9f-=w408-h407-k-no'),
(13, '2 Tone', '655 Chalong Krung 1 Alley, Lat Krabang, Bangkok 10520', 13.7272792, 100.7643153, 'restaurant', 'https://lh5.googleusercontent.com/p/AF1QipOupj-qBL9v0c8S7-fWZSL2UA-D1liBAYUIcXO-=w408-h306-k-no'),
(14, 'the junx', '611 Chalong Krung 1 Alley, แขวงลาดกระบัง Lat Krabang, Bangkok 10520', 13.7272792, 100.7643153, 'restaurant', 'https://lh5.googleusercontent.com/p/AF1QipMO7nXb4dzBVSzAzy1KqDW-gR0SSU6qYssdTBoN=w482-h240-k-no'),
(15, 'buta', '661/5 Chalong Krung 1 Alley, Lat Krabang, Bangkok 10520', 13.7272792, 100.7643153, 'restaurant', 'https://lh5.googleusercontent.com/p/AF1QipOmq9tKkM8NABpErral6hJrvxzCH6yr-WRqgahM=w408-h305-k-no'),
(16, 'burin', '611 Chalong Krung 1 Alley, Khwaeng Lat Krabang, Lat Krabang, Bangkok 10520', 13.7272792, 100.7643153, 'restaurant', 'https://lh6.googleusercontent.com/FLrOtmXqtdOGNJv5hbXEJxdPQHaIX1WfgB3gZSxsfJftEfu8br0YYawcQwsuAZ4hIw=w408-h306-k-no'),
(17, 'playlist cafe', '657 Chalongkrung 1 yaek 6 Lat Krabang, Bangkok 10520', 13.7272792, 100.7643153, 'restaurant', 'https://lh5.googleusercontent.com/p/AF1QipOBT2IoPZtuRrVSR5N0w29_QXumaB49nAD6cpte=w408-h306-k-no'),
(18, 'Airportling ladkrabang', ' Thanon Rom Klao, Lat Krabang, Bangkok 10520', 13.7277123, 100.7452954, 'place', ' https://lh5.googleusercontent.com/p/AF1QipOQp6JsIdSg2rKm2mi_u_f8tdf35ilOx3WfnSw=w408-h306-k-no%27'),
(19, 'suvannapumi Airport', ' 999 หมู่ 1 Nong Prue, Bang Phli District, Samut Prakan 10540', 13.6899991, 100.7150935, 'place', ' https://lh5.googleusercontent.com/p/AF1QipNOwofAay0Ed2-abT-dCXMF6C-YDnGeQ2M5IwG8=w408-h482-k-no%27'),
(20, 'Robinson lifestyle ladkrabang', ' 286 ซ. ลาดกระบัง 20/2 Lat Krabang, Bangkok 10520', 13.7198472, 100.7229214, 'place', ' https://lh5.googleusercontent.com/p/AF1QipMrlO6xhOD_y_maDtjKpRmK4FZXch0OvW5pXjrh=w408-h306-k-no%27'),
(21, 'ตลาดเก่าหัวตะเข้', ' Soi Lat Krabang 17, Lat Krabang, Bangkok 10520', 13.7232619, 100.786251, 'place', ' https://lh5.googleusercontent.com/p/AF1QipMoGw9YUUtoIJLOyddYym9rooeGVOqDS95WHWE=w425-h240-k-no%27'),
(22, 'วัดปลูกศรัทธา', ' 1665 11/11 ถ.อ่อนนุช, ซ.ลาดกระบัง Lat Krabang, Bangkok 10520', 13.7232617, 100.7796849, 'place', ' https://lh5.googleusercontent.com/p/AF1QipOuU6soYwu3_mzrGq4-mWO96tXFIsxrFNnbUBFj=w408-h544-k-no%27'),
(23, 'โรงเรียนวัดปลูกศรัทธา', ' 587 Chalong Krung 1 Alley, Lat Krabang, Khet Lat Krabang, Bangkok 10520', 13.7232617, 100.7796849, 'place', ' https://lh5.googleusercontent.com/p/AF1QipNOT28ifL2MirR-1h64n7lF5Cqpyq1g35xIkJ6n=w424-h240-k-no%27'),
(24, 'โรงพยาบาลลาดกระบัง', ' 2 Lat Krabang 15 Alley, Lat Krabang, Bangkok 10520', 13.723366, 100.7825865, 'place', ' https://lh5.googleusercontent.com/p/AF1QipMtpmLRc5qJrGjuYKlNL6XgHqdzy6K63haadMao=w408-h306-k-no%27'),
(25, 'สถานีตำรวจลาดกระบัง', ' 1190 Lat Krabang Rd, Lat Krabang, Bangkok 10520', 13.7238659, 100.7789053, 'place', ' https://lh5.googleusercontent.com/p/AF1QipMRph6Y9LWseC-E1hjsTcU4WCccpZfMciqLvPGg=w426-h240-k-no%27'),
(26, 'collage of fine art', ' 60 ถนน หลวง Lat Krabang, Bangkok 10520', 13.7251985, 100.7855902, 'place', ' https://lh5.googleusercontent.com/p/AF1QipMLbwbo4NCEsJqxRdZkVRkGysINxxG6F5Aa-tU7=w408-h270-k-no%27'),
(27, 'โรงเรียนมาเรียรัย', ' 389 ซ. มารีย์ 6 Thap Yao, Lat Krabang, Bangkok 10520', 13.7251985, 100.7855902, 'place', ' https://lh5.googleusercontent.com/p/AF1QipPsdUAAn1lHQNznMG5Tw6ebMEN0d4TOz6_0uV6L=w426-h240-k-no%27');

-- --------------------------------------------------------

--
-- Table structure for table `MEMBER`
--

CREATE TABLE `MEMBER` (
  `user_user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `MEMBER`
--

INSERT INTO `MEMBER` (`user_user_id`) VALUES
(1),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(13),
(14),
(16),
(17),
(32);

-- --------------------------------------------------------

--
-- Table structure for table `PLACE`
--

CREATE TABLE `PLACE` (
  `place_location_id` int NOT NULL,
  `type_of_place` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_of_place` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `PLACE`
--

INSERT INTO `PLACE` (`place_location_id`, `type_of_place`, `description_of_place`) VALUES
(18, 'airportlink', 'airportlink ลาดกระบัง'),
(19, 'สนามบิน', 'สนามบินสุวรรณภูมิ'),
(20, 'ห้างสรรพสินค้า', 'robinson ลาดกระบัง'),
(21, 'ตลาด', 'ตลาดเก่าหัวตะเข้'),
(22, 'วัด', 'วัดใก้ลหอพักลาดกระบัง'),
(23, 'โรงเรียน', 'โรงเรียนประถม'),
(24, 'โรงพยาบาล', 'โรงพยาบาลลาดกระบัง'),
(25, 'สถานีตำรวจ', 'สถานีตำรวจลาดกระบัง'),
(26, 'gallery ', 'art gallery'),
(27, 'โรงเรียน', 'โรงเรียนมัธยม');

-- --------------------------------------------------------

--
-- Table structure for table `RATING`
--

CREATE TABLE `RATING` (
  `rate_id` int NOT NULL,
  `user_user_id` int DEFAULT NULL,
  `hostel_hostel_id` int DEFAULT NULL,
  `star` enum('1','2','3','4','5') COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('hostel','area') COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `RATING`
--

INSERT INTO `RATING` (`rate_id`, `user_user_id`, `hostel_hostel_id`, `star`, `type`, `comment`) VALUES
(1, 16, 1, '2', 'hostel', 'บริการแย่มากคะ'),
(6, 16, 3, '1', 'hostel', 'บริการไม่ดีบอกให้ซ่อมท่อไม่ซ่อม'),
(7, 1, 10, '4', 'hostel', 'บริการดี สะอาด แต่เฟอร์นิเจอร์เก่าไปหน่อย'),
(8, 7, 8, '1', 'hostel', 'หอพักไม่มีความปลอดภัย ไวไฟใช้ไม่ได้ บริการไม่ดี'),
(9, 9, 2, '5', 'hostel', 'หอสวย มีสระว่ายน้ำ คุ้มราคา'),
(10, 21, 3, '3', 'hostel', 'มีขโมยในหอพัก'),
(12, 2, 9, '3', 'hostel', 'ไวไฟไม่ดี แม่บ้านพูดจาไม่ดี'),
(13, 1, 9, '2', 'hostel', 'ห้องไม่เก็บเสียง ทางเดินสะอาด แต่ไม่มีไฟ'),
(14, 7, 5, '1', 'hostel', 'หอไกล ไม่มีไวไฟ'),
(16, 1, 7, '5', 'hostel', 'verygood');

-- --------------------------------------------------------

--
-- Table structure for table `RATING_LOCATION`
--

CREATE TABLE `RATING_LOCATION` (
  `rate_id` int NOT NULL,
  `user_user_id` int DEFAULT NULL,
  `location_location_id` int DEFAULT NULL,
  `star` enum('1','2','3','4','5') CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('place','restaurant') COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `RATING_LOCATION`
--

INSERT INTO `RATING_LOCATION` (`rate_id`, `user_user_id`, `location_location_id`, `star`, `type`, `comment`) VALUES
(1, 1, 18, '2', 'place', 'fairwell verygood'),
(2, 12, 12, '2', 'restaurant', 'อาหารอร่อยราคาถูก'),
(3, 2, 10, '5', 'restaurant', 'ร้านยำอร่อยมาก'),
(4, 8, 8, '4', 'restaurant', 'ชามะนาวอร่อยมักๆ'),
(5, 16, 22, '5', 'place', 'ขอแฟนรักแฟนหลง'),
(6, 10, 20, '3', 'place', 'ของยังมีน้ออยู่ครับผม'),
(7, 4, 20, '4', 'place', 'โปรโมชั่นดีมาก'),
(8, 1, 16, '5', 'restaurant', 'หมูกระทะราคาถูกมากครับ'),
(9, 1, 6, '5', 'restaurant', '5star'),
(10, 11, 6, '5', 'place', 'very fuckinggood');

-- --------------------------------------------------------

--
-- Table structure for table `RESTAURANT`
--

CREATE TABLE `RESTAURANT` (
  `restaurant_location_id` int NOT NULL,
  `type_of_food` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description_of_restaurant` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `min_price` float(8,2) DEFAULT NULL,
  `max_price` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `RESTAURANT`
--

INSERT INTO `RESTAURANT` (`restaurant_location_id`, `type_of_food`, `description_of_restaurant`, `min_price`, `max_price`) VALUES
(1, 'อาหารไทย อีสาน ', 'ร้านจุ่มแซ่บ', 100.00, 500.00),
(3, 'น้ำปั่น', 'ร้าน smooth', 45.00, 100.00),
(4, 'อาหารตามสั่งและของหวาน', 'ร้านอาหาร', 100.00, 500.00),
(5, 'ซูชิ', 'วัตถุดิบดีราคาถูก', 10.00, 250.00),
(6, 'ไก่ทอด', 'ร้านขายไก่ทอด', 20.00, 100.00),
(7, 'ของหวาน', 'บิงซู', 100.00, 500.00),
(8, 'ร้านน้ำ', 'น้ำ', 25.00, 100.00),
(9, 'ตามสั่ง', 'ร้าน malong', 40.00, 60.00),
(10, 'ยำ', 'ยำทะเลแซลมอน', 100.00, 250.00),
(11, 'ร้านอาหารเก่า', 'อาหารปกติ', 10.00, 500.00);

-- --------------------------------------------------------

--
-- Table structure for table `ROOM`
--

CREATE TABLE `ROOM` (
  `room_id` int NOT NULL,
  `hostel_hostel_id` int DEFAULT NULL,
  `room_type_type_id` int NOT NULL,
  `state` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ROOM`
--

INSERT INTO `ROOM` (`room_id`, `hostel_hostel_id`, `room_type_type_id`, `state`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 2, 2, 1),
(4, 3, 4, 1),
(5, 4, 5, 1),
(6, 6, 6, 1),
(7, 7, 7, 1),
(8, 7, 8, 1),
(9, 8, 9, 1),
(10, 9, 10, 1),
(11, NULL, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ROOM_FURNITURE`
--

CREATE TABLE `ROOM_FURNITURE` (
  `room_id_furniture_id` int NOT NULL,
  `room_room_id` int DEFAULT NULL,
  `furniture_furniture_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ROOM_FURNITURE`
--

INSERT INTO `ROOM_FURNITURE` (`room_id_furniture_id`, `room_room_id`, `furniture_furniture_id`) VALUES
(1, 1, 7),
(2, 1, 6),
(3, 1, 10),
(4, 1, 2),
(5, 2, 1),
(6, 2, 5),
(7, 2, 6),
(8, 2, 7),
(9, 3, 7),
(10, 3, 10),
(11, 3, 2),
(12, 3, 1),
(13, 3, 5),
(14, 4, 3),
(15, 4, 9),
(16, 4, 4),
(17, 4, 6),
(18, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ROOM_TYPE`
--

CREATE TABLE `ROOM_TYPE` (
  `type_id` int NOT NULL,
  `type_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_day` float(8,2) DEFAULT NULL,
  `price_month` float(8,2) DEFAULT NULL,
  `deposit` float(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ROOM_TYPE`
--

INSERT INTO `ROOM_TYPE` (`type_id`, `type_name`, `price_day`, `price_month`, `deposit`) VALUES
(1, 'แอร์ AJ', NULL, 5500.00, 10000.00),
(2, 'พัดลม(นาคบำรุงศรี)', NULL, 3500.00, 5500.00),
(3, 'แอร์', NULL, 4500.00, 6000.00),
(4, 'พัดลมเดี่ยว(ขวัญพยงค์ )', NULL, 2500.00, 5500.00),
(5, 'พัดลม(j&W)', NULL, 3500.00, 7000.00),
(6, 'แอร์(ณิขา)', NULL, 6000.00, 12000.00),
(7, 'พัดลม(พี531)', NULL, 3500.00, 4200.00),
(8, 'แอร์(พี531)', NULL, 4200.00, 8400.00),
(9, 'ห้องออทสิน', NULL, 2500.00, 6000.00),
(10, 'พัดลม(เหมกรณ์)', NULL, 2800.00, 5600.00),
(11, ' เฉลิมศรี', NULL, 2900.00, 5000.00);

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE `USER` (
  `user_id` int NOT NULL,
  `first_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('admin','member') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'member'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`user_id`, `first_name`, `last_name`, `email`, `phone`, `type`) VALUES
(1, 'Apicha', 'Junyatanakron', 'jun@gmail.com', '0925055645', 'member'),
(2, 'Gonzalo', 'Jozsika', 'gjozsika0@usgs.gov', '0750663467', 'member'),
(3, 'Alie', 'McEttigen', 'amcettigen1@indiegogo.com', '0210130591', 'member'),
(4, 'Gilburt', 'Domoni', 'gdomoni2@skyrock.com', '0430996738', 'member'),
(5, 'Leigh', 'McKernan', 'lmckernan3@friendfeed.com', '0600426227', 'member'),
(6, 'Whitby', 'Housaman', 'whousaman4@hhs.gov', '0320337008', 'member'),
(7, 'Zane', 'Child', 'zchild5@ucsd.edu', '0400405879', 'member'),
(8, 'Ericka', 'Neill', 'eneill6@barnesandnoble.com', '0460195949', 'member'),
(9, 'K0ralynn', 'Bramont', 'kbramont7@google.com.br', '0450217134', 'member'),
(10, 'Domenico', 'Holtaway', 'dholtaway8@cnet.com', '0120734642', 'member'),
(11, 'Gawen', 'Caldeyroux', 'gcaldeyroux9@spotify.com', '0620678868', 'member'),
(12, 'Chotichan', 'Vichitkawe', 'ryu@eyudev.com', '0632121642', 'admin'),
(13, 'supapit', 'tangjit', '62070188@it.kmitl.ac.th', '0802918158', 'member'),
(14, 'lalitwadee', 'singsoot', '62070160@it.kmitl.ac.th', '0805554444', 'member'),
(16, 'nicharee', 'bawonrattanawong', '62070069@it.kmitl.ac.th', '0805559999', 'member'),
(17, 'ratchapol', 'thawon', '62070102@it.kmitl.ac.th', '0807778888', 'member'),
(18, 'susuki1', 'mayonf1', 'sukimayof1@gmail.com', '0995547841', 'admin'),
(19, 'susuki2', 'mayonf2', 'sukimayof2@gmail.com', '0995547842', 'admin'),
(20, 'susuki3', 'mayonf3', 'sukimayof3@gmail.com', '0995547843', 'admin'),
(21, 'susuki4', 'mayonf4', 'sukimayof4@gmail.com', '0995547844', 'admin'),
(22, 'susuki5', 'mayonf5', 'sukimayof5@gmail.com', '0995547845', 'admin'),
(23, 'susuki6', 'mayonf6', 'sukimayof6@gmail.com', '0995547846', 'admin'),
(24, 'susuki7', 'mayonf7', 'sukimayof7@gmail.com', '0995547847', 'admin'),
(25, 'susuki1', 'mayonf1', 'sukimayof1@gmail.com', '0995547841', 'admin'),
(26, 'susuki2', 'mayonf2', 'sukimayof2@gmail.com', '0995547842', 'admin'),
(27, 'susuki3', 'mayonf3', 'sukimayof3@gmail.com', '0995547843', 'admin'),
(28, 'susuki4', 'mayonf4', 'sukimayof4@gmail.com', '0995547844', 'admin'),
(29, 'susuki5', 'mayonf5', 'sukimayof5@gmail.com', '0995547845', 'admin'),
(30, 'susuki6', 'mayonf6', 'sukimayof6@gmail.com', '0995547846', 'admin'),
(31, 'susuki7', 'mayonf7', 'sukimayof7@gmail.com', '0995547847', 'admin'),
(32, 'Apicha', 'Junyatanakron', 'jun@gmail.com', '0925055645', 'member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ADMIN`
--
ALTER TABLE `ADMIN`
  ADD PRIMARY KEY (`user_user_id`),
  ADD KEY `hostel_hostel_id` (`hostel_hostel_id`);

--
-- Indexes for table `BOOKING`
--
ALTER TABLE `BOOKING`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `user_user_id` (`user_user_id`),
  ADD KEY `room_room_id` (`room_room_id`);

--
-- Indexes for table `CHAT_LOG`
--
ALTER TABLE `CHAT_LOG`
  ADD PRIMARY KEY (`id_log`),
  ADD KEY `id_chat_log` (`id_chat_log`);

--
-- Indexes for table `CHAT_SUPPORT`
--
ALTER TABLE `CHAT_SUPPORT`
  ADD PRIMARY KEY (`chat_id`),
  ADD KEY `admin_user_id` (`admin_user_id`),
  ADD KEY `user_user_id` (`user_user_id`);

--
-- Indexes for table `FURNITURE`
--
ALTER TABLE `FURNITURE`
  ADD PRIMARY KEY (`furniture_id`);

--
-- Indexes for table `HOSTEL`
--
ALTER TABLE `HOSTEL`
  ADD PRIMARY KEY (`hostel_id`);

--
-- Indexes for table `LOCATION`
--
ALTER TABLE `LOCATION`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `MEMBER`
--
ALTER TABLE `MEMBER`
  ADD PRIMARY KEY (`user_user_id`);

--
-- Indexes for table `PLACE`
--
ALTER TABLE `PLACE`
  ADD PRIMARY KEY (`place_location_id`) USING BTREE;

--
-- Indexes for table `RATING`
--
ALTER TABLE `RATING`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `user_user_id` (`user_user_id`),
  ADD KEY `hostel_hostel_id` (`hostel_hostel_id`);

--
-- Indexes for table `RATING_LOCATION`
--
ALTER TABLE `RATING_LOCATION`
  ADD PRIMARY KEY (`rate_id`),
  ADD KEY `user_user_id` (`user_user_id`),
  ADD KEY `location_location_id` (`location_location_id`);

--
-- Indexes for table `RESTAURANT`
--
ALTER TABLE `RESTAURANT`
  ADD PRIMARY KEY (`restaurant_location_id`) USING BTREE;

--
-- Indexes for table `ROOM`
--
ALTER TABLE `ROOM`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `hostel_hostel_id` (`hostel_hostel_id`),
  ADD KEY `room_type_type_id` (`room_type_type_id`);

--
-- Indexes for table `ROOM_FURNITURE`
--
ALTER TABLE `ROOM_FURNITURE`
  ADD PRIMARY KEY (`room_id_furniture_id`),
  ADD KEY `room_room_id` (`room_room_id`),
  ADD KEY `furniture_furniture_id` (`furniture_furniture_id`);

--
-- Indexes for table `ROOM_TYPE`
--
ALTER TABLE `ROOM_TYPE`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `BOOKING`
--
ALTER TABLE `BOOKING`
  MODIFY `booking_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `CHAT_LOG`
--
ALTER TABLE `CHAT_LOG`
  MODIFY `id_log` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `CHAT_SUPPORT`
--
ALTER TABLE `CHAT_SUPPORT`
  MODIFY `chat_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `FURNITURE`
--
ALTER TABLE `FURNITURE`
  MODIFY `furniture_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `HOSTEL`
--
ALTER TABLE `HOSTEL`
  MODIFY `hostel_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `LOCATION`
--
ALTER TABLE `LOCATION`
  MODIFY `location_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `RATING`
--
ALTER TABLE `RATING`
  MODIFY `rate_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `RATING_LOCATION`
--
ALTER TABLE `RATING_LOCATION`
  MODIFY `rate_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ROOM`
--
ALTER TABLE `ROOM`
  MODIFY `room_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ROOM_FURNITURE`
--
ALTER TABLE `ROOM_FURNITURE`
  MODIFY `room_id_furniture_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ROOM_TYPE`
--
ALTER TABLE `ROOM_TYPE`
  MODIFY `type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `USER`
--
ALTER TABLE `USER`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ADMIN`
--
ALTER TABLE `ADMIN`
  ADD CONSTRAINT `ADMIN_ibfk_1` FOREIGN KEY (`user_user_id`) REFERENCES `USER` (`user_id`),
  ADD CONSTRAINT `ADMIN_ibfk_2` FOREIGN KEY (`hostel_hostel_id`) REFERENCES `HOSTEL` (`hostel_id`);

--
-- Constraints for table `BOOKING`
--
ALTER TABLE `BOOKING`
  ADD CONSTRAINT `BOOKING_ibfk_1` FOREIGN KEY (`user_user_id`) REFERENCES `USER` (`user_id`),
  ADD CONSTRAINT `BOOKING_ibfk_2` FOREIGN KEY (`room_room_id`) REFERENCES `ROOM` (`room_id`);

--
-- Constraints for table `CHAT_LOG`
--
ALTER TABLE `CHAT_LOG`
  ADD CONSTRAINT `CHAT_LOG_ibfk_1` FOREIGN KEY (`id_chat_log`) REFERENCES `CHAT_SUPPORT` (`chat_id`);

--
-- Constraints for table `CHAT_SUPPORT`
--
ALTER TABLE `CHAT_SUPPORT`
  ADD CONSTRAINT `CHAT_SUPPORT_ibfk_1` FOREIGN KEY (`admin_user_id`) REFERENCES `USER` (`user_id`),
  ADD CONSTRAINT `CHAT_SUPPORT_ibfk_2` FOREIGN KEY (`user_user_id`) REFERENCES `USER` (`user_id`);

--
-- Constraints for table `HOSTEL`
--
ALTER TABLE `HOSTEL`
  ADD CONSTRAINT `HOSTEL_ibfk_1` FOREIGN KEY (`hostel_id`) REFERENCES `ROOM` (`room_id`);

--
-- Constraints for table `MEMBER`
--
ALTER TABLE `MEMBER`
  ADD CONSTRAINT `MEMBER_ibfk_1` FOREIGN KEY (`user_user_id`) REFERENCES `USER` (`user_id`);

--
-- Constraints for table `PLACE`
--
ALTER TABLE `PLACE`
  ADD CONSTRAINT `PLACE_ibfk_1` FOREIGN KEY (`place_location_id`) REFERENCES `LOCATION` (`location_id`);

--
-- Constraints for table `RATING`
--
ALTER TABLE `RATING`
  ADD CONSTRAINT `RATING_ibfk_1` FOREIGN KEY (`user_user_id`) REFERENCES `USER` (`user_id`),
  ADD CONSTRAINT `RATING_ibfk_2` FOREIGN KEY (`hostel_hostel_id`) REFERENCES `HOSTEL` (`hostel_id`);

--
-- Constraints for table `RATING_LOCATION`
--
ALTER TABLE `RATING_LOCATION`
  ADD CONSTRAINT `RATING_LOCATION_ibfk_1` FOREIGN KEY (`user_user_id`) REFERENCES `USER` (`user_id`),
  ADD CONSTRAINT `RATING_LOCATION_ibfk_2` FOREIGN KEY (`location_location_id`) REFERENCES `LOCATION` (`location_id`);

--
-- Constraints for table `RESTAURANT`
--
ALTER TABLE `RESTAURANT`
  ADD CONSTRAINT `RESTAURANT_ibfk_1` FOREIGN KEY (`restaurant_location_id`) REFERENCES `LOCATION` (`location_id`);

--
-- Constraints for table `ROOM`
--
ALTER TABLE `ROOM`
  ADD CONSTRAINT `ROOM_ibfk_1` FOREIGN KEY (`hostel_hostel_id`) REFERENCES `HOSTEL` (`hostel_id`),
  ADD CONSTRAINT `ROOM_ibfk_2` FOREIGN KEY (`room_type_type_id`) REFERENCES `ROOM_TYPE` (`type_id`);

--
-- Constraints for table `ROOM_FURNITURE`
--
ALTER TABLE `ROOM_FURNITURE`
  ADD CONSTRAINT `ROOM_FURNITURE_ibfk_1` FOREIGN KEY (`room_room_id`) REFERENCES `ROOM` (`room_id`),
  ADD CONSTRAINT `ROOM_FURNITURE_ibfk_2` FOREIGN KEY (`furniture_furniture_id`) REFERENCES `FURNITURE` (`furniture_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
