-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dormitory_system
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cleaner`
--

DROP TABLE IF EXISTS `cleaner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaner` (
  `id` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `image` varchar(999) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `dormitoryId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_96614294cf9e9a467ee0523977f` (`dormitoryId`),
  CONSTRAINT `FK_96614294cf9e9a467ee0523977f` FOREIGN KEY (`dormitoryId`) REFERENCES `dormitory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaner`
--

LOCK TABLES `cleaner` WRITE;
/*!40000 ALTER TABLE `cleaner` DISABLE KEYS */;
INSERT INTO `cleaner` VALUES ('1234','Nguyễn Thị Dung Mỹ','0377379249','N/a',0,'Factory 2'),('24656','Nguyễn Văn Trường','0377379249','N/a',1,'Factory 2');
/*!40000 ALTER TABLE `cleaner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dormitory`
--

DROP TABLE IF EXISTS `dormitory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dormitory` (
  `id` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` longtext NOT NULL,
  `address` varchar(512) NOT NULL,
  `englishname` varchar(50) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dormitory`
--

LOCK TABLES `dormitory` WRITE;
/*!40000 ALTER TABLE `dormitory` DISABLE KEYS */;
INSERT INTO `dormitory` VALUES ('Factory 1','Kí túc xá - Xưởng 1','https://noithatgoocchoav.com/wp-content/uploads/2020/08/nha-hinh-chu-khau-3.jpg','N 7, Mỹ Phước, Bến Cát, Bình Dương, Việt Nam','Dormitory Factory 1',1),('Factory 2','Kí túc xá - Xưởng 2','https://th.bing.com/th/id/R.c51fc9974c6c7d133eac64a5043b019c?rik=1d3dGBI6LiWWLA&riu=http%3a%2f%2farita.vn%2fwp-content%2fuploads%2f2019%2f01%2fM%e1%ba%abu-ph%c3%b2ng-kh%c3%a1ch-chung-c%c6%b0-nh%e1%bb%8f.jpg&ehk=6v5Ih7CB5IEAhKyGYC9p6Ezdv0tKElkPjbkHFXu9vgg%3d&risl=&pid=ImgRaw&r=0','Việt Nam, Bình Dương, Bàu Bàng, khu công nghiệp Bàu Bàng Đường D6, Lô A-12B-CN , A-12C-CN','Dormitory Factory 2',1),('JyuLong','Kí túc xá - JyuLong','https://saigonthanglong.vn/wp-content/uploads/2020/05/dich-vu-quan-ly-van-hanh-chung-cu-3-1536x879.png','9JQ2+9C3, Đ. Số 5, Thành Tâm, Chơn Thành, Bình Phước, Việt Nam','Dormitory JyuLong',1),('Longtriumph','Kí túc xá - Longtriumph','https://th.bing.com/th/id/R.68f733842a437d6105bc22e3afdffd6b?rik=jLyUKzVfI26YkA&riu=http%3a%2f%2fecobavietnam.com.vn%2fupload%2fimages%2fz2098540260366_989bf4e094a7b74248d038a376f04d91.jpg&ehk=2c95iDewqt64hRAOBtpqzZjI0BY91aBXgyVcAAANNe0%3d&risl=&pid=ImgRaw&r=0','7J3F+MHH, TT. Lai Uyên, Bàu Bàng, Bình Dương, Việt Nam','Dormitory Longtriumph',1);
/*!40000 ALTER TABLE `dormitory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `englishname` varchar(50) NOT NULL,
  `image` longtext NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `startdate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `enddate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `phone` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(512) NOT NULL,
  `role` enum('admin','HR','manager','employee') NOT NULL DEFAULT 'employee',
  `dormitoryId` varchar(100) DEFAULT NULL,
  `roomId` varchar(20) DEFAULT NULL,
  `cccd` varchar(30) DEFAULT NULL,
  `address` varchar(300) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `registrationdate` date DEFAULT NULL,
  `expiredate` date DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_dcc68c93ec77d249494e9304268` (`dormitoryId`),
  KEY `FK_d13980d82d87bf10858725be925` (`roomId`),
  CONSTRAINT `FK_d13980d82d87bf10858725be925` FOREIGN KEY (`roomId`) REFERENCES `room` (`id`),
  CONSTRAINT `FK_dcc68c93ec77d249494e9304268` FOREIGN KEY (`dormitoryId`) REFERENCES `dormitory` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('1234','Nguyễn Văn A','A A','N/a',1,'2024-06-18 14:39:12.492103','2024-06-18 14:39:12.492103','0377379249','truongnguenlqm@gmail.com','$2b$10$fhSdY2ZGSDdyxFM.y7aI7.8Op0uTLjWkkpTZKgxU480TcGUU7epOi','employee','Factory 1',NULL,'12345678923','Hello World','2000-07-20','2024-06-01','2026-06-01',_binary '\0'),('24054','Nguyễn Quang Chung','A. Chung','N/a',1,'2024-06-14 11:41:13.582491','2024-06-18 15:17:48.600291','123445676','chunglqm@gmail.com','$2b$10$BiWJ2ob6ZVbwWbRoNZ75QenbEQIGbdVT8DaQX15qIHPz0Tj759Lj2','HR','Factory 2',NULL,'032353454345','bàu bàng, bình dương','2024-06-12','2024-06-14','2024-06-01',_binary '\0'),('24656','Nguyễn Văn Trường','A. Truong','N/a',1,'2024-06-14 11:35:20.263649','2024-06-18 15:17:48.602212','0377379249','truongnguenlqm@gmail.com','$2b$10$9dEeSEOiMGCOUzV1p6gKJOPf.Ahv0bdkQp6eVLYsPPQwBdpKjbW4m','employee','Factory 2',NULL,'032353454345','bàu bàng, bình dương','2024-06-13','2024-06-21','2024-06-01',_binary ''),('admin','admin','admin','N/a',1,'2024-06-14 10:20:50.540271','2024-06-18 15:17:48.602881','0377379249','truongnguenlqm@gmail.com','$2b$10$qVYeB4rp5wYN1byW8HeOCuNGPIkXdp2ENcoR1g1F/43O5yFS0nDbq','admin','Factory 2',NULL,'032353454345','bàu bàng, bình dương','2024-06-06','2024-06-07','2024-06-01',_binary '');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `roomId` varchar(20) NOT NULL,
  `begindate` date DEFAULT NULL,
  `endate` date DEFAULT NULL,
  `employeeId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_room` (`roomId`),
  KEY `fk_employee` (`employeeId`),
  CONSTRAINT `fk_employee` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_room` FOREIGN KEY (`roomId`) REFERENCES `room` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `englishname` varchar(50) NOT NULL,
  `image` longtext NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `startdate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `enddate` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `roomnumber` float NOT NULL,
  `floor` int NOT NULL,
  `gender` tinyint NOT NULL DEFAULT '1',
  `note` varchar(999) NOT NULL,
  `dormitoryId` varchar(100) DEFAULT NULL,
  `typeId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_183d6138e708e3e44333eb43c50` (`dormitoryId`),
  KEY `FK_77887d1cb01d949a3ced97ab0a0` (`typeId`),
  CONSTRAINT `FK_183d6138e708e3e44333eb43c50` FOREIGN KEY (`dormitoryId`) REFERENCES `dormitory` (`id`),
  CONSTRAINT `FK_77887d1cb01d949a3ced97ab0a0` FOREIGN KEY (`typeId`) REFERENCES `type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES ('28','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',0,'2024-06-15 13:56:04.206691','2024-06-15 13:56:59.000000',28,0,0,'no','Factory 2',1),('Room 1','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 10:48:31.857676','2024-06-15 11:12:52.000000',1,1,0,'Nothing','Factory 2',1),('Room 10','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:09:26.586472','2024-06-15 13:58:56.000000',10,1,0,'Nothing','Factory 2',1),('Room 11','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:09:52.178892','2024-06-18 08:52:21.000000',11,1,0,'Nothing','Factory 2',3),('Room 12','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:10:18.468035','2024-06-18 09:42:40.000000',12,1,0,'Nothing','Factory 2',1),('Room 13','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:10:37.891960','2024-06-14 11:11:23.000000',13,1,1,'No','Factory 2',1),('Room 14','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:10:56.770284','2024-06-18 08:57:31.000000',14,1,0,'No','Factory 2',1),('Room 15','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:12:07.704997','2024-06-14 11:12:07.704997',15,1,1,'No','Factory 2',1),('Room 16','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:12:32.158943','2024-06-14 11:12:32.158943',16,1,1,'No','Factory 2',2),('Room 17','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:13:04.283215','2024-06-14 11:13:04.283215',17,1,1,'Nothing','Factory 2',1),('Room 18','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:13:21.485253','2024-06-14 11:13:21.485253',18,1,1,'No','Factory 2',1),('Room 19','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:13:53.898204','2024-06-14 11:13:53.898204',19,1,1,'No','Factory 2',1),('Room 2','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:00:54.932737','2024-06-14 11:00:54.932737',2,1,1,'Nothing','Factory 2',1),('Room 20','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:14:15.785897','2024-06-14 11:14:15.785897',20,1,1,'No','Factory 2',2),('Room 21','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:14:30.233213','2024-06-14 11:14:30.233213',21,1,1,'No','Factory 2',1),('Room 22','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:14:50.441730','2024-06-14 11:14:50.441730',22,1,1,'No','Factory 2',1),('Room 23','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:15:18.126470','2024-06-14 11:15:18.126470',23,1,1,'No','Factory 2',1),('Room 24','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:15:34.376050','2024-06-14 11:15:34.376050',24,1,1,'No','Factory 2',1),('Room 25','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:15:50.251181','2024-06-17 16:36:16.000000',25,1,0,'No','Factory 2',1),('Room 26','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:16:06.864317','2024-06-17 15:48:03.000000',26,1,0,'No','Factory 2',1),('Room 27','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:16:29.760344','2024-06-17 15:44:14.000000',27,1,0,'No','Factory 2',2),('Room 3','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:01:30.544045','2024-06-18 10:50:14.000000',3,1,0,'Nothing','Factory 2',1),('Room 4','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:01:52.735042','2024-06-14 11:01:52.735042',4,1,1,'Nothing','Factory 2',1),('Room 5','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:02:13.188162','2024-06-14 11:02:13.188162',5,1,1,'Nothing','Factory 2',1),('Room 6','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:02:43.748205','2024-06-18 10:16:24.000000',6,1,0,'Nothing','Factory 2',1),('Room 7','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:03:01.744443','2024-06-14 11:03:01.744443',7,1,1,'Nothing','Factory 2',2),('Room 8','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:03:31.931605','2024-06-14 11:03:31.931605',8,1,1,'Nothing','Factory 2',1),('Room 9','Phòng Nhân Viên','Employee Room','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',1,'2024-06-14 11:09:01.876185','2024-06-14 11:09:01.876185',9,1,1,'Nothing','Factory 2',2),('Room Test','Test','Test','https://th.bing.com/th/id/OIP.d2NZ1KGQrLMB60E1LFLjsgHaFj?w=254&h=191&c=7&r=0&o=5&pid=1.7',0,'2024-06-18 10:27:21.201925','2024-06-18 10:52:23.000000',100,1,0,'đ','Longtriumph',1);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` enum('Viet Nam','Taiwan','Other') NOT NULL DEFAULT 'Viet Nam',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Viet Nam'),(2,'Taiwan'),(3,'Other');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dormitory_system'
--

--
-- Dumping routines for database 'dormitory_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-18 16:02:10
