-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: laravel
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
-- Table structure for table `Product`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Product` (
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
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES (1,'Mintnopjes','8719587231278',0x01,NULL,'2026-09-09 09:23:49.437416','2026-09-09 09:23:49.437416'),(2,'Schoolkrijt','8719587326713',0x01,NULL,'2026-09-09 09:23:49.437416','2026-09-09 09:23:49.437416'),(3,'Honingdrop','8719587327836',0x01,NULL,'2026-09-09 09:23:49.437416','2026-09-09 09:23:49.437416'),(4,'Zure Beren','8719587321441',0x01,NULL,'2026-09-09 09:23:49.437416','2026-09-09 09:23:49.437416'),(5,'Cola Flesjes','8719587321237',0x01,NULL,'2026-09-09 09:23:49.437416','2026-09-09 09:23:49.437416'),(6,'Turtles','8719587322245',0x01,NULL,'2026-09-09 09:23:49.437416','2026-09-09 09:23:49.437416'),(7,'Witte Muizen','8719587328256',0x01,NULL,'2026-09-09 09:23:49.437416','2026-09-09 09:23:49.437416'),(8,'Reuzen Slangen','8719587325641',0x01,NULL,'2026-09-09 09:23:49.437416','2026-09-09 09:23:49.437416'),(9,'Zoute Rijen','8719587322739',0x01,NULL,'2026-09-09 09:23:49.437416','2026-09-09 09:23:49.437416'),(10,'Winegums','8719587327527',0x01,NULL,'2026-09-09 09:23:49.437416','2026-09-09 09:23:49.437416'),(11,'Drop Munten','8719587322345',0x01,NULL,'2026-09-09 09:23:49.437416','2026-09-09 09:23:49.437416'),(12,'Kruis Drop','8719587322265',0x01,NULL,'2026-09-09 09:23:49.437416','2026-09-09 09:23:49.437416'),(13,'Zoute Ruitjes','8719587323256',0x01,NULL,'2026-09-09 09:23:49.437416','2026-09-09 09:23:49.437416');
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Allergeen`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Allergeen` (
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
-- Dumping data for table `Allergeen`
--

LOCK TABLES `Allergeen` WRITE;
/*!40000 ALTER TABLE `Allergeen` DISABLE KEYS */;
INSERT INTO `Allergeen` VALUES (1,'Gluten','Dit product bevat gluten',0x01,NULL,'2026-09-09 09:23:49.445694','2026-09-09 09:23:49.445694'),(2,'Gelatine','Dit product bevat gelatine',0x01,NULL,'2026-09-09 09:23:49.445694','2026-09-09 09:23:49.445694'),(3,'AZO-Kleurstof','Dit product bevat AZO-kleurstoffen',0x01,NULL,'2026-09-09 09:23:49.445694','2026-09-09 09:23:49.445694'),(4,'Lactose','Dit product bevat lactose',0x01,NULL,'2026-09-09 09:23:49.445694','2026-09-09 09:23:49.445694'),(5,'Soja','Dit product bevat soja',0x01,NULL,'2026-09-09 09:23:49.445694','2026-09-09 09:23:49.445694');
/*!40000 ALTER TABLE `Allergeen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Leverancier`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Leverancier` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Naam` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ContactPersoon` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `LeverancierNummer` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Mobiel` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IsActief` bit(1) NOT NULL DEFAULT b'1',
  `Opmerking` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DatumAangemaakt` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `DatumGewijzigd` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UQ_Leverancier_Nummer` (`LeverancierNummer`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Leverancier`
--

LOCK TABLES `Leverancier` WRITE;
/*!40000 ALTER TABLE `Leverancier` DISABLE KEYS */;
INSERT INTO `Leverancier` VALUES (1,'Venco','Bert van Linge','L1029384719','06-28493827',0x01,NULL,'2026-09-09 09:23:49.447055','2026-09-09 09:23:49.447055'),(2,'Astra Sweets','Jasper del Monte','L1029284315','06-39398734',0x01,NULL,'2026-09-09 09:23:49.447055','2026-09-09 09:23:49.447055'),(3,'Haribo','Sven Stalman','L1029324748','06-24383291',0x01,NULL,'2026-09-09 09:23:49.447055','2026-09-09 09:23:49.447055'),(4,'Basset','Joyce Stelterberg','L1023845773','06-48293823',0x01,NULL,'2026-09-09 09:23:49.447055','2026-09-09 09:23:49.447055'),(5,'De Bron','Remco Veenstra','L1023857736','06-34291234',0x01,NULL,'2026-09-09 09:23:49.447055','2026-09-09 09:23:49.447055');
/*!40000 ALTER TABLE `Leverancier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Magazijn`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Magazijn` (
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
  CONSTRAINT `FK_Magazijn_Product` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Magazijn`
--

LOCK TABLES `Magazijn` WRITE;
/*!40000 ALTER TABLE `Magazijn` DISABLE KEYS */;
INSERT INTO `Magazijn` VALUES (1,1,5.00,453,0x01,NULL,'2026-09-09 09:23:49.448775','2026-09-09 09:23:49.448775'),(2,2,2.50,400,0x01,NULL,'2026-09-09 09:23:49.448775','2026-09-09 09:23:49.448775'),(3,3,5.00,1,0x01,NULL,'2026-09-09 09:23:49.448775','2026-09-09 09:23:49.448775'),(4,4,1.00,800,0x01,NULL,'2026-09-09 09:23:49.448775','2026-09-09 09:23:49.448775'),(5,5,3.00,234,0x01,NULL,'2026-09-09 09:23:49.448775','2026-09-09 09:23:49.448775'),(6,6,2.00,345,0x01,NULL,'2026-09-09 09:23:49.448775','2026-09-09 09:23:49.448775'),(7,7,1.00,795,0x01,NULL,'2026-09-09 09:23:49.448775','2026-09-09 09:23:49.448775'),(8,8,10.00,233,0x01,NULL,'2026-09-09 09:23:49.448775','2026-09-09 09:23:49.448775'),(9,9,2.50,123,0x01,NULL,'2026-09-09 09:23:49.448775','2026-09-09 09:23:49.448775'),(10,10,3.00,NULL,0x01,NULL,'2026-09-09 09:23:49.448775','2026-09-09 09:23:49.448775'),(11,11,2.00,367,0x01,NULL,'2026-09-09 09:23:49.448775','2026-09-09 09:23:49.448775'),(12,12,1.00,467,0x01,NULL,'2026-09-09 09:23:49.448775','2026-09-09 09:23:49.448775'),(13,13,5.00,20,0x01,NULL,'2026-09-09 09:23:49.448775','2026-09-09 09:23:49.448775');
/*!40000 ALTER TABLE `Magazijn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductPerAllergeen`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductPerAllergeen` (
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
  CONSTRAINT `FK_ProductPerAllergeen_Allergeen` FOREIGN KEY (`AllergeenId`) REFERENCES `Allergeen` (`Id`),
  CONSTRAINT `FK_ProductPerAllergeen_Product` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductPerAllergeen`
--

LOCK TABLES `ProductPerAllergeen` WRITE;
/*!40000 ALTER TABLE `ProductPerAllergeen` DISABLE KEYS */;
INSERT INTO `ProductPerAllergeen` VALUES (1,1,2,0x01,NULL,'2026-09-09 09:23:49.450996','2026-09-09 09:23:49.450996'),(2,1,1,0x01,NULL,'2026-09-09 09:23:49.450996','2026-09-09 09:23:49.450996'),(3,1,3,0x01,NULL,'2026-09-09 09:23:49.450996','2026-09-09 09:23:49.450996'),(4,3,4,0x01,NULL,'2026-09-09 09:23:49.450996','2026-09-09 09:23:49.450996'),(5,6,5,0x01,NULL,'2026-09-09 09:23:49.450996','2026-09-09 09:23:49.450996'),(6,9,2,0x01,NULL,'2026-09-09 09:23:49.450996','2026-09-09 09:23:49.450996'),(7,9,5,0x01,NULL,'2026-09-09 09:23:49.450996','2026-09-09 09:23:49.450996'),(8,10,2,0x01,NULL,'2026-09-09 09:23:49.450996','2026-09-09 09:23:49.450996'),(9,12,4,0x01,NULL,'2026-09-09 09:23:49.450996','2026-09-09 09:23:49.450996'),(10,13,1,0x01,NULL,'2026-09-09 09:23:49.450996','2026-09-09 09:23:49.450996'),(11,13,4,0x01,NULL,'2026-09-09 09:23:49.450996','2026-09-09 09:23:49.450996'),(12,13,5,0x01,NULL,'2026-09-09 09:23:49.450996','2026-09-09 09:23:49.450996');
/*!40000 ALTER TABLE `ProductPerAllergeen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ProductPerLeverancier`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ProductPerLeverancier` (
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
  CONSTRAINT `FK_ProductPerLeverancier_Leverancier` FOREIGN KEY (`LeverancierId`) REFERENCES `Leverancier` (`Id`),
  CONSTRAINT `FK_ProductPerLeverancier_Product` FOREIGN KEY (`ProductId`) REFERENCES `Product` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ProductPerLeverancier`
--

LOCK TABLES `ProductPerLeverancier` WRITE;
/*!40000 ALTER TABLE `ProductPerLeverancier` DISABLE KEYS */;
INSERT INTO `ProductPerLeverancier` VALUES (1,1,1,'2024-10-09',23,'2024-10-16',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(2,1,1,'2024-10-18',21,'2024-10-25',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(3,1,2,'2024-10-09',12,'2024-10-16',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(4,1,3,'2024-10-10',11,'2024-10-17',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(5,2,4,'2024-10-14',16,'2024-10-21',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(6,2,4,'2024-10-21',23,'2024-10-28',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(7,2,5,'2024-10-14',45,'2024-10-21',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(8,2,6,'2024-10-14',30,'2024-10-21',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(9,3,7,'2024-10-12',12,'2024-10-19',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(10,3,7,'2024-10-19',23,'2024-10-26',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(11,3,8,'2024-10-10',12,'2024-10-17',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(12,3,9,'2024-10-11',1,'2024-10-18',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(13,4,10,'2024-10-16',24,'2024-10-30',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(14,5,11,'2024-10-10',47,'2024-10-17',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(15,5,11,'2024-10-19',60,'2024-10-26',0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(16,5,12,'2024-10-11',45,NULL,0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260'),(17,5,13,'2024-10-12',23,NULL,0x01,NULL,'2026-09-09 09:23:49.452260','2026-09-09 09:23:49.452260');
/*!40000 ALTER TABLE `ProductPerLeverancier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-09  9:40:41
