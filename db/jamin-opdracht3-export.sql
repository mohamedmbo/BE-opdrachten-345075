-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: jamin_opdracht2
-- ------------------------------------------------------
-- Server version	9.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `jamin_opdracht2`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `jamin_opdracht2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `jamin_opdracht2`;

--
-- Table structure for table `allergeen`
--

DROP TABLE IF EXISTS `allergeen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allergeen` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Omschrijving` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allergeen`
--

LOCK TABLES `allergeen` WRITE;
/*!40000 ALTER TABLE `allergeen` DISABLE KEYS */;
INSERT INTO `allergeen` VALUES (1,'Gluten','Dit product bevat gluten',_binary '',NULL,'2026-11-26 10:35:17.098625','2026-11-26 10:35:17.098625'),(2,'Gelatine','Dit product bevat gelatine',_binary '',NULL,'2026-11-26 10:35:17.098625','2026-11-26 10:35:17.098625'),(3,'AZO-Kleurstof','Dit product bevat AZO-kleurstoffen',_binary '',NULL,'2026-11-26 10:35:17.098625','2026-11-26 10:35:17.098625'),(4,'Lactose','Dit product bevat lactose',_binary '',NULL,'2026-11-26 10:35:17.098625','2026-11-26 10:35:17.098625'),(5,'Soja','Dit product bevat soja',_binary '',NULL,'2026-11-26 10:35:17.098625','2026-11-26 10:35:17.098625');
/*!40000 ALTER TABLE `allergeen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Straatnaam` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Huisnummer` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Postcode` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Stad` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` VALUES (1,'Van Gilslaan','34','1045CB','Hilvarenbeek',_binary '',NULL,'2026-11-26 10:35:17.099417','2026-11-26 10:35:17.099417'),(2,'Den Dolderpad','2','1067RC','Utrecht',_binary '',NULL,'2026-11-26 10:35:17.099417','2026-11-26 10:35:17.099417'),(3,'Fredo Raalteweg','257','1236OP','Nijmegen',_binary '',NULL,'2026-11-26 10:35:17.099417','2026-11-26 10:35:17.099417'),(4,'Bertrand Russellhof','21','2034AP','Den Haag',_binary '',NULL,'2026-11-26 10:35:17.099417','2026-11-26 10:35:17.099417'),(5,'Leon van Bonstraat','213','145XC','Lunteren',_binary '',NULL,'2026-11-26 10:35:17.099417','2026-11-26 10:35:17.099417'),(6,'Bea van Lingenlaan','234','2197FG','Sint Pancras',_binary '',NULL,'2026-11-26 10:35:17.099417','2026-11-26 10:35:17.099417');
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leverancier`
--

DROP TABLE IF EXISTS `leverancier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leverancier` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ContactPersoon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LeverancierNummer` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Mobiel` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ContactId` int unsigned NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Leverancier_Nummer` (`LeverancierNummer`),
  KEY `FK_Leverancier_Contact` (`ContactId`),
  CONSTRAINT `FK_Leverancier_Contact` FOREIGN KEY (`ContactId`) REFERENCES `contact` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leverancier`
--

LOCK TABLES `leverancier` WRITE;
/*!40000 ALTER TABLE `leverancier` DISABLE KEYS */;
INSERT INTO `leverancier` VALUES (1,'Venco','Bert van Linge','L1029384719','06-28493827',1,_binary '',NULL,'2026-11-26 10:35:17.100234','2026-11-26 10:35:17.100234'),(2,'Astra Sweets','Jasper del Monte','L1029284315','06-39398734',2,_binary '',NULL,'2026-11-26 10:35:17.100234','2026-11-26 10:35:17.100234'),(3,'Haribo','Sven Stalman','L1029324748','06-24383291',3,_binary '',NULL,'2026-11-26 10:35:17.100234','2026-11-26 10:35:17.100234'),(4,'Basset','Joyce Stelterberg','L1023845773','06-48293823',4,_binary '',NULL,'2026-11-26 10:35:17.100234','2026-11-26 10:35:17.100234'),(5,'De Bron','Remco Veenstra','L1023857736','06-34291234',5,_binary '',NULL,'2026-11-26 10:35:17.100234','2026-11-26 10:35:17.100234'),(6,'Quality Street','Johan Nooij','L1029234586','06-23458456',6,_binary '',NULL,'2026-11-26 10:35:17.100234','2026-11-26 10:35:17.100234');
/*!40000 ALTER TABLE `leverancier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magazijn`
--

DROP TABLE IF EXISTS `magazijn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `magazijn` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int unsigned NOT NULL,
  `VerpakkingsEenheid` decimal(6,2) unsigned NOT NULL,
  `AantalAanwezig` int unsigned DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Magazijn_Product` (`ProductId`),
  CONSTRAINT `FK_Magazijn_Product` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magazijn`
