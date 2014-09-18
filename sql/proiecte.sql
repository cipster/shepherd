CREATE DATABASE IF NOT EXISTS `proiecte` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `proiecte`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: proiecte
-- ------------------------------------------------------
-- Server version	5.5.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT = @@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS = @@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION = @@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE = @@TIME_ZONE */;
/*!40103 SET TIME_ZONE = '+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0 */;
/*!40101 SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE = 'NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES = @@SQL_NOTES, SQL_NOTES = 0 */;

--
-- Table structure for table `altemateriale`
--

DROP TABLE IF EXISTS `altemateriale`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `altemateriale` (
  `id_alte_materiale` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `altemateriale`     LONGBLOB         NOT NULL,
  `nume`              VARCHAR(150)     NOT NULL,
  `creat_de`          VARCHAR(150) DEFAULT NULL,
  `creat_la`          TIMESTAMP        NULL DEFAULT NULL,
  PRIMARY KEY (`id_alte_materiale`),
  UNIQUE KEY `id_alte_materiale_UNIQUE` (`id_alte_materiale`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `altemateriale`
--

LOCK TABLES `altemateriale` WRITE;
/*!40000 ALTER TABLE `altemateriale` DISABLE KEYS */;
/*!40000 ALTER TABLE `altemateriale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bd`
--

DROP TABLE IF EXISTS `bd`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bd` (
  `id_bd`    INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bd`       LONGBLOB         NOT NULL,
  `nume`     VARCHAR(150)     NOT NULL,
  `creat_de` VARCHAR(150) DEFAULT NULL,
  `creat_la` TIMESTAMP        NULL DEFAULT NULL,
  PRIMARY KEY (`id_bd`),
  UNIQUE KEY `id_bd_UNIQUE` (`id_bd`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bd`
--

LOCK TABLES `bd` WRITE;
/*!40000 ALTER TABLE `bd` DISABLE KEYS */;
/*!40000 ALTER TABLE `bd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chestionarfinal`
--

DROP TABLE IF EXISTS `chestionarfinal`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chestionarfinal` (
  `id_chestionar_final` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `chestionar_final`    LONGBLOB         NOT NULL,
  `nume`                VARCHAR(150)     NOT NULL,
  `creat_de`            VARCHAR(150) DEFAULT NULL,
  `creat_la`            TIMESTAMP        NULL DEFAULT NULL,
  PRIMARY KEY (`id_chestionar_final`),
  UNIQUE KEY `id_chestionar_final_UNIQUE` (`id_chestionar_final`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chestionarfinal`
--

LOCK TABLES `chestionarfinal` WRITE;
/*!40000 ALTER TABLE `chestionarfinal` DISABLE KEYS */;
/*!40000 ALTER TABLE `chestionarfinal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clienti` (
  `id_client` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `client`    VARCHAR(250)     NOT NULL,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `id_client_UNIQUE` (`id_client`),
  UNIQUE KEY `client_UNIQUE` (`client`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =402
  DEFAULT CHARSET =latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clienti`
--

LOCK TABLES `clienti` WRITE;
/*!40000 ALTER TABLE `clienti` DISABLE KEYS */;
INSERT INTO `clienti`
VALUES (1, '360Insights'), (2, 'Adama'), (3, 'Albalact'), (4, 'Alico'), (5, 'Alpha Bank'), (6, 'Ambasada Norvegiei'),
  (7, 'Banca Transilvania'), (8, 'BAT'), (9, 'Bristol-Myers Squibb-Romania'), (10, 'Carpatina'), (11, 'Carrefour'),
  (12, 'Centerra'), (13, 'Coca Cola'), (14, 'Communiqué Media'), (15, 'Cosmote'), (16, 'Coty'), (17, 'Crama Oprisor'),
  (18, 'Danone'), (19, 'DELACO'), (20, 'Digital MR'), (21, 'Dr.Oetker'), (22, 'Ewopharma'), (23, 'Fabryo'),
  (24, 'Frank Group'), (25, 'Gilette'), (26, 'GIM'), (27, 'Glenmark'), (28, 'Greenpeace'), (29, 'GSK'), (30, 'Happen'),
  (31, 'Harris Interactive'), (32, 'Heineken'), (33, 'Hochland'), (34, 'Impact Research LTD'), (35, 'Inbev'),
  (36, 'ING'), (37, 'Itsy Bitsy'), (38, 'Johnson & Johnson'), (39, 'JTI'), (40, 'Kanal D'), (41, 'Kandia'),
  (42, 'Kantar Operations'), (43, 'Kirsty Evans'), (44, 'Kraft'), (45, 'L\'Oreal'), (46, 'MASMI Poland'),
  (47, 'Mediplus Exim'), (48, 'MEMRB'), (49, 'Millward Brown'), (50, 'Mystery Visit Market Research & Consulting Ltd'),
  (51, 'Nepentes'), (52, 'Nestle'), (53, 'New Kopel Group'), (54, 'Nokia'), (55, 'Novartis'), (56, 'Olympus'),
  (57, 'Opinion Matters'), (58, 'Orange'), (59, 'Ozone'), (60, 'Perception Research Services'), (61, 'Pfizer'),
  (62, 'Philip Morris Int.'), (63, 'PPD Romania'), (64, 'Quadrant Amroq Beverages'), (65, 'Raiffeisen Bank'),
  (66, 'Reckitt Benckiser'), (67, 'River Research'), (68, 'Romtelecom'), (69, 'Sanofi-Avensis'), (70, 'Sanoma'),
  (71, 'Sarantis'), (72, 'Shanghai Horizon'), (73, 'Singway'), (74, 'Sodexo'), (75, 'Srdjan Mijuskovic'),
  (76, 'Star Foods'), (77, 'Strauss Romania'), (78, 'Supreme Group'),
  (79, 'Szinapszis Market Research & Consulting Ltd.'), (390, 'TestClient'), (401, 'TestClient124'),
  (393, 'TestClientt'), (398, 'TestClienttttttttttt'), (80, 'TetraPack'), (81, 'TNUVA'), (82, 'Toyota Romania'),
  (83, 'Tuborg'), (84, 'Tymbark'), (85, 'Unilever'), (86, 'Ursus'), (87, 'Vascar'), (88, 'Vodafone Romania SA'),
  (89, 'Volksbank'), (90, 'Wrigley'), (91, 'Zenith'), (92, 'Zentiva');
/*!40000 ALTER TABLE `clienti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listaproiecte`
--

DROP TABLE IF EXISTS `listaproiecte`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listaproiecte` (
  `id_proiect`          INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nume_proiect`        VARCHAR(250)     NOT NULL,
  `nr_proiect`          VARCHAR(45)      NOT NULL,
  `an`                  VARCHAR(4)       NOT NULL,
  `id_client`           INT(11)          NOT NULL,
  `id_propunere`        VARCHAR(100) DEFAULT '0',
  `id_chestionar_final` VARCHAR(100) DEFAULT '0',
  `id_raport_final`     VARCHAR(100) DEFAULT '0',
  `id_bd`               VARCHAR(100) DEFAULT '0',
  `id_alte_materiale`   VARCHAR(100) DEFAULT '0',
  PRIMARY KEY (`id_proiect`),
  UNIQUE KEY `id_proiect_UNIQUE` (`id_proiect`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =877
  DEFAULT CHARSET =latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listaproiecte`
--

LOCK TABLES `listaproiecte` WRITE;
/*!40000 ALTER TABLE `listaproiecte` DISABLE KEYS */;
INSERT INTO `listaproiecte` VALUES (2, 'ADAMA-QL', '016', '2008', 2, '0', '0', '0', '0', '0'),
  (3, 'Testare de reclama - Tokio-QL', '014', '2008', 8, '0', '0', '0', '0', '0'),
  (4, 'Project BOMBER-QL', '015', '2008', 8, '0', '0', '0', '0', '0'),
  (5, 'Omnibus Apa-QN', '029', '2008', 10, '0', '0', '0', '0', '0'),
  (6, 'Concept test-QN', '024', '2008', 15, '0', '0', '0', '0', '0'),
  (7, 'Abonamente Cosmote Conjoint-QN', '025', '2008', 15, '0', '0', '0', '0', '0'),
  (8, 'Cosmote Bariere-QN', '027', '2008', 15, '0', '0', '0', '0', '0'),
  (9, 'Locatie telefonie pe fuga 3-5 dec 2008-QN', '035', '2008', 15, '0', '0', '0', '0', '0'),
  (10, 'V.I.P.-QL', '019', '2008', 16, '0', '0', '0', '0', '0'),
  (11, 'Project Neumarkt-QN', '028', '2008', 32, '0', '0', '0', '0', '0'),
  (12, 'Golden Brau 0.65l Package Test-QN', '030', '2008', 32, '0', '0', '0', '0', '0'),
  (13, 'Inbev - Blind PT, BKs (100%)-QN', '007', '2008', 35, '0', '0', '0', '0', '0'),
  (14, 'JTI project-QN', '005', '2008', 39, '0', '0', '0', '0', '0'),
  (15, 'Training JTI-QL', '031', '2008', 39, '0', '0', '0', '0', '0'),
  (16, 'Testare 3 in 1 - locatie-QN', '036', '2008', 44, '0', '0', '0', '0', '0'),
  (17, 'Moldova conjoint & KA Exit-QN', '012', '2008', 48, '0', '0', '0', '0', '0'),
  (18, 'Joe Brand Image Assessment-QL', '006', '2008', 52, '0', '0', '0', '0', '0'),
  (19, 'Joe Brand Image Assessment-QN', '008', '2008', 52, '0', '0', '0', '0', '0'),
  (21, 'In-home visits-QL', '022', '2008', 52, '0', '0', '0', '0', '0'),
  (22, 'Wafers Boost-QN', '023', '2008', 52, '0', '0', '0', '0', '0'),
  (23, 'Consumer profile cafea-QN', '032', '2008', 52, '0', '0', '0', '0', '0'),
  (24, 'Maggi - Brand Image-QL', '038', '2008', 52, '0', '0', '0', '0', '0'),
  (25, 'Maggi - PPP Target Profile-QL', '039', '2008', 52, '0', '0', '0', '0', '0'),
  (26, 'CAPI - PrePay CBC (100%)-QN', '010', '2008', 58, '0', '0', '0', '0', '0'),
  (27, 'U&A - OZONE-QN', '021', '2008', 59, '0', '0', '0', '0', '0'),
  (28, 'Omnibus Consumer Profile- CATI-QN', '026', '2008', 66, '0', '0', '0', '0', '0'),
  (29, 'Cercetare QL Magazines-QL', '011', '2008', 70, '0', '0', '0', '0', '0'),
  (30, 'Communication Assessment-QL', '004', '2008', 80, '0', '0', '0', '0', '0'),
  (31, 'Yoplait Comm Assessment-QL', '001', '2008', 81, '0', '0', '0', '0', '0'),
  (32, 'Yop Comm Assessment-QL', '002', '2008', 81, '0', '0', '0', '0', '0'),
  (33, 'Yogurt Market Assessment-QL', '003', '2008', 81, '0', '0', '0', '0', '0'),
  (34, 'Tnuva Communication Assess-QL', '009', '2008', 81, '0', '0', '0', '0', '0'),
  (35, 'Testare 2 produse-QN', '017', '2008', 81, '0', '0', '0', '0', '0'),
  (36, 'Testare 3 produse-QN', '018', '2008', 81, '0', '0', '0', '0', '0'),
  (37, 'HAIRY POTTER-QL', '020', '2008', 85, '0', '0', '0', '0', '0'),
  (38, 'QL Zentiva-Evaluarea marcii - Dicarbocalm-QL', '033', '2008', 92, '0', '0', '0', '0', '0'),
  (39, 'Zentiva Allgocalmin - 2 grupuri-QL', '037', '2008', 92, '0', '0', '0', '0', '0'),
  (40, 'Proiect intern produse bancare-QL', '002', '2009', 1, '0', '0', '0', '0', '0'),
  (41, 'Proiect Intern Testare Reclama-QN', '015', '2009', 1, '0', '0', '0', '0', '0'),
  (42, 'Omnibus Martie 2009-QN', '020', '2009', 1, '0', '0', '0', '0', '0'),
  (43, 'KA Project-QN', '048/01', '2009', 8, '0', '0', '0', '0', '0'),
  (44, 'KA Project-QL', '048/02', '2009', 8, '0', '0', '0', '0', '0'),
  (45, 'Project PADLOCK-QL', '050', '2009', 8, '0', '0', '0', '0', '0'),
  (46, 'Project VELOURS-QL', '065', '2009', 8, '0', '0', '0', '0', '0'),
  (47, 'Catchments Area Definition & Concept Refining-QN', '078', '2009', 12, '0', '0', '0', '0', '0'),
  (48, 'Test Nestea-QN', '017', '2009', 13, '0', '0', '0', '0', '0'),
  (49, 'Deep water-QN', '053', '2009', 13, '0', '0', '0', '0', '0'),
  (50, '*ariuri-QN', '042/01', '2009', 14, '0', '0', '0', '0', '0'),
  (51, '*ariuri-QL', '042/02', '2009', 14, '0', '0', '0', '0', '0'),
  (52, 'Customer Experience Management Survey-QL', '030/01', '2009', 15, '0', '0', '0', '0', '0'),
  (53, 'Customer Experience Management Survey-QN', '030/02', '2009', 15, '0', '0', '0', '0', '0'),
  (54, 'Pricing study Parasinus-QN', '096', '2009', 29, '0', '0', '0', '0', '0'),
  (55, 'Bere - test la raft-QN', '009', '2009', 32, '0', '0', '0', '0', '0'),
  (56, 'Heineken Hategana - QL + QN-QN', '034/01', '2009', 32, '0', '0', '0', '0', '0'),
  (57, 'Heineken Hategana - QL + QN-QL', '034/02', '2009', 32, '0', '0', '0', '0', '0'),
  (58, 'Heineken Promotie-QN', '045/01', '2009', 32, '0', '0', '0', '0', '0'),
  (59, 'Heineken Promotie-QL', '045/02', '2009', 32, '0', '0', '0', '0', '0'),
  (60, 'Innovating PET – Discovering New Approaches-QL', '047', '2009', 32, '0', '0', '0', '0', '0'),
  (61, 'WorkShop-QL', '052', '2009', 32, '0', '0', '0', '0', '0'),
  (62, 'Omnibus Heineken Iulie 2009-QN', '063', '2009', 32, '0', '0', '0', '0', '0'),
  (63, 'Taste Mapping of the Romanian Beer market-QN', '069', '2009', 32, '0', '0', '0', '0', '0'),
  (64, 'Trial Bere - Aug 2009-QN', '070', '2009', 32, '0', '0', '0', '0', '0'),
  (65, 'Exploring The NAB Market In Romania-QN', '071/01', '2009', 32, '0', '0', '0', '0', '0'),
  (66, 'Exploring The NAB Market In Romania-QN', '071/02', '2009', 32, '0', '0', '0', '0', '0'),
  (67, 'Bere fara Alcool QL-QL', '072', '2009', 32, '0', '0', '0', '0', '0'),
  (68, 'Testing New Packaging For Ciuc Beer  QL-QL', '075', '2009', 32, '0', '0', '0', '0', '0'),
  (69, 'Trial Bere - Sept 2009 - val 2-QN', '077', '2009', 32, '0', '0', '0', '0', '0'),
  (70, 'Omnibus Sept 09-QN', '080', '2009', 32, '0', '0', '0', '0', '0'),
  (71, 'Research On Internationalism QL-QL', '083', '2009', 32, '0', '0', '0', '0', '0'),
  (72, 'Ciuc Cap Research Study QN Buc+BV-QN', '085', '2009', 32, '0', '0', '0', '0', '0'),
  (73, 'Heineken Can Package Test-QN', '087', '2009', 32, '0', '0', '0', '0', '0'),
  (74, 'Neumarkt Re-design-QL', '090', '2009', 32, '0', '0', '0', '0', '0'),
  (75, 'Bere Ciucas si Burger-QN', '098', '2009', 32, '0', '0', '0', '0', '0'),
  (76, 'Neumarkt PET Design-QN', '111', '2009', 32, '0', '0', '0', '0', '0'),
  (77, 'Golden Brau Pack-Test-QN', '113', '2009', 32, '0', '0', '0', '0', '0'),
  (78, 'UCL 2010-QN', '115/01', '2009', 32, '0', '0', '0', '0', '0'),
  (79, 'UCL 2010-QL', '115/02', '2009', 32, '0', '0', '0', '0', '0'),
  (80, 'Studiu Compass-QN', '119', '2009', 32, '0', '0', '0', '0', '0'),
  (81, 'Research on Horeca Channel-QL', '120', '2009', 32, '0', '0', '0', '0', '0'),
  (82, 'Testare Produs - Cascaval-QN', '023', '2009', 33, '0', '0', '0', '0', '0'),
  (83, 'Miere si scortisoara ?-QN', '040', '2009', 33, '0', '0', '0', '0', '0'),
  (84, 'Itsy Bitsy Consumer Profile-QL', '005/01', '2009', 37, '0', '0', '0', '0', '0'),
  (85, 'Itsy Bitsy Consumer Profile-QN', '005/02', '2009', 37, '0', '0', '0', '0', '0'),
  (86, 'Research Programme Proposal on\nConsumer Research Project SHARK-QL', '025/01', '2009', 38, '0', '0', '0', '0', '0'),
  (87, 'Research Programme Proposal on\nConsumer Research Project “SHARK”-QN', '025/02', '2009', 38, '0', '0', '0', '0', '0'),
  (88, 'CAT Test-QN', '012', '2009', 39, '0', '0', '0', '0', '0'),
  (89, 'Kanal D research-QL', '108/01', '2009', 40, '0', '0', '0', '0', '0'),
  (90, 'Kanal D research-QN', '108/02', '2009', 40, '0', '0', '0', '0', '0'),
  (91, 'Orange - Q3-QN', '054/01', '2009', 42, '0', '0', '0', '0', '0'),
  (92, 'Orange - Q3-QN', '054/02', '2009', 42, '0', '0', '0', '0', '0'),
  (93, 'Orange - Q3-QN', '054/03', '2009', 42, '0', '0', '0', '0', '0'),
  (94, 'Breakfast biscuits-QN', '021', '2009', 44, '0', '0', '0', '0', '0'),
  (95, 'Ice Coffee Product Test-QN', '022', '2009', 44, '0', '0', '0', '0', '0'),
  (96, 'Plasare cafea 3 orase-QN', '041', '2009', 44, '0', '0', '0', '0', '0'),
  (97, 'Locatie 600 IBRICUL-QN', '073', '2009', 44, '0', '0', '0', '0', '0'),
  (98, 'Introducing Milka Biscuits-QN', '094', '2009', 44, '0', '0', '0', '0', '0'),
  (99, 'Trijoy-QN', '099/01', '2009', 44, '0', '0', '0', '0', '0'),
  (100, 'Trijoy-QL', '099/02', '2009', 44, '0', '0', '0', '0', '0'),
  (101, 'Omnibus Nov 2009-QN', '105', '2009', 44, '0', '0', '0', '0', '0'),
  (102, 'Testare napolitane-QN', '004', '2009', 52, '0', '0', '0', '0', '0'),
  (103, '6040 Nescafe Frappe-QN', '007', '2009', 52, '0', '0', '0', '0', '0'),
  (104, 'Nescafe 3 in 1 Concept Test-QL', '016', '2009', 52, '0', '0', '0', '0', '0'),
  (105, 'Recuperare 1 - Punga Magica-QL', '019', '2009', 52, '0', '0', '0', '0', '0'),
  (106, 'Nescafe Communication Brand Umbrella-QL', '027', '2009', 52, '0', '0', '0', '0', '0'),
  (107, 'Maggi Bors – product placement test-recuperare 2-QN', '029', '2009', 52, '0', '0', '0', '0', '0'),
  (108, 'Qualitative Research PPP Segment Cofee-QL', '031', '2009', 52, '0', '0', '0', '0', '0'),
  (109, 'Joe Communication Platform Assessment-QL', '036', '2009', 52, '0', '0', '0', '0', '0'),
  (110, 'Nesquik Snack – Product Test- f2f-QN', '037', '2009', 52, '0', '0', '0', '0', '0'),
  (111, 'Maggi - Mai 2009 - recuperare 3-QL', '039', '2009', 52, '0', '0', '0', '0', '0'),
  (112, 'Ciocolata in iunie-QN', '043', '2009', 52, '0', '0', '0', '0', '0'),
  (113, 'PPP - recuperare 4-QL', '058', '2009', 52, '0', '0', '0', '0', '0'),
  (114, 'Maggi - recuperare 5-QL', '059', '2009', 52, '0', '0', '0', '0', '0'),
  (115, 'Maggi Borsh Communication Pretest-QL', '088', '2009', 52, '0', '0', '0', '0', '0'),
  (116, 'Maggi Brand Umbrella Evaluation-QL', '089', '2009', 52, '0', '0', '0', '0', '0'),
  (117, 'Joe Communication-QL', '093', '2009', 52, '0', '0', '0', '0', '0'),
  (118, 'Joe Promotion-QL', '103', '2009', 52, '0', '0', '0', '0', '0'),
  (119, '3in1 Nov 2009-QL', '104', '2009', 52, '0', '0', '0', '0', '0'),
  (120, 'Soft vs Hard Format Bouillons-FGDs-QL', '109', '2009', 52, '0', '0', '0', '0', '0'),
  (121, 'Instant PT-QN', '110', '2009', 52, '0', '0', '0', '0', '0'),
  (122, 'Research Programme Proposal on an Add Campaign and Product Evaluation-QL', '024', '2009', 58, '0', '0', '0', '0', '0'),
  (123, 'Orange dual users-QL', '035/01', '2009', 58, '0', '0', '0', '0', '0'),
  (124, 'Orange dual users-QN', '035/02', '2009', 58, '0', '0', '0', '0', '0'),
  (125, 'Orange Churn - Buc+Galati-QL', '056', '2009', 58, '0', '0', '0', '0', '0'),
  (126, 'Potential B2B-QN', '066', '2009', 58, '0', '0', '0', '0', '0'),
  (127, 'Potential - B2C-QN', '067', '2009', 58, '0', '0', '0', '0', '0'),
  (128, 'Locatie Telefonie Mobila - 3 orase-QN', '081', '2009', 58, '0', '0', '0', '0', '0'),
  (129, 'Usage and attitudes study on telecom services Qualitative Research-QL', '082', '2009', 58, '0', '0', '0', '0', '0'),
  (130, 'Orange Q4-QN', '092/01', '2009', 58, '0', '0', '0', '0', '0'),
  (131, 'Orange Q4-QN', '092/02', '2009', 58, '0', '0', '0', '0', '0'),
  (132, 'Orange Q4-QN', '092/03', '2009', 58, '0', '0', '0', '0', '0'),
  (133, 'Blackberry-QL', '100', '2009', 58, '0', '0', '0', '0', '0'),
  (134, 'Project  Confetti  - J 9264-QN', '051', '2009', 60, '0', '0', '0', '0', '0'),
  (135, 'New saving product-QL', '057', '2009', 65, '0', '0', '0', '0', '0'),
  (136, 'Omnibus CRIZA-QN', '006', '2009', 66, '0', '0', '0', '0', '0'),
  (137, 'Mystery Shopping of pharmacies-QN', '013', '2009', 66, '0', '0', '0', '0', '0'),
  (138, 'Pediatricians-QN', '014', '2009', 66, '0', '0', '0', '0', '0'),
  (139, 'Medici Pediatrii + Farmacii - val 1-QN', '060', '2009', 66, '0', '0', '0', '0', '0'),
  (140, 'Omnibus Reckitt Iulie 2009-QN', '062/01', '2009', 66, '0', '0', '0', '0', '0'),
  (141, 'Omnibus Reckitt Iulie 2009-QN', '062/02', '2009', 66, '0', '0', '0', '0', '0'),
  (142, 'Masini de spalat-QL', '076', '2009', 66, '0', '0', '0', '0', '0'),
  (143, 'Mystery shopping Farmacii + Medici Val 2 - Oct 2009-QN', '086', '2009', 66, '0', '0', '0', '0', '0'),
  (144, 'Omnibus oct.2009-QN', '095/01', '2009', 66, '0', '0', '0', '0', '0'),
  (145, 'Omnibus oct.2009-QN', '095/02', '2009', 66, '0', '0', '0', '0', '0'),
  (146, 'Psychiatrist research-QN', '102', '2009', 66, '0', '0', '0', '0', '0'),
  (147, 'Social Nodes-QL', '107/01', '2009', 68, '0', '0', '0', '0', '0'),
  (148, 'Social Nodes-QN', '107/02', '2009', 68, '0', '0', '0', '0', '0'),
  (149, 'Elmiplant TVC Communication Assessment-QL', '074', '2009', 71, '0', '0', '0', '0', '0'),
  (150, 'Assessing consumer needs and deriving the key drivers of store choice-QL', '055', '2009', 73, '0', '0', '0', '0', '0'),
  (151, 'Testare reclama 4 orase - Buc, Cluj, Iasi, Cra-QN', '001', '2009', 80, '0', '0', '0', '0', '0'),
  (152, 'Research Program on Milk Market-QL', '026/01', '2009', 80, '0', '0', '0', '0', '0'),
  (153, 'Research Program on Milk Market-QN', '026/02', '2009', 80, '0', '0', '0', '0', '0'),
  (154, 'Understanding The Home-Made Milk Consumer-QL', '084', '2009', 80, '0', '0', '0', '0', '0'),
  (155, 'Omnibus sept. 2009-QN', '091', '2009', 80, '0', '0', '0', '0', '0'),
  (156, 'Ad Post Evaluation + Ad on Pack-QL', '101/01', '2009', 80, '0', '0', '0', '0', '0'),
  (157, 'Ad Post Evaluation + Ad on Pack-QN', '101/02', '2009', 80, '0', '0', '0', '0', '0'),
  (158, 'Omnibus Nov 2009-QN', '106', '2009', 80, '0', '0', '0', '0', '0'),
  (159, 'Home-Made Milk Awareness Campaign-QL', '118', '2009', 80, '0', '0', '0', '0', '0'),
  (160, 'Cream-QL', '003', '2009', 81, '0', '0', '0', '0', '0'),
  (161, 'Pricing Research - 5 cities-QN', '008', '2009', 81, '0', '0', '0', '0', '0'),
  (162, 'Testare produs 1-QN', '010', '2009', 81, '0', '0', '0', '0', '0'),
  (163, 'Testare produs 2-QN', '011', '2009', 81, '0', '0', '0', '0', '0'),
  (164, 'Locatie Budinca-QN', '038', '2009', 81, '0', '0', '0', '0', '0'),
  (165, 'Omnibus-QN', '044/01', '2009', 81, '0', '0', '0', '0', '0'),
  (166, 'Omnibus-QN', '044/02', '2009', 81, '0', '0', '0', '0', '0'),
  (167, 'Omnibus-QN', '044/03', '2009', 81, '0', '0', '0', '0', '0'),
  (168, 'Project Tnuva Family-QL', '046', '2009', 81, '0', '0', '0', '0', '0'),
  (169, 'sour cherry yogurt-QN', '049', '2009', 81, '0', '0', '0', '0', '0'),
  (170, 'Tnuva – FDP Category Assessment-QL', '064', '2009', 81, '0', '0', '0', '0', '0'),
  (171, 'PT sour cream-QN', '079', '2009', 81, '0', '0', '0', '0', '0'),
  (172, 'Tracking Tnuva-7 waves-QN', '097/01', '2009', 81, '0', '0', '0', '0', '0'),
  (173, 'Tracking Tnuva-7 waves-QN', '097/02', '2009', 81, '0', '0', '0', '0', '0'),
  (174, 'Tracking Tnuva-7 waves-QN', '097/03', '2009', 81, '0', '0', '0', '0', '0'),
  (175, 'Tracking Tnuva-7 waves-QN', '097/04', '2009', 81, '0', '0', '0', '0', '0'),
  (176, 'Tracking Tnuva-7 waves-QN', '097/05', '2009', 81, '0', '0', '0', '0', '0'),
  (177, 'Tracking Tnuva-7 waves-QN', '097/06', '2009', 81, '0', '0', '0', '0', '0'),
  (178, 'Tracking Tnuva-7 waves-QN', '097/07', '2009', 81, '0', '0', '0', '0', '0'),
  (179, 'Testare sana Tnuva-QN', '114', '2009', 81, '0', '0', '0', '0', '0'),
  (180, 'Qual Ad Test-QL', '116', '2009', 81, '0', '0', '0', '0', '0'),
  (181, 'disaster check of communication concept for Dicarbocalm-QL', '018', '2009', 92, '0', '0', '0', '0', '0'),
  (182, '360 Usage and Attitudes Study-QN', '028', '2009', 92, '0', '0', '0', '0', '0'),
  (183, 'Disaster check -  Antinevralgic-QL', '032', '2009', 92, '0', '0', '0', '0', '0'),
  (184, 'QL Dicarbocalm 2-QL', '033', '2009', 92, '0', '0', '0', '0', '0'),
  (185, 'Medicamente - 3 grupuri pe 23 iulie 2009-QL', '061', '2009', 92, '0', '0', '0', '0', '0'),
  (186, 'PainKiller-QN', '068', '2009', 92, '0', '0', '0', '0', '0'),
  (187, 'Hepatitis Research - Medici de familie-QN', '112', '2009', 92, '0', '0', '0', '0', '0'),
  (188, 'Communication Concept Pre-Test for Magne B6-QL', '117', '2009', 92, '0', '0', '0', '0', '0'),
  (189, 'Omnibus Iulie 2010-QN', '078', '2010', 1, '0', '0', '0', '0', '0'),
  (190, 'Residential Concept Assessment-QL', '007/01', '2010', 12, '0', '0', '0', '0', '0'),
  (191, 'Proiect-Delaco-QL', '016', '2010', 19, '0', '0', '0', '0', '0'),
  (192, 'Omnibus Sept.10-Esente-QN', '097', '2010', 21, '0', '0', '0', '0', '0'),
  (193, 'Usage and attitudes on essence market-QL', '130', '2010', 21, '0', '0', '0', '0', '0'),
  (194, 'U&A+ Segment.-QN', '131', '2010', 21, '0', '0', '0', '0', '0'),
  (195, 'Concept assessment-QL', '094', '2010', 23, '0', '0', '0', '0', '0'),
  (196, 'Pricing study Coldrex-QN', '019', '2010', 29, '0', '0', '0', '0', '0'),
  (197, 'Rhinitis treatment and medication&Pricing research on Avamys-QN', '020', '2010', 29, '0', '0', '0', '0', '0'),
  (198, 'Label Design-QN', '006', '2010', 32, '0', '0', '0', '0', '0'),
  (199, 'Banderas-QL-QL', '014', '2010', 32, '0', '0', '0', '0', '0'),
  (200, 'Banderas-QN-QN', '015', '2010', 32, '0', '0', '0', '0', '0'),
  (201, 'Golden Brau Product Test 101 cows-QN', '027', '2010', 32, '0', '0', '0', '0', '0'),
  (202, 'Kristal Club Consumer Experience-QN', '035', '2010', 32, '0', '0', '0', '0', '0'),
  (203, 'Non-Alcoholic Beer Research Stage 2 -Testing The Concept-QL', '041', '2010', 32, '0', '0', '0', '0', '0'),
  (204, 'Omnibus Aprilie 2010-QN', '047', '2010', 32, '0', '0', '0', '0', '0'),
  (205, 'Beer\"Crafting\"-Innovation Research Platform-Faza 1-QL', '048', '2010', 32, '0', '0', '0', '0', '0'),
  (206, 'Consumer Segmentation&Mapping-QN', '050', '2010', 32, '0', '0', '0', '0', '0'),
  (207, 'GB Non-Alcoholic Blind Product Test-QN-QN', '051', '2010', 32, '0', '0', '0', '0', '0'),
  (208, 'Better beer moments (Innovation ) QN-QN', '052', '2010', 32, '0', '0', '0', '0', '0'),
  (209, 'Concept Generation(FGs&Workshop)-QL', '053', '2010', 32, '0', '0', '0', '0', '0'),
  (210, 'Concept Optimisation-QN-QN', '054', '2010', 32, '0', '0', '0', '0', '0'),
  (211, 'Golden Brau Non-Alcoholic-Label Test-QN', '073', '2010', 32, '0', '0', '0', '0', '0'),
  (212, 'Star World Tour- Post Evaluation-QN', '082', '2010', 32, '0', '0', '0', '0', '0'),
  (213, 'NAB Stage 3 Research-Assess Communication Routes-QL', '087', '2010', 32, '0', '0', '0', '0', '0'),
  (214, 'Mainstream&Premium product test-QN', '091', '2010', 32, '0', '0', '0', '0', '0'),
  (215, 'Desperados-QN', '102', '2010', 32, '0', '0', '0', '0', '0'),
  (216, 'Golden Brau PT-QN', '114', '2010', 32, '0', '0', '0', '0', '0'),
  (217, 'AlcoHelp-QN', '129', '2010', 32, '0', '0', '0', '0', '0'),
  (218, 'Neumarkt Communication Campaign Evaluation-QN', '154', '2010', 32, '0', '0', '0', '0', '0'),
  (219, 'Golden Brau 0.0 \nProduct&Concept Test - Proposal - Varianta 2-QN', '156', '2010', 32, '0', '0', '0', '0', '0'),
  (220, 'Customer Satisfaction  Survey-QN', '160', '2010', 32, '0', '0', '0', '0', '0'),
  (221, 'Blind Product test for Regional Brands-QN', '161', '2010', 32, '0', '0', '0', '0', '0'),
  (222, 'Professional Programs Efficiency in Hospitals-QN', '122', '2010', 38, '0', '0', '0', '0', '0'),
  (223, 'Orange Q1 -2010-QN', '001/01', '2010', 42, '0', '0', '0', '0', '0'),
  (224, 'Orange Q1 -2010-QN', '001/02', '2010', 42, '0', '0', '0', '0', '0'),
  (225, 'Orange Q1 -2010-QN', '001/03', '2010', 42, '0', '0', '0', '0', '0'),
  (226, 'Orange Q2-2010-QN', '037/01', '2010', 42, '0', '0', '0', '0', '0'),
  (227, 'Orange Q2-2010-QN', '037/02', '2010', 42, '0', '0', '0', '0', '0'),
  (228, 'Orange Q2-2010-QN', '037/03', '2010', 42, '0', '0', '0', '0', '0'),
  (229, 'Olynth Research-QL', '081', '2010', 43, '0', '0', '0', '0', '0'),
  (230, 'Biscuits TVC\'s Assessment-QL', '009', '2010', 44, '0', '0', '0', '0', '0'),
  (231, 'Omnibus Februarie 2010-QN', '012', '2010', 44, '0', '0', '0', '0', '0'),
  (232, 'Plasare black-coffee-QN', '023', '2010', 44, '0', '0', '0', '0', '0'),
  (233, 'Amaroy-QL', '043', '2010', 44, '0', '0', '0', '0', '0'),
  (234, 'Omnibus Aprilie 2010-QN', '046', '2010', 44, '0', '0', '0', '0', '0'),
  (235, 'Poiana Dulce Performance Assessment-QL', '049', '2010', 44, '0', '0', '0', '0', '0'),
  (236, 'CLT Chokotoff-QN', '063', '2010', 44, '0', '0', '0', '0', '0'),
  (237, 'CLT 3 in 1-QN', '064', '2010', 44, '0', '0', '0', '0', '0'),
  (238, 'Product Test on R&G Coffee-QN', '084', '2010', 44, '0', '0', '0', '0', '0'),
  (239, 'Barni Brand Performance-QL', '092', '2010', 44, '0', '0', '0', '0', '0'),
  (240, 'Pralines Product Test-QN', '096', '2010', 44, '0', '0', '0', '0', '0'),
  (241, 'Coffee Preparation Assessment-QL', '151', '2010', 44, '0', '0', '0', '0', '0'),
  (242, 'Milka Product Test-QN', '153', '2010', 44, '0', '0', '0', '0', '0'),
  (243, 'Orange Q3-2010-QN', '075/01', '2010', 49, '0', '0', '0', '0', '0'),
  (244, 'Orange Q3-2010-QN', '075/02', '2010', 49, '0', '0', '0', '0', '0'),
  (245, 'Orange Q3-2010-QN', '075/03', '2010', 49, '0', '0', '0', '0', '0'),
  (246, 'Orange Q4-2010-QN', '124', '2010', 49, '0', '0', '0', '0', '0'),
  (247, 'Orange Q4-2010-QN', '125', '2010', 49, '0', '0', '0', '0', '0'),
  (248, 'Orange Q4-2010-QN', '126', '2010', 49, '0', '0', '0', '0', '0'),
  (249, 'Vending Machines-Coffee-QN', '010', '2010', 52, '0', '0', '0', '0', '0'),
  (250, 'Maggi Idea Zilei-QN', '011', '2010', 52, '0', '0', '0', '0', '0'),
  (251, 'Nescafe 3 in 1 Recipes Test-QL', '024', '2010', 52, '0', '0', '0', '0', '0'),
  (252, 'Joe Caramel and Joe Joyz Communication Pretest-QL', '028', '2010', 52, '0', '0', '0', '0', '0'),
  (253, '\"Sarmale de post\"-QL', '032', '2010', 52, '0', '0', '0', '0', '0'),
  (254, 'Segmentare batoane-QN', '033', '2010', 52, '0', '0', '0', '0', '0'),
  (255, 'Nesquik 3 in 1 Concept Test-QL', '039', '2010', 52, '0', '0', '0', '0', '0'),
  (256, 'Nescafe 3 in 1 QN-QN', '040', '2010', 52, '0', '0', '0', '0', '0'),
  (257, 'Commando- Brasero-QL', '042', '2010', 52, '0', '0', '0', '0', '0'),
  (258, 'Maggi Health and Wellness-QL', '044', '2010', 52, '0', '0', '0', '0', '0'),
  (259, 'Joe Bars Pretest-QL', '045', '2010', 52, '0', '0', '0', '0', '0'),
  (260, 'Nescafe Brasero-QN', '055', '2010', 52, '0', '0', '0', '0', '0'),
  (261, 'Maggi Bouillons-QL', '057', '2010', 52, '0', '0', '0', '0', '0'),
  (262, 'Joe Promo Pretest-QL', '058', '2010', 52, '0', '0', '0', '0', '0'),
  (263, 'U&A on cereals category-QL', '060', '2010', 52, '0', '0', '0', '0', '0'),
  (264, 'Concept Test QL Assessment(Maggi Bors)-QL', '062', '2010', 52, '0', '0', '0', '0', '0'),
  (265, 'Nesquik Concept Test-QL', '066', '2010', 52, '0', '0', '0', '0', '0'),
  (266, 'Joe Concept Test-QL', '067', '2010', 52, '0', '0', '0', '0', '0'),
  (267, 'Marinated Bag-QL', '072', '2010', 52, '0', '0', '0', '0', '0'),
  (268, 'Communication Test for Maggi SG Hen-QL', '090', '2010', 52, '0', '0', '0', '0', '0'),
  (269, 'Nescafe 3 in 1-QN', '095', '2010', 52, '0', '0', '0', '0', '0'),
  (270, 'Consumer Profile Exploration - Maggi - sept 2010-QL', '100', '2010', 52, '0', '0', '0', '0', '0'),
  (271, 'Nestle PT 6040 Napolitane copii Nov10-QN', '117', '2010', 52, '0', '0', '0', '0', '0'),
  (272, 'Nestle PT 6040 3 in 1 Original Nov.10-QN', '119', '2010', 52, '0', '0', '0', '0', '0'),
  (273, 'Nestle PT 6040 3in1 Strong Nov.10-QN', '133', '2010', 52, '0', '0', '0', '0', '0'),
  (274, 'Nestle PT 6040 Cappuccino Clasic Nov.10-QN', '137', '2010', 52, '0', '0', '0', '0', '0'),
  (275, 'Nestle In-Home test instant coffee Nov.10-QN', '146', '2010', 52, '0', '0', '0', '0', '0'),
  (276, 'Nestle guidance test instant coffee Nov.10-QN', '147', '2010', 52, '0', '0', '0', '0', '0'),
  (277, 'Nescafe Communication-QL', '148', '2010', 52, '0', '0', '0', '0', '0'),
  (278, 'Nestle Frappe Test Dec 2010-QN', '155', '2010', 52, '0', '0', '0', '0', '0'),
  (279, 'Instant Soups-QL', '157', '2010', 52, '0', '0', '0', '0', '0'),
  (280, 'Consumer Profile- In depth analysis-QL', '162', '2010', 52, '0', '0', '0', '0', '0'),
  (281, 'Handsets Keyboard Performance-QL', '123', '2010', 54, '0', '0', '0', '0', '0'),
  (282, 'Awareness of cervical cancer-QN', '022', '2010', 57, '0', '0', '0', '0', '0'),
  (283, 'Determine ways for increasing FCR-QL', '005', '2010', 58, '0', '0', '0', '0', '0'),
  (284, 'FBB & TV research study-QL', '017/01', '2010', 58, '0', '0', '0', '0', '0'),
  (285, 'FBB & TV research study-QN', '017/02', '2010', 58, '0', '0', '0', '0', '0'),
  (286, 'Orange-Complains Solving-QL', '029', '2010', 58, '0', '0', '0', '0', '0'),
  (287, 'Pilot- Churn Potential-QN', '128', '2010', 58, '0', '0', '0', '0', '0'),
  (288, 'Orange Platforme Development-QL', '142', '2010', 58, '0', '0', '0', '0', '0'),
  (289, '3 judete-QN', '149', '2010', 58, '0', '0', '0', '0', '0'),
  (290, 'Fixed Services Potential study-QN', '158', '2010', 58, '0', '0', '0', '0', '0'),
  (291, 'Project Posh - Proposal-QN', '136', '2010', 60, '0', '0', '0', '0', '0'),
  (292, 'Mountain Dew Product Test-QN', '093', '2010', 64, '0', '0', '0', '0', '0'),
  (293, 'Pricing Sensitivity on Juices Market-QN', '150', '2010', 64, '0', '0', '0', '0', '0'),
  (294, 'Oferta cercetare calitativa. Testare nou produs: scheme de economisire.Varianta 2-QL', '127', '2010', 65, '0', '0', '0', '0', '0'),
  (295, 'Mystery shopping Farmacii+Medici-val 3-QN', '002', '2010', 66, '0', '0', '0', '0', '0'),
  (296, 'In-home-QN', '021', '2010', 66, '0', '0', '0', '0', '0'),
  (297, 'Mystery shopping Farmacii+medici-val 4-QN', '030', '2010', 66, '0', '0', '0', '0', '0'),
  (298, 'Pharma Segment-QN', '069/01', '2010', 66, '0', '0', '0', '0', '0'),
  (299, 'Pharma Segment-QN', '069/02', '2010', 66, '0', '0', '0', '0', '0'),
  (300, 'Pharma Segment-QN', '069/03', '2010', 66, '0', '0', '0', '0', '0'),
  (301, 'Pharma Segment-QN', '069/04', '2010', 66, '0', '0', '0', '0', '0'),
  (302, 'Exit study Reckitt-QN', '070', '2010', 66, '0', '0', '0', '0', '0'),
  (303, 'Omnibus-Carpet Cleaners-QN', '098', '2010', 66, '0', '0', '0', '0', '0'),
  (304, 'Research proposal on Strepsils-QN', '134', '2010', 66, '0', '0', '0', '0', '0'),
  (305, 'Research proposal on Strepsils QL-QL', '135', '2010', 66, '0', '0', '0', '0', '0'),
  (306, 'Air care Products-QL', '143', '2010', 66, '0', '0', '0', '0', '0'),
  (307, 'Air care products-exit-QN', '144', '2010', 66, '0', '0', '0', '0', '0'),
  (308, 'Romtelecom Bill Evaluation-QL', '065', '2010', 68, '0', '0', '0', '0', '0'),
  (309, 'Pre si post evaluare a notorietatii marcii si reclamei-val 1-QN', '085', '2010', 68, '0', '0', '0', '0', '0'),
  (310, 'Val.2- pre si post evaluare a marcii si reclamei-QN', '086', '2010', 68, '0', '0', '0', '0', '0'),
  (311, 'Estimarea pietei de telecomunicatii pe sectorul busainess-QN', '101', '2010', 68, '0', '0', '0', '0', '0'),
  (312, 'Essentiale Forte N Communication Testing-QL', '077', '2010', 69, '0', '0', '0', '0', '0'),
  (313, 'Pricing Sensitivity on Salty Snacks Market-QN', '083', '2010', 76, '0', '0', '0', '0', '0'),
  (314, 'Primola-testare de concept-QN', '079', '2010', 78, '0', '0', '0', '0', '0'),
  (315, 'Segmentare-Tablete de ciocolata-QN', '099', '2010', 78, '0', '0', '0', '0', '0'),
  (316, 'National study on packages-QN', '068', '2010', 80, '0', '0', '0', '0', '0'),
  (317, 'Post-campaign Evaluation-QN', '152', '2010', 80, '0', '0', '0', '0', '0'),
  (318, 'U&A Milk cantitativ-QN', '163', '2010', 80, '0', '0', '0', '0', '0'),
  (319, 'U&A Sucuri calitativ-QL', '164', '2010', 80, '0', '0', '0', '0', '0'),
  (320, 'U&A Sucuri cantitativ-QN', '165', '2010', 80, '0', '0', '0', '0', '0'),
  (321, 'Proposal PT 2010-iaurt fructe-QN', '003', '2010', 81, '0', '0', '0', '0', '0'),
  (322, 'Testare produs(plasare)-QN', '004', '2010', 81, '0', '0', '0', '0', '0'),
  (323, 'Product Test sana-QN', '008', '2010', 81, '0', '0', '0', '0', '0'),
  (324, 'Product Test \"cottage cheese\"-QN', '013', '2010', 81, '0', '0', '0', '0', '0'),
  (325, 'Tnuva-testare de concept-QL', '074', '2010', 81, '0', '0', '0', '0', '0'),
  (326, 'Testare de produs Tnuva-QN', '080', '2010', 81, '0', '0', '0', '0', '0'),
  (327, 'Product Concept Pre-test-QL', '132', '2010', 81, '0', '0', '0', '0', '0'),
  (328, 'PT Yoplait Exotic-QN', '138', '2010', 81, '0', '0', '0', '0', '0'),
  (329, 'PT on Yoplait Big-QN', '139', '2010', 81, '0', '0', '0', '0', '0'),
  (330, 'Diary Products-QL', '145', '2010', 81, '0', '0', '0', '0', '0'),
  (331, 'Exploring Class C&B Automotive Market-QL', '159', '2010', 82, '0', '0', '0', '0', '0'),
  (332, 'Proposal on Ursus PTSession Test-QN', '118', '2010', 86, '0', '0', '0', '0', '0'),
  (333, 'Research Proposal on Loyalty Program Consumer Research-QL', '025', '2010', 88, '0', '0', '0', '0', '0'),
  (334, 'Loyalty Program Consumer Research-QN', '026', '2010', 88, '0', '0', '0', '0', '0'),
  (335, 'Communication Platforms Assessment for Prepaid-QL', '031', '2010', 88, '0', '0', '0', '0', '0'),
  (336, 'Research Program on \"Youth Communities\"-QL', '076', '2010', 88, '0', '0', '0', '0', '0'),
  (337, 'Offer Exposure and impact within Commercials-QL', '089', '2010', 88, '0', '0', '0', '0', '0'),
  (338, 'Customer Experience-QL-QL', '115', '2010', 88, '0', '0', '0', '0', '0'),
  (339, 'Customer Experience -QN-QN', '116', '2010', 88, '0', '0', '0', '0', '0'),
  (340, 'Omnibus Februarie 2010-QN', '018', '2010', 92, '0', '0', '0', '0', '0'),
  (341, 'Gerovital Brand Performance-QL', '034', '2010', 92, '0', '0', '0', '0', '0'),
  (342, 'Studiu de pret analgezice-QN', '036', '2010', 92, '0', '0', '0', '0', '0'),
  (343, 'Modafen-QL', '038', '2010', 92, '0', '0', '0', '0', '0'),
  (344, 'U&A Zentiva 2010-QN', '056', '2010', 92, '0', '0', '0', '0', '0'),
  (345, 'Key Success Drivers in OTC-QL', '059/01', '2010', 92, '0', '0', '0', '0', '0'),
  (346, 'Key Success Drivers in OTC-QN', '059/02', '2010', 92, '0', '0', '0', '0', '0'),
  (347, 'QL- Name Assessment (Algocalmin)-QL', '061', '2010', 92, '0', '0', '0', '0', '0'),
  (348, 'General Milkshake Assessment-QN', '071', '2010', 92, '0', '0', '0', '0', '0'),
  (349, 'Milkshake post-evaluation-QN', '088', '2010', 92, '0', '0', '0', '0', '0'),
  (350, '360 usage & attitudes study NO SPA-QN', '120', '2010', 92, '0', '0', '0', '0', '0'),
  (351, 'No-Spa U&A Study-QL', '121', '2010', 92, '0', '0', '0', '0', '0'),
  (352, 'Impact of changing Algocalmin from OTC to RX – Pharmacists & Consumers-QL', '140', '2010', 92, '0', '0', '0', '0', '0'),
  (353, 'Impact of changing Algocalmin from OTC to RX – Pharmacists & Consumers-QN', '141', '2010', 92, '0', '0', '0', '0', '0'),
  (354, 'Proiect intern\"Emotional Branding\"-QN', '115', '2011', 1, '0', '0', '0', '0', '0'),
  (355, 'Proiect anulat-QN', '192', '2011', 1, '0', '0', '0', '0', '0'),
  (356, 'Concept Test on Bill Insurance-Orange-QL', '134', '2011', 4, '0', '0', '0', '0', '0'),
  (357, 'Abilify perception test and message recall-QN', '099', '2011', 9, '0', '0', '0', '0', '0'),
  (358, 'Bet 364-QL', '100', '2011', 14, '0', '0', '0', '0', '0'),
  (359, 'PT-Burgo de Arias-QN', '193', '2011', 19, '0', '0', '0', '0', '0'),
  (360, 'Segmentation-QN', '200', '2011', 20, '0', '0', '0', '0', '0'),
  (361, 'Cake Mixes Market-QL', '093', '2011', 21, '0', '0', '0', '0', '0'),
  (362, 'Cake Mixes Market-QN-QN', '094', '2011', 21, '0', '0', '0', '0', '0'),
  (363, 'Evaluare promotie-QN', '114', '2011', 21, '0', '0', '0', '0', '0'),
  (364, 'Product Test Negresa-QL', '129', '2011', 21, '0', '0', '0', '0', '0'),
  (365, 'Ad Test VO Change-QN', '150', '2011', 21, '0', '0', '0', '0', '0'),
  (366, 'Omnibus Nov.11-QN', '166', '2011', 21, '0', '0', '0', '0', '0'),
  (367, 'Ciocolata calda-QL', '196', '2011', 21, '0', '0', '0', '0', '0'),
  (368, 'Concept assessment-QL', '036', '2011', 23, '0', '0', '0', '0', '0'),
  (369, 'Prolia-QN', '109', '2011', 29, '0', '0', '0', '0', '0'),
  (370, 'Arcoxia si Augumentin-QL', '158', '2011', 29, '0', '0', '0', '0', '0'),
  (371, 'Brand Tracking Ianuarie 2011-QN', '006', '2011', 32, '0', '0', '0', '0', '0'),
  (372, 'Brand tracking Februarie 2011-QN', '007', '2011', 32, '0', '0', '0', '0', '0'),
  (373, 'Brand Tracking Martie 2011-QN', '008', '2011', 32, '0', '0', '0', '0', '0'),
  (374, 'Brand Tracking Aprilie 2011-QN', '009', '2011', 32, '0', '0', '0', '0', '0'),
  (375, 'Brand Tracking Mai 2011-QN', '010', '2011', 32, '0', '0', '0', '0', '0'),
  (376, 'Brand Tracking Iunie 2011-QN', '011', '2011', 32, '0', '0', '0', '0', '0'),
  (377, 'Brand tracking QL-QL', '012', '2011', 32, '0', '0', '0', '0', '0'),
  (378, 'Brand Tracking Iulie 2011-QN', '013', '2011', 32, '0', '0', '0', '0', '0'),
  (379, 'Brand Tracking August 2011-QN', '014', '2011', 32, '0', '0', '0', '0', '0'),
  (380, 'Brand Tracking Sept.2011-QN', '015', '2011', 32, '0', '0', '0', '0', '0'),
  (381, 'Brand Tracking Oct.2011-QN', '016', '2011', 32, '0', '0', '0', '0', '0'),
  (382, 'Brand Tracking Noiembrie.2011-QN', '017', '2011', 32, '0', '0', '0', '0', '0'),
  (383, 'Brand Tracking Dec.2011-QN', '018', '2011', 32, '0', '0', '0', '0', '0'),
  (384, 'Ad Test-QN', '031', '2011', 32, '0', '0', '0', '0', '0'),
  (385, 'UCL 2011-QN', '033', '2011', 32, '0', '0', '0', '0', '0'),
  (386, 'Climat Organizational-QN', '043', '2011', 32, '0', '0', '0', '0', '0'),
  (387, 'Golden Brau PET-QN', '054', '2011', 32, '0', '0', '0', '0', '0'),
  (388, 'Flavored Beer Product Test-QN', '056', '2011', 32, '0', '0', '0', '0', '0'),
  (389, 'Flavored Beer Concept&Product Test-QN', '057', '2011', 32, '0', '0', '0', '0', '0'),
  (390, '110 Vaci- Golden Brau PT-QN', '058', '2011', 32, '27', '0', '14', '0', '0'),
  (391, 'NAB Disaster Check-QL', '068', '2011', 32, '0', '0', '0', '0', '0'),
  (392, 'Craftsmanship Golden Brau-QN', '069', '2011', 32, '0', '0', '0', '0', '0'),
  (393, 'Blind Product Test Bucegi-QN', '081', '2011', 32, '0', '0', '0', '0', '0'),
  (394, 'Bordello\'s-QL', '082', '2011', 32, '0', '0', '0', '0', '0'),
  (395, 'Craftsmanship GB-QN', '118', '2011', 32, '0', '0', '0', '0', '0'),
  (396, 'Omnibus August-QN', '125', '2011', 32, '0', '0', '0', '0', '0'),
  (397, 'Silva SKU Range design-QN', '135', '2011', 32, '0', '0', '0', '0', '0'),
  (398, 'Premium Blind Product Test 2011 - 105 cows-QN', '142', '2011', 32, '0', '0', '0', '0', '0'),
  (399, 'Beer Pricing Research-QN', '146', '2011', 32, '0', '0', '0', '0', '0'),
  (400, 'Beer Caps assessment QL-QL', '154', '2011', 32, '0', '0', '0', '0', '0'),
  (401, 'Caps scenarios-QN', '155', '2011', 32, '0', '0', '0', '0', '0'),
  (402, 'Dark beer exploration-QL', '162', '2011', 32, '0', '0', '0', '0', '0'),
  (403, 'Omnibus Nov.2011-QN', '163', '2011', 32, '0', '0', '0', '0', '0'),
  (404, 'Dark beer-blind product test-QN', '169', '2011', 32, '0', '0', '0', '0', '0'),
  (405, 'Neumarkt Communication Campaign-QN', '176', '2011', 32, '0', '0', '0', '0', '0'),
  (406, 'Ciuc Concept Test-QN', '177', '2011', 32, '0', '0', '0', '0', '0'),
  (407, 'Desperados-investigation-QN', '178', '2011', 32, '0', '0', '0', '0', '0'),
  (408, 'CATI- Lemonade-QN', '191', '2011', 32, '0', '0', '0', '0', '0'),
  (409, '99 cows reloaded-QN', '199', '2011', 32, '0', '0', '0', '0', '0'),
  (410, 'Johnson\'Baby Cream Strategy-QL', '048', '2011', 38, '0', '0', '0', '0', '0'),
  (411, 'Listerine Dental Research-QN', '183', '2011', 38, '0', '0', '0', '0', '0'),
  (412, 'Winston Pricing Study-QN', '192', '2011', 39, '0', '0', '0', '0', '0'),
  (413, 'New employee study-QL-QL', '201', '2011', 39, '0', '0', '0', '0', '0'),
  (414, 'New employee study QN-QN', '202', '2011', 39, '0', '0', '0', '0', '0'),
  (415, 'Olynth- April 11-QL', '076', '2011', 43, '0', '0', '0', '0', '0'),
  (416, 'Poiana S&S-QN', '001', '2011', 44, '0', '0', '0', '0', '0'),
  (417, 'Positioning study on Halls-QL', '022', '2011', 44, '0', '0', '0', '0', '0'),
  (418, 'Product Test on R&G Coffee- RGT-QN', '024', '2011', 44, '0', '0', '0', '0', '0'),
  (419, 'Product Test on R&G Coffee-PCQM-QN', '025', '2011', 44, '0', '0', '0', '0', '0'),
  (420, 'Concept Test salty chocolate-QL', '049', '2011', 44, '0', '0', '0', '0', '0'),
  (421, 'In-home Kraft-QL', '073', '2011', 44, '0', '0', '0', '0', '0'),
  (422, 'Milka Shots Concept Test-QL', '074', '2011', 44, '0', '0', '0', '0', '0'),
  (423, 'Poiana Product Test-QN', '084', '2011', 44, '0', '0', '0', '0', '0'),
  (424, 'Jacobs Kronung-QN', '092', '2011', 44, '0', '0', '0', '0', '0'),
  (425, 'Pack test JK-QN', '110', '2011', 44, '0', '0', '0', '0', '0'),
  (426, 'Jacobs-QL', '120', '2011', 44, '0', '0', '0', '0', '0'),
  (427, 'Shopper-Kraft-QN', '153', '2011', 44, '0', '0', '0', '0', '0'),
  (428, 'PT on R&G coffe-PCQM-QN', '157', '2011', 44, '0', '0', '0', '0', '0'),
  (429, 'CLT 3 IN 1-QN', '160', '2011', 44, '0', '0', '0', '0', '0'),
  (430, '3 in 1 Concept Evaluation-QL', '179', '2011', 44, '0', '0', '0', '0', '0'),
  (431, 'Biscuiti-QN', '198', '2011', 44, '0', '0', '0', '0', '0'),
  (432, 'MASMI Poland 1st.wave-QN', '052', '2011', 46, '0', '0', '0', '0', '0'),
  (433, 'MASMI -2-QN', '053', '2011', 46, '0', '0', '0', '0', '0'),
  (434, 'Fervex-QL', '061', '2011', 47, '0', '0', '0', '0', '0'),
  (435, 'Omnibus Aprilie 2011-QN', '066', '2011', 47, '0', '0', '0', '0', '0'),
  (436, 'Fervex package-QL', '117', '2011', 47, '0', '0', '0', '0', '0'),
  (437, '40129288- Orange 2011-Romania Q1- PO N-TBC:- Lara Clarkson-QN', '002', '2011', 49, '0', '0', '0', '0', '0'),
  (438, '40129288- Orange 2011-Romania Q1- PO N-TBC:- Lara Clarkson-QN', '003', '2011', 49, '0', '0', '0', '0', '0'),
  (439, '40129288- Orange 2011-Romania Q1- PO N-TBC:- Lara Clarkson-QN', '004', '2011', 49, '0', '0', '0', '0', '0'),
  (440, '40129288-Orange 2011-Romania Q2-PO N-40118675-Lara Clarkson-QN', '062', '2011', 49, '0', '0', '0', '0', '0'),
  (441, '40129288-Orange 2011-Romania Q2-PO N-40118675-Lara Clarkson-QN', '063', '2011', 49, '0', '0', '0', '0', '0'),
  (442, '40129288-Orange 2011-Romania Q2-PO N-40118675-Lara Clakson-QN', '064', '2011', 49, '0', '0', '0', '0', '0'),
  (443, '40129288- Orange 2011- Romania Q3- PO No.40118675- Lara Clarkson-QN', '104', '2011', 49, '0', '0', '0', '0', '0'),
  (444, '40129288- Orange 2011- Romania Q3- PO No.40118675- Lara Clarkson-QN', '105', '2011', 49, '0', '0', '0', '0', '0'),
  (445, '40129288- Orange 2011- Romania Q3- PO No.40118675- Lara Clarkson-QN', '106', '2011', 49, '0', '0', '0', '0', '0'),
  (446, '40129288-Orange 2011-Romania Q4-PO no:40118675-Lara Clarkson-QN', '138', '2011', 49, '0', '0', '0', '0', '0'),
  (447, '40129288-Orange 2011-Romania Q4-PO no:40118675-Lara Clarkson-QN', '139', '2011', 49, '0', '0', '0', '0', '0'),
  (448, '40129288-Orange 2011-Romania Q4-PO no:40118675-Lara Clarkson-QN', '140', '2011', 49, '0', '0', '0', '0', '0'),
  (449, 'Omnibus Noiembrie 2011-QN', '164', '2011', 51, '0', '0', '0', '0', '0'),
  (450, 'Dermato QL-QL', '174', '2011', 51, '0', '0', '0', '0', '0'),
  (451, 'Crispy Product Concept Assessment-QL', '023', '2011', 52, '0', '0', '0', '0', '0'),
  (452, 'Bouillons Concept Assessment-QL', '026', '2011', 52, '0', '0', '0', '0', '0'),
  (453, 'IHV Cooking H&P-QL', '032', '2011', 52, '0', '0', '0', '0', '0'),
  (454, 'Joe Concept Communication Pretest-QL', '035', '2011', 52, '0', '0', '0', '0', '0'),
  (455, 'Alphabet Soup-QN', '037', '2011', 52, '0', '0', '0', '0', '0'),
  (456, 'Consumer Landscape-QL', '044', '2011', 52, '0', '0', '0', '0', '0'),
  (457, 'Consumer Landscape-QN-QN', '045', '2011', 52, '0', '0', '0', '0', '0'),
  (458, 'Noodles Category Exploration-QL', '050', '2011', 52, '0', '0', '0', '0', '0'),
  (459, 'PT Brasero-QN', '065', '2011', 52, '0', '0', '0', '0', '0'),
  (460, 'Extrudate products-QL', '067', '2011', 52, '0', '0', '0', '0', '0'),
  (461, 'Maggi Alphabet Soup-2-QN', '072', '2011', 52, '0', '0', '0', '0', '0'),
  (462, '60/40 Brasero Strong-QN', '075', '2011', 52, '0', '0', '0', '0', '0'),
  (463, 'Maggi SG Concept Assessment-QL', '087', '2011', 52, '0', '0', '0', '0', '0'),
  (464, 'PT Brasero Guidance-QN', '088', '2011', 52, '0', '0', '0', '0', '0'),
  (465, 'PT Mild Guidance-QN', '089', '2011', 52, '0', '0', '0', '0', '0'),
  (466, '60_40 BraseroElite-QN', '090', '2011', 52, '0', '0', '0', '0', '0'),
  (467, '60_40 Strong Elite-QN', '091', '2011', 52, '0', '0', '0', '0', '0'),
  (468, 'Noodles-val 2-QL', '096', '2011', 52, '0', '0', '0', '0', '0'),
  (469, 'Coffee machine CPT-QN', '107', '2011', 52, '0', '0', '0', '0', '0'),
  (470, 'Joe Communication Pretest-QL', '123', '2011', 52, '0', '0', '0', '0', '0'),
  (471, 'Maggi Bors-QL', '130', '2011', 52, '0', '0', '0', '0', '0'),
  (472, '60/40 on Best ice cream-QN', '132', '2011', 52, '0', '0', '0', '0', '0'),
  (473, '60/40 Maggi Noodles 2-QN', '143', '2011', 52, '0', '0', '0', '0', '0'),
  (474, 'Nescafe 3in1 Strong-QN', '147', '2011', 52, '0', '0', '0', '0', '0'),
  (475, 'Seasonings Maggi-QL', '156', '2011', 52, '0', '0', '0', '0', '0'),
  (476, 'Nescafe Frappe-QN', '190', '2011', 52, '0', '0', '0', '0', '0'),
  (477, 'Theraflu- Launch campaign evaluation-QL', '059', '2011', 55, '0', '0', '0', '0', '0'),
  (478, 'Theraflu- QN-QN', '060', '2011', 55, '0', '0', '0', '0', '0'),
  (479, 'Voltaren QL-QL', '070', '2011', 55, '0', '0', '0', '0', '0'),
  (480, 'Voltaren QN-QN', '071', '2011', 55, '0', '0', '0', '0', '0'),
  (481, 'Omnibus- Vibrocil-QN', '086', '2011', 55, '0', '0', '0', '0', '0'),
  (482, '\"First Snow\"VO-QL', '119', '2011', 55, '0', '0', '0', '0', '0'),
  (483, 'Voltaren Communication Ass-QL-QL', '184', '2011', 55, '0', '0', '0', '0', '0'),
  (484, 'Voltaren Communication-QN-QN', '185', '2011', 55, '0', '0', '0', '0', '0'),
  (485, 'Churn Potential-QN', '051', '2011', 58, '0', '0', '0', '0', '0'),
  (486, 'Market Share B2B 50+-QN', '077', '2011', 58, '0', '0', '0', '0', '0'),
  (487, 'Market Share B2B 1-49-QN', '078', '2011', 58, '0', '0', '0', '0', '0'),
  (488, 'CVA DeepDive B2B-QN', '116', '2011', 58, '0', '0', '0', '0', '0'),
  (489, 'Orange Euro2012 CDR-QL', '136', '2011', 58, '0', '0', '0', '0', '0'),
  (490, 'Fluture Orange-QL', '151', '2011', 58, '0', '0', '0', '0', '0'),
  (491, 'Orange- Pre Pay Market-QN', '159', '2011', 58, '0', '0', '0', '0', '0'),
  (492, 'Orange loyalty-QL', '171', '2011', 58, '0', '0', '0', '0', '0'),
  (493, 'Fix services-Orange-QL', '194', '2011', 58, '0', '0', '0', '0', '0'),
  (494, 'Seasonings-QN', '141', '2011', 60, '0', '0', '0', '0', '0'),
  (495, 'Prigat-QL', '034', '2011', 64, '0', '0', '0', '0', '0'),
  (496, 'Pricing Research on Analgesics Market-QN', '029', '2011', 66, '0', '0', '0', '0', '0'),
  (497, 'Omnibus Iunie 11-QN', '101', '2011', 66, '0', '0', '0', '0', '0'),
  (498, 'Airwick-QN', '133', '2011', 66, '0', '0', '0', '0', '0'),
  (499, 'Farmacisti-QL', '144', '2011', 66, '0', '0', '0', '0', '0'),
  (500, 'Medici-Nurofen-QL', '145', '2011', 66, '0', '0', '0', '0', '0'),
  (501, 'U&A HH care-QN', '167', '2011', 66, '0', '0', '0', '0', '0'),
  (502, 'U&A HH care QL-QL', '168', '2011', 66, '0', '0', '0', '0', '0'),
  (503, 'Evaluarea Proiectului Saas-QL', '148', '2011', 68, '0', '0', '0', '0', '0'),
  (504, 'Pricing Sensitivity on Hepato-protective products-QN', '019', '2011', 69, '0', '0', '0', '0', '0'),
  (505, 'Essential U&A- QN-QN', '020', '2011', 69, '0', '0', '0', '0', '0'),
  (506, 'Essential U&A QL-QL', '021', '2011', 69, '0', '0', '0', '0', '0'),
  (507, 'Food suppliments-Brand and line extentions-QL', '108', '2011', 69, '0', '0', '0', '0', '0'),
  (508, 'Omnibus August-QN', '124', '2011', 69, '0', '0', '0', '0', '0'),
  (509, 'No-Spa Ad Evaluation-QL', '128', '2011', 69, '0', '0', '0', '0', '0'),
  (510, 'Dermato-Cosmetics and Baby Care Markets-QN', '172', '2011', 69, '0', '0', '0', '0', '0'),
  (511, 'Tabacco project-Romania-QL', '097', '2011', 72, '0', '0', '0', '0', '0'),
  (512, 'Tabacco Project QN-QN', '098', '2011', 72, '0', '0', '0', '0', '0'),
  (513, 'Lays-communication platform assessment-QL', '030', '2011', 76, '0', '0', '0', '0', '0'),
  (514, 'Insights Generation Research on Rich Taste Idea-QL', '046', '2011', 77, '0', '0', '0', '0', '0'),
  (515, 'Rich Taste Idea-Strauss-QN', '047', '2011', 77, '0', '0', '0', '0', '0'),
  (516, 'Doncafe Creative Idea Test-QL', '111', '2011', 77, '0', '0', '0', '0', '0'),
  (517, 'Tetrapak School Milk Ad Test-QN', '005', '2011', 80, '0', '0', '0', '0', '0'),
  (518, 'National study on packages-QN', '095', '2011', 80, '0', '0', '0', '0', '0'),
  (519, 'Omnibus Iunie 11-tetrapak-QN', '102', '2011', 80, '0', '0', '0', '0', '0'),
  (520, 'Package Blind Test-QN', '181', '2011', 80, '0', '0', '0', '0', '0'),
  (521, 'Studiu ambalaj- branded-QN', '186', '2011', 80, '0', '0', '0', '0', '0'),
  (522, 'School Milk Ad on Pack Test-QN', '187', '2011', 80, '0', '0', '0', '0', '0'),
  (523, 'Pack evaluation-La Dorna,Zuzu-QN', '188', '2011', 80, '0', '0', '0', '0', '0'),
  (524, 'Post evaluation of Tetrapak Campaign\"Bea lapte\"-QN', '189', '2011', 80, '0', '0', '0', '0', '0'),
  (525, 'Brand Tracking- February 2011-QN', '038', '2011', 81, '0', '0', '0', '0', '0'),
  (526, 'Brand Tracking May 2011-QN', '039', '2011', 81, '0', '0', '0', '0', '0'),
  (527, 'Brand Tracking -Aug.2011-QN', '040', '2011', 81, '0', '0', '0', '0', '0'),
  (528, 'Brand Tracking Nov.2011-QN', '041', '2011', 81, '0', '0', '0', '0', '0'),
  (529, 'Iaurt simplu Februarie-QN', '042', '2011', 81, '0', '0', '0', '0', '0'),
  (530, 'PT cottage cheese-QN', '083', '2011', 81, '0', '0', '0', '0', '0'),
  (531, 'PT on Yoplait Natural Aromas-QN', '103', '2011', 81, '0', '0', '0', '0', '0'),
  (532, 'U&A lactate QL-QL', '112', '2011', 81, '0', '0', '0', '0', '0'),
  (533, 'U&A lactate QN-QN', '113', '2011', 81, '0', '0', '0', '0', '0'),
  (534, 'Package Concept-QL', '161', '2011', 81, '0', '0', '0', '0', '0'),
  (535, 'Shopper Research Program- QN-QN', '027', '2011', 86, '0', '0', '0', '0', '0'),
  (536, 'Shopper Research Ursus-QL-QL', '028', '2011', 86, '0', '0', '0', '0', '0'),
  (537, 'Azuga-QL', '079', '2011', 86, '0', '0', '0', '0', '0'),
  (538, 'Ursus- Ciucas-QL', '197', '2011', 86, '0', '0', '0', '0', '0'),
  (539, 'Easter Campaign Claim Test-QL', '055', '2011', 88, '0', '0', '0', '0', '0'),
  (540, 'Communication Platforms Assessment-QL', '085', '2011', 88, '0', '0', '0', '0', '0'),
  (541, 'Vodafone- abonament postpaid-QL', '149', '2011', 88, '0', '0', '0', '0', '0'),
  (542, 'Product Concept Assessment-QL', '152', '2011', 88, '0', '0', '0', '0', '0'),
  (543, 'Spring 2012 Voice Promo-QL', '175', '2011', 88, '0', '0', '0', '0', '0'),
  (544, 'Vodafone-start-up program QN-QN', '180', '2011', 88, '0', '0', '0', '0', '0'),
  (545, 'Spring voice-phase 2-QL', '182', '2011', 88, '0', '0', '0', '0', '0'),
  (546, 'Perfect Start-up program QL-QL', '195', '2011', 88, '0', '0', '0', '0', '0'),
  (547, 'Product Concept Testing-QL', '131', '2011', 89, '0', '0', '0', '0', '0'),
  (548, 'Antinevralgic Communication Assessment-QL', '080', '2011', 92, '0', '0', '0', '0', '0'),
  (549, 'U&A gastric acidity symptoms-QN', '121', '2011', 92, '0', '0', '0', '0', '0'),
  (550, 'U&A gastric acidity symptoms-QL-QL', '122', '2011', 92, '0', '0', '0', '0', '0'),
  (551, 'Expectorante U&A-QL', '126', '2011', 92, '0', '0', '0', '0', '0'),
  (552, '360 U&A Study-QN', '127', '2011', 92, '0', '0', '0', '0', '0'),
  (553, 'Modafen TVC-QN', '137', '2011', 92, '0', '0', '0', '0', '0'),
  (554, 'Omnibus Nov.11-QN', '165', '2011', 92, '0', '0', '0', '0', '0'),
  (555, 'U&A on condiments category-QL', '170', '2011', 92, '0', '0', '0', '0', '0'),
  (556, 'Internal Project-Romania Culture-QL', '044', '2012', 1, '0', '0', '0', '0', '0'),
  (557, 'Internal Project October-QL', '142', '2012', 1, '0', '0', '0', '0', '0'),
  (558, 'Social Innovation-QN', '151', '2012', 1, '0', '0', '0', '0', '0'),
  (559, 'Emotional Branding 2-QN', '152', '2012', 1, '0', '0', '0', '0', '0'),
  (560, '\"Salvati Copiii\"-QL', '158', '2012', 1, '0', '0', '0', '0', '0'),
  (561, 'U&A Lapte QN-QN', '041', '2012', 3, '0', '0', '0', '0', '0'),
  (562, 'U&A Lapte QL-QL', '042', '2012', 3, '0', '0', '0', '0', '0'),
  (563, 'Exit Domenii-QN', '076', '2012', 11, '0', '0', '0', '0', '0'),
  (564, 'Comportament de cumparaturi in canalele de proximitate-QN', '147', '2012', 11, '0', '0', '0', '0', '0'),
  (565, 'Wine Market Exploration- QL-QL', '038', '2012', 17, '0', '0', '0', '0', '0'),
  (566, 'Wine Market Exploration QN-QN', '039', '2012', 17, '0', '0', '0', '0', '0'),
  (567, 'La vache qui rit-QL', '087', '2012', 18, '0', '0', '0', '0', '0'),
  (568, 'Concept & Product Test for Danone OIKOS-QL', '109', '2012', 18, '0', '0', '0', '0', '0'),
  (569, 'Milk Valorization-QN', '115', '2012', 18, '0', '0', '0', '0', '0'),
  (570, 'CATI-iaurt-QN', '117', '2012', 18, '0', '0', '0', '0', '0'),
  (571, 'Segmentation-QN', '157', '2012', 20, '0', '0', '0', '0', '0'),
  (572, 'U&A on Preservatives Market-QL', '028', '2012', 21, '0', '0', '0', '0', '0'),
  (573, 'Evaluare promotie Dr.Oetker-QN', '049', '2012', 21, '0', '0', '0', '0', '0'),
  (574, 'Promotion Effectiveness-Dr.Oetker-QN', '091', '2012', 21, '0', '0', '0', '0', '0'),
  (575, 'Dr.Oetker-Chisinau- QN-QN', '113', '2012', 21, '0', '0', '0', '0', '0'),
  (576, 'Dr.Oetker Chisinau-QL-QL', '114', '2012', 21, '0', '0', '0', '0', '0'),
  (577, 'Omnibus Septembrie 2012-QN', '129', '2012', 21, '0', '0', '0', '0', '0'),
  (578, 'Backen-QL', '139', '2012', 21, '0', '0', '0', '0', '0'),
  (579, 'U&A-QL', '174', '2012', 22, '0', '0', '0', '0', '0'),
  (580, 'Termocentrala-QN', '126', '2012', 28, '0', '0', '0', '0', '0'),
  (581, 'B2B Mobile Study-QN', '057', '2012', 31, '0', '0', '0', '0', '0'),
  (582, 'Brand Tracking Ianuarie 2012-QN', '008', '2012', 32, '0', '0', '0', '0', '0'),
  (583, 'Natural Goodness Research-QL', '013', '2012', 32, '0', '0', '0', '0', '0'),
  (584, 'Omnibus Februarie 12-QN', '020', '2012', 32, '0', '0', '0', '0', '0'),
  (585, 'UCL 2012-QN', '021', '2012', 32, '0', '0', '0', '0', '0'),
  (586, 'Brand Tracking Februarie 2012-QN', '023', '2012', 32, '0', '0', '0', '0', '0'),
  (587, 'Climat organizational-QN', '026', '2012', 32, '0', '0', '0', '0', '0'),
  (588, 'Brand Tracking Martie 2012-QN', '036', '2012', 32, '0', '0', '0', '0', '0'),
  (589, 'Omnibus-Aprilie 2012-QN', '046', '2012', 32, '0', '0', '0', '0', '0'),
  (590, 'Brand Tracking Aprilie 2012-QN', '050', '2012', 32, '0', '0', '0', '0', '0'),
  (591, 'Package Innovation concept test assessment-QL', '060', '2012', 32, '0', '0', '0', '0', '0'),
  (592, 'Tracking Heineken QL- Ciuc Premium-QL', '068', '2012', 32, '0', '0', '0', '0', '0'),
  (593, 'PT Bucegi-V2-QN', '072', '2012', 32, '0', '0', '0', '0', '0'),
  (594, 'Brand Tracking Mai 2012-QN', '079', '2012', 32, '0', '0', '0', '0', '0'),
  (595, 'PET Investigation-V1-QL', '084', '2012', 32, '0', '0', '0', '0', '0'),
  (596, 'Brand Tracking Iunie 2012-QN', '090', '2012', 32, '0', '0', '0', '0', '0'),
  (597, 'Omnibus July 12- Heineken-QN', '103', '2012', 32, '0', '0', '0', '0', '0'),
  (598, 'Brand Traking Iulie 2012-QN', '105', '2012', 32, '0', '0', '0', '0', '0'),
  (599, 'Brand Tracking August 2012-QN', '112', '2012', 32, '0', '0', '0', '0', '0'),
  (600, 'U&A survey on Radler&Flavoured beer-QN', '120', '2012', 32, '0', '0', '0', '0', '0'),
  (601, 'Omnibus Septembrie 2012-QN', '128', '2012', 32, '0', '0', '0', '0', '0'),
  (602, 'Brand Tracking Septembrie 2012-QN', '136', '2012', 32, '0', '0', '0', '0', '0'),
  (603, 'Outsourcing Brewing Locations-QN', '137', '2012', 32, '0', '0', '0', '0', '0'),
  (604, 'Seaside 2013-QN', '140', '2012', 32, '0', '0', '0', '0', '0'),
  (605, 'Brand Tracking Octombrie 2012-QN', '148', '2012', 32, '0', '0', '0', '0', '0'),
  (606, 'Campionatul National de gratar-QL', '149', '2012', 32, '0', '0', '0', '0', '0'),
  (607, 'KEG investigation-QN', '154', '2012', 32, '0', '0', '0', '0', '0'),
  (608, 'Product Label Test-QN', '156', '2012', 32, '0', '0', '0', '0', '0'),
  (609, 'Heineken Amsterdam-QL', '159', '2012', 32, '0', '0', '0', '0', '0'),
  (610, 'Tracking Noiembrie 2012-QN', '162', '2012', 32, '0', '0', '0', '0', '0'),
  (611, 'Consumer Insights Validation-QN', '167', '2012', 32, '0', '0', '0', '0', '0'),
  (612, 'GB Campionatul National de gratar-QN-QN', '168', '2012', 32, '0', '0', '0', '0', '0'),
  (613, 'Tracking Decembrie 2012-QN', '176', '2012', 32, '0', '0', '0', '0', '0'),
  (614, 'Silva QL- Motivational Study-National Pride-QL', '177', '2012', 32, '0', '0', '0', '0', '0'),
  (615, 'Shopper Research-QN', '180', '2012', 32, '0', '0', '0', '0', '0'),
  (616, 'GB Concept Test-QL', '181', '2012', 32, '0', '0', '0', '0', '0'),
  (617, 'PET investigation-QL', '182', '2012', 32, '0', '0', '0', '0', '0'),
  (618, 'Communication Assessment for Neumarkt and Bucegi-QL', '183', '2012', 32, '0', '0', '0', '0', '0'),
  (619, 'SIMO-QL', '163', '2012', 34, '0', '0', '0', '0', '0'),
  (620, 'Cigarette Pricing Study in Israel-QN', '143', '2012', 39, '0', '0', '0', '0', '0'),
  (621, 'Poiana Product Test- Hilary-QN', '007', '2012', 44, '0', '0', '0', '0', '0'),
  (622, '3 in 1 CPT-QN', '024', '2012', 44, '0', '0', '0', '0', '0'),
  (623, 'Shopper-Milka mini tablets-QN', '035', '2012', 44, '0', '0', '0', '0', '0'),
  (624, 'In-home visit-QL', '069', '2012', 44, '0', '0', '0', '0', '0'),
  (625, 'Snacking-segmentation and occasions-QL-QL', '093', '2012', 44, '0', '0', '0', '0', '0'),
  (626, 'Snacking-QN-QN', '094', '2012', 44, '0', '0', '0', '0', '0'),
  (627, 'Shopper study in Carrefour-Kraft-QN', '104', '2012', 44, '0', '0', '0', '0', '0'),
  (628, 'CPT Bubby-QN', '110', '2012', 44, '0', '0', '0', '0', '0'),
  (629, 'Omnibus Septembrie 2012-QN', '134', '2012', 44, '0', '0', '0', '0', '0'),
  (630, 'Exit Christmas Promo hypermarket-QN', '169', '2012', 44, '0', '0', '0', '0', '0'),
  (631, 'Product Test for Jacobs 3 in 1-QN', '170', '2012', 44, '0', '0', '0', '0', '0'),
  (632, 'Training Consumer Connection-L\'oreal-QL', '064', '2012', 45, '0', '0', '0', '0', '0'),
  (633, 'PT for Garnier Color Naturals-QN', '138', '2012', 45, '0', '0', '0', '0', '0'),
  (634, 'Probiotics Categori-QL', '118', '2012', 47, '0', '0', '0', '0', '0'),
  (635, 'Disaster Check for Alcovit Package-QL', '119', '2012', 47, '0', '0', '0', '0', '0'),
  (636, '40133782-Orange 2012-Romania Q1-PO:40122757- Lara Clarkson-QN', '001', '2012', 49, '0', '0', '0', '0', '0'),
  (637, '40133782-Orange 2012- Romania Q1-PO:40122757- Lara Clarkson-QN', '002', '2012', 49, '0', '0', '0', '0', '0'),
  (638, '40133782- Orange 2012-Romabnia Q1-PO:40122757- Lara Clarkson-QN', '003', '2012', 49, '0', '0', '0', '0', '0'),
  (639, '40133782- Orange 2012-Romania Q2-PO No:40122757; Reshma Mahmud-QN', '051', '2012', 49, '0', '0', '0', '0', '0'),
  (640, '40133782- Orange 2012-Romania Q2- PO No.40122757- Reshma Mahmud-QN', '052', '2012', 49, '0', '0', '0', '0', '0'),
  (641, '40133782- Orange 2012-Romania Q2-PO No.40122757- Reshma Mahmud-QN', '053', '2012', 49, '0', '0', '0', '0', '0'),
  (642, '40133782-Orange 2012-Romania-Q3-PO No.40122757- Reshma Mahmud-QN', '096', '2012', 49, '0', '0', '0', '0', '0'),
  (643, '40133782-Orange 2012-Romania-Q3-PO No.40122757- Reshma Mahmud-QN', '097', '2012', 49, '0', '0', '0', '0', '0'),
  (644, '40133782-Orange 2012-Romania-Q3-PO No.40122757- Reshma Mahmud-QN', '098', '2012', 49, '0', '0', '0', '0', '0'),
  (645, '40133782-Orange 2012-Romania Q2-PO No03/09/201240122757-Reshma Mahmud-QN', '123', '2012', 49, '0', '0', '0', '0', '0'),
  (646, '40133782-Orange 2012- Romania Q4-PO No.40122757- Dafydd Edwards-QN', '131', '2012', 49, '0', '0', '0', '0', '0'),
  (647, '40133782-Orange 2012- Romania Q4-PO No.40122757- Dafydd Edwards-QN', '132', '2012', 49, '0', '0', '0', '0', '0'),
  (648, '40133782-Orange 2012- Romania Q4-PO No.40122757- Dafydd Edwards-QN', '133', '2012', 49, '0', '0', '0', '0', '0'),
  (649, 'Mystery Shopper- 2 valuri-QN', '121', '2012', 50, '0', '0', '0', '0', '0'),
  (650, 'Big Joe vs Primola-QN', '004', '2012', 52, '0', '0', '0', '0', '0'),
  (651, 'Maggi Noodles-QN', '010', '2012', 52, '0', '0', '0', '0', '0'),
  (652, 'Mini Pizza-QL', '011', '2012', 52, '0', '0', '0', '0', '0'),
  (653, 'Joe vs Competitie-QL', '037', '2012', 52, '0', '0', '0', '0', '0'),
  (654, 'Beverage Consumer Landscape-QN', '040', '2012', 52, '0', '0', '0', '0', '0'),
  (655, 'Cofee beginners-QL', '065', '2012', 52, '0', '0', '0', '0', '0'),
  (656, 'Brasero in Home test-QN', '067', '2012', 52, '0', '0', '0', '0', '0'),
  (657, 'CLT instant - Mai-QN', '078', '2012', 52, '0', '0', '0', '0', '0'),
  (658, 'Twist-QN', '083', '2012', 52, '0', '0', '0', '0', '0'),
  (659, 'Top Gun vs Cornetto-60/40 Blind PT-QN', '111', '2012', 52, '0', '0', '0', '0', '0'),
  (660, 'Workshop DG-QL', '116', '2012', 52, '0', '0', '0', '0', '0'),
  (661, 'Nirvana 60/40-QN', '122', '2012', 52, '0', '0', '0', '0', '0'),
  (662, '3 in 1-QL', '124', '2012', 52, '0', '0', '0', '0', '0'),
  (663, 'Aloma vs Obsession-QN', '144', '2012', 52, '0', '0', '0', '0', '0'),
  (664, 'Maggi Recipe Mixes Potatoes-QL', '161', '2012', 52, '0', '0', '0', '0', '0'),
  (665, 'Flavorful tubers-QN', '166', '2012', 52, '0', '0', '0', '0', '0'),
  (666, 'Maggi Secretul Gustului-QL', '175', '2012', 52, '0', '0', '0', '0', '0'),
  (667, 'Mystery Shopping Program-QN', '012', '2012', 53, '0', '0', '0', '0', '0'),
  (668, 'Mystery Shopping April 2012-QN', '047', '2012', 53, '0', '0', '0', '0', '0'),
  (669, 'Mystery Shopping Mai 2012-QN', '066', '2012', 53, '0', '0', '0', '0', '0'),
  (670, 'Mistery Shopper Iunie 2012-QN', '092', '2012', 53, '0', '0', '0', '0', '0'),
  (671, 'mystery shopping Iulie 2012-QN', '101', '2012', 53, '0', '0', '0', '0', '0'),
  (672, 'Omnibus Februarie 12- Theraflu-QN', '014', '2012', 55, '0', '0', '0', '0', '0'),
  (673, 'Omnibus Februarie 12- Vibrocil-QN', '019', '2012', 55, '0', '0', '0', '0', '0'),
  (674, 'B2B- Orange-QL', '005', '2012', 58, '0', '0', '0', '0', '0'),
  (675, 'B2B 1-49-QN', '031', '2012', 58, '0', '0', '0', '0', '0'),
  (676, 'B2B 50+-QN', '032', '2012', 58, '0', '0', '0', '0', '0'),
  (677, 'TV Market-QN', '085', '2012', 58, '0', '0', '0', '0', '0'),
  (678, 'New portofolio study-QL', '086', '2012', 58, '0', '0', '0', '0', '0'),
  (679, 'Orange TV pre-launch study-QL', '185', '2012', 58, '0', '0', '0', '0', '0'),
  (680, 'BPA Study-QN', '184', '2012', 63, '0', '0', '0', '0', '0'),
  (681, 'Pricing Sensitivity on Ice Tea Market-QN', '127', '2012', 64, '0', '0', '0', '0', '0'),
  (682, 'CSD pricing-QN', '155', '2012', 64, '0', '0', '0', '0', '0'),
  (683, 'Value Proposition among SME Segment-QN', '059', '2012', 65, '0', '0', '0', '0', '0'),
  (684, 'New Brand Signature Assessment-QL', '073', '2012', 65, '0', '0', '0', '0', '0'),
  (685, 'Raiffeisen  completare 4 IDI-Value Propositions-QL', '074', '2012', 65, '0', '0', '0', '0', '0'),
  (686, 'Evaluare concept-Overdraft plati directe furnizori-QL', '106', '2012', 65, '0', '0', '0', '0', '0'),
  (687, 'Nurofen Junior-QL', '009', '2012', 66, '0', '0', '0', '0', '0'),
  (688, 'Air Wick Autospray-QN', '018', '2012', 66, '0', '0', '0', '0', '0'),
  (689, 'Nurofen baby conjoit-QN', '029', '2012', 66, '0', '0', '0', '0', '0'),
  (690, 'Omnibus Aprilie 2012-QN', '054', '2012', 66, '0', '0', '0', '0', '0'),
  (691, 'Mystery Shopper-QN', '075', '2012', 66, '0', '0', '0', '0', '0'),
  (692, 'Nurofen expres-QN', '082', '2012', 66, '0', '0', '0', '0', '0'),
  (693, 'Regional visit-QL', '089', '2012', 66, '0', '0', '0', '0', '0'),
  (694, 'Omnibus Septembrie 2012-QN', '130', '2012', 66, '0', '0', '0', '0', '0'),
  (695, 'Pricing Sensitivity on Vanish-QN', '146', '2012', 66, '0', '0', '0', '0', '0'),
  (696, 'Infacol-QL', '022', '2012', 69, '0', '0', '0', '0', '0'),
  (697, 'Post campaign evaluation-Essentiale Forte-QN', '080', '2012', 69, '0', '0', '0', '0', '0'),
  (698, 'No-spa Communication Test-QL', '088', '2012', 69, '0', '0', '0', '0', '0'),
  (699, 'Post campaign evaluation-NoSpa-QN', '095', '2012', 69, '0', '0', '0', '0', '0'),
  (700, 'Awareness and Perceptions-QN', '150', '2012', 74, '0', '0', '0', '0', '0'),
  (701, 'Cosmetics-QL', '145', '2012', 75, '0', '0', '0', '0', '0'),
  (702, 'RFQ Romania-1-QN', '006', '2012', 79, '0', '0', '0', '0', '0'),
  (703, 'RFQ- Romania 2-QN', '025', '2012', 79, '0', '0', '0', '0', '0'),
  (704, 'Omnibus  Aprilie 2012-QN', '055', '2012', 80, '0', '0', '0', '0', '0'),
  (705, 'Pack Test-f2f-QN', '077', '2012', 80, '0', '0', '0', '0', '0'),
  (706, 'Omnibus July 12- Tetra Pak-QN', '102', '2012', 80, '0', '0', '0', '0', '0'),
  (707, 'Milk Consumption Landscape QL-QL', '164', '2012', 80, '0', '0', '0', '0', '0'),
  (708, 'Milk Consumption Landscape QN-QN', '165', '2012', 80, '0', '0', '0', '0', '0'),
  (709, 'Testare ambalaje Tymbark-QN', '171', '2012', 80, '0', '0', '0', '0', '0'),
  (710, 'Testare ambalaje copii-QN', '172', '2012', 80, '0', '0', '0', '0', '0'),
  (711, 'Omnibus Decembrie 2012-QN', '173', '2012', 80, '0', '0', '0', '0', '0'),
  (712, 'Testare mesaje ambalaj-lapte 1 litru-QN', '178', '2012', 80, '0', '0', '0', '0', '0'),
  (713, 'Testare mesaje ambalaj lapte scolar-QN', '179', '2012', 80, '0', '0', '0', '0', '0'),
  (714, 'Ciucas&Timisoreana Package Research-QL', '015', '2012', 86, '0', '0', '0', '0', '0'),
  (715, 'Package Study-QN', '027', '2012', 86, '0', '0', '0', '0', '0'),
  (716, 'Product&Package Study Redd\'s-QN', '033', '2012', 86, '0', '0', '0', '0', '0'),
  (717, 'Ciucas National- Promo 2012-QL', '034', '2012', 86, '0', '0', '0', '0', '0'),
  (718, 'Summer Thematic-QL', '048', '2012', 86, '0', '0', '0', '0', '0'),
  (719, 'Timisoreana Summer Road Show-QL', '061', '2012', 86, '0', '0', '0', '0', '0'),
  (720, 'Concept Test-mini breweries-QL-QL', '062', '2012', 86, '0', '0', '0', '0', '0'),
  (721, 'Concept Test mini breweries QN-QN', '063', '2012', 86, '0', '0', '0', '0', '0'),
  (722, 'Timisoreana NFT-QL', '100', '2012', 86, '0', '0', '0', '0', '0'),
  (723, 'Shopping Trip-QL', '107', '2012', 86, '0', '0', '0', '0', '0'),
  (724, 'NRCB Conjoint-QN', '125', '2012', 86, '0', '0', '0', '0', '0'),
  (725, 'Segmentare motivationala -pateu QL-QL', '070', '2012', 87, '0', '0', '0', '0', '0'),
  (726, 'Segmentare motivationala-pateu QN-QN', '071', '2012', 87, '0', '0', '0', '0', '0'),
  (727, 'Testare de Ambalaj- Mancare Gatita-QL', '135', '2012', 87, '0', '0', '0', '0', '0'),
  (728, 'Households Projects-QL', '045', '2012', 88, '0', '0', '0', '0', '0'),
  (729, 'Mega Price Plans Assessment-QL', '058', '2012', 88, '0', '0', '0', '0', '0'),
  (730, 'VDF Trendsetters-QL', '099', '2012', 88, '0', '0', '0', '0', '0'),
  (731, 'Concept Assessment Prepaid-QL', '153', '2012', 88, '0', '0', '0', '0', '0'),
  (732, 'Tracking Volksbank- QN-QN', '016', '2012', 89, '0', '0', '0', '0', '0'),
  (733, 'Ad Tracker Volksbank QL-QL', '017', '2012', 89, '0', '0', '0', '0', '0'),
  (734, 'Price Research on Chewing Gum-QN', '043', '2012', 90, '0', '0', '0', '0', '0'),
  (735, 'Omnibus Aprilie 2012-QN', '056', '2012', 90, '0', '0', '0', '0', '0'),
  (736, 'Studiu de pret bomboane-Bulgaria-QN', '108', '2012', 90, '0', '0', '0', '0', '0'),
  (737, 'Antinevralgic-QN', '030', '2012', 92, '0', '0', '0', '0', '0'),
  (738, 'Post campaign evaluation-Dicarbocalm-QN', '081', '2012', 92, '0', '0', '0', '0', '0'),
  (739, 'Antinevralgic-QL', '141', '2012', 92, '0', '0', '0', '0', '0'),
  (740, 'Studiu intern Smartphone-QL', '053', '2013', 1, '0', '0', '0', '0', '0'),
  (741, 'Tabacco project-internal-QL', '086', '2013', 1, '0', '0', '0', '0', '0'),
  (742, 'Shopper Decision Maker-QL', '116', '2013', 1, '0', '0', '0', '0', '0'),
  (743, 'Recrutare eComunitate 360insights-QN', '118', '2013', 1, '0', '0', '0', '0', '0'),
  (744, 'Emotional Branding 2013- proiect intern-QN', '134', '2013', 1, '0', '0', '0', '0', '0'),
  (745, 'Credit Cards-QL', '063', '2013', 5, '0', '0', '0', '0', '0'),
  (746, 'Corporate Communication pre-test-QL', '067', '2013', 5, '0', '0', '0', '0', '0'),
  (747, 'Royal Norwegian Embassy-QN', '061', '2013', 6, '0', '0', '0', '0', '0'),
  (748, 'Omnibus BT-QN', '109', '2013', 7, '0', '0', '0', '0', '0'),
  (749, 'Brand&Visual Concept Assessment-QL', '013', '2013', 11, '0', '0', '0', '0', '0'),
  (750, 'Testare concept Telefonul Rosu-QL', '034', '2013', 11, '0', '0', '0', '0', '0'),
  (751, 'Testare de concept-QL', '055', '2013', 11, '0', '0', '0', '0', '0'),
  (752, 'Assess Supeco Concept-QL', '100', '2013', 11, '0', '0', '0', '0', '0'),
  (753, 'Testare campanie noua de comunicare-QL', '141', '2013', 11, '0', '0', '0', '0', '0'),
  (754, 'Mix opportunity-QL', '104', '2013', 13, '0', '0', '0', '0', '0'),
  (755, 'Nutriday Snack CPT-QN', '012', '2013', 18, '0', '0', '0', '0', '0'),
  (756, 'Greek CT-QN', '037', '2013', 18, '0', '0', '0', '0', '0'),
  (757, 'Men CT-QN', '038', '2013', 18, '0', '0', '0', '0', '0'),
  (758, 'Natura CT-QN', '039', '2013', 18, '0', '0', '0', '0', '0'),
  (759, 'Omnibus-QN', '108', '2013', 21, '0', '0', '0', '0', '0'),
  (760, 'Skoda-QL', '004', '2013', 24, '0', '0', '0', '0', '0'),
  (761, 'Workshop Garanti-QL', '027', '2013', 24, '0', '0', '0', '0', '0'),
  (762, 'Pre and Post Campaign Evaluation for Gillette-QN', '092', '2013', 25, '0', '0', '0', '0', '0'),
  (763, 'P&G_METRO_Trader_Kiosk-Ethnos_ROMANIA-QL', '085', '2013', 26, '0', '0', '0', '0', '0'),
  (764, 'P&G METRO III SCO Beauty ROMANIA-QL', '088', '2013', 26, '0', '0', '0', '0', '0'),
  (765, 'MRC_Amway_NewApp_Kit-QL', '135', '2013', 26, '0', '0', '0', '0', '0'),
  (766, 'Omega 3 Max-QL', '051', '2013', 27, '0', '0', '0', '0', '0'),
  (767, 'Termocentrala Galati-QN', '050', '2013', 28, '0', '0', '0', '0', '0'),
  (768, 'Pricing Study Parasinus-QN', '035', '2013', 29, '0', '0', '0', '0', '0'),
  (769, 'Philips Floor Care Energy Label-QL', '133', '2013', 30, '0', '0', '0', '0', '0'),
  (770, 'Golden Brau-validare de concepte-QN', '009', '2013', 32, '0', '0', '0', '0', '0'),
  (771, 'Tracking Ianuarie 2013-QN', '014', '2013', 32, '0', '0', '0', '0', '0'),
  (772, 'Tracking Februarie 2013-QN', '016', '2013', 32, '0', '0', '0', '0', '0'),
  (773, 'Studiu de Climat Organizational-QN', '017', '2013', 32, '0', '0', '0', '0', '0'),
  (774, 'Shopper Research- Cash&Carry-QN', '019', '2013', 32, '0', '0', '0', '0', '0'),
  (775, 'Omnibus Februarie 2013-QN', '029', '2013', 32, '0', '0', '0', '0', '0'),
  (776, 'Tracking Martie 2013-QN', '031', '2013', 32, '0', '0', '0', '0', '0'),
  (777, 'Consumer Segmentation & mapping-QN', '054', '2013', 32, '0', '0', '0', '0', '0'),
  (778, 'Tracking Aprilie 2013-QN', '056', '2013', 32, '0', '0', '0', '0', '0'),
  (779, 'Tracking Mai 2013-QN', '057', '2013', 32, '0', '0', '0', '0', '0'),
  (780, 'Tracking Iunie 2013-QN', '062', '2013', 32, '0', '0', '0', '0', '0'),
  (781, 'Omnibus June 2013-QN', '065', '2013', 32, '0', '0', '0', '0', '0'),
  (782, 'Ciuc Communication-QL', '069', '2013', 32, '0', '0', '0', '0', '0'),
  (783, 'Extended View into Shopper Decision Process-QN', '082', '2013', 32, '0', '0', '0', '0', '0'),
  (784, 'Package Test for Bucegi Brand-QN', '095', '2013', 32, '0', '0', '0', '0', '0'),
  (785, 'Silva-Mandrie Nationala-raport-QL', '096', '2013', 32, '0', '0', '0', '0', '0'),
  (786, 'Desperados profiling-QN', '106', '2013', 32, '0', '0', '0', '0', '0'),
  (787, 'U&A on Flavored Beer-QL', '122', '2013', 32, '0', '0', '0', '0', '0'),
  (788, 'U&A on Flavored Beer-QN-QN', '123', '2013', 32, '0', '0', '0', '0', '0'),
  (789, 'Product Test for 0.0% alcohol mainstream brands-QN', '125', '2013', 32, '0', '0', '0', '0', '0'),
  (790, 'Product Test for 0.0% alcohol Premium brands-QN', '128', '2013', 32, '0', '0', '0', '0', '0'),
  (791, 'Bucegi-QL', '129', '2013', 32, '0', '0', '0', '0', '0'),
  (792, 'Testare rute de comunicare Bucegi-QL', '137', '2013', 32, '0', '0', '0', '0', '0'),
  (793, 'ING life insurance-QN', '046', '2013', 36, '0', '0', '0', '0', '0'),
  (794, 'Imodium research-QL-QL', '021', '2013', 38, '0', '0', '0', '0', '0'),
  (795, 'Imodium research QN-QN', '022', '2013', 38, '0', '0', '0', '0', '0'),
  (796, 'Cigarette Pricing Study in Jordan-QN', '040', '2013', 39, '0', '0', '0', '0', '0'),
  (797, 'Product Test on New formula of Primola-QN', '142', '2013', 41, '0', '0', '0', '0', '0'),
  (798, 'CAS R&G-QN', '026', '2013', 44, '0', '0', '0', '0', '0'),
  (799, '3 in 1 BOATO- biscuiti-QN', '064', '2013', 44, '0', '0', '0', '0', '0'),
  (800, '5S Study in Mega Image-QN', '090', '2013', 44, '0', '0', '0', '0', '0'),
  (801, 'Barni Brand Performance-QL', '121', '2013', 44, '0', '0', '0', '0', '0'),
  (802, 'Jacobs 3 in 1 with topping-QN', '130', '2013', 44, '0', '0', '0', '0', '0'),
  (803, 'Workshop-QL', '080', '2013', 45, '0', '0', '0', '0', '0'),
  (804, 'Brand Positioning-QL', '105', '2013', 45, '0', '0', '0', '0', '0'),
  (805, 'Package and category Name Assessment-QL', '117', '2013', 47, '0', '0', '0', '0', '0'),
  (806, '40137056- Orange 2013- Romania Q1-Q4- January-2013-QN', '001', '2013', 49, '0', '0', '0', '0', '0'),
  (807, '40137056- Orange 2013- Romania Q1-Q4- February-2013-QN', '015', '2013', 49, '0', '0', '0', '0', '0'),
  (808, '40137056- Orange 2013- Romania Q1-Q4- March-2013-QN', '032', '2013', 49, '0', '0', '0', '0', '0'),
  (809, '40137056- Orange 2013- Romania Q1-Q4- April-2013-QN', '047', '2013', 49, '0', '0', '0', '0', '0'),
  (810, '40137056- Orange 2013- Romania Q1-Q4- Mayl-2013-QN', '058', '2013', 49, '0', '0', '0', '0', '0'),
  (811, '40137056- Orange 2013- Romania Q1-Q4- June-2013-QN', '066', '2013', 49, '0', '0', '0', '0', '0'),
  (812, '40137056-Orange 2013-Romania Q1-Q4-Aug 2013- Dafydd Edwards-QN', '087', '2013', 49, '0', '0', '0', '0', '0'),
  (813, '40137056-Orange 2013-Romania Q1-Q4-Sept 2013- Dafydd Edwards-QN', '094', '2013', 49, '0', '0', '0', '0', '0'),
  (814, '40137056-Orange 2013-Romania Q1-Q4-Oct. 2013- Dafydd Edwards-QN', '114', '2013', 49, '0', '0', '0', '0', '0'),
  (815, '40137056-Orange 2013-Romania Q1-Q4-Nov. 2013- Dafydd Edwards-QN', '127', '2013', 49, '0', '0', '0', '0', '0'),
  (816, 'Codeframe translation-QN', '131', '2013', 49, '0', '0', '0', '0', '0'),
  (817, 'Mystery Shopper 2 valuri-QN', '093', '2013', 50, '0', '0', '0', '0', '0'),
  (818, 'CT Potatoes -QN-QN', '002', '2013', 52, '0', '0', '0', '0', '0'),
  (819, 'Noodles U&A-QN', '008', '2013', 52, '0', '0', '0', '0', '0'),
  (820, 'CT potatoes QL-QL', '020', '2013', 52, '0', '0', '0', '0', '0'),
  (821, 'Maggi Fidelicios-QL', '068', '2013', 52, '0', '0', '0', '0', '0'),
  (822, 'Maggi Brand Image-QL', '072', '2013', 52, '0', '0', '0', '0', '0'),
  (823, 'Analiza suplimentara cake 2012-QN', '112', '2013', 52, '0', '0', '0', '0', '0'),
  (824, 'Ice Cream Package Pretest-QL', '132', '2013', 52, '0', '0', '0', '0', '0'),
  (825, 'Drivers in Pharmacists Recommendation Vibrocil, Vibrocil Duo-QL', '023', '2013', 55, '0', '0', '0', '0', '0'),
  (826, 'Theraflu-QL', '043', '2013', 55, '0', '0', '0', '0', '0'),
  (827, 'Theraflu- QN-QN', '059', '2013', 55, '0', '0', '0', '0', '0'),
  (828, 'U&A Study on Dairy Market-QL', '010', '2013', 56, '0', '0', '0', '0', '0'),
  (829, 'OIKOS communication and Greek yogurt significance-QL', '091', '2013', 56, '0', '0', '0', '0', '0'),
  (830, 'Churn Assesment-QL', '006', '2013', 58, '0', '0', '0', '0', '0'),
  (831, 'Churn Assesment -QN-QN', '007', '2013', 58, '0', '0', '0', '0', '0'),
  (832, 'B2B 1-49-QN', '048', '2013', 58, '0', '0', '0', '0', '0'),
  (833, 'B2B 50+-QN', '049', '2013', 58, '0', '0', '0', '0', '0'),
  (834, 'Orange? Disney-QL', '060', '2013', 58, '0', '0', '0', '0', '0'),
  (835, 'Customer satisfaction with collection agencies-QN', '113', '2013', 58, '0', '0', '0', '0', '0'),
  (836, 'Contact Plan reshape-QN', '136', '2013', 58, '0', '0', '0', '0', '0'),
  (837, 'U&A on telecom services in rural area-QL', '140', '2013', 58, '0', '0', '0', '0', '0'),
  (838, 'MR Segmentation GP-QL', '070', '2013', 61, '0', '0', '0', '0', '0'),
  (839, 'MR Segmentation GP- QN-QN', '071', '2013', 61, '0', '0', '0', '0', '0'),
  (840, 'RAP Effectiveness-QN', '099', '2013', 62, '0', '0', '0', '0', '0'),
  (841, 'Conjoint-QN', '101', '2013', 62, '0', '0', '0', '0', '0'),
  (842, 'Shelf Optimization-QN', '126', '2013', 62, '0', '0', '0', '0', '0'),
  (843, 'Tozovski Product Test-QN', '107', '2013', 63, '0', '0', '0', '0', '0'),
  (844, 'PT Pepsi-QN', '018', '2013', 64, '0', '0', '0', '0', '0'),
  (845, 'PT report-QN', '124', '2013', 64, '0', '0', '0', '0', '0'),
  (846, 'Omnibus Reckitte-QN', '028', '2013', 66, '0', '0', '0', '0', '0'),
  (847, 'Omnibus Reckitt-2-QN', '036', '2013', 66, '0', '0', '0', '0', '0'),
  (848, 'Calgon-QN', '041', '2013', 66, '0', '0', '0', '0', '0'),
  (849, 'Vanish Sanitizer-QL', '081', '2013', 66, '0', '0', '0', '0', '0'),
  (850, 'River Research project-QL', '005', '2013', 67, '0', '0', '0', '0', '0'),
  (851, 'Testing Communication Message-QN', '011', '2013', 68, '0', '0', '0', '0', '0'),
  (852, 'Magne B6-QL', '003', '2013', 69, '0', '0', '0', '0', '0'),
  (853, 'Prescription Habits-QN', '138', '2013', 69, '0', '0', '0', '0', '0'),
  (854, 'Prescription Habits-QL-QL', '139', '2013', 69, '0', '0', '0', '0', '0'),
  (855, 'Awareness and Perceptions on Ticket Providers-QN', '103', '2013', 74, '0', '0', '0', '0', '0'),
  (856, 'Omnibus Februarie Tetra pak-QN', '030', '2013', 80, '0', '0', '0', '0', '0'),
  (857, 'Workshop-QN', '052', '2013', 80, '0', '0', '0', '0', '0'),
  (858, 'School Milk Program Ass.-QL', '083', '2013', 80, '0', '0', '0', '0', '0'),
  (859, 'School Milk Program Assessment-QN-QN', '084', '2013', 80, '0', '0', '0', '0', '0'),
  (860, 'Holistic overview of children consumption habits QL-QL', '097', '2013', 80, '0', '0', '0', '0', '0'),
  (861, 'Holistic overviw of children consumption habits QN-QN', '098', '2013', 80, '0', '0', '0', '0', '0'),
  (862, 'CATI Tuborg-QN', '076', '2013', 83, '0', '0', '0', '0', '0'),
  (863, 'General Assessment of New Economy Beer Brand-QN', '077', '2013', 83, '0', '0', '0', '0', '0'),
  (864, 'NCSD in-home-QL', '102', '2013', 83, '0', '0', '0', '0', '0'),
  (865, 'Insight Evaluation-QL', '115', '2013', 83, '0', '0', '0', '0', '0'),
  (866, 'Still drinks-QN', '119', '2013', 83, '0', '0', '0', '0', '0'),
  (867, 'Juice 100%-QN', '120', '2013', 83, '0', '0', '0', '0', '0'),
  (868, 'Omnibus-QN', '111', '2013', 84, '0', '0', '0', '0', '0'),
  (869, 'Product Landscape-QN', '045', '2013', 86, '0', '0', '0', '0', '0'),
  (870, 'New Prepaid Portofolio-QL', '033', '2013', 88, '0', '0', '0', '0', '0'),
  (871, 'Vodafone 14 IDI-QL', '044', '2013', 88, '0', '0', '0', '0', '0'),
  (872, 'RED postpaid Assessment-QL', '089', '2013', 88, '0', '0', '0', '0', '0'),
  (873, 'Tracking Volksbank-QN', '042', '2013', 89, '0', '0', '0', '0', '0'),
  (874, 'Touchpoints study for Hypermarkets-QL', '024', '2013', 91, '0', '0', '0', '0', '0'),
  (875, 'Touchpoints study for Hypermarkets-QN', '025', '2013', 91, '0', '0', '0', '0', '0');
/*!40000 ALTER TABLE `listaproiecte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propunere`
--

DROP TABLE IF EXISTS `propunere`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propunere` (
  `id_propunere` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `propunere`    LONGBLOB         NOT NULL,
  `nume`         VARCHAR(150)     NOT NULL,
  `creat_de`     VARCHAR(150) DEFAULT NULL,
  `creat_la`     TIMESTAMP        NULL DEFAULT NULL,
  PRIMARY KEY (`id_propunere`),
  UNIQUE KEY `id_propunere_UNIQUE` (`id_propunere`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propunere`
--

LOCK TABLES `propunere` WRITE;
/*!40000 ALTER TABLE `propunere` DISABLE KEYS */;
/*!40000 ALTER TABLE `propunere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `raportfinal`
--

DROP TABLE IF EXISTS `raportfinal`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `raportfinal` (
  `id_raport_final` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `raport_final`    LONGBLOB         NOT NULL,
  `nume`            VARCHAR(150)     NOT NULL,
  `creat_de`        VARCHAR(150) DEFAULT NULL,
  `creat_la`        TIMESTAMP        NULL DEFAULT NULL,
  PRIMARY KEY (`id_raport_final`),
  UNIQUE KEY `id_raport_final_UNIQUE` (`id_raport_final`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `raportfinal`
--

LOCK TABLES `raportfinal` WRITE;
/*!40000 ALTER TABLE `raportfinal` DISABLE KEYS */;
/*!40000 ALTER TABLE `raportfinal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_role_id` INT(11)     NOT NULL AUTO_INCREMENT,
  `username`     VARCHAR(45) NOT NULL,
  `role`         VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uni_username_role` (`role`, `username`),
  KEY `fk_username_idx` (`username`),
  CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
)
  ENGINE =InnoDB
  AUTO_INCREMENT =7
  DEFAULT CHARSET =latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles`
VALUES (2, 'cip', 'ROLE_ADMIN'), (3, 'adi', 'ROLE_USER'), (4, 'cip', 'ROLE_USER'), (6, 'isac', 'ROLE_USER');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled`  TINYINT(4)  NOT NULL DEFAULT '1',
  PRIMARY KEY (`username`)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('adi', '123456', 1), ('cip', '123456', 1), ('isac', 'isac', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE = @OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE = @OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT = @OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS = @OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION = @OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES = @OLD_SQL_NOTES */;

-- Dump completed on 2014-07-30 23:32:07
