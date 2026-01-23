-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: kisskit_db
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('USER','ADMIN') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  `status` enum('ACTIVE','INACTIVE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'kimkyvu2004hd@gmail.com','d9bad0986d0d06d6abfd788253c8c2ecc0771c7dfe4499a37facfe43467f3988','Vũ Kim Kỳ','0929343780','ADMIN','ACTIVE','2026-01-18 16:31:10','2026-01-22 02:14:45'),(2,'customer1@gmail.com','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','Nguyễn Hải Yến','0929343780','USER','ACTIVE','2026-01-18 16:35:00','2026-01-18 16:35:00'),(3,'customer2@gmail.com','d3dec3f35387156495cbc21471313f87155f878f3435b693f50077c2be479033','Vũ Kim Sơn','0977612236','USER','ACTIVE','2026-01-18 18:07:07','2026-01-18 18:07:07'),(4,'customer3@gmail.com','d9bad0986d0d06d6abfd788253c8c2ecc0771c7dfe4499a37facfe43467f3988','BuI Dinh Duc Minh','0123456789','USER','ACTIVE','2026-01-18 18:07:57','2026-01-18 18:07:57'),(5,'customer4@gmail.com','d9bad0986d0d06d6abfd788253c8c2ecc0771c7dfe4499a37facfe43467f3988','Nguyễn Trung Dũng','0123456789','USER','ACTIVE','2026-01-19 02:17:45','2026-01-19 02:17:45'),(6,'customer5@gmail.com','d9bad0986d0d06d6abfd788253c8c2ecc0771c7dfe4499a37facfe43467f3988','Nguyễn thùy Trang','01234567890','USER','ACTIVE','2026-01-19 02:24:26','2026-01-19 02:24:26'),(7,'customer7@gmail.com','d9bad0986d0d06d6abfd788253c8c2ecc0771c7dfe4499a37facfe43467f3988','Phạm Nhật Vượng','0123456789','USER','ACTIVE','2026-01-19 02:56:06','2026-01-19 02:56:06'),(8,'customer8@gmail.com','d9bad0986d0d06d6abfd788253c8c2ecc0771c7dfe4499a37facfe43467f3988','Phạm Văn Nam','0123456789','USER','ACTIVE','2026-01-19 09:57:07','2026-01-19 09:57:07'),(9,'customer9@gmail.com','d9bad0986d0d06d6abfd788253c8c2ecc0771c7dfe4499a37facfe43467f3988','Phạm Tường Anh','0123456789','USER','ACTIVE','2026-01-19 09:58:46','2026-01-19 09:58:46'),(10,'customer10@gmail.com','d9bad0986d0d06d6abfd788253c8c2ecc0771c7dfe4499a37facfe43467f3988','Phạm Nhật Minh Hoàng','0123456789','USER','ACTIVE','2026-01-19 10:00:42','2026-01-19 10:00:42'),(11,'customer12@gmail.com','d9bad0986d0d06d6abfd788253c8c2ecc0771c7dfe4499a37facfe43467f3988','Vũ Kim Oanh','0123456789','USER','ACTIVE','2026-01-19 10:12:06','2026-01-19 10:12:06'),(12,'customer13@gmail.com','d9bad0986d0d06d6abfd788253c8c2ecc0771c7dfe4499a37facfe43467f3988','Phạm Nhật Minh','0123456789','USER','ACTIVE','2026-01-19 10:20:39','2026-01-19 10:20:39'),(13,'customer14@gmail.com','d9bad0986d0d06d6abfd788253c8c2ecc0771c7dfe4499a37facfe43467f3988','Kim Sen','0123456789','USER','ACTIVE','2026-01-19 10:30:14','2026-01-19 10:30:14'),(14,'customer15@gmail.com','d9bad0986d0d06d6abfd788253c8c2ecc0771c7dfe4499a37facfe43467f3988','customer15','0929343780','USER','ACTIVE','2026-01-22 06:22:58','2026-01-22 06:22:58');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_message`
--

DROP TABLE IF EXISTS `contact_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` int DEFAULT NULL,
  `full_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('NEW','READ','REPLIED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NEW',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_contact_account` (`account_id`),
  CONSTRAINT `fk_contact_account` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_message`
--

LOCK TABLES `contact_message` WRITE;
/*!40000 ALTER TABLE `contact_message` DISABLE KEYS */;
INSERT INTO `contact_message` VALUES (1,NULL,'Nguyễn Văn A','nguyena@example.com','Vấn đề đơn hàng','Đơn hàng #123 của tôi giao lâu quá shop ơi.','NEW','2026-01-20 10:15:35','2026-01-20 10:15:35'),(2,NULL,'Trần Thị B','tranb@example.com','Hợp tác','Mình muốn đặt số lượng lớn cho Workshop.','READ','2026-01-20 10:15:35','2026-01-20 10:15:35'),(3,2,'customer15','kimkyvu2004hd@gmail.com','General','tôi muốn đặt workshop','NEW','2026-01-22 06:45:33','2026-01-22 06:45:33'),(4,2,'customer15','kimkyvu2004hd@gmail.com','Workshop','tôi muốn đặt workshop\r\n','NEW','2026-01-22 06:46:12','2026-01-22 06:46:12');
/*!40000 ALTER TABLE `contact_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('DRAFT','PUBLISHED','ARCHIVED') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `category_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_faq_category` (`category_id`),
  KEY `fk_faq_account` (`created_by`),
  CONSTRAINT `fk_faq_account` FOREIGN KEY (`created_by`) REFERENCES `account` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_faq_category` FOREIGN KEY (`category_id`) REFERENCES `faq_category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,'How do I reset my password?','Go to settings and click reset password.','PUBLISHED',1,1,'2026-01-22 02:10:29','2026-01-22 02:10:29'),(2,'Can I change my plan?','Yes, anytime from the billing page.','DRAFT',2,1,'2026-01-22 02:10:29','2026-01-22 02:10:29'),(3,'What browsers are supported?','Chrome, Firefox, Safari, and Edge.','PUBLISHED',3,1,'2026-01-22 02:10:29','2026-01-22 02:10:29');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_category`
--

DROP TABLE IF EXISTS `faq_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_category`
--

LOCK TABLES `faq_category` WRITE;
/*!40000 ALTER TABLE `faq_category` DISABLE KEYS */;
INSERT INTO `faq_category` VALUES (1,'General','General questions about the platform'),(2,'Billing','Questions about payments and subscriptions'),(3,'Technical','Technical support and troubleshooting');
/*!40000 ALTER TABLE `faq_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'kisskit_db'
--

--
-- Dumping routines for database 'kisskit_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-23 13:32:10