--

LOCK TABLES `magazijn` WRITE;
/*!40000 ALTER TABLE `magazijn` DISABLE KEYS */;
INSERT INTO `magazijn` VALUES (1,1,5.00,453,_binary '',NULL,'2026-11-26 10:35:17.101201','2026-11-26 10:35:17.101201'),(2,2,2.50,400,_binary '',NULL,'2026-11-26 10:35:17.101201','2026-11-26 10:35:17.101201'),(3,3,5.00,1,_binary '',NULL,'2026-11-26 10:35:17.101201','2026-11-26 10:35:17.101201'),(4,4,1.00,800,_binary '',NULL,'2026-11-26 10:35:17.101201','2026-11-26 10:35:17.101201'),(5,5,3.00,234,_binary '',NULL,'2026-11-26 10:35:17.101201','2026-11-26 10:35:17.101201'),(6,6,2.00,345,_binary '',NULL,'2026-11-26 10:35:17.101201','2026-11-26 10:35:17.101201'),(7,7,1.00,795,_binary '',NULL,'2026-11-26 10:35:17.101201','2026-11-26 10:35:17.101201'),(8,8,10.00,233,_binary '',NULL,'2026-11-26 10:35:17.101201','2026-11-26 10:35:17.101201'),(9,9,2.50,123,_binary '',NULL,'2026-11-26 10:35:17.101201','2026-11-26 10:35:17.101201'),(10,10,3.00,NULL,_binary '',NULL,'2026-11-26 10:35:17.101201','2026-11-26 10:35:17.101201'),(11,11,2.00,367,_binary '',NULL,'2026-11-26 10:35:17.101201','2026-11-26 10:35:17.101201'),(12,12,1.00,467,_binary '',NULL,'2026-11-26 10:35:17.101201','2026-11-26 10:35:17.101201'),(13,13,5.00,20,_binary '',NULL,'2026-11-26 10:35:17.101201','2026-11-26 10:35:17.101201');
/*!40000 ALTER TABLE `magazijn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_09_10_130000_add_role_to_users_table',1),(5,'2026_09_10_140000_rename_role_to_rolename',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Barcode` char(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Product_Barcode` (`Barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Mintnopjes','8719587231278',_binary '',NULL,'2026-11-26 10:35:17.097644','2026-11-26 10:35:17.097644'),(2,'Schoolkrijt','8719587326713',_binary '',NULL,'2026-11-26 10:35:17.097644','2026-11-26 10:35:17.097644'),(3,'Honingdrop','8719587327836',_binary '',NULL,'2026-11-26 10:35:17.097644','2026-11-26 10:35:17.097644'),(4,'Zure Beren','8719587321441',_binary '',NULL,'2026-11-26 10:35:17.097644','2026-11-26 10:35:17.097644'),(5,'Cola Flesjes','8719587321237',_binary '',NULL,'2026-11-26 10:35:17.097644','2026-11-26 10:35:17.097644'),(6,'Turtles','8719587322245',_binary '',NULL,'2026-11-26 10:35:17.097644','2026-11-26 10:35:17.097644'),(7,'Witte Muizen','8719587328256',_binary '',NULL,'2026-11-26 10:35:17.097644','2026-11-26 10:35:17.097644'),(8,'Reuzen Slangen','8719587325641',_binary '',NULL,'2026-11-26 10:35:17.097644','2026-11-26 10:35:17.097644'),(9,'Zoute Rijen','8719587322739',_binary '',NULL,'2026-11-26 10:35:17.097644','2026-11-26 10:35:17.097644'),(10,'Winegums','8719587327527',_binary '\0',NULL,'2026-11-26 10:35:17.097644','2026-11-26 10:35:17.097644'),(11,'Drop Munten','8719587322345',_binary '',NULL,'2026-11-26 10:35:17.097644','2026-11-26 10:35:17.097644'),(12,'Kruis Drop','8719587322265',_binary '',NULL,'2026-11-26 10:35:17.097644','2026-11-26 10:35:17.097644'),(13,'Zoute Ruitjes','8719587323256',_binary '',NULL,'2026-11-26 10:35:17.097644','2026-11-26 10:35:17.097644');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productperallergeen`
--

DROP TABLE IF EXISTS `productperallergeen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productperallergeen` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `ProductId` int unsigned NOT NULL,
  `AllergeenId` int unsigned NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_ProductPerAllergeen` (`ProductId`,`AllergeenId`),
  KEY `FK_ProductPerAllergeen_Allergeen` (`AllergeenId`),
  CONSTRAINT `FK_ProductPerAllergeen_Allergeen` FOREIGN KEY (`AllergeenId`) REFERENCES `allergeen` (`Id`),
  CONSTRAINT `FK_ProductPerAllergeen_Product` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productperallergeen`
--

LOCK TABLES `productperallergeen` WRITE;
/*!40000 ALTER TABLE `productperallergeen` DISABLE KEYS */;
INSERT INTO `productperallergeen` VALUES (1,1,2,_binary '',NULL,'2026-11-26 10:35:17.102050','2026-11-26 10:35:17.102050'),(2,1,1,_binary '',NULL,'2026-11-26 10:35:17.102050','2026-11-26 10:35:17.102050'),(3,1,3,_binary '',NULL,'2026-11-26 10:35:17.102050','2026-11-26 10:35:17.102050'),(4,3,4,_binary '',NULL,'2026-11-26 10:35:17.102050','2026-11-26 10:35:17.102050'),(5,6,5,_binary '',NULL,'2026-11-26 10:35:17.102050','2026-11-26 10:35:17.102050'),(6,9,2,_binary '',NULL,'2026-11-26 10:35:17.102050','2026-11-26 10:35:17.102050'),(7,9,5,_binary '',NULL,'2026-11-26 10:35:17.102050','2026-11-26 10:35:17.102050'),(8,10,2,_binary '',NULL,'2026-11-26 10:35:17.102050','2026-11-26 10:35:17.102050'),(9,12,4,_binary '',NULL,'2026-11-26 10:35:17.102050','2026-11-26 10:35:17.102050'),(10,13,1,_binary '',NULL,'2026-11-26 10:35:17.102050','2026-11-26 10:35:17.102050'),(11,13,4,_binary '',NULL,'2026-11-26 10:35:17.102050','2026-11-26 10:35:17.102050'),(12,13,5,_binary '',NULL,'2026-11-26 10:35:17.102050','2026-11-26 10:35:17.102050');
/*!40000 ALTER TABLE `productperallergeen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productperleverancier`
--

DROP TABLE IF EXISTS `productperleverancier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productperleverancier` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `LeverancierId` int unsigned NOT NULL,
  `ProductId` int unsigned NOT NULL,
  `DatumLevering` date NOT NULL,
  `Aantal` int unsigned NOT NULL,
  `DatumEerstVolgendeLevering` date DEFAULT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  KEY `FK_ProductPerLeverancier_Leverancier` (`LeverancierId`),
  KEY `FK_ProductPerLeverancier_Product` (`ProductId`),
  CONSTRAINT `FK_ProductPerLeverancier_Leverancier` FOREIGN KEY (`LeverancierId`) REFERENCES `leverancier` (`Id`),
  CONSTRAINT `FK_ProductPerLeverancier_Product` FOREIGN KEY (`ProductId`) REFERENCES `product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productperleverancier`
--

LOCK TABLES `productperleverancier` WRITE;
/*!40000 ALTER TABLE `productperleverancier` DISABLE KEYS */;
INSERT INTO `productperleverancier` VALUES (1,1,1,'2023-11-09',23,'2023-11-16',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(2,1,1,'2023-11-18',21,'2023-11-25',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(3,1,2,'2023-11-09',12,'2023-11-16',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(4,1,3,'2023-11-10',11,'2023-11-17',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(5,2,4,'2023-11-14',16,'2023-11-21',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(6,2,4,'2023-11-21',23,'2023-11-28',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(7,2,5,'2023-11-14',45,'2023-11-21',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(8,2,6,'2023-11-14',30,'2023-11-21',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(9,3,7,'2023-11-12',12,'2023-11-19',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(10,3,7,'2023-11-19',23,'2023-11-26',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(11,3,8,'2023-11-10',12,'2023-11-17',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(12,3,9,'2023-11-11',1,'2023-11-18',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(13,4,10,'2023-11-16',24,'2023-11-30',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(14,5,11,'2023-11-10',47,'2023-11-17',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(15,5,11,'2023-11-19',60,'2023-11-26',_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(16,5,12,'2023-11-11',45,NULL,_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945'),(17,5,13,'2023-11-12',23,NULL,_binary '',NULL,'2026-11-26 10:35:17.102945','2026-11-26 10:35:17.102945');
/*!40000 ALTER TABLE `productperleverancier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('3OpVC16K865VnTsavlQx8GdRP5O9MNV574EgosQS',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Microsoft Windows 10.0.26200; en-NL) PowerShell/7.6.5','YTozOntzOjY6Il90b2tlbiI7czo0MDoiQmxMakxoS09FbTdzaml3Z2dubkVhTEVnMHdWWjNUR2MxMzFqOWIwbCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9sb2dpbiI7czo1OiJyb3V0ZSI7czo1OiJsb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1793398521),('E2ZjGKlguQxECYfZeco3Oy8igc3XeJslz5z6xhJG',1,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoidzNlMjdLdzA5cmwyNnpmSmhKWnRSNERYUENUdGpKVDNUS1dRNWN4RSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzQ6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMS9sZXZlcmFuY2llcnMiO3M6NToicm91dGUiO3M6MTg6ImxldmVyYW5jaWVycy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==',1793398978),('R93o1mf1L4OMaaLvs59eVZxKJmgvdyNQdJwujiXt',2,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36','YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOXBaZ1FxVlljVGppVENXd041bU5UZ2xua1lBZ3RiNVhibFV2RlROQSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjI6e3M6MzoidXJsIjtzOjQ2OiJodHRwOi8vbG9jYWxob3N0OjgwMDEvbGV2ZXJhbmNpZXJzLzQvcHJvZHVjdGVuIjtzOjU6InJvdXRlIjtzOjIyOiJsZXZlcmFuY2llcnMucHJvZHVjdGVuIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9',1793399763);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rolename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medewerker',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Mohamed 345075','student345075@jamin.local','Eigenaar',NULL,'$2y$12$74ALP9eXSzwpC01Oql7ekueVSJDBir/5QfnGU0FYOnoq9z2K4MZT6',NULL,'2026-10-30 21:15:08','2026-10-30 21:15:08'),(2,'Test User','test@example.com','tandarts',NULL,'$2y$12$p/07n1TWMSvcJT46zBsNpe7UAAjGmtZ4N22NRfyUkY4vmuoIE.F0m',NULL,'2026-10-30 21:33:14','2026-10-30 21:33:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'jamin_opdracht2'
--

--
-- Dumping routines for database 'jamin_opdracht2'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetAantalLeveranciers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetAantalLeveranciers`()
BEGIN
    SELECT COUNT(*) AS Aantal
    FROM Leverancier
    WHERE IsActief = b'1';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetGeleverdeProducten` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetGeleverdeProducten`(IN p_LeverancierId INT UNSIGNED)
BEGIN
    SELECT p.Id, p.Naam, p.IsActief,
           m.AantalAanwezig, m.VerpakkingsEenheid,
           MAX(ppl.DatumLevering) AS LaatsteLevering
    FROM ProductPerLeverancier ppl
    INNER JOIN Product p ON p.Id = ppl.ProductId
    LEFT JOIN Magazijn m ON m.ProductId = p.Id AND m.IsActief = b'1'
    WHERE ppl.LeverancierId = p_LeverancierId AND ppl.IsActief = b'1'
    GROUP BY p.Id, p.Naam, p.IsActief, m.AantalAanwezig, m.VerpakkingsEenheid
    ORDER BY m.AantalAanwezig DESC, p.Naam ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetLeverancierDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetLeverancierDetails`(IN p_LeverancierId INT UNSIGNED)
BEGIN
    SELECT l.Id, l.Naam, l.ContactPersoon, l.LeverancierNummer, l.Mobiel,
           c.Straatnaam, c.Huisnummer, c.Postcode, c.Stad
    FROM Leverancier l
    INNER JOIN Contact c ON c.Id = l.ContactId AND c.IsActief = b'1'
    WHERE l.Id = p_LeverancierId AND l.IsActief = b'1';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetLeveranciersOverzicht` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetLeveranciersOverzicht`()
BEGIN
    SELECT l.Id, l.Naam, l.ContactPersoon, l.LeverancierNummer, l.Mobiel,
           COUNT(DISTINCT ppl.ProductId) AS AantalVerschillendeProducten
    FROM Leverancier l
    LEFT JOIN ProductPerLeverancier ppl
      ON ppl.LeverancierId = l.Id AND ppl.IsActief = b'1'
    WHERE l.IsActief = b'1'
    GROUP BY l.Id, l.Naam, l.ContactPersoon, l.LeverancierNummer, l.Mobiel
    ORDER BY AantalVerschillendeProducten DESC, l.Naam ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetLeveranciersWijzigen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_GetLeveranciersWijzigen`(
    IN p_Limiet INT UNSIGNED,
    IN p_Offset INT UNSIGNED
)
BEGIN
    SELECT Id, Naam, ContactPersoon, LeverancierNummer, Mobiel
    FROM Leverancier
    WHERE IsActief = b'1'
    ORDER BY Id
    LIMIT p_Limiet OFFSET p_Offset;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_VoegProductLeveringToe` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_VoegProductLeveringToe`(
    IN p_LeverancierId INT UNSIGNED,
    IN p_ProductId INT UNSIGNED,
    IN p_Aantal INT UNSIGNED,
    IN p_DatumEerstVolgendeLevering DATE
)
BEGIN
    DECLARE v_IsActief BIT DEFAULT b'0';
    DECLARE v_NieuwId INT UNSIGNED;

    SELECT IsActief INTO v_IsActief FROM Product WHERE Id = p_ProductId;
    IF v_IsActief = b'0' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'PRODUCT_NIET_ACTIEF';
    END IF;

    START TRANSACTION;
    SELECT COALESCE(MAX(Id), 0) + 1 INTO v_NieuwId FROM ProductPerLeverancier FOR UPDATE;
    INSERT INTO ProductPerLeverancier
      (Id, LeverancierId, ProductId, DatumLevering, Aantal, DatumEerstVolgendeLevering)
    VALUES
      (v_NieuwId, p_LeverancierId, p_ProductId, CURRENT_DATE(), p_Aantal, p_DatumEerstVolgendeLevering);
    UPDATE Magazijn
       SET AantalAanwezig = COALESCE(AantalAanwezig, 0) + p_Aantal
     WHERE ProductId = p_ProductId AND IsActief = b'1';
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_WijzigLeverancier` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_WijzigLeverancier`(
    IN p_LeverancierId INT UNSIGNED,
    IN p_Naam VARCHAR(100),
    IN p_ContactPersoon VARCHAR(100),
    IN p_LeverancierNummer VARCHAR(20),
    IN p_Mobiel VARCHAR(20),
    IN p_Straatnaam VARCHAR(100),
    IN p_Huisnummer VARCHAR(10),
    IN p_Postcode VARCHAR(7),
    IN p_Stad VARCHAR(100)
)
BEGIN
    DECLARE v_ContactId INT UNSIGNED;

    IF p_LeverancierId = 5 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'TECHNISCHE_STORING';
    END IF;

    SELECT ContactId INTO v_ContactId
    FROM Leverancier
    WHERE Id = p_LeverancierId AND IsActief = b'1';

    START TRANSACTION;
    UPDATE Leverancier
       SET Naam = p_Naam,
           ContactPersoon = p_ContactPersoon,
           LeverancierNummer = p_LeverancierNummer,
           Mobiel = p_Mobiel
     WHERE Id = p_LeverancierId AND IsActief = b'1';

    UPDATE Contact
       SET Straatnaam = p_Straatnaam,
           Huisnummer = p_Huisnummer,
           Postcode = p_Postcode,
           Stad = p_Stad
     WHERE Id = v_ContactId AND IsActief = b'1';
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-26 10:35:25
