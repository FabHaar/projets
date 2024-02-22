-- MariaDB dump 10.19  Distrib 10.11.4-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: dolibarr
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `llx_accounting_account`
--

DROP TABLE IF EXISTS `llx_accounting_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_accounting_account` (
  `rowid` bigint NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_pcg_version` varchar(32) NOT NULL,
  `pcg_type` varchar(20) NOT NULL,
  `account_number` varchar(32) NOT NULL,
  `account_parent` int DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `labelshort` varchar(255) DEFAULT NULL,
  `fk_accounting_category` int DEFAULT '0',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `reconcilable` tinyint NOT NULL DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_account` (`account_number`,`entity`,`fk_pcg_version`),
  KEY `idx_accounting_account_fk_pcg_version` (`fk_pcg_version`),
  KEY `idx_accounting_account_account_parent` (`account_parent`),
  CONSTRAINT `fk_accounting_account_fk_pcg_version` FOREIGN KEY (`fk_pcg_version`) REFERENCES `llx_accounting_system` (`pcg_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_account`
--

LOCK TABLES `llx_accounting_account` WRITE;
/*!40000 ALTER TABLE `llx_accounting_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_accounting_bookkeeping`
--

DROP TABLE IF EXISTS `llx_accounting_bookkeeping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_accounting_bookkeeping` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `piece_num` int NOT NULL,
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) NOT NULL,
  `doc_ref` varchar(300) NOT NULL,
  `fk_doc` int NOT NULL,
  `fk_docdet` int NOT NULL,
  `thirdparty_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `subledger_label` varchar(255) DEFAULT NULL,
  `numero_compte` varchar(32) NOT NULL,
  `label_compte` varchar(255) NOT NULL,
  `label_operation` varchar(255) DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) DEFAULT NULL,
  `sens` varchar(1) DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `lettering_code` varchar(255) DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user` int DEFAULT NULL,
  `code_journal` varchar(32) NOT NULL,
  `journal_label` varchar(255) DEFAULT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_export` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_accounting_bookkeeping_fk_doc` (`fk_doc`),
  KEY `idx_accounting_bookkeeping_fk_docdet` (`fk_docdet`),
  KEY `idx_accounting_bookkeeping_doc_date` (`doc_date`),
  KEY `idx_accounting_bookkeeping_numero_compte` (`numero_compte`,`entity`),
  KEY `idx_accounting_bookkeeping_code_journal` (`code_journal`,`entity`),
  KEY `idx_accounting_bookkeeping_piece_num` (`piece_num`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_bookkeeping`
--

LOCK TABLES `llx_accounting_bookkeeping` WRITE;
/*!40000 ALTER TABLE `llx_accounting_bookkeeping` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_bookkeeping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_accounting_bookkeeping_tmp`
--

DROP TABLE IF EXISTS `llx_accounting_bookkeeping_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_accounting_bookkeeping_tmp` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) NOT NULL,
  `doc_ref` varchar(300) NOT NULL,
  `fk_doc` int NOT NULL,
  `fk_docdet` int NOT NULL,
  `thirdparty_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `subledger_label` varchar(255) DEFAULT NULL,
  `numero_compte` varchar(32) DEFAULT NULL,
  `label_compte` varchar(255) NOT NULL,
  `label_operation` varchar(255) DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) NOT NULL,
  `sens` varchar(1) DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `lettering_code` varchar(255) DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user` int DEFAULT NULL,
  `code_journal` varchar(32) NOT NULL,
  `journal_label` varchar(255) DEFAULT NULL,
  `piece_num` int NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_accounting_bookkeeping_tmp_doc_date` (`doc_date`),
  KEY `idx_accounting_bookkeeping_tmp_fk_docdet` (`fk_docdet`),
  KEY `idx_accounting_bookkeeping_tmp_numero_compte` (`numero_compte`),
  KEY `idx_accounting_bookkeeping_tmp_code_journal` (`code_journal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_bookkeeping_tmp`
--

LOCK TABLES `llx_accounting_bookkeeping_tmp` WRITE;
/*!40000 ALTER TABLE `llx_accounting_bookkeeping_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_bookkeeping_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_accounting_fiscalyear`
--

DROP TABLE IF EXISTS `llx_accounting_fiscalyear`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_accounting_fiscalyear` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `statut` tinyint NOT NULL DEFAULT '0',
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_fiscalyear`
--

LOCK TABLES `llx_accounting_fiscalyear` WRITE;
/*!40000 ALTER TABLE `llx_accounting_fiscalyear` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_fiscalyear` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_accounting_groups_account`
--

DROP TABLE IF EXISTS `llx_accounting_groups_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_accounting_groups_account` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_accounting_account` int NOT NULL,
  `fk_c_accounting_category` int NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_groups_account`
--

LOCK TABLES `llx_accounting_groups_account` WRITE;
/*!40000 ALTER TABLE `llx_accounting_groups_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_accounting_groups_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_accounting_journal`
--

DROP TABLE IF EXISTS `llx_accounting_journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_accounting_journal` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `nature` smallint NOT NULL DEFAULT '1',
  `active` smallint DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_journal_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_journal`
--

LOCK TABLES `llx_accounting_journal` WRITE;
/*!40000 ALTER TABLE `llx_accounting_journal` DISABLE KEYS */;
INSERT INTO `llx_accounting_journal` VALUES
(1,'VT',1,'ACCOUNTING_SELL_JOURNAL',2,1),
(1,'AC',1,'ACCOUNTING_PURCHASE_JOURNAL',3,2),
(1,'BQ',1,'FinanceJournal',4,3),
(1,'OD',1,'ACCOUNTING_MISCELLANEOUS_JOURNAL',1,4),
(1,'AN',1,'ACCOUNTING_HAS_NEW_JOURNAL',9,5),
(1,'ER',1,'ExpenseReportsJournal',5,6),
(1,'INV',1,'InventoryJournal',8,7);
/*!40000 ALTER TABLE `llx_accounting_journal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_accounting_system`
--

DROP TABLE IF EXISTS `llx_accounting_system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_accounting_system` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_country` int DEFAULT NULL,
  `pcg_version` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` smallint DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_system_pcg_version` (`pcg_version`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_accounting_system`
--

LOCK TABLES `llx_accounting_system` WRITE;
/*!40000 ALTER TABLE `llx_accounting_system` DISABLE KEYS */;
INSERT INTO `llx_accounting_system` VALUES
(1,1,'The simple accountancy french plan','PCG99-ABREGE',1),
(1,1,'The base accountancy french plan','PCG99-BASE',2),
(1,1,'The developed accountancy french plan 2014','PCG14-DEV',3),
(1,1,'French foundation chart of accounts 2018','PCG18-ASSOC',4),
(1,1,'The developed farm accountancy french plan 2014','PCGAFR14-DEV',5),
(1,2,'The base accountancy belgium plan','PCMN-BASE',6),
(1,4,'The PYME accountancy spanish plan','PCG08-PYME',7),
(1,5,'Standardkontenrahmen SKR 03','SKR03',8),
(1,5,'Standardkontenrahmen SKR 04','SKR04',9),
(1,6,'Switzerland plan','PCG_SUISSE',10),
(1,7,'England plan','ENG-BASE',11),
(1,10,'The Tunisia plan','PCT',12),
(1,12,'The Moroccan chart of accounts','PCG',13),
(1,13,'Nouveau système comptable financier','NSCF',14),
(1,17,'Verkort rekeningschema','NL-VERKORT',15),
(1,20,'The Swedish mini chart of accounts','BAS-K1-MINI',16),
(1,41,'Plan Austria','AT-BASE',17),
(1,67,'The PYME accountancy Chile plan','PC-MIPYME',18),
(1,80,'Standardkontoplan fra SKAT','DK-STD',19),
(1,84,'Plan de cuentas Ecuador','EC-SUPERCIAS',20),
(1,70,'Plan único de cuentas Colombia','CO-PUC',21),
(1,140,'Plan comptable normalisé 2020 Luxembourgeois','PCN2020-LUXEMBURG',22),
(1,188,'Plan de conturi romanesc','RO-BASE',23),
(1,102,'Ελληνικά Λογιστικά Πρότυπα','Ε.Λ.Π.',24),
(1,49,'Plan comptable Ouest-Africain','SYSCOHADA-BJ',25),
(1,60,'Plan comptable Ouest-Africain','SYSCOHADA-BF',26),
(1,73,'Plan comptable Ouest-Africain','SYSCOHADA-CD',27),
(1,65,'Plan comptable Ouest-Africain','SYSCOHADA-CF',28),
(1,72,'Plan comptable Ouest-Africain','SYSCOHADA-CG',29),
(1,21,'Plan comptable Ouest-Africain','SYSCOHADA-CI',30),
(1,24,'Plan comptable Ouest-Africain','SYSCOHADA-CM',31),
(1,16,'Plan comptable Ouest-Africain','SYSCOHADA-GA',32),
(1,87,'Plan comptable Ouest-Africain','SYSCOHADA-GQ',33),
(1,71,'Plan comptable Ouest-Africain','SYSCOHADA-KM',34),
(1,147,'Plan comptable Ouest-Africain','SYSCOHADA-ML',35),
(1,168,'Plan comptable Ouest-Africain','SYSCOHADA-NE',36),
(1,22,'Plan comptable Ouest-Africain','SYSCOHADA-SN',37),
(1,66,'Plan comptable Ouest-Africain','SYSCOHADA-TD',38),
(1,15,'Plan comptable Ouest-Africain','SYSCOHADA-TG',39),
(1,11,'USA basic chart of accounts','US-BASE',40),
(1,11,'USA GAAP basic chart of accounts','US-GAAP-BASIC',41),
(1,14,'Canadian basic chart of accounts - English','CA-ENG-BASE',42),
(1,154,'Catalogo y codigo agrupador fiscal del 2019','SAT/24-2019',43),
(1,123,'日本 勘定科目表 基本版','JPN-BASE',44);
/*!40000 ALTER TABLE `llx_accounting_system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_actioncomm`
--

DROP TABLE IF EXISTS `llx_actioncomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_actioncomm` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `datep` datetime DEFAULT NULL,
  `datep2` datetime DEFAULT NULL,
  `fk_action` int DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_mod` int DEFAULT NULL,
  `fk_project` int DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `fk_contact` int DEFAULT NULL,
  `fk_parent` int NOT NULL DEFAULT '0',
  `fk_user_action` int DEFAULT NULL,
  `fk_user_done` int DEFAULT NULL,
  `transparency` int DEFAULT NULL,
  `priority` smallint DEFAULT NULL,
  `visibility` varchar(12) DEFAULT 'default',
  `fulldayevent` smallint NOT NULL DEFAULT '0',
  `percent` smallint NOT NULL DEFAULT '0',
  `location` varchar(128) DEFAULT NULL,
  `durationp` double DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `note` mediumtext,
  `calling_duration` int DEFAULT NULL,
  `email_subject` varchar(255) DEFAULT NULL,
  `email_msgid` varchar(255) DEFAULT NULL,
  `email_from` varchar(255) DEFAULT NULL,
  `email_sender` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `email_tocc` varchar(255) DEFAULT NULL,
  `email_tobcc` varchar(255) DEFAULT NULL,
  `errors_to` varchar(255) DEFAULT NULL,
  `reply_to` varchar(255) DEFAULT NULL,
  `recurid` varchar(128) DEFAULT NULL,
  `recurrule` varchar(128) DEFAULT NULL,
  `recurdateend` datetime DEFAULT NULL,
  `num_vote` int DEFAULT NULL,
  `event_paid` smallint NOT NULL DEFAULT '0',
  `status` smallint NOT NULL DEFAULT '0',
  `fk_element` int DEFAULT NULL,
  `elementtype` varchar(255) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_actioncomm_fk_soc` (`fk_soc`),
  KEY `idx_actioncomm_fk_contact` (`fk_contact`),
  KEY `idx_actioncomm_code` (`code`),
  KEY `idx_actioncomm_fk_element` (`fk_element`),
  KEY `idx_actioncomm_fk_user_action` (`fk_user_action`),
  KEY `idx_actioncomm_fk_project` (`fk_project`),
  KEY `idx_actioncomm_datep` (`datep`),
  KEY `idx_actioncomm_datep2` (`datep2`),
  KEY `idx_actioncomm_recurid` (`recurid`),
  KEY `idx_actioncomm_ref_ext` (`ref_ext`),
  KEY `idx_actioncomm_percent` (`percent`),
  KEY `idx_actioncomm_ref` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_actioncomm`
--

LOCK TABLES `llx_actioncomm` WRITE;
/*!40000 ALTER TABLE `llx_actioncomm` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_actioncomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_actioncomm_extrafields`
--

DROP TABLE IF EXISTS `llx_actioncomm_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_actioncomm_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_actioncomm_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_actioncomm_extrafields`
--

LOCK TABLES `llx_actioncomm_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_actioncomm_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_actioncomm_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_actioncomm_reminder`
--

DROP TABLE IF EXISTS `llx_actioncomm_reminder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_actioncomm_reminder` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `dateremind` datetime NOT NULL,
  `typeremind` varchar(32) NOT NULL,
  `fk_user` int NOT NULL,
  `offsetvalue` int NOT NULL,
  `offsetunit` varchar(1) NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `lasterror` varchar(128) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_actioncomm` int NOT NULL,
  `fk_email_template` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_actioncomm_reminder_unique` (`fk_actioncomm`,`fk_user`,`typeremind`,`offsetvalue`,`offsetunit`),
  KEY `idx_actioncomm_reminder_dateremind` (`dateremind`),
  KEY `idx_actioncomm_reminder_fk_user` (`fk_user`),
  KEY `idx_actioncomm_reminder_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_actioncomm_reminder`
--

LOCK TABLES `llx_actioncomm_reminder` WRITE;
/*!40000 ALTER TABLE `llx_actioncomm_reminder` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_actioncomm_reminder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_actioncomm_resources`
--

DROP TABLE IF EXISTS `llx_actioncomm_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_actioncomm_resources` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_actioncomm` int NOT NULL,
  `element_type` varchar(50) NOT NULL,
  `fk_element` int NOT NULL,
  `answer_status` varchar(50) DEFAULT NULL,
  `mandatory` smallint DEFAULT NULL,
  `transparency` smallint DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_actioncomm_resources` (`fk_actioncomm`,`element_type`,`fk_element`),
  KEY `idx_actioncomm_resources_fk_element` (`fk_element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_actioncomm_resources`
--

LOCK TABLES `llx_actioncomm_resources` WRITE;
/*!40000 ALTER TABLE `llx_actioncomm_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_actioncomm_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_adherent`
--

DROP TABLE IF EXISTS `llx_adherent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_adherent` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(128) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `fk_adherent_type` int NOT NULL,
  `morphy` varchar(3) NOT NULL,
  `societe` varchar(128) DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `address` text,
  `zip` varchar(30) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `country` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `socialnetworks` text,
  `phone` varchar(30) DEFAULT NULL,
  `phone_perso` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `statut` smallint NOT NULL DEFAULT '0',
  `public` smallint NOT NULL DEFAULT '0',
  `datefin` datetime DEFAULT NULL,
  `default_lang` varchar(6) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `datevalid` datetime DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_mod` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_adherent_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_adherent_login` (`login`,`entity`),
  UNIQUE KEY `uk_adherent_fk_soc` (`fk_soc`),
  KEY `idx_adherent_fk_adherent_type` (`fk_adherent_type`),
  CONSTRAINT `adherent_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_adherent_adherent_type` FOREIGN KEY (`fk_adherent_type`) REFERENCES `llx_adherent_type` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent`
--

LOCK TABLES `llx_adherent` WRITE;
/*!40000 ALTER TABLE `llx_adherent` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_adherent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_adherent_extrafields`
--

DROP TABLE IF EXISTS `llx_adherent_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_adherent_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_adherent_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent_extrafields`
--

LOCK TABLES `llx_adherent_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_adherent_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_adherent_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_adherent_type`
--

DROP TABLE IF EXISTS `llx_adherent_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_adherent_type` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statut` smallint NOT NULL DEFAULT '0',
  `libelle` varchar(50) NOT NULL,
  `morphy` varchar(3) NOT NULL,
  `duration` varchar(6) DEFAULT NULL,
  `subscription` varchar(3) NOT NULL DEFAULT '1',
  `amount` double(24,8) DEFAULT NULL,
  `caneditamount` int DEFAULT '0',
  `vote` varchar(3) NOT NULL DEFAULT '1',
  `note` text,
  `mail_valid` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_adherent_type_libelle` (`libelle`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent_type`
--

LOCK TABLES `llx_adherent_type` WRITE;
/*!40000 ALTER TABLE `llx_adherent_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_adherent_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_adherent_type_extrafields`
--

DROP TABLE IF EXISTS `llx_adherent_type_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_adherent_type_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_adherent_type_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent_type_extrafields`
--

LOCK TABLES `llx_adherent_type_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_adherent_type_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_adherent_type_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_adherent_type_lang`
--

DROP TABLE IF EXISTS `llx_adherent_type_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_adherent_type_lang` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_type` int NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  `email` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_adherent_type_lang`
--

LOCK TABLES `llx_adherent_type_lang` WRITE;
/*!40000 ALTER TABLE `llx_adherent_type_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_adherent_type_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bank`
--

DROP TABLE IF EXISTS `llx_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bank` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datev` date DEFAULT NULL,
  `dateo` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `amount_main_currency` double(24,8) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `fk_account` int DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_rappro` int DEFAULT NULL,
  `fk_type` varchar(6) DEFAULT NULL,
  `num_releve` varchar(50) DEFAULT NULL,
  `num_chq` varchar(50) DEFAULT NULL,
  `numero_compte` varchar(32) DEFAULT NULL,
  `rappro` tinyint DEFAULT '0',
  `note` text,
  `fk_bordereau` int DEFAULT '0',
  `position` int DEFAULT '0',
  `banque` varchar(255) DEFAULT NULL,
  `emetteur` varchar(255) DEFAULT NULL,
  `author` varchar(40) DEFAULT NULL,
  `origin_id` int DEFAULT NULL,
  `origin_type` varchar(64) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bank_datev` (`datev`),
  KEY `idx_bank_dateo` (`dateo`),
  KEY `idx_bank_fk_account` (`fk_account`),
  KEY `idx_bank_rappro` (`rappro`),
  KEY `idx_bank_num_releve` (`num_releve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank`
--

LOCK TABLES `llx_bank` WRITE;
/*!40000 ALTER TABLE `llx_bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bank_account`
--

DROP TABLE IF EXISTS `llx_bank_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bank_account` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(12) NOT NULL,
  `label` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `bank` varchar(60) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `country_iban` varchar(2) DEFAULT NULL,
  `cle_iban` varchar(2) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `pti_in_ctti` smallint DEFAULT '0',
  `state_id` int DEFAULT NULL,
  `fk_pays` int NOT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `owner_zip` varchar(25) DEFAULT NULL,
  `owner_town` varchar(50) DEFAULT NULL,
  `owner_country_id` int DEFAULT NULL,
  `courant` smallint NOT NULL DEFAULT '0',
  `clos` smallint NOT NULL DEFAULT '0',
  `rappro` smallint DEFAULT '1',
  `url` varchar(128) DEFAULT NULL,
  `account_number` varchar(32) DEFAULT NULL,
  `fk_accountancy_journal` int DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `min_allowed` int DEFAULT '0',
  `min_desired` int DEFAULT '0',
  `comment` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `ics` varchar(32) DEFAULT NULL,
  `ics_transfer` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bank_account_label` (`label`,`entity`),
  KEY `idx_fk_accountancy_journal` (`fk_accountancy_journal`),
  CONSTRAINT `fk_bank_account_accountancy_journal` FOREIGN KEY (`fk_accountancy_journal`) REFERENCES `llx_accounting_journal` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_account`
--

LOCK TABLES `llx_bank_account` WRITE;
/*!40000 ALTER TABLE `llx_bank_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bank_account_extrafields`
--

DROP TABLE IF EXISTS `llx_bank_account_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bank_account_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bank_account_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_account_extrafields`
--

LOCK TABLES `llx_bank_account_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_bank_account_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_account_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bank_categ`
--

DROP TABLE IF EXISTS `llx_bank_categ`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bank_categ` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_categ`
--

LOCK TABLES `llx_bank_categ` WRITE;
/*!40000 ALTER TABLE `llx_bank_categ` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_categ` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bank_class`
--

DROP TABLE IF EXISTS `llx_bank_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bank_class` (
  `lineid` int NOT NULL,
  `fk_categ` int NOT NULL,
  UNIQUE KEY `uk_bank_class_lineid` (`lineid`,`fk_categ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_class`
--

LOCK TABLES `llx_bank_class` WRITE;
/*!40000 ALTER TABLE `llx_bank_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bank_extrafields`
--

DROP TABLE IF EXISTS `llx_bank_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bank_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bank_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_extrafields`
--

LOCK TABLES `llx_bank_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_bank_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bank_url`
--

DROP TABLE IF EXISTS `llx_bank_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bank_url` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_bank` int DEFAULT NULL,
  `url_id` int DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(24) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bank_url` (`fk_bank`,`url_id`,`type`),
  KEY `idx_bank_url_url_id` (`url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bank_url`
--

LOCK TABLES `llx_bank_url` WRITE;
/*!40000 ALTER TABLE `llx_bank_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bank_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_blockedlog`
--

DROP TABLE IF EXISTS `llx_blockedlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_blockedlog` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action` varchar(50) DEFAULT NULL,
  `amounts` double(24,8) NOT NULL,
  `element` varchar(50) DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `user_fullname` varchar(255) DEFAULT NULL,
  `fk_object` int DEFAULT NULL,
  `ref_object` varchar(255) DEFAULT NULL,
  `date_object` datetime DEFAULT NULL,
  `signature` varchar(100) NOT NULL,
  `signature_line` varchar(100) NOT NULL,
  `object_data` mediumtext,
  `object_version` varchar(32) DEFAULT '',
  `certified` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `signature` (`signature`),
  KEY `fk_object_element` (`fk_object`,`element`),
  KEY `entity` (`entity`),
  KEY `fk_user` (`fk_user`),
  KEY `entity_action` (`entity`,`action`),
  KEY `entity_action_certified` (`entity`,`action`,`certified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_blockedlog`
--

LOCK TABLES `llx_blockedlog` WRITE;
/*!40000 ALTER TABLE `llx_blockedlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_blockedlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_blockedlog_authority`
--

DROP TABLE IF EXISTS `llx_blockedlog_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_blockedlog_authority` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `blockchain` longtext NOT NULL,
  `signature` varchar(100) NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  KEY `signature` (`signature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_blockedlog_authority`
--

LOCK TABLES `llx_blockedlog_authority` WRITE;
/*!40000 ALTER TABLE `llx_blockedlog_authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_blockedlog_authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bom_bom`
--

DROP TABLE IF EXISTS `llx_bom_bom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bom_bom` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref` varchar(128) NOT NULL,
  `bomtype` int DEFAULT '0',
  `label` varchar(255) DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `description` text,
  `note_public` text,
  `note_private` text,
  `fk_warehouse` int DEFAULT NULL,
  `qty` double(24,8) DEFAULT NULL,
  `efficiency` double(24,8) DEFAULT '1.00000000',
  `duration` double(24,8) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bom_bom_ref` (`ref`,`entity`),
  KEY `idx_bom_bom_rowid` (`rowid`),
  KEY `idx_bom_bom_ref` (`ref`),
  KEY `llx_bom_bom_fk_user_creat` (`fk_user_creat`),
  KEY `idx_bom_bom_status` (`status`),
  KEY `idx_bom_bom_fk_product` (`fk_product`),
  CONSTRAINT `llx_bom_bom_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bom_bom`
--

LOCK TABLES `llx_bom_bom` WRITE;
/*!40000 ALTER TABLE `llx_bom_bom` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bom_bom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bom_bom_extrafields`
--

DROP TABLE IF EXISTS `llx_bom_bom_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bom_bom_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bom_bom_extrafields_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bom_bom_extrafields`
--

LOCK TABLES `llx_bom_bom_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_bom_bom_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bom_bom_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bom_bomline`
--

DROP TABLE IF EXISTS `llx_bom_bomline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bom_bomline` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_bom` int NOT NULL,
  `fk_product` int NOT NULL,
  `fk_bom_child` int DEFAULT NULL,
  `description` text,
  `import_key` varchar(14) DEFAULT NULL,
  `qty` double(24,8) NOT NULL,
  `qty_frozen` smallint DEFAULT '0',
  `disable_stock_change` smallint DEFAULT '0',
  `efficiency` double(24,8) NOT NULL DEFAULT '1.00000000',
  `fk_unit` int DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `fk_default_workstation` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bom_bomline_rowid` (`rowid`),
  KEY `idx_bom_bomline_fk_product` (`fk_product`),
  KEY `idx_bom_bomline_fk_bom` (`fk_bom`),
  CONSTRAINT `llx_bom_bomline_fk_bom` FOREIGN KEY (`fk_bom`) REFERENCES `llx_bom_bom` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bom_bomline`
--

LOCK TABLES `llx_bom_bomline` WRITE;
/*!40000 ALTER TABLE `llx_bom_bomline` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bom_bomline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bom_bomline_extrafields`
--

DROP TABLE IF EXISTS `llx_bom_bomline_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bom_bomline_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bom_bomline_extrafields`
--

LOCK TABLES `llx_bom_bomline_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_bom_bomline_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bom_bomline_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bookmark`
--

DROP TABLE IF EXISTS `llx_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bookmark` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_user` int NOT NULL,
  `dateb` datetime DEFAULT NULL,
  `url` text,
  `target` varchar(16) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `favicon` varchar(24) DEFAULT NULL,
  `position` int DEFAULT '0',
  `entity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bookmark_title` (`fk_user`,`entity`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bookmark`
--

LOCK TABLES `llx_bookmark` WRITE;
/*!40000 ALTER TABLE `llx_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_bordereau_cheque`
--

DROP TABLE IF EXISTS `llx_bordereau_cheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_bordereau_cheque` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `type` varchar(6) DEFAULT 'CHQ',
  `datec` datetime NOT NULL,
  `date_bordereau` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `nbcheque` smallint NOT NULL,
  `fk_bank_account` int DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `statut` smallint NOT NULL DEFAULT '0',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text,
  `entity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bordereau_cheque` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_bordereau_cheque`
--

LOCK TABLES `llx_bordereau_cheque` WRITE;
/*!40000 ALTER TABLE `llx_bordereau_cheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_bordereau_cheque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_boxes`
--

DROP TABLE IF EXISTS `llx_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_boxes` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `box_id` int NOT NULL,
  `position` smallint NOT NULL,
  `box_order` varchar(3) NOT NULL,
  `fk_user` int NOT NULL DEFAULT '0',
  `maxline` int DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_boxes` (`entity`,`box_id`,`position`,`fk_user`),
  KEY `idx_boxes_boxid` (`box_id`),
  KEY `idx_boxes_fk_user` (`fk_user`),
  CONSTRAINT `fk_boxes_box_id` FOREIGN KEY (`box_id`) REFERENCES `llx_boxes_def` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_boxes`
--

LOCK TABLES `llx_boxes` WRITE;
/*!40000 ALTER TABLE `llx_boxes` DISABLE KEYS */;
INSERT INTO `llx_boxes` VALUES
(1,'0',1,0,NULL,NULL,0,1),
(2,'0',1,0,NULL,NULL,0,2),
(3,'0',1,0,NULL,NULL,0,3),
(4,'0',1,0,NULL,NULL,0,4),
(5,'0',1,0,NULL,NULL,0,5),
(6,'0',1,0,NULL,NULL,0,6),
(7,'0',1,0,NULL,NULL,0,7),
(8,'0',1,0,NULL,NULL,0,8);
/*!40000 ALTER TABLE `llx_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_boxes_def`
--

DROP TABLE IF EXISTS `llx_boxes_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_boxes_def` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `file` varchar(200) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_user` int NOT NULL DEFAULT '0',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_boxes_def` (`file`,`entity`,`note`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_boxes_def`
--

LOCK TABLES `llx_boxes_def` WRITE;
/*!40000 ALTER TABLE `llx_boxes_def` DISABLE KEYS */;
INSERT INTO `llx_boxes_def` VALUES
(1,'box_lastlogin.php',0,NULL,1,'2023-11-27 09:34:21'),
(1,'box_birthdays.php',0,NULL,2,'2023-11-27 09:34:21'),
(1,'box_dolibarr_state_board.php',0,NULL,3,'2023-11-27 09:34:21'),
(1,'box_clients.php',0,NULL,4,'2023-11-27 09:34:21'),
(1,'box_prospect.php',0,NULL,5,'2023-11-27 09:34:21'),
(1,'box_contacts.php',0,NULL,6,'2023-11-27 09:34:21'),
(1,'box_activity.php',0,'(WarningUsingThisBoxSlowDown)',7,'2023-11-27 09:34:21'),
(1,'box_goodcustomers.php',0,'(WarningUsingThisBoxSlowDown)',8,'2023-11-27 09:34:21');
/*!40000 ALTER TABLE `llx_boxes_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_budget`
--

DROP TABLE IF EXISTS `llx_budget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_budget` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `label` varchar(255) NOT NULL,
  `status` int DEFAULT NULL,
  `note` text,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_budget`
--

LOCK TABLES `llx_budget` WRITE;
/*!40000 ALTER TABLE `llx_budget` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_budget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_budget_lines`
--

DROP TABLE IF EXISTS `llx_budget_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_budget_lines` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_budget` int NOT NULL,
  `fk_project_ids` varchar(180) NOT NULL,
  `amount` double(24,8) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_budget_lines` (`fk_budget`,`fk_project_ids`),
  CONSTRAINT `fk_budget_lines_budget` FOREIGN KEY (`fk_budget`) REFERENCES `llx_budget` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_budget_lines`
--

LOCK TABLES `llx_budget_lines` WRITE;
/*!40000 ALTER TABLE `llx_budget_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_budget_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_accounting_category`
--

DROP TABLE IF EXISTS `llx_c_accounting_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_accounting_category` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `code` varchar(16) NOT NULL,
  `label` varchar(255) NOT NULL,
  `range_account` varchar(255) NOT NULL,
  `sens` tinyint NOT NULL DEFAULT '0',
  `category_type` tinyint NOT NULL DEFAULT '0',
  `formula` varchar(255) NOT NULL,
  `position` int DEFAULT '0',
  `fk_country` int DEFAULT NULL,
  `active` int DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_accounting_category` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_accounting_category`
--

LOCK TABLES `llx_c_accounting_category` WRITE;
/*!40000 ALTER TABLE `llx_c_accounting_category` DISABLE KEYS */;
INSERT INTO `llx_c_accounting_category` VALUES
(1,0,'INCOMES',1,0,'','Income of products/services',10,'Example: 7xxxxx',1,0),
(1,0,'EXPENSES',1,0,'','Expenses of products/services',20,'Example: 6xxxxx',2,0),
(1,1,'PROFIT',1,0,'INCOMES+EXPENSES','Balance',30,'',3,0);
/*!40000 ALTER TABLE `llx_c_accounting_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_action_trigger`
--

DROP TABLE IF EXISTS `llx_c_action_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_action_trigger` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `elementtype` varchar(64) NOT NULL,
  `code` varchar(128) NOT NULL,
  `contexts` varchar(255) DEFAULT NULL,
  `label` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rang` int DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_action_trigger_code` (`code`),
  KEY `idx_action_trigger_rang` (`rang`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_action_trigger`
--

LOCK TABLES `llx_c_action_trigger` WRITE;
/*!40000 ALTER TABLE `llx_c_action_trigger` DISABLE KEYS */;
INSERT INTO `llx_c_action_trigger` VALUES
('COMPANY_CREATE',NULL,'Executed when a third party is created','societe','Third party created',1,1),
('COMPANY_MODIFY',NULL,'Executed when you update third party','societe','Third party update',1,2),
('COMPANY_SENTBYMAIL',NULL,'Executed when you send email from third party card','societe','Mails sent from third party card',1,3),
('COMPANY_DELETE',NULL,'Executed when you delete third party','societe','Third party deleted',1,4),
('PROPAL_VALIDATE',NULL,'Executed when a commercial proposal is validated','propal','Customer proposal validated',2,5),
('PROPAL_MODIFY',NULL,'Executed when a customer proposal is modified','propal','Customer proposal modified',2,6),
('PROPAL_SENTBYMAIL',NULL,'Executed when a commercial proposal is sent by mail','propal','Commercial proposal sent by mail',3,7),
('PROPAL_CLOSE_SIGNED',NULL,'Executed when a customer proposal is closed signed','propal','Customer proposal closed signed',2,8),
('PROPAL_CLOSE_REFUSED',NULL,'Executed when a customer proposal is closed refused','propal','Customer proposal closed refused',2,9),
('PROPAL_CLASSIFY_BILLED',NULL,'Executed when a customer proposal is set to billed','propal','Customer proposal set billed',2,10),
('PROPAL_DELETE',NULL,'Executed when a customer proposal is deleted','propal','Customer proposal deleted',2,11),
('ORDER_VALIDATE',NULL,'Executed when a customer order is validated','commande','Customer order validate',4,12),
('ORDER_CLOSE',NULL,'Executed when a customer order is set delivered','commande','Customer order classify delivered',5,13),
('ORDER_MODIFY',NULL,'Executed when a customer order is set modified','commande','Customer order modified',5,14),
('ORDER_CLASSIFY_BILLED',NULL,'Executed when a customer order is set to billed','commande','Customer order classify billed',5,15),
('ORDER_CANCEL',NULL,'Executed when a customer order is canceled','commande','Customer order canceled',5,16),
('ORDER_SENTBYMAIL',NULL,'Executed when a customer order is sent by mail ','commande','Customer order sent by mail',5,17),
('ORDER_DELETE',NULL,'Executed when a customer order is deleted','commande','Customer order deleted',5,18),
('BILL_VALIDATE',NULL,'Executed when a customer invoice is approved','facture','Customer invoice validated',6,19),
('BILL_MODIFY',NULL,'Executed when a customer invoice is modified','facture','Customer invoice modified',7,20),
('BILL_PAYED',NULL,'Executed when a customer invoice is payed','facture','Customer invoice payed',7,21),
('BILL_CANCEL',NULL,'Executed when a customer invoice is conceled','facture','Customer invoice canceled',8,22),
('BILL_SENTBYMAIL',NULL,'Executed when a customer invoice is sent by mail','facture','Customer invoice sent by mail',9,23),
('BILL_UNVALIDATE',NULL,'Executed when a customer invoice status set back to draft','facture','Customer invoice unvalidated',9,24),
('BILL_DELETE',NULL,'Executed when a customer invoice is deleted','facture','Customer invoice deleted',9,25),
('PROPOSAL_SUPPLIER_VALIDATE',NULL,'Executed when a commercial proposal is validated','proposal_supplier','Price request validated',10,26),
('PROPOSAL_SUPPLIER_MODIFY',NULL,'Executed when a commercial proposal is modified','proposal_supplier','Price request modified',10,27),
('PROPOSAL_SUPPLIER_SENTBYMAIL',NULL,'Executed when a commercial proposal is sent by mail','proposal_supplier','Price request sent by mail',10,28),
('PROPOSAL_SUPPLIER_CLOSE_SIGNED',NULL,'Executed when a customer proposal is closed signed','proposal_supplier','Price request closed signed',10,29),
('PROPOSAL_SUPPLIER_CLOSE_REFUSED',NULL,'Executed when a customer proposal is closed refused','proposal_supplier','Price request closed refused',10,30),
('PROPOSAL_SUPPLIER_DELETE',NULL,'Executed when a customer proposal delete','proposal_supplier','Price request deleted',10,31),
('ORDER_SUPPLIER_VALIDATE',NULL,'Executed when a supplier order is validated','order_supplier','Supplier order validated',12,32),
('ORDER_SUPPLIER_APPROVE',NULL,'Executed when a supplier order is approved','order_supplier','Supplier order request approved',13,33),
('ORDER_SUPPLIER_MODIFY',NULL,'Executed when a supplier order is modified','order_supplier','Supplier order request modified',13,34),
('ORDER_SUPPLIER_SUBMIT',NULL,'Executed when a supplier order is approved','order_supplier','Supplier order request submited',13,35),
('ORDER_SUPPLIER_RECEIVE',NULL,'Executed when a supplier order is received','order_supplier','Supplier order request received',13,36),
('ORDER_SUPPLIER_REFUSE',NULL,'Executed when a supplier order is refused','order_supplier','Supplier order request refused',13,37),
('ORDER_SUPPLIER_CANCEL',NULL,'Executed when a supplier order is canceled','order_supplier','Supplier order request canceled',13,38),
('ORDER_SUPPLIER_SENTBYMAIL',NULL,'Executed when a supplier order is sent by mail','order_supplier','Supplier order sent by mail',14,39),
('ORDER_SUPPLIER_CLASSIFY_BILLED',NULL,'Executed when a supplier order is set as billed','order_supplier','Supplier order set billed',14,40),
('ORDER_SUPPLIER_DELETE',NULL,'Executed when a supplier order is deleted','order_supplier','Supplier order deleted',14,41),
('BILL_SUPPLIER_VALIDATE',NULL,'Executed when a supplier invoice is validated','invoice_supplier','Supplier invoice validated',15,42),
('BILL_SUPPLIER_MODIFY',NULL,'Executed when a supplier invoice is modified','invoice_supplier','Supplier invoice modified',15,43),
('BILL_SUPPLIER_UNVALIDATE',NULL,'Executed when a supplier invoice status is set back to draft','invoice_supplier','Supplier invoice unvalidated',15,44),
('BILL_SUPPLIER_PAYED',NULL,'Executed when a supplier invoice is payed','invoice_supplier','Supplier invoice payed',16,45),
('BILL_SUPPLIER_SENTBYMAIL',NULL,'Executed when a supplier invoice is sent by mail','invoice_supplier','Supplier invoice sent by mail',17,46),
('BILL_SUPPLIER_CANCELED',NULL,'Executed when a supplier invoice is cancelled','invoice_supplier','Supplier invoice cancelled',17,47),
('BILL_SUPPLIER_DELETE',NULL,'Executed when a supplier invoice is deleted','invoice_supplier','Supplier invoice deleted',17,48),
('CONTRACT_VALIDATE',NULL,'Executed when a contract is validated','contrat','Contract validated',18,49),
('CONTRACT_MODIFY',NULL,'Executed when a contract is modified','contrat','Contract modified',18,50),
('CONTRACT_SENTBYMAIL',NULL,'Executed when a contract is sent by mail','contrat','Contract sent by mail',18,51),
('CONTRACT_DELETE',NULL,'Executed when a contract is deleted','contrat','Contract deleted',18,52),
('SHIPPING_VALIDATE',NULL,'Executed when a shipping is validated','shipping','Shipping validated',20,53),
('SHIPPING_MODIFY',NULL,'Executed when a shipping is modified','shipping','Shipping modified',20,54),
('SHIPPING_SENTBYMAIL',NULL,'Executed when a shipping is sent by mail','shipping','Shipping sent by mail',21,55),
('SHIPPING_DELETE',NULL,'Executed when a shipping is deleted','shipping','Shipping sent is deleted',21,56),
('RECEPTION_VALIDATE',NULL,'Executed when a reception is validated','reception','Reception validated',22,57),
('RECEPTION_SENTBYMAIL',NULL,'Executed when a reception is sent by mail','reception','Reception sent by mail',22,58),
('MEMBER_VALIDATE',NULL,'Executed when a member is validated','member','Member validated',22,59),
('MEMBER_MODIFY',NULL,'Executed when a member is modified','member','Member modified',23,60),
('MEMBER_SENTBYMAIL',NULL,'Executed when you send email from member card','member','Mails sent from member card',23,61),
('MEMBER_SUBSCRIPTION_CREATE',NULL,'Executed when a member subscribtion is deleted','member','Member subscribtion recorded',24,62),
('MEMBER_SUBSCRIPTION_MODIFY',NULL,'Executed when a member subscribtion is modified','member','Member subscribtion modified',24,63),
('MEMBER_SUBSCRIPTION_DELETE',NULL,'Executed when a member subscribtion is deleted','member','Member subscribtion deleted',24,64),
('MEMBER_RESILIATE',NULL,'Executed when a member is resiliated','member','Member resiliated',25,65),
('MEMBER_DELETE',NULL,'Executed when a member is deleted','member','Member deleted',26,66),
('MEMBER_EXCLUDE',NULL,'Executed when a member is excluded','member','Member excluded',27,67),
('FICHINTER_VALIDATE',NULL,'Executed when a intervention is validated','ficheinter','Intervention validated',30,68),
('FICHINTER_MODIFY',NULL,'Executed when a intervention is modify','ficheinter','Intervention modify',30,69),
('FICHINTER_CLASSIFY_BILLED',NULL,'Executed when a intervention is set to billed (when option FICHINTER_CLASSIFY_BILLED is set)','ficheinter','Intervention set billed',32,70),
('FICHINTER_CLASSIFY_UNBILLED',NULL,'Executed when a intervention is set to unbilled (when option FICHINTER_CLASSIFY_BILLED is set)','ficheinter','Intervention set unbilled',33,71),
('FICHINTER_REOPEN',NULL,'Executed when a intervention is re-opened','ficheinter','Intervention opened',34,72),
('FICHINTER_SENTBYMAIL',NULL,'Executed when a intervention is sent by mail','ficheinter','Intervention sent by mail',35,73),
('FICHINTER_DELETE',NULL,'Executed when a intervention is deleted','ficheinter','Intervention is deleted',35,74),
('PRODUCT_CREATE',NULL,'Executed when a product or sevice is created','product','Product or service created',40,75),
('PRODUCT_MODIFY',NULL,'Executed when a product or sevice is modified','product','Product or service modified',41,76),
('PRODUCT_DELETE',NULL,'Executed when a product or sevice is deleted','product','Product or service deleted',42,77),
('EXPENSE_REPORT_CREATE',NULL,'Executed when an expense report is created','expensereport','Expense report created',201,78),
('EXPENSE_REPORT_VALIDATE',NULL,'Executed when an expense report is validated','expensereport','Expense report validated',202,79),
('EXPENSE_REPORT_MODIFY',NULL,'Executed when an expense report is modified','expensereport','Expense report modified',202,80),
('EXPENSE_REPORT_APPROVE',NULL,'Executed when an expense report is approved','expensereport','Expense report approved',203,81),
('EXPENSE_REPORT_PAID',NULL,'Executed when an expense report is set as billed','expensereport','Expense report billed',204,82),
('EXPENSE_REPORT_DELETE',NULL,'Executed when an expense report is deleted','expensereport','Expense report deleted',205,83),
('PROJECT_CREATE',NULL,'Executed when a project is created','project','Project creation',140,84),
('PROJECT_VALIDATE',NULL,'Executed when a project is validated','project','Project validation',141,85),
('PROJECT_MODIFY',NULL,'Executed when a project is modified','project','Project modified',142,86),
('PROJECT_DELETE',NULL,'Executed when a project is deleted','project','Project deleted',143,87),
('PROJECT_SENTBYMAIL',NULL,'Executed when a project is sent by email','project','Project sent by mail',144,88),
('PROJECT_CLOSE',NULL,'Executed when a project is closed','project','Project closed',145,89),
('TICKET_CREATE',NULL,'Executed when a ticket is created','ticket','Ticket created',161,90),
('TICKET_MODIFY',NULL,'Executed when a ticket is modified','ticket','Ticket modified',163,91),
('TICKET_ASSIGNED',NULL,'Executed when a ticket is modified','ticket','Ticket assigned',164,92),
('TICKET_CLOSE',NULL,'Executed when a ticket is closed','ticket','Ticket closed',165,93),
('TICKET_SENTBYMAIL',NULL,'Executed when a message is sent from the ticket record','ticket','Ticket message sent by email',166,94),
('TICKET_DELETE',NULL,'Executed when a ticket is deleted','ticket','Ticket deleted',167,95),
('USER_SENTBYMAIL',NULL,'Executed when an email is sent from user card','user','Email sent',300,96),
('USER_CREATE',NULL,'Executed when a user is created','user','User created',301,97),
('USER_MODIFY',NULL,'Executed when a user is updated','user','User update',302,98),
('USER_DELETE',NULL,'Executed when a user is deleted','user','User update',303,99),
('USER_NEW_PASSWORD',NULL,'Executed when a user is change password','user','User update',304,100),
('USER_ENABLEDISABLE',NULL,'Executed when a user is enable or disable','user','User update',305,101),
('BOM_VALIDATE',NULL,'Executed when a BOM is validated','bom','BOM validated',650,103),
('BOM_UNVALIDATE',NULL,'Executed when a BOM is unvalidated','bom','BOM unvalidated',651,104),
('BOM_CLOSE',NULL,'Executed when a BOM is disabled','bom','BOM disabled',652,105),
('BOM_REOPEN',NULL,'Executed when a BOM is re-open','bom','BOM reopen',653,106),
('BOM_DELETE',NULL,'Executed when a BOM deleted','bom','BOM deleted',654,107),
('MRP_MO_VALIDATE',NULL,'Executed when a MO is validated','mrp','MO validated',660,108),
('MRP_MO_PRODUCED',NULL,'Executed when a MO is produced','mrp','MO produced',661,109),
('MRP_MO_DELETE',NULL,'Executed when a MO is deleted','mrp','MO deleted',662,110),
('MRP_MO_CANCEL',NULL,'Executed when a MO is canceled','mrp','MO canceled',663,111),
('CONTACT_CREATE',NULL,'Executed when a contact is created','contact','Contact address created',50,112),
('CONTACT_MODIFY',NULL,'Executed when a contact is updated','contact','Contact address update',51,113),
('CONTACT_SENTBYMAIL',NULL,'Executed when you send email from contact address record','contact','Mails sent from third party card',52,114),
('CONTACT_DELETE',NULL,'Executed when a contact is deleted','contact','Contact address deleted',53,115),
('RECRUITMENTJOBPOSITION_CREATE',NULL,'Executed when a job is created','recruitment','Job created',7500,116),
('RECRUITMENTJOBPOSITION_MODIFY',NULL,'Executed when a job is modified','recruitment','Job modified',7502,117),
('RECRUITMENTJOBPOSITION_SENTBYMAIL',NULL,'Executed when you send email from job record','recruitment','Mails sent from job record',7504,118),
('RECRUITMENTJOBPOSITION_DELETE',NULL,'Executed when a job is deleted','recruitment','Job deleted',7506,119),
('RECRUITMENTCANDIDATURE_CREATE',NULL,'Executed when a candidature is created','recruitment','Candidature created',7510,120),
('RECRUITMENTCANDIDATURE_MODIFY',NULL,'Executed when a candidature is modified','recruitment','Candidature modified',7512,121),
('RECRUITMENTCANDIDATURE_SENTBYMAIL',NULL,'Executed when you send email from candidature record','recruitment','Mails sent from candidature record',7514,122),
('RECRUITMENTCANDIDATURE_DELETE',NULL,'Executed when a candidature is deleted','recruitment','Candidature deleted',7516,123),
('TASK_CREATE',NULL,'Executed when a project task is created','project','Task created',150,124),
('TASK_MODIFY',NULL,'Executed when a project task is modified','project','Task modified',151,125),
('TASK_DELETE',NULL,'Executed when a project task is deleted','project','Task deleted',152,126),
('ACTION_CREATE',NULL,'Executed when an action is added to the agenda','agenda','Action added',700,127),
('HOLIDAY_CREATE',NULL,'Executed when a holiday is created','holiday','Holiday created',800,128),
('HOLIDAY_MODIFY',NULL,'Executed when a holiday is modified','holiday','Holiday modified',801,129),
('HOLIDAY_VALIDATE',NULL,'Executed when a holiday is validated','holiday','Holiday validated',802,130),
('HOLIDAY_APPROVE',NULL,'Executed when a holiday is aprouved','holiday','Holiday approved',803,131),
('HOLIDAY_CANCEL',NULL,'Executed when a holiday is canceled','holiday','Holiday canceled',802,132),
('HOLIDAY_DELETE',NULL,'Executed when a holiday is deleted','holiday','Holiday deleted',804,133),
('BILLREC_CREATE',NULL,'Executed when a Template invoices is created','facturerec','Template invoices created',900,134),
('BILLREC_MODIFY',NULL,'Executed when a Template invoices is updated','facturerec','Template invoices update',901,135),
('BILLREC_DELETE',NULL,'Executed when a Template invoices is deleted','facturerec','Template invoices deleted',902,136),
('BILLREC_AUTOCREATEBILL',NULL,'Executed when a Template invoices is use to create invoice with auto batch','facturerec','Template invoices use to create invoices with auto batch',903,137),
('PARTNERSHIP_CREATE',NULL,'Executed when a partnership is created','partnership','Partnership created',58000,138),
('PARTNERSHIP_MODIFY',NULL,'Executed when a partnership is modified','partnership','Partnership modified',58002,139),
('PARTNERSHIP_SENTBYMAIL',NULL,'Executed when you send email from partnership file','partnership','Mails sent from partnership file',58004,140),
('PARTNERSHIP_DELETE',NULL,'Executed when a partnership is deleted','partnership','Partnership deleted',58006,141);
/*!40000 ALTER TABLE `llx_c_action_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_actioncomm`
--

DROP TABLE IF EXISTS `llx_c_actioncomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_actioncomm` (
  `id` int NOT NULL,
  `code` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'system',
  `libelle` varchar(128) NOT NULL,
  `module` varchar(50) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `todo` tinyint DEFAULT NULL,
  `color` varchar(9) DEFAULT NULL,
  `picto` varchar(48) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_actioncomm` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_actioncomm`
--

LOCK TABLES `llx_c_actioncomm` WRITE;
/*!40000 ALTER TABLE `llx_c_actioncomm` DISABLE KEYS */;
INSERT INTO `llx_c_actioncomm` VALUES
(1,'AC_TEL',NULL,1,'Phone call',NULL,NULL,2,NULL,'system'),
(0,'AC_FAX',NULL,2,'Send Fax',NULL,NULL,3,NULL,'system'),
(0,'AC_EMAIL',NULL,4,'Send Email',NULL,NULL,4,NULL,'system'),
(1,'AC_RDV',NULL,5,'Rendez-vous',NULL,NULL,1,NULL,'system'),
(0,'AC_EMAIL_IN',NULL,6,'Reception Email',NULL,NULL,4,NULL,'system'),
(1,'AC_INT',NULL,11,'Intervention on site',NULL,NULL,4,NULL,'system'),
(1,'AC_OTH_AUTO',NULL,40,'Other (automatically inserted events)',NULL,NULL,20,NULL,'systemauto'),
(1,'AC_OTH',NULL,50,'Other (manually inserted events)',NULL,NULL,5,NULL,'system'),
(1,'AC_EO_ONLINECONF',NULL,60,'Online/Virtual conference','conference@eventorganization',NULL,60,NULL,'module'),
(1,'AC_EO_INDOORCONF',NULL,61,'Indoor conference','conference@eventorganization',NULL,61,NULL,'module'),
(1,'AC_EO_ONLINEBOOTH',NULL,62,'Online/Virtual booth','booth@eventorganization',NULL,62,NULL,'module'),
(1,'AC_EO_INDOORBOOTH',NULL,63,'Indoor booth','booth@eventorganization',NULL,63,NULL,'module');
/*!40000 ALTER TABLE `llx_c_actioncomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_availability`
--

DROP TABLE IF EXISTS `llx_c_availability`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_availability` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `label` varchar(128) NOT NULL,
  `type_duration` varchar(1) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_availability` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_availability`
--

LOCK TABLES `llx_c_availability` WRITE;
/*!40000 ALTER TABLE `llx_c_availability` DISABLE KEYS */;
INSERT INTO `llx_c_availability` VALUES
(1,'AV_NOW','Immediate',10,0,1,NULL),
(1,'AV_1D','1 day',11,1,2,'d'),
(1,'AV_2D','2 days',12,2,3,'d'),
(1,'AV_3D','3 days',13,3,4,'d'),
(1,'AV_4D','4 days',14,4,5,'d'),
(1,'AV_5D','5 days',15,5,6,'d'),
(1,'AV_1W','1 week',20,1,7,'w'),
(1,'AV_2W','2 weeks',30,2,8,'w'),
(1,'AV_3W','3 weeks',40,3,9,'w'),
(1,'AV_4W','4 weeks',50,4,10,'w'),
(1,'AV_5W','5 weeks',60,5,11,'w'),
(1,'AV_6W','6 weeks',70,6,12,'w'),
(1,'AV_8W','8 weeks',80,8,13,'w'),
(1,'AV_10W','10 weeks',90,10,14,'w'),
(1,'AV_12W','12 weeks',100,12,15,'w'),
(1,'AV_14W','14 weeks',110,14,16,'w'),
(1,'AV_16W','16 weeks',120,16,17,'w');
/*!40000 ALTER TABLE `llx_c_availability` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_barcode_type`
--

DROP TABLE IF EXISTS `llx_c_barcode_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_barcode_type` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `libelle` varchar(128) NOT NULL,
  `coder` varchar(16) NOT NULL,
  `example` varchar(16) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_barcode_type` (`code`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_barcode_type`
--

LOCK TABLES `llx_c_barcode_type` WRITE;
/*!40000 ALTER TABLE `llx_c_barcode_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_barcode_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_chargesociales`
--

DROP TABLE IF EXISTS `llx_c_chargesociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_chargesociales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(128) DEFAULT NULL,
  `deductible` smallint NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  `code` varchar(12) NOT NULL,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `fk_pays` int NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10214 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_chargesociales`
--

LOCK TABLES `llx_c_chargesociales` WRITE;
/*!40000 ALTER TABLE `llx_c_chargesociales` DISABLE KEYS */;
INSERT INTO `llx_c_chargesociales` VALUES
(NULL,1,'TAXSECU',1,1,1,'Securite sociale (URSSAF / MSA)',NULL),
(NULL,1,'TAXSSI',1,1,2,'Securite sociale des indépendants (URSSAF)',NULL),
(NULL,1,'TAXAPP',1,1,10,'Taxe apprentissage',NULL),
(NULL,1,'TAXFPC',1,1,11,'Formation professionnelle continue',NULL),
(NULL,1,'TAXCFE',1,1,12,'Cotisation fonciere des entreprises (CFE)',NULL),
(NULL,1,'TAXCVAE',1,1,13,'Cotisation sur la valeur ajoutee des entreprises (CVAE)',NULL),
(NULL,1,'TAXFON',1,1,20,'Taxe fonciere',NULL),
(NULL,1,'TAXPAS',0,1,25,'Prelevement à la source (PAS)',NULL),
(NULL,1,'TAXPREV',1,1,30,'Prevoyance',NULL),
(NULL,1,'TAXMUT',1,1,40,'Mutuelle',NULL),
(NULL,1,'TAXRET',1,1,50,'Retraite',NULL),
(NULL,1,'TAXTVS',0,1,60,'Taxe sur vehicule societe (TVS)',NULL),
(NULL,1,'TAXIS',0,1,70,'impôts sur les sociétés (IS)',NULL),
(NULL,1,'TAXBEONSS',1,2,201,'ONSS',NULL),
(NULL,1,'TAXBEPREPRO',1,2,210,'Precompte professionnel',NULL),
(NULL,1,'TAXBEPRIEXI',1,2,220,'Prime existence',NULL),
(NULL,1,'TAXBEPREIMMO',1,2,230,'Precompte immobilier',NULL),
(NULL,1,'TAXATKV',1,41,4101,'Krankenversicherung',NULL),
(NULL,1,'TAXATUV',1,41,4102,'Unfallversicherung',NULL),
(NULL,1,'TAXATPV',1,41,4103,'Pensionsversicherung',NULL),
(NULL,1,'TAXATAV',1,41,4104,'Arbeitslosenversicherung',NULL),
(NULL,1,'TAXATIESG',1,41,4105,'Insolvenzentgeltsicherungsfond',NULL),
(NULL,1,'TAXATWF',1,41,4106,'Wohnbauförderung',NULL),
(NULL,1,'TAXATAK',1,41,4107,'Arbeiterkammerumlage',NULL),
(NULL,1,'TAXATMVK',1,41,4108,'Mitarbeitervorsorgekasse',NULL),
(NULL,1,'TAXATFLAF',1,41,4109,'Familienlastenausgleichsfond',NULL),
(NULL,1,'ΑΠΔ',1,102,10201,'Αναλυτική Περιοδική Δήλωση (ΑΠΔ)',NULL),
(NULL,1,'ΦΜΥ',1,102,10202,'Φόρος Μισθωτών Υπηρεσιών (ΦΜΥ)',NULL),
(NULL,1,'ΕΦΚΑ',1,102,10203,'Ασφαλιστικές εισφορές (ΕΦΚΑ)',NULL),
(NULL,1,'ΕΦΟΡΙΑ',0,102,10204,'Προκαταβολή Φόρου Εισοδήματος',NULL),
(NULL,1,'ΕΝΦΙΑ',0,102,10205,'Ενιαίος Φόρος Ιδιοκτησίας Ακινήτων (ΕΝ.Φ.Ι.Α) ',NULL),
(NULL,1,'ΓΕΜΗ',1,102,10206,'Ετήσιο τέλος διατήρησης Μερίδας στο Γ.Ε.ΜΗ.',NULL),
(NULL,1,'ΕΕ',1,102,10207,'Επαγγελματικό Επιμελητήριο',NULL),
(NULL,1,'ΕΒΕ',1,102,10208,'Εμπορικό και Βιομηχανικό Επιμελητηρίο',NULL),
(NULL,1,'ΤΕΛΗ',1,102,10209,'Τέλη Κυκλοφορίας',NULL),
(NULL,1,'ΑΣΦΑΛΕΙΑ',1,102,10210,'Ασφάλιση οχήματος',NULL),
(NULL,1,'ΕΝΟΙΚΙΟ',1,102,10211,'Ενοίκιο',NULL),
(NULL,1,'ΚΟΙΝΟ',1,102,10212,'Κοινόχρηστα',NULL),
(NULL,1,'ΡΕΥΜΑ',1,102,10213,'Ηλεκτροδότηση',NULL);
/*!40000 ALTER TABLE `llx_c_chargesociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_civility`
--

DROP TABLE IF EXISTS `llx_c_civility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_civility` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_civility` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_civility`
--

LOCK TABLES `llx_c_civility` WRITE;
/*!40000 ALTER TABLE `llx_c_civility` DISABLE KEYS */;
INSERT INTO `llx_c_civility` VALUES
(1,'MME','Madame',NULL,1),
(1,'MR','Monsieur',NULL,2),
(1,'MLE','Mademoiselle',NULL,3),
(1,'MTRE','Maître',NULL,4),
(1,'DR','Docteur',NULL,5);
/*!40000 ALTER TABLE `llx_c_civility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_country`
--

DROP TABLE IF EXISTS `llx_c_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_country` (
  `rowid` int NOT NULL,
  `code` varchar(2) NOT NULL,
  `code_iso` varchar(3) DEFAULT NULL,
  `numeric_code` varchar(3) DEFAULT NULL,
  `label` varchar(128) NOT NULL,
  `eec` tinyint NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  `favorite` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_c_country_code` (`code`),
  UNIQUE KEY `idx_c_country_label` (`label`),
  UNIQUE KEY `idx_c_country_code_iso` (`code_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_country`
--

LOCK TABLES `llx_c_country` WRITE;
/*!40000 ALTER TABLE `llx_c_country` DISABLE KEYS */;
INSERT INTO `llx_c_country` VALUES
(1,'',NULL,0,1,'-',NULL,0),
(1,'FR','FRA',1,0,'France','250',1),
(1,'BE','BEL',1,0,'Belgium','056',2),
(1,'IT','ITA',1,0,'Italy','380',3),
(1,'ES','ESP',1,0,'Spain','724',4),
(1,'DE','DEU',1,0,'Germany','276',5),
(1,'CH','CHE',0,0,'Switzerland','756',6),
(1,'GB','GBR',0,0,'United Kingdom','826',7),
(1,'IE','IRL',1,0,'Ireland','372',8),
(1,'CN','CHN',0,0,'China','156',9),
(1,'TN','TUN',0,0,'Tunisia','788',10),
(1,'US','USA',0,0,'United States','840',11),
(1,'MA','MAR',0,0,'Morocco','504',12),
(1,'DZ','DZA',0,0,'Algeria','012',13),
(1,'CA','CAN',0,0,'Canada','124',14),
(1,'TG','TGO',0,0,'Togo','768',15),
(1,'GA','GAB',0,0,'Gabon','266',16),
(1,'NL','NLD',1,0,'Netherlands','528',17),
(1,'HU','HUN',1,0,'Hungary','348',18),
(1,'RU','RUS',0,0,'Russia','643',19),
(1,'SE','SWE',1,0,'Sweden','752',20),
(1,'CI','CIV',0,0,'Côte d\'Ivoire','384',21),
(1,'SN','SEN',0,0,'Senegal','686',22),
(1,'AR','ARG',0,0,'Argentina','032',23),
(1,'CM','CMR',0,0,'Cameroun','120',24),
(1,'PT','PRT',1,0,'Portugal','620',25),
(1,'SA','SAU',0,0,'Saudi Arabia','682',26),
(1,'MC','MCO',1,0,'Monaco','492',27),
(1,'AU','AUS',0,0,'Australia','036',28),
(1,'SG','SGP',0,0,'Singapore','702',29),
(1,'AF','AFG',0,0,'Afghanistan','004',30),
(1,'AX','ALA',0,0,'Åland Island','248',31),
(1,'AL','ALB',0,0,'Albania','008',32),
(1,'AS','ASM',0,0,'American Samoa','016',33),
(1,'AD','AND',0,0,'Andorra','020',34),
(1,'AO','AGO',0,0,'Angola','024',35),
(1,'AI','AIA',0,0,'Anguilla','660',36),
(1,'AQ','ATA',0,0,'Antarctica','010',37),
(1,'AG','ATG',0,0,'Antigua and Barbuda','028',38),
(1,'AM','ARM',0,0,'Armenia','051',39),
(1,'AW','ABW',0,0,'Aruba','533',40),
(1,'AT','AUT',1,0,'Austria','040',41),
(1,'AZ','AZE',0,0,'Azerbaijan','031',42),
(1,'BS','BHS',0,0,'Bahamas','044',43),
(1,'BH','BHR',0,0,'Bahrain','048',44),
(1,'BD','BGD',0,0,'Bangladesh','050',45),
(1,'BB','BRB',0,0,'Barbados','052',46),
(1,'BY','BLR',0,0,'Belarus','112',47),
(1,'BZ','BLZ',0,0,'Belize','084',48),
(1,'BJ','BEN',0,0,'Benin','204',49),
(1,'BM','BMU',0,0,'Bermuda','060',50),
(1,'BT','BTN',0,0,'Bhutan','064',51),
(1,'BO','BOL',0,0,'Bolivia','068',52),
(1,'BA','BIH',0,0,'Bosnia and Herzegovina','070',53),
(1,'BW','BWA',0,0,'Botswana','072',54),
(0,'BV','BVT',0,0,'Bouvet Island','074',55),
(1,'BR','BRA',0,0,'Brazil','076',56),
(1,'IO','IOT',0,0,'British Indian Ocean Territory','086',57),
(1,'BN','BRN',0,0,'Brunei','096',58),
(1,'BG','BGR',1,0,'Bulgaria','100',59),
(1,'BF','BFA',0,0,'Burkina Faso','854',60),
(1,'BI','BDI',0,0,'Burundi','108',61),
(1,'KH','KHM',0,0,'Cambodge / Cambodia','116',62),
(1,'CV','CPV',0,0,'Cap-Vert','132',63),
(1,'KY','CYM',0,0,'Iles Cayman','136',64),
(1,'CF','CAF',0,0,'Central African Republic (CAR/RCA)','140',65),
(1,'TD','TCD',0,0,'Tchad','148',66),
(1,'CL','CHL',0,0,'Chile','152',67),
(1,'CX','CXR',0,0,'Ile Christmas','162',68),
(1,'CC','CCK',0,0,'Iles des Cocos (Keeling)','166',69),
(1,'CO','COL',0,0,'Colombie','170',70),
(1,'KM','COM',0,0,'Comores','174',71),
(1,'CG','COG',0,0,'Congo','178',72),
(1,'CD','COD',0,0,'DR Congo (RDC)','180',73),
(1,'CK','COK',0,0,'Iles Cook','184',74),
(1,'CR','CRI',0,0,'Costa Rica','188',75),
(1,'HR','HRV',1,0,'Croatia','191',76),
(1,'CU','CUB',0,0,'Cuba','192',77),
(1,'CY','CYP',1,0,'Cyprus','196',78),
(1,'CZ','CZE',1,0,'Czech Republic','203',79),
(1,'DK','DNK',1,0,'Denmark','208',80),
(1,'DJ','DJI',0,0,'Djibouti','262',81),
(1,'DM','DMA',0,0,'Dominica','212',82),
(1,'DO','DOM',0,0,'Dominican Republic','214',83),
(1,'EC','ECU',0,0,'Republic of Ecuador','218',84),
(1,'EG','EGY',0,0,'Egypt','818',85),
(1,'SV','SLV',0,0,'El Salvador','222',86),
(1,'GQ','GNQ',0,0,'Equatorial Guinea','226',87),
(1,'ER','ERI',0,0,'Eritrea','232',88),
(1,'EE','EST',1,0,'Estonia','233',89),
(1,'ET','ETH',0,0,'Ethiopia','231',90),
(1,'FK','FLK',0,0,'Falkland Islands','238',91),
(1,'FO','FRO',0,0,'Faroe Islands','234',92),
(1,'FJ','FJI',0,0,'Fidji Islands','242',93),
(1,'FI','FIN',1,0,'Finland','246',94),
(1,'GF','GUF',0,0,'French Guiana','254',95),
(1,'PF','PYF',0,0,'French Polynesia','258',96),
(1,'TF','ATF',0,0,'Terres australes françaises','260',97),
(1,'GM','GMB',0,0,'Gambie','270',98),
(1,'GE','GEO',0,0,'Georgia','268',99),
(1,'GH','GHA',0,0,'Ghana','288',100),
(1,'GI','GIB',0,0,'Gibraltar','292',101),
(1,'GR','GRC',1,0,'Greece','300',102),
(1,'GL','GRL',0,0,'Groenland','304',103),
(1,'GD','GRD',0,0,'Grenade','308',104),
(1,'GU','GUM',0,0,'Guam','316',106),
(1,'GT','GTM',0,0,'Guatemala','320',107),
(1,'GN','GIN',0,0,'Guinea','324',108),
(1,'GW','GNB',0,0,'Guinea-Bissao','624',109),
(1,'HT','HTI',0,0,'Haiti','332',111),
(1,'HM','HMD',0,0,'Iles Heard et McDonald','334',112),
(1,'VA','VAT',0,0,'Vatican City (Saint-Siège)','336',113),
(1,'HN','HND',0,0,'Honduras','340',114),
(1,'HK','HKG',0,0,'Hong Kong','344',115),
(1,'IS','ISL',0,0,'Islande','352',116),
(1,'IN','IND',0,0,'India','356',117),
(1,'ID','IDN',0,0,'Indonesia','360',118),
(1,'IR','IRN',0,0,'Iran','364',119),
(1,'IQ','IRQ',0,0,'Iraq','368',120),
(1,'IL','ISR',0,0,'Israel','376',121),
(1,'JM','JAM',0,0,'Jamaica','388',122),
(1,'JP','JPN',0,0,'Japan (Nippon)','392',123),
(1,'JO','JOR',0,0,'Jordanie','400',124),
(1,'KZ','KAZ',0,0,'Kazakhstan','398',125),
(1,'KE','KEN',0,0,'Kenya','404',126),
(1,'KI','KIR',0,0,'Kiribati','296',127),
(1,'KP','PRK',0,0,'North Corea','408',128),
(1,'KR','KOR',0,0,'South Corea','410',129),
(1,'KW','KWT',0,0,'Koweït','414',130),
(1,'KG','KGZ',0,0,'Kirghizistan','417',131),
(1,'LA','LAO',0,0,'Laos','418',132),
(1,'LV','LVA',1,0,'Lettonie','428',133),
(1,'LB','LBN',0,0,'Liban','422',134),
(1,'LS','LSO',0,0,'Lesotho','426',135),
(1,'LR','LBR',0,0,'Liberia','430',136),
(1,'LY','LBY',0,0,'Libye','434',137),
(1,'LI','LIE',0,0,'Liechtenstein','438',138),
(1,'LT','LTU',1,0,'Lituanie','440',139),
(1,'LU','LUX',1,0,'Luxembourg','442',140),
(1,'MO','MAC',0,0,'Macao','446',141),
(1,'MK','MKD',0,0,'North Macedonia','807',142),
(1,'MG','MDG',0,0,'Madagascar','450',143),
(1,'MW','MWI',0,0,'Malawi','454',144),
(1,'MY','MYS',0,0,'Malaisie','458',145),
(1,'MV','MDV',0,0,'Maldives','462',146),
(1,'ML','MLI',0,0,'Mali','466',147),
(1,'MT','MLT',1,0,'Malte','470',148),
(1,'MH','MHL',0,0,'Iles Marshall','584',149),
(1,'MR','MRT',0,0,'Mauritanie','478',151),
(1,'MU','MUS',0,0,'Maurice','480',152),
(1,'YT','MYT',0,0,'Mayotte','175',153),
(1,'MX','MEX',0,0,'Mexique','484',154),
(1,'FM','FSM',0,0,'Micronésie','583',155),
(1,'MD','MDA',0,0,'Moldavie','498',156),
(1,'MN','MNG',0,0,'Mongolie','496',157),
(1,'MS','MSR',0,0,'Monserrat','500',158),
(1,'MZ','MOZ',0,0,'Mozambique','508',159),
(1,'MM','MMR',0,0,'Birmanie (Myanmar)','104',160),
(1,'NA','NAM',0,0,'Namibie','516',161),
(1,'NR','NRU',0,0,'Nauru','520',162),
(1,'NP','NPL',0,0,'Népal','524',163),
(1,'NC','NCL',0,0,'New Caledonia','540',165),
(1,'NZ','NZL',0,0,'New Zealand','554',166),
(1,'NI','NIC',0,0,'Nicaragua','558',167),
(1,'NE','NER',0,0,'Niger','562',168),
(1,'NG','NGA',0,0,'Nigeria','566',169),
(1,'NU','NIU',0,0,'Niue','570',170),
(1,'NF','NFK',0,0,'Norfolk Island','574',171),
(1,'MP','MNP',0,0,'Northern Mariana Islands','580',172),
(1,'NO','NOR',0,0,'Norway','578',173),
(1,'OM','OMN',0,0,'Oman','512',174),
(1,'PK','PAK',0,0,'Pakistan','586',175),
(1,'PW','PLW',0,0,'Palau','585',176),
(1,'PS','PSE',0,0,'Palestinian territories','275',177),
(1,'PA','PAN',0,0,'Panama','591',178),
(1,'PG','PNG',0,0,'Papua New Guinea','598',179),
(1,'PY','PRY',0,0,'Paraguay','600',180),
(1,'PE','PER',0,0,'Peru','604',181),
(1,'PH','PHL',0,0,'Philippines','608',182),
(1,'PN','PCN',0,0,'Pitcairn Islands','612',183),
(1,'PL','POL',1,0,'Pologne','616',184),
(1,'PR','PRI',0,0,'Puerto Rico','630',185),
(1,'QA','QAT',0,0,'Qatar','634',186),
(1,'RO','ROU',1,0,'Romania','642',188),
(1,'RW','RWA',0,0,'Rwanda','646',189),
(1,'SH','SHN',0,0,'Saint Helena','654',190),
(1,'KN','KNA',0,0,'Saint Kitts and Nevis','659',191),
(1,'LC','LCA',0,0,'Saint Lucia','662',192),
(1,'PM','SPM',0,0,'Saint Pierre and Miquelon','666',193),
(1,'VC','VCT',0,0,'Saint Vincent and the Grenadines','670',194),
(1,'WS','WSM',0,0,'Samoa','882',195),
(1,'SM','SMR',0,0,'San Marino ','674',196),
(1,'ST','STP',0,0,'Saint Thomas and Prince','678',197),
(1,'RS','SRB',0,0,'Serbia','688',198),
(1,'SC','SYC',0,0,'Seychelles','690',199),
(1,'SL','SLE',0,0,'Sierra Leone','694',200),
(1,'SK','SVK',1,0,'Slovakia','703',201),
(1,'SI','SVN',1,0,'Slovenia','705',202),
(1,'SB','SLB',0,0,'Solomon Islands','090',203),
(1,'SO','SOM',0,0,'Somalia','706',204),
(1,'ZA','ZAF',0,0,'South Africa','710',205),
(1,'GS','SGS',0,0,'South Georgia and the South Sandwich Islands ','239',206),
(1,'LK','LKA',0,0,'Sri Lanka','144',207),
(1,'SD','SDN',0,0,'Sudan','729',208),
(1,'SR','SUR',0,0,'Suriname','740',209),
(1,'SJ','SJM',0,0,'Svalbard and Jan Mayen','744',210),
(1,'SZ','SWZ',0,0,'Swaziland / Eswatini','748',211),
(1,'SY','SYR',0,0,'Syria','760',212),
(1,'TW','TWN',0,0,'Taiwan','158',213),
(1,'TJ','TJK',0,0,'Tajikistan','762',214),
(1,'TZ','TZA',0,0,'Tanzania','834',215),
(1,'TH','THA',0,0,'Thailand','764',216),
(1,'TL','TLS',0,0,'Timor-Leste','626',217),
(1,'TK','TKL',0,0,'Tokelau','772',218),
(1,'TO','TON',0,0,'Tonga','776',219),
(1,'TT','TTO',0,0,'Trinidad and Tobago','780',220),
(1,'TR','TUR',0,0,'Turkey','792',221),
(1,'TM','TKM',0,0,'Turkmenistan','795',222),
(1,'TC','TCA',0,0,'Turks and Caicos Islands','796',223),
(1,'TV','TUV',0,0,'Tuvalu','798',224),
(1,'UG','UGA',0,0,'Uganda','800',225),
(1,'UA','UKR',0,0,'Ukraine','804',226),
(1,'AE','ARE',0,0,'United Arab Emirates','784',227),
(1,'UM','UMI',0,0,'United States Minor Outlying Islands','581',228),
(1,'UY','URY',0,0,'Uruguay','858',229),
(1,'UZ','UZB',0,0,'Uzbekistan','860',230),
(1,'VU','VUT',0,0,'Vanuatu','548',231),
(1,'VE','VEN',0,0,'Venezuela','862',232),
(1,'VN','VNM',0,0,'Vietnam','704',233),
(1,'VG','VGB',0,0,'British Virgin Islands','092',234),
(1,'VI','VIR',0,0,'Virgin Islands of the United States','850',235),
(1,'WF','WLF',0,0,'Wallis and Futuna','876',236),
(1,'EH','ESH',0,0,'Western Sahara','732',237),
(1,'YE','YEM',0,0,'Yemen','887',238),
(1,'ZM','ZMB',0,0,'Zambia','894',239),
(1,'ZW','ZWE',0,0,'Zimbabwe','716',240),
(1,'GG','GGY',0,0,'Guernsey','831',241),
(1,'IM','IMN',0,0,'Isle of Man','833',242),
(1,'JE','JEY',0,0,'Jersey','832',243),
(1,'ME','MNE',0,0,'Montenegro','499',244),
(1,'BL','BLM',0,0,'Saint-Barthélemy','652',245),
(1,'MF','MAF',0,0,'Saint-Martin','663',246),
(1,'XK','XKX',0,0,'Kosovo',NULL,247),
(1,'CW','CUW',0,0,'Curaçao','531',300),
(1,'SX','SXM',0,0,'Sint Maarten','534',301);
/*!40000 ALTER TABLE `llx_c_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_currencies`
--

DROP TABLE IF EXISTS `llx_c_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_currencies` (
  `code_iso` varchar(3) NOT NULL,
  `label` varchar(128) NOT NULL,
  `unicode` varchar(32) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`code_iso`),
  UNIQUE KEY `uk_c_currencies_code_iso` (`code_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_currencies`
--

LOCK TABLES `llx_c_currencies` WRITE;
/*!40000 ALTER TABLE `llx_c_currencies` DISABLE KEYS */;
INSERT INTO `llx_c_currencies` VALUES
(1,'AED','United Arab Emirates Dirham',NULL),
(1,'AFN','Afghanistan Afghani','[1547]'),
(1,'ALL','Albania Lek','[76,101,107]'),
(1,'ANG','Netherlands Antilles Guilder','[402]'),
(1,'AOA','Angola Kwanza',NULL),
(0,'ARP','Pesos argentins',NULL),
(1,'ARS','Argentino Peso','[36]'),
(0,'ATS','Shiliing autrichiens',NULL),
(1,'AUD','Australia Dollar','[36]'),
(1,'AWG','Aruba Guilder','[402]'),
(1,'AZN','Azerbaijan New Manat','[1084,1072,1085]'),
(1,'BAM','Bosnia and Herzegovina Convertible Marka','[75,77]'),
(1,'BBD','Barbados Dollar','[36]'),
(1,'BDT','Bangladeshi Taka','[2547]'),
(0,'BEF','Francs belges',NULL),
(1,'BGN','Bulgaria Lev','[1083,1074]'),
(1,'BHD','Bahrain',NULL),
(1,'BIF','Burundi Franc',NULL),
(1,'BMD','Bermuda Dollar','[36]'),
(1,'BND','Brunei Darussalam Dollar','[36]'),
(1,'BOB','Bolivia Boliviano','[66,115]'),
(1,'BRL','Brazil Real','[82,36]'),
(1,'BSD','Bahamas Dollar','[36]'),
(1,'BWP','Botswana Pula','[80]'),
(1,'BYR','Belarus Ruble','[112,46]'),
(1,'BZD','Belize Dollar','[66,90,36]'),
(1,'CAD','Canada Dollar','[36]'),
(1,'CHF','Switzerland Franc','[67,72,70]'),
(1,'CLP','Chile Peso','[36]'),
(1,'CNY','China Yuan Renminbi','[165]'),
(1,'COP','Colombia Peso','[36]'),
(1,'CRC','Costa Rica Colon','[8353]'),
(1,'CUP','Cuba Peso','[8369]'),
(1,'CVE','Cap Verde Escudo','[4217]'),
(1,'CZK','Czech Republic Koruna','[75,269]'),
(0,'DEM','Deutsche Mark',NULL),
(1,'DKK','Denmark Krone','[107,114]'),
(1,'DOP','Dominican Republic Peso','[82,68,36]'),
(1,'DZD','Algeria Dinar',NULL),
(1,'ECS','Ecuador Sucre','[83,47,46]'),
(1,'EEK','Estonia Kroon','[107,114]'),
(1,'EGP','Egypt Pound','[163]'),
(0,'ESP','Pesete',NULL),
(1,'ETB','Ethiopian Birr',NULL),
(1,'EUR','Euro Member Countries','[8364]'),
(0,'FIM','Mark finlandais',NULL),
(1,'FJD','Fiji Dollar','[36]'),
(1,'FKP','Falkland Islands (Malvinas) Pound','[163]'),
(0,'FRF','Francs francais',NULL),
(1,'GBP','United Kingdom Pound','[163]'),
(1,'GGP','Guernsey Pound','[163]'),
(1,'GHC','Ghana Cedis','[162]'),
(1,'GIP','Gibraltar Pound','[163]'),
(1,'GNF','Guinea Franc','[70,71]'),
(0,'GRD','Drachme (grece)',NULL),
(1,'GTQ','Guatemala Quetzal','[81]'),
(1,'GYD','Guyana Dollar','[36]'),
(1,'HKD','Hong Kong Dollar','[36]'),
(1,'HNL','Honduras Lempira','[76]'),
(1,'HRK','Croatia Kuna','[107,110]'),
(1,'HUF','Hungary Forint','[70,116]'),
(1,'IDR','Indonesia Rupiah','[82,112]'),
(0,'IEP','Livres irlandaises',NULL),
(1,'ILS','Israel Shekel','[8362]'),
(1,'IMP','Isle of Man Pound','[163]'),
(1,'INR','India Rupee','[8377]'),
(1,'IRR','Iran Rial','[65020]'),
(1,'ISK','Iceland Krona','[107,114]'),
(0,'ITL','Lires',NULL),
(1,'JEP','Jersey Pound','[163]'),
(1,'JMD','Jamaica Dollar','[74,36]'),
(1,'JPY','Japan Yen','[165]'),
(1,'KES','Kenya Shilling',NULL),
(1,'KGS','Kyrgyzstan Som','[1083,1074]'),
(1,'KHR','Cambodia Riel','[6107]'),
(1,'KPW','Korea (North) Won','[8361]'),
(1,'KRW','Korea (South) Won','[8361]'),
(1,'KYD','Cayman Islands Dollar','[36]'),
(1,'KZT','Kazakhstan Tenge','[1083,1074]'),
(1,'LAK','Laos Kip','[8365]'),
(1,'LBP','Lebanon Pound','[163]'),
(1,'LKR','Sri Lanka Rupee','[8360]'),
(1,'LRD','Liberia Dollar','[36]'),
(1,'LTL','Lithuania Litas','[76,116]'),
(0,'LUF','Francs luxembourgeois',NULL),
(1,'LVL','Latvia Lat','[76,115]'),
(1,'MAD','Morocco Dirham',NULL),
(1,'MDL','Moldova Leu',NULL),
(1,'MGA','Ariary',NULL),
(1,'MKD','Macedonia Denar','[1076,1077,1085]'),
(1,'MMK','Myanmar Kyat','[75]'),
(1,'MNT','Mongolia Tughrik','[8366]'),
(1,'MRO','Mauritania Ouguiya',NULL),
(1,'MUR','Mauritius Rupee','[8360]'),
(1,'MXN','Mexico Peso','[36]'),
(0,'MXP','Pesos Mexicans',NULL),
(1,'MYR','Malaysia Ringgit','[82,77]'),
(1,'MZN','Mozambique Metical','[77,84]'),
(1,'NAD','Namibia Dollar','[36]'),
(1,'NGN','Nigeria Naira','[8358]'),
(1,'NIO','Nicaragua Cordoba','[67,36]'),
(0,'NLG','Florins',NULL),
(1,'NOK','Norway Krone','[107,114]'),
(1,'NPR','Nepal Rupee','[8360]'),
(1,'NZD','New Zealand Dollar','[36]'),
(1,'OMR','Oman Rial','[65020]'),
(1,'PAB','Panama Balboa','[66,47,46]'),
(1,'PEN','Perú Sol','[83,47]'),
(1,'PHP','Philippines Peso','[8369]'),
(1,'PKR','Pakistan Rupee','[8360]'),
(1,'PLN','Poland Zloty','[122,322]'),
(0,'PTE','Escudos',NULL),
(1,'PYG','Paraguay Guarani','[71,115]'),
(1,'QAR','Qatar Riyal','[65020]'),
(1,'RON','Romania New Leu','[108,101,105]'),
(1,'RSD','Serbia Dinar','[1044,1080,1085,46]'),
(1,'RUB','Russia Ruble','[1088,1091,1073]'),
(1,'SAR','Saudi Arabia Riyal','[65020]'),
(1,'SBD','Solomon Islands Dollar','[36]'),
(1,'SCR','Seychelles Rupee','[8360]'),
(1,'SEK','Sweden Krona','[107,114]'),
(1,'SGD','Singapore Dollar','[36]'),
(1,'SHP','Saint Helena Pound','[163]'),
(0,'SKK','Couronnes slovaques',NULL),
(1,'SOS','Somalia Shilling','[83]'),
(1,'SRD','Suriname Dollar','[36]'),
(0,'SUR','Rouble',NULL),
(1,'SVC','El Salvador Colon','[36]'),
(1,'SYP','Syria Pound','[163]'),
(1,'THB','Thailand Baht','[3647]'),
(1,'TND','Tunisia Dinar',NULL),
(0,'TRL','Turkey Lira','[84,76]'),
(1,'TRY','Turkey Lira','[8378]'),
(1,'TTD','Trinidad and Tobago Dollar','[84,84,36]'),
(1,'TVD','Tuvalu Dollar','[36]'),
(1,'TWD','Taiwan New Dollar','[78,84,36]'),
(1,'UAH','Ukraine Hryvna','[8372]'),
(1,'USD','United States Dollar','[36]'),
(1,'UYU','Uruguay Peso','[36,85]'),
(1,'UZS','Uzbekistan Som','[1083,1074]'),
(1,'VEF','Venezuela Bolivar Fuerte','[66,115]'),
(1,'VND','Viet Nam Dong','[8363]'),
(1,'XAF','Communaute Financiere Africaine (BEAC) CFA Franc',NULL),
(1,'XCD','East Caribbean Dollar','[36]'),
(0,'XEU','Ecus',NULL),
(1,'XOF','Communaute Financiere Africaine (BCEAO) Franc',NULL),
(1,'XPF','Franc CFP','[70]'),
(1,'YER','Yemen Rial','[65020]'),
(1,'ZAR','South Africa Rand','[82]'),
(1,'ZWD','Zimbabwe Dollar','[90,36]');
/*!40000 ALTER TABLE `llx_c_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_departements`
--

DROP TABLE IF EXISTS `llx_c_departements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_departements` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code_departement` varchar(6) NOT NULL,
  `fk_region` int DEFAULT NULL,
  `cheflieu` varchar(50) DEFAULT NULL,
  `tncc` int DEFAULT NULL,
  `ncc` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_departements` (`code_departement`,`fk_region`),
  KEY `idx_departements_fk_region` (`fk_region`),
  CONSTRAINT `fk_departements_fk_region` FOREIGN KEY (`fk_region`) REFERENCES `llx_c_regions` (`code_region`)
) ENGINE=InnoDB AUTO_INCREMENT=1819 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_departements`
--

LOCK TABLES `llx_c_departements` WRITE;
/*!40000 ALTER TABLE `llx_c_departements` DISABLE KEYS */;
INSERT INTO `llx_c_departements` VALUES
(1,'0','0',0,'-','-',1,0),
(1,'','01',1301,'','Adrar',2,0),
(1,'','02',1301,'','Chlef',3,0),
(1,'','03',1301,'','Laghouat',4,0),
(1,'','04',1301,'','Oum El Bouaghi',5,0),
(1,'','05',1301,'','Batna',6,0),
(1,'','06',1301,'','Béjaïa',7,0),
(1,'','07',1301,'','Biskra',8,0),
(1,'','08',1301,'','Béchar',9,0),
(1,'','09',1301,'','Blida',10,0),
(1,'','10',1301,'','Bouira',11,0),
(1,'','11',1301,'','Tamanrasset',12,0),
(1,'','12',1301,'','Tébessa',13,0),
(1,'','13',1301,'','Tlemcen',14,0),
(1,'','14',1301,'','Tiaret',15,0),
(1,'','15',1301,'','Tizi Ouzou',16,0),
(1,'','16',1301,'','Alger',17,0),
(1,'','17',1301,'','Djelfa',18,0),
(1,'','18',1301,'','Jijel',19,0),
(1,'','19',1301,'','Sétif',20,0),
(1,'','20',1301,'','Saïda',21,0),
(1,'','21',1301,'','Skikda',22,0),
(1,'','22',1301,'','Sidi Bel Abbès',23,0),
(1,'','23',1301,'','Annaba',24,0),
(1,'','24',1301,'','Guelma',25,0),
(1,'','25',1301,'','Constantine',26,0),
(1,'','26',1301,'','Médéa',27,0),
(1,'','27',1301,'','Mostaganem',28,0),
(1,'','28',1301,'','M\'Sila',29,0),
(1,'','29',1301,'','Mascara',30,0),
(1,'','30',1301,'','Ouargla',31,0),
(1,'','31',1301,'','Oran',32,0),
(1,'','32',1301,'','El Bayadh',33,0),
(1,'','33',1301,'','Illizi',34,0),
(1,'','34',1301,'','Bordj Bou Arreridj',35,0),
(1,'','35',1301,'','Boumerdès',36,0),
(1,'','36',1301,'','El Tarf',37,0),
(1,'','37',1301,'','Tindouf',38,0),
(1,'','38',1301,'','Tissemsilt',39,0),
(1,'','39',1301,'','El Oued',40,0),
(1,'','40',1301,'','Khenchela',41,0),
(1,'','41',1301,'','Souk Ahras',42,0),
(1,'','42',1301,'','Tipaza',43,0),
(1,'','43',1301,'','Mila',44,0),
(1,'','44',1301,'','Aïn Defla',45,0),
(1,'','45',1301,'','Naâma',46,0),
(1,'','46',1301,'','Aïn Témouchent',47,0),
(1,'','47',1301,'','Ghardaïa',48,0),
(1,'','48',1301,'','Relizane',49,0),
(1,'','49',1301,'','Timimoun',50,0),
(1,'','50',1301,'','Bordj Badji Mokhtar',51,0),
(1,'','51',1301,'','Ouled Djellal',52,0),
(1,'','52',1301,'','Béni Abbès',53,0),
(1,'','53',1301,'','In Salah',54,0),
(1,'','54',1301,'','In Guezzam',55,0),
(1,'','55',1301,'','Touggourt',56,0),
(1,'','56',1301,'','Djanet',57,0),
(1,'','57',1301,'','El M\'Ghair',58,0),
(1,'','58',1301,'','El Ménéa',59,0),
(1,'AD100','AD-002',34000,NULL,'Canillo',60,NULL),
(1,'AD200','AD-003',34000,NULL,'Encamp',61,NULL),
(1,'AD400','AD-004',34000,NULL,'La Massana',62,NULL),
(1,'AD300','AD-005',34000,NULL,'Ordino',63,NULL),
(1,'AD600','AD-006',34000,NULL,'Sant Julià de Lòria',64,NULL),
(1,'AD500','AD-007',34000,NULL,'Andorra la Vella',65,NULL),
(1,'AD700','AD-008',34000,NULL,'Escaldes-Engordany',66,NULL),
(1,NULL,'AO-ABO',35001,'BENGO','Bengo',67,NULL),
(1,NULL,'AO-BGU',35001,'BENGUELA','Benguela',68,NULL),
(1,NULL,'AO-BIE',35001,'BIÉ','Bié',69,NULL),
(1,NULL,'AO-CAB',35001,'CABINDA','Cabinda',70,NULL),
(1,NULL,'AO-CCU',35001,'KUANDO KUBANGO','Kuando Kubango',71,NULL),
(1,NULL,'AO-CNO',35001,'KWANZA NORTE','Kwanza Norte',72,NULL),
(1,NULL,'AO-CUS',35001,'KWANZA SUL','Kwanza Sul',73,NULL),
(1,NULL,'AO-CNN',35001,'CUNENE','Cunene',74,NULL),
(1,NULL,'AO-HUA',35001,'HUAMBO','Huambo',75,NULL),
(1,NULL,'AO-HUI',35001,'HUÍLA','Huila',76,NULL),
(1,NULL,'AO-LUA',35001,'LUANDA','Luanda',77,NULL),
(1,NULL,'AO-LNO',35001,'LUNDA-NORTE','Lunda-Norte',78,NULL),
(1,NULL,'AO-LSU',35001,'LUNDA-SUL','Lunda-Sul',79,NULL),
(1,NULL,'AO-MAL',35001,'MALANGE','Malange',80,NULL),
(1,NULL,'AO-MOX',35001,'MOXICO','Moxico',81,NULL),
(1,NULL,'AO-NAM',35001,'NAMÍBE','Namíbe',82,NULL),
(1,NULL,'AO-UIG',35001,'UÍGE','Uíge',83,NULL),
(1,NULL,'AO-ZAI',35001,'ZAÍRE','Zaíre',84,NULL),
(1,'','2301',2301,'CATAMARCA','Catamarca',85,0),
(1,'','2302',2301,'JUJUY','Jujuy',86,0),
(1,'','2303',2301,'TUCAMAN','Tucamán',87,0),
(1,'','2304',2301,'SANTIAGO DEL ESTERO','Santiago del Estero',88,0),
(1,'','2305',2301,'SALTA','Salta',89,0),
(1,'','2306',2302,'CHACO','Chaco',90,0),
(1,'','2307',2302,'CORRIENTES','Corrientes',91,0),
(1,'','2308',2302,'ENTRE RIOS','Entre Ríos',92,0),
(1,'','2309',2302,'FORMOSA','Formosa',93,0),
(1,'','2310',2302,'SANTA FE','Santa Fe',94,0),
(1,'','2311',2303,'LA RIOJA','La Rioja',95,0),
(1,'','2312',2303,'MENDOZA','Mendoza',96,0),
(1,'','2313',2303,'SAN JUAN','San Juan',97,0),
(1,'','2314',2303,'SAN LUIS','San Luis',98,0),
(1,'','2315',2304,'CORDOBA','Córdoba',99,0),
(1,'','2316',2304,'BUENOS AIRES','Buenos Aires',100,0),
(1,'','2317',2304,'CABA','Caba',101,0),
(1,'','2318',2305,'LA PAMPA','La Pampa',102,0),
(1,'','2319',2305,'NEUQUEN','Neuquén',103,0),
(1,'','2320',2305,'RIO NEGRO','Río Negro',104,0),
(1,'','2321',2305,'CHUBUT','Chubut',105,0),
(1,'','2322',2305,'SANTA CRUZ','Santa Cruz',106,0),
(1,'','2323',2305,'TIERRA DEL FUEGO','Tierra del Fuego',107,0),
(1,'','2324',2305,'ISLAS MALVINAS','Islas Malvinas',108,0),
(1,'','2325',2305,'ANTARTIDA','Antártida',109,0),
(1,'','2326',2305,'MISIONES','Misiones',110,0),
(1,'','NSW',2801,'','New South Wales',111,1),
(1,'','VIC',2801,'','Victoria',112,1),
(1,'','QLD',2801,'','Queensland',113,1),
(1,'','SA',2801,'','South Australia',114,1),
(1,'','ACT',2801,'','Australia Capital Territory',115,1),
(1,'','TAS',2801,'','Tasmania',116,1),
(1,'','WA',2801,'','Western Australia',117,1),
(1,'','NT',2801,'','Northern Territory',118,1),
(1,NULL,'B',4101,'BURGENLAND','Burgenland',119,NULL),
(1,NULL,'K',4101,'KAERNTEN','Kärnten',120,NULL),
(1,NULL,'N',4101,'NIEDEROESTERREICH','Niederösterreich',121,NULL),
(1,NULL,'O',4101,'OBEROESTERREICH','Oberösterreich',122,NULL),
(1,NULL,'S',4101,'SALZBURG','Salzburg',123,NULL),
(1,NULL,'ST',4101,'STEIERMARK','Steiermark',124,NULL),
(1,NULL,'T',4101,'TIROL','Tirol',125,NULL),
(1,NULL,'V',4101,'VORARLBERG','Vorarlberg',126,NULL),
(1,NULL,'W',4101,'WIEN','Wien',127,NULL),
(1,'Oistins','CC',4601,'CC','Christ Church',128,0),
(1,'Greenland','SA',4601,'SA','Saint Andrew',129,0),
(1,'Bulkeley','SG',4601,'SG','Saint George',130,0),
(1,'Holetown','JA',4601,'JA','Saint James',131,0),
(1,'Four Roads','SJ',4601,'SJ','Saint John',132,0),
(1,'Bathsheba','SB',4601,'SB','Saint Joseph',133,0),
(1,'Crab Hill','SL',4601,'SL','Saint Lucy',134,0),
(1,'Bridgetown','SM',4601,'SM','Saint Michael',135,0),
(1,'Speightstown','SP',4601,'SP','Saint Peter',136,0),
(1,'Crane','SC',4601,'SC','Saint Philip',137,0),
(1,'Hillaby','ST',4601,'ST','Saint Thomas',138,0),
(1,'','01',201,'ANVERS','Anvers',139,1),
(1,'','02',203,'BRUXELLES-CAPITALE','Bruxelles-Capitale',140,3),
(1,'','03',202,'BRABANT-WALLON','Brabant-Wallon',141,2),
(1,'','04',201,'BRABANT-FLAMAND','Brabant-Flamand',142,1),
(1,'','05',201,'FLANDRE-OCCIDENTALE','Flandre-Occidentale',143,1),
(1,'','06',201,'FLANDRE-ORIENTALE','Flandre-Orientale',144,1),
(1,'','07',202,'HAINAUT','Hainaut',145,2),
(1,'','08',202,'LIEGE','Liège',146,2),
(1,'','09',202,'LIMBOURG','Limbourg',147,1),
(1,'','10',202,'LUXEMBOURG','Luxembourg',148,2),
(1,'','11',202,'NAMUR','Namur',149,2),
(1,'ACRE','AC',5601,'AC','Acre',150,0),
(1,'ALAGOAS','AL',5601,'AL','Alagoas',151,0),
(1,'AMAPA','AP',5601,'AP','Amapá',152,0),
(1,'AMAZONAS','AM',5601,'AM','Amazonas',153,0),
(1,'BAHIA','BA',5601,'BA','Bahia',154,0),
(1,'CEARA','CE',5601,'CE','Ceará',155,0),
(1,'ESPIRITO SANTO','ES',5601,'ES','Espirito Santo',156,0),
(1,'GOIAS','GO',5601,'GO','Goiás',157,0),
(1,'MARANHAO','MA',5601,'MA','Maranhão',158,0),
(1,'MATO GROSSO','MT',5601,'MT','Mato Grosso',159,0),
(1,'MATO GROSSO DO SUL','MS',5601,'MS','Mato Grosso do Sul',160,0),
(1,'MINAS GERAIS','MG',5601,'MG','Minas Gerais',161,0),
(1,'PARA','PA',5601,'PA','Pará',162,0),
(1,'PARAIBA','PB',5601,'PB','Paraiba',163,0),
(1,'PARANA','PR',5601,'PR','Paraná',164,0),
(1,'PERNAMBUCO','PE',5601,'PE','Pernambuco',165,0),
(1,'PIAUI','PI',5601,'PI','Piauí',166,0),
(1,'RIO DE JANEIRO','RJ',5601,'RJ','Rio de Janeiro',167,0),
(1,'RIO GRANDE DO NORTE','RN',5601,'RN','Rio Grande do Norte',168,0),
(1,'RIO GRANDE DO SUL','RS',5601,'RS','Rio Grande do Sul',169,0),
(1,'RONDONIA','RO',5601,'RO','Rondônia',170,0),
(1,'RORAIMA','RR',5601,'RR','Roraima',171,0),
(1,'SANTA CATARINA','SC',5601,'SC','Santa Catarina',172,0),
(1,'SERGIPE','SE',5601,'SE','Sergipe',173,0),
(1,'SAO PAULO','SP',5601,'SP','Sao Paulo',174,0),
(1,'TOCANTINS','TO',5601,'TO','Tocantins',175,0),
(1,'DISTRITO FEDERAL','DF',5601,'DF','Distrito Federal',176,0),
(1,'','ON',1401,'','Ontario',177,1),
(1,'','QC',1401,'','Quebec',178,1),
(1,'','NS',1401,'','Nova Scotia',179,1),
(1,'','NB',1401,'','New Brunswick',180,1),
(1,'','MB',1401,'','Manitoba',181,1),
(1,'','BC',1401,'','British Columbia',182,1),
(1,'','PE',1401,'','Prince Edward Island',183,1),
(1,'','SK',1401,'','Saskatchewan',184,1),
(1,'','AB',1401,'','Alberta',185,1),
(1,'','NL',1401,'','Newfoundland and Labrador',186,1),
(1,'','011',6701,'011','Iquique',187,0),
(1,'','014',6701,'014','Tamarugal',188,0),
(1,'','021',6702,'021','Antofagasa',189,0),
(1,'','022',6702,'022','El Loa',190,0),
(1,'','023',6702,'023','Tocopilla',191,0),
(1,'','031',6703,'031','Copiapó',192,0),
(1,'','032',6703,'032','Chañaral',193,0),
(1,'','033',6703,'033','Huasco',194,0),
(1,'','041',6704,'041','Elqui',195,0),
(1,'','042',6704,'042','Choapa',196,0),
(1,'','043',6704,'043','Limarí',197,0),
(1,'','051',6705,'051','Valparaíso',198,0),
(1,'','052',6705,'052','Isla de Pascua',199,0),
(1,'','053',6705,'053','Los Andes',200,0),
(1,'','054',6705,'054','Petorca',201,0),
(1,'','055',6705,'055','Quillota',202,0),
(1,'','056',6705,'056','San Antonio',203,0),
(1,'','057',6705,'057','San Felipe de Aconcagua',204,0),
(1,'','058',6705,'058','Marga Marga',205,0),
(1,'','061',6706,'061','Cachapoal',206,0),
(1,'','062',6706,'062','Cardenal Caro',207,0),
(1,'','063',6706,'063','Colchagua',208,0),
(1,'','071',6707,'071','Talca',209,0),
(1,'','072',6707,'072','Cauquenes',210,0),
(1,'','073',6707,'073','Curicó',211,0),
(1,'','074',6707,'074','Linares',212,0),
(1,'','081',6708,'081','Concepción',213,0),
(1,'','082',6708,'082','Arauco',214,0),
(1,'','083',6708,'083','Biobío',215,0),
(1,'','084',6708,'084','Ñuble',216,0),
(1,'','091',6709,'091','Cautín',217,0),
(1,'','092',6709,'092','Malleco',218,0),
(1,'','101',6710,'101','Llanquihue',219,0),
(1,'','102',6710,'102','Chiloé',220,0),
(1,'','103',6710,'103','Osorno',221,0),
(1,'','104',6710,'104','Palena',222,0),
(1,'','111',6711,'111','Coihaique',223,0),
(1,'','112',6711,'112','Aisén',224,0),
(1,'','113',6711,'113','Capitán Prat',225,0),
(1,'','114',6711,'114','General Carrera',226,0),
(1,'','121',6712,'121','Magallanes',227,0),
(1,'','122',6712,'122','Antártica Chilena',228,0),
(1,'','123',6712,'123','Tierra del Fuego',229,0),
(1,'','124',6712,'124','Última Esperanza',230,0),
(1,'','131',6713,'131','Santiago',231,0),
(1,'','132',6713,'132','Cordillera',232,0),
(1,'','133',6713,'133','Chacabuco',233,0),
(1,'','134',6713,'134','Maipo',234,0),
(1,'','135',6713,'135','Melipilla',235,0),
(1,'','136',6713,'136','Talagante',236,0),
(1,'','141',6714,'141','Valdivia',237,0),
(1,'','142',6714,'142','Ranco',238,0),
(1,'','151',6715,'151','Arica',239,0),
(1,'','152',6715,'152','Parinacota',240,0),
(1,'','ANT',7001,'ANT','Antioquia',241,0),
(1,'','BOL',7001,'BOL','Bolívar',242,0),
(1,'','BOY',7001,'BOY','Boyacá',243,0),
(1,'','CAL',7001,'CAL','Caldas',244,0),
(1,'','CAU',7001,'CAU','Cauca',245,0),
(1,'','CUN',7001,'CUN','Cundinamarca',246,0),
(1,'','HUI',7001,'HUI','Huila',247,0),
(1,'','LAG',7001,'LAG','La Guajira',248,0),
(1,'','MET',7001,'MET','Meta',249,0),
(1,'','NAR',7001,'NAR','Nariño',250,0),
(1,'','NDS',7001,'NDS','Norte de Santander',251,0),
(1,'','SAN',7001,'SAN','Santander',252,0),
(1,'','SUC',7001,'SUC','Sucre',253,0),
(1,'','TOL',7001,'TOL','Tolima',254,0),
(1,'','VAC',7001,'VAC','Valle del Cauca',255,0),
(1,'','RIS',7001,'RIS','Risalda',256,0),
(1,'','ATL',7001,'ATL','Atlántico',257,0),
(1,'','COR',7001,'COR','Córdoba',258,0),
(1,'','SAP',7001,'SAP','San Andrés, Providencia y Santa Catalina',259,0),
(1,'','ARA',7001,'ARA','Arauca',260,0),
(1,'','CAS',7001,'CAS','Casanare',261,0),
(1,'','AMA',7001,'AMA','Amazonas',262,0),
(1,'','CAQ',7001,'CAQ','Caquetá',263,0),
(1,'','CHO',7001,'CHO','Chocó',264,0),
(1,'','GUA',7001,'GUA','Guainía',265,0),
(1,'','GUV',7001,'GUV','Guaviare',266,0),
(1,'','PUT',7001,'PUT','Putumayo',267,0),
(1,'','QUI',7001,'QUI','Quindío',268,0),
(1,'','VAU',7001,'VAU','Vaupés',269,0),
(1,'','BOG',7001,'BOG','Bogotá',270,0),
(1,'','VID',7001,'VID','Vichada',271,0),
(1,'','CES',7001,'CES','Cesar',272,0),
(1,'','MAG',7001,'MAG','Magdalena',273,0),
(1,'Bjelovar','HR-01',7601,NULL,'Bjelovarsko-bilogorska županija',274,0),
(1,'Karlovac','HR-02',7601,NULL,'Karlovačka županija',275,0),
(1,'Koprivnica','HR-03',7601,NULL,'Koprivničko-križevačka županija',276,0),
(1,'Krapina','HR-04',7601,NULL,'Krapinsko-zagorska županija',277,0),
(1,'Gospić','HR-05',7601,NULL,'Ličko-senjska županija',278,0),
(1,'Čakovec','HR-06',7601,NULL,'Međimurska županija',279,0),
(1,'Rijeka','HR-07',7601,NULL,'Primorsko-goranska županija',280,0),
(1,'Sisak','HR-08',7601,NULL,'Sisačko-moslavačka županija',281,0),
(1,'Varaždin','HR-09',7601,NULL,'Varaždinska županija',282,0),
(1,'Zagreb','HR-10',7601,NULL,'Zagrebačka županija',283,0),
(1,'Zagreb','HR-11',7601,NULL,'Grad Zagreb',284,0),
(1,'Zadar','HR-12',7602,NULL,'Zadarska županija',285,0),
(1,'Šibenik','HR-13',7602,NULL,'Šibensko-kninska županija',286,0),
(1,'Split','HR-14',7602,NULL,'Splitsko-dalmatinska županija',287,0),
(1,'Dubrovnik','HR-15',7602,NULL,'Dubrovačko-neretvanska županija',288,0),
(1,'Slavonski Brod','HR-16',7603,NULL,'Brodsko-posavska županija',289,0),
(1,'Osijek','HR-17',7603,NULL,'Osječko-baranjska županija',290,0),
(1,'Požega','HR-18',7603,NULL,'Požeško-slavonska županija',291,0),
(1,'Virovitica','HR-19',7603,NULL,'Virovitičko-podravska županija',292,0),
(1,'Vukovar','HR-20',7603,NULL,'Vukovarsko-srijemska županija',293,0),
(1,'Pazin','HR-21',7604,NULL,'Istarska županija',294,0),
(1,'97105','971',1,'GUADELOUPE','Guadeloupe',295,3),
(1,'97209','972',2,'MARTINIQUE','Martinique',296,3),
(1,'97302','973',3,'GUYANE','Guyane',297,3),
(1,'97411','974',4,'REUNION','Réunion',298,3),
(1,'97601','976',6,'MAYOTTE','Mayotte',299,3),
(1,'01053','01',84,'AIN','Ain',300,5),
(1,'02408','02',32,'AISNE','Aisne',301,5),
(1,'03190','03',84,'ALLIER','Allier',302,5),
(1,'04070','04',93,'ALPES-DE-HAUTE-PROVENCE','Alpes-de-Haute-Provence',303,4),
(1,'05061','05',93,'HAUTES-ALPES','Hautes-Alpes',304,4),
(1,'06088','06',93,'ALPES-MARITIMES','Alpes-Maritimes',305,4),
(1,'07186','07',84,'ARDECHE','Ardèche',306,5),
(1,'08105','08',44,'ARDENNES','Ardennes',307,4),
(1,'09122','09',76,'ARIEGE','Ariège',308,5),
(1,'10387','10',44,'AUBE','Aube',309,5),
(1,'11069','11',76,'AUDE','Aude',310,5),
(1,'12202','12',76,'AVEYRON','Aveyron',311,5),
(1,'13055','13',93,'BOUCHES-DU-RHONE','Bouches-du-Rhône',312,4),
(1,'14118','14',28,'CALVADOS','Calvados',313,2),
(1,'15014','15',84,'CANTAL','Cantal',314,2),
(1,'16015','16',75,'CHARENTE','Charente',315,3),
(1,'17300','17',75,'CHARENTE-MARITIME','Charente-Maritime',316,3),
(1,'18033','18',24,'CHER','Cher',317,2),
(1,'19272','19',75,'CORREZE','Corrèze',318,3),
(1,'2A004','2A',94,'CORSE-DU-SUD','Corse-du-Sud',319,3),
(1,'2B033','2B',94,'HAUTE-CORSE','Haute-Corse',320,3),
(1,'21231','21',27,'COTE-D OR','Côte-d Or',321,3),
(1,'22278','22',53,'COTES-D ARMOR','Côtes-d Armor',322,4),
(1,'23096','23',75,'CREUSE','Creuse',323,3),
(1,'24322','24',75,'DORDOGNE','Dordogne',324,3),
(1,'25056','25',27,'DOUBS','Doubs',325,2),
(1,'26362','26',84,'DROME','Drôme',326,3),
(1,'27229','27',28,'EURE','Eure',327,5),
(1,'28085','28',24,'EURE-ET-LOIR','Eure-et-Loir',328,1),
(1,'29232','29',53,'FINISTERE','Finistère',329,2),
(1,'30189','30',76,'GARD','Gard',330,2),
(1,'31555','31',76,'HAUTE-GARONNE','Haute-Garonne',331,3),
(1,'32013','32',76,'GERS','Gers',332,2),
(1,'33063','33',75,'GIRONDE','Gironde',333,3),
(1,'34172','34',76,'HERAULT','Hérault',334,5),
(1,'35238','35',53,'ILLE-ET-VILAINE','Ille-et-Vilaine',335,1),
(1,'36044','36',24,'INDRE','Indre',336,5),
(1,'37261','37',24,'INDRE-ET-LOIRE','Indre-et-Loire',337,1),
(1,'38185','38',84,'ISERE','Isère',338,5),
(1,'39300','39',27,'JURA','Jura',339,2),
(1,'40192','40',75,'LANDES','Landes',340,4),
(1,'41018','41',24,'LOIR-ET-CHER','Loir-et-Cher',341,0),
(1,'42218','42',84,'LOIRE','Loire',342,3),
(1,'43157','43',84,'HAUTE-LOIRE','Haute-Loire',343,3),
(1,'44109','44',52,'LOIRE-ATLANTIQUE','Loire-Atlantique',344,3),
(1,'45234','45',24,'LOIRET','Loiret',345,2),
(1,'46042','46',76,'LOT','Lot',346,2),
(1,'47001','47',75,'LOT-ET-GARONNE','Lot-et-Garonne',347,0),
(1,'48095','48',76,'LOZERE','Lozère',348,3),
(1,'49007','49',52,'MAINE-ET-LOIRE','Maine-et-Loire',349,0),
(1,'50502','50',28,'MANCHE','Manche',350,3),
(1,'51108','51',44,'MARNE','Marne',351,3),
(1,'52121','52',44,'HAUTE-MARNE','Haute-Marne',352,3),
(1,'53130','53',52,'MAYENNE','Mayenne',353,3),
(1,'54395','54',44,'MEURTHE-ET-MOSELLE','Meurthe-et-Moselle',354,0),
(1,'55029','55',44,'MEUSE','Meuse',355,3),
(1,'56260','56',53,'MORBIHAN','Morbihan',356,2),
(1,'57463','57',44,'MOSELLE','Moselle',357,3),
(1,'58194','58',27,'NIEVRE','Nièvre',358,3),
(1,'59350','59',32,'NORD','Nord',359,2),
(1,'60057','60',32,'OISE','Oise',360,5),
(1,'61001','61',28,'ORNE','Orne',361,5),
(1,'62041','62',32,'PAS-DE-CALAIS','Pas-de-Calais',362,2),
(1,'63113','63',84,'PUY-DE-DOME','Puy-de-Dôme',363,2),
(1,'64445','64',75,'PYRENEES-ATLANTIQUES','Pyrénées-Atlantiques',364,4),
(1,'65440','65',76,'HAUTES-PYRENEES','Hautes-Pyrénées',365,4),
(1,'66136','66',76,'PYRENEES-ORIENTALES','Pyrénées-Orientales',366,4),
(1,'67482','67',44,'BAS-RHIN','Bas-Rhin',367,2),
(1,'68066','68',44,'HAUT-RHIN','Haut-Rhin',368,2),
(1,'69123','69',84,'RHONE','Rhône',369,2),
(1,'70550','70',27,'HAUTE-SAONE','Haute-Saône',370,3),
(1,'71270','71',27,'SAONE-ET-LOIRE','Saône-et-Loire',371,0),
(1,'72181','72',52,'SARTHE','Sarthe',372,3),
(1,'73065','73',84,'SAVOIE','Savoie',373,3),
(1,'74010','74',84,'HAUTE-SAVOIE','Haute-Savoie',374,3),
(1,'75056','75',11,'PARIS','Paris',375,0),
(1,'76540','76',28,'SEINE-MARITIME','Seine-Maritime',376,3),
(1,'77288','77',11,'SEINE-ET-MARNE','Seine-et-Marne',377,0),
(1,'78646','78',11,'YVELINES','Yvelines',378,4),
(1,'79191','79',75,'DEUX-SEVRES','Deux-Sèvres',379,4),
(1,'80021','80',32,'SOMME','Somme',380,3),
(1,'81004','81',76,'TARN','Tarn',381,2),
(1,'82121','82',76,'TARN-ET-GARONNE','Tarn-et-Garonne',382,0),
(1,'83137','83',93,'VAR','Var',383,2),
(1,'84007','84',93,'VAUCLUSE','Vaucluse',384,0),
(1,'85191','85',52,'VENDEE','Vendée',385,3),
(1,'86194','86',75,'VIENNE','Vienne',386,3),
(1,'87085','87',75,'HAUTE-VIENNE','Haute-Vienne',387,3),
(1,'88160','88',44,'VOSGES','Vosges',388,4),
(1,'89024','89',27,'YONNE','Yonne',389,5),
(1,'90010','90',27,'TERRITOIRE DE BELFORT','Territoire de Belfort',390,0),
(1,'91228','91',11,'ESSONNE','Essonne',391,5),
(1,'92050','92',11,'HAUTS-DE-SEINE','Hauts-de-Seine',392,4),
(1,'93008','93',11,'SEINE-SAINT-DENIS','Seine-Saint-Denis',393,3),
(1,'94028','94',11,'VAL-DE-MARNE','Val-de-Marne',394,2),
(1,'95500','95',11,'VAL-D OISE','Val-d Oise',395,2),
(1,NULL,'BW',501,'BADEN-WÜRTTEMBERG','Baden-Württemberg',396,NULL),
(1,NULL,'BY',501,'BAYERN','Bayern',397,NULL),
(1,NULL,'BE',501,'BERLIN','Berlin',398,NULL),
(1,NULL,'BB',501,'BRANDENBURG','Brandenburg',399,NULL),
(1,NULL,'HB',501,'BREMEN','Bremen',400,NULL),
(1,NULL,'HH',501,'HAMBURG','Hamburg',401,NULL),
(1,NULL,'HE',501,'HESSEN','Hessen',402,NULL),
(1,NULL,'MV',501,'MECKLENBURG-VORPOMMERN','Mecklenburg-Vorpommern',403,NULL),
(1,NULL,'NI',501,'NIEDERSACHSEN','Niedersachsen',404,NULL),
(1,NULL,'NW',501,'NORDRHEIN-WESTFALEN','Nordrhein-Westfalen',405,NULL),
(1,NULL,'RP',501,'RHEINLAND-PFALZ','Rheinland-Pfalz',406,NULL),
(1,NULL,'SL',501,'SAARLAND','Saarland',407,NULL),
(1,NULL,'SN',501,'SACHSEN','Sachsen',408,NULL),
(1,NULL,'ST',501,'SACHSEN-ANHALT','Sachsen-Anhalt',409,NULL),
(1,NULL,'SH',501,'SCHLESWIG-HOLSTEIN','Schleswig-Holstein',410,NULL),
(1,NULL,'TH',501,'THÜRINGEN','Thüringen',411,NULL),
(1,'','66',10201,'','Αθήνα',412,0),
(1,'','67',10205,'','Δράμα',413,0),
(1,'','01',10205,'','Έβρος',414,0),
(1,'','02',10205,'','Θάσος',415,0),
(1,'','03',10205,'','Καβάλα',416,0),
(1,'','04',10205,'','Ξάνθη',417,0),
(1,'','05',10205,'','Ροδόπη',418,0),
(1,'','06',10203,'','Ημαθία',419,0),
(1,'','07',10203,'','Θεσσαλονίκη',420,0),
(1,'','08',10203,'','Κιλκίς',421,0),
(1,'','09',10203,'','Πέλλα',422,0),
(1,'','10',10203,'','Πιερία',423,0),
(1,'','11',10203,'','Σέρρες',424,0),
(1,'','12',10203,'','Χαλκιδική',425,0),
(1,'','13',10206,'','Άρτα',426,0),
(1,'','14',10206,'','Θεσπρωτία',427,0),
(1,'','15',10206,'','Ιωάννινα',428,0),
(1,'','16',10206,'','Πρέβεζα',429,0),
(1,'','17',10213,'','Γρεβενά',430,0),
(1,'','18',10213,'','Καστοριά',431,0),
(1,'','19',10213,'','Κοζάνη',432,0),
(1,'','20',10213,'','Φλώρινα',433,0),
(1,'','21',10212,'','Καρδίτσα',434,0),
(1,'','22',10212,'','Λάρισα',435,0),
(1,'','23',10212,'','Μαγνησία',436,0),
(1,'','24',10212,'','Τρίκαλα',437,0),
(1,'','25',10212,'','Σποράδες',438,0),
(1,'','26',10212,'','Βοιωτία',439,0),
(1,'','27',10202,'','Εύβοια',440,0),
(1,'','28',10202,'','Ευρυτανία',441,0),
(1,'','29',10202,'','Φθιώτιδα',442,0),
(1,'','30',10202,'','Φωκίδα',443,0),
(1,'','31',10209,'','Αργολίδα',444,0),
(1,'','32',10209,'','Αρκαδία',445,0),
(1,'','33',10209,'','Κορινθία',446,0),
(1,'','34',10209,'','Λακωνία',447,0),
(1,'','35',10209,'','Μεσσηνία',448,0),
(1,'','36',10211,'','Αιτωλοακαρνανία',449,0),
(1,'','37',10211,'','Αχαΐα',450,0),
(1,'','38',10211,'','Ηλεία',451,0),
(1,'','39',10207,'','Ζάκυνθος',452,0),
(1,'','40',10207,'','Κέρκυρα',453,0),
(1,'','41',10207,'','Κεφαλληνία',454,0),
(1,'','42',10207,'','Ιθάκη',455,0),
(1,'','43',10207,'','Λευκάδα',456,0),
(1,'','44',10208,'','Ικαρία',457,0),
(1,'','45',10208,'','Λέσβος',458,0),
(1,'','46',10208,'','Λήμνος',459,0),
(1,'','47',10208,'','Σάμος',460,0),
(1,'','48',10208,'','Χίος',461,0),
(1,'','49',10210,'','Άνδρος',462,0),
(1,'','50',10210,'','Θήρα',463,0),
(1,'','51',10210,'','Κάλυμνος',464,0),
(1,'','52',10210,'','Κάρπαθος',465,0),
(1,'','53',10210,'','Κέα-Κύθνος',466,0),
(1,'','54',10210,'','Κω',467,0),
(1,'','55',10210,'','Μήλος',468,0),
(1,'','56',10210,'','Μύκονος',469,0),
(1,'','57',10210,'','Νάξος',470,0),
(1,'','58',10210,'','Πάρος',471,0),
(1,'','59',10210,'','Ρόδος',472,0),
(1,'','60',10210,'','Σύρος',473,0),
(1,'','61',10210,'','Τήνος',474,0),
(1,'','62',10204,'','Ηράκλειο',475,0),
(1,'','63',10204,'','Λασίθι',476,0),
(1,'','64',10204,'','Ρέθυμνο',477,0),
(1,'','65',10204,'','Χανιά',478,0),
(1,'','AT',11401,'AT','Atlántida',479,0),
(1,'','CH',11401,'CH','Choluteca',480,0),
(1,'','CL',11401,'CL','Colón',481,0),
(1,'','CM',11401,'CM','Comayagua',482,0),
(1,'','CO',11401,'CO','Copán',483,0),
(1,'','CR',11401,'CR','Cortés',484,0),
(1,'','EP',11401,'EP','El Paraíso',485,0),
(1,'','FM',11401,'FM','Francisco Morazán',486,0),
(1,'','GD',11401,'GD','Gracias a Dios',487,0),
(1,'','IN',11401,'IN','Intibucá',488,0),
(1,'','IB',11401,'IB','Islas de la Bahía',489,0),
(1,'','LP',11401,'LP','La Paz',490,0),
(1,'','LM',11401,'LM','Lempira',491,0),
(1,'','OC',11401,'OC','Ocotepeque',492,0),
(1,'','OL',11401,'OL','Olancho',493,0),
(1,'','SB',11401,'SB','Santa Bárbara',494,0),
(1,'','VL',11401,'VL','Valle',495,0),
(1,'','YO',11401,'YO','Yoro',496,0),
(1,'','DC',11401,'DC','Distrito Central',497,0),
(1,'HU101','HU-BU',180100,NULL,'Budapest',498,NULL),
(1,'HU102','HU-PE',180100,NULL,'Pest',499,NULL),
(1,'HU211','HU-FE',182100,NULL,'Fejér',500,NULL),
(1,'HU212','HU-KE',182100,NULL,'Komárom-Esztergom',501,NULL),
(1,'HU213','HU-VE',182100,NULL,'Veszprém',502,NULL),
(1,'HU221','HU-GS',182200,NULL,'Győr-Moson-Sopron',503,NULL),
(1,'HU222','HU-VA',182200,NULL,'Vas',504,NULL),
(1,'HU223','HU-ZA',182200,NULL,'Zala',505,NULL),
(1,'HU231','HU-BA',182300,NULL,'Baranya',506,NULL),
(1,'HU232','HU-SO',182300,NULL,'Somogy',507,NULL),
(1,'HU233','HU-TO',182300,NULL,'Tolna',508,NULL),
(1,'HU311','HU-BZ',183100,NULL,'Borsod-Abaúj-Zemplén',509,NULL),
(1,'HU312','HU-HE',183100,NULL,'Heves',510,NULL),
(1,'HU313','HU-NO',183100,NULL,'Nógrád',511,NULL),
(1,'HU321','HU-HB',183200,NULL,'Hajdú-Bihar',512,NULL),
(1,'HU322','HU-JN',183200,NULL,'Jász-Nagykun-Szolnok',513,NULL),
(1,'HU323','HU-SZ',183200,NULL,'Szabolcs-Szatmár-Bereg',514,NULL),
(1,'HU331','HU-BK',183300,NULL,'Bács-Kiskun',515,NULL),
(1,'HU332','HU-BE',183300,NULL,'Békés',516,NULL),
(1,'HU333','HU-CS',183300,NULL,'Csongrád',517,NULL),
(1,NULL,'AG',315,NULL,'AGRIGENTO',518,NULL),
(1,NULL,'AL',312,NULL,'ALESSANDRIA',519,NULL),
(1,NULL,'AN',310,NULL,'ANCONA',520,NULL),
(1,NULL,'AO',319,NULL,'AOSTA',521,NULL),
(1,NULL,'AR',316,NULL,'AREZZO',522,NULL),
(1,NULL,'AP',310,NULL,'ASCOLI PICENO',523,NULL),
(1,NULL,'AT',312,NULL,'ASTI',524,NULL),
(1,NULL,'AV',304,NULL,'AVELLINO',525,NULL),
(1,NULL,'BA',313,NULL,'BARI',526,NULL),
(1,NULL,'BT',313,NULL,'BARLETTA-ANDRIA-TRANI',527,NULL),
(1,NULL,'BL',320,NULL,'BELLUNO',528,NULL),
(1,NULL,'BN',304,NULL,'BENEVENTO',529,NULL),
(1,NULL,'BG',309,NULL,'BERGAMO',530,NULL),
(1,NULL,'BI',312,NULL,'BIELLA',531,NULL),
(1,NULL,'BO',305,NULL,'BOLOGNA',532,NULL),
(1,NULL,'BZ',317,NULL,'BOLZANO',533,NULL),
(1,NULL,'BS',309,NULL,'BRESCIA',534,NULL),
(1,NULL,'BR',313,NULL,'BRINDISI',535,NULL),
(1,NULL,'CA',314,NULL,'CAGLIARI',536,NULL),
(1,NULL,'CL',315,NULL,'CALTANISSETTA',537,NULL),
(1,NULL,'CB',311,NULL,'CAMPOBASSO',538,NULL),
(1,NULL,'CI',314,NULL,'CARBONIA-IGLESIAS',539,NULL),
(1,NULL,'CE',304,NULL,'CASERTA',540,NULL),
(1,NULL,'CT',315,NULL,'CATANIA',541,NULL),
(1,NULL,'CZ',303,NULL,'CATANZARO',542,NULL),
(1,NULL,'CH',301,NULL,'CHIETI',543,NULL),
(1,NULL,'CO',309,NULL,'COMO',544,NULL),
(1,NULL,'CS',303,NULL,'COSENZA',545,NULL),
(1,NULL,'CR',309,NULL,'CREMONA',546,NULL),
(1,NULL,'KR',303,NULL,'CROTONE',547,NULL),
(1,NULL,'CN',312,NULL,'CUNEO',548,NULL),
(1,NULL,'EN',315,NULL,'ENNA',549,NULL),
(1,NULL,'FM',310,NULL,'FERMO',550,NULL),
(1,NULL,'FE',305,NULL,'FERRARA',551,NULL),
(1,NULL,'FI',316,NULL,'FIRENZE',552,NULL),
(1,NULL,'FG',313,NULL,'FOGGIA',553,NULL),
(1,NULL,'FC',305,NULL,'FORLI-CESENA',554,NULL),
(1,NULL,'FR',307,NULL,'FROSINONE',555,NULL),
(1,NULL,'GE',308,NULL,'GENOVA',556,NULL),
(1,NULL,'GO',306,NULL,'GORIZIA',557,NULL),
(1,NULL,'GR',316,NULL,'GROSSETO',558,NULL),
(1,NULL,'IM',308,NULL,'IMPERIA',559,NULL),
(1,NULL,'IS',311,NULL,'ISERNIA',560,NULL),
(1,NULL,'SP',308,NULL,'LA SPEZIA',561,NULL),
(1,NULL,'AQ',301,NULL,'L AQUILA',562,NULL),
(1,NULL,'LT',307,NULL,'LATINA',563,NULL),
(1,NULL,'LE',313,NULL,'LECCE',564,NULL),
(1,NULL,'LC',309,NULL,'LECCO',565,NULL),
(1,NULL,'LI',316,NULL,'LIVORNO',566,NULL),
(1,NULL,'LO',309,NULL,'LODI',567,NULL),
(1,NULL,'LU',316,NULL,'LUCCA',568,NULL),
(1,NULL,'MC',310,NULL,'MACERATA',569,NULL),
(1,NULL,'MN',309,NULL,'MANTOVA',570,NULL),
(1,NULL,'MS',316,NULL,'MASSA-CARRARA',571,NULL),
(1,NULL,'MT',302,NULL,'MATERA',572,NULL),
(1,NULL,'VS',314,NULL,'MEDIO CAMPIDANO',573,NULL),
(1,NULL,'ME',315,NULL,'MESSINA',574,NULL),
(1,NULL,'MI',309,NULL,'MILANO',575,NULL),
(1,NULL,'MB',309,NULL,'MONZA e BRIANZA',576,NULL),
(1,NULL,'MO',305,NULL,'MODENA',577,NULL),
(1,NULL,'NA',304,NULL,'NAPOLI',578,NULL),
(1,NULL,'NO',312,NULL,'NOVARA',579,NULL),
(1,NULL,'NU',314,NULL,'NUORO',580,NULL),
(1,NULL,'OG',314,NULL,'OGLIASTRA',581,NULL),
(1,NULL,'OT',314,NULL,'OLBIA-TEMPIO',582,NULL),
(1,NULL,'OR',314,NULL,'ORISTANO',583,NULL),
(1,NULL,'PD',320,NULL,'PADOVA',584,NULL),
(1,NULL,'PA',315,NULL,'PALERMO',585,NULL),
(1,NULL,'PR',305,NULL,'PARMA',586,NULL),
(1,NULL,'PV',309,NULL,'PAVIA',587,NULL),
(1,NULL,'PG',318,NULL,'PERUGIA',588,NULL),
(1,NULL,'PU',310,NULL,'PESARO e URBINO',589,NULL),
(1,NULL,'PE',301,NULL,'PESCARA',590,NULL),
(1,NULL,'PC',305,NULL,'PIACENZA',591,NULL),
(1,NULL,'PI',316,NULL,'PISA',592,NULL),
(1,NULL,'PT',316,NULL,'PISTOIA',593,NULL),
(1,NULL,'PN',306,NULL,'PORDENONE',594,NULL),
(1,NULL,'PZ',302,NULL,'POTENZA',595,NULL),
(1,NULL,'PO',316,NULL,'PRATO',596,NULL),
(1,NULL,'RG',315,NULL,'RAGUSA',597,NULL),
(1,NULL,'RA',305,NULL,'RAVENNA',598,NULL),
(1,NULL,'RC',303,NULL,'REGGIO CALABRIA',599,NULL),
(1,NULL,'RE',305,NULL,'REGGIO NELL EMILIA',600,NULL),
(1,NULL,'RI',307,NULL,'RIETI',601,NULL),
(1,NULL,'RN',305,NULL,'RIMINI',602,NULL),
(1,NULL,'RM',307,NULL,'ROMA',603,NULL),
(1,NULL,'RO',320,NULL,'ROVIGO',604,NULL),
(1,NULL,'SA',304,NULL,'SALERNO',605,NULL),
(1,NULL,'SS',314,NULL,'SASSARI',606,NULL),
(1,NULL,'SV',308,NULL,'SAVONA',607,NULL),
(1,NULL,'SI',316,NULL,'SIENA',608,NULL),
(1,NULL,'SR',315,NULL,'SIRACUSA',609,NULL),
(1,NULL,'SO',309,NULL,'SONDRIO',610,NULL),
(1,NULL,'TA',313,NULL,'TARANTO',611,NULL),
(1,NULL,'TE',301,NULL,'TERAMO',612,NULL),
(1,NULL,'TR',318,NULL,'TERNI',613,NULL),
(1,NULL,'TO',312,NULL,'TORINO',614,NULL),
(1,NULL,'TP',315,NULL,'TRAPANI',615,NULL),
(1,NULL,'TN',317,NULL,'TRENTO',616,NULL),
(1,NULL,'TV',320,NULL,'TREVISO',617,NULL),
(1,NULL,'TS',306,NULL,'TRIESTE',618,NULL),
(1,NULL,'UD',306,NULL,'UDINE',619,NULL),
(1,NULL,'VA',309,NULL,'VARESE',620,NULL),
(1,NULL,'VE',320,NULL,'VENEZIA',621,NULL),
(1,NULL,'VB',312,NULL,'VERBANO-CUSIO-OSSOLA',622,NULL),
(1,NULL,'VC',312,NULL,'VERCELLI',623,NULL),
(1,NULL,'VR',320,NULL,'VERONA',624,NULL),
(1,NULL,'VV',303,NULL,'VIBO VALENTIA',625,NULL),
(1,NULL,'VI',320,NULL,'VICENZA',626,NULL),
(1,NULL,'VT',307,NULL,'VITERBO',627,NULL),
(1,'','LU0001',14001,'','Clervaux',628,0),
(1,'','LU0002',14001,'','Diekirch',629,0),
(1,'','LU0003',14001,'','Redange',630,0),
(1,'','LU0004',14001,'','Vianden',631,0),
(1,'','LU0005',14001,'','Wiltz',632,0),
(1,'','LU0006',14002,'','Echternach',633,0),
(1,'','LU0007',14002,'','Grevenmacher',634,0),
(1,'','LU0008',14002,'','Remich',635,0),
(1,'','LU0009',14003,'','Capellen',636,0),
(1,'','LU0010',14003,'','Esch-sur-Alzette',637,0),
(1,'','LU0011',14003,'','Luxembourg',638,0),
(1,'','LU0012',14003,'','Mersch',639,0),
(1,'','MA',1209,'','Province de Benslimane',640,0),
(1,'','MA1',1209,'','Province de Berrechid',641,0),
(1,'','MA2',1209,'','Province de Khouribga',642,0),
(1,'','MA3',1209,'','Province de Settat',643,0),
(1,'','MA4',1210,'','Province d\'El Jadida',644,0),
(1,'','MA5',1210,'','Province de Safi',645,0),
(1,'','MA6',1210,'','Province de Sidi Bennour',646,0),
(1,'','MA7',1210,'','Province de Youssoufia',647,0),
(1,'','MA6B',1205,'','Préfecture de Fès',648,0),
(1,'','MA7B',1205,'','Province de Boulemane',649,0),
(1,'','MA8',1205,'','Province de Moulay Yacoub',650,0),
(1,'','MA9',1205,'','Province de Sefrou',651,0),
(1,'','MA8A',1202,'','Province de Kénitra',652,0),
(1,'','MA9A',1202,'','Province de Sidi Kacem',653,0),
(1,'','MA10',1202,'','Province de Sidi Slimane',654,0),
(1,'','MA11',1208,'','Préfecture de Casablanca',655,0),
(1,'','MA12',1208,'','Préfecture de Mohammédia',656,0),
(1,'','MA13',1208,'','Province de Médiouna',657,0),
(1,'','MA14',1208,'','Province de Nouaceur',658,0),
(1,'','MA15',1214,'','Province d\'Assa-Zag',659,0),
(1,'','MA16',1214,'','Province d\'Es-Semara',660,0),
(1,'','MA17A',1214,'','Province de Guelmim',661,0),
(1,'','MA18',1214,'','Province de Tata',662,0),
(1,'','MA19',1214,'','Province de Tan-Tan',663,0),
(1,'','MA15',1215,'','Province de Boujdour',664,0),
(1,'','MA16',1215,'','Province de Lâayoune',665,0),
(1,'','MA17',1215,'','Province de Tarfaya',666,0),
(1,'','MA18',1211,'','Préfecture de Marrakech',667,0),
(1,'','MA19',1211,'','Province d\'Al Haouz',668,0),
(1,'','MA20',1211,'','Province de Chichaoua',669,0),
(1,'','MA21',1211,'','Province d\'El Kelâa des Sraghna',670,0),
(1,'','MA22',1211,'','Province d\'Essaouira',671,0),
(1,'','MA23',1211,'','Province de Rehamna',672,0),
(1,'','MA24',1206,'','Préfecture de Meknès',673,0),
(1,'','MA25',1206,'','Province d’El Hajeb',674,0),
(1,'','MA26',1206,'','Province d\'Errachidia',675,0),
(1,'','MA27',1206,'','Province d’Ifrane',676,0),
(1,'','MA28',1206,'','Province de Khénifra',677,0),
(1,'','MA29',1206,'','Province de Midelt',678,0),
(1,'','MA30',1204,'','Préfecture d\'Oujda-Angad',679,0),
(1,'','MA31',1204,'','Province de Berkane',680,0),
(1,'','MA32',1204,'','Province de Driouch',681,0),
(1,'','MA33',1204,'','Province de Figuig',682,0),
(1,'','MA34',1204,'','Province de Jerada',683,0),
(1,'','MA35',1204,'','Province de Nador',684,0),
(1,'','MA36',1204,'','Province de Taourirt',685,0),
(1,'','MA37',1216,'','Province d\'Aousserd',686,0),
(1,'','MA38',1216,'','Province d\'Oued Ed-Dahab',687,0),
(1,'','MA39',1207,'','Préfecture de Rabat',688,0),
(1,'','MA40',1207,'','Préfecture de Skhirat-Témara',689,0),
(1,'','MA41',1207,'','Préfecture de Salé',690,0),
(1,'','MA42',1207,'','Province de Khémisset',691,0),
(1,'','MA43',1213,'','Préfecture d\'Agadir Ida-Outanane',692,0),
(1,'','MA44',1213,'','Préfecture d\'Inezgane-Aït Melloul',693,0),
(1,'','MA45',1213,'','Province de Chtouka-Aït Baha',694,0),
(1,'','MA46',1213,'','Province d\'Ouarzazate',695,0),
(1,'','MA47',1213,'','Province de Sidi Ifni',696,0),
(1,'','MA48',1213,'','Province de Taroudant',697,0),
(1,'','MA49',1213,'','Province de Tinghir',698,0),
(1,'','MA50',1213,'','Province de Tiznit',699,0),
(1,'','MA51',1213,'','Province de Zagora',700,0),
(1,'','MA52',1212,'','Province d\'Azilal',701,0),
(1,'','MA53',1212,'','Province de Beni Mellal',702,0),
(1,'','MA54',1212,'','Province de Fquih Ben Salah',703,0),
(1,'','MA55',1201,'','Préfecture de M\'diq-Fnideq',704,0),
(1,'','MA56',1201,'','Préfecture de Tanger-Asilah',705,0),
(1,'','MA57',1201,'','Province de Chefchaouen',706,0),
(1,'','MA58',1201,'','Province de Fahs-Anjra',707,0),
(1,'','MA59',1201,'','Province de Larache',708,0),
(1,'','MA60',1201,'','Province d\'Ouezzane',709,0),
(1,'','MA61',1201,'','Province de Tétouan',710,0),
(1,'','MA62',1203,'','Province de Guercif',711,0),
(1,'','MA63',1203,'','Province d\'Al Hoceïma',712,0),
(1,'','MA64',1203,'','Province de Taounate',713,0),
(1,'','MA65',1203,'','Province de Taza',714,0),
(1,'','MA6A',1205,'','Préfecture de Fès',715,0),
(1,'','MA7A',1205,'','Province de Boulemane',716,0),
(1,'','MA15A',1214,'','Province d\'Assa-Zag',717,0),
(1,'','MA16A',1214,'','Province d\'Es-Semara',718,0),
(1,'','MA18A',1211,'','Préfecture de Marrakech',719,0),
(1,'','MA19A',1214,'','Province de Tan-Tan',720,0),
(1,'','MA19B',1214,'','Province de Tan-Tan',721,0),
(1,NULL,'GR',1701,NULL,'Groningen',722,NULL),
(1,NULL,'FR',1701,NULL,'Friesland',723,NULL),
(1,NULL,'DR',1701,NULL,'Drenthe',724,NULL),
(1,NULL,'OV',1701,NULL,'Overijssel',725,NULL),
(1,NULL,'GD',1701,NULL,'Gelderland',726,NULL),
(1,NULL,'FL',1701,NULL,'Flevoland',727,NULL),
(1,NULL,'UT',1701,NULL,'Utrecht',728,NULL),
(1,NULL,'NH',1701,NULL,'Noord-Holland',729,NULL),
(1,NULL,'ZH',1701,NULL,'Zuid-Holland',730,NULL),
(1,NULL,'ZL',1701,NULL,'Zeeland',731,NULL),
(1,NULL,'NB',1701,NULL,'Noord-Brabant',732,NULL),
(1,NULL,'LB',1701,NULL,'Limburg',733,NULL),
(1,'','PA-1',17801,'','Bocas del Toro',734,0),
(1,'','PA-2',17801,'','Coclé',735,0),
(1,'','PA-3',17801,'','Colón',736,0),
(1,'','PA-4',17801,'','Chiriquí',737,0),
(1,'','PA-5',17801,'','Darién',738,0),
(1,'','PA-6',17801,'','Herrera',739,0),
(1,'','PA-7',17801,'','Los Santos',740,0),
(1,'','PA-8',17801,'','Panamá',741,0),
(1,'','PA-9',17801,'','Veraguas',742,0),
(1,'','PA-13',17801,'','Panamá Oeste',743,0),
(1,'','0101',18101,'','Chachapoyas',744,0),
(1,'','0102',18101,'','Bagua',745,0),
(1,'','0103',18101,'','Bongará',746,0),
(1,'','0104',18101,'','Condorcanqui',747,0),
(1,'','0105',18101,'','Luya',748,0),
(1,'','0106',18101,'','Rodríguez de Mendoza',749,0),
(1,'','0107',18101,'','Utcubamba',750,0),
(1,'','0201',18102,'','Huaraz',751,0),
(1,'','0202',18102,'','Aija',752,0),
(1,'','0203',18102,'','Antonio Raymondi',753,0),
(1,'','0204',18102,'','Asunción',754,0),
(1,'','0205',18102,'','Bolognesi',755,0),
(1,'','0206',18102,'','Carhuaz',756,0),
(1,'','0207',18102,'','Carlos Fermín Fitzcarrald',757,0),
(1,'','0208',18102,'','Casma',758,0),
(1,'','0209',18102,'','Corongo',759,0),
(1,'','0210',18102,'','Huari',760,0),
(1,'','0211',18102,'','Huarmey',761,0),
(1,'','0212',18102,'','Huaylas',762,0),
(1,'','0213',18102,'','Mariscal Luzuriaga',763,0),
(1,'','0214',18102,'','Ocros',764,0),
(1,'','0215',18102,'','Pallasca',765,0),
(1,'','0216',18102,'','Pomabamba',766,0),
(1,'','0217',18102,'','Recuay',767,0),
(1,'','0218',18102,'','Papá',768,0),
(1,'','0219',18102,'','Sihuas',769,0),
(1,'','0220',18102,'','Yungay',770,0),
(1,'','0301',18103,'','Abancay',771,0),
(1,'','0302',18103,'','Andahuaylas',772,0),
(1,'','0303',18103,'','Antabamba',773,0),
(1,'','0304',18103,'','Aymaraes',774,0),
(1,'','0305',18103,'','Cotabambas',775,0),
(1,'','0306',18103,'','Chincheros',776,0),
(1,'','0307',18103,'','Grau',777,0),
(1,'','0401',18104,'','Arequipa',778,0),
(1,'','0402',18104,'','Camaná',779,0),
(1,'','0403',18104,'','Caravelí',780,0),
(1,'','0404',18104,'','Castilla',781,0),
(1,'','0405',18104,'','Caylloma',782,0),
(1,'','0406',18104,'','Condesuyos',783,0),
(1,'','0407',18104,'','Islay',784,0),
(1,'','0408',18104,'','La Unión',785,0),
(1,'','0501',18105,'','Huamanga',786,0),
(1,'','0502',18105,'','Cangallo',787,0),
(1,'','0503',18105,'','Huanca Sancos',788,0),
(1,'','0504',18105,'','Huanta',789,0),
(1,'','0505',18105,'','La Mar',790,0),
(1,'','0506',18105,'','Lucanas',791,0),
(1,'','0507',18105,'','Parinacochas',792,0),
(1,'','0508',18105,'','Páucar del Sara Sara',793,0),
(1,'','0509',18105,'','Sucre',794,0),
(1,'','0510',18105,'','Víctor Fajardo',795,0),
(1,'','0511',18105,'','Vilcas Huamán',796,0),
(1,'','0601',18106,'','Cajamarca',797,0),
(1,'','0602',18106,'','Cajabamba',798,0),
(1,'','0603',18106,'','Celendín',799,0),
(1,'','0604',18106,'','Chota',800,0),
(1,'','0605',18106,'','Contumazá',801,0),
(1,'','0606',18106,'','Cutervo',802,0),
(1,'','0607',18106,'','Hualgayoc',803,0),
(1,'','0608',18106,'','Jaén',804,0),
(1,'','0609',18106,'','San Ignacio',805,0),
(1,'','0610',18106,'','San Marcos',806,0),
(1,'','0611',18106,'','San Miguel',807,0),
(1,'','0612',18106,'','San Pablo',808,0),
(1,'','0613',18106,'','Santa Cruz',809,0),
(1,'','0701',18107,'','Callao',810,0),
(1,'','0801',18108,'','Cusco',811,0),
(1,'','0802',18108,'','Acomayo',812,0),
(1,'','0803',18108,'','Anta',813,0),
(1,'','0804',18108,'','Calca',814,0),
(1,'','0805',18108,'','Canas',815,0),
(1,'','0806',18108,'','Canchis',816,0),
(1,'','0807',18108,'','Chumbivilcas',817,0),
(1,'','0808',18108,'','Espinar',818,0),
(1,'','0809',18108,'','La Convención',819,0),
(1,'','0810',18108,'','Paruro',820,0),
(1,'','0811',18108,'','Paucartambo',821,0),
(1,'','0812',18108,'','Quispicanchi',822,0),
(1,'','0813',18108,'','Urubamba',823,0),
(1,'','0901',18109,'','Huancavelica',824,0),
(1,'','0902',18109,'','Acobamba',825,0),
(1,'','0903',18109,'','Angaraes',826,0),
(1,'','0904',18109,'','Castrovirreyna',827,0),
(1,'','0905',18109,'','Churcampa',828,0),
(1,'','0906',18109,'','Huaytará',829,0),
(1,'','0907',18109,'','Tayacaja',830,0),
(1,'','1001',18110,'','Huánuco',831,0),
(1,'','1002',18110,'','Ambón',832,0),
(1,'','1003',18110,'','Dos de Mayo',833,0),
(1,'','1004',18110,'','Huacaybamba',834,0),
(1,'','1005',18110,'','Huamalíes',835,0),
(1,'','1006',18110,'','Leoncio Prado',836,0),
(1,'','1007',18110,'','Marañón',837,0),
(1,'','1008',18110,'','Pachitea',838,0),
(1,'','1009',18110,'','Puerto Inca',839,0),
(1,'','1010',18110,'','Lauricocha',840,0),
(1,'','1011',18110,'','Yarowilca',841,0),
(1,'','1101',18111,'','Ica',842,0),
(1,'','1102',18111,'','Chincha',843,0),
(1,'','1103',18111,'','Nazca',844,0),
(1,'','1104',18111,'','Palpa',845,0),
(1,'','1105',18111,'','Pisco',846,0),
(1,'','1201',18112,'','Huancayo',847,0),
(1,'','1202',18112,'','Concepción',848,0),
(1,'','1203',18112,'','Chanchamayo',849,0),
(1,'','1204',18112,'','Jauja',850,0),
(1,'','1205',18112,'','Junín',851,0),
(1,'','1206',18112,'','Satipo',852,0),
(1,'','1207',18112,'','Tarma',853,0),
(1,'','1208',18112,'','Yauli',854,0),
(1,'','1209',18112,'','Chupaca',855,0),
(1,'','1301',18113,'','Trujillo',856,0),
(1,'','1302',18113,'','Ascope',857,0),
(1,'','1303',18113,'','Bolívar',858,0),
(1,'','1304',18113,'','Chepén',859,0),
(1,'','1305',18113,'','Julcán',860,0),
(1,'','1306',18113,'','Otuzco',861,0),
(1,'','1307',18113,'','Pacasmayo',862,0),
(1,'','1308',18113,'','Pataz',863,0),
(1,'','1309',18113,'','Sánchez Carrión',864,0),
(1,'','1310',18113,'','Santiago de Chuco',865,0),
(1,'','1311',18113,'','Gran Chimú',866,0),
(1,'','1312',18113,'','Virú',867,0),
(1,'','1401',18114,'','Chiclayo',868,0),
(1,'','1402',18114,'','Ferreñafe',869,0),
(1,'','1403',18114,'','Lambayeque',870,0),
(1,'','1501',18115,'','Lima',871,0),
(1,'','1502',18116,'','Huaura',872,0),
(1,'','1503',18116,'','Barranca',873,0),
(1,'','1504',18116,'','Cajatambo',874,0),
(1,'','1505',18116,'','Canta',875,0),
(1,'','1506',18116,'','Cañete',876,0),
(1,'','1507',18116,'','Huaral',877,0),
(1,'','1508',18116,'','Huarochirí',878,0),
(1,'','1509',18116,'','Oyón',879,0),
(1,'','1510',18116,'','Yauyos',880,0),
(1,'','1601',18117,'','Maynas',881,0),
(1,'','1602',18117,'','Alto Amazonas',882,0),
(1,'','1603',18117,'','Loreto',883,0),
(1,'','1604',18117,'','Mariscal Ramón Castilla',884,0),
(1,'','1605',18117,'','Requena',885,0),
(1,'','1606',18117,'','Ucayali',886,0),
(1,'','1607',18117,'','Datem del Marañón',887,0),
(1,'','1701',18118,'','Tambopata',888,0),
(1,'','1702',18118,'','Manú',889,0),
(1,'','1703',18118,'','Tahuamanu',890,0),
(1,'','1801',18119,'','Mariscal Nieto',891,0),
(1,'','1802',18119,'','General Sánchez Cerro',892,0),
(1,'','1803',18119,'','Ilo',893,0),
(1,'','1901',18120,'','Pasco',894,0),
(1,'','1902',18120,'','Daniel Alcides Carrión',895,0),
(1,'','1903',18120,'','Oxapampa',896,0),
(1,'','2001',18121,'','Piura',897,0),
(1,'','2002',18121,'','Ayabaca',898,0),
(1,'','2003',18121,'','Huancabamba',899,0),
(1,'','2004',18121,'','Morropón',900,0),
(1,'','2005',18121,'','Paita',901,0),
(1,'','2006',18121,'','Sullana',902,0),
(1,'','2007',18121,'','Talara',903,0),
(1,'','2008',18121,'','Sechura',904,0),
(1,'','2101',18122,'','Puno',905,0),
(1,'','2102',18122,'','Azángaro',906,0),
(1,'','2103',18122,'','Carabaya',907,0),
(1,'','2104',18122,'','Chucuito',908,0),
(1,'','2105',18122,'','El Collao',909,0),
(1,'','2106',18122,'','Huancané',910,0),
(1,'','2107',18122,'','Lampa',911,0),
(1,'','2108',18122,'','Melgar',912,0),
(1,'','2109',18122,'','Moho',913,0),
(1,'','2110',18122,'','San Antonio de Putina',914,0),
(1,'','2111',18122,'','San Román',915,0),
(1,'','2112',18122,'','Sandia',916,0),
(1,'','2113',18122,'','Yunguyo',917,0),
(1,'','2201',18123,'','Moyobamba',918,0),
(1,'','2202',18123,'','Bellavista',919,0),
(1,'','2203',18123,'','El Dorado',920,0),
(1,'','2204',18123,'','Huallaga',921,0),
(1,'','2205',18123,'','Lamas',922,0),
(1,'','2206',18123,'','Mariscal Cáceres',923,0),
(1,'','2207',18123,'','Picota',924,0),
(1,'','2208',18123,'','La Rioja',925,0),
(1,'','2209',18123,'','San Martín',926,0),
(1,'','2210',18123,'','Tocache',927,0),
(1,'','2301',18124,'','Tacna',928,0),
(1,'','2302',18124,'','Candarave',929,0),
(1,'','2303',18124,'','Jorge Basadre',930,0),
(1,'','2304',18124,'','Tarata',931,0),
(1,'','2401',18125,'','Tumbes',932,0),
(1,'','2402',18125,'','Contralmirante Villar',933,0),
(1,'','2403',18125,'','Zarumilla',934,0),
(1,'','2501',18126,'','Coronel Portillo',935,0),
(1,'','2502',18126,'','Atalaya',936,0),
(1,'','2503',18126,'','Padre Abad',937,0),
(1,'','2504',18126,'','Purús',938,0),
(1,NULL,'PT-AV',15001,'AVEIRO','Aveiro',939,NULL),
(1,NULL,'PT-AC',15002,'AZORES','Azores',940,NULL),
(1,NULL,'PT-BE',15001,'BEJA','Beja',941,NULL),
(1,NULL,'PT-BR',15001,'BRAGA','Braga',942,NULL),
(1,NULL,'PT-BA',15001,'BRAGANCA','Bragança',943,NULL),
(1,NULL,'PT-CB',15001,'CASTELO BRANCO','Castelo Branco',944,NULL),
(1,NULL,'PT-CO',15001,'COIMBRA','Coimbra',945,NULL),
(1,NULL,'PT-EV',15001,'EVORA','Évora',946,NULL),
(1,NULL,'PT-FA',15001,'FARO','Faro',947,NULL),
(1,NULL,'PT-GU',15001,'GUARDA','Guarda',948,NULL),
(1,NULL,'PT-LE',15001,'LEIRIA','Leiria',949,NULL),
(1,NULL,'PT-LI',15001,'LISBON','Lisboa',950,NULL),
(1,NULL,'PT-AML',15001,'AREA METROPOLITANA LISBOA','Área Metropolitana de Lisboa',951,NULL),
(1,NULL,'PT-MA',15002,'MADEIRA','Madeira',952,NULL),
(1,NULL,'PT-PA',15001,'PORTALEGRE','Portalegre',953,NULL),
(1,NULL,'PT-PO',15001,'PORTO','Porto',954,NULL),
(1,NULL,'PT-SA',15001,'SANTAREM','Santarém',955,NULL),
(1,NULL,'PT-SE',15001,'SETUBAL','Setúbal',956,NULL),
(1,NULL,'PT-VC',15001,'VIANA DO CASTELO','Viana Do Castelo',957,NULL),
(1,NULL,'PT-VR',15001,'VILA REAL','Vila Real',958,NULL),
(1,NULL,'PT-VI',15001,'VISEU','Viseu',959,NULL),
(1,'','AB',18801,'','Alba',960,0),
(1,'','AR',18801,'','Arad',961,0),
(1,'','AG',18801,'','Argeș',962,0),
(1,'','BC',18801,'','Bacău',963,0),
(1,'','BH',18801,'','Bihor',964,0),
(1,'','BN',18801,'','Bistrița-Năsăud',965,0),
(1,'','BT',18801,'','Botoșani',966,0),
(1,'','BV',18801,'','Brașov',967,0),
(1,'','BR',18801,'','Brăila',968,0),
(1,'','BU',18801,'','Bucuresti',969,0),
(1,'','BZ',18801,'','Buzău',970,0),
(1,'','CL',18801,'','Călărași',971,0),
(1,'','CS',18801,'','Caraș-Severin',972,0),
(1,'','CJ',18801,'','Cluj',973,0),
(1,'','CT',18801,'','Constanța',974,0),
(1,'','CV',18801,'','Covasna',975,0),
(1,'','DB',18801,'','Dâmbovița',976,0),
(1,'','DJ',18801,'','Dolj',977,0),
(1,'','GL',18801,'','Galați',978,0),
(1,'','GR',18801,'','Giurgiu',979,0),
(1,'','GJ',18801,'','Gorj',980,0),
(1,'','HR',18801,'','Harghita',981,0),
(1,'','HD',18801,'','Hunedoara',982,0),
(1,'','IL',18801,'','Ialomița',983,0),
(1,'','IS',18801,'','Iași',984,0),
(1,'','IF',18801,'','Ilfov',985,0),
(1,'','MM',18801,'','Maramureș',986,0),
(1,'','MH',18801,'','Mehedinți',987,0),
(1,'','MS',18801,'','Mureș',988,0),
(1,'','NT',18801,'','Neamț',989,0),
(1,'','OT',18801,'','Olt',990,0),
(1,'','PH',18801,'','Prahova',991,0),
(1,'','SM',18801,'','Satu Mare',992,0),
(1,'','SJ',18801,'','Sălaj',993,0),
(1,'','SB',18801,'','Sibiu',994,0),
(1,'','SV',18801,'','Suceava',995,0),
(1,'','TR',18801,'','Teleorman',996,0),
(1,'','TM',18801,'','Timiș',997,0),
(1,'','TL',18801,'','Tulcea',998,0),
(1,'','VS',18801,'','Vaslui',999,0),
(1,'','VL',18801,'','Vâlcea',1000,0),
(1,'','VN',18801,'','Vrancea',1001,0),
(1,'','SS',8601,'','San Salvador',1002,0),
(1,'','LL',8601,'','La Libertad',1003,0),
(1,'','CH',8601,'','Chalatenango',1004,0),
(1,'','CA',8601,'','Cabañas',1005,0),
(1,'','LP',8601,'','La Paz',1006,0),
(1,'','SV',8601,'','San Vicente',1007,0),
(1,'','CU',8601,'','Cuscatlan',1008,0),
(1,'','US',8602,'','Usulutan',1009,0),
(1,'','SM',8602,'','San Miguel',1010,0),
(1,'','MO',8602,'','Morazan',1011,0),
(1,'','LU',8602,'','La Union',1012,0),
(1,'','AH',8603,'','Ahuachapan',1013,0),
(1,'','SA',8603,'','Santa Ana',1014,0),
(1,'','SO',8603,'','Sonsonate',1015,0),
(1,NULL,'SI031',20203,'MURA','Mura',1016,NULL),
(1,NULL,'SI032',20203,'DRAVA','Drava',1017,NULL),
(1,NULL,'SI033',20203,'CARINTHIA','Carinthia',1018,NULL),
(1,NULL,'SI034',20203,'SAVINJA','Savinja',1019,NULL),
(1,NULL,'SI035',20203,'CENTRAL SAVA','Central Sava',1020,NULL),
(1,NULL,'SI036',20203,'LOWER SAVA','Lower Sava',1021,NULL),
(1,NULL,'SI037',20203,'SOUTHEAST SLOVENIA','Southeast Slovenia',1022,NULL),
(1,NULL,'SI038',20203,'LITTORAL–INNER CARNIOLA','Littoral–Inner Carniola',1023,NULL),
(1,NULL,'SI041',20204,'CENTRAL SLOVENIA','Central Slovenia',1024,NULL),
(1,NULL,'SI038',20204,'UPPER CARNIOLA','Upper Carniola',1025,NULL),
(1,NULL,'SI043',20204,'GORIZIA','Gorizia',1026,NULL),
(1,NULL,'SI044',20204,'COASTAL–KARST','Coastal–Karst',1027,NULL),
(1,NULL,'AG',601,'ARGOVIE','Argovie',1028,NULL),
(1,NULL,'AI',601,'APPENZELL RHODES INTERIEURES','Appenzell Rhodes intérieures',1029,NULL),
(1,NULL,'AR',601,'APPENZELL RHODES EXTERIEURES','Appenzell Rhodes extérieures',1030,NULL),
(1,NULL,'BE',601,'BERNE','Berne',1031,NULL),
(1,NULL,'BL',601,'BALE CAMPAGNE','Bâle Campagne',1032,NULL),
(1,NULL,'BS',601,'BALE VILLE','Bâle Ville',1033,NULL),
(1,NULL,'FR',601,'FRIBOURG','Fribourg',1034,NULL),
(1,NULL,'GE',601,'GENEVE','Genève',1035,NULL),
(1,NULL,'GL',601,'GLARIS','Glaris',1036,NULL),
(1,NULL,'GR',601,'GRISONS','Grisons',1037,NULL),
(1,NULL,'JU',601,'JURA','Jura',1038,NULL),
(1,NULL,'LU',601,'LUCERNE','Lucerne',1039,NULL),
(1,NULL,'NE',601,'NEUCHATEL','Neuchâtel',1040,NULL),
(1,NULL,'NW',601,'NIDWALD','Nidwald',1041,NULL),
(1,NULL,'OW',601,'OBWALD','Obwald',1042,NULL),
(1,NULL,'SG',601,'SAINT-GALL','Saint-Gall',1043,NULL),
(1,NULL,'SH',601,'SCHAFFHOUSE','Schaffhouse',1044,NULL),
(1,NULL,'SO',601,'SOLEURE','Soleure',1045,NULL),
(1,NULL,'SZ',601,'SCHWYZ','Schwyz',1046,NULL),
(1,NULL,'TG',601,'THURGOVIE','Thurgovie',1047,NULL),
(1,NULL,'TI',601,'TESSIN','Tessin',1048,NULL),
(1,NULL,'UR',601,'URI','Uri',1049,NULL),
(1,NULL,'VD',601,'VAUD','Vaud',1050,NULL),
(1,NULL,'VS',601,'VALAIS','Valais',1051,NULL),
(1,NULL,'ZG',601,'ZUG','Zug',1052,NULL),
(1,NULL,'ZH',601,'ZURICH','Zürich',1053,NULL),
(1,'KLU','TW-KLU',21301,NULL,'基隆市',1054,NULL),
(1,'TPE','TW-TPE',21301,NULL,'臺北市',1055,NULL),
(1,'TPH','TW-TPH',21301,NULL,'新北市',1056,NULL),
(1,'TYC','TW-TYC',21301,NULL,'桃園市',1057,NULL),
(1,'HSH','TW-HSH',21301,NULL,'新竹縣',1058,NULL),
(1,'HSC','TW-HSC',21301,NULL,'新竹市',1059,NULL),
(1,'MAL','TW-MAL',21301,NULL,'苗栗縣',1060,NULL),
(1,'MAC','TW-MAC',21301,NULL,'苗栗市',1061,NULL),
(1,'TXG','TW-TXG',21301,NULL,'臺中市',1062,NULL),
(1,'CWH','TW-CWH',21301,NULL,'彰化縣',1063,NULL),
(1,'CWS','TW-CWS',21301,NULL,'彰化市',1064,NULL),
(1,'NTC','TW-NTC',21301,NULL,'南投市',1065,NULL),
(1,'NTO','TW-NTO',21301,NULL,'南投縣',1066,NULL),
(1,'YLH','TW-YLH',21301,NULL,'雲林縣',1067,NULL),
(1,'CHY','TW-CHY',21301,NULL,'嘉義縣',1068,NULL),
(1,'CYI','TW-CYI',21301,NULL,'嘉義市',1069,NULL),
(1,'TNN','TW-TNN',21301,NULL,'臺南市',1070,NULL),
(1,'KHH','TW-KHH',21301,NULL,'高雄市',1071,NULL),
(1,'IUH','TW-IUH',21301,NULL,'屏東縣',1072,NULL),
(1,'PTS','TW-PTS',21301,NULL,'屏東市',1073,NULL),
(1,'ILN','TW-ILN',21301,NULL,'宜蘭縣',1074,NULL),
(1,'ILC','TW-ILC',21301,NULL,'宜蘭市',1075,NULL),
(1,'HWA','TW-HWA',21301,NULL,'花蓮縣',1076,NULL),
(1,'HWC','TW-HWC',21301,NULL,'花蓮市',1077,NULL),
(1,'TTC','TW-TTC',21301,NULL,'臺東市',1078,NULL),
(1,'TTT','TW-TTT',21301,NULL,'臺東縣',1079,NULL),
(1,'PEH','TW-PEH',21301,NULL,'澎湖縣',1080,NULL),
(1,'GNI','TW-GNI',21301,NULL,'綠島',1081,NULL),
(1,'KYD','TW-KYD',21301,NULL,'蘭嶼',1082,NULL),
(1,'KMN','TW-KMN',21301,NULL,'金門縣',1083,NULL),
(1,'LNN','TW-LNN',21301,NULL,'連江縣',1084,NULL),
(1,'','TN01',1001,'','Ariana',1085,0),
(1,'','TN02',1001,'','Béja',1086,0),
(1,'','TN03',1001,'','Ben Arous',1087,0),
(1,'','TN04',1001,'','Bizerte',1088,0),
(1,'','TN05',1001,'','Gabès',1089,0),
(1,'','TN06',1001,'','Gafsa',1090,0),
(1,'','TN07',1001,'','Jendouba',1091,0),
(1,'','TN08',1001,'','Kairouan',1092,0),
(1,'','TN09',1001,'','Kasserine',1093,0),
(1,'','TN10',1001,'','Kébili',1094,0),
(1,'','TN11',1001,'','La Manouba',1095,0),
(1,'','TN12',1001,'','Le Kef',1096,0),
(1,'','TN13',1001,'','Mahdia',1097,0),
(1,'','TN14',1001,'','Médenine',1098,0),
(1,'','TN15',1001,'','Monastir',1099,0),
(1,'','TN16',1001,'','Nabeul',1100,0),
(1,'','TN17',1001,'','Sfax',1101,0),
(1,'','TN18',1001,'','Sidi Bouzid',1102,0),
(1,'','TN19',1001,'','Siliana',1103,0),
(1,'','TN20',1001,'','Sousse',1104,0),
(1,'','TN21',1001,'','Tataouine',1105,0),
(1,'','TN22',1001,'','Tozeur',1106,0),
(1,'','TN23',1001,'','Tunis',1107,0),
(1,'','TN24',1001,'','Zaghouan',1108,0),
(1,'','AL',1101,'ALABAMA','Alabama',1109,0),
(1,'','AK',1101,'ALASKA','Alaska',1110,0),
(1,'','AZ',1101,'ARIZONA','Arizona',1111,0),
(1,'','AR',1101,'ARKANSAS','Arkansas',1112,0),
(1,'','CA',1101,'CALIFORNIA','California',1113,0),
(1,'','CO',1101,'COLORADO','Colorado',1114,0),
(1,'','CT',1101,'CONNECTICUT','Connecticut',1115,0),
(1,'','DE',1101,'DELAWARE','Delaware',1116,0),
(1,'','FL',1101,'FLORIDA','Florida',1117,0),
(1,'','GA',1101,'GEORGIA','Georgia',1118,0),
(1,'','HI',1101,'HAWAII','Hawaii',1119,0),
(1,'','ID',1101,'IDAHO','Idaho',1120,0),
(1,'','IL',1101,'ILLINOIS','Illinois',1121,0),
(1,'','IN',1101,'INDIANA','Indiana',1122,0),
(1,'','IA',1101,'IOWA','Iowa',1123,0),
(1,'','KS',1101,'KANSAS','Kansas',1124,0),
(1,'','KY',1101,'KENTUCKY','Kentucky',1125,0),
(1,'','LA',1101,'LOUISIANA','Louisiana',1126,0),
(1,'','ME',1101,'MAINE','Maine',1127,0),
(1,'','MD',1101,'MARYLAND','Maryland',1128,0),
(1,'','MA',1101,'MASSACHUSSETTS','Massachusetts',1129,0),
(1,'','MI',1101,'MICHIGAN','Michigan',1130,0),
(1,'','MN',1101,'MINNESOTA','Minnesota',1131,0),
(1,'','MS',1101,'MISSISSIPPI','Mississippi',1132,0),
(1,'','MO',1101,'MISSOURI','Missouri',1133,0),
(1,'','MT',1101,'MONTANA','Montana',1134,0),
(1,'','NE',1101,'NEBRASKA','Nebraska',1135,0),
(1,'','NV',1101,'NEVADA','Nevada',1136,0),
(1,'','NH',1101,'NEW HAMPSHIRE','New Hampshire',1137,0),
(1,'','NJ',1101,'NEW JERSEY','New Jersey',1138,0),
(1,'','NM',1101,'NEW MEXICO','New Mexico',1139,0),
(1,'','NY',1101,'NEW YORK','New York',1140,0),
(1,'','NC',1101,'NORTH CAROLINA','North Carolina',1141,0),
(1,'','ND',1101,'NORTH DAKOTA','North Dakota',1142,0),
(1,'','OH',1101,'OHIO','Ohio',1143,0),
(1,'','OK',1101,'OKLAHOMA','Oklahoma',1144,0),
(1,'','OR',1101,'OREGON','Oregon',1145,0),
(1,'','PA',1101,'PENNSYLVANIA','Pennsylvania',1146,0),
(1,'','RI',1101,'RHODE ISLAND','Rhode Island',1147,0),
(1,'','SC',1101,'SOUTH CAROLINA','South Carolina',1148,0),
(1,'','SD',1101,'SOUTH DAKOTA','South Dakota',1149,0),
(1,'','TN',1101,'TENNESSEE','Tennessee',1150,0),
(1,'','TX',1101,'TEXAS','Texas',1151,0),
(1,'','UT',1101,'UTAH','Utah',1152,0),
(1,'','VT',1101,'VERMONT','Vermont',1153,0),
(1,'','VA',1101,'VIRGINIA','Virginia',1154,0),
(1,'','WA',1101,'WASHINGTON','Washington',1155,0),
(1,'','WV',1101,'WEST VIRGINIA','West Virginia',1156,0),
(1,'','WI',1101,'WISCONSIN','Wisconsin',1157,0),
(1,'','WY',1101,'WYOMING','Wyoming',1158,0),
(1,'','001',5201,'','Belisario Boeto',1159,0),
(1,'','002',5201,'','Hernando Siles',1160,0),
(1,'','003',5201,'','Jaime Zudáñez',1161,0),
(1,'','004',5201,'','Juana Azurduy de Padilla',1162,0),
(1,'','005',5201,'','Luis Calvo',1163,0),
(1,'','006',5201,'','Nor Cinti',1164,0),
(1,'','007',5201,'','Oropeza',1165,0),
(1,'','008',5201,'','Sud Cinti',1166,0),
(1,'','009',5201,'','Tomina',1167,0),
(1,'','010',5201,'','Yamparáez',1168,0),
(1,'','011',5202,'','Abel Iturralde',1169,0),
(1,'','012',5202,'','Aroma',1170,0),
(1,'','013',5202,'','Bautista Saavedra',1171,0),
(1,'','014',5202,'','Caranavi',1172,0),
(1,'','015',5202,'','Eliodoro Camacho',1173,0),
(1,'','016',5202,'','Franz Tamayo',1174,0),
(1,'','017',5202,'','Gualberto Villarroel',1175,0),
(1,'','018',5202,'','Ingaví',1176,0),
(1,'','019',5202,'','Inquisivi',1177,0),
(1,'','020',5202,'','José Ramón Loayza',1178,0),
(1,'','021',5202,'','Larecaja',1179,0),
(1,'','022',5202,'','Los Andes (Bolivia)',1180,0),
(1,'','023',5202,'','Manco Kapac',1181,0),
(1,'','024',5202,'','Muñecas',1182,0),
(1,'','025',5202,'','Nor Yungas',1183,0),
(1,'','026',5202,'','Omasuyos',1184,0),
(1,'','027',5202,'','Pacajes',1185,0),
(1,'','028',5202,'','Pedro Domingo Murillo',1186,0),
(1,'','029',5202,'','Sud Yungas',1187,0),
(1,'','030',5202,'','General José Manuel Pando',1188,0),
(1,'','031',5203,'','Arani',1189,0),
(1,'','032',5203,'','Arque',1190,0),
(1,'','033',5203,'','Ayopaya',1191,0),
(1,'','034',5203,'','Bolívar (Bolivia)',1192,0),
(1,'','035',5203,'','Campero',1193,0),
(1,'','036',5203,'','Capinota',1194,0),
(1,'','037',5203,'','Cercado (Cochabamba)',1195,0),
(1,'','038',5203,'','Esteban Arze',1196,0),
(1,'','039',5203,'','Germán Jordán',1197,0),
(1,'','040',5203,'','José Carrasco',1198,0),
(1,'','041',5203,'','Mizque',1199,0),
(1,'','042',5203,'','Punata',1200,0),
(1,'','043',5203,'','Quillacollo',1201,0),
(1,'','044',5203,'','Tapacarí',1202,0),
(1,'','045',5203,'','Tiraque',1203,0),
(1,'','046',5203,'','Chapare',1204,0),
(1,'','047',5204,'','Carangas',1205,0),
(1,'','048',5204,'','Cercado (Oruro)',1206,0),
(1,'','049',5204,'','Eduardo Avaroa',1207,0),
(1,'','050',5204,'','Ladislao Cabrera',1208,0),
(1,'','051',5204,'','Litoral de Atacama',1209,0),
(1,'','052',5204,'','Mejillones',1210,0),
(1,'','053',5204,'','Nor Carangas',1211,0),
(1,'','054',5204,'','Pantaleón Dalence',1212,0),
(1,'','055',5204,'','Poopó',1213,0),
(1,'','056',5204,'','Sabaya',1214,0),
(1,'','057',5204,'','Sajama',1215,0),
(1,'','058',5204,'','San Pedro de Totora',1216,0),
(1,'','059',5204,'','Saucarí',1217,0),
(1,'','060',5204,'','Sebastián Pagador',1218,0),
(1,'','061',5204,'','Sud Carangas',1219,0),
(1,'','062',5204,'','Tomás Barrón',1220,0),
(1,'','063',5205,'','Alonso de Ibáñez',1221,0),
(1,'','064',5205,'','Antonio Quijarro',1222,0),
(1,'','065',5205,'','Bernardino Bilbao',1223,0),
(1,'','066',5205,'','Charcas (Potosí)',1224,0),
(1,'','067',5205,'','Chayanta',1225,0),
(1,'','068',5205,'','Cornelio Saavedra',1226,0),
(1,'','069',5205,'','Daniel Campos',1227,0),
(1,'','070',5205,'','Enrique Baldivieso',1228,0),
(1,'','071',5205,'','José María Linares',1229,0),
(1,'','072',5205,'','Modesto Omiste',1230,0),
(1,'','073',5205,'','Nor Chichas',1231,0),
(1,'','074',5205,'','Nor Lípez',1232,0),
(1,'','075',5205,'','Rafael Bustillo',1233,0),
(1,'','076',5205,'','Sud Chichas',1234,0),
(1,'','077',5205,'','Sud Lípez',1235,0),
(1,'','078',5205,'','Tomás Frías',1236,0),
(1,'','079',5206,'','Aniceto Arce',1237,0),
(1,'','080',5206,'','Burdet O\'Connor',1238,0),
(1,'','081',5206,'','Cercado (Tarija)',1239,0),
(1,'','082',5206,'','Eustaquio Méndez',1240,0),
(1,'','083',5206,'','José María Avilés',1241,0),
(1,'','084',5206,'','Gran Chaco',1242,0),
(1,'','085',5207,'','Andrés Ibáñez',1243,0),
(1,'','086',5207,'','Caballero',1244,0),
(1,'','087',5207,'','Chiquitos',1245,0),
(1,'','088',5207,'','Cordillera (Bolivia)',1246,0),
(1,'','089',5207,'','Florida',1247,0),
(1,'','090',5207,'','Germán Busch',1248,0),
(1,'','091',5207,'','Guarayos',1249,0),
(1,'','092',5207,'','Ichilo',1250,0),
(1,'','093',5207,'','Obispo Santistevan',1251,0),
(1,'','094',5207,'','Sara',1252,0),
(1,'','095',5207,'','Vallegrande',1253,0),
(1,'','096',5207,'','Velasco',1254,0),
(1,'','097',5207,'','Warnes',1255,0),
(1,'','098',5207,'','Ángel Sandóval',1256,0),
(1,'','099',5207,'','Ñuflo de Chaves',1257,0),
(1,'','100',5208,'','Cercado (Beni)',1258,0),
(1,'','101',5208,'','Iténez',1259,0),
(1,'','102',5208,'','Mamoré',1260,0),
(1,'','103',5208,'','Marbán',1261,0),
(1,'','104',5208,'','Moxos',1262,0),
(1,'','105',5208,'','Vaca Díez',1263,0),
(1,'','106',5208,'','Yacuma',1264,0),
(1,'','107',5208,'','General José Ballivián Segurola',1265,0),
(1,'','108',5209,'','Abuná',1266,0),
(1,'','109',5209,'','Madre de Dios',1267,0),
(1,'','110',5209,'','Manuripi',1268,0),
(1,'','111',5209,'','Nicolás Suárez',1269,0),
(1,'','112',5209,'','General Federico Román',1270,0),
(1,'01','VI',419,'ALAVA','Álava',1271,19),
(1,'02','AB',404,'ALBACETE','Albacete',1272,4),
(1,'03','A',411,'ALICANTE','Alicante',1273,11),
(1,'04','AL',401,'ALMERIA','Almería',1274,1),
(1,'33','O',418,'ASTURIAS','Asturias',1275,18),
(1,'05','AV',403,'AVILA','Ávila',1276,3),
(1,'06','BA',412,'BADAJOZ','Badajoz',1277,12),
(1,'08','B',406,'BARCELONA','Barcelona',1278,6),
(1,'09','BU',403,'BURGOS','Burgos',1279,8),
(1,'10','CC',412,'CACERES','Cáceres',1280,12),
(1,'11','CA',401,'CADIZ','Cádiz',1281,1),
(1,'39','S',410,'CANTABRIA','Cantabria',1282,10),
(1,'12','CS',411,'CASTELLON','Castellón',1283,11),
(1,'51','CE',407,'CEUTA','Ceuta',1284,7),
(1,'13','CR',404,'CIUDAD REAL','Ciudad Real',1285,4),
(1,'14','CO',401,'CORDOBA','Córdoba',1286,1),
(1,'16','CU',404,'CUENCA','Cuenca',1287,4),
(1,'17','GI',406,'GERONA','Gerona',1288,6),
(1,'18','GR',401,'GRANADA','Granada',1289,1),
(1,'19','GU',404,'GUADALAJARA','Guadalajara',1290,4),
(1,'20','SS',419,'GUIPUZCOA','Guipúzcoa',1291,19),
(1,'21','H',401,'HUELVA','Huelva',1292,1),
(1,'22','HU',402,'HUESCA','Huesca',1293,2),
(1,'07','PM',414,'ISLAS BALEARES','Islas Baleares',1294,14),
(1,'23','J',401,'JAEN','Jaén',1295,1),
(1,'15','C',413,'LA CORUÑA','La Coruña',1296,13),
(1,'26','LO',415,'LA RIOJA','La Rioja',1297,15),
(1,'35','GC',405,'LAS PALMAS','Las Palmas',1298,5),
(1,'24','LE',403,'LEON','León',1299,3),
(1,'25','L',406,'LERIDA','Lérida',1300,6),
(1,'27','LU',413,'LUGO','Lugo',1301,13),
(1,'28','M',416,'MADRID','Madrid',1302,16),
(1,'29','MA',401,'MALAGA','Málaga',1303,1),
(1,'52','ML',409,'MELILLA','Melilla',1304,9),
(1,'30','MU',417,'MURCIA','Murcia',1305,17),
(1,'31','NA',408,'NAVARRA','Navarra',1306,8),
(1,'32','OR',413,'ORENSE','Orense',1307,13),
(1,'34','P',403,'PALENCIA','Palencia',1308,3),
(1,'36','PO',413,'PONTEVEDRA','Pontevedra',1309,13),
(1,'37','SA',403,'SALAMANCA','Salamanca',1310,3),
(1,'38','TF',405,'STA. CRUZ DE TENERIFE','Santa Cruz de Tenerife',1311,5),
(1,'40','SG',403,'SEGOVIA','Segovia',1312,3),
(1,'41','SE',401,'SEVILLA','Sevilla',1313,1),
(1,'42','SO',403,'SORIA','Soria',1314,3),
(1,'43','T',406,'TARRAGONA','Tarragona',1315,6),
(1,'44','TE',402,'TERUEL','Teruel',1316,2),
(1,'45','TO',404,'TOLEDO','Toledo',1317,5),
(1,'46','V',411,'VALENCIA','Valencia',1318,11),
(1,'47','VA',403,'VALLADOLID','Valladolid',1319,3),
(1,'48','BI',419,'VIZCAYA','Vizcaya',1320,19),
(1,'49','ZA',403,'ZAMORA','Zamora',1321,3),
(1,'50','Z',402,'ZARAGOZA','Zaragoza',1322,1),
(1,NULL,'701',701,NULL,'Bedfordshire',1323,0),
(1,NULL,'702',701,NULL,'Berkshire',1324,0),
(1,NULL,'703',701,NULL,'Bristol, City of',1325,0),
(1,NULL,'704',701,NULL,'Buckinghamshire',1326,0),
(1,NULL,'705',701,NULL,'Cambridgeshire',1327,0),
(1,NULL,'706',701,NULL,'Cheshire',1328,0),
(1,NULL,'707',701,NULL,'Cleveland',1329,0),
(1,NULL,'708',701,NULL,'Cornwall',1330,0),
(1,NULL,'709',701,NULL,'Cumberland',1331,0),
(1,NULL,'710',701,NULL,'Cumbria',1332,0),
(1,NULL,'711',701,NULL,'Derbyshire',1333,0),
(1,NULL,'712',701,NULL,'Devon',1334,0),
(1,NULL,'713',701,NULL,'Dorset',1335,0),
(1,NULL,'714',701,NULL,'Co. Durham',1336,0),
(1,NULL,'715',701,NULL,'East Riding of Yorkshire',1337,0),
(1,NULL,'716',701,NULL,'East Sussex',1338,0),
(1,NULL,'717',701,NULL,'Essex',1339,0),
(1,NULL,'718',701,NULL,'Gloucestershire',1340,0),
(1,NULL,'719',701,NULL,'Greater Manchester',1341,0),
(1,NULL,'720',701,NULL,'Hampshire',1342,0),
(1,NULL,'721',701,NULL,'Hertfordshire',1343,0),
(1,NULL,'722',701,NULL,'Hereford and Worcester',1344,0),
(1,NULL,'723',701,NULL,'Herefordshire',1345,0),
(1,NULL,'724',701,NULL,'Huntingdonshire',1346,0),
(1,NULL,'725',701,NULL,'Isle of Man',1347,0),
(1,NULL,'726',701,NULL,'Isle of Wight',1348,0),
(1,NULL,'727',701,NULL,'Jersey',1349,0),
(1,NULL,'728',701,NULL,'Kent',1350,0),
(1,NULL,'729',701,NULL,'Lancashire',1351,0),
(1,NULL,'730',701,NULL,'Leicestershire',1352,0),
(1,NULL,'731',701,NULL,'Lincolnshire',1353,0),
(1,NULL,'732',701,NULL,'London - City of London',1354,0),
(1,NULL,'733',701,NULL,'Merseyside',1355,0),
(1,NULL,'734',701,NULL,'Middlesex',1356,0),
(1,NULL,'735',701,NULL,'Norfolk',1357,0),
(1,NULL,'736',701,NULL,'North Yorkshire',1358,0),
(1,NULL,'737',701,NULL,'North Riding of Yorkshire',1359,0),
(1,NULL,'738',701,NULL,'Northamptonshire',1360,0),
(1,NULL,'739',701,NULL,'Northumberland',1361,0),
(1,NULL,'740',701,NULL,'Nottinghamshire',1362,0),
(1,NULL,'741',701,NULL,'Oxfordshire',1363,0),
(1,NULL,'742',701,NULL,'Rutland',1364,0),
(1,NULL,'743',701,NULL,'Shropshire',1365,0),
(1,NULL,'744',701,NULL,'Somerset',1366,0),
(1,NULL,'745',701,NULL,'Staffordshire',1367,0),
(1,NULL,'746',701,NULL,'Suffolk',1368,0),
(1,NULL,'747',701,NULL,'Surrey',1369,0),
(1,NULL,'748',701,NULL,'Sussex',1370,0),
(1,NULL,'749',701,NULL,'Tyne and Wear',1371,0),
(1,NULL,'750',701,NULL,'Warwickshire',1372,0),
(1,NULL,'751',701,NULL,'West Midlands',1373,0),
(1,NULL,'752',701,NULL,'West Sussex',1374,0),
(1,NULL,'753',701,NULL,'West Yorkshire',1375,0),
(1,NULL,'754',701,NULL,'West Riding of Yorkshire',1376,0),
(1,NULL,'755',701,NULL,'Wiltshire',1377,0),
(1,NULL,'756',701,NULL,'Worcestershire',1378,0),
(1,NULL,'757',701,NULL,'Yorkshire',1379,0),
(1,NULL,'758',702,NULL,'Anglesey',1380,0),
(1,NULL,'759',702,NULL,'Breconshire',1381,0),
(1,NULL,'760',702,NULL,'Caernarvonshire',1382,0),
(1,NULL,'761',702,NULL,'Cardiganshire',1383,0),
(1,NULL,'762',702,NULL,'Carmarthenshire',1384,0),
(1,NULL,'763',702,NULL,'Ceredigion',1385,0),
(1,NULL,'764',702,NULL,'Denbighshire',1386,0),
(1,NULL,'765',702,NULL,'Flintshire',1387,0),
(1,NULL,'766',702,NULL,'Glamorgan',1388,0),
(1,NULL,'767',702,NULL,'Gwent',1389,0),
(1,NULL,'768',702,NULL,'Gwynedd',1390,0),
(1,NULL,'769',702,NULL,'Merionethshire',1391,0),
(1,NULL,'770',702,NULL,'Monmouthshire',1392,0),
(1,NULL,'771',702,NULL,'Mid Glamorgan',1393,0),
(1,NULL,'772',702,NULL,'Montgomeryshire',1394,0),
(1,NULL,'773',702,NULL,'Pembrokeshire',1395,0),
(1,NULL,'774',702,NULL,'Powys',1396,0),
(1,NULL,'775',702,NULL,'Radnorshire',1397,0),
(1,NULL,'776',702,NULL,'South Glamorgan',1398,0),
(1,NULL,'777',703,NULL,'Aberdeen, City of',1399,0),
(1,NULL,'778',703,NULL,'Angus',1400,0),
(1,NULL,'779',703,NULL,'Argyll',1401,0),
(1,NULL,'780',703,NULL,'Ayrshire',1402,0),
(1,NULL,'781',703,NULL,'Banffshire',1403,0),
(1,NULL,'782',703,NULL,'Berwickshire',1404,0),
(1,NULL,'783',703,NULL,'Bute',1405,0),
(1,NULL,'784',703,NULL,'Caithness',1406,0),
(1,NULL,'785',703,NULL,'Clackmannanshire',1407,0),
(1,NULL,'786',703,NULL,'Dumfriesshire',1408,0),
(1,NULL,'787',703,NULL,'Dumbartonshire',1409,0),
(1,NULL,'788',703,NULL,'Dundee, City of',1410,0),
(1,NULL,'789',703,NULL,'East Lothian',1411,0),
(1,NULL,'790',703,NULL,'Fife',1412,0),
(1,NULL,'791',703,NULL,'Inverness',1413,0),
(1,NULL,'792',703,NULL,'Kincardineshire',1414,0),
(1,NULL,'793',703,NULL,'Kinross-shire',1415,0),
(1,NULL,'794',703,NULL,'Kirkcudbrightshire',1416,0),
(1,NULL,'795',703,NULL,'Lanarkshire',1417,0),
(1,NULL,'796',703,NULL,'Midlothian',1418,0),
(1,NULL,'797',703,NULL,'Morayshire',1419,0),
(1,NULL,'798',703,NULL,'Nairnshire',1420,0),
(1,NULL,'799',703,NULL,'Orkney',1421,0),
(1,NULL,'800',703,NULL,'Peebleshire',1422,0),
(1,NULL,'801',703,NULL,'Perthshire',1423,0),
(1,NULL,'802',703,NULL,'Renfrewshire',1424,0),
(1,NULL,'803',703,NULL,'Ross & Cromarty',1425,0),
(1,NULL,'804',703,NULL,'Roxburghshire',1426,0),
(1,NULL,'805',703,NULL,'Selkirkshire',1427,0),
(1,NULL,'806',703,NULL,'Shetland',1428,0),
(1,NULL,'807',703,NULL,'Stirlingshire',1429,0),
(1,NULL,'808',703,NULL,'Sutherland',1430,0),
(1,NULL,'809',703,NULL,'West Lothian',1431,0),
(1,NULL,'810',703,NULL,'Wigtownshire',1432,0),
(1,NULL,'811',704,NULL,'Antrim',1433,0),
(1,NULL,'812',704,NULL,'Armagh',1434,0),
(1,NULL,'813',704,NULL,'Co. Down',1435,0),
(1,NULL,'814',704,NULL,'Co. Fermanagh',1436,0),
(1,NULL,'815',704,NULL,'Co. Londonderry',1437,0),
(1,NULL,'AN',11701,'AN','Andaman & Nicobar',1438,0),
(1,NULL,'AP',11701,'AP','Andhra Pradesh',1439,0),
(1,NULL,'AR',11701,'AR','Arunachal Pradesh',1440,0),
(1,NULL,'AS',11701,'AS','Assam',1441,0),
(1,NULL,'BR',11701,'BR','Bihar',1442,0),
(1,NULL,'CG',11701,'CG','Chattisgarh',1443,0),
(1,NULL,'CH',11701,'CH','Chandigarh',1444,0),
(1,NULL,'DD',11701,'DD','Daman & Diu',1445,0),
(1,NULL,'DL',11701,'DL','Delhi',1446,0),
(1,NULL,'DN',11701,'DN','Dadra and Nagar Haveli',1447,0),
(1,NULL,'GA',11701,'GA','Goa',1448,0),
(1,NULL,'GJ',11701,'GJ','Gujarat',1449,0),
(1,NULL,'HP',11701,'HP','Himachal Pradesh',1450,0),
(1,NULL,'HR',11701,'HR','Haryana',1451,0),
(1,NULL,'JH',11701,'JH','Jharkhand',1452,0),
(1,NULL,'JK',11701,'JK','Jammu & Kashmir',1453,0),
(1,NULL,'KA',11701,'KA','Karnataka',1454,0),
(1,NULL,'KL',11701,'KL','Kerala',1455,0),
(1,NULL,'LD',11701,'LD','Lakshadweep',1456,0),
(1,NULL,'MH',11701,'MH','Maharashtra',1457,0),
(1,NULL,'ML',11701,'ML','Meghalaya',1458,0),
(1,NULL,'MN',11701,'MN','Manipur',1459,0),
(1,NULL,'MP',11701,'MP','Madhya Pradesh',1460,0),
(1,NULL,'MZ',11701,'MZ','Mizoram',1461,0),
(1,NULL,'NL',11701,'NL','Nagaland',1462,0),
(1,NULL,'OR',11701,'OR','Orissa',1463,0),
(1,NULL,'PB',11701,'PB','Punjab',1464,0),
(1,NULL,'PY',11701,'PY','Puducherry',1465,0),
(1,NULL,'RJ',11701,'RJ','Rajasthan',1466,0),
(1,NULL,'SK',11701,'SK','Sikkim',1467,0),
(1,NULL,'TE',11701,'TE','Telangana',1468,0),
(1,NULL,'TN',11701,'TN','Tamil Nadu',1469,0),
(1,NULL,'TR',11701,'TR','Tripura',1470,0),
(1,NULL,'UL',11701,'UL','Uttarakhand',1471,0),
(1,NULL,'UP',11701,'UP','Uttar Pradesh',1472,0),
(1,NULL,'WB',11701,'WB','West Bengal',1473,0),
(1,NULL,'BA',11801,'BA','Bali',1474,0),
(1,NULL,'BB',11801,'BB','Bangka Belitung',1475,0),
(1,NULL,'BT',11801,'BT','Banten',1476,0),
(1,NULL,'BE',11801,'BA','Bengkulu',1477,0),
(1,NULL,'YO',11801,'YO','DI Yogyakarta',1478,0),
(1,NULL,'JK',11801,'JK','DKI Jakarta',1479,0),
(1,NULL,'GO',11801,'GO','Gorontalo',1480,0),
(1,NULL,'JA',11801,'JA','Jambi',1481,0),
(1,NULL,'JB',11801,'JB','Jawa Barat',1482,0),
(1,NULL,'JT',11801,'JT','Jawa Tengah',1483,0),
(1,NULL,'JI',11801,'JI','Jawa Timur',1484,0),
(1,NULL,'KB',11801,'KB','Kalimantan Barat',1485,0),
(1,NULL,'KS',11801,'KS','Kalimantan Selatan',1486,0),
(1,NULL,'KT',11801,'KT','Kalimantan Tengah',1487,0),
(1,NULL,'KI',11801,'KI','Kalimantan Timur',1488,0),
(1,NULL,'KU',11801,'KU','Kalimantan Utara',1489,0),
(1,NULL,'KR',11801,'KR','Kepulauan Riau',1490,0),
(1,NULL,'LA',11801,'LA','Lampung',1491,0),
(1,NULL,'MA',11801,'MA','Maluku',1492,0),
(1,NULL,'MU',11801,'MU','Maluku Utara',1493,0),
(1,NULL,'AC',11801,'AC','Nanggroe Aceh Darussalam',1494,0),
(1,NULL,'NB',11801,'NB','Nusa Tenggara Barat',1495,0),
(1,NULL,'NT',11801,'NT','Nusa Tenggara Timur',1496,0),
(1,NULL,'PA',11801,'PA','Papua',1497,0),
(1,NULL,'PB',11801,'PB','Papua Barat',1498,0),
(1,NULL,'RI',11801,'RI','Riau',1499,0),
(1,NULL,'SR',11801,'SR','Sulawesi Barat',1500,0),
(1,NULL,'SN',11801,'SN','Sulawesi Selatan',1501,0),
(1,NULL,'ST',11801,'ST','Sulawesi Tengah',1502,0),
(1,NULL,'SG',11801,'SG','Sulawesi Tenggara',1503,0),
(1,NULL,'SA',11801,'SA','Sulawesi Utara',1504,0),
(1,NULL,'SB',11801,'SB','Sumatera Barat',1505,0),
(1,NULL,'SS',11801,'SS','Sumatera Selatan',1506,0),
(1,NULL,'SU',11801,'SU','Sumatera Utara	',1507,0),
(1,'','CMX',15401,'CMX','Ciudad de México',1508,0),
(1,'','AGS',15401,'AGS','Aguascalientes',1509,0),
(1,'','BCN',15401,'BCN','Baja California Norte',1510,0),
(1,'','BCS',15401,'BCS','Baja California Sur',1511,0),
(1,'','CAM',15401,'CAM','Campeche',1512,0),
(1,'','CHP',15401,'CHP','Chiapas',1513,0),
(1,'','CHI',15401,'CHI','Chihuahua',1514,0),
(1,'','COA',15401,'COA','Coahuila',1515,0),
(1,'','COL',15401,'COL','Colima',1516,0),
(1,'','DUR',15401,'DUR','Durango',1517,0),
(1,'','GTO',15401,'GTO','Guanajuato',1518,0),
(1,'','GRO',15401,'GRO','Guerrero',1519,0),
(1,'','HGO',15401,'HGO','Hidalgo',1520,0),
(1,'','JAL',15401,'JAL','Jalisco',1521,0),
(1,'','MEX',15401,'MEX','México',1522,0),
(1,'','MIC',15401,'MIC','Michoacán de Ocampo',1523,0),
(1,'','MOR',15401,'MOR','Morelos',1524,0),
(1,'','NAY',15401,'NAY','Nayarit',1525,0),
(1,'','NLE',15401,'NLE','Nuevo León',1526,0),
(1,'','OAX',15401,'OAX','Oaxaca',1527,0),
(1,'','PUE',15401,'PUE','Puebla',1528,0),
(1,'','QRO',15401,'QRO','Querétaro',1529,0),
(1,'','ROO',15401,'ROO','Quintana Roo',1530,0),
(1,'','SLP',15401,'SLP','San Luis Potosí',1531,0),
(1,'','SIN',15401,'SIN','Sinaloa',1532,0),
(1,'','SON',15401,'SON','Sonora',1533,0),
(1,'','TAB',15401,'TAB','Tabasco',1534,0),
(1,'','TAM',15401,'TAM','Tamaulipas',1535,0),
(1,'','TLX',15401,'TLX','Tlaxcala',1536,0),
(1,'','VER',15401,'VER','Veracruz',1537,0),
(1,'','YUC',15401,'YUC','Yucatán',1538,0),
(1,'','ZAC',15401,'ZAC','Zacatecas',1539,0),
(1,'','VE-L',23201,'VE-L','Mérida',1540,0),
(1,'','VE-T',23201,'VE-T','Trujillo',1541,0),
(1,'','VE-E',23201,'VE-E','Barinas',1542,0),
(1,'','VE-M',23202,'VE-M','Miranda',1543,0),
(1,'','VE-W',23202,'VE-W','Vargas',1544,0),
(1,'','VE-A',23202,'VE-A','Distrito Capital',1545,0),
(1,'','VE-D',23203,'VE-D','Aragua',1546,0),
(1,'','VE-G',23203,'VE-G','Carabobo',1547,0),
(1,'','VE-I',23204,'VE-I','Falcón',1548,0),
(1,'','VE-K',23204,'VE-K','Lara',1549,0),
(1,'','VE-U',23204,'VE-U','Yaracuy',1550,0),
(1,'','VE-F',23205,'VE-F','Bolívar',1551,0),
(1,'','VE-X',23205,'VE-X','Amazonas',1552,0),
(1,'','VE-Y',23205,'VE-Y','Delta Amacuro',1553,0),
(1,'','VE-O',23206,'VE-O','Nueva Esparta',1554,0),
(1,'','VE-Z',23206,'VE-Z','Dependencias Federales',1555,0),
(1,'','VE-C',23207,'VE-C','Apure',1556,0),
(1,'','VE-J',23207,'VE-J','Guárico',1557,0),
(1,'','VE-H',23207,'VE-H','Cojedes',1558,0),
(1,'','VE-P',23207,'VE-P','Portuguesa',1559,0),
(1,'','VE-B',23208,'VE-B','Anzoátegui',1560,0),
(1,'','VE-N',23208,'VE-N','Monagas',1561,0),
(1,'','VE-R',23208,'VE-R','Sucre',1562,0),
(1,'','VE-V',23209,'VE-V','Zulia',1563,0),
(1,'','VE-S',23209,'VE-S','Táchira',1564,0),
(1,'','BI0001',6101,'','Bubanza',1565,0),
(1,'','BI0002',6101,'','Gihanga',1566,0),
(1,'','BI0003',6101,'','Musigati',1567,0),
(1,'','BI0004',6101,'','Mpanda',1568,0),
(1,'','BI0005',6101,'','Rugazi',1569,0),
(1,'','BI0006',6102,'','Muha',1570,0),
(1,'','BI0007',6102,'','Mukaza',1571,0),
(1,'','BI0008',6102,'','Ntahangwa',1572,0),
(1,'','BI0009',6103,'','Isale',1573,0),
(1,'','BI0010',6103,'','Kabezi',1574,0),
(1,'','BI0011',6103,'','Kanyosha',1575,0),
(1,'','BI0012',6103,'','Mubimbi',1576,0),
(1,'','BI0013',6103,'','Mugongomanga',1577,0),
(1,'','BI0014',6103,'','Mukike',1578,0),
(1,'','BI0015',6103,'','Mutambu',1579,0),
(1,'','BI0016',6103,'','Mutimbuzi',1580,0),
(1,'','BI0017',6103,'','Nyabiraba',1581,0),
(1,'','BI0018',6104,'','Bururi',1582,0),
(1,'','BI0019',6104,'','Matana',1583,0),
(1,'','BI0020',6104,'','Mugamba',1584,0),
(1,'','BI0021',6104,'','Rutovu',1585,0),
(1,'','BI0022',6104,'','Songa',1586,0),
(1,'','BI0023',6104,'','Vyanda',1587,0),
(1,'','BI0024',6105,'','Cankuzo',1588,0),
(1,'','BI0025',6105,'','Cendajuru',1589,0),
(1,'','BI0026',6105,'','Gisagara',1590,0),
(1,'','BI0027',6105,'','Kigamba',1591,0),
(1,'','BI0028',6105,'','Mishiha',1592,0),
(1,'','BI0029',6106,'','Buganda',1593,0),
(1,'','BI0030',6106,'','Bukinanyana',1594,0),
(1,'','BI0031',6106,'','Mabayi',1595,0),
(1,'','BI0032',6106,'','Mugina',1596,0),
(1,'','BI0033',6106,'','Murwi',1597,0),
(1,'','BI0034',6106,'','Rugombo',1598,0),
(1,'','BI0035',6107,'','Bugendana',1599,0),
(1,'','BI0036',6107,'','Bukirasazi',1600,0),
(1,'','BI0037',6107,'','Buraza',1601,0),
(1,'','BI0038',6107,'','Giheta',1602,0),
(1,'','BI0039',6107,'','Gishubi',1603,0),
(1,'','BI0040',6107,'','Gitega',1604,0),
(1,'','BI0041',6107,'','Itaba',1605,0),
(1,'','BI0042',6107,'','Makebuko',1606,0),
(1,'','BI0043',6107,'','Mutaho',1607,0),
(1,'','BI0044',6107,'','Nyanrusange',1608,0),
(1,'','BI0045',6107,'','Ryansoro',1609,0),
(1,'','BI0046',6108,'','Bugenyuzi',1610,0),
(1,'','BI0047',6108,'','Buhiga',1611,0),
(1,'','BI0048',6108,'','Gihogazi',1612,0),
(1,'','BI0049',6108,'','Gitaramuka',1613,0),
(1,'','BI0050',6108,'','Mutumba',1614,0),
(1,'','BI0051',6108,'','Nyabikere',1615,0),
(1,'','BI0052',6108,'','Shombo',1616,0),
(1,'','BI0053',6109,'','Butaganzwa',1617,0),
(1,'','BI0054',6109,'','Gahombo',1618,0),
(1,'','BI0055',6109,'','Gatara',1619,0),
(1,'','BI0056',6109,'','Kabarore',1620,0),
(1,'','BI0057',6109,'','Kayanza',1621,0),
(1,'','BI0058',6109,'','Matongo',1622,0),
(1,'','BI0059',6109,'','Muhanga',1623,0),
(1,'','BI0060',6109,'','Muruta',1624,0),
(1,'','BI0061',6109,'','Rango',1625,0),
(1,'','BI0062',6110,'','Bugabira',1626,0),
(1,'','BI0063',6110,'','Busoni',1627,0),
(1,'','BI0064',6110,'','Bwambarangwe',1628,0),
(1,'','BI0065',6110,'','Gitobe',1629,0),
(1,'','BI0066',6110,'','Kirundo',1630,0),
(1,'','BI0067',6110,'','Ntega',1631,0),
(1,'','BI0068',6110,'','Vumbi',1632,0),
(1,'','BI0069',6111,'','Kayogoro',1633,0),
(1,'','BI0070',6111,'','Kibago',1634,0),
(1,'','BI0071',6111,'','Mabanda',1635,0),
(1,'','BI0072',6111,'','Makamba',1636,0),
(1,'','BI0073',6111,'','Nyanza-Lac',1637,0),
(1,'','BI0074',6111,'','Vugizo',1638,0),
(1,'','BI0075',6112,'','Bukeye',1639,0),
(1,'','BI0076',6112,'','Kiganda',1640,0),
(1,'','BI0077',6112,'','Mbuye',1641,0),
(1,'','BI0078',6112,'','Muramvya',1642,0),
(1,'','BI0079',6112,'','Rutegama',1643,0),
(1,'','BI0080',6113,'','Buhinyuza',1644,0),
(1,'','BI0081',6113,'','Butihinda',1645,0),
(1,'','BI0082',6113,'','Gashoho',1646,0),
(1,'','BI0083',6113,'','Gasorwe',1647,0),
(1,'','BI0084',6113,'','Giteranyi',1648,0),
(1,'','BI0085',6113,'','Muyinga',1649,0),
(1,'','BI0086',6113,'','Mwakiro',1650,0),
(1,'','BI0087',6114,'','Bisoro',1651,0),
(1,'','BI0088',6114,'','Gisozi',1652,0),
(1,'','BI0089',6114,'','Kayokwe',1653,0),
(1,'','BI0090',6114,'','Ndava',1654,0),
(1,'','BI0091',6114,'','Nyabihanga',1655,0),
(1,'','BI0092',6114,'','Rusaka',1656,0),
(1,'','BI0093',6115,'','Busiga',1657,0),
(1,'','BI0094',6115,'','Gashikanwa',1658,0),
(1,'','BI0095',6115,'','Kiremba',1659,0),
(1,'','BI0096',6115,'','Marangara',1660,0),
(1,'','BI0097',6115,'','Mwumba',1661,0),
(1,'','BI0098',6115,'','Ngozi',1662,0),
(1,'','BI0099',6115,'','Nyamurenza',1663,0),
(1,'','BI0100',6115,'','Ruhororo',1664,0),
(1,'','BI0101',6115,'','Tangara',1665,0),
(1,'','BI0102',6116,'','Bugarama',1666,0),
(1,'','BI0103',6116,'','Burambi',1667,0),
(1,'','BI0104',6116,'','Buyengero',1668,0),
(1,'','BI0105',6116,'','Muhuta',1669,0),
(1,'','BI0106',6116,'','Rumonge',1670,0),
(1,'','BI0107',6117,'','Bukemba',1671,0),
(1,'','BI0108',6117,'','Giharo',1672,0),
(1,'','BI0109',6117,'','Gitanga',1673,0),
(1,'','BI0110',6117,'','Mpinga-Kayove',1674,0),
(1,'','BI0111',6117,'','Musongati',1675,0),
(1,'','BI0112',6117,'','Rutana',1676,0),
(1,'','BI0113',6118,'','Butaganzwa',1677,0),
(1,'','BI0114',6118,'','Butezi',1678,0),
(1,'','BI0115',6118,'','Bweru',1679,0),
(1,'','BI0116',6118,'','Gisuru',1680,0),
(1,'','BI0117',6118,'','Kinyinya',1681,0),
(1,'','BI0118',6118,'','Nyabitsinda',1682,0),
(1,'','BI0119',6118,'','Ruyigi',1683,0),
(1,'','AE-1',22701,'','Abu Dhabi',1684,0),
(1,'','AE-2',22701,'','Dubai',1685,0),
(1,'','AE-3',22701,'','Ajman',1686,0),
(1,'','AE-4',22701,'','Fujairah',1687,0),
(1,'','AE-5',22701,'','Ras al-Khaimah',1688,0),
(1,'','AE-6',22701,'','Sharjah',1689,0),
(1,'','AE-7',22701,'','Umm al-Quwain',1690,0),
(1,'','01',12301,'北海','北海道',1691,0),
(1,'','02',12301,'青森','青森県',1692,0),
(1,'','03',12301,'岩手','岩手県',1693,0),
(1,'','04',12301,'宮城','宮城県',1694,0),
(1,'','05',12301,'秋田','秋田県',1695,0),
(1,'','06',12301,'山形','山形県',1696,0),
(1,'','07',12301,'福島','福島県',1697,0),
(1,'','08',12301,'茨城','茨城県',1698,0),
(1,'','09',12301,'栃木','栃木県',1699,0),
(1,'','10',12301,'群馬','群馬県',1700,0),
(1,'','11',12301,'埼玉','埼玉県',1701,0),
(1,'','12',12301,'千葉','千葉県',1702,0),
(1,'','13',12301,'東京','東京都',1703,0),
(1,'','14',12301,'神奈川','神奈川県',1704,0),
(1,'','15',12301,'新潟','新潟県',1705,0),
(1,'','16',12301,'富山','富山県',1706,0),
(1,'','17',12301,'石川','石川県',1707,0),
(1,'','18',12301,'福井','福井県',1708,0),
(1,'','19',12301,'山梨','山梨県',1709,0),
(1,'','20',12301,'長野','長野県',1710,0),
(1,'','21',12301,'岐阜','岐阜県',1711,0),
(1,'','22',12301,'静岡','静岡県',1712,0),
(1,'','23',12301,'愛知','愛知県',1713,0),
(1,'','24',12301,'三重','三重県',1714,0),
(1,'','25',12301,'滋賀','滋賀県',1715,0),
(1,'','26',12301,'京都','京都府',1716,0),
(1,'','27',12301,'大阪','大阪府',1717,0),
(1,'','28',12301,'兵庫','兵庫県',1718,0),
(1,'','29',12301,'奈良','奈良県',1719,0),
(1,'','30',12301,'和歌山','和歌山県',1720,0),
(1,'','31',12301,'鳥取','鳥取県',1721,0),
(1,'','32',12301,'島根','島根県',1722,0),
(1,'','33',12301,'岡山','岡山県',1723,0),
(1,'','34',12301,'広島','広島県',1724,0),
(1,'','35',12301,'山口','山口県',1725,0),
(1,'','36',12301,'徳島','徳島県',1726,0),
(1,'','37',12301,'香川','香川県',1727,0),
(1,'','38',12301,'愛媛','愛媛県',1728,0),
(1,'','39',12301,'高知','高知県',1729,0),
(1,'','40',12301,'福岡','福岡県',1730,0),
(1,'','41',12301,'佐賀','佐賀県',1731,0),
(1,'','42',12301,'長崎','長崎県',1732,0),
(1,'','43',12301,'熊本','熊本県',1733,0),
(1,'','44',12301,'大分','大分県',1734,0),
(1,'','45',12301,'宮崎','宮崎県',1735,0),
(1,'','46',12301,'鹿児島','鹿児島県',1736,0),
(1,'','47',12301,'沖縄','沖縄県',1737,0),
(1,NULL,'TR-01',22104,NULL,'Adana',1738,NULL),
(1,NULL,'TR-02',22107,NULL,'Adıyaman',1739,NULL),
(1,NULL,'TR-03',22103,NULL,'Afyon',1740,NULL),
(1,NULL,'TR-04',22107,NULL,'Ağrı',1741,NULL),
(1,NULL,'TR-05',22106,NULL,'Amasya',1742,NULL),
(1,NULL,'TR-06',22102,NULL,'Ankara',1743,NULL),
(1,NULL,'TR-07',22104,NULL,'Antalya',1744,NULL),
(1,NULL,'TR-08',22106,NULL,'Artvin',1745,NULL),
(1,NULL,'TR-09',22103,NULL,'Aydın',1746,NULL),
(1,NULL,'TR-10',22101,NULL,'Balıkesir',1747,NULL),
(1,NULL,'TR-11',22101,NULL,'Bilecik',1748,NULL),
(1,NULL,'TR-12',22107,NULL,'Bingöl',1749,NULL),
(1,NULL,'TR-13',22107,NULL,'Bitlis',1750,NULL),
(1,NULL,'TR-14',22106,NULL,'Bolu',1751,NULL),
(1,NULL,'TR-15',22104,NULL,'Burdur',1752,NULL),
(1,NULL,'TR-16',22101,NULL,'Bursa',1753,NULL),
(1,NULL,'TR-17',22101,NULL,'Çanakkale',1754,NULL),
(1,NULL,'TR-18',22102,NULL,'Çankırı',1755,NULL),
(1,NULL,'TR-19',22106,NULL,'Çorum',1756,NULL),
(1,NULL,'TR-20',22104,NULL,'Denizli',1757,NULL),
(1,NULL,'TR-21',22105,NULL,'Diyarbakır',1758,NULL),
(1,NULL,'TR-22',22101,NULL,'Edirne',1759,NULL),
(1,NULL,'TR-23',22107,NULL,'Elazığ',1760,NULL),
(1,NULL,'TR-24',22107,NULL,'Erzincan',1761,NULL),
(1,NULL,'TR-25',22107,NULL,'Erzurum',1762,NULL),
(1,NULL,'TR-26',22102,NULL,'Eskişehir',1763,NULL),
(1,NULL,'TR-27',22105,NULL,'Gaziantep',1764,NULL),
(1,NULL,'TR-28',22106,NULL,'Giresun',1765,NULL),
(1,NULL,'TR-29',22106,NULL,'Gümüşhane',1766,NULL),
(1,NULL,'TR-30',22107,NULL,'Hakkari',1767,NULL),
(1,NULL,'TR-31',22104,NULL,'Hatay',1768,NULL),
(1,NULL,'TR-32',22104,NULL,'Isparta',1769,NULL),
(1,NULL,'TR-33',22104,NULL,'İçel',1770,NULL),
(1,NULL,'TR-34',22101,NULL,'İstanbul',1771,NULL),
(1,NULL,'TR-35',22103,NULL,'İzmir',1772,NULL),
(1,NULL,'TR-36',22107,NULL,'Kars',1773,NULL),
(1,NULL,'TR-37',22106,NULL,'Kastamonu',1774,NULL),
(1,NULL,'TR-38',22102,NULL,'Kayseri',1775,NULL),
(1,NULL,'TR-39',22101,NULL,'Kırklareli',1776,NULL),
(1,NULL,'TR-40',22102,NULL,'Kırşehir',1777,NULL),
(1,NULL,'TR-41',22101,NULL,'Kocaeli',1778,NULL),
(1,NULL,'TR-42',22102,NULL,'Konya',1779,NULL),
(1,NULL,'TR-43',22103,NULL,'Kütahya',1780,NULL),
(1,NULL,'TR-44',22107,NULL,'Malatya',1781,NULL),
(1,NULL,'TR-45',22103,NULL,'Manisa',1782,NULL),
(1,NULL,'TR-46',22104,NULL,'Kahramanmaraş',1783,NULL),
(1,NULL,'TR-47',22105,NULL,'Mardin',1784,NULL),
(1,NULL,'TR-48',22103,NULL,'Muğla',1785,NULL),
(1,NULL,'TR-49',22107,NULL,'Muş',1786,NULL),
(1,NULL,'TR-50',22102,NULL,'Nevşehir',1787,NULL),
(1,NULL,'TR-51',22102,NULL,'Niğde',1788,NULL),
(1,NULL,'TR-52',22106,NULL,'Ordu',1789,NULL),
(1,NULL,'TR-53',22106,NULL,'Rize',1790,NULL),
(1,NULL,'TR-54',22101,NULL,'Sakarya',1791,NULL),
(1,NULL,'TR-55',22106,NULL,'Samsun',1792,NULL),
(1,NULL,'TR-56',22105,NULL,'Siirt',1793,NULL),
(1,NULL,'TR-57',22106,NULL,'Sinop',1794,NULL),
(1,NULL,'TR-58',22102,NULL,'Sivas',1795,NULL),
(1,NULL,'TR-59',22101,NULL,'Tekirdağ',1796,NULL),
(1,NULL,'TR-60',22106,NULL,'Tokat',1797,NULL),
(1,NULL,'TR-61',22106,NULL,'Trabzon',1798,NULL),
(1,NULL,'TR-62',22107,NULL,'Tunceli',1799,NULL),
(1,NULL,'TR-63',22105,NULL,'Şanlıurfa',1800,NULL),
(1,NULL,'TR-63',22103,NULL,'Uşak',1801,NULL),
(1,NULL,'TR-65',22107,NULL,'Van',1802,NULL),
(1,NULL,'TR-66',22102,NULL,'Yozgat',1803,NULL),
(1,NULL,'TR-67',22106,NULL,'Zonguldak',1804,NULL),
(1,NULL,'TR-68',22102,NULL,'Aksaray',1805,NULL),
(1,NULL,'TR-69',22106,NULL,'Bayburt',1806,NULL),
(1,NULL,'TR-70',22102,NULL,'Karaman',1807,NULL),
(1,NULL,'TR-71',22102,NULL,'Kırıkkale',1808,NULL),
(1,NULL,'TR-72',22105,NULL,'Batman',1809,NULL),
(1,NULL,'TR-73',22105,NULL,'Şırnak',1810,NULL),
(1,NULL,'TR-74',22106,NULL,'Bartın',1811,NULL),
(1,NULL,'TR-75',22107,NULL,'Ardahan',1812,NULL),
(1,NULL,'TR-76',22107,NULL,'Iğdır',1813,NULL),
(1,NULL,'TR-77',22101,NULL,'Yalova',1814,NULL),
(1,NULL,'TR-78',22106,NULL,'Karabük',1815,NULL),
(1,NULL,'TR-79',22105,NULL,'Kilis',1816,NULL),
(1,NULL,'TR-80',22104,NULL,'Osmaniye',1817,NULL),
(1,NULL,'TR-81',22106,NULL,'Düzce',1818,NULL);
/*!40000 ALTER TABLE `llx_c_departements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_ecotaxe`
--

DROP TABLE IF EXISTS `llx_c_ecotaxe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_ecotaxe` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `fk_pays` int NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_ecotaxe` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ecotaxe`
--

LOCK TABLES `llx_c_ecotaxe` WRITE;
/*!40000 ALTER TABLE `llx_c_ecotaxe` DISABLE KEYS */;
INSERT INTO `llx_c_ecotaxe` VALUES
(1,'25040',1,'PETIT APPAREILS MENAGERS','Eco-systèmes',0.25000000,1),
(1,'25050',1,'TRES PETIT APPAREILS MENAGERS','Eco-systèmes',0.08000000,2),
(1,'32070',1,'ECRAN POIDS < 5 KG','Eco-systèmes',2.08000000,3),
(1,'32080',1,'ECRAN POIDS > 5 KG','Eco-systèmes',1.25000000,4),
(1,'32051',1,'ORDINATEUR PORTABLE','Eco-systèmes',0.42000000,5),
(1,'32061',1,'TABLETTE INFORMATIQUE','Eco-systèmes',0.84000000,6),
(1,'36011',1,'ORDINATEUR FIXE (UC)','Eco-systèmes',1.15000000,7),
(1,'36021',1,'IMPRIMANTES','Eco-systèmes',0.83000000,8),
(1,'36030',1,'IT (INFORMATIQUE ET TELECOMS)','Eco-systèmes',0.83000000,9),
(1,'36040',1,'PETIT IT (CLAVIERS / SOURIS)','Eco-systèmes',0.08000000,10),
(1,'36050',1,'TELEPHONIE MOBILE','Eco-systèmes',0.02000000,11),
(1,'36060',1,'CONNECTIQUE CABLES','Eco-systèmes',0.02000000,12),
(1,'45010',1,'GROS MATERIEL GRAND PUBLIC (TELEAGRANDISSEURS)','Eco-systèmes',1.67000000,13),
(1,'45020',1,'MOYEN MATERIEL GRAND PUBLIC (LOUPES ELECTRONIQUES)','Eco-systèmes',0.42000000,14),
(1,'45030',1,'PETIT MATERIEL GRAND PUBLIC (VIE QUOTIDIENNE)','Eco-systèmes',0.08000000,15),
(1,'75030',1,'JOUETS < 0,5 KG','Eco-systèmes',0.08000000,16),
(1,'75040',1,'JOUETS ENTRE 0,5 KG ET 10 KG','Eco-systèmes',0.17000000,17),
(1,'74050',1,'JOUETS > 10 KG','Eco-systèmes',1.67000000,18),
(1,'85010',1,'EQUIPEMENT MEDICAL < 0,5 KG','Eco-systèmes',0.08000000,19);
/*!40000 ALTER TABLE `llx_c_ecotaxe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_effectif`
--

DROP TABLE IF EXISTS `llx_c_effectif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_effectif` (
  `id` int NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_effectif` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_effectif`
--

LOCK TABLES `llx_c_effectif` WRITE;
/*!40000 ALTER TABLE `llx_c_effectif` DISABLE KEYS */;
INSERT INTO `llx_c_effectif` VALUES
(1,'EF0',0,'-',NULL),
(1,'EF1-5',1,'1 - 5',NULL),
(1,'EF6-10',2,'6 - 10',NULL),
(1,'EF11-50',3,'11 - 50',NULL),
(1,'EF51-100',4,'51 - 100',NULL),
(1,'EF101-500',5,'101 - 500',NULL),
(1,'EF500-',6,'> 500',NULL);
/*!40000 ALTER TABLE `llx_c_effectif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_email_senderprofile`
--

DROP TABLE IF EXISTS `llx_c_email_senderprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_email_senderprofile` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `private` smallint NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `signature` text,
  `position` smallint DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_email_senderprofile` (`entity`,`label`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_email_senderprofile`
--

LOCK TABLES `llx_c_email_senderprofile` WRITE;
/*!40000 ALTER TABLE `llx_c_email_senderprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_email_senderprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_email_templates`
--

DROP TABLE IF EXISTS `llx_c_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_email_templates` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `type_template` varchar(32) DEFAULT NULL,
  `lang` varchar(6) DEFAULT '',
  `private` smallint NOT NULL DEFAULT '0',
  `fk_user` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(180) DEFAULT NULL,
  `position` smallint DEFAULT NULL,
  `defaultfortype` smallint DEFAULT '0',
  `enabled` varchar(255) DEFAULT '1',
  `active` tinyint NOT NULL DEFAULT '1',
  `email_from` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `email_tocc` varchar(255) DEFAULT NULL,
  `email_tobcc` varchar(255) DEFAULT NULL,
  `topic` text,
  `joinfiles` text,
  `content` mediumtext,
  `content_lines` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_email_templates` (`entity`,`label`,`lang`),
  KEY `idx_type` (`type_template`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_email_templates`
--

LOCK TABLES `llx_c_email_templates` WRITE;
/*!40000 ALTER TABLE `llx_c_email_templates` DISABLE KEYS */;
INSERT INTO `llx_c_email_templates` VALUES
(0,'__(Hello)__,<br><br>\n\n__(FindYourSEPAMandate)__ :<br>\n__MYCOMPANY_NAME__<br>\n__MYCOMPANY_FULLADDRESS__<br><br>\n__(Sincerely)__<br>\n__USER_SIGNATURE__',NULL,NULL,0,NULL,NULL,NULL,NULL,'isModEnabled(\"societe\") && isModEnabled(\"banque\") && isModEnabled(\"prelevement\")',0,NULL,'0','(YourSEPAMandate)','','banque',1,0,1,'2023-11-27 09:34:20','__(YourSEPAMandate)__','thirdparty'),
(1,'__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourMembershipRequestWasReceived)__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL,NULL,0,NULL,NULL,NULL,NULL,'isModEnabled(\"adherent\")',0,NULL,'0','(SendingEmailOnAutoSubscription)','','adherent',10,0,2,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipRequestWasReceived)__','member'),
(1,'__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourMembershipWasValidated)__<br>__(FirstName)__ : __MEMBER_FIRSTNAME__<br>__(LastName)__ : __MEMBER_LASTNAME__<br>__(ID)__ : __MEMBER_ID__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL,NULL,0,NULL,NULL,NULL,NULL,'isModEnabled(\"adherent\")',0,NULL,'0','(SendingEmailOnMemberValidation)','','adherent',20,0,3,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipWasValidated)__','member'),
(1,'__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourSubscriptionWasRecorded)__<br>\n\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL,NULL,0,NULL,NULL,NULL,NULL,'isModEnabled(\"adherent\")',0,NULL,'1','(SendingEmailOnNewSubscription)','','adherent',30,0,4,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] __(YourSubscriptionWasRecorded)__','member'),
(1,'__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfSubscriptionReminderEmail)__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL,NULL,0,NULL,NULL,NULL,NULL,'isModEnabled(\"adherent\")',0,NULL,'0','(SendingReminderForExpiredSubscription)','','adherent',40,0,5,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] __(SubscriptionReminderEmail)__','member'),
(1,'__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(YourMembershipWasCanceled)__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL,NULL,0,NULL,NULL,NULL,NULL,'isModEnabled(\"adherent\")',0,NULL,'0','(SendingEmailOnCancelation)','','adherent',50,0,6,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipWasCanceled)__','member'),
(1,'__(Hello)__,<br><br>\n\n__(ThisIsContentOfYourCard)__<br>\n__(ID)__ : __ID__<br>\n__(Civility)__ : __MEMBER_CIVILITY__<br>\n__(Firstname)__ : __MEMBER_FIRSTNAME__<br>\n__(Lastname)__ : __MEMBER_LASTNAME__<br>\n__(Fullname)__ : __MEMBER_FULLNAME__<br>\n__(Company)__ : __MEMBER_COMPANY__<br>\n__(Address)__ : __MEMBER_ADDRESS__<br>\n__(Zip)__ : __MEMBER_ZIP__<br>\n__(Town)__ : __MEMBER_TOWN__<br>\n__(Country)__ : __MEMBER_COUNTRY__<br>\n__(Email)__ : __MEMBER_EMAIL__<br>\n__(Birthday)__ : __MEMBER_BIRTH__<br>\n__(Photo)__ : __MEMBER_PHOTO__<br>\n__(Login)__ : __MEMBER_LOGIN__<br>\n__(Phone)__ : __MEMBER_PHONE__<br>\n__(PhonePerso)__ : __MEMBER_PHONEPRO__<br>\n__(PhoneMobile)__ : __MEMBER_PHONEMOBILE__<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL,NULL,0,NULL,NULL,NULL,NULL,'isModEnabled(\"adherent\")',0,NULL,'0','(SendingAnEMailToMember)','','adherent',60,0,7,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] __(CardContent)__','member'),
(1,'__(Hello)__ __CANDIDATE_FULLNAME__,<br><br>\n\n__(YourCandidatureAnswerMessage)__<br>__ONLINE_INTERVIEW_SCHEDULER_TEXT_AND_URL__\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__',NULL,NULL,0,NULL,NULL,NULL,NULL,'isModEnabled(\"recruitment\")',0,NULL,'0','(AnswerCandidature)','','recruitment',100,0,8,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] __(YourCandidature)__','recruitmentcandidature_send'),
(1,'__(Hello)__,<br /><br />__(OrganizationEventConfRequestWasReceived)__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL,NULL,0,NULL,NULL,NULL,NULL,'1',0,NULL,NULL,'(EventOrganizationEmailAskConf)','','',10,0,9,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailAskConf)__','conferenceorbooth'),
(1,'__(Hello)__,<br /><br />__(OrganizationEventBoothRequestWasReceived)__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL,NULL,0,NULL,NULL,NULL,NULL,'1',0,NULL,NULL,'(EventOrganizationEmailAskBooth)','','',20,0,10,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailAskBooth)__','conferenceorbooth'),
(1,'__(Hello)__,<br /><br />__(OrganizationEventPaymentOfBoothWasReceived)__<br /><br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL,NULL,0,NULL,NULL,NULL,NULL,'1',0,NULL,NULL,'(EventOrganizationEmailBoothPayment)','','',30,0,11,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailBoothPayment)__','conferenceorbooth'),
(1,'__(Hello)__,<br /><br />__(OrganizationEventPaymentOfRegistrationWasReceived)__<br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL,NULL,0,NULL,NULL,NULL,NULL,'1',0,NULL,NULL,'(EventOrganizationEmailRegistrationPayment)','','',40,0,12,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationEmailRegistrationPayment)__','conferenceorbooth'),
(1,'__(Hello)__,<br /><br />__(OrganizationEventBulkMailToAttendees)__<br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL,NULL,0,NULL,NULL,NULL,NULL,'1',0,NULL,NULL,'(EventOrganizationMassEmailAttendees)','','',50,0,13,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationMassEmailAttendees)__','conferenceorbooth'),
(1,'__(Hello)__,<br /><br />__(OrganizationEventBulkMailToSpeakers)__<br /><br />__(Sincerely)__<br />__USER_SIGNATURE__',NULL,NULL,0,NULL,NULL,NULL,NULL,'1',0,NULL,NULL,'(EventOrganizationMassEmailSpeakers)','','',60,0,14,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] __(EventOrganizationMassEmailSpeakers)__','conferenceorbooth'),
(1,'<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipWillSoonBeCanceledContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL,NULL,0,NULL,NULL,NULL,NULL,'1',0,NULL,'0','(SendingEmailOnPartnershipWillSoonBeCanceled)','','partnership',100,0,15,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipWillSoonBeCanceledTopic)__','partnership_send'),
(1,'<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipCanceledContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL,NULL,0,NULL,NULL,NULL,NULL,'1',0,NULL,'0','(SendingEmailOnPartnershipCanceled)','','partnership',100,0,16,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipCanceledTopic)__','partnership_send'),
(1,'<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipRefusedContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL,NULL,0,NULL,NULL,NULL,NULL,'1',0,NULL,'0','(SendingEmailOnPartnershipRefused)','','partnership',100,0,17,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipRefusedTopic)__','partnership_send'),
(1,'<body>\n <p>__(Hello)__,<br><br>\n__(YourPartnershipAcceptedContent)__</p>\n<br />\n\n<br />\n\n            __(Sincerely)__ <br />\n            __[MAIN_INFO_SOCIETE_NOM]__ <br />\n </body>\n',NULL,NULL,0,NULL,NULL,NULL,NULL,'1',0,NULL,'0','(SendingEmailOnPartnershipAccepted)','','partnership',100,0,18,'2023-11-27 09:34:20','[__[MAIN_INFO_SOCIETE_NOM]__] - __(YourPartnershipAcceptedTopic)__','partnership_send');
/*!40000 ALTER TABLE `llx_c_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_exp_tax_cat`
--

DROP TABLE IF EXISTS `llx_c_exp_tax_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_exp_tax_cat` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `active` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_exp_tax_cat`
--

LOCK TABLES `llx_c_exp_tax_cat` WRITE;
/*!40000 ALTER TABLE `llx_c_exp_tax_cat` DISABLE KEYS */;
INSERT INTO `llx_c_exp_tax_cat` VALUES
(0,1,'ExpAutoCat',1),
(0,1,'ExpCycloCat',2),
(0,1,'ExpMotoCat',3),
(1,1,'ExpAuto3CV',4),
(1,1,'ExpAuto4CV',5),
(1,1,'ExpAuto5CV',6),
(1,1,'ExpAuto6CV',7),
(1,1,'ExpAuto7CV',8),
(1,1,'ExpAuto8CV',9),
(0,1,'ExpAuto9CV',10),
(0,1,'ExpAuto10CV',11),
(0,1,'ExpAuto11CV',12),
(0,1,'ExpAuto12CV',13),
(0,1,'ExpAuto3PCV',14),
(0,1,'ExpAuto4PCV',15),
(0,1,'ExpAuto5PCV',16),
(0,1,'ExpAuto6PCV',17),
(0,1,'ExpAuto7PCV',18),
(0,1,'ExpAuto8PCV',19),
(0,1,'ExpAuto9PCV',20),
(0,1,'ExpAuto10PCV',21),
(0,1,'ExpAuto11PCV',22),
(0,1,'ExpAuto12PCV',23),
(0,1,'ExpAuto13PCV',24),
(0,1,'ExpCyclo',25),
(0,1,'ExpMoto12CV',26),
(0,1,'ExpMoto345CV',27),
(0,1,'ExpMoto5PCV',28);
/*!40000 ALTER TABLE `llx_c_exp_tax_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_exp_tax_range`
--

DROP TABLE IF EXISTS `llx_c_exp_tax_range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_exp_tax_range` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_c_exp_tax_cat` int NOT NULL DEFAULT '1',
  `range_ik` double NOT NULL DEFAULT '0',
  `entity` int NOT NULL DEFAULT '1',
  `active` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_exp_tax_range`
--

LOCK TABLES `llx_c_exp_tax_range` WRITE;
/*!40000 ALTER TABLE `llx_c_exp_tax_range` DISABLE KEYS */;
INSERT INTO `llx_c_exp_tax_range` VALUES
(1,1,4,0,1),
(1,1,4,5000,2),
(1,1,4,20000,3),
(1,1,5,0,4),
(1,1,5,5000,5),
(1,1,5,20000,6),
(1,1,6,0,7),
(1,1,6,5000,8),
(1,1,6,20000,9),
(1,1,7,0,10),
(1,1,7,5000,11),
(1,1,7,20000,12),
(1,1,8,0,13),
(1,1,8,5000,14),
(1,1,8,20000,15);
/*!40000 ALTER TABLE `llx_c_exp_tax_range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_field_list`
--

DROP TABLE IF EXISTS `llx_c_field_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_field_list` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `element` varchar(64) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `name` varchar(32) NOT NULL,
  `alias` varchar(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `align` varchar(6) DEFAULT 'left',
  `sort` tinyint NOT NULL DEFAULT '1',
  `search` tinyint NOT NULL DEFAULT '0',
  `visible` tinyint NOT NULL DEFAULT '1',
  `enabled` varchar(255) DEFAULT '1',
  `rang` int DEFAULT '0',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_field_list`
--

LOCK TABLES `llx_c_field_list` WRITE;
/*!40000 ALTER TABLE `llx_c_field_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_field_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_format_cards`
--

DROP TABLE IF EXISTS `llx_c_format_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_format_cards` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `paper_size` varchar(20) NOT NULL,
  `orientation` varchar(1) NOT NULL,
  `metric` varchar(5) NOT NULL,
  `leftmargin` double(24,8) NOT NULL,
  `topmargin` double(24,8) NOT NULL,
  `nx` int NOT NULL,
  `ny` int NOT NULL,
  `spacex` double(24,8) NOT NULL,
  `spacey` double(24,8) NOT NULL,
  `width` double(24,8) NOT NULL,
  `height` double(24,8) NOT NULL,
  `font_size` int NOT NULL,
  `custom_x` double(24,8) NOT NULL,
  `custom_y` double(24,8) NOT NULL,
  `active` int NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_format_cards`
--

LOCK TABLES `llx_c_format_cards` WRITE;
/*!40000 ALTER TABLE `llx_c_format_cards` DISABLE KEYS */;
INSERT INTO `llx_c_format_cards` VALUES
(1,'5160',0.00000000,0.00000000,7,25.40000000,5.58165000,'mm','Avery-5160, WL-875WX',3,10,'P','letter',1,3.55600000,0.00000000,12.70000000,65.87490000),
(1,'5161',0.00000000,0.00000000,7,25.40000000,4.44500000,'mm','Avery-5161, WL-75WX',2,10,'P','letter',2,3.96800000,0.00000000,12.70000000,101.60000000),
(1,'5162',0.00000000,0.00000000,8,33.78100000,3.87350000,'mm','Avery-5162, WL-100WX',2,7,'P','letter',3,4.95400000,0.00000000,22.35200000,101.60000000),
(1,'5163',0.00000000,0.00000000,10,50.80000000,4.57200000,'mm','Avery-5163, WL-125WX',2,5,'P','letter',4,3.55600000,0.00000000,12.70000000,101.60000000),
(0,'5164',0.00000000,0.00000000,12,3.33000000,0.14800000,'in','Avery-5164 (inch)',2,3,'P','letter',5,0.20310000,0.00000000,0.50000000,4.00000000),
(1,'8600',0.00000000,0.00000000,7,25.40000000,7.10000000,'mm','Avery-8600',3,10,'P','letter',6,9.50000000,3.10000000,19.00000000,66.60000000),
(1,'99012',36.00000000,89.00000000,10,89.00000000,1.00000000,'mm','DYMO 99012 89*36mm',1,1,'L','custom',7,0.00000000,0.00000000,1.00000000,36.00000000),
(1,'99014',54.00000000,101.00000000,10,101.00000000,1.00000000,'mm','DYMO 99014 101*54mm',1,1,'L','custom',8,0.00000000,0.00000000,1.00000000,54.00000000),
(1,'AVERYC32010',0.00000000,0.00000000,10,54.00000000,15.00000000,'mm','Avery-C32010',2,5,'P','A4',9,10.00000000,0.00000000,13.00000000,85.00000000),
(1,'CARD',0.00000000,0.00000000,10,54.00000000,15.00000000,'mm','Dolibarr Business cards',2,5,'P','A4',10,0.00000000,0.00000000,15.00000000,85.00000000),
(1,'L7163',0.00000000,0.00000000,8,38.10000000,5.00000000,'mm','Avery-L7163',2,7,'P','A4',11,2.50000000,0.00000000,15.00000000,99.10000000);
/*!40000 ALTER TABLE `llx_c_format_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_forme_juridique`
--

DROP TABLE IF EXISTS `llx_c_forme_juridique`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_forme_juridique` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` int NOT NULL,
  `fk_pays` int NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `isvatexempted` tinyint NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_forme_juridique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_forme_juridique`
--

LOCK TABLES `llx_c_forme_juridique` WRITE;
/*!40000 ALTER TABLE `llx_c_forme_juridique` DISABLE KEYS */;
INSERT INTO `llx_c_forme_juridique` VALUES
(1,0,0,0,'-',NULL,0,1),
(1,2301,23,0,'Monotributista',NULL,0,2),
(1,2302,23,0,'Sociedad Civil',NULL,0,3),
(1,2303,23,0,'Sociedades Comerciales',NULL,0,4),
(1,2304,23,0,'Sociedades de Hecho',NULL,0,5),
(1,2305,23,0,'Sociedades Irregulares',NULL,0,6),
(1,2306,23,0,'Sociedad Colectiva',NULL,0,7),
(1,2307,23,0,'Sociedad en Comandita Simple',NULL,0,8),
(1,2308,23,0,'Sociedad de Capital e Industria',NULL,0,9),
(1,2309,23,0,'Sociedad Accidental o en participación',NULL,0,10),
(1,2310,23,0,'Sociedad de Responsabilidad Limitada',NULL,0,11),
(1,2311,23,0,'Sociedad Anónima',NULL,0,12),
(1,2312,23,0,'Sociedad Anónima con Participación Estatal Mayoritaria',NULL,0,13),
(1,2313,23,0,'Sociedad en Comandita por Acciones (arts. 315 a 324, LSC)',NULL,0,14),
(1,4100,41,0,'GmbH - Gesellschaft mit beschränkter Haftung',NULL,0,15),
(1,4101,41,0,'GesmbH - Gesellschaft mit beschränkter Haftung',NULL,0,16),
(1,4102,41,0,'AG - Aktiengesellschaft',NULL,0,17),
(1,4103,41,0,'EWIV - Europäische wirtschaftliche Interessenvereinigung',NULL,0,18),
(1,4104,41,0,'KEG - Kommanditerwerbsgesellschaft',NULL,0,19),
(1,4105,41,0,'OEG - Offene Erwerbsgesellschaft',NULL,0,20),
(1,4106,41,0,'OHG - Offene Handelsgesellschaft',NULL,0,21),
(1,4107,41,0,'AG & Co KG - Kommanditgesellschaft',NULL,0,22),
(1,4108,41,0,'GmbH & Co KG - Kommanditgesellschaft',NULL,0,23),
(1,4109,41,0,'KG - Kommanditgesellschaft',NULL,0,24),
(1,4110,41,0,'OG - Offene Gesellschaft',NULL,0,25),
(1,4111,41,0,'GbR - Gesellschaft nach bürgerlichem Recht',NULL,0,26),
(1,4112,41,0,'GesbR - Gesellschaft nach bürgerlichem Recht',NULL,0,27),
(1,4113,41,0,'GesnbR - Gesellschaft nach bürgerlichem Recht',NULL,0,28),
(1,4114,41,0,'e.U. - eingetragener Einzelunternehmer',NULL,0,29),
(1,200,2,0,'Indépendant',NULL,0,30),
(1,201,2,0,'SRL - Société à responsabilité limitée',NULL,0,31),
(1,202,2,0,'SA   - Société Anonyme',NULL,0,32),
(1,203,2,0,'SCRL - Société coopérative à responsabilité limitée',NULL,0,33),
(1,204,2,0,'ASBL - Association sans but Lucratif',NULL,0,34),
(1,205,2,0,'SCRI - Société coopérative à responsabilité illimitée',NULL,0,35),
(1,206,2,0,'SCS  - Société en commandite simple',NULL,0,36),
(1,207,2,0,'SCA  - Société en commandite par action',NULL,0,37),
(1,208,2,0,'SNC  - Société en nom collectif',NULL,0,38),
(1,209,2,0,'GIE  - Groupement d intérêt économique',NULL,0,39),
(1,210,2,0,'GEIE - Groupement européen d intérêt économique',NULL,0,40),
(1,220,2,0,'Eenmanszaak',NULL,0,41),
(1,221,2,0,'BVBA - Besloten vennootschap met beperkte aansprakelijkheid',NULL,0,42),
(1,222,2,0,'NV   - Naamloze Vennootschap',NULL,0,43),
(1,223,2,0,'CVBA - Coöperatieve vennootschap met beperkte aansprakelijkheid',NULL,0,44),
(1,224,2,0,'VZW  - Vereniging zonder winstoogmerk',NULL,0,45),
(1,225,2,0,'CVOA - Coöperatieve vennootschap met onbeperkte aansprakelijkheid ',NULL,0,46),
(1,226,2,0,'GCV  - Gewone commanditaire vennootschap',NULL,0,47),
(1,227,2,0,'Comm.VA - Commanditaire vennootschap op aandelen',NULL,0,48),
(1,228,2,0,'VOF  - Vennootschap onder firma',NULL,0,49),
(1,229,2,0,'VS0  - Vennootschap met sociaal oogmerk',NULL,0,50),
(1,10,1,0,'Entrepreneur individuel',NULL,0,52),
(1,21,1,0,'Indivision',NULL,0,53),
(1,22,1,0,'Société créée de fait',NULL,0,54),
(1,23,1,0,'Société en participation',NULL,0,55),
(1,24,1,0,'Fiducie',NULL,0,56),
(1,27,1,0,'Paroisse hors zone concordataire',NULL,0,57),
(1,28,1,0,'Assujetti unique à la TVA',NULL,0,58),
(1,29,1,0,'Autre groupement de droit privé non doté de la personnalité morale',NULL,0,59),
(1,31,1,0,'Personne morale de droit étranger, immatriculée au RCS',NULL,0,60),
(1,32,1,0,'Personne morale de droit étranger, non immatriculée au RCS',NULL,0,61),
(1,41,1,0,'Etablissement public ou régie à caractère industriel ou commercial',NULL,0,62),
(1,51,1,0,'Société coopérative commerciale particulière',NULL,0,63),
(1,52,1,0,'Société en nom collectif',NULL,0,64),
(1,53,1,0,'Société en commandite',NULL,0,65),
(1,54,1,0,'Société à responsabilité limitée (SARL)',NULL,0,66),
(1,55,1,0,'Société anonyme à conseil d\'administration',NULL,0,67),
(1,56,1,0,'Société anonyme à directoire',NULL,0,68),
(1,57,1,0,'Société par actions simplifiée (SAS)',NULL,0,69),
(1,58,1,0,'Société européenne',NULL,0,70),
(1,61,1,0,'Caisse d\'épargne et de prévoyance',NULL,0,71),
(1,62,1,0,'Groupement d\'intérêt économique (GIE)',NULL,0,72),
(1,63,1,0,'Société coopérative agricole',NULL,0,73),
(1,64,1,0,'Société d\'assurance mutuelle',NULL,0,74),
(1,65,1,0,'Société civile',NULL,0,75),
(1,69,1,0,'Autre personne morale de droit privé inscrite au RCS',NULL,0,76),
(1,71,1,0,'Administration de l état',NULL,0,77),
(1,72,1,0,'Collectivité territoriale',NULL,0,78),
(1,73,1,0,'Etablissement public administratif',NULL,0,79),
(1,74,1,0,'Personne morale de droit public administratif',NULL,0,80),
(1,81,1,0,'Organisme gérant régime de protection social à adhésion obligatoire',NULL,0,81),
(1,82,1,0,'Organisme mutualiste',NULL,0,82),
(1,83,1,0,'Comité d entreprise',NULL,0,83),
(1,84,1,0,'Organisme professionnel',NULL,0,84),
(1,85,1,0,'Organisme de retraite à adhésion non obligatoire',NULL,0,85),
(1,91,1,0,'Syndicat de propriétaires',NULL,0,86),
(1,92,1,0,'Association loi 1901 ou assimilé',NULL,0,87),
(1,93,1,0,'Fondation',NULL,0,88),
(1,99,1,0,'Autre personne morale de droit privé',NULL,0,89),
(1,500,5,0,'GmbH - Gesellschaft mit beschränkter Haftung',NULL,0,90),
(1,501,5,0,'AG - Aktiengesellschaft ',NULL,0,91),
(1,502,5,0,'GmbH&Co. KG - Gesellschaft mit beschränkter Haftung & Compagnie Kommanditgesellschaft',NULL,0,92),
(1,503,5,0,'Gewerbe - Personengesellschaft',NULL,0,93),
(1,504,5,0,'UG - Unternehmergesellschaft -haftungsbeschränkt-',NULL,0,94),
(1,505,5,0,'GbR - Gesellschaft des bürgerlichen Rechts',NULL,0,95),
(1,506,5,0,'KG - Kommanditgesellschaft',NULL,0,96),
(1,507,5,0,'Ltd. - Limited Company',NULL,0,97),
(1,508,5,0,'OHG - Offene Handelsgesellschaft',NULL,0,98),
(1,509,5,0,'eG - eingetragene Genossenschaft',NULL,0,99),
(1,8001,80,0,'Aktieselvskab A/S',NULL,0,100),
(1,8002,80,0,'Anparts Selvskab ApS',NULL,0,101),
(1,8003,80,0,'Personlig ejet selvskab',NULL,0,102),
(1,8004,80,0,'Iværksætterselvskab IVS',NULL,0,103),
(1,8005,80,0,'Interessentskab I/S',NULL,0,104),
(1,8006,80,0,'Holdingselskab',NULL,0,105),
(1,8007,80,0,'Selskab Med Begrænset Hæftelse SMBA',NULL,0,106),
(1,8008,80,0,'Kommanditselskab K/S',NULL,0,107),
(1,8009,80,0,'SPE-selskab',NULL,0,108),
(1,10201,102,0,'Ατομική επιχείρηση',NULL,0,109),
(1,10202,102,0,'Εταιρική  επιχείρηση',NULL,0,110),
(1,10203,102,0,'Ομόρρυθμη Εταιρεία Ο.Ε',NULL,0,111),
(1,10204,102,0,'Ετερόρρυθμη Εταιρεία Ε.Ε',NULL,0,112),
(1,10205,102,0,'Εταιρεία Περιορισμένης Ευθύνης Ε.Π.Ε',NULL,0,113),
(1,10206,102,0,'Ανώνυμη Εταιρεία Α.Ε',NULL,0,114),
(1,10207,102,0,'Ανώνυμη ναυτιλιακή εταιρεία Α.Ν.Ε',NULL,0,115),
(1,10208,102,0,'Συνεταιρισμός',NULL,0,116),
(1,10209,102,0,'Συμπλοιοκτησία',NULL,0,117),
(1,301,3,0,'Società semplice',NULL,0,118),
(1,302,3,0,'Società in nome collettivo s.n.c.',NULL,0,119),
(1,303,3,0,'Società in accomandita semplice s.a.s.',NULL,0,120),
(1,304,3,0,'Società per azioni s.p.a.',NULL,0,121),
(1,305,3,0,'Società a responsabilità limitata s.r.l.',NULL,0,122),
(1,306,3,0,'Società in accomandita per azioni s.a.p.a.',NULL,0,123),
(1,307,3,0,'Società cooperativa a r.l.',NULL,0,124),
(1,308,3,0,'Società consortile',NULL,0,125),
(1,309,3,0,'Società europea',NULL,0,126),
(1,310,3,0,'Società cooperativa europea',NULL,0,127),
(1,311,3,0,'Società unipersonale',NULL,0,128),
(1,312,3,0,'Società di professionisti',NULL,0,129),
(1,313,3,0,'Società di fatto',NULL,0,130),
(1,315,3,0,'Società apparente',NULL,0,131),
(1,316,3,0,'Impresa individuale ',NULL,0,132),
(1,317,3,0,'Impresa coniugale',NULL,0,133),
(1,318,3,0,'Impresa familiare',NULL,0,134),
(1,319,3,0,'Consorzio cooperativo',NULL,0,135),
(1,320,3,0,'Società cooperativa sociale',NULL,0,136),
(1,321,3,0,'Società cooperativa di consumo',NULL,0,137),
(1,322,3,0,'Società cooperativa agricola',NULL,0,138),
(1,323,3,0,'A.T.I. Associazione temporanea di imprese',NULL,0,139),
(1,324,3,0,'R.T.I. Raggruppamento temporaneo di imprese',NULL,0,140),
(1,325,3,0,'Studio associato',NULL,0,141),
(1,600,6,0,'Raison Individuelle',NULL,0,142),
(1,601,6,0,'Société Simple',NULL,0,143),
(1,602,6,0,'Société en nom collectif',NULL,0,144),
(1,603,6,0,'Société en commandite',NULL,0,145),
(1,604,6,0,'Société anonyme (SA)',NULL,0,146),
(1,605,6,0,'Société en commandite par actions',NULL,0,147),
(1,606,6,0,'Société à responsabilité limitée (SARL)',NULL,0,148),
(1,607,6,0,'Société coopérative',NULL,0,149),
(1,608,6,0,'Association',NULL,0,150),
(1,609,6,0,'Fondation',NULL,0,151),
(1,700,7,0,'Sole Trader',NULL,0,152),
(1,701,7,0,'Partnership',NULL,0,153),
(1,702,7,0,'Private Limited Company by shares (LTD)',NULL,0,154),
(1,703,7,0,'Public Limited Company',NULL,0,155),
(1,704,7,0,'Workers Cooperative',NULL,0,156),
(1,705,7,0,'Limited Liability Partnership',NULL,0,157),
(1,706,7,0,'Franchise',NULL,0,158),
(1,1000,10,0,'Société à responsabilité limitée (SARL)',NULL,0,159),
(1,1001,10,0,'Société en Nom Collectif (SNC)',NULL,0,160),
(1,1002,10,0,'Société en Commandite Simple (SCS)',NULL,0,161),
(1,1003,10,0,'société en participation',NULL,0,162),
(1,1004,10,0,'Société Anonyme (SA)',NULL,0,163),
(1,1005,10,0,'Société Unipersonnelle à Responsabilité Limitée (SUARL)',NULL,0,164),
(1,1006,10,0,'Groupement d\'intérêt économique (GEI)',NULL,0,165),
(1,1007,10,0,'Groupe de sociétés',NULL,0,166),
(1,1701,17,0,'Eenmanszaak',NULL,0,167),
(1,1702,17,0,'Maatschap',NULL,0,168),
(1,1703,17,0,'Vennootschap onder firma',NULL,0,169),
(1,1704,17,0,'Commanditaire vennootschap',NULL,0,170),
(1,1705,17,0,'Besloten vennootschap (BV)',NULL,0,171),
(1,1706,17,0,'Naamloze Vennootschap (NV)',NULL,0,172),
(1,1707,17,0,'Vereniging',NULL,0,173),
(1,1708,17,0,'Stichting',NULL,0,174),
(1,1709,17,0,'Coöperatie met beperkte aansprakelijkheid (BA)',NULL,0,175),
(1,1710,17,0,'Coöperatie met uitgesloten aansprakelijkheid (UA)',NULL,0,176),
(1,1711,17,0,'Coöperatie met wettelijke aansprakelijkheid (WA)',NULL,0,177),
(1,1712,17,0,'Onderlinge waarborgmaatschappij',NULL,0,178),
(1,401,4,0,'Empresario Individual',NULL,0,179),
(1,402,4,0,'Comunidad de Bienes',NULL,0,180),
(1,403,4,0,'Sociedad Civil',NULL,0,181),
(1,404,4,0,'Sociedad Colectiva',NULL,0,182),
(1,405,4,0,'Sociedad Limitada',NULL,0,183),
(1,406,4,0,'Sociedad Anónima',NULL,0,184),
(1,407,4,0,'Sociedad Comanditaria por Acciones',NULL,0,185),
(1,408,4,0,'Sociedad Comanditaria Simple',NULL,0,186),
(1,409,4,0,'Sociedad Laboral',NULL,0,187),
(1,410,4,0,'Sociedad Cooperativa',NULL,0,188),
(1,411,4,0,'Sociedad de Garantía Recíproca',NULL,0,189),
(1,412,4,0,'Entidad de Capital-Riesgo',NULL,0,190),
(1,413,4,0,'Agrupación de Interés Económico',NULL,0,191),
(1,414,4,0,'Sociedad de Inversión Mobiliaria',NULL,0,192),
(1,415,4,0,'Agrupación sin Ánimo de Lucro',NULL,0,193),
(1,15201,152,0,'Mauritius Private Company Limited By Shares',NULL,0,194),
(1,15202,152,0,'Mauritius Company Limited By Guarantee',NULL,0,195),
(1,15203,152,0,'Mauritius Public Company Limited By Shares',NULL,0,196),
(1,15204,152,0,'Mauritius Foreign Company',NULL,0,197),
(1,15205,152,0,'Mauritius GBC1 (Offshore Company)',NULL,0,198),
(1,15206,152,0,'Mauritius GBC2 (International Company)',NULL,0,199),
(1,15207,152,0,'Mauritius General Partnership',NULL,0,200),
(1,15208,152,0,'Mauritius Limited Partnership',NULL,0,201),
(1,15209,152,0,'Mauritius Sole Proprietorship',NULL,0,202),
(1,15210,152,0,'Mauritius Trusts',NULL,0,203),
(1,15401,154,0,'601 - General de Ley Personas Morales',NULL,0,204),
(1,15402,154,0,'603 - Personas Morales con Fines no Lucrativos',NULL,0,205),
(1,15403,154,0,'605 - Sueldos y Salarios e Ingresos Asimilados a Salarios',NULL,0,206),
(1,15404,154,0,'606 - Arrendamiento',NULL,0,207),
(1,15405,154,0,'607 - Régimen de Enajenación o Adquisición de Bienes',NULL,0,208),
(1,15406,154,0,'608 - Demás ingresos',NULL,0,209),
(1,15407,154,0,'610 - Residentes en el Extranjero sin Establecimiento Permanente en México',NULL,0,210),
(1,15408,154,0,'611 - Ingresos por Dividendos (socios y accionistas)',NULL,0,211),
(1,15409,154,0,'612 - Personas Físicas con Actividades Empresariales y Profesionales',NULL,0,212),
(1,15410,154,0,'614 - Ingresos por intereses',NULL,0,213),
(1,15411,154,0,'615 - Régimen de los ingresos por obtención de premios',NULL,0,214),
(1,15412,154,0,'616 - Sin obligaciones fiscales',NULL,0,215),
(1,15413,154,0,'620 - Sociedades Cooperativas de Producción que optan por diferir sus ingresos',NULL,0,216),
(1,15414,154,0,'621 - Incorporación Fiscal',NULL,0,217),
(1,15415,154,0,'622 - Actividades Agrícolas, Ganaderas, Silvícolas y Pesqueras',NULL,0,218),
(1,15416,154,0,'623 - Opcional para Grupos de Sociedades',NULL,0,219),
(1,15417,154,0,'624 - Coordinados',NULL,0,220),
(1,15418,154,0,'625 - Régimen de las Actividades Empresariales con ingresos a través de Plataformas Tecnológicas',NULL,0,221),
(1,15419,154,0,'626 - Régimen Simplificado de Confianza',NULL,0,222),
(1,14001,140,0,'Entreprise individuelle',NULL,0,223),
(1,14002,140,0,'Société en nom collectif (SENC)',NULL,0,224),
(1,14003,140,0,'Société en commandite simple (SECS)',NULL,0,225),
(1,14004,140,0,'Société en commandite par actions (SECA)',NULL,0,226),
(1,14005,140,0,'Société à responsabilité limitée (SARL)',NULL,0,227),
(1,14006,140,0,'Société anonyme (SA)',NULL,0,228),
(1,14007,140,0,'Société coopérative (SC)',NULL,0,229),
(1,14008,140,0,'Société européenne (SE)',NULL,0,230),
(1,14009,140,0,'Société à responsabilité limitée simplifiée (SARL-S)',NULL,0,231),
(1,18801,188,0,'AFJ - Alte forme juridice',NULL,0,232),
(1,18802,188,0,'ASF - Asociatie familialã',NULL,0,233),
(1,18803,188,0,'CON - Concesiune',NULL,0,234),
(1,18804,188,0,'CRL - Soc civilã profesionala cu pers. juridica si rãspundere limitata (SPRL)',NULL,0,235),
(1,18805,188,0,'INC - Închiriere',NULL,0,236),
(1,18806,188,0,'LOC - Locaţie de gestiune',NULL,0,237),
(1,18807,188,0,'OC1 - Organizaţie cooperatistã meşteşugãreascã',NULL,0,238),
(1,18808,188,0,'OC2 - Organizaţie cooperatistã de consum',NULL,0,239),
(1,18809,188,0,'OC3 - Organizaţie cooperatistã de credit',NULL,0,240),
(1,18810,188,0,'PFA - Persoanã fizicã independentã',NULL,0,241),
(1,18811,188,0,'RA - Regie autonomã',NULL,0,242),
(1,18812,188,0,'SA - Societate comercialã pe acţiuni',NULL,0,243),
(1,18813,188,0,'SCS - Societate comercialã în comanditã simplã',NULL,0,244),
(1,18814,188,0,'SNC - Societate comercialã în nume colectiv',NULL,0,245),
(1,18815,188,0,'SPI - Societate profesionala practicieni in insolventa (SPPI)',NULL,0,246),
(1,18816,188,0,'SRL - Societate comercialã cu rãspundere limitatã',NULL,0,247),
(1,18817,188,0,'URL - Intreprindere profesionala unipersonala cu rãspundere limitata (IPURL)',NULL,0,248),
(1,17801,178,0,'Empresa individual',NULL,0,249),
(1,17802,178,0,'Asociación General',NULL,0,250),
(1,17803,178,0,'Sociedad de Responsabilidad Limitada',NULL,0,251),
(1,17804,178,0,'Sociedad Civil',NULL,0,252),
(1,17805,178,0,'Sociedad Anónima',NULL,0,253),
(1,1300,13,0,'Personne physique',NULL,0,254),
(1,1301,13,0,'Société à responsabilité limitée (SARL)',NULL,0,255),
(1,1302,13,0,'Entreprise unipersonnelle à responsabilité limitée (EURL)',NULL,0,256),
(1,1303,13,0,'Société en Nom Collectif (SNC)',NULL,0,257),
(1,1304,13,0,'société par actions (SPA)',NULL,0,258),
(1,1305,13,0,'Société en Commandite Simple (SCS)',NULL,0,259),
(1,1306,13,0,'Société en commandite par actions (SCA)',NULL,0,260),
(1,1307,13,0,'Société en participation',NULL,0,261),
(1,1308,13,0,'Groupe de sociétés',NULL,0,262),
(1,2001,20,0,'Aktiebolag',NULL,0,263),
(1,2002,20,0,'Publikt aktiebolag (AB publ)',NULL,0,264),
(1,2003,20,0,'Ekonomisk förening (ek. för.)',NULL,0,265),
(1,2004,20,0,'Bostadsrättsförening (BRF)',NULL,0,266),
(1,2005,20,0,'Hyresrättsförening (HRF)',NULL,0,267),
(1,2006,20,0,'Kooperativ',NULL,0,268),
(1,2007,20,0,'Enskild firma (EF)',NULL,0,269),
(1,2008,20,0,'Handelsbolag (HB)',NULL,0,270),
(1,2009,20,0,'Kommanditbolag (KB)',NULL,0,271),
(1,2010,20,0,'Enkelt bolag',NULL,0,272),
(1,2011,20,0,'Ideell förening',NULL,0,273),
(1,2012,20,0,'Stiftelse',NULL,0,274),
(1,6100,61,0,'Indépendant - Personne physique',NULL,0,275),
(1,6101,61,0,'Société Unipersonnelle',NULL,0,276),
(1,6102,61,0,'Société de personne à responsabilité limité (SPRL)',NULL,0,277),
(1,6103,61,0,'Société anonyme (SA)',NULL,0,278),
(1,6104,61,0,'Société coopérative',NULL,0,279),
(1,7601,76,0,'Društvo s ograničenom odgovornošću (d.o.o.)',NULL,0,280),
(1,7602,76,0,'Jednostavno društvo s ograničenom odgovornošću (j.d.o.o.)',NULL,0,281),
(1,7603,76,0,'Dioničko društvo (d.d.)',NULL,0,282),
(1,7604,76,0,'Obrt',NULL,0,283),
(1,7605,76,0,'Javno trgovačko društvo (j.t.d.)',NULL,0,284),
(1,7606,76,0,'Komanditno društvo (k.d.)',NULL,0,285),
(1,7607,76,0,'Gospodarsko interesno udruženje (GIU)',NULL,0,286),
(1,7608,76,0,'Predstavništvo',NULL,0,287),
(1,7609,76,0,'Državno tijelo',NULL,0,288),
(1,7610,76,0,'Kućna radinost',NULL,0,289),
(1,7611,76,0,'Sporedno zanimanje',NULL,0,290),
(1,12301,123,0,'株式会社',NULL,0,291),
(1,12302,123,0,'有限会社',NULL,0,292),
(1,12303,123,0,'合資会社',NULL,0,293),
(1,12304,123,0,'合名会社',NULL,0,294),
(1,12305,123,0,'相互会社',NULL,0,295),
(1,12306,123,0,'医療法人',NULL,0,296),
(1,12307,123,0,'財団法人',NULL,0,297),
(1,12308,123,0,'社団法人',NULL,0,298),
(1,12309,123,0,'社会福祉法人',NULL,0,299),
(1,12310,123,0,'学校法人',NULL,0,300),
(1,12311,123,0,'特定非営利活動法人',NULL,0,301),
(1,12312,123,0,'ＮＰＯ法人',NULL,0,302),
(1,12313,123,0,'商工組合',NULL,0,303),
(1,12314,123,0,'林業組合',NULL,0,304),
(1,12315,123,0,'同業組合',NULL,0,305),
(1,12316,123,0,'農業協同組合',NULL,0,306),
(1,12317,123,0,'漁業協同組合',NULL,0,307),
(1,12318,123,0,'農事組合法人',NULL,0,308),
(1,12319,123,0,'生活互助会',NULL,0,309),
(1,12320,123,0,'協業組合',NULL,0,310),
(1,12321,123,0,'協同組合',NULL,0,311),
(1,12322,123,0,'生活協同組合',NULL,0,312),
(1,12323,123,0,'連合会',NULL,0,313),
(1,12324,123,0,'組合連合会',NULL,0,314),
(1,12325,123,0,'協同組合連合会',NULL,0,315),
(1,12329,123,0,'一般社団法人',NULL,0,316),
(1,12330,123,0,'公益社団法人',NULL,0,317),
(1,12331,123,0,'一般財団法人',NULL,0,318),
(1,12332,123,0,'公益財団法人',NULL,0,319),
(1,12333,123,0,'合同会社',NULL,0,320),
(1,12399,123,0,'個人又はその他の法人',NULL,0,321);
/*!40000 ALTER TABLE `llx_c_forme_juridique` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_holiday_types`
--

DROP TABLE IF EXISTS `llx_c_holiday_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_holiday_types` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `label` varchar(255) NOT NULL,
  `affect` int NOT NULL,
  `delay` int NOT NULL,
  `newbymonth` double(8,5) NOT NULL DEFAULT '0.00000',
  `fk_country` int DEFAULT NULL,
  `block_if_negative` int NOT NULL DEFAULT '0',
  `sortorder` smallint DEFAULT NULL,
  `active` int DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_holiday_types` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_holiday_types`
--

LOCK TABLES `llx_c_holiday_types` WRITE;
/*!40000 ALTER TABLE `llx_c_holiday_types` DISABLE KEYS */;
INSERT INTO `llx_c_holiday_types` VALUES
(1,0,0,'LEAVE_SICK',0,NULL,'Sick leave',0.00000,1,1),
(1,0,0,'LEAVE_OTHER',0,NULL,'Other leave',0.00000,2,2),
(0,1,0,'LEAVE_PAID',7,NULL,'Paid vacation',0.00000,3,3),
(1,1,0,'LEAVE_RTT_FR',7,1,'RTT',0.83000,4,4),
(1,1,0,'LEAVE_PAID_FR',30,1,'Paid vacation',2.08334,5,5),
(1,1,0,'5D1Y',0,102,'Κανονική άδεια(Πενθήμερο 1ο έτος)',1.66700,6,6),
(1,1,0,'5D2Y',0,102,'Κανονική άδεια(Πενθήμερο 2ο έτος)',1.75000,7,7),
(1,1,0,'5D3-10Y',0,102,'Κανονική άδεια(Πενθήμερο 3ο έως 10ο έτος)',1.83300,8,8),
(1,1,0,'5D10-25Y',0,102,'Κανονική άδεια(Πενθήμερο 10ο έως 25ο έτος)',2.08300,9,9),
(1,1,0,'5D25+Y',0,102,'Κανονική άδεια(Πενθήμερο 25+ έτη)',2.16600,10,10),
(1,1,0,'6D1Y',0,102,'Κανονική άδεια(Εξαήμερο 1ο έτος)',2.00000,11,11),
(1,1,0,'6D2Y',0,102,'Κανονική άδεια(Εξαήμερο 2ο έτος)',2.08300,12,12),
(1,1,0,'6D3-10Y',0,102,'Κανονική άδεια(Εξαήμερο 3ο έως 10ο έτος)',2.16600,13,13),
(1,1,0,'6D10-25Y',0,102,'Κανονική άδεια(Εξαήμερο 10ο έως 25ο έτος)',2.08300,14,14),
(1,1,0,'6D25+Y',0,102,'Κανονική άδεια(Εξαήμερο 25+ έτη)',2.16600,15,15),
(0,0,0,'5D-WED',0,102,'Πενθήμερη άδεια γάμου(με αποδοχές)',0.00000,16,16),
(0,0,0,'6D-WED',0,102,'Εξαήμερη άδεια γάμου(με αποδοχές)',0.00000,17,17),
(0,0,0,'7D-AR',0,102,'Επταήμερη άδεια ιατρικώς υποβοηθούμενης αναπαραγωγής(με αποδοχές)',0.00000,18,18),
(0,0,0,'1D-BC',0,102,'Μονοήμερη άδεια προγεννητικών εξετάσεων(με αποδοχές)',0.00000,19,19),
(0,0,0,'1D-GYN',0,102,'Μονοήμερη άδεια γυναικολογικού ελέγχου(με αποδοχές)',0.00000,20,20),
(0,0,0,'149D-ML',0,102,'Άδεια Μητρότητας (Άδεια κύησης – λοχείας)56 ημέρες πριν-93 ημέρες μετα(με αποδοχές)',0.00000,21,21),
(0,0,0,'14D-PL',0,102,'14ήμερη Άδεια πατρότητας(με αποδοχές)',0.00000,22,22),
(0,0,0,'1-2H-CC',0,102,'Άδεια φροντίδας παιδιών (μειωμένο ωράριο  https://www.kepea.gr/aarticle.php?id=1984)',0.00000,23,23),
(0,0,0,'9M-M',0,102,'Ειδική άδεια προστασίας μητρότητας 9 μηνών(χωρίς αποδοχές)',0.00000,24,24),
(0,0,0,'4M-M',0,102,'Τετράμηνη γονική Άδεια Ανατροφής Τέκνων(χωρίς αποδοχές)',0.00000,25,25),
(0,0,0,'6-8D-SP',0,102,'Εξαήμερη ή Οκταήμερη Άδεια για μονογονεϊκές οικογένειες(με αποδοχές)',0.00000,26,26),
(0,0,0,'6-8-14D-FC',0,102,'Άδεια για ασθένεια μελών οικογένειας(χωρίς αποδοχές, 6 ημέρες/έτος ένα παιδί - 8 ημέρες/έτος δύο παιδιά και σε 14 ημέρες/έτος τρία (3) παιδιά και πάνω',0.00000,27,27),
(0,0,0,'10D-CD',0,102,'Δεκαήμερη Γονική Άδεια για παιδί με σοβαρά νοσήματα και λόγω νοσηλείας παιδιών(με αποδοχές)',0.00000,28,28),
(0,0,0,'30D-CD',0,102,'Άδεια λόγω νοσηλείας των παιδιών(έως 30 ημέρες/έτος χωρίς αποδοχές)',0.00000,29,29),
(0,0,0,'5D-CG',0,102,'Άδεια φροντιστή(έως 5 ημέρες/έτος χωρίς αποδοχές)',0.00000,30,30),
(0,0,0,'2D-CG',0,102,'Άδεια απουσίας από την εργασία για λόγους ανωτέρας βίας(έως 2 ημέρες/έτος με αποδοχές)',0.00000,31,31),
(0,0,0,'2D-SC',0,102,'Άδεια για παρακολούθηση σχολικής επίδοσης(έως 2 ημέρες/έτος με αποδοχές)',0.00000,32,32),
(0,0,0,'1D-BD',0,102,'Μονοήμερη άδεια αιμοδοσίας(με αποδοχές)',0.00000,33,33),
(0,0,0,'22D-BT',0,102,'Άδεια για μετάγγιση αίματος & αιμοκάθαρση(έως 22 ημέρες/έτος με αποδοχές)',0.00000,34,34),
(0,0,0,'30D-HIV',0,102,'Άδεια λόγω AIDS(έως ένα (1) μήνα/έτος με αποδοχές)',0.00000,35,35),
(0,0,0,'20D-CD',0,102,'Άδεια πενθούντων γονέων(20 ημέρες με αποδοχές)',0.00000,36,36),
(0,0,0,'2D-FD',0,102,'Άδεια λόγω θανάτου συγγενούς(2 ημέρες με αποδοχές)',0.00000,37,37),
(0,0,0,'DIS',0,102,'Άδειες αναπήρων(30 ημέρες με αποδοχές)',0.00000,38,38),
(0,0,0,'SE',0,102,'Άδεια εξετάσεων μαθητών, σπουδαστών, φοιτητών(30 ημέρες χωρίς αποδοχές)',0.00000,39,39),
(0,0,0,'NOT PAID',0,102,'Άδεια άνευ αποδοχών(έως ένα (1) έτος)',0.00000,40,40);
/*!40000 ALTER TABLE `llx_c_holiday_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_hrm_department`
--

DROP TABLE IF EXISTS `llx_c_hrm_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_hrm_department` (
  `rowid` int NOT NULL,
  `pos` tinyint NOT NULL DEFAULT '0',
  `code` varchar(16) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_hrm_department`
--

LOCK TABLES `llx_c_hrm_department` WRITE;
/*!40000 ALTER TABLE `llx_c_hrm_department` DISABLE KEYS */;
INSERT INTO `llx_c_hrm_department` VALUES
(1,'MANAGEMENT','Management',5,1),
(1,'TRAINING','Training',15,3),
(0,'IT','Inform. Technology (IT)',20,4),
(0,'MARKETING','Marketing',25,5),
(1,'SALES','Sales',30,6),
(0,'LEGAL','Legal',35,7),
(1,'FINANCIAL','Financial accounting',40,8),
(1,'HUMANRES','Human resources',45,9),
(1,'PURCHASING','Purchasing',50,10),
(0,'CUSTOMSERV','Customer service',60,12),
(1,'LOGISTIC','Logistics',70,14),
(0,'CONSTRUCT','Engineering/design',75,15),
(1,'PRODUCTION','Production',80,16),
(0,'QUALITY','Quality assurance',85,17);
/*!40000 ALTER TABLE `llx_c_hrm_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_hrm_function`
--

DROP TABLE IF EXISTS `llx_c_hrm_function`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_hrm_function` (
  `rowid` int NOT NULL,
  `pos` tinyint NOT NULL DEFAULT '0',
  `code` varchar(16) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `c_level` tinyint NOT NULL DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_hrm_function`
--

LOCK TABLES `llx_c_hrm_function` WRITE;
/*!40000 ALTER TABLE `llx_c_hrm_function` DISABLE KEYS */;
INSERT INTO `llx_c_hrm_function` VALUES
(1,0,'EXECBOARD','Executive board',5,1),
(1,1,'MANAGDIR','Managing director',10,2),
(1,0,'ACCOUNTMANAG','Account manager',15,3),
(1,1,'ENGAGDIR','Engagement director',20,4),
(1,1,'DIRECTOR','Director',25,5),
(1,0,'PROJMANAG','Project manager',30,6),
(1,0,'DEPHEAD','Department head',35,7),
(1,0,'SECRETAR','Secretary',40,8),
(1,0,'EMPLOYEE','Department employee',45,9);
/*!40000 ALTER TABLE `llx_c_hrm_function` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_hrm_public_holiday`
--

DROP TABLE IF EXISTS `llx_c_hrm_public_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_hrm_public_holiday` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '0',
  `fk_country` int DEFAULT NULL,
  `fk_departement` int DEFAULT NULL,
  `code` varchar(62) DEFAULT NULL,
  `dayrule` varchar(64) DEFAULT '',
  `day` int DEFAULT NULL,
  `month` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `active` int DEFAULT '1',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_hrm_public_holiday` (`entity`,`code`),
  UNIQUE KEY `uk_c_hrm_public_holiday2` (`entity`,`fk_country`,`dayrule`,`day`,`month`,`year`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_hrm_public_holiday`
--

LOCK TABLES `llx_c_hrm_public_holiday` WRITE;
/*!40000 ALTER TABLE `llx_c_hrm_public_holiday` DISABLE KEYS */;
INSERT INTO `llx_c_hrm_public_holiday` VALUES
(1,'NEWYEARDAY1',1,'',0,0,NULL,1,NULL,1,0),
(1,'LABORDAY1',1,'',0,0,NULL,2,NULL,5,0),
(1,'ASSOMPTIONDAY1',15,'',0,0,NULL,3,NULL,8,0),
(1,'CHRISTMASDAY1',25,'',0,0,NULL,4,NULL,12,0),
(1,'FR-VICTORYDAY',8,'',0,1,NULL,5,NULL,5,0),
(1,'FR-NATIONALDAY',14,'',0,1,NULL,6,NULL,7,0),
(1,'FR-ASSOMPTION',15,'',0,1,NULL,7,NULL,8,0),
(1,'FR-TOUSSAINT',1,'',0,1,NULL,8,NULL,11,0),
(1,'FR-ARMISTICE',11,'',0,1,NULL,9,NULL,11,0),
(1,'FR-EASTER',0,'eastermonday',0,1,NULL,10,NULL,0,0),
(1,'FR-ASCENSION',0,'ascension',0,1,NULL,11,NULL,0,0),
(1,'FR-PENTECOST',0,'pentecost',0,1,NULL,12,NULL,0,0),
(1,'BE-VICTORYDAY',8,'',0,2,NULL,13,NULL,5,0),
(1,'BE-NATIONALDAY',21,'',0,2,NULL,14,NULL,7,0),
(1,'BE-ASSOMPTION',15,'',0,2,NULL,15,NULL,8,0),
(1,'BE-TOUSSAINT',1,'',0,2,NULL,16,NULL,11,0),
(1,'BE-ARMISTICE',11,'',0,2,NULL,17,NULL,11,0),
(1,'BE-EASTER',0,'eastermonday',0,2,NULL,18,NULL,0,0),
(1,'BE-ASCENSION',0,'ascension',0,2,NULL,19,NULL,0,0),
(1,'BE-PENTECOST',0,'pentecost',0,2,NULL,20,NULL,0,0),
(1,'IT-LIBEAZIONE',25,'',0,3,NULL,21,NULL,4,0),
(1,'IT-EPIPHANY',1,'',0,3,NULL,22,NULL,6,0),
(1,'IT-REPUBBLICA',2,'',0,3,NULL,23,NULL,6,0),
(1,'IT-TUTTISANTIT',1,'',0,3,NULL,24,NULL,11,0),
(1,'IT-IMMACULE',8,'',0,3,NULL,25,NULL,12,0),
(1,'IT-SAINTSTEFAN',26,'',0,3,NULL,26,NULL,12,0),
(1,'ES-EASTER',0,'easter',0,4,NULL,27,NULL,0,0),
(1,'ES-REYE',1,'',0,4,NULL,28,NULL,6,0),
(1,'ES-HISPANIDAD',12,'',0,4,NULL,29,NULL,10,0),
(1,'ES-TOUSSAINT',1,'',0,4,NULL,30,NULL,11,0),
(1,'ES-CONSTITUIZION',6,'',0,4,NULL,31,NULL,12,0),
(1,'ES-IMMACULE',8,'',0,4,NULL,32,NULL,12,0),
(1,'DE-NEUJAHR',1,'',0,5,NULL,33,NULL,1,0),
(0,'DE-HL3KOEN--TLW',6,'',0,5,NULL,34,NULL,1,0),
(0,'DE-INTFRAUENTAG--TLW',8,'',0,5,NULL,35,NULL,3,0),
(1,'DE-KARFREITAG',0,'goodfriday',0,5,NULL,36,NULL,0,0),
(1,'DE-OSTERMONTAG',0,'eastermonday',0,5,NULL,37,NULL,0,0),
(1,'DE-TAGDERARBEIT',1,'',0,5,NULL,38,NULL,5,0),
(1,'DE-HIMMELFAHRT',0,'ascension',0,5,NULL,39,NULL,0,0),
(1,'DE-PFINGSTEN',0,'pentecotemonday',0,5,NULL,40,NULL,0,0),
(0,'DE-FRONLEICHNAM--TLW',0,'fronleichnam',0,5,NULL,41,NULL,0,0),
(0,'DE-MARIAEHIMMEL--TLW',15,'',0,5,NULL,42,NULL,8,0),
(0,'DE-WELTKINDERTAG--TLW',20,'',0,5,NULL,43,NULL,9,0),
(1,'DE-TAGDERDEUTEINHEIT',3,'',0,5,NULL,44,NULL,10,0),
(0,'DE-REFORMATIONSTAG--TLW',31,'',0,5,NULL,45,NULL,10,0),
(0,'DE-ALLERHEILIGEN--TLW',1,'',0,5,NULL,46,NULL,11,0),
(1,'DE-WEIHNACHTSTAG1',25,'',0,5,NULL,47,NULL,12,0),
(1,'DE-WEIHNACHTSTAG2',26,'',0,5,NULL,48,NULL,12,0),
(1,'AT-EASTER',0,'eastermonday',0,41,NULL,49,NULL,0,0),
(1,'AT-ASCENSION',0,'ascension',0,41,NULL,50,NULL,0,0),
(1,'AT-PENTECOST',0,'pentecost',0,41,NULL,51,NULL,0,0),
(1,'AT-FRONLEICHNAM',0,'fronleichnam',0,41,NULL,52,NULL,0,0),
(1,'AT-KONEGIE',1,'',0,41,NULL,53,NULL,6,0),
(1,'AT-26OKT',26,'',0,41,NULL,54,NULL,10,0),
(1,'AT-TOUSSAINT',1,'',0,41,NULL,55,NULL,11,0),
(1,'AT-IMMACULE',8,'',0,41,NULL,56,NULL,12,0),
(1,'AT-24DEC',24,'',0,41,NULL,57,NULL,12,0),
(1,'AT-SAINTSTEFAN',26,'',0,41,NULL,58,NULL,12,0),
(1,'AT-Silvester',31,'',0,41,NULL,59,NULL,12,0),
(1,'GR-ΠΡΩΤΟΧΡΟΝΙΑ',1,'',0,102,NULL,60,NULL,1,0),
(1,'GR-ΘΕΟΦΑΝΕΙΑ',6,'',0,102,NULL,61,NULL,1,0),
(1,'GR-25Η ΜΑΡΤΙΟΥ',25,'',0,102,NULL,62,NULL,3,0),
(1,'GR-ΠΡΩΤΟΜΑΓΙΑ',1,'',0,102,NULL,63,NULL,5,0),
(1,'GR-ΚΑΘΑΡΑ ΔΕΥΤΕΡΑ',0,'ΚΑΘΑΡΑ_ΔΕΥΤΕΡΑ',0,102,NULL,64,NULL,0,0),
(1,'GR-ΜΕΓΑΛΗ ΠΑΡΑΣΚΕΥΗ',0,'ΜΕΓΑΛΗ_ΠΑΡΑΣΚΕΥΗ',0,102,NULL,65,NULL,0,0),
(1,'GR-ΔΕΥΤΕΡΑ ΤΟΥ ΠΑΣΧΑ',0,'ΔΕΥΤΕΡΑ_ΤΟΥ_ΠΑΣΧΑ',0,102,NULL,66,NULL,0,0),
(1,'GR-ΤΟΥ ΑΓΙΟΥ ΠΝΕΥΜΑΤΟΣ',0,'ΤΟΥ_ΑΓΙΟΥ_ΠΝΕΥΜΑΤΟΣ',0,102,NULL,67,NULL,0,0),
(1,'GR-ΚΟΙΜΗΣΗ ΤΗΣ ΘΕΟΤΟΚΟΥ',15,'',0,102,NULL,68,NULL,8,0),
(1,'GR-28Η ΟΚΤΩΒΡΙΟΥ',28,'',0,102,NULL,69,NULL,10,0),
(1,'GR-ΧΡΙΣΤΟΥΓΕΝΝΑ',25,'',0,102,NULL,70,NULL,12,0),
(1,'GR-ΣΥΝΑΞΗ ΘΕΟΤΟΚΟΥ',26,'',0,102,NULL,71,NULL,12,0),
(1,'IN-REPUBLICDAY',26,'',0,117,NULL,72,NULL,1,0),
(1,'IN-GANDI',2,'',0,117,NULL,73,NULL,10,0);
/*!40000 ALTER TABLE `llx_c_hrm_public_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_incoterms`
--

DROP TABLE IF EXISTS `llx_c_incoterms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_incoterms` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `libelle` varchar(255) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_incoterms` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_incoterms`
--

LOCK TABLES `llx_c_incoterms` WRITE;
/*!40000 ALTER TABLE `llx_c_incoterms` DISABLE KEYS */;
INSERT INTO `llx_c_incoterms` VALUES
(1,'EXW','Ex Works','Ex Works, au départ non chargé, non dédouané sortie d\'usine (uniquement adapté aux flux domestiques, nationaux)',1),
(1,'FCA','Free Carrier','Free Carrier, marchandises dédouanées et chargées dans le pays de départ, chez le vendeur ou chez le commissionnaire de transport de l\'acheteur',2),
(1,'FAS','Free Alongside Ship','Free Alongside Ship, sur le quai du port de départ',3),
(1,'FOB','Free On Board','Free On Board, chargé sur le bateau, les frais de chargement dans celui-ci étant fonction du liner term indiqué par la compagnie maritime (à la charge du vendeur)',4),
(1,'CFR','Cost and Freight','Cost and Freight, chargé dans le bateau, livraison au port de départ, frais payés jusqu\'au port d\'arrivée, sans assurance pour le transport, non déchargé du navire à destination (les frais de déchargement sont inclus ou non au port d\'arrivée)',5),
(1,'CIF','Cost, Insurance, Freight','Cost, Insurance and Freight, chargé sur le bateau, frais jusqu\'au port d\'arrivée, avec l\'assurance marchandise transportée souscrite par le vendeur pour le compte de l\'acheteur',6),
(1,'CPT','Carriage Paid To','Carriage Paid To, livraison au premier transporteur, frais jusqu\'au déchargement du mode de transport, sans assurance pour le transport',7),
(1,'CIP','Carriage Insurance Paid','Carriage and Insurance Paid to, idem CPT, avec assurance marchandise transportée souscrite par le vendeur pour le compte de l\'acheteur',8),
(1,'DAT','Delivered At Terminal','Delivered At Terminal, marchandises (déchargées) livrées sur quai, dans un terminal maritime, fluvial, aérien, routier ou ferroviaire désigné (dédouanement import, et post-acheminement payés par l\'acheteur)',9),
(1,'DAP','Delivered At Place','Delivered At Place, marchandises (non déchargées) mises à disposition de l\'acheteur dans le pays d\'importation au lieu précisé dans le contrat (déchargement, dédouanement import payé par l\'acheteur)',10),
(1,'DDP','Delivered Duty Paid','Delivered Duty Paid, marchandises (non déchargées) livrées à destination finale, dédouanement import et taxes à la charge du vendeur ; l\'acheteur prend en charge uniquement le déchargement (si exclusion des taxes type TVA, le préciser clairement)',11),
(1,'DPU','Delivered at Place Unloaded','Delivered at Place unloaded',12);
/*!40000 ALTER TABLE `llx_c_incoterms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_input_method`
--

DROP TABLE IF EXISTS `llx_c_input_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_input_method` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_input_method` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_input_method`
--

LOCK TABLES `llx_c_input_method` WRITE;
/*!40000 ALTER TABLE `llx_c_input_method` DISABLE KEYS */;
INSERT INTO `llx_c_input_method` VALUES
(1,'OrderByMail','Courrier',NULL,1),
(1,'OrderByFax','Fax',NULL,2),
(1,'OrderByEMail','EMail',NULL,3),
(1,'OrderByPhone','Téléphone',NULL,4),
(1,'OrderByWWW','En ligne',NULL,5);
/*!40000 ALTER TABLE `llx_c_input_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_input_reason`
--

DROP TABLE IF EXISTS `llx_c_input_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_input_reason` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_input_reason` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_input_reason`
--

LOCK TABLES `llx_c_input_reason` WRITE;
/*!40000 ALTER TABLE `llx_c_input_reason` DISABLE KEYS */;
INSERT INTO `llx_c_input_reason` VALUES
(1,'SRC_INTE','Web site',NULL,1),
(1,'SRC_CAMP_MAIL','Mailing campaign',NULL,2),
(1,'SRC_CAMP_PHO','Phone campaign',NULL,3),
(1,'SRC_CAMP_FAX','Fax campaign',NULL,4),
(1,'SRC_COMM','Commercial contact',NULL,5),
(1,'SRC_SHOP','Shop contact',NULL,6),
(1,'SRC_CAMP_EMAIL','EMailing campaign',NULL,7),
(1,'SRC_WOM','Word of mouth',NULL,8),
(1,'SRC_PARTNER','Partner',NULL,9),
(1,'SRC_EMPLOYEE','Employee',NULL,10),
(1,'SRC_SPONSORING','Sponsorship',NULL,11),
(1,'SRC_CUSTOMER','Incoming contact of a customer',NULL,12);
/*!40000 ALTER TABLE `llx_c_input_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_invoice_subtype`
--

DROP TABLE IF EXISTS `llx_c_invoice_subtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_invoice_subtype` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '1',
  `fk_country` int NOT NULL,
  `code` varchar(4) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_invoice_subtype` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_invoice_subtype`
--

LOCK TABLES `llx_c_invoice_subtype` WRITE;
/*!40000 ALTER TABLE `llx_c_invoice_subtype` DISABLE KEYS */;
INSERT INTO `llx_c_invoice_subtype` VALUES
(1,'1.1',1,102,'Τιμολόγιο Πώλησης',1),
(1,'1.2',1,102,'Τιμολόγιο Πώλησης / Ενδοκοινοτικές Παραδόσεις',2),
(1,'1.3',1,102,'Τιμολόγιο Πώλησης / Παραδόσεις Τρίτων Χωρών',3),
(0,'1.4',1,102,'Τιμολόγιο Πώλησης / Πώληση για Λογαριασμό Τρίτων',4),
(0,'1.5',1,102,'Τιμολόγιο Πώλησης / Εκκαθάριση Πωλήσεων Τρίτων - Αμοιβή από Πωλήσεις Τρίτων',5),
(0,'1.6',1,102,'Τιμολόγιο Πώλησης / Συμπληρωματικό Παραστατικό',6),
(1,'2.1',1,102,'Τιμολόγιο Παροχής',7),
(1,'2.2',1,102,'Τιμολόγιο Παροχής / Ενδοκοινοτική Παροχή Υπηρεσιών',8),
(1,'2.3',1,102,'Τιμολόγιο Παροχής / Παροχή Υπηρεσιών σε λήπτη Τρίτης Χώρας',9),
(0,'2.4',1,102,'Τιμολόγιο Παροχής / Συμπληρωματικό Παραστατικό',10),
(0,'3.1',1,102,'Τίτλος Κτήσης (μη υπόχρεος Εκδότης)',11),
(0,'3.2',1,102,'Τίτλος Κτήσης (άρνηση έκδοσης από υπόχρεο Εκδότη)',12),
(0,'6.1',1,102,'Στοιχείο Αυτοπαράδοσης',13),
(0,'6.2',1,102,'Στοιχείο Ιδιοχρησιμοποίησης',14),
(0,'7.1',1,102,'Συμβόλαιο - Έσοδο',15),
(0,'8.1',1,102,'Ενοίκια - Έσοδο',16),
(0,'8.2',1,102,'Ειδικό Στοιχείο – Απόδειξης Είσπραξης Φόρου Διαμονής',17),
(1,'11.1',1,102,'ΑΛΠ',18),
(1,'11.2',1,102,'ΑΠΥ',19),
(0,'11.3',1,102,'Απλοποιημένο Τιμολόγιο',20),
(0,'11.5',1,102,'Απόδειξη Λιανικής Πώλησης για Λογ/σμό Τρίτων',21);
/*!40000 ALTER TABLE `llx_c_invoice_subtype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_lead_status`
--

DROP TABLE IF EXISTS `llx_c_lead_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_lead_status` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `position` int DEFAULT NULL,
  `percent` double(5,2) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_lead_status_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_lead_status`
--

LOCK TABLES `llx_c_lead_status` WRITE;
/*!40000 ALTER TABLE `llx_c_lead_status` DISABLE KEYS */;
INSERT INTO `llx_c_lead_status` VALUES
(1,'PROSP','Prospection',0.00,10,1),
(1,'QUAL','Qualification',20.00,20,2),
(1,'PROPO','Proposal',40.00,30,3),
(1,'NEGO','Negotiation',60.00,40,4),
(0,'PENDING','Pending',50.00,50,5),
(1,'WON','Won',100.00,60,6),
(1,'LOST','Lost',0.00,70,7);
/*!40000 ALTER TABLE `llx_c_lead_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_paiement`
--

DROP TABLE IF EXISTS `llx_c_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_paiement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `code` varchar(6) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `type` smallint DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `accountancy_code` varchar(32) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_paiement_code` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_paiement`
--

LOCK TABLES `llx_c_paiement` WRITE;
/*!40000 ALTER TABLE `llx_c_paiement` DISABLE KEYS */;
INSERT INTO `llx_c_paiement` VALUES
(NULL,0,'TIP',1,1,'TIP',NULL,0,2),
(NULL,1,'VIR',1,2,'Credit Transfer',NULL,0,2),
(NULL,1,'PRE',1,3,'Direct Debit',NULL,0,2),
(NULL,1,'LIQ',1,4,'Cash',NULL,0,2),
(NULL,1,'CB',1,6,'Credit card',NULL,0,2),
(NULL,1,'CHQ',1,7,'Cheque',NULL,0,2),
(NULL,0,'VAD',1,50,'Online payment',NULL,0,2),
(NULL,0,'TRA',1,51,'Traite',NULL,0,2),
(NULL,0,'LCR',1,52,'LCR',NULL,0,2),
(NULL,0,'FAC',1,53,'Factor',NULL,0,2),
(NULL,0,'KLA',1,100,'Klarna',NULL,0,1),
(NULL,0,'SOF',1,101,'Sofort',NULL,0,1),
(NULL,0,'BANCON',1,102,'Bancontact',NULL,0,1),
(NULL,0,'IDE',1,103,'iDeal',NULL,0,1),
(NULL,0,'GIR',1,104,'Giropay',NULL,0,1),
(NULL,0,'PPL',1,105,'PayPal',NULL,0,1);
/*!40000 ALTER TABLE `llx_c_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_paper_format`
--

DROP TABLE IF EXISTS `llx_c_paper_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_paper_format` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `label` varchar(128) NOT NULL,
  `width` float(6,2) DEFAULT '0.00',
  `height` float(6,2) DEFAULT '0.00',
  `unit` varchar(5) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_paper_format`
--

LOCK TABLES `llx_c_paper_format` WRITE;
/*!40000 ALTER TABLE `llx_c_paper_format` DISABLE KEYS */;
INSERT INTO `llx_c_paper_format` VALUES
(1,'EU4A0',2378.00,'Format 4A0',NULL,1,'mm',1682.00),
(1,'EU2A0',1682.00,'Format 2A0',NULL,2,'mm',1189.00),
(1,'EUA0',1189.00,'Format A0',NULL,3,'mm',840.00),
(1,'EUA1',840.00,'Format A1',NULL,4,'mm',594.00),
(1,'EUA2',594.00,'Format A2',NULL,5,'mm',420.00),
(1,'EUA3',420.00,'Format A3',NULL,6,'mm',297.00),
(1,'EUA4',297.00,'Format A4',NULL,7,'mm',210.00),
(1,'EUA5',210.00,'Format A5',NULL,8,'mm',148.00),
(1,'EUA6',148.00,'Format A6',NULL,9,'mm',105.00),
(1,'USLetter',279.00,'Format Letter (A)',NULL,100,'mm',216.00),
(1,'USLegal',356.00,'Format Legal',NULL,105,'mm',216.00),
(1,'USExecutive',254.00,'Format Executive',NULL,110,'mm',190.00),
(1,'USLedger',432.00,'Format Ledger/Tabloid (B)',NULL,115,'mm',279.00),
(1,'CAP1',860.00,'Format Canadian P1',NULL,200,'mm',560.00),
(1,'CAP2',560.00,'Format Canadian P2',NULL,205,'mm',430.00),
(1,'CAP3',430.00,'Format Canadian P3',NULL,210,'mm',280.00),
(1,'CAP4',280.00,'Format Canadian P4',NULL,215,'mm',215.00),
(1,'CAP5',215.00,'Format Canadian P5',NULL,220,'mm',140.00),
(1,'CAP6',140.00,'Format Canadian P6',NULL,225,'mm',107.00);
/*!40000 ALTER TABLE `llx_c_paper_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_payment_term`
--

DROP TABLE IF EXISTS `llx_c_payment_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_payment_term` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `code` varchar(16) DEFAULT NULL,
  `sortorder` smallint DEFAULT NULL,
  `active` tinyint DEFAULT '1',
  `libelle` varchar(255) DEFAULT NULL,
  `libelle_facture` text,
  `type_cdr` tinyint DEFAULT NULL,
  `nbjour` smallint DEFAULT NULL,
  `decalage` smallint DEFAULT NULL,
  `deposit_percent` varchar(63) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_payment_term_code` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_payment_term`
--

LOCK TABLES `llx_c_payment_term` WRITE;
/*!40000 ALTER TABLE `llx_c_payment_term` DISABLE KEYS */;
INSERT INTO `llx_c_payment_term` VALUES
(1,'RECEP',NULL,NULL,1,'Due upon receipt','Due upon receipt',NULL,1,0,1,1,0),
(1,'30D',NULL,NULL,1,'30 days','Due in 30 days',NULL,30,0,2,2,0),
(1,'30DENDMONTH',NULL,NULL,1,'30 days end of month','Due in 30 days, end of month',NULL,30,0,3,3,1),
(1,'60D',NULL,NULL,1,'60 days','Due in 60 days, end of month',NULL,60,0,4,4,0),
(1,'60DENDMONTH',NULL,NULL,1,'60 days end of month','Due in 60 days, end of month',NULL,60,0,5,5,1),
(1,'PT_ORDER',NULL,NULL,1,'Due on order','Due on order',NULL,1,0,6,6,0),
(1,'PT_DELIVERY',NULL,NULL,1,'Due on delivery','Due on delivery',NULL,1,0,7,7,0),
(1,'PT_5050',NULL,NULL,1,'50 and 50','50% on order, 50% on delivery',NULL,1,0,8,8,0),
(1,'10D',NULL,NULL,1,'10 days','Due in 10 days',NULL,10,0,9,9,0),
(1,'10DENDMONTH',NULL,NULL,1,'10 days end of month','Due in 10 days, end of month',NULL,10,0,10,10,1),
(1,'14D',NULL,NULL,1,'14 days','Due in 14 days',NULL,14,0,11,11,0),
(1,'14DENDMONTH',NULL,NULL,1,'14 days end of month','Due in 14 days, end of month',NULL,14,0,12,12,1),
(0,'DEP30PCTDEL',NULL,'30',1,'__DEPOSIT_PERCENT__% deposit','__DEPOSIT_PERCENT__% deposit, remainder on delivery',NULL,1,0,13,13,0);
/*!40000 ALTER TABLE `llx_c_payment_term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_price_expression`
--

DROP TABLE IF EXISTS `llx_c_price_expression`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_price_expression` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `expression` varchar(255) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_price_expression`
--

LOCK TABLES `llx_c_price_expression` WRITE;
/*!40000 ALTER TABLE `llx_c_price_expression` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_price_expression` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_price_global_variable`
--

DROP TABLE IF EXISTS `llx_c_price_global_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_price_global_variable` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `description` text,
  `value` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_price_global_variable`
--

LOCK TABLES `llx_c_price_global_variable` WRITE;
/*!40000 ALTER TABLE `llx_c_price_global_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_price_global_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_price_global_variable_updater`
--

DROP TABLE IF EXISTS `llx_c_price_global_variable_updater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_price_global_variable_updater` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `type` int NOT NULL,
  `description` text,
  `parameters` text,
  `fk_variable` int NOT NULL,
  `update_interval` int DEFAULT '0',
  `next_update` int DEFAULT '0',
  `last_status` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_price_global_variable_updater`
--

LOCK TABLES `llx_c_price_global_variable_updater` WRITE;
/*!40000 ALTER TABLE `llx_c_price_global_variable_updater` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_price_global_variable_updater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_product_nature`
--

DROP TABLE IF EXISTS `llx_c_product_nature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_product_nature` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` tinyint NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_product_nature` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_product_nature`
--

LOCK TABLES `llx_c_product_nature` WRITE;
/*!40000 ALTER TABLE `llx_c_product_nature` DISABLE KEYS */;
INSERT INTO `llx_c_product_nature` VALUES
(1,0,'RowMaterial',1),
(1,1,'Finished',2);
/*!40000 ALTER TABLE `llx_c_product_nature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_productbatch_qcstatus`
--

DROP TABLE IF EXISTS `llx_c_productbatch_qcstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_productbatch_qcstatus` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `code` varchar(16) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_productbatch_qcstatus` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_productbatch_qcstatus`
--

LOCK TABLES `llx_c_productbatch_qcstatus` WRITE;
/*!40000 ALTER TABLE `llx_c_productbatch_qcstatus` DISABLE KEYS */;
INSERT INTO `llx_c_productbatch_qcstatus` VALUES
(1,'OK',1,'InWorkingOrder',1),
(1,'KO',1,'OutOfOrder',2);
/*!40000 ALTER TABLE `llx_c_productbatch_qcstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_propalst`
--

DROP TABLE IF EXISTS `llx_c_propalst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_propalst` (
  `id` smallint NOT NULL,
  `code` varchar(12) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `sortorder` smallint DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_propalst` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_propalst`
--

LOCK TABLES `llx_c_propalst` WRITE;
/*!40000 ALTER TABLE `llx_c_propalst` DISABLE KEYS */;
INSERT INTO `llx_c_propalst` VALUES
(1,'PR_DRAFT',0,'Brouillon',0),
(1,'PR_OPEN',1,'Ouverte',0),
(1,'PR_SIGNED',2,'Signée',0),
(1,'PR_NOTSIGNED',3,'Non Signée',0),
(1,'PR_FAC',4,'Facturée',0);
/*!40000 ALTER TABLE `llx_c_propalst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_prospectcontactlevel`
--

DROP TABLE IF EXISTS `llx_c_prospectcontactlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_prospectcontactlevel` (
  `code` varchar(12) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `sortorder` smallint DEFAULT NULL,
  `active` smallint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_prospectcontactlevel`
--

LOCK TABLES `llx_c_prospectcontactlevel` WRITE;
/*!40000 ALTER TABLE `llx_c_prospectcontactlevel` DISABLE KEYS */;
INSERT INTO `llx_c_prospectcontactlevel` VALUES
(1,'PL_HIGH','High',NULL,4),
(1,'PL_LOW','Low',NULL,2),
(1,'PL_MEDIUM','Medium',NULL,3),
(1,'PL_NONE','None',NULL,1);
/*!40000 ALTER TABLE `llx_c_prospectcontactlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_prospectlevel`
--

DROP TABLE IF EXISTS `llx_c_prospectlevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_prospectlevel` (
  `code` varchar(12) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `sortorder` smallint DEFAULT NULL,
  `active` smallint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_prospectlevel`
--

LOCK TABLES `llx_c_prospectlevel` WRITE;
/*!40000 ALTER TABLE `llx_c_prospectlevel` DISABLE KEYS */;
INSERT INTO `llx_c_prospectlevel` VALUES
(1,'PL_HIGH','High',NULL,4),
(1,'PL_LOW','Low',NULL,2),
(1,'PL_MEDIUM','Medium',NULL,3),
(1,'PL_NONE','None',NULL,1);
/*!40000 ALTER TABLE `llx_c_prospectlevel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_recruitment_origin`
--

DROP TABLE IF EXISTS `llx_c_recruitment_origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_recruitment_origin` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_recruitment_origin`
--

LOCK TABLES `llx_c_recruitment_origin` WRITE;
/*!40000 ALTER TABLE `llx_c_recruitment_origin` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_recruitment_origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_regions`
--

DROP TABLE IF EXISTS `llx_c_regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_regions` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code_region` int NOT NULL,
  `fk_pays` int NOT NULL,
  `cheflieu` varchar(50) DEFAULT NULL,
  `tncc` int DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code_region` (`code_region`),
  KEY `idx_c_regions_fk_pays` (`fk_pays`),
  CONSTRAINT `fk_c_regions_fk_pays` FOREIGN KEY (`fk_pays`) REFERENCES `llx_c_country` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_regions`
--

LOCK TABLES `llx_c_regions` WRITE;
/*!40000 ALTER TABLE `llx_c_regions` DISABLE KEYS */;
INSERT INTO `llx_c_regions` VALUES
(1,'0',0,0,'-',1,0),
(1,'',1301,13,'Algerie',2,0),
(1,'AD',34000,34,'Andorra',3,NULL),
(1,'AO',35001,35,'Angola',4,NULL),
(1,'',2301,23,'Norte',5,0),
(1,'',2302,23,'Litoral',6,0),
(1,'',2303,23,'Cuyana',7,0),
(1,'',2304,23,'Central',8,0),
(1,'',2305,23,'Patagonia',9,0),
(1,'',2801,28,'Australia',10,0),
(1,'',4101,41,'Österreich',11,0),
(1,'',4601,46,'Barbados',12,0),
(1,'',201,2,'Flandre',13,1),
(1,'',202,2,'Wallonie',14,2),
(1,'',203,2,'Bruxelles-Capitale',15,3),
(1,'',5201,52,'Chuquisaca',16,0),
(1,'',5202,52,'La Paz',17,0),
(1,'',5203,52,'Cochabamba',18,0),
(1,'',5204,52,'Oruro',19,0),
(1,'',5205,52,'Potosí',20,0),
(1,'',5206,52,'Tarija',21,0),
(1,'',5207,52,'Santa Cruz',22,0),
(1,'',5208,52,'El Beni',23,0),
(1,'',5209,52,'Pando',24,0),
(1,'',5601,56,'Brasil',25,0),
(1,'',6101,61,'Bubanza',26,0),
(1,'',6102,61,'Bujumbura Mairie',27,0),
(1,'',6103,61,'Bujumbura Rural',28,0),
(1,'',6104,61,'Bururi',29,0),
(1,'',6105,61,'Cankuzo',30,0),
(1,'',6106,61,'Cibitoke',31,0),
(1,'',6107,61,'Gitega',32,0),
(1,'',6108,61,'Karuzi',33,0),
(1,'',6109,61,'Kayanza',34,0),
(1,'',6110,61,'Kirundo',35,0),
(1,'',6111,61,'Makamba',36,0),
(1,'',6112,61,'Muramvya',37,0),
(1,'',6113,61,'Muyinga',38,0),
(1,'',6114,61,'Mwaro',39,0),
(1,'',6115,61,'Ngozi',40,0),
(1,'',6116,61,'Rumonge',41,0),
(1,'',6117,61,'Rutana',42,0),
(1,'',6118,61,'Ruyigi',43,0),
(1,'',1401,14,'Canada',44,0),
(1,NULL,6701,67,'Tarapacá',45,NULL),
(1,NULL,6702,67,'Antofagasta',46,NULL),
(1,NULL,6703,67,'Atacama',47,NULL),
(1,NULL,6704,67,'Coquimbo',48,NULL),
(1,NULL,6705,67,'Valparaíso',49,NULL),
(1,NULL,6706,67,'General Bernardo O Higgins',50,NULL),
(1,NULL,6707,67,'Maule',51,NULL),
(1,NULL,6708,67,'Biobío',52,NULL),
(1,NULL,6709,67,'Raucanía',53,NULL),
(1,NULL,6710,67,'Los Lagos',54,NULL),
(1,NULL,6711,67,'Aysén General Carlos Ibáñez del Campo',55,NULL),
(1,NULL,6712,67,'Magallanes y Antártica Chilena',56,NULL),
(1,NULL,6713,67,'Metropolitana de Santiago',57,NULL),
(1,NULL,6714,67,'Los Ríos',58,NULL),
(1,NULL,6715,67,'Arica y Parinacota',59,NULL),
(1,'京',901,9,'北京市',60,0),
(1,'津',902,9,'天津市',61,0),
(1,'沪',903,9,'上海市',62,0),
(1,'渝',904,9,'重庆市',63,0),
(1,'冀',905,9,'河北省',64,0),
(1,'晋',906,9,'山西省',65,0),
(1,'辽',907,9,'辽宁省',66,0),
(1,'吉',908,9,'吉林省',67,0),
(1,'黑',909,9,'黑龙江省',68,0),
(1,'苏',910,9,'江苏省',69,0),
(1,'浙',911,9,'浙江省',70,0),
(1,'皖',912,9,'安徽省',71,0),
(1,'闽',913,9,'福建省',72,0),
(1,'赣',914,9,'江西省',73,0),
(1,'鲁',915,9,'山东省',74,0),
(1,'豫',916,9,'河南省',75,0),
(1,'鄂',917,9,'湖北省',76,0),
(1,'湘',918,9,'湖南省',77,0),
(1,'粤',919,9,'广东省',78,0),
(1,'琼',920,9,'海南省',79,0),
(1,'川',921,9,'四川省',80,0),
(1,'贵',922,9,'贵州省',81,0),
(1,'云',923,9,'云南省',82,0),
(1,'陕',924,9,'陕西省',83,0),
(1,'甘',925,9,'甘肃省',84,0),
(1,'青',926,9,'青海省',85,0),
(1,'台',927,9,'台湾省',86,0),
(1,'蒙',928,9,'内蒙古自治区',87,0),
(1,'桂',929,9,'广西壮族自治区',88,0),
(1,'藏',930,9,'西藏自治区',89,0),
(1,'宁',931,9,'宁夏回族自治区',90,0),
(1,'新',932,9,'新疆维吾尔自治区',91,0),
(1,'港',933,9,'香港特别行政区',92,0),
(1,'澳',934,9,'澳门特别行政区',93,0),
(1,'',7001,70,'Colombie',94,0),
(1,'',7601,76,'Središnja',95,0),
(1,'',7602,76,'Dalmacija',96,0),
(1,'',7603,76,'Slavonija',97,0),
(1,'',7604,76,'Istra',98,0),
(1,'',8001,80,'Nordjylland',99,0),
(1,'',8002,80,'Midtjylland',100,0),
(1,'',8003,80,'Syddanmark',101,0),
(1,'',8004,80,'Hovedstaden',102,0),
(1,'',8005,80,'Sjælland',103,0),
(1,'97105',1,1,'Guadeloupe',104,3),
(1,'97209',2,1,'Martinique',105,3),
(1,'97302',3,1,'Guyane',106,3),
(1,'97411',4,1,'Réunion',107,3),
(1,'97601',6,1,'Mayotte',108,3),
(1,'75056',11,1,'Île-de-France',109,1),
(1,'45234',24,1,'Centre-Val de Loire',110,2),
(1,'21231',27,1,'Bourgogne-Franche-Comté',111,0),
(1,'76540',28,1,'Normandie',112,0),
(1,'59350',32,1,'Hauts-de-France',113,4),
(1,'67482',44,1,'Grand Est',114,2),
(1,'44109',52,1,'Pays de la Loire',115,4),
(1,'35238',53,1,'Bretagne',116,0),
(1,'33063',75,1,'Nouvelle-Aquitaine',117,0),
(1,'31355',76,1,'Occitanie',118,1),
(1,'69123',84,1,'Auvergne-Rhône-Alpes',119,1),
(1,'13055',93,1,'Provence-Alpes-Côte d\'Azur',120,0),
(1,'2A004',94,1,'Corse',121,0),
(1,'',501,5,'Deutschland',122,0),
(1,NULL,10201,102,'Αττική',123,NULL),
(1,NULL,10202,102,'Στερεά Ελλάδα',124,NULL),
(1,NULL,10203,102,'Κεντρική Μακεδονία',125,NULL),
(1,NULL,10204,102,'Κρήτη',126,NULL),
(1,NULL,10205,102,'Ανατολική Μακεδονία και Θράκη',127,NULL),
(1,NULL,10206,102,'Ήπειρος',128,NULL),
(1,NULL,10207,102,'Ιόνια νησιά',129,NULL),
(1,NULL,10208,102,'Βόρειο Αιγαίο',130,NULL),
(1,NULL,10209,102,'Πελοπόννησος',131,NULL),
(1,NULL,10210,102,'Νότιο Αιγαίο',132,NULL),
(1,NULL,10211,102,'Δυτική Ελλάδα',133,NULL),
(1,NULL,10212,102,'Θεσσαλία',134,NULL),
(1,NULL,10213,102,'Δυτική Μακεδονία',135,NULL),
(1,'',11401,114,'Honduras',136,0),
(1,'HU1',180100,18,'Közép-Magyarország',137,NULL),
(1,'HU21',182100,18,'Közép-Dunántúl',138,NULL),
(1,'HU22',182200,18,'Nyugat-Dunántúl',139,NULL),
(1,'HU23',182300,18,'Dél-Dunántúl',140,NULL),
(1,'HU31',183100,18,'Észak-Magyarország',141,NULL),
(1,'HU32',183200,18,'Észak-Alföld',142,NULL),
(1,'HU33',183300,18,'Dél-Alföld',143,NULL),
(1,'',11701,117,'India',144,0),
(1,'',11801,118,'Indonesia',145,0),
(1,NULL,301,3,'Abruzzo',146,1),
(1,NULL,302,3,'Basilicata',147,1),
(1,NULL,303,3,'Calabria',148,1),
(1,NULL,304,3,'Campania',149,1),
(1,NULL,305,3,'Emilia-Romagna',150,1),
(1,NULL,306,3,'Friuli-Venezia Giulia',151,1),
(1,NULL,307,3,'Lazio',152,1),
(1,NULL,308,3,'Liguria',153,1),
(1,NULL,309,3,'Lombardia',154,1),
(1,NULL,310,3,'Marche',155,1),
(1,NULL,311,3,'Molise',156,1),
(1,NULL,312,3,'Piemonte',157,1),
(1,NULL,313,3,'Puglia',158,1),
(1,NULL,314,3,'Sardegna',159,1),
(1,NULL,315,3,'Sicilia',160,1),
(1,NULL,316,3,'Toscana',161,1),
(1,NULL,317,3,'Trentino-Alto Adige',162,1),
(1,NULL,318,3,'Umbria',163,1),
(1,NULL,319,3,'Valle d Aosta',164,1),
(1,NULL,320,3,'Veneto',165,1),
(1,'',12301,123,'日本',166,0),
(1,'',14001,140,'Diekirch',167,0),
(1,'',14002,140,'Grevenmacher',168,0),
(1,'',14003,140,'Luxembourg',169,0),
(1,'',15201,152,'Rivière Noire',170,0),
(1,'',15202,152,'Flacq',171,0),
(1,'',15203,152,'Grand Port',172,0),
(1,'',15204,152,'Moka',173,0),
(1,'',15205,152,'Pamplemousses',174,0),
(1,'',15206,152,'Plaines Wilhems',175,0),
(1,'',15207,152,'Port-Louis',176,0),
(1,'',15208,152,'Rivière du Rempart',177,0),
(1,'',15209,152,'Savanne',178,0),
(1,'',15210,152,'Rodrigues',179,0),
(1,'',15211,152,'Les îles Agaléga',180,0),
(1,'',15212,152,'Les écueils des Cargados Carajos',181,0),
(1,'',15401,154,'Mexique',182,0),
(1,'',1201,12,'Tanger-Tétouan',183,0),
(1,'',1202,12,'Gharb-Chrarda-Beni Hssen',184,0),
(1,'',1203,12,'Taza-Al Hoceima-Taounate',185,0),
(1,'',1204,12,'L\'Oriental',186,0),
(1,'',1205,12,'Fès-Boulemane',187,0),
(1,'',1206,12,'Meknès-Tafialet',188,0),
(1,'',1207,12,'Rabat-Salé-Zemour-Zaër',189,0),
(1,'',1208,12,'Grand Cassablanca',190,0),
(1,'',1209,12,'Chaouia-Ouardigha',191,0),
(1,'',1210,12,'Doukahla-Adba',192,0),
(1,'',1211,12,'Marrakech-Tensift-Al Haouz',193,0),
(1,'',1212,12,'Tadla-Azilal',194,0),
(1,'',1213,12,'Sous-Massa-Drâa',195,0),
(1,'',1214,12,'Guelmim-Es Smara',196,0),
(1,'',1215,12,'Laâyoune-Boujdour-Sakia el Hamra',197,0),
(1,'',1216,12,'Oued Ed-Dahab Lagouira',198,0),
(1,'',1701,17,'Provincies van Nederland ',199,0),
(1,'',17801,178,'Panama',200,0),
(1,'',18101,181,'Amazonas',201,0),
(1,'',18102,181,'Ancash',202,0),
(1,'',18103,181,'Apurimac',203,0),
(1,'',18104,181,'Arequipa',204,0),
(1,'',18105,181,'Ayacucho',205,0),
(1,'',18106,181,'Cajamarca',206,0),
(1,'',18107,181,'Callao',207,0),
(1,'',18108,181,'Cuzco',208,0),
(1,'',18109,181,'Huancavelica',209,0),
(1,'',18110,181,'Huanuco',210,0),
(1,'',18111,181,'Ica',211,0),
(1,'',18112,181,'Junin',212,0),
(1,'',18113,181,'La Libertad',213,0),
(1,'',18114,181,'Lambayeque',214,0),
(1,'',18115,181,'Lima Metropolitana',215,0),
(1,'',18116,181,'Lima',216,0),
(1,'',18117,181,'Loreto',217,0),
(1,'',18118,181,'Madre de Dios',218,0),
(1,'',18119,181,'Moquegua',219,0),
(1,'',18120,181,'Pasco',220,0),
(1,'',18121,181,'Piura',221,0),
(1,'',18122,181,'Puno',222,0),
(1,'',18123,181,'San Martín',223,0),
(1,'',18124,181,'Tacna',224,0),
(1,'',18125,181,'Tumbes',225,0),
(1,'',18126,181,'Ucayali',226,0),
(1,'PT',15001,25,'Portugal',227,NULL),
(1,'PT9',15002,25,'Azores-Madeira',228,NULL),
(1,'',18801,188,'Romania',229,0),
(1,NULL,8601,86,'Central',230,NULL),
(1,NULL,8602,86,'Oriental',231,NULL),
(1,NULL,8603,86,'Occidental',232,NULL),
(1,'SK01',20101,201,'Bratislava Region',233,NULL),
(1,'SK02',20102,201,'Western Slovakia',234,NULL),
(1,'SK03',20103,201,'Central Slovakia',235,NULL),
(1,'SK04',20104,201,'Eastern Slovakia',236,NULL),
(1,'SI03',20203,202,'East Slovenia',237,NULL),
(1,'SI04',20204,202,'West Slovenia',238,NULL),
(1,'',401,4,'Andalucia',239,0),
(1,'',402,4,'Aragón',240,0),
(1,'',403,4,'Castilla y León',241,0),
(1,'',404,4,'Castilla la Mancha',242,0),
(1,'',405,4,'Canarias',243,0),
(1,'',406,4,'Cataluña',244,0),
(1,'',407,4,'Comunidad de Ceuta',245,0),
(1,'',408,4,'Comunidad Foral de Navarra',246,0),
(1,'',409,4,'Comunidad de Melilla',247,0),
(1,'',410,4,'Cantabria',248,0),
(1,'',411,4,'Comunidad Valenciana',249,0),
(1,'',412,4,'Extemadura',250,0),
(1,'',413,4,'Galicia',251,0),
(1,'',414,4,'Islas Baleares',252,0),
(1,'',415,4,'La Rioja',253,0),
(1,'',416,4,'Comunidad de Madrid',254,0),
(1,'',417,4,'Región de Murcia',255,0),
(1,'',418,4,'Principado de Asturias',256,0),
(1,'',419,4,'Pais Vasco',257,0),
(1,'',420,4,'Otros',258,0),
(1,'',601,6,'Cantons',259,1),
(1,'TW',21301,213,'Taiwan',260,NULL),
(1,'',1001,10,'Ariana',261,0),
(1,'',1002,10,'Béja',262,0),
(1,'',1003,10,'Ben Arous',263,0),
(1,'',1004,10,'Bizerte',264,0),
(1,'',1005,10,'Gabès',265,0),
(1,'',1006,10,'Gafsa',266,0),
(1,'',1007,10,'Jendouba',267,0),
(1,'',1008,10,'Kairouan',268,0),
(1,'',1009,10,'Kasserine',269,0),
(1,'',1010,10,'Kébili',270,0),
(1,'',1011,10,'La Manouba',271,0),
(1,'',1012,10,'Le Kef',272,0),
(1,'',1013,10,'Mahdia',273,0),
(1,'',1014,10,'Médenine',274,0),
(1,'',1015,10,'Monastir',275,0),
(1,'',1016,10,'Nabeul',276,0),
(1,'',1017,10,'Sfax',277,0),
(1,'',1018,10,'Sidi Bouzid',278,0),
(1,'',1019,10,'Siliana',279,0),
(1,'',1020,10,'Sousse',280,0),
(1,'',1021,10,'Tataouine',281,0),
(1,'',1022,10,'Tozeur',282,0),
(1,'',1023,10,'Tunis',283,0),
(1,'',1024,10,'Zaghouan',284,0),
(1,'',22701,227,'United Arab Emirates',285,0),
(1,'',701,7,'England',286,0),
(1,'',702,7,'Wales',287,0),
(1,'',703,7,'Scotland',288,0),
(1,'',704,7,'Northern Ireland',289,0),
(1,'',1101,11,'United-States',290,0),
(1,'',23201,232,'Los Andes',291,0),
(1,'',23202,232,'Capital',292,0),
(1,'',23203,232,'Central',293,0),
(1,'',23204,232,'Cento Occidental',294,0),
(1,'',23205,232,'Guayana',295,0),
(1,'',23206,232,'Insular',296,0),
(1,'',23207,232,'Los Llanos',297,0),
(1,'',23208,232,'Nor-Oriental',298,0),
(1,'',23209,232,'Zuliana',299,0),
(1,'',22101,221,'Marmara',300,0),
(1,'',22102,221,'İç Anadolu',301,0),
(1,'',22103,221,'Ege',302,0),
(1,'',22104,221,'Akdeniz',303,0),
(1,'',22105,221,'Güneydoğu',304,0),
(1,'',22106,221,'Karadeniz',305,0),
(1,'',22107,221,'Doğu Anadolu',306,0);
/*!40000 ALTER TABLE `llx_c_regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_revenuestamp`
--

DROP TABLE IF EXISTS `llx_c_revenuestamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_revenuestamp` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_pays` int NOT NULL,
  `taux` double NOT NULL,
  `revenuestamp_type` varchar(16) NOT NULL DEFAULT 'fixed',
  `note` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=22103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_revenuestamp`
--

LOCK TABLES `llx_c_revenuestamp` WRITE;
/*!40000 ALTER TABLE `llx_c_revenuestamp` DISABLE KEYS */;
INSERT INTO `llx_c_revenuestamp` VALUES
(NULL,NULL,1,10,'Revenue stamp tunisia','fixed',101,0.4),
(NULL,NULL,1,154,'Revenue stamp mexico','percent',1541,1.5),
(NULL,NULL,1,154,'Revenue stamp mexico','percent',1542,3),
(NULL,NULL,1,221,'Mukavelenameler Damga Vergisi','percent',22101,0.00948),
(NULL,NULL,1,221,'Kira mukavelenameleri Damga Vergisi','percent',22102,0.00189);
/*!40000 ALTER TABLE `llx_c_revenuestamp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_shipment_mode`
--

DROP TABLE IF EXISTS `llx_c_shipment_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_shipment_mode` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `code` varchar(30) NOT NULL,
  `libelle` varchar(128) NOT NULL,
  `description` text,
  `tracking` varchar(255) DEFAULT NULL,
  `active` tinyint DEFAULT '0',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_shipment_mode` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_shipment_mode`
--

LOCK TABLES `llx_c_shipment_mode` WRITE;
/*!40000 ALTER TABLE `llx_c_shipment_mode` DISABLE KEYS */;
INSERT INTO `llx_c_shipment_mode` VALUES
(1,'CATCH','In-store collection by the customer',1,'In-Store Collection',NULL,1,'2023-11-27 09:34:20',''),
(1,'TRANS','Generic transport service',1,'Generic transport service',NULL,2,'2023-11-27 09:34:20',''),
(0,'COLSUI','Colissimo Suivi',1,'Colissimo Suivi',NULL,3,'2023-11-27 09:34:20','https://www.laposte.fr/outils/suivre-vos-envois?code={TRACKID}'),
(0,'LETTREMAX','Courrier Suivi et Lettre Max',1,'Lettre Max',NULL,4,'2023-11-27 09:34:20','https://www.laposte.fr/outils/suivre-vos-envois?code={TRACKID}'),
(1,'UPS','United Parcel Service',1,'UPS',NULL,5,'2023-11-27 09:34:20','http://wwwapps.ups.com/etracking/tracking.cgi?InquiryNumber2=&InquiryNumber3=&tracknums_displayed=3&loc=fr_FR&TypeOfInquiryNumber=T&HTMLVersion=4.0&InquiryNumber22=&InquiryNumber32=&track=Track&Suivi.x=64&Suivi.y=7&Suivi=Valider&InquiryNumber1={TRACKID}'),
(0,'KIALA','Relais Kiala',1,'KIALA',NULL,6,'2023-11-27 09:34:20','http://www.kiala.fr/tnt/delivery/{TRACKID}'),
(0,'GLS','General Logistics Systems',1,'GLS',NULL,7,'2023-11-27 09:34:20','https://gls-group.eu/FR/fr/suivi-colis?match={TRACKID}'),
(0,'CHRONO','Chronopost',1,'Chronopost',NULL,8,'2023-11-27 09:34:20','http://www.chronopost.fr/expedier/inputLTNumbersNoJahia.do?listeNumeros={TRACKID}'),
(0,'INPERSON',NULL,1,'In person at your site',NULL,9,'2023-11-27 09:34:20',NULL),
(0,'FEDEX',NULL,1,'Fedex',NULL,10,'2023-11-27 09:34:20','https://www.fedex.com/apps/fedextrack/index.html?tracknumbers={TRACKID}'),
(0,'TNT',NULL,1,'TNT',NULL,11,'2023-11-27 09:34:20','https://www.tnt.com/express/fr_fr/site/outils-expedition/suivi.html?searchType=con&cons=={TRACKID}'),
(0,'DHL',NULL,1,'DHL',NULL,12,'2023-11-27 09:34:20','https://www.dhl.com/fr-fr/home/tracking/tracking-global-forwarding.html?submit=1&tracking-id={TRACKID}'),
(0,'DPD',NULL,1,'DPD',NULL,13,'2023-11-27 09:34:20','https://www.dpd.fr/trace/{TRACKID}'),
(0,'MAINFREIGHT',NULL,1,'Mainfreight',NULL,14,'2023-11-27 09:34:20','https://www.mainfreight.com/track?{TRACKID}');
/*!40000 ALTER TABLE `llx_c_shipment_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_shipment_package_type`
--

DROP TABLE IF EXISTS `llx_c_shipment_package_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_shipment_package_type` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` int NOT NULL DEFAULT '1',
  `entity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_shipment_package_type`
--

LOCK TABLES `llx_c_shipment_package_type` WRITE;
/*!40000 ALTER TABLE `llx_c_shipment_package_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_shipment_package_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_socialnetworks`
--

DROP TABLE IF EXISTS `llx_c_socialnetworks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_socialnetworks` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `code` varchar(100) DEFAULT NULL,
  `label` varchar(150) DEFAULT NULL,
  `url` text,
  `icon` varchar(20) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_c_socialnetworks_code_entity` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_socialnetworks`
--

LOCK TABLES `llx_c_socialnetworks` WRITE;
/*!40000 ALTER TABLE `llx_c_socialnetworks` DISABLE KEYS */;
INSERT INTO `llx_c_socialnetworks` VALUES
(0,'500px',1,'fa-500px','500px',1,'{socialid}'),
(0,'dailymotion',1,'','Dailymotion',2,'{socialid}'),
(0,'diaspora',1,'','Diaspora',3,'{socialid}'),
(0,'discord',1,'fa-discord','Discord',4,'{socialid}'),
(1,'facebook',1,'fa-facebook','Facebook',5,'https://www.facebook.com/{socialid}'),
(0,'flickr',1,'fa-flickr','Flickr',6,'{socialid}'),
(0,'gifycat',1,'','Gificat',7,'{socialid}'),
(0,'giphy',1,'','Giphy',8,'{socialid}'),
(0,'github',1,'','GitHub',9,'https://www.github.com/{socialid}'),
(0,'googleplus',1,'fa-google-plus','GooglePlus',10,'https://www.googleplus.com/{socialid}'),
(1,'instagram',1,'fa-instagram','Instagram',11,'https://www.instagram.com/{socialid}'),
(1,'linkedin',1,'fa-linkedin','LinkedIn',12,'https://www.linkedin.com/{socialid}'),
(0,'mastodon',1,'','Mastodon',13,'{socialid}'),
(0,'meetup',1,'fa-meetup','Meetup',14,'{socialid}'),
(0,'periscope',1,'','Periscope',15,'{socialid}'),
(0,'pinterest',1,'fa-pinterest','Pinterest',16,'{socialid}'),
(0,'quora',1,'','Quora',17,'{socialid}'),
(0,'reddit',1,'fa-reddit','Reddit',18,'{socialid}'),
(0,'slack',1,'fa-slack','Slack',19,'{socialid}'),
(1,'snapchat',1,'fa-snapchat','Snapchat',20,'{socialid}'),
(1,'skype',1,'fa-skype','Skype',21,'https://www.skype.com/{socialid}'),
(0,'tripadvisor',1,'','Tripadvisor',22,'{socialid}'),
(0,'tumblr',1,'fa-tumblr','Tumblr',23,'https://www.tumblr.com/{socialid}'),
(0,'twitch',1,'','Twitch',24,'{socialid}'),
(1,'twitter',1,'fa-twitter','Twitter',25,'https://www.twitter.com/{socialid}'),
(0,'vero',1,'','Vero',26,'https://vero.co/{socialid}'),
(0,'viadeo',1,'fa-viadeo','Viadeo',27,'https://fr.viadeo.com/fr/{socialid}'),
(0,'viber',1,'','Viber',28,'{socialid}'),
(0,'vimeo',1,'fa-vimeo','Vimeo',29,'{socialid}'),
(1,'whatsapp',1,'fa-whatsapp','Whatsapp',30,'{socialid}'),
(0,'wikipedia',1,'fa-wikipedia-w','Wikipedia',31,'{socialid}'),
(0,'xing',1,'fa-xing','Xing',32,'{socialid}'),
(1,'youtube',1,'fa-youtube','Youtube',33,'https://www.youtube.com/{socialid}');
/*!40000 ALTER TABLE `llx_c_socialnetworks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_stcomm`
--

DROP TABLE IF EXISTS `llx_c_stcomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_stcomm` (
  `id` int NOT NULL,
  `code` varchar(24) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `picto` varchar(128) DEFAULT NULL,
  `sortorder` smallint DEFAULT '0',
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_stcomm` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_stcomm`
--

LOCK TABLES `llx_c_stcomm` WRITE;
/*!40000 ALTER TABLE `llx_c_stcomm` DISABLE KEYS */;
INSERT INTO `llx_c_stcomm` VALUES
(1,'ST_NO',-1,'Do not contact',NULL,0),
(1,'ST_NEVER',0,'Never contacted',NULL,0),
(1,'ST_TODO',1,'To contact',NULL,0),
(1,'ST_PEND',2,'Contact in progress',NULL,0),
(1,'ST_DONE',3,'Contacted',NULL,0);
/*!40000 ALTER TABLE `llx_c_stcomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_stcommcontact`
--

DROP TABLE IF EXISTS `llx_c_stcommcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_stcommcontact` (
  `id` int NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `picto` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_stcommcontact` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_stcommcontact`
--

LOCK TABLES `llx_c_stcommcontact` WRITE;
/*!40000 ALTER TABLE `llx_c_stcommcontact` DISABLE KEYS */;
INSERT INTO `llx_c_stcommcontact` VALUES
(1,'ST_NO',-1,'Do not contact',NULL),
(1,'ST_NEVER',0,'Never contacted',NULL),
(1,'ST_TODO',1,'To contact',NULL),
(1,'ST_PEND',2,'Contact in progress',NULL),
(1,'ST_DONE',3,'Contacted',NULL);
/*!40000 ALTER TABLE `llx_c_stcommcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_ticket_category`
--

DROP TABLE IF EXISTS `llx_c_ticket_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_ticket_category` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `public` int DEFAULT '0',
  `use_default` int DEFAULT '1',
  `fk_parent` int NOT NULL DEFAULT '0',
  `force_severity` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `pos` int NOT NULL DEFAULT '0',
  `active` int DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ticket_category`
--

LOCK TABLES `llx_c_ticket_category` WRITE;
/*!40000 ALTER TABLE `llx_c_ticket_category` DISABLE KEYS */;
INSERT INTO `llx_c_ticket_category` VALUES
(1,'OTHER',NULL,1,0,NULL,'Other',10,0,1,1);
/*!40000 ALTER TABLE `llx_c_ticket_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_ticket_resolution`
--

DROP TABLE IF EXISTS `llx_c_ticket_resolution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_ticket_resolution` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int DEFAULT '1',
  `use_default` int DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ticket_resolution`
--

LOCK TABLES `llx_c_ticket_resolution` WRITE;
/*!40000 ALTER TABLE `llx_c_ticket_resolution` DISABLE KEYS */;
INSERT INTO `llx_c_ticket_resolution` VALUES
(1,'SOLVED',NULL,1,'Solved','10',1,0),
(1,'CANCELED',NULL,1,'Canceled','50',2,0),
(1,'OTHER',NULL,1,'Other','90',3,0);
/*!40000 ALTER TABLE `llx_c_ticket_resolution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_ticket_severity`
--

DROP TABLE IF EXISTS `llx_c_ticket_severity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_ticket_severity` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `active` int DEFAULT '1',
  `use_default` int DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ticket_severity`
--

LOCK TABLES `llx_c_ticket_severity` WRITE;
/*!40000 ALTER TABLE `llx_c_ticket_severity` DISABLE KEYS */;
INSERT INTO `llx_c_ticket_severity` VALUES
(1,'LOW','',NULL,1,'Low','10',1,0),
(1,'NORMAL','',NULL,1,'Normal','20',2,1),
(1,'HIGH','',NULL,1,'High','30',3,0),
(1,'BLOCKING','',NULL,1,'Critical / blocking','40',4,0);
/*!40000 ALTER TABLE `llx_c_ticket_severity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_ticket_type`
--

DROP TABLE IF EXISTS `llx_c_ticket_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_ticket_type` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int DEFAULT '1',
  `use_default` int DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ticket_type`
--

LOCK TABLES `llx_c_ticket_type` WRITE;
/*!40000 ALTER TABLE `llx_c_ticket_type` DISABLE KEYS */;
INSERT INTO `llx_c_ticket_type` VALUES
(1,'COM',NULL,1,'Commercial question','10',1,0),
(1,'HELP',NULL,1,'Request for functionnal help','15',2,0),
(1,'ISSUE',NULL,1,'Issue or bug','20',3,0),
(0,'PROBLEM',NULL,1,'Problem','22',4,0),
(1,'REQUEST',NULL,1,'Change or enhancement request','25',5,0),
(0,'PROJECT',NULL,1,'Project','30',6,0),
(1,'OTHER',NULL,1,'Other','40',7,1);
/*!40000 ALTER TABLE `llx_c_ticket_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_transport_mode`
--

DROP TABLE IF EXISTS `llx_c_transport_mode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_transport_mode` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `code` varchar(3) NOT NULL,
  `label` varchar(255) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_transport_mode` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_transport_mode`
--

LOCK TABLES `llx_c_transport_mode` WRITE;
/*!40000 ALTER TABLE `llx_c_transport_mode` DISABLE KEYS */;
INSERT INTO `llx_c_transport_mode` VALUES
(1,'MAR',1,'Transport maritime (y compris camions ou wagons sur bateau)',1),
(1,'TRA',1,'Transport par chemin de fer (y compris camions sur wagon)',2),
(1,'ROU',1,'Transport par route',3),
(1,'AIR',1,'Transport par air',4),
(1,'POS',1,'Envois postaux',5),
(1,'OLE',1,'Installations de transport fixe (oléoduc)',6),
(1,'NAV',1,'Transport par navigation intérieure',7),
(1,'PRO',1,'Propulsion propre',8);
/*!40000 ALTER TABLE `llx_c_transport_mode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_tva`
--

DROP TABLE IF EXISTS `llx_c_tva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_tva` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_pays` int NOT NULL,
  `code` varchar(10) DEFAULT '',
  `taux` double NOT NULL,
  `localtax1` varchar(20) NOT NULL DEFAULT '0',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2` varchar(20) NOT NULL DEFAULT '0',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `use_default` tinyint DEFAULT '0',
  `recuperableonly` int NOT NULL DEFAULT '0',
  `note` varchar(128) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_tva_id` (`fk_pays`,`code`,`taux`,`recuperableonly`)
) ENGINE=InnoDB AUTO_INCREMENT=22105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_tva`
--

LOCK TABLES `llx_c_tva` WRITE;
/*!40000 ALTER TABLE `llx_c_tva` DISABLE KEYS */;
INSERT INTO `llx_c_tva` VALUES
(NULL,NULL,1,'',1,'0','0','0','0','VAT rate 0 ou non applicable',0,11,0,0),
(NULL,NULL,1,'',1,'0','0','0','0','VAT rate - standard (France hors DOM-TOM)',0,12,20,0),
(NULL,NULL,1,'',1,'0','0','0','0','VAT rate - reduced',0,13,10,0),
(NULL,NULL,1,'',1,'0','0','0','0','VAT rate - reduced (France hors DOM-TOM)',0,14,5.5,0),
(NULL,NULL,1,'',1,'0','0','0','0','VAT rate - super-reduced',0,15,2.1,0),
(NULL,NULL,0,'85',1,'0','0','0','0','VAT rate - standard (DOM sauf Guyane et Saint-Martin)',0,16,8.5,0),
(NULL,NULL,0,'85NPR',1,'0','0','0','0','VAT rate - standard (DOM sauf Guyane et Saint-Martin), non perçu par le vendeur mais récupérable par acheteur',1,17,8.5,0),
(NULL,NULL,0,'85NPROM',1,'2','3','0','0','VAT rate - standard (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer',1,18,8.5,0),
(NULL,NULL,0,'85NPROMOMR',1,'2','3','2.5','3','VAT rate - standard (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer et Octroi de Mer Regional',1,19,8.5,0),
(NULL,NULL,1,'',2,'0','0','0','0','VAT rate 0 ou non applicable',0,21,0,0),
(NULL,NULL,1,'',2,'0','0','0','0','VAT rate - reduced',0,22,6,0),
(NULL,NULL,1,'',2,'0','0','0','0','VAT rate - standard',0,23,21,0),
(NULL,NULL,1,'',2,'0','0','0','0','VAT rate - reduced',0,24,12,0),
(NULL,NULL,1,'',3,'0','0','0','0','VAT rate 0',0,31,0,0),
(NULL,NULL,1,'',3,'0','0','0','0','VAT rate - reduced',0,32,10,0),
(NULL,NULL,1,'',3,'0','0','0','0','VAT rate - super-reduced',0,33,4,0),
(NULL,NULL,1,'',3,'0','0','0','0','VAT rate - standard',0,34,22,0),
(NULL,NULL,1,'',4,'0','3','-19:-15:-9','5','VAT rate 0',0,41,0,0),
(NULL,NULL,1,'',4,'1.4','3','-19:-15:-9','5','VAT rate - reduced',0,42,10,0),
(NULL,NULL,1,'',4,'0.5','3','-19:-15:-9','5','VAT rate - super-reduced',0,43,4,0),
(NULL,NULL,1,'',4,'5.2','3','-19:-15:-9','5','VAT rate - standard',0,44,21,0),
(NULL,NULL,1,'',5,'0','0','0','0','No VAT',0,51,0,0),
(NULL,NULL,1,'',5,'0','0','0','0','ermäßigte USt.',0,52,7,0),
(NULL,NULL,0,'',5,'0','0','0','0','USt. Forst',0,54,5.5,0),
(NULL,NULL,0,'',5,'0','0','0','0','USt. Landwirtschaft',0,55,10.7,0),
(NULL,NULL,1,'',5,'0','0','0','0','allgemeine Ust.',0,56,19,0),
(NULL,NULL,1,'',6,'0','0','0','0','VAT rate 0',0,61,0,0),
(NULL,NULL,1,'',6,'0','0','0','0','VAT rate - reduced',0,62,3.7,0),
(NULL,NULL,1,'',6,'0','0','0','0','VAT rate - super-reduced',0,63,2.5,0),
(NULL,NULL,1,'',6,'0','0','0','0','VAT rate - standard',0,64,7.7,0),
(NULL,NULL,1,'',7,'0','0','0','0','VAT rate 0',0,71,0,0),
(NULL,NULL,1,'',7,'0','0','0','0','VAT rate - standard before 2011',0,72,17.5,0),
(NULL,NULL,1,'',7,'0','0','0','0','VAT rate - reduced',0,73,5,0),
(NULL,NULL,1,'',7,'0','0','0','0','VAT rate - standard',0,74,20,0),
(NULL,NULL,1,'',8,'0','0','0','0','VAT rate 0',0,81,0,0),
(NULL,NULL,1,'',8,'0','0','0','0','VAT rate - standard',0,82,23,0),
(NULL,NULL,1,'',8,'0','0','0','0','VAT rate - reduced',0,83,13.5,0),
(NULL,NULL,1,'',8,'0','0','0','0','VAT rate - reduced',0,84,9,0),
(NULL,NULL,1,'',8,'0','0','0','0','VAT rate - reduced',0,85,4.8,0),
(NULL,NULL,1,'',9,'0','0','0','0','VAT rate 0',0,91,0,0),
(NULL,NULL,1,'',9,'0','0','0','0','VAT rate - reduced 0',0,92,13,0),
(NULL,NULL,1,'',9,'0','0','0','0','VAT rate -  super-reduced 0',0,93,3,0),
(NULL,NULL,1,'',9,'0','0','0','0','VAT rate - standard',0,94,17,0),
(NULL,NULL,1,'',10,'0','0','0','0','VAT rate 0',0,101,0,0),
(NULL,NULL,1,'',10,'0','0','0','0','VAT 12%',0,102,12,0),
(NULL,NULL,1,'',10,'0','0','0','0','VAT 18%',0,103,18,0),
(NULL,NULL,1,'',10,'0','0','0','0','VAT 6% Majoré à 25% (7.5%)',0,104,7.5,0),
(NULL,NULL,1,'',10,'0','0','0','0','VAT 12% Majoré à 25% (15%)',0,105,15,0),
(NULL,NULL,1,'',10,'0','0','0','0','VAT 18% Majoré à 25% (22.5%)',0,106,22.5,0),
(NULL,NULL,1,'',10,'0','0','0','0','VAT 6%',0,107,6,0),
(NULL,NULL,1,'',10,'1','4','0','0','VAT 18%+FODEC',0,108,18.18,0),
(NULL,NULL,1,'',11,'0','0','0','0','No Sales Tax',0,111,0,0),
(NULL,NULL,1,'',11,'0','0','0','0','Sales Tax 4%',0,112,4,0),
(NULL,NULL,1,'',11,'0','0','0','0','Sales Tax 6%',0,113,6,0),
(NULL,NULL,1,'',12,'0','0','0','0','VAT rate 0',0,121,0,0),
(NULL,NULL,1,'',12,'0','0','0','0','VAT rate - reduced',0,122,14,0),
(NULL,NULL,1,'',12,'0','0','0','0','VAT rate - reduced',0,123,10,0),
(NULL,NULL,1,'',12,'0','0','0','0','VAT rate - super-reduced',0,124,7,0),
(NULL,NULL,1,'',12,'0','0','0','0','VAT rate - standard',0,125,20,0),
(NULL,NULL,1,'',13,'0','0','0','0','TVA 0%',0,131,0,0),
(NULL,NULL,1,'',13,'0','0','0','0','TVA 9%',0,132,9,0),
(NULL,NULL,1,'',13,'0','0','0','0','TVA 19%',0,133,19,0),
(NULL,NULL,1,'',14,'0','0','0','0','VAT rate 0',0,141,0,0),
(NULL,NULL,1,'',14,'0','0','0','0','VAT rate - standard',0,142,7,0),
(NULL,NULL,1,'',14,'9.975','1','0','0','GST/TPS and PST/TVQ rate for Province',0,143,5,0),
(NULL,NULL,1,'',17,'0','0','0','0','0 BTW tarief',0,171,0,0),
(NULL,NULL,1,'',17,'0','0','0','0','Verlaagd BTW tarief',0,172,6,0),
(NULL,NULL,1,'',17,'0','0','0','0','Algemeen BTW tarief',0,173,19,0),
(NULL,NULL,0,'',17,'0','0','0','0','Algemeen BTW tarief (vanaf 1 oktober 2012)',0,174,21,0),
(NULL,NULL,1,'',20,'0','0','0','0','VAT rate 0',0,201,0,0),
(NULL,NULL,1,'',20,'0','0','0','0','VAT rate - reduced',0,202,12,0),
(NULL,NULL,1,'',20,'0','0','0','0','VAT rate - super-reduced',0,203,6,0),
(NULL,NULL,1,'',20,'0','0','0','0','VAT rate - standard',0,204,25,0),
(NULL,NULL,1,'',21,'0','0','0','0','IVA Rate 0',0,211,0,0),
(NULL,NULL,1,'',21,'7.5','2','0','0','IVA standard rate',0,212,18,0),
(NULL,NULL,1,'',22,'0','0','0','0','VAT rate 0',0,221,0,0),
(NULL,NULL,1,'',22,'0','0','0','0','VAT rate - reduced',0,222,10,0),
(NULL,NULL,1,'',22,'0','0','0','0','VAT rate - standard',0,223,18,0),
(NULL,NULL,1,'',23,'0','0','0','0','IVA Rate 0',0,231,0,0),
(NULL,NULL,1,'',23,'0','0','0','0','IVA reduced rate',0,232,10.5,0),
(NULL,NULL,1,'',23,'0','0','0','0','IVA standard rate',0,233,21,0),
(NULL,NULL,1,'',24,'0','0','0','0','VAT rate 0',0,241,0,0),
(NULL,NULL,1,'',24,'0','0','0','0','VAT rate - standard',0,242,19.25,0),
(NULL,NULL,1,'',25,'0','0','0','0','VAT rate 0',0,251,0,0),
(NULL,NULL,1,'',25,'0','0','0','0','VAT rate - reduced',0,252,13,0),
(NULL,NULL,1,'',25,'0','0','0','0','VAT rate - standard',0,253,23,0),
(NULL,NULL,1,'',25,'0','0','0','0','VAT rate - reduced',0,254,6,0),
(NULL,NULL,1,'',26,'0','0','0','0','VAT rate 0',0,261,0,0),
(NULL,NULL,1,'',26,'0','0','0','0','VAT rate 5',0,262,5,0),
(NULL,NULL,1,'',27,'0','0','0','0','VAT rate 0 ou non applicable',0,271,0,0),
(NULL,NULL,0,'',27,'0','0','0','0','VAT rate - standard (DOM sauf Guyane et Saint-Martin)',0,272,8.5,0),
(NULL,NULL,0,'',27,'0','0','0','0','VAT rate - standard (DOM sauf Guyane et Saint-Martin), non perçu par le vendeur mais récupérable par acheteur',1,273,8.5,0),
(NULL,NULL,0,'',27,'0','0','0','0','VAT rate - reduced (France hors DOM-TOM)',0,274,5.5,0),
(NULL,NULL,1,'',27,'0','0','0','0','VAT rate - standard (France hors DOM-TOM)',0,275,19.6,0),
(NULL,NULL,1,'',27,'0','0','0','0','VAT rate - super-reduced',0,276,2.1,0),
(NULL,NULL,1,'',27,'0','0','0','0','VAT rate - reduced',0,277,7,0),
(NULL,NULL,1,'',28,'0','0','0','0','VAT rate 0',0,281,0,0),
(NULL,NULL,1,'',28,'0','0','0','0','VAT rate - standard',0,282,10,0),
(NULL,NULL,1,'',35,'0','0','0','0','VAT rate 0',0,351,0,0),
(NULL,NULL,1,'',35,'0','0','0','0','VAT rate - reduced',0,352,7,0),
(NULL,NULL,1,'',35,'0','0','0','0','VAT rate - standard',0,353,14,0),
(NULL,NULL,1,'',41,'0','0','0','0','VAT rate 0',0,411,0,0),
(NULL,NULL,1,'',41,'0','0','0','0','VAT rate - reduced',0,412,10,0),
(NULL,NULL,1,'',41,'0','0','0','0','VAT rate - standard',0,413,20,0),
(NULL,NULL,1,'',46,'0','0','0','0','No VAT',0,461,0,0),
(NULL,NULL,1,'',46,'0','0','0','0','VAT 15%',0,462,15,0),
(NULL,NULL,1,'',46,'0','0','0','0','VAT 7.5%',0,463,7.5,0),
(NULL,NULL,1,'',56,'0','0','0','0','VAT rate - reduced',0,561,0,0),
(NULL,NULL,1,'',59,'0','0','0','0','VAT rate 0',0,591,0,0),
(NULL,NULL,1,'',59,'0','0','0','0','VAT rate - reduced',0,592,7,0),
(NULL,NULL,1,'',59,'0','0','0','0','VAT rate - standard',0,593,20,0),
(NULL,NULL,1,'',67,'0','0','0','0','VAT rate 0',0,671,0,0),
(NULL,NULL,1,'',67,'0','0','0','0','VAT rate - standard',0,672,19,0),
(NULL,NULL,1,'',72,'0','0','0','0','VAT rate 0',0,721,0,0),
(NULL,NULL,1,'',72,'0.9','1','0','0','VAT rate 18+0.9',0,722,18,0),
(NULL,NULL,1,'',76,'0','0','0','0','PDV 25%',0,761,25,0),
(NULL,NULL,1,'',76,'0','0','0','0','PDV 13%',0,762,13,0),
(NULL,NULL,1,'',76,'0','0','0','0','PDV 5%',0,763,5,0),
(NULL,NULL,1,'',76,'0','0','0','0','PDV 0%',0,764,0,0),
(NULL,NULL,1,'',78,'0','0','0','0','VAT rate 0',0,781,0,0),
(NULL,NULL,1,'',78,'0','0','0','0','VAT rate 9',0,782,9,0),
(NULL,NULL,1,'',78,'0','0','0','0','VAT rate 5',0,783,5,0),
(NULL,NULL,1,'',78,'0','0','0','0','VAT rate - standard',0,784,19,0),
(NULL,NULL,1,'',80,'0','0','0','0','VAT rate 0',0,801,0,0),
(NULL,NULL,1,'',80,'0','0','0','0','VAT rate - standard',0,802,25,0),
(NULL,NULL,1,'',86,'0','0','0','0','SIN IVA',0,861,0,0),
(NULL,NULL,1,'',86,'0','0','0','0','IVA 13',0,862,13,0),
(NULL,NULL,1,'',102,'0','0','0','0','Μηδενικό Φ.Π.Α.',0,1021,0,0),
(NULL,NULL,1,'',102,'0','0','0','0','Κανονικός Φ.Π.Α.',0,1022,24,0),
(NULL,NULL,1,'',102,'0','0','0','0','Μειωμένος Φ.Π.Α.',0,1023,13,0),
(NULL,NULL,1,'',102,'0','0','0','0','Υπερμειωμένος Φ.Π.Α.',0,1024,6,0),
(NULL,NULL,1,'',102,'0','0','0','0','Νήσων κανονικός Φ.Π.Α.',0,1025,16,0),
(NULL,NULL,1,'',102,'0','0','0','0','Νήσων μειωμένος Φ.Π.Α.',0,1026,9,0),
(NULL,NULL,1,'',102,'0','0','0','0','Νήσων υπερμειωμένος Φ.Π.Α.',0,1027,4,0),
(NULL,NULL,1,'',102,'0','0','0','0','Νήσων υπερμειωμένος Φ.Π.Α.',0,1028,17,0),
(NULL,NULL,1,'',114,'0','0','0','0','No ISV',0,1141,0,0),
(NULL,NULL,1,'',114,'0','0','0','0','ISV 12%',0,1142,12,0),
(NULL,NULL,1,'',116,'0','0','0','0','VAT rate 0',0,1161,0,0),
(NULL,NULL,1,'',116,'0','0','0','0','VAT rate - reduced',0,1162,7,0),
(NULL,NULL,1,'',116,'0','0','0','0','VAT rate - standard',0,1163,25.5,0),
(NULL,NULL,0,'',117,'0','0','0','0','VAT rate 0',0,1171,0,0),
(NULL,NULL,1,'C+S-5',117,'2.5','1','2.5','1','CGST+SGST - Same state sales',0,1172,0,0),
(NULL,NULL,1,'I-5',117,'0','0','0','0','IGST',0,1173,5,0),
(NULL,NULL,1,'C+S-12',117,'6','1','6','1','CGST+SGST - Same state sales',0,1174,0,0),
(NULL,NULL,1,'I-12',117,'0','0','0','0','IGST',0,1175,12,0),
(NULL,NULL,1,'C+S-18',117,'9','1','9','1','CGST+SGST - Same state sales',0,1176,0,0),
(NULL,NULL,1,'I-18',117,'0','0','0','0','IGST',0,1177,18,0),
(NULL,NULL,1,'C+S-28',117,'14','1','14','1','CGST+SGST - Same state sales',0,1178,0,0),
(NULL,NULL,1,'I-28',117,'0','0','0','0','IGST',0,1179,28,0),
(NULL,NULL,1,'',123,'0','0','0','0','VAT rate 0',0,1231,0,0),
(NULL,NULL,1,'',123,'0','0','0','0','VAT rate 5',0,1232,5,0),
(NULL,NULL,1,'',140,'0','0','0','0','VAT rate 0',0,1401,0,0),
(NULL,NULL,1,'',140,'0','0','0','0','VAT rate - intermediary',0,1402,14,0),
(NULL,NULL,1,'',140,'0','0','0','0','VAT rate - reduced',0,1403,8,0),
(NULL,NULL,1,'',140,'0','0','0','0','VAT rate - super-reduced',0,1404,3,0),
(NULL,NULL,1,'',140,'0','0','0','0','VAT rate - standard',0,1405,16,0),
(NULL,NULL,1,'',147,'0','0','0','0','VAT rate 0',0,1471,0,0),
(NULL,NULL,1,'',147,'0','0','0','0','VAT rate - standard',0,1472,18,0),
(NULL,NULL,1,'',148,'0','0','0','0','VAT rate 0',0,1481,0,0),
(NULL,NULL,1,'',148,'0','0','0','0','VAT rate - reduced',0,1482,7,0),
(NULL,NULL,1,'',148,'0','0','0','0','VAT rate - super-reduced',0,1483,5,0),
(NULL,NULL,1,'',148,'0','0','0','0','VAT rate - standard',0,1484,18,0),
(NULL,NULL,1,'',151,'0','0','0','0','VAT rate 0',0,1511,0,0),
(NULL,NULL,1,'',151,'0','0','0','0','VAT rate 14',0,1512,14,0),
(NULL,NULL,1,'',152,'0','0','0','0','VAT rate 0',0,1521,0,0),
(NULL,NULL,1,'',152,'0','0','0','0','VAT rate 15',0,1522,15,0),
(NULL,NULL,1,'',154,'0','0','0','0','No VAT',0,1541,0,0),
(NULL,NULL,1,'',154,'0','0','0','0','VAT 16%',0,1542,16,0),
(NULL,NULL,1,'',154,'0','0','0','0','VAT Frontero',0,1543,10,0),
(NULL,NULL,1,'',165,'0','0','0','0','VAT rate 0',0,1651,0,0),
(NULL,NULL,1,'',165,'0','0','0','0','VAT standard 3',0,1652,3,0),
(NULL,NULL,1,'',165,'0','0','0','0','VAT standard 6',0,1653,6,0),
(NULL,NULL,1,'',165,'0','0','0','0','VAT rate - standard',0,1654,11,0),
(NULL,NULL,1,'',165,'0','0','0','0','VAT standard high',0,1655,22,0),
(NULL,NULL,1,'',166,'0','0','0','0','VAT rate 0',0,1661,0,0),
(NULL,NULL,1,'',166,'0','0','0','0','VAT rate - standard',0,1662,15,0),
(NULL,NULL,1,'',169,'0','0','0','0','VAT rate 0',0,1691,0,0),
(NULL,NULL,1,'',169,'0','0','0','0','VAT rate - standard',0,1692,5,0),
(NULL,NULL,1,'',173,'0','0','0','0','VAT rate 0',0,1731,0,0),
(NULL,NULL,1,'',173,'0','0','0','0','VAT rate - reduced',0,1732,14,0),
(NULL,NULL,1,'',173,'0','0','0','0','VAT rate - reduced',0,1733,8,0),
(NULL,NULL,1,'',173,'0','0','0','0','VAT rate - standard',0,1734,25,0),
(NULL,NULL,1,'',178,'0','0','0','0','ITBMS Rate 0',0,1781,0,0),
(NULL,NULL,1,'',178,'0','0','0','0','ITBMS standard rate',0,1782,7,0),
(NULL,NULL,1,'',181,'0','0','0','0','VAT rate 0',0,1811,0,0),
(NULL,NULL,1,'',181,'0','0','0','0','VAT rate - standard',0,1818,18,0),
(NULL,NULL,1,'',184,'0','0','0','0','VAT rate 0',0,1841,0,0),
(NULL,NULL,1,'',184,'0','0','0','0','VAT rate - reduced',0,1842,8,0),
(NULL,NULL,1,'',184,'0','0','0','0','VAT rate - reduced',0,1843,3,0),
(NULL,NULL,1,'',184,'0','0','0','0','VAT rate - standard',0,1844,23,0),
(NULL,NULL,1,'',188,'0','0','0','0','VAT rate 0',0,1881,0,0),
(NULL,NULL,1,'',188,'0','0','0','0','VAT rate - reduced',0,1882,9,0),
(NULL,NULL,1,'',188,'0','0','0','0','VAT rate - standard',0,1883,19,0),
(NULL,NULL,1,'',188,'0','0','0','0','VAT rate - reduced',0,1884,5,0),
(NULL,NULL,1,'',193,'0','0','0','0','No VAT in SPM',0,1931,0,0),
(NULL,NULL,1,'',201,'0','0','0','0','VAT rate 0',0,2011,0,0),
(NULL,NULL,1,'',201,'0','0','0','0','VAT rate - reduced',0,2012,10,0),
(NULL,NULL,1,'',201,'0','0','0','0','VAT rate - standard',0,2013,20,0),
(NULL,NULL,1,'',202,'0','0','0','0','VAT rate 0',0,2021,0,0),
(NULL,NULL,1,'',202,'0','0','0','0','VAT rate - reduced',0,2022,9.5,0),
(NULL,NULL,1,'',202,'0','0','0','0','VAT rate - standard',0,2023,22,0),
(NULL,NULL,1,'',205,'0','0','0','0','VAT rate 0',0,2051,0,0),
(NULL,NULL,1,'',205,'0','0','0','0','VAT rate - standard',0,2052,15,0),
(NULL,NULL,1,'',207,'0','0','0','0','VAT 0',0,2071,0,0),
(NULL,NULL,1,'',207,'0','0','0','0','VAT 15%',0,2072,15,0),
(NULL,NULL,1,'',213,'0','0','0','0','VAT 0',0,2131,0,0),
(NULL,NULL,1,'',213,'0','0','0','0','VAT 5%',0,2132,5,0),
(NULL,NULL,1,'',226,'0','0','0','0','VAT rate 0',0,2261,0,0),
(NULL,NULL,1,'',226,'0','0','0','0','VAT standart rate',0,2262,20,0),
(NULL,NULL,1,'',232,'0','0','0','0','No VAT',0,2321,0,0),
(NULL,NULL,1,'',232,'0','0','0','0','VAT 12%',0,2322,12,0),
(NULL,NULL,1,'',232,'0','0','0','0','VAT 8%',0,2323,8,0),
(NULL,NULL,1,'',233,'0','0','0','0','Thuế GTGT đươc khấu trừ 0%',0,2331,0,0),
(NULL,NULL,1,'',233,'0','0','0','0','Thuế GTGT đươc khấu trừ 5%',0,2332,5,0),
(NULL,NULL,1,'',233,'0','0','0','0','Thuế GTGT đươc khấu trừ 8%',0,2333,8,0),
(NULL,NULL,1,'',233,'0','0','0','0','Thuế GTGT đươc khấu trừ 10%',0,2334,10,0),
(NULL,NULL,1,'',61,'0','0','0','0','No VAT',0,2335,0,0),
(NULL,NULL,1,'',61,'0','0','0','0','VAT 10%',0,2336,10,0),
(NULL,NULL,1,'',61,'0','0','0','0','VAT 18%',0,2337,18,0),
(NULL,NULL,1,'',246,'0','0','0','0','VAT rate 0',0,2461,0,0),
(NULL,NULL,1,'',221,'0','0','0','0','No VAT',0,22101,0,0),
(NULL,NULL,1,'',221,'0','0','0','0','VAT 1%',0,22102,1,0),
(NULL,NULL,1,'',221,'0','0','0','0','VAT 8%',0,22103,8,0),
(NULL,NULL,1,'',221,'0','0','0','0','VAT 18%',0,22104,18,0);
/*!40000 ALTER TABLE `llx_c_tva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_type_contact`
--

DROP TABLE IF EXISTS `llx_c_type_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_type_contact` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `element` varchar(30) NOT NULL,
  `source` varchar(8) NOT NULL DEFAULT 'external',
  `code` varchar(32) NOT NULL,
  `libelle` varchar(128) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_contact_id` (`element`,`source`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_type_contact`
--

LOCK TABLES `llx_c_type_contact` WRITE;
/*!40000 ALTER TABLE `llx_c_type_contact` DISABLE KEYS */;
INSERT INTO `llx_c_type_contact` VALUES
(1,'SALESREPSIGN','contrat','Commercial signataire du contrat',NULL,0,1,'internal'),
(1,'SALESREPFOLL','contrat','Commercial suivi du contrat',NULL,0,2,'internal'),
(1,'BILLING','contrat','Contact client facturation contrat',NULL,0,3,'external'),
(1,'CUSTOMER','contrat','Contact client suivi contrat',NULL,0,4,'external'),
(1,'SALESREPSIGN','contrat','Contact client signataire contrat',NULL,0,5,'external'),
(1,'SALESREPFOLL','propal','Commercial à l\'origine de la propale',NULL,0,6,'internal'),
(1,'BILLING','propal','Contact client facturation propale',NULL,0,7,'external'),
(1,'CUSTOMER','propal','Contact client suivi propale',NULL,0,8,'external'),
(1,'SHIPPING','propal','Contact client livraison propale',NULL,0,9,'external'),
(1,'SALESREPFOLL','facture','Responsable suivi du paiement',NULL,0,10,'internal'),
(1,'BILLING','facture','Contact client facturation',NULL,0,11,'external'),
(1,'SHIPPING','facture','Contact client livraison',NULL,0,12,'external'),
(1,'SERVICE','facture','Contact client prestation',NULL,0,13,'external'),
(1,'SALESREPFOLL','invoice_supplier','Responsable suivi du paiement',NULL,0,14,'internal'),
(1,'BILLING','invoice_supplier','Contact fournisseur facturation',NULL,0,15,'external'),
(1,'SHIPPING','invoice_supplier','Contact fournisseur livraison',NULL,0,16,'external'),
(1,'SERVICE','invoice_supplier','Contact fournisseur prestation',NULL,0,17,'external'),
(1,'ACTOR','agenda','Responsable',NULL,0,18,'internal'),
(1,'GUEST','agenda','Guest',NULL,0,19,'internal'),
(1,'ACTOR','agenda','Responsable',NULL,0,20,'external'),
(1,'GUEST','agenda','Guest',NULL,0,21,'external'),
(1,'SALESREPFOLL','commande','Responsable suivi de la commande',NULL,0,22,'internal'),
(1,'BILLING','commande','Contact client facturation commande',NULL,0,23,'external'),
(1,'CUSTOMER','commande','Contact client suivi commande',NULL,0,24,'external'),
(1,'SHIPPING','commande','Contact client livraison commande',NULL,0,25,'external'),
(1,'INTERREPFOLL','fichinter','Responsable suivi de l\'intervention',NULL,0,26,'internal'),
(1,'INTERVENING','fichinter','Intervenant',NULL,0,27,'internal'),
(1,'BILLING','fichinter','Contact client facturation intervention',NULL,0,28,'external'),
(1,'CUSTOMER','fichinter','Contact client suivi de l\'intervention',NULL,0,29,'external'),
(1,'SALESREPFOLL','order_supplier','Responsable suivi de la commande',NULL,0,30,'internal'),
(1,'SHIPPING','order_supplier','Responsable réception de la commande',NULL,0,31,'internal'),
(1,'BILLING','order_supplier','Contact fournisseur facturation commande',NULL,0,32,'external'),
(1,'CUSTOMER','order_supplier','Contact fournisseur suivi commande',NULL,0,33,'external'),
(1,'SHIPPING','order_supplier','Contact fournisseur livraison commande',NULL,0,34,'external'),
(1,'USERINCHARGE','dolresource','In charge of resource',NULL,0,35,'internal'),
(1,'THIRDINCHARGE','dolresource','In charge of resource',NULL,0,36,'external'),
(1,'SUPPORTTEC','ticket','Utilisateur contact support',NULL,0,37,'internal'),
(1,'CONTRIBUTOR','ticket','Intervenant',NULL,0,38,'internal'),
(1,'SUPPORTCLI','ticket','Contact client suivi incident',NULL,0,39,'external'),
(1,'CONTRIBUTOR','ticket','Intervenant',NULL,0,40,'external'),
(1,'PROJECTLEADER','project','Chef de Projet',NULL,0,41,'internal'),
(1,'PROJECTCONTRIBUTOR','project','Intervenant',NULL,0,42,'internal'),
(1,'PROJECTLEADER','project','Chef de Projet',NULL,0,43,'external'),
(1,'PROJECTCONTRIBUTOR','project','Intervenant',NULL,0,44,'external'),
(1,'TASKEXECUTIVE','project_task','Responsable',NULL,0,45,'internal'),
(1,'TASKCONTRIBUTOR','project_task','Intervenant',NULL,0,46,'internal'),
(1,'TASKEXECUTIVE','project_task','Responsable',NULL,0,47,'external'),
(1,'TASKCONTRIBUTOR','project_task','Intervenant',NULL,0,48,'external'),
(1,'SALESREPFOLL','supplier_proposal','Responsable suivi de la demande',NULL,0,49,'internal'),
(1,'BILLING','supplier_proposal','Contact fournisseur facturation',NULL,0,50,'external'),
(1,'SHIPPING','supplier_proposal','Contact fournisseur livraison',NULL,0,51,'external'),
(1,'SERVICE','supplier_proposal','Contact fournisseur prestation',NULL,0,52,'external'),
(1,'MANAGER','conferenceorbooth','Conference or Booth manager',NULL,0,53,'internal'),
(1,'SPEAKER','conferenceorbooth','Conference Speaker',NULL,0,54,'external'),
(1,'RESPONSIBLE','conferenceorbooth','Booth responsible',NULL,0,55,'external');
/*!40000 ALTER TABLE `llx_c_type_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_type_container`
--

DROP TABLE IF EXISTS `llx_c_type_container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_type_container` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `label` varchar(128) NOT NULL,
  `module` varchar(32) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_container_id` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_type_container`
--

LOCK TABLES `llx_c_type_container` WRITE;
/*!40000 ALTER TABLE `llx_c_type_container` DISABLE KEYS */;
INSERT INTO `llx_c_type_container` VALUES
(1,'page',1,'Page','system',1),
(1,'banner',1,'Banner','system',2),
(1,'blogpost',1,'BlogPost','system',3),
(1,'menu',1,'Menu','system',4),
(1,'other',1,'Other','system',5);
/*!40000 ALTER TABLE `llx_c_type_container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_type_fees`
--

DROP TABLE IF EXISTS `llx_c_type_fees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_type_fees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(12) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  `type` int DEFAULT '0',
  `accountancy_code` varchar(32) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_type_fees` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_type_fees`
--

LOCK TABLES `llx_c_type_fees` WRITE;
/*!40000 ALTER TABLE `llx_c_type_fees` DISABLE KEYS */;
INSERT INTO `llx_c_type_fees` VALUES
(NULL,1,'TF_OTHER',1,'Other',NULL,0,0),
(NULL,1,'TF_TRIP',2,'Transportation',NULL,0,0),
(NULL,1,'TF_LUNCH',3,'Lunch',NULL,0,0),
(NULL,1,'EX_KME',4,'ExpLabelKm',NULL,0,0),
(NULL,0,'EX_FUE',5,'ExpLabelFuelCV',NULL,0,0),
(NULL,0,'EX_HOT',6,'ExpLabelHotel',NULL,0,0),
(NULL,0,'EX_PAR',7,'ExpLabelParkingCV',NULL,0,0),
(NULL,0,'EX_TOL',8,'ExpLabelTollCV',NULL,0,0),
(NULL,0,'EX_TAX',9,'ExpLabelVariousTaxes',NULL,0,0),
(NULL,0,'EX_IND',10,'ExpLabelIndemnityTransSubscrip',NULL,0,0),
(NULL,0,'EX_SUM',11,'ExpLabelMaintenanceSupply',NULL,0,0),
(NULL,0,'EX_SUO',12,'ExpLabelOfficeSupplies',NULL,0,0),
(NULL,0,'EX_CAR',13,'ExpLabelCarRental',NULL,0,0),
(NULL,0,'EX_DOC',14,'ExpLabelDocumentation',NULL,0,0),
(NULL,0,'EX_CUR',15,'ExpLabelCustomersReceiving',NULL,0,0),
(NULL,0,'EX_OTR',16,'ExpLabelOtherReceiving',NULL,0,0),
(NULL,0,'EX_POS',17,'ExpLabelPostage',NULL,0,0),
(NULL,0,'EX_CAM',18,'ExpLabelMaintenanceRepairCV',NULL,0,0),
(NULL,0,'EX_EMM',19,'ExpLabelEmployeesMeal',NULL,0,0),
(NULL,0,'EX_GUM',20,'ExpLabelGuestsMeal',NULL,0,0),
(NULL,0,'EX_BRE',21,'ExpLabelBreakfast',NULL,0,0),
(NULL,0,'EX_FUE_VP',22,'ExpLabelFuelPV',NULL,0,0),
(NULL,0,'EX_TOL_VP',23,'ExpLabelTollPV',NULL,0,0),
(NULL,0,'EX_PAR_VP',24,'ExpLabelParkingPV',NULL,0,0),
(NULL,0,'EX_CAM_VP',25,'ExpLabelMaintenanceRepairPV',NULL,0,0);
/*!40000 ALTER TABLE `llx_c_type_fees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_type_resource`
--

DROP TABLE IF EXISTS `llx_c_type_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_type_resource` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_resource_id` (`label`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_type_resource`
--

LOCK TABLES `llx_c_type_resource` WRITE;
/*!40000 ALTER TABLE `llx_c_type_resource` DISABLE KEYS */;
INSERT INTO `llx_c_type_resource` VALUES
(1,'RES_ROOMS','Rooms',1),
(1,'RES_CARS','Cars',2);
/*!40000 ALTER TABLE `llx_c_type_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_typent`
--

DROP TABLE IF EXISTS `llx_c_typent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_typent` (
  `id` int NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(128) DEFAULT NULL,
  `fk_country` int DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_typent` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_typent`
--

LOCK TABLES `llx_c_typent` WRITE;
/*!40000 ALTER TABLE `llx_c_typent` DISABLE KEYS */;
INSERT INTO `llx_c_typent` VALUES
(0,'TE_STARTUP',NULL,1,'Start-up',NULL,0),
(1,'TE_GROUP',NULL,2,'Grand groupe',NULL,0),
(1,'TE_MEDIUM',NULL,3,'PME/PMI',NULL,0),
(1,'TE_SMALL',NULL,4,'TPE',NULL,0),
(1,'TE_ADMIN',NULL,5,'Administration',NULL,0),
(0,'TE_WHOLE',NULL,6,'Grossiste',NULL,0),
(0,'TE_RETAIL',NULL,7,'Revendeur',NULL,0),
(1,'TE_PRIVATE',NULL,8,'Particulier',NULL,0),
(1,'TE_OTHER',NULL,100,'Autres',NULL,0),
(0,'TE_A_RI',23,231,'Responsable Inscripto (typo A)',NULL,0),
(0,'TE_B_RNI',23,232,'Responsable No Inscripto (typo B)',NULL,0),
(0,'TE_C_FE',23,233,'Consumidor Final/Exento (typo C)',NULL,0);
/*!40000 ALTER TABLE `llx_c_typent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_units`
--

DROP TABLE IF EXISTS `llx_c_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_units` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(3) DEFAULT NULL,
  `sortorder` smallint DEFAULT NULL,
  `scale` int DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  `short_label` varchar(5) DEFAULT NULL,
  `unit_type` varchar(10) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_units_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_units`
--

LOCK TABLES `llx_c_units` WRITE;
/*!40000 ALTER TABLE `llx_c_units` DISABLE KEYS */;
INSERT INTO `llx_c_units` VALUES
(1,'T','WeightUnitton',1,3,'T',100,'weight'),
(1,'KG','WeightUnitkg',2,0,'kg',110,'weight'),
(1,'G','WeightUnitg',3,-3,'g',120,'weight'),
(1,'MG','WeightUnitmg',4,-6,'mg',130,'weight'),
(1,'OZ','WeightUnitounce',5,98,'Oz',140,'weight'),
(1,'LB','WeightUnitpound',6,99,'lb',150,'weight'),
(1,'M','SizeUnitm',7,0,'m',200,'size'),
(1,'DM','SizeUnitdm',8,-1,'dm',210,'size'),
(1,'CM','SizeUnitcm',9,-2,'cm',220,'size'),
(1,'MM','SizeUnitmm',10,-3,'mm',230,'size'),
(1,'FT','SizeUnitfoot',11,98,'ft',240,'size'),
(1,'IN','SizeUnitinch',12,99,'in',250,'size'),
(1,'M2','SurfaceUnitm2',13,0,'m2',300,'surface'),
(1,'DM2','SurfaceUnitdm2',14,-2,'dm2',310,'surface'),
(1,'CM2','SurfaceUnitcm2',15,-4,'cm2',320,'surface'),
(1,'MM2','SurfaceUnitmm2',16,-6,'mm2',330,'surface'),
(1,'FT2','SurfaceUnitfoot2',17,98,'ft2',340,'surface'),
(1,'IN2','SurfaceUnitinch2',18,99,'in2',350,'surface'),
(1,'M3','VolumeUnitm3',19,0,'m3',400,'volume'),
(1,'DM3','VolumeUnitdm3',20,-3,'dm3',410,'volume'),
(1,'CM3','VolumeUnitcm3',21,-6,'cm3',420,'volume'),
(1,'MM3','VolumeUnitmm3',22,-9,'mm3',430,'volume'),
(1,'FT3','VolumeUnitfoot3',23,88,'ft3',440,'volume'),
(1,'IN3','VolumeUnitinch3',24,89,'in3',450,'volume'),
(1,'OZ3','VolumeUnitounce',25,97,'Oz',460,'volume'),
(1,'L','VolumeUnitlitre',26,98,'L',470,'volume'),
(1,'GAL','VolumeUnitgallon',27,99,'gal',480,'volume'),
(1,'P','Piece',28,0,'p',500,'qty'),
(1,'SET','Set',29,0,'set',510,'qty'),
(1,'S','second',30,0,'s',600,'time'),
(1,'MI','minute',31,60,'i',610,'time'),
(1,'H','hour',32,3600,'h',620,'time'),
(1,'D','day',33,86400,'d',630,'time'),
(1,'W','week',34,604800,'w',640,'time'),
(1,'MO','month',35,2629800,'m',650,'time'),
(1,'Y','year',36,31557600,'y',660,'time');
/*!40000 ALTER TABLE `llx_c_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_c_ziptown`
--

DROP TABLE IF EXISTS `llx_c_ziptown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_c_ziptown` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `code` varchar(5) DEFAULT NULL,
  `fk_county` int DEFAULT NULL,
  `fk_pays` int NOT NULL DEFAULT '0',
  `zip` varchar(10) NOT NULL,
  `town` varchar(180) NOT NULL,
  `town_up` varchar(180) DEFAULT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ziptown_fk_pays` (`zip`,`town`,`fk_pays`),
  KEY `idx_c_ziptown_fk_county` (`fk_county`),
  KEY `idx_c_ziptown_fk_pays` (`fk_pays`),
  KEY `idx_c_ziptown_zip` (`zip`),
  CONSTRAINT `fk_c_ziptown_fk_county` FOREIGN KEY (`fk_county`) REFERENCES `llx_c_departements` (`rowid`),
  CONSTRAINT `fk_c_ziptown_fk_pays` FOREIGN KEY (`fk_pays`) REFERENCES `llx_c_country` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_c_ziptown`
--

LOCK TABLES `llx_c_ziptown` WRITE;
/*!40000 ALTER TABLE `llx_c_ziptown` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_c_ziptown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie`
--

DROP TABLE IF EXISTS `llx_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_parent` int NOT NULL DEFAULT '0',
  `label` varchar(180) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `type` int NOT NULL DEFAULT '1',
  `description` text,
  `color` varchar(8) DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `visible` tinyint NOT NULL DEFAULT '1',
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie`
--

LOCK TABLES `llx_categorie` WRITE;
/*!40000 ALTER TABLE `llx_categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_account`
--

DROP TABLE IF EXISTS `llx_categorie_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_account` (
  `fk_categorie` int NOT NULL,
  `fk_account` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_account`),
  KEY `idx_categorie_account_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_account_fk_account` (`fk_account`),
  CONSTRAINT `fk_categorie_account_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_account_fk_account` FOREIGN KEY (`fk_account`) REFERENCES `llx_bank_account` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_account`
--

LOCK TABLES `llx_categorie_account` WRITE;
/*!40000 ALTER TABLE `llx_categorie_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_actioncomm`
--

DROP TABLE IF EXISTS `llx_categorie_actioncomm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_actioncomm` (
  `fk_categorie` int NOT NULL,
  `fk_actioncomm` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_actioncomm`),
  KEY `idx_categorie_actioncomm_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_actioncomm_fk_actioncomm` (`fk_actioncomm`),
  CONSTRAINT `fk_categorie_actioncomm_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_actioncomm_fk_actioncomm` FOREIGN KEY (`fk_actioncomm`) REFERENCES `llx_actioncomm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_actioncomm`
--

LOCK TABLES `llx_categorie_actioncomm` WRITE;
/*!40000 ALTER TABLE `llx_categorie_actioncomm` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_actioncomm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_contact`
--

DROP TABLE IF EXISTS `llx_categorie_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_contact` (
  `fk_categorie` int NOT NULL,
  `fk_socpeople` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_socpeople`),
  KEY `idx_categorie_contact_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_contact_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_categorie_contact_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_contact_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `llx_socpeople` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_contact`
--

LOCK TABLES `llx_categorie_contact` WRITE;
/*!40000 ALTER TABLE `llx_categorie_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_fournisseur`
--

DROP TABLE IF EXISTS `llx_categorie_fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_fournisseur` (
  `fk_categorie` int NOT NULL,
  `fk_soc` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_soc`),
  KEY `idx_categorie_fournisseur_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_fournisseur_fk_societe` (`fk_soc`),
  CONSTRAINT `fk_categorie_fournisseur_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_fournisseur`
--

LOCK TABLES `llx_categorie_fournisseur` WRITE;
/*!40000 ALTER TABLE `llx_categorie_fournisseur` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_lang`
--

DROP TABLE IF EXISTS `llx_categorie_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_lang` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_category` int NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_category_lang` (`fk_category`,`lang`),
  CONSTRAINT `fk_category_lang_fk_category` FOREIGN KEY (`fk_category`) REFERENCES `llx_categorie` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_lang`
--

LOCK TABLES `llx_categorie_lang` WRITE;
/*!40000 ALTER TABLE `llx_categorie_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_member`
--

DROP TABLE IF EXISTS `llx_categorie_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_member` (
  `fk_categorie` int NOT NULL,
  `fk_member` int NOT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_member`),
  KEY `idx_categorie_member_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_member_fk_member` (`fk_member`),
  CONSTRAINT `fk_categorie_member_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_member_member_rowid` FOREIGN KEY (`fk_member`) REFERENCES `llx_adherent` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_member`
--

LOCK TABLES `llx_categorie_member` WRITE;
/*!40000 ALTER TABLE `llx_categorie_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_product`
--

DROP TABLE IF EXISTS `llx_categorie_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_product` (
  `fk_categorie` int NOT NULL,
  `fk_product` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_product`),
  KEY `idx_categorie_product_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_product_fk_product` (`fk_product`),
  CONSTRAINT `fk_categorie_product_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_product_product_rowid` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_product`
--

LOCK TABLES `llx_categorie_product` WRITE;
/*!40000 ALTER TABLE `llx_categorie_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_project`
--

DROP TABLE IF EXISTS `llx_categorie_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_project` (
  `fk_categorie` int NOT NULL,
  `fk_project` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_project`),
  KEY `idx_categorie_project_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_project_fk_project` (`fk_project`),
  CONSTRAINT `fk_categorie_project_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_project_fk_project_rowid` FOREIGN KEY (`fk_project`) REFERENCES `llx_projet` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_project`
--

LOCK TABLES `llx_categorie_project` WRITE;
/*!40000 ALTER TABLE `llx_categorie_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_societe`
--

DROP TABLE IF EXISTS `llx_categorie_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_societe` (
  `fk_categorie` int NOT NULL,
  `fk_soc` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_soc`),
  KEY `idx_categorie_societe_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_societe_fk_societe` (`fk_soc`),
  CONSTRAINT `fk_categorie_societe_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_societe_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_societe`
--

LOCK TABLES `llx_categorie_societe` WRITE;
/*!40000 ALTER TABLE `llx_categorie_societe` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_user`
--

DROP TABLE IF EXISTS `llx_categorie_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_user` (
  `fk_categorie` int NOT NULL,
  `fk_user` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_user`),
  KEY `idx_categorie_user_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_user_fk_user` (`fk_user`),
  CONSTRAINT `fk_categorie_user_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_user`
--

LOCK TABLES `llx_categorie_user` WRITE;
/*!40000 ALTER TABLE `llx_categorie_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categorie_warehouse`
--

DROP TABLE IF EXISTS `llx_categorie_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categorie_warehouse` (
  `fk_categorie` int NOT NULL,
  `fk_warehouse` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_warehouse`),
  KEY `idx_categorie_warehouse_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_warehouse_fk_warehouse` (`fk_warehouse`),
  CONSTRAINT `fk_categorie_warehouse_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_warehouse_fk_warehouse_rowid` FOREIGN KEY (`fk_warehouse`) REFERENCES `llx_entrepot` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categorie_warehouse`
--

LOCK TABLES `llx_categorie_warehouse` WRITE;
/*!40000 ALTER TABLE `llx_categorie_warehouse` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categorie_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_categories_extrafields`
--

DROP TABLE IF EXISTS `llx_categories_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_categories_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_categories_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_categories_extrafields`
--

LOCK TABLES `llx_categories_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_categories_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_categories_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_chargesociales`
--

DROP TABLE IF EXISTS `llx_chargesociales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_chargesociales` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(16) DEFAULT NULL,
  `date_ech` datetime NOT NULL,
  `libelle` varchar(80) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_type` int NOT NULL,
  `fk_account` int DEFAULT NULL,
  `fk_mode_reglement` int DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `paye` smallint NOT NULL DEFAULT '0',
  `periode` date DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_chargesociales`
--

LOCK TABLES `llx_chargesociales` WRITE;
/*!40000 ALTER TABLE `llx_chargesociales` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_chargesociales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande`
--

DROP TABLE IF EXISTS `llx_commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `fk_soc` int NOT NULL,
  `fk_projet` int DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_user_cloture` int DEFAULT NULL,
  `source` smallint DEFAULT NULL,
  `fk_statut` smallint DEFAULT '0',
  `amount_ht` double(24,8) DEFAULT '0.00000000',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `revenuestamp` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `module_source` varchar(32) DEFAULT NULL,
  `pos_source` varchar(32) DEFAULT NULL,
  `facture` tinyint DEFAULT '0',
  `fk_account` int DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int DEFAULT NULL,
  `deposit_percent` varchar(63) DEFAULT NULL,
  `fk_mode_reglement` int DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `fk_shipping_method` int DEFAULT NULL,
  `fk_warehouse` int DEFAULT NULL,
  `fk_availability` int DEFAULT NULL,
  `fk_input_reason` int DEFAULT NULL,
  `fk_delivery_address` int DEFAULT NULL,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_ref` (`ref`,`entity`),
  KEY `idx_commande_fk_soc` (`fk_soc`),
  KEY `idx_commande_fk_user_author` (`fk_user_author`),
  KEY `idx_commande_fk_user_valid` (`fk_user_valid`),
  KEY `idx_commande_fk_user_cloture` (`fk_user_cloture`),
  KEY `idx_commande_fk_projet` (`fk_projet`),
  KEY `idx_commande_fk_account` (`fk_account`),
  KEY `idx_commande_fk_currency` (`fk_currency`),
  CONSTRAINT `fk_commande_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_commande_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande`
--

LOCK TABLES `llx_commande` WRITE;
/*!40000 ALTER TABLE `llx_commande` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_extrafields`
--

DROP TABLE IF EXISTS `llx_commande_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_extrafields`
--

LOCK TABLES `llx_commande_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_commande_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_fournisseur`
--

DROP TABLE IF EXISTS `llx_commande_fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_fournisseur` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(180) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `fk_soc` int NOT NULL,
  `fk_projet` int DEFAULT '0',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_approve2` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_user_approve` int DEFAULT NULL,
  `fk_user_approve2` int DEFAULT NULL,
  `source` smallint NOT NULL,
  `fk_statut` smallint DEFAULT '0',
  `billed` smallint DEFAULT '0',
  `amount_ht` double(24,8) DEFAULT '0.00000000',
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `fk_account` int DEFAULT NULL,
  `fk_cond_reglement` int DEFAULT NULL,
  `fk_mode_reglement` int DEFAULT NULL,
  `fk_input_method` int DEFAULT '0',
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_fournisseur_ref` (`ref`,`entity`),
  KEY `idx_commande_fournisseur_fk_soc` (`fk_soc`),
  KEY `billed` (`billed`),
  CONSTRAINT `fk_commande_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseur`
--

LOCK TABLES `llx_commande_fournisseur` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseur` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_fournisseur_dispatch`
--

DROP TABLE IF EXISTS `llx_commande_fournisseur_dispatch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_fournisseur_dispatch` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_commande` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `fk_commandefourndet` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `fk_reception` int DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `fk_entrepot` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `status` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cost_price` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseur_dispatch_fk_commande` (`fk_commande`),
  KEY `idx_commande_fournisseur_dispatch_fk_reception` (`fk_reception`),
  KEY `idx_commande_fournisseur_dispatch_fk_product` (`fk_product`),
  CONSTRAINT `fk_commande_fournisseur_dispatch_fk_reception` FOREIGN KEY (`fk_reception`) REFERENCES `llx_reception` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseur_dispatch`
--

LOCK TABLES `llx_commande_fournisseur_dispatch` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseur_dispatch` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseur_dispatch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_fournisseur_dispatch_extrafields`
--

DROP TABLE IF EXISTS `llx_commande_fournisseur_dispatch_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_fournisseur_dispatch_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseur_dispatch_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseur_dispatch_extrafields`
--

LOCK TABLES `llx_commande_fournisseur_dispatch_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseur_dispatch_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseur_dispatch_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_fournisseur_extrafields`
--

DROP TABLE IF EXISTS `llx_commande_fournisseur_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_fournisseur_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseur_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseur_extrafields`
--

LOCK TABLES `llx_commande_fournisseur_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseur_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseur_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_fournisseur_log`
--

DROP TABLE IF EXISTS `llx_commande_fournisseur_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_fournisseur_log` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datelog` datetime NOT NULL,
  `fk_commande` int NOT NULL,
  `fk_statut` smallint NOT NULL,
  `fk_user` int NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseur_log`
--

LOCK TABLES `llx_commande_fournisseur_log` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseur_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseur_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_fournisseurdet`
--

DROP TABLE IF EXISTS `llx_commande_fournisseurdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_fournisseurdet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_commande` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `ref` varchar(128) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `special_code` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `fk_unit` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `fk_commande_fournisseurdet_fk_unit` (`fk_unit`),
  KEY `idx_commande_fournisseurdet_fk_commande` (`fk_commande`),
  KEY `idx_commande_fournisseurdet_fk_product` (`fk_product`),
  CONSTRAINT `fk_commande_fournisseurdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseurdet`
--

LOCK TABLES `llx_commande_fournisseurdet` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseurdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseurdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commande_fournisseurdet_extrafields`
--

DROP TABLE IF EXISTS `llx_commande_fournisseurdet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commande_fournisseurdet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseurdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commande_fournisseurdet_extrafields`
--

LOCK TABLES `llx_commande_fournisseurdet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_commande_fournisseurdet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commande_fournisseurdet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commandedet`
--

DROP TABLE IF EXISTS `llx_commandedet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commandedet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_commande` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `fk_remise_except` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int DEFAULT NULL,
  `special_code` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `fk_unit` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `fk_commandefourndet` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `idx_commandedet_fk_commande` (`fk_commande`),
  KEY `idx_commandedet_fk_product` (`fk_product`),
  KEY `fk_commandedet_fk_unit` (`fk_unit`),
  KEY `fk_commandedet_fk_commandefourndet` (`fk_commandefourndet`),
  CONSTRAINT `fk_commandedet_fk_commande` FOREIGN KEY (`fk_commande`) REFERENCES `llx_commande` (`rowid`),
  CONSTRAINT `fk_commandedet_fk_commandefourndet` FOREIGN KEY (`fk_commandefourndet`) REFERENCES `llx_commande_fournisseurdet` (`rowid`),
  CONSTRAINT `fk_commandedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commandedet`
--

LOCK TABLES `llx_commandedet` WRITE;
/*!40000 ALTER TABLE `llx_commandedet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commandedet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_commandedet_extrafields`
--

DROP TABLE IF EXISTS `llx_commandedet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_commandedet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commandedet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_commandedet_extrafields`
--

LOCK TABLES `llx_commandedet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_commandedet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_commandedet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_comment`
--

DROP TABLE IF EXISTS `llx_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_comment` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_element` int DEFAULT NULL,
  `element_type` varchar(50) DEFAULT NULL,
  `entity` int DEFAULT '1',
  `import_key` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_comment`
--

LOCK TABLES `llx_comment` WRITE;
/*!40000 ALTER TABLE `llx_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_const`
--

DROP TABLE IF EXISTS `llx_const`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_const` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(180) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `value` text NOT NULL,
  `type` varchar(64) DEFAULT 'string',
  `visible` tinyint NOT NULL DEFAULT '1',
  `note` text,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_const` (`name`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_const`
--

LOCK TABLES `llx_const` WRITE;
/*!40000 ALTER TABLE `llx_const` DISABLE KEYS */;
INSERT INTO `llx_const` VALUES
(0,'MAIN_FEATURES_LEVEL','Level of features to show: -1=stable+deprecated, 0=stable only (default), 1=stable+experimental, 2=stable+experimental+development',2,'2023-11-27 09:34:20','chaine','0',1),
(0,'MAILING_LIMIT_SENDBYWEB','Number of targets to defined packet size when sending mass email',3,'2023-11-27 09:34:20','chaine','25',1),
(0,'SYSLOG_HANDLERS','Which logger to use',4,'2023-11-27 09:34:20','chaine','[\"mod_syslog_file\"]',0),
(0,'SYSLOG_FILE','Directory where to write log file',5,'2023-11-27 09:34:20','chaine','DOL_DATA_ROOT/dolibarr.log',0),
(0,'SYSLOG_LEVEL','Level of debug info to show',6,'2023-11-27 09:34:20','chaine','7',0),
(0,'MAIN_UPLOAD_DOC','Max size for file upload (0 means no upload allowed)',7,'2023-11-27 09:34:20','chaine','2048',0),
(1,'MAIN_ENABLE_OVERWRITE_TRANSLATION','Enable translation overwrite',8,'2023-11-27 09:34:20','chaine','1',0),
(1,'MAIN_ENABLE_DEFAULT_VALUES','Enable default value overwrite',9,'2023-11-27 09:34:20','chaine','1',0),
(1,'MAIN_MONNAIE','Currency',10,'2023-11-27 09:34:20','chaine','EUR',0),
(1,'MAIN_MAIL_SMTP_SERVER','Host or ip address for SMTP server',11,'2023-11-27 09:34:20','chaine','',0),
(1,'MAIN_MAIL_SMTP_PORT','Port for SMTP server',12,'2023-11-27 09:34:20','chaine','',0),
(1,'MAIN_MAIL_EMAIL_FROM','email emitter for Dolibarr automatic emails',13,'2023-11-27 09:34:20','chaine','robot@domain.com',0),
(0,'MAIN_SIZE_LISTE_LIMIT','Maximum length of lists',14,'2023-11-27 09:34:20','chaine','20',0),
(0,'MAIN_SIZE_SHORTLIST_LIMIT','Maximum length of short lists',15,'2023-11-27 09:34:20','chaine','3',0),
(0,'MAIN_MENU_STANDARD','Menu manager for internal users',16,'2023-11-27 09:34:20','chaine','eldy_menu.php',0),
(0,'MAIN_MENUFRONT_STANDARD','Menu manager for external users',17,'2023-11-27 09:34:20','chaine','eldy_menu.php',0),
(0,'MAIN_MENU_SMARTPHONE','Menu manager for internal users using smartphones',18,'2023-11-27 09:34:20','chaine','eldy_menu.php',0),
(0,'MAIN_MENUFRONT_SMARTPHONE','Menu manager for external users using smartphones',19,'2023-11-27 09:34:20','chaine','eldy_menu.php',0),
(0,'THEME_ELDY_USEBORDERONTABLE','Enable the border in theme',20,'2023-11-27 09:34:20','chaine','1',0),
(1,'MAIN_DELAY_ACTIONS_TODO','Tolérance de retard avant alerte (en jours) sur actions planifiées non réalisées',21,'2023-11-27 09:34:20','chaine','7',0),
(1,'MAIN_DELAY_ORDERS_TO_PROCESS','Tolérance de retard avant alerte (en jours) sur commandes clients non traitées',22,'2023-11-27 09:34:20','chaine','2',0),
(1,'MAIN_DELAY_SUPPLIER_ORDERS_TO_PROCESS','Tolérance de retard avant alerte (en jours) sur commandes fournisseurs non traitées',23,'2023-11-27 09:34:20','chaine','7',0),
(1,'MAIN_DELAY_PROPALS_TO_CLOSE','Tolérance de retard avant alerte (en jours) sur propales à cloturer',24,'2023-11-27 09:34:20','chaine','31',0),
(1,'MAIN_DELAY_PROPALS_TO_BILL','Tolérance de retard avant alerte (en jours) sur propales non facturées',25,'2023-11-27 09:34:20','chaine','7',0),
(1,'MAIN_DELAY_CUSTOMER_BILLS_UNPAYED','Tolérance de retard avant alerte (en jours) sur factures client impayées',26,'2023-11-27 09:34:20','chaine','31',0),
(1,'MAIN_DELAY_SUPPLIER_BILLS_TO_PAY','Tolérance de retard avant alerte (en jours) sur factures fournisseur impayées',27,'2023-11-27 09:34:20','chaine','2',0),
(1,'MAIN_DELAY_NOT_ACTIVATED_SERVICES','Tolérance de retard avant alerte (en jours) sur services à activer',28,'2023-11-27 09:34:20','chaine','0',0),
(1,'MAIN_DELAY_RUNNING_SERVICES','Tolérance de retard avant alerte (en jours) sur services expirés',29,'2023-11-27 09:34:20','chaine','0',0),
(1,'MAIN_DELAY_MEMBERS','Tolérance de retard avant alerte (en jours) sur cotisations adhérent en retard',30,'2023-11-27 09:34:20','chaine','31',0),
(1,'MAIN_DELAY_TRANSACTIONS_TO_CONCILIATE','Tolérance de retard avant alerte (en jours) sur rapprochements bancaires à faire',31,'2023-11-27 09:34:20','chaine','62',0),
(1,'MAIN_DELAY_EXPENSEREPORTS_TO_PAY','Tolérance de retard avant alerte (en jours) sur les notes de frais impayées',32,'2023-11-27 09:34:20','chaine','31',0),
(1,'MAILING_EMAIL_FROM','EMail emmetteur pour les envois d emailings',33,'2023-11-27 09:34:20','chaine','no-reply@mydomain.com',0),
(1,'PRODUCT_ADDON_PDF_ODT_PATH',NULL,34,'2023-11-27 09:34:20','chaine','DOL_DATA_ROOT/doctemplates/products',0),
(1,'CONTRACT_ADDON_PDF_ODT_PATH',NULL,35,'2023-11-27 09:34:20','chaine','DOL_DATA_ROOT/doctemplates/contracts',0),
(1,'USERGROUP_ADDON_PDF_ODT_PATH',NULL,36,'2023-11-27 09:34:20','chaine','DOL_DATA_ROOT/doctemplates/usergroups',0),
(1,'USER_ADDON_PDF_ODT_PATH',NULL,37,'2023-11-27 09:34:20','chaine','DOL_DATA_ROOT/doctemplates/users',0),
(0,'PRODUCT_PRICE_BASE_TYPE',NULL,38,'2023-11-27 09:34:20','string','HT',0),
(0,'ADHERENT_LOGIN_NOT_REQUIRED',NULL,39,'2023-11-27 09:34:20','string','1',0),
(0,'MAIN_MODULE_USER','{\"authorid\":0,\"ip\":\"\",\"lastactivationversion\":\"dolibarr\"}',40,'2023-11-27 09:34:21','string','1',0),
(1,'DATABASE_PWD_ENCRYPTED','',41,'2023-11-27 09:34:21','chaine','1',0),
(0,'MAIN_SECURITY_SALT','',42,'2023-11-27 09:34:21','chaine','20231127093421',0),
(0,'MAIN_SECURITY_HASH_ALGO','',43,'2023-11-27 09:34:21','chaine','password_hash',0),
(0,'MAIN_VERSION_FIRST_INSTALL','Dolibarr version when first install',44,'2023-11-27 09:34:21','chaine','18.0.2',0),
(0,'MAIN_VERSION_LAST_INSTALL','Dolibarr version when last install',45,'2023-11-27 09:34:21','chaine','18.0.2',0),
(1,'MAIN_MODULE_SOCIETE','{\"authorid\":0,\"ip\":\"\",\"lastactivationversion\":\"dolibarr\"}',46,'2023-11-27 09:34:21','string','1',0),
(1,'SOCIETE_CODECLIENT_ADDON','Module to control third parties codes',47,'2023-11-27 09:34:21','chaine','mod_codeclient_monkey',0),
(1,'SOCIETE_CODECOMPTA_ADDON','Module to control third parties codes',48,'2023-11-27 09:34:21','chaine','mod_codecompta_panicum',0),
(1,'SOCIETE_FISCAL_MONTH_START','Enter the month number of the first month of the fiscal year, e. g. 9 for September',49,'2023-11-27 09:34:21','chaine','0',0),
(1,'COMPANY_ADDON_PDF_ODT_PATH',NULL,50,'2023-11-27 09:34:21','chaine','DOL_DATA_ROOT/doctemplates/thirdparties',0),
(1,'SOCIETE_ADD_REF_IN_LIST','Display customer ref into select list',51,'2023-11-27 09:34:21','yesno','0',0),
(1,'MAIN_MODULE_IMPORT','{\"authorid\":0,\"ip\":\"\",\"lastactivationversion\":\"dolibarr\"}',52,'2023-11-27 09:34:21','string','1',0),
(1,'MAIN_MODULE_FCKEDITOR','{\"authorid\":0,\"ip\":\"\",\"lastactivationversion\":\"dolibarr\"}',53,'2023-11-27 09:34:21','string','1',0),
(1,'FCKEDITOR_ENABLE_SOCIETE','WYSIWIG for the fields descriptions of elements (except products/services)',54,'2023-11-27 09:34:21','yesno','1',0),
(1,'FCKEDITOR_ENABLE_DETAILS','WYSIWIG for products details lines for all entities',55,'2023-11-27 09:34:21','yesno','1',0),
(1,'FCKEDITOR_ENABLE_USERSIGN','WYSIWIG for user signature',56,'2023-11-27 09:34:21','yesno','1',0),
(1,'FCKEDITOR_ENABLE_MAILING','WYSIWIG for mass emailings',57,'2023-11-27 09:34:21','yesno','1',0),
(1,'FCKEDITOR_ENABLE_MAIL','WYSIWIG for products details lines for all entities',58,'2023-11-27 09:34:21','yesno','1',0),
(1,'MAIN_MODULE_EXPORT','{\"authorid\":0,\"ip\":\"\",\"lastactivationversion\":\"dolibarr\"}',59,'2023-11-27 09:34:21','string','1',0);
/*!40000 ALTER TABLE `llx_const` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_contrat`
--

DROP TABLE IF EXISTS `llx_contrat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_contrat` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `date_contrat` datetime DEFAULT NULL,
  `statut` smallint DEFAULT '0',
  `fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_soc` int NOT NULL,
  `fk_projet` int DEFAULT NULL,
  `fk_commercial_signature` int DEFAULT NULL,
  `fk_commercial_suivi` int DEFAULT NULL,
  `fk_user_author` int NOT NULL DEFAULT '0',
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_cloture` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_contrat_ref` (`ref`,`entity`),
  KEY `idx_contrat_fk_soc` (`fk_soc`),
  KEY `idx_contrat_fk_user_author` (`fk_user_author`),
  CONSTRAINT `fk_contrat_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_contrat_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_contrat`
--

LOCK TABLES `llx_contrat` WRITE;
/*!40000 ALTER TABLE `llx_contrat` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_contrat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_contrat_extrafields`
--

DROP TABLE IF EXISTS `llx_contrat_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_contrat_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_contrat_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_contrat_extrafields`
--

LOCK TABLES `llx_contrat_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_contrat_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_contrat_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_contratdet`
--

DROP TABLE IF EXISTS `llx_contratdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_contratdet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_contrat` int NOT NULL,
  `fk_product` int DEFAULT NULL,
  `statut` smallint DEFAULT '0',
  `label` text,
  `description` text,
  `fk_remise_except` int DEFAULT NULL,
  `date_commande` datetime DEFAULT NULL,
  `date_ouverture_prevue` datetime DEFAULT NULL,
  `date_ouverture` datetime DEFAULT NULL,
  `date_fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double NOT NULL,
  `remise_percent` double DEFAULT '0',
  `subprice` double(24,8) DEFAULT '0.00000000',
  `price_ht` double DEFAULT NULL,
  `remise` double DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int DEFAULT '1',
  `info_bits` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT NULL,
  `fk_product_fournisseur_price` int DEFAULT NULL,
  `fk_user_author` int NOT NULL DEFAULT '0',
  `fk_user_ouverture` int DEFAULT NULL,
  `fk_user_cloture` int DEFAULT NULL,
  `commentaire` text,
  `fk_unit` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_fk_contrat` (`fk_contrat`),
  KEY `idx_contratdet_fk_product` (`fk_product`),
  KEY `idx_contratdet_date_ouverture_prevue` (`date_ouverture_prevue`),
  KEY `idx_contratdet_date_ouverture` (`date_ouverture`),
  KEY `idx_contratdet_date_fin_validite` (`date_fin_validite`),
  KEY `idx_contratdet_statut` (`statut`),
  KEY `fk_contratdet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_contratdet_fk_contrat` FOREIGN KEY (`fk_contrat`) REFERENCES `llx_contrat` (`rowid`),
  CONSTRAINT `fk_contratdet_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_contratdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_contratdet`
--

LOCK TABLES `llx_contratdet` WRITE;
/*!40000 ALTER TABLE `llx_contratdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_contratdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_contratdet_extrafields`
--

DROP TABLE IF EXISTS `llx_contratdet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_contratdet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_contratdet_extrafields`
--

LOCK TABLES `llx_contratdet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_contratdet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_contratdet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_contratdet_log`
--

DROP TABLE IF EXISTS `llx_contratdet_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_contratdet_log` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_contratdet` int NOT NULL,
  `date` datetime NOT NULL,
  `statut` smallint NOT NULL,
  `fk_user_author` int NOT NULL,
  `commentaire` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_log_fk_contratdet` (`fk_contratdet`),
  KEY `idx_contratdet_log_date` (`date`),
  CONSTRAINT `fk_contratdet_log_fk_contratdet` FOREIGN KEY (`fk_contratdet`) REFERENCES `llx_contratdet` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_contratdet_log`
--

LOCK TABLES `llx_contratdet_log` WRITE;
/*!40000 ALTER TABLE `llx_contratdet_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_contratdet_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_cronjob`
--

DROP TABLE IF EXISTS `llx_cronjob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_cronjob` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `jobtype` varchar(10) NOT NULL,
  `label` varchar(255) NOT NULL,
  `command` varchar(255) DEFAULT NULL,
  `classesname` varchar(255) DEFAULT NULL,
  `objectname` varchar(255) DEFAULT NULL,
  `methodename` varchar(255) DEFAULT NULL,
  `params` text,
  `md5params` varchar(32) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `priority` int DEFAULT '0',
  `datelastrun` datetime DEFAULT NULL,
  `datenextrun` datetime DEFAULT NULL,
  `datestart` datetime DEFAULT NULL,
  `dateend` datetime DEFAULT NULL,
  `datelastresult` datetime DEFAULT NULL,
  `lastresult` text,
  `lastoutput` text,
  `unitfrequency` varchar(255) NOT NULL DEFAULT '3600',
  `frequency` int NOT NULL DEFAULT '0',
  `maxrun` int NOT NULL DEFAULT '0',
  `nbrun` int DEFAULT NULL,
  `autodelete` int DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `processing` int NOT NULL DEFAULT '0',
  `pid` int DEFAULT NULL,
  `test` varchar(255) DEFAULT '1',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_mod` int DEFAULT NULL,
  `fk_mailing` int DEFAULT NULL,
  `note` text,
  `libname` varchar(255) DEFAULT NULL,
  `email_alert` varchar(128) DEFAULT NULL,
  `entity` int DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_cronjob` (`label`,`entity`),
  KEY `idx_cronjob_status` (`status`),
  KEY `idx_cronjob_datelastrun` (`datelastrun`),
  KEY `idx_cronjob_datenextrun` (`datenextrun`),
  KEY `idx_cronjob_datestart` (`datestart`),
  KEY `idx_cronjob_dateend` (`dateend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_cronjob`
--

LOCK TABLES `llx_cronjob` WRITE;
/*!40000 ALTER TABLE `llx_cronjob` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_cronjob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_default_values`
--

DROP TABLE IF EXISTS `llx_default_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_default_values` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `type` varchar(10) DEFAULT NULL,
  `user_id` int NOT NULL DEFAULT '0',
  `page` varchar(255) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_default_values` (`type`,`entity`,`user_id`,`page`,`param`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_default_values`
--

LOCK TABLES `llx_default_values` WRITE;
/*!40000 ALTER TABLE `llx_default_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_default_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_delivery`
--

DROP TABLE IF EXISTS `llx_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_delivery` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `fk_address` int DEFAULT NULL,
  `fk_statut` smallint DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_delivery_uk_ref` (`ref`,`entity`),
  KEY `idx_delivery_fk_soc` (`fk_soc`),
  KEY `idx_delivery_fk_user_author` (`fk_user_author`),
  KEY `idx_delivery_fk_user_valid` (`fk_user_valid`),
  CONSTRAINT `fk_delivery_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_delivery_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_delivery_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_delivery`
--

LOCK TABLES `llx_delivery` WRITE;
/*!40000 ALTER TABLE `llx_delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_delivery_extrafields`
--

DROP TABLE IF EXISTS `llx_delivery_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_delivery_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_delivery_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_delivery_extrafields`
--

LOCK TABLES `llx_delivery_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_delivery_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_delivery_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_deliverydet`
--

DROP TABLE IF EXISTS `llx_deliverydet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_deliverydet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_delivery` int DEFAULT NULL,
  `fk_origin_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `description` text,
  `qty` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `rang` int DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_deliverydet_fk_delivery` (`fk_delivery`),
  CONSTRAINT `fk_deliverydet_fk_delivery` FOREIGN KEY (`fk_delivery`) REFERENCES `llx_delivery` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_deliverydet`
--

LOCK TABLES `llx_deliverydet` WRITE;
/*!40000 ALTER TABLE `llx_deliverydet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_deliverydet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_deliverydet_extrafields`
--

DROP TABLE IF EXISTS `llx_deliverydet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_deliverydet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_deliverydet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_deliverydet_extrafields`
--

LOCK TABLES `llx_deliverydet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_deliverydet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_deliverydet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_document_model`
--

DROP TABLE IF EXISTS `llx_document_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_document_model` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `type` varchar(64) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_document_model` (`nom`,`type`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_document_model`
--

LOCK TABLES `llx_document_model` WRITE;
/*!40000 ALTER TABLE `llx_document_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_document_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_ecm_directories`
--

DROP TABLE IF EXISTS `llx_ecm_directories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_ecm_directories` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_parent` int DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cachenbofdoc` int NOT NULL DEFAULT '0',
  `fullpath` varchar(750) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_c` int DEFAULT NULL,
  `fk_user_m` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `acl` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ecm_directories` (`label`,`fk_parent`,`entity`),
  KEY `idx_ecm_directories_fk_user_c` (`fk_user_c`),
  KEY `idx_ecm_directories_fk_user_m` (`fk_user_m`),
  CONSTRAINT `fk_ecm_directories_fk_user_c` FOREIGN KEY (`fk_user_c`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_ecm_directories_fk_user_m` FOREIGN KEY (`fk_user_m`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ecm_directories`
--

LOCK TABLES `llx_ecm_directories` WRITE;
/*!40000 ALTER TABLE `llx_ecm_directories` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ecm_directories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_ecm_directories_extrafields`
--

DROP TABLE IF EXISTS `llx_ecm_directories_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_ecm_directories_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ecm_directories_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ecm_directories_extrafields`
--

LOCK TABLES `llx_ecm_directories_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_ecm_directories_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ecm_directories_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_ecm_files`
--

DROP TABLE IF EXISTS `llx_ecm_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_ecm_files` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) DEFAULT NULL,
  `label` varchar(128) NOT NULL,
  `share` varchar(128) DEFAULT NULL,
  `share_pass` varchar(32) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `filepath` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `src_object_type` varchar(64) DEFAULT NULL,
  `src_object_id` int DEFAULT NULL,
  `fullpath_orig` varchar(750) DEFAULT NULL,
  `description` text,
  `keywords` varchar(750) DEFAULT NULL,
  `cover` text,
  `position` int DEFAULT NULL,
  `gen_or_uploaded` varchar(12) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_c` int DEFAULT NULL,
  `fk_user_m` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `acl` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ecm_files` (`filepath`,`filename`,`entity`),
  KEY `idx_ecm_files_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ecm_files`
--

LOCK TABLES `llx_ecm_files` WRITE;
/*!40000 ALTER TABLE `llx_ecm_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ecm_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_ecm_files_extrafields`
--

DROP TABLE IF EXISTS `llx_ecm_files_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_ecm_files_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ecm_files_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_ecm_files_extrafields`
--

LOCK TABLES `llx_ecm_files_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_ecm_files_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_ecm_files_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_element_categorie`
--

DROP TABLE IF EXISTS `llx_element_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_element_categorie` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_categorie` int NOT NULL,
  `fk_element` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_categorie_idx` (`fk_element`,`fk_categorie`),
  KEY `fk_element_categorie_fk_categorie` (`fk_categorie`),
  CONSTRAINT `fk_element_categorie_fk_categorie` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_categorie`
--

LOCK TABLES `llx_element_categorie` WRITE;
/*!40000 ALTER TABLE `llx_element_categorie` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_element_contact`
--

DROP TABLE IF EXISTS `llx_element_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_element_contact` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datecreate` datetime DEFAULT NULL,
  `statut` smallint DEFAULT '5',
  `element_id` int NOT NULL,
  `fk_c_type_contact` int NOT NULL,
  `fk_socpeople` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_contact_idx1` (`element_id`,`fk_c_type_contact`,`fk_socpeople`),
  KEY `fk_element_contact_fk_c_type_contact` (`fk_c_type_contact`),
  KEY `idx_element_contact_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_element_contact_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `llx_c_type_contact` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_contact`
--

LOCK TABLES `llx_element_contact` WRITE;
/*!40000 ALTER TABLE `llx_element_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_element_element`
--

DROP TABLE IF EXISTS `llx_element_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_element_element` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_source` int NOT NULL,
  `sourcetype` varchar(32) NOT NULL,
  `fk_target` int NOT NULL,
  `targettype` varchar(32) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_element_idx1` (`fk_source`,`sourcetype`,`fk_target`,`targettype`),
  KEY `idx_element_element_fk_target` (`fk_target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_element`
--

LOCK TABLES `llx_element_element` WRITE;
/*!40000 ALTER TABLE `llx_element_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_element_resources`
--

DROP TABLE IF EXISTS `llx_element_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_element_resources` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `element_id` int DEFAULT NULL,
  `element_type` varchar(64) DEFAULT NULL,
  `resource_id` int DEFAULT NULL,
  `resource_type` varchar(64) DEFAULT NULL,
  `busy` int DEFAULT NULL,
  `mandatory` int DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `fk_user_create` int DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_resources_idx1` (`resource_id`,`resource_type`,`element_id`,`element_type`),
  KEY `idx_element_element_element_id` (`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_resources`
--

LOCK TABLES `llx_element_resources` WRITE;
/*!40000 ALTER TABLE `llx_element_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_element_time`
--

DROP TABLE IF EXISTS `llx_element_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_element_time` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref_ext` varchar(32) DEFAULT NULL,
  `fk_element` int NOT NULL,
  `elementtype` varchar(32) NOT NULL,
  `element_date` date DEFAULT NULL,
  `element_datehour` datetime DEFAULT NULL,
  `element_date_withhour` int DEFAULT NULL,
  `element_duration` double DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `thm` double(24,8) DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  `invoice_line_id` int DEFAULT NULL,
  `intervention_id` int DEFAULT NULL,
  `intervention_line_id` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_element_time_task` (`fk_element`),
  KEY `idx_element_time_date` (`element_date`),
  KEY `idx_element_time_datehour` (`element_datehour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_element_time`
--

LOCK TABLES `llx_element_time` WRITE;
/*!40000 ALTER TABLE `llx_element_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_element_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_emailcollector_emailcollector`
--

DROP TABLE IF EXISTS `llx_emailcollector_emailcollector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_emailcollector_emailcollector` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref` varchar(128) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `host` varchar(255) DEFAULT NULL,
  `port` varchar(10) DEFAULT '993',
  `hostcharset` varchar(16) DEFAULT 'UTF-8',
  `imap_encryption` varchar(16) DEFAULT 'ssl',
  `norsh` int DEFAULT '0',
  `login` varchar(128) DEFAULT NULL,
  `acces_type` int DEFAULT '0',
  `oauth_service` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `source_directory` varchar(255) NOT NULL DEFAULT 'Inbox',
  `target_directory` varchar(255) DEFAULT NULL,
  `maxemailpercollect` int DEFAULT '100',
  `datelastresult` datetime DEFAULT NULL,
  `codelastresult` varchar(16) DEFAULT NULL,
  `lastresult` text,
  `datelastok` datetime DEFAULT NULL,
  `note_public` text,
  `note_private` text,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollector_ref` (`ref`,`entity`),
  KEY `idx_emailcollector_entity` (`entity`),
  KEY `idx_emailcollector_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_emailcollector_emailcollector`
--

LOCK TABLES `llx_emailcollector_emailcollector` WRITE;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollector` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_emailcollector_emailcollectoraction`
--

DROP TABLE IF EXISTS `llx_emailcollector_emailcollectoraction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_emailcollector_emailcollectoraction` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_emailcollector` int NOT NULL,
  `type` varchar(128) NOT NULL,
  `actionparam` text,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `position` int DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollectoraction` (`fk_emailcollector`,`type`),
  KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`),
  CONSTRAINT `fk_emailcollectoraction_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `llx_emailcollector_emailcollector` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_emailcollector_emailcollectoraction`
--

LOCK TABLES `llx_emailcollector_emailcollectoraction` WRITE;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollectoraction` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollectoraction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_emailcollector_emailcollectorfilter`
--

DROP TABLE IF EXISTS `llx_emailcollector_emailcollectorfilter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_emailcollector_emailcollectorfilter` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_emailcollector` int NOT NULL,
  `type` varchar(128) NOT NULL,
  `rulevalue` varchar(128) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollectorfilter` (`fk_emailcollector`,`type`,`rulevalue`),
  KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`),
  CONSTRAINT `fk_emailcollectorfilter_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `llx_emailcollector_emailcollector` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_emailcollector_emailcollectorfilter`
--

LOCK TABLES `llx_emailcollector_emailcollectorfilter` WRITE;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollectorfilter` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_emailcollector_emailcollectorfilter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_entrepot`
--

DROP TABLE IF EXISTS `llx_entrepot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_entrepot` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entity` int NOT NULL DEFAULT '1',
  `fk_project` int DEFAULT NULL,
  `description` text,
  `lieu` varchar(64) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_departement` int DEFAULT NULL,
  `fk_pays` int DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int DEFAULT NULL,
  `warehouse_usage` int DEFAULT '1',
  `statut` tinyint DEFAULT '1',
  `fk_user_author` int DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_parent` int DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_entrepot_label` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_entrepot`
--

LOCK TABLES `llx_entrepot` WRITE;
/*!40000 ALTER TABLE `llx_entrepot` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_entrepot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_entrepot_extrafields`
--

DROP TABLE IF EXISTS `llx_entrepot_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_entrepot_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_entrepot_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_entrepot_extrafields`
--

LOCK TABLES `llx_entrepot_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_entrepot_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_entrepot_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_establishment`
--

DROP TABLE IF EXISTS `llx_establishment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_establishment` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref` varchar(30) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_state` int DEFAULT '0',
  `fk_country` int DEFAULT '0',
  `profid1` varchar(20) DEFAULT NULL,
  `profid2` varchar(20) DEFAULT NULL,
  `profid3` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fk_user_author` int NOT NULL,
  `fk_user_mod` int DEFAULT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_establishment`
--

LOCK TABLES `llx_establishment` WRITE;
/*!40000 ALTER TABLE `llx_establishment` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_establishment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_event_element`
--

DROP TABLE IF EXISTS `llx_event_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_event_element` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_source` int NOT NULL,
  `fk_target` int NOT NULL,
  `targettype` varchar(32) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_event_element`
--

LOCK TABLES `llx_event_element` WRITE;
/*!40000 ALTER TABLE `llx_event_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_event_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_eventorganization_conferenceorboothattendee`
--

DROP TABLE IF EXISTS `llx_eventorganization_conferenceorboothattendee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_eventorganization_conferenceorboothattendee` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL,
  `fk_soc` int DEFAULT NULL,
  `fk_actioncomm` int DEFAULT NULL,
  `fk_project` int NOT NULL,
  `fk_invoice` int DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `email_company` varchar(128) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `date_subscription` datetime DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `note_public` text,
  `note_private` text,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` smallint NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_eventorganization_conferenceorboothattendee` (`fk_project`,`email`,`fk_actioncomm`),
  KEY `idx_eventorganization_conferenceorboothattendee_rowid` (`rowid`),
  KEY `idx_eventorganization_conferenceorboothattendee_ref` (`ref`),
  KEY `idx_eventorganization_conferenceorboothattendee_fk_soc` (`fk_soc`),
  KEY `idx_eventorganization_conferenceorboothattendee_fk_actioncomm` (`fk_actioncomm`),
  KEY `idx_eventorganization_conferenceorboothattendee_fk_project` (`fk_project`),
  KEY `idx_eventorganization_conferenceorboothattendee_email` (`email`),
  KEY `idx_eventorganization_conferenceorboothattendee_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_eventorganization_conferenceorboothattendee`
--

LOCK TABLES `llx_eventorganization_conferenceorboothattendee` WRITE;
/*!40000 ALTER TABLE `llx_eventorganization_conferenceorboothattendee` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_eventorganization_conferenceorboothattendee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_eventorganization_conferenceorboothattendee_extrafields`
--

DROP TABLE IF EXISTS `llx_eventorganization_conferenceorboothattendee_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_eventorganization_conferenceorboothattendee_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_conferenceorboothattendee_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_eventorganization_conferenceorboothattendee_extrafields`
--

LOCK TABLES `llx_eventorganization_conferenceorboothattendee_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_eventorganization_conferenceorboothattendee_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_eventorganization_conferenceorboothattendee_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_events`
--

DROP TABLE IF EXISTS `llx_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_events` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(32) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `prefix_session` varchar(255) DEFAULT NULL,
  `dateevent` datetime DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `description` varchar(250) NOT NULL,
  `ip` varchar(250) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `fk_object` int DEFAULT NULL,
  `authentication_method` varchar(64) DEFAULT NULL,
  `fk_oauth_token` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_events_dateevent` (`dateevent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_events`
--

LOCK TABLES `llx_events` WRITE;
/*!40000 ALTER TABLE `llx_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expedition`
--

DROP TABLE IF EXISTS `llx_expedition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expedition` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `fk_projet` int DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_expedition` datetime DEFAULT NULL,
  `fk_address` int DEFAULT NULL,
  `fk_shipping_method` int DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `fk_statut` smallint DEFAULT '0',
  `billed` smallint DEFAULT '0',
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_expedition_uk_ref` (`ref`,`entity`),
  KEY `idx_expedition_fk_soc` (`fk_soc`),
  KEY `idx_expedition_fk_user_author` (`fk_user_author`),
  KEY `idx_expedition_fk_user_valid` (`fk_user_valid`),
  KEY `idx_expedition_fk_shipping_method` (`fk_shipping_method`),
  CONSTRAINT `fk_expedition_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `llx_c_shipment_mode` (`rowid`),
  CONSTRAINT `fk_expedition_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_expedition_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_expedition_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expedition`
--

LOCK TABLES `llx_expedition` WRITE;
/*!40000 ALTER TABLE `llx_expedition` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expedition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expedition_extrafields`
--

DROP TABLE IF EXISTS `llx_expedition_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expedition_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_expedition_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expedition_extrafields`
--

LOCK TABLES `llx_expedition_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_expedition_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expedition_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expedition_package`
--

DROP TABLE IF EXISTS `llx_expedition_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expedition_package` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_expedition` int NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `value` double(24,8) DEFAULT '0.00000000',
  `fk_package_type` int DEFAULT NULL,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size` float DEFAULT NULL,
  `size_units` int DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` int DEFAULT NULL,
  `dangerous_goods` smallint DEFAULT '0',
  `tail_lift` smallint DEFAULT '0',
  `rang` int DEFAULT '0',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expedition_package`
--

LOCK TABLES `llx_expedition_package` WRITE;
/*!40000 ALTER TABLE `llx_expedition_package` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expedition_package` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expeditiondet`
--

DROP TABLE IF EXISTS `llx_expeditiondet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expeditiondet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_expedition` int NOT NULL,
  `fk_origin_line` int DEFAULT NULL,
  `fk_entrepot` int DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `rang` int DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_expeditiondet_fk_expedition` (`fk_expedition`),
  KEY `idx_expeditiondet_fk_origin_line` (`fk_origin_line`),
  CONSTRAINT `fk_expeditiondet_fk_expedition` FOREIGN KEY (`fk_expedition`) REFERENCES `llx_expedition` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expeditiondet`
--

LOCK TABLES `llx_expeditiondet` WRITE;
/*!40000 ALTER TABLE `llx_expeditiondet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expeditiondet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expeditiondet_batch`
--

DROP TABLE IF EXISTS `llx_expeditiondet_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expeditiondet_batch` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_expeditiondet` int NOT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `fk_origin_stock` int NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_fk_expeditiondet` (`fk_expeditiondet`),
  CONSTRAINT `fk_expeditiondet_batch_fk_expeditiondet` FOREIGN KEY (`fk_expeditiondet`) REFERENCES `llx_expeditiondet` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expeditiondet_batch`
--

LOCK TABLES `llx_expeditiondet_batch` WRITE;
/*!40000 ALTER TABLE `llx_expeditiondet_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expeditiondet_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expeditiondet_extrafields`
--

DROP TABLE IF EXISTS `llx_expeditiondet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expeditiondet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_expeditiondet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expeditiondet_extrafields`
--

LOCK TABLES `llx_expeditiondet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_expeditiondet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expeditiondet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expensereport`
--

DROP TABLE IF EXISTS `llx_expensereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expensereport` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_number_int` int DEFAULT NULL,
  `ref_ext` int DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `date_create` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_author` int NOT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_user_validator` int DEFAULT NULL,
  `fk_user_approve` int DEFAULT NULL,
  `fk_user_refuse` int DEFAULT NULL,
  `fk_user_cancel` int DEFAULT NULL,
  `fk_statut` int NOT NULL,
  `fk_c_paiement` int DEFAULT NULL,
  `paid` smallint NOT NULL DEFAULT '0',
  `note_public` text,
  `note_private` text,
  `detail_refuse` varchar(255) DEFAULT NULL,
  `detail_cancel` varchar(255) DEFAULT NULL,
  `integration_compta` int DEFAULT NULL,
  `fk_bank_account` int DEFAULT NULL,
  `model_pdf` varchar(50) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_expensereport_uk_ref` (`ref`,`entity`),
  KEY `idx_expensereport_date_debut` (`date_debut`),
  KEY `idx_expensereport_date_fin` (`date_fin`),
  KEY `idx_expensereport_fk_statut` (`fk_statut`),
  KEY `idx_expensereport_fk_user_author` (`fk_user_author`),
  KEY `idx_expensereport_fk_user_valid` (`fk_user_valid`),
  KEY `idx_expensereport_fk_user_approve` (`fk_user_approve`),
  KEY `idx_expensereport_fk_refuse` (`fk_user_approve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport`
--

LOCK TABLES `llx_expensereport` WRITE;
/*!40000 ALTER TABLE `llx_expensereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expensereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expensereport_det`
--

DROP TABLE IF EXISTS `llx_expensereport_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expensereport_det` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_expensereport` int NOT NULL,
  `docnumber` varchar(128) DEFAULT NULL,
  `fk_c_type_fees` int NOT NULL,
  `fk_c_exp_tax_cat` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `comments` text NOT NULL,
  `product_type` int DEFAULT '-1',
  `qty` double NOT NULL,
  `subprice` double(24,8) NOT NULL DEFAULT '0.00000000',
  `value_unit` double(24,8) NOT NULL,
  `remise_percent` double DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `date` date NOT NULL,
  `info_bits` int DEFAULT '0',
  `special_code` int DEFAULT '0',
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_facture` int DEFAULT '0',
  `fk_ecm_files` int DEFAULT NULL,
  `fk_code_ventilation` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `rule_warning_message` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport_det`
--

LOCK TABLES `llx_expensereport_det` WRITE;
/*!40000 ALTER TABLE `llx_expensereport_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expensereport_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expensereport_extrafields`
--

DROP TABLE IF EXISTS `llx_expensereport_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expensereport_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_expensereport_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport_extrafields`
--

LOCK TABLES `llx_expensereport_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_expensereport_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expensereport_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expensereport_ik`
--

DROP TABLE IF EXISTS `llx_expensereport_ik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expensereport_ik` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_c_exp_tax_cat` int NOT NULL DEFAULT '0',
  `fk_range` int NOT NULL DEFAULT '0',
  `coef` double NOT NULL DEFAULT '0',
  `ikoffset` double NOT NULL DEFAULT '0',
  `active` int DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport_ik`
--

LOCK TABLES `llx_expensereport_ik` WRITE;
/*!40000 ALTER TABLE `llx_expensereport_ik` DISABLE KEYS */;
INSERT INTO `llx_expensereport_ik` VALUES
(1,0.41,NULL,4,1,0,1,'2023-11-27 09:34:21'),
(1,0.244,NULL,4,2,824,2,'2023-11-27 09:34:21'),
(1,0.286,NULL,4,3,0,3,'2023-11-27 09:34:21'),
(1,0.493,NULL,5,4,0,4,'2023-11-27 09:34:21'),
(1,0.277,NULL,5,5,1082,5,'2023-11-27 09:34:21'),
(1,0.332,NULL,5,6,0,6,'2023-11-27 09:34:21'),
(1,0.543,NULL,6,7,0,7,'2023-11-27 09:34:21'),
(1,0.305,NULL,6,8,1180,8,'2023-11-27 09:34:21'),
(1,0.364,NULL,6,9,0,9,'2023-11-27 09:34:21'),
(1,0.568,NULL,7,10,0,10,'2023-11-27 09:34:21'),
(1,0.32,NULL,7,11,1244,11,'2023-11-27 09:34:21'),
(1,0.382,NULL,7,12,0,12,'2023-11-27 09:34:21'),
(1,0.595,NULL,8,13,0,13,'2023-11-27 09:34:21'),
(1,0.337,NULL,8,14,1288,14,'2023-11-27 09:34:21'),
(1,0.401,NULL,8,15,0,15,'2023-11-27 09:34:21');
/*!40000 ALTER TABLE `llx_expensereport_ik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_expensereport_rules`
--

DROP TABLE IF EXISTS `llx_expensereport_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_expensereport_rules` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dates` datetime NOT NULL,
  `datee` datetime NOT NULL,
  `amount` double(24,8) NOT NULL,
  `restrictive` tinyint NOT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_usergroup` int DEFAULT NULL,
  `fk_c_type_fees` int NOT NULL,
  `code_expense_rules_type` varchar(50) NOT NULL,
  `is_for_all` tinyint DEFAULT '0',
  `entity` int DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_expensereport_rules`
--

LOCK TABLES `llx_expensereport_rules` WRITE;
/*!40000 ALTER TABLE `llx_expensereport_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_expensereport_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_export_compta`
--

DROP TABLE IF EXISTS `llx_export_compta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_export_compta` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(12) NOT NULL,
  `date_export` datetime NOT NULL,
  `fk_user` int NOT NULL,
  `note` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_export_compta`
--

LOCK TABLES `llx_export_compta` WRITE;
/*!40000 ALTER TABLE `llx_export_compta` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_export_compta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_export_model`
--

DROP TABLE IF EXISTS `llx_export_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_export_model` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '0',
  `fk_user` int NOT NULL DEFAULT '0',
  `label` varchar(50) NOT NULL,
  `type` varchar(64) NOT NULL,
  `field` text NOT NULL,
  `filter` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_export_model` (`label`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_export_model`
--

LOCK TABLES `llx_export_model` WRITE;
/*!40000 ALTER TABLE `llx_export_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_export_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_extrafields`
--

DROP TABLE IF EXISTS `llx_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `elementtype` varchar(64) NOT NULL DEFAULT 'member',
  `label` varchar(255) NOT NULL,
  `type` varchar(8) DEFAULT NULL,
  `size` varchar(8) DEFAULT NULL,
  `fieldcomputed` text,
  `fielddefault` text,
  `fieldunique` int DEFAULT '0',
  `fieldrequired` int DEFAULT '0',
  `perms` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `pos` int DEFAULT '0',
  `alwayseditable` int DEFAULT '0',
  `param` text,
  `list` varchar(255) DEFAULT '1',
  `printable` int DEFAULT '0',
  `totalizable` tinyint(1) DEFAULT '0',
  `langs` varchar(64) DEFAULT NULL,
  `help` text,
  `css` varchar(128) DEFAULT NULL,
  `cssview` varchar(128) DEFAULT NULL,
  `csslist` varchar(128) DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_extrafields_name` (`name`,`entity`,`elementtype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_extrafields`
--

LOCK TABLES `llx_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture`
--

DROP TABLE IF EXISTS `llx_facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `type` smallint NOT NULL DEFAULT '0',
  `subtype` smallint DEFAULT NULL,
  `fk_soc` int NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_closing` datetime DEFAULT NULL,
  `paye` smallint NOT NULL DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `close_code` varchar(16) DEFAULT NULL,
  `close_missing_amount` double(24,8) DEFAULT NULL,
  `close_note` varchar(128) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `revenuestamp` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_statut` smallint NOT NULL DEFAULT '0',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_user_closing` int DEFAULT NULL,
  `module_source` varchar(32) DEFAULT NULL,
  `pos_source` varchar(32) DEFAULT NULL,
  `fk_fac_rec_source` int DEFAULT NULL,
  `fk_facture_source` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `increment` varchar(10) DEFAULT NULL,
  `fk_account` int DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int NOT NULL DEFAULT '1',
  `fk_mode_reglement` int DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `fk_transport_mode` int DEFAULT NULL,
  `prorata_discount` double DEFAULT NULL,
  `situation_cycle_ref` int DEFAULT NULL,
  `situation_counter` smallint DEFAULT NULL,
  `situation_final` smallint DEFAULT NULL,
  `retained_warranty` double DEFAULT NULL,
  `retained_warranty_date_limit` date DEFAULT NULL,
  `retained_warranty_fk_cond_reglement` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_ref` (`ref`,`entity`),
  KEY `idx_facture_fk_soc` (`fk_soc`),
  KEY `idx_facture_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fk_user_valid` (`fk_user_valid`),
  KEY `idx_facture_fk_facture_source` (`fk_facture_source`),
  KEY `idx_facture_fk_projet` (`fk_projet`),
  KEY `idx_facture_fk_account` (`fk_account`),
  KEY `idx_facture_fk_currency` (`fk_currency`),
  KEY `idx_facture_fk_statut` (`fk_statut`),
  KEY `idx_facture_datef` (`datef`),
  CONSTRAINT `fk_facture_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_facture_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_facture_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture`
--

LOCK TABLES `llx_facture` WRITE;
/*!40000 ALTER TABLE `llx_facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_extrafields`
--

LOCK TABLES `llx_facture_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn`
--

DROP TABLE IF EXISTS `llx_facture_fourn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(180) NOT NULL,
  `ref_supplier` varchar(180) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `type` smallint NOT NULL DEFAULT '0',
  `fk_soc` int NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_closing` datetime DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `paye` smallint NOT NULL DEFAULT '0',
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `remise` double(24,8) DEFAULT '0.00000000',
  `close_code` varchar(16) DEFAULT NULL,
  `close_missing_amount` double(24,8) DEFAULT NULL,
  `close_note` varchar(128) DEFAULT NULL,
  `vat_reverse_charge` tinyint DEFAULT '0',
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_statut` smallint NOT NULL DEFAULT '0',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_user_closing` int DEFAULT NULL,
  `fk_fac_rec_source` int DEFAULT NULL,
  `fk_facture_source` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `fk_account` int DEFAULT NULL,
  `fk_cond_reglement` int DEFAULT NULL,
  `fk_mode_reglement` int DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `fk_transport_mode` int DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_fourn_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_facture_fourn_ref_supplier` (`ref_supplier`,`fk_soc`,`entity`),
  KEY `idx_facture_fourn_date_lim_reglement` (`date_lim_reglement`),
  KEY `idx_facture_fourn_fk_soc` (`fk_soc`),
  KEY `idx_facture_fourn_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fourn_fk_user_valid` (`fk_user_valid`),
  KEY `idx_facture_fourn_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_facture_fourn_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn`
--

LOCK TABLES `llx_facture_fourn` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn_det`
--

DROP TABLE IF EXISTS `llx_facture_fourn_det`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn_det` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_facture_fourn` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `ref` varchar(128) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `pu_ht` double(24,8) DEFAULT NULL,
  `pu_ttc` double(24,8) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `fk_remise_except` int DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `fk_code_ventilation` int NOT NULL DEFAULT '0',
  `special_code` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `fk_unit` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture_fourn`),
  KEY `idx_facture_fourn_det_fk_facture` (`fk_facture_fourn`),
  KEY `idx_facture_fourn_det_fk_product` (`fk_product`),
  KEY `idx_facture_fourn_det_fk_code_ventilation` (`fk_code_ventilation`),
  KEY `fk_facture_fourn_det_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facture_fourn_det_fk_facture` FOREIGN KEY (`fk_facture_fourn`) REFERENCES `llx_facture_fourn` (`rowid`),
  CONSTRAINT `fk_facture_fourn_det_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_det`
--

LOCK TABLES `llx_facture_fourn_det` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_det` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_det` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn_det_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_fourn_det_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn_det_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_fourn_det_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_det_extrafields`
--

LOCK TABLES `llx_facture_fourn_det_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_det_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_det_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn_det_rec`
--

DROP TABLE IF EXISTS `llx_facture_fourn_det_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn_det_rec` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_facture_fourn` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `pu_ht` double(24,8) DEFAULT NULL,
  `pu_ttc` double(24,8) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `fk_remise_except` int DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int DEFAULT '0',
  `date_start` int DEFAULT NULL,
  `date_end` int DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `special_code` int unsigned DEFAULT '0',
  `rang` int DEFAULT '0',
  `fk_unit` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `fk_facture_fourn_det_rec_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facture_fourn_det_rec_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_det_rec`
--

LOCK TABLES `llx_facture_fourn_det_rec` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_det_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_det_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn_det_rec_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_fourn_det_rec_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn_det_rec_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `llx_facture_fourn_det_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_det_rec_extrafields`
--

LOCK TABLES `llx_facture_fourn_det_rec_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_det_rec_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_det_rec_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_fourn_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_fourn_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_extrafields`
--

LOCK TABLES `llx_facture_fourn_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn_rec`
--

DROP TABLE IF EXISTS `llx_facture_fourn_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn_rec` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `ref_supplier` varchar(180) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `suspended` int DEFAULT '0',
  `libelle` varchar(255) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `remise` double DEFAULT '0',
  `vat_src_code` varchar(10) DEFAULT '',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `fk_account` int DEFAULT NULL,
  `fk_cond_reglement` int DEFAULT NULL,
  `fk_mode_reglement` int DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `modelpdf` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `usenewprice` int DEFAULT '0',
  `frequency` int DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int DEFAULT NULL,
  `nb_gen_max` int DEFAULT NULL,
  `auto_validate` int DEFAULT '0',
  `generate_pdf` int DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_fourn_rec_ref` (`titre`,`entity`),
  KEY `idx_facture_fourn_rec_fk_soc` (`fk_soc`),
  KEY `idx_facture_fourn_rec_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fourn_rec_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_facture_fourn_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_fourn_rec_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_fourn_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_rec`
--

LOCK TABLES `llx_facture_fourn_rec` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_fourn_rec_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_fourn_rec_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_fourn_rec_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_fourn_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_fourn_rec_extrafields`
--

LOCK TABLES `llx_facture_fourn_rec_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_fourn_rec_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_fourn_rec_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_rec`
--

DROP TABLE IF EXISTS `llx_facture_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_rec` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `suspended` int DEFAULT '0',
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `remise` double DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `vat_src_code` varchar(10) DEFAULT '',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `revenuestamp` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `fk_cond_reglement` int NOT NULL DEFAULT '1',
  `fk_mode_reglement` int DEFAULT '0',
  `date_lim_reglement` date DEFAULT NULL,
  `fk_account` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `modelpdf` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `usenewprice` int DEFAULT '0',
  `frequency` int DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int DEFAULT NULL,
  `nb_gen_max` int DEFAULT NULL,
  `auto_validate` int DEFAULT '0',
  `generate_pdf` int DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_facture_rec_uk_titre` (`titre`,`entity`),
  KEY `idx_facture_rec_fk_soc` (`fk_soc`),
  KEY `idx_facture_rec_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_rec_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_facture_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_rec_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_rec`
--

LOCK TABLES `llx_facture_rec` WRITE;
/*!40000 ALTER TABLE `llx_facture_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facture_rec_extrafields`
--

DROP TABLE IF EXISTS `llx_facture_rec_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facture_rec_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facture_rec_extrafields`
--

LOCK TABLES `llx_facture_rec_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facture_rec_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facture_rec_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facturedet`
--

DROP TABLE IF EXISTS `llx_facturedet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facturedet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_facture` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `fk_remise_except` int DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int DEFAULT NULL,
  `special_code` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `fk_contract_line` int DEFAULT NULL,
  `fk_unit` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_code_ventilation` int NOT NULL DEFAULT '0',
  `situation_percent` double DEFAULT '100',
  `fk_prev_id` int DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `ref_ext` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture`),
  KEY `idx_facturedet_fk_facture` (`fk_facture`),
  KEY `idx_facturedet_fk_product` (`fk_product`),
  KEY `idx_facturedet_fk_code_ventilation` (`fk_code_ventilation`),
  KEY `fk_facturedet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facturedet_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_facturedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facturedet`
--

LOCK TABLES `llx_facturedet` WRITE;
/*!40000 ALTER TABLE `llx_facturedet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facturedet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facturedet_extrafields`
--

DROP TABLE IF EXISTS `llx_facturedet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facturedet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facturedet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facturedet_extrafields`
--

LOCK TABLES `llx_facturedet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facturedet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facturedet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facturedet_rec`
--

DROP TABLE IF EXISTS `llx_facturedet_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facturedet_rec` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_facture` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `product_type` int DEFAULT '0',
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT NULL,
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `date_start_fill` int DEFAULT '0',
  `date_end_fill` int DEFAULT '0',
  `info_bits` int DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int DEFAULT NULL,
  `special_code` int unsigned DEFAULT '0',
  `rang` int DEFAULT '0',
  `fk_contract_line` int DEFAULT NULL,
  `fk_unit` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `fk_facturedet_rec_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facturedet_rec_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facturedet_rec`
--

LOCK TABLES `llx_facturedet_rec` WRITE;
/*!40000 ALTER TABLE `llx_facturedet_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facturedet_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_facturedet_rec_extrafields`
--

DROP TABLE IF EXISTS `llx_facturedet_rec_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_facturedet_rec_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facturedet_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_facturedet_rec_extrafields`
--

LOCK TABLES `llx_facturedet_rec_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_facturedet_rec_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_facturedet_rec_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_fichinter`
--

DROP TABLE IF EXISTS `llx_fichinter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_fichinter` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_soc` int NOT NULL,
  `fk_projet` int DEFAULT '0',
  `fk_contrat` int DEFAULT '0',
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `datei` date DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_statut` smallint DEFAULT '0',
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `datet` date DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fichinter_ref` (`ref`,`entity`),
  KEY `idx_fichinter_fk_soc` (`fk_soc`),
  CONSTRAINT `fk_fichinter_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinter`
--

LOCK TABLES `llx_fichinter` WRITE;
/*!40000 ALTER TABLE `llx_fichinter` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_fichinter_extrafields`
--

DROP TABLE IF EXISTS `llx_fichinter_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_fichinter_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ficheinter_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinter_extrafields`
--

LOCK TABLES `llx_fichinter_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_fichinter_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinter_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_fichinter_rec`
--

DROP TABLE IF EXISTS `llx_fichinter_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_fichinter_rec` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_contrat` int DEFAULT '0',
  `fk_user_author` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text,
  `modelpdf` varchar(50) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `frequency` int DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int DEFAULT NULL,
  `nb_gen_max` int DEFAULT NULL,
  `auto_validate` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_fichinter_rec_uk_titre` (`titre`,`entity`),
  KEY `idx_fichinter_rec_fk_soc` (`fk_soc`),
  KEY `idx_fichinter_rec_fk_user_author` (`fk_user_author`),
  KEY `idx_fichinter_rec_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_fichinter_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_fichinter_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinter_rec`
--

LOCK TABLES `llx_fichinter_rec` WRITE;
/*!40000 ALTER TABLE `llx_fichinter_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinter_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_fichinterdet`
--

DROP TABLE IF EXISTS `llx_fichinterdet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_fichinterdet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_fichinter` int DEFAULT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` text,
  `duree` int DEFAULT NULL,
  `rang` int DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_fichinterdet_fk_fichinter` (`fk_fichinter`),
  CONSTRAINT `fk_fichinterdet_fk_fichinter` FOREIGN KEY (`fk_fichinter`) REFERENCES `llx_fichinter` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinterdet`
--

LOCK TABLES `llx_fichinterdet` WRITE;
/*!40000 ALTER TABLE `llx_fichinterdet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinterdet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_fichinterdet_extrafields`
--

DROP TABLE IF EXISTS `llx_fichinterdet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_fichinterdet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ficheinterdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinterdet_extrafields`
--

LOCK TABLES `llx_fichinterdet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_fichinterdet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinterdet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_fichinterdet_rec`
--

DROP TABLE IF EXISTS `llx_fichinterdet_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_fichinterdet_rec` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_fichinter` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` text,
  `duree` int DEFAULT NULL,
  `rang` int DEFAULT '0',
  `total_ht` double(24,8) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(1) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(1) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `fk_remise_except` int DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int DEFAULT NULL,
  `fk_code_ventilation` int NOT NULL DEFAULT '0',
  `special_code` int unsigned DEFAULT '0',
  `fk_unit` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_fichinterdet_rec`
--

LOCK TABLES `llx_fichinterdet_rec` WRITE;
/*!40000 ALTER TABLE `llx_fichinterdet_rec` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_fichinterdet_rec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_holiday`
--

DROP TABLE IF EXISTS `llx_holiday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_holiday` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_user` int NOT NULL,
  `fk_user_create` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_type` int NOT NULL,
  `date_create` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `halfday` int DEFAULT '0',
  `nb_open_day` double(24,8) DEFAULT NULL,
  `statut` int NOT NULL DEFAULT '1',
  `fk_validator` int NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `date_approval` datetime DEFAULT NULL,
  `fk_user_approve` int DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `fk_user_refuse` int DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `fk_user_cancel` int DEFAULT NULL,
  `detail_refuse` varchar(250) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_holiday_entity` (`entity`),
  KEY `idx_holiday_fk_user` (`fk_user`),
  KEY `idx_holiday_fk_user_create` (`fk_user_create`),
  KEY `idx_holiday_date_create` (`date_create`),
  KEY `idx_holiday_date_debut` (`date_debut`),
  KEY `idx_holiday_date_fin` (`date_fin`),
  KEY `idx_holiday_fk_validator` (`fk_validator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday`
--

LOCK TABLES `llx_holiday` WRITE;
/*!40000 ALTER TABLE `llx_holiday` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_holiday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_holiday_config`
--

DROP TABLE IF EXISTS `llx_holiday_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_holiday_config` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `value` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_holiday_config` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday_config`
--

LOCK TABLES `llx_holiday_config` WRITE;
/*!40000 ALTER TABLE `llx_holiday_config` DISABLE KEYS */;
INSERT INTO `llx_holiday_config` VALUES
('lastUpdate',1,NULL);
/*!40000 ALTER TABLE `llx_holiday_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_holiday_extrafields`
--

DROP TABLE IF EXISTS `llx_holiday_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_holiday_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_holiday_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday_extrafields`
--

LOCK TABLES `llx_holiday_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_holiday_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_holiday_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_holiday_logs`
--

DROP TABLE IF EXISTS `llx_holiday_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_holiday_logs` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `date_action` datetime NOT NULL,
  `fk_user_action` int NOT NULL,
  `fk_user_update` int NOT NULL,
  `fk_type` int NOT NULL,
  `type_action` varchar(255) NOT NULL,
  `prev_solde` varchar(255) NOT NULL,
  `new_solde` varchar(255) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday_logs`
--

LOCK TABLES `llx_holiday_logs` WRITE;
/*!40000 ALTER TABLE `llx_holiday_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_holiday_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_holiday_users`
--

DROP TABLE IF EXISTS `llx_holiday_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_holiday_users` (
  `fk_user` int NOT NULL,
  `fk_type` int NOT NULL,
  `nb_holiday` double NOT NULL DEFAULT '0',
  UNIQUE KEY `uk_holiday_users` (`fk_user`,`fk_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_holiday_users`
--

LOCK TABLES `llx_holiday_users` WRITE;
/*!40000 ALTER TABLE `llx_holiday_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_holiday_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_import_model`
--

DROP TABLE IF EXISTS `llx_import_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_import_model` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '0',
  `fk_user` int NOT NULL DEFAULT '0',
  `label` varchar(50) NOT NULL,
  `type` varchar(64) NOT NULL,
  `field` text NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_import_model` (`label`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_import_model`
--

LOCK TABLES `llx_import_model` WRITE;
/*!40000 ALTER TABLE `llx_import_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_import_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_links`
--

DROP TABLE IF EXISTS `llx_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_links` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `datea` datetime NOT NULL,
  `url` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `objecttype` varchar(255) NOT NULL,
  `objectid` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_links` (`objectid`,`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_links`
--

LOCK TABLES `llx_links` WRITE;
/*!40000 ALTER TABLE `llx_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_localtax`
--

DROP TABLE IF EXISTS `llx_localtax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_localtax` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `localtaxtype` tinyint DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `note` text,
  `fk_bank` int DEFAULT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_localtax`
--

LOCK TABLES `llx_localtax` WRITE;
/*!40000 ALTER TABLE `llx_localtax` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_localtax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_mailing_unsubscribe`
--

DROP TABLE IF EXISTS `llx_mailing_unsubscribe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_mailing_unsubscribe` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `email` varchar(255) DEFAULT NULL,
  `unsubscribegroup` varchar(128) DEFAULT '',
  `ip` varchar(128) DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_mailing_unsubscribe` (`email`,`entity`,`unsubscribegroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mailing_unsubscribe`
--

LOCK TABLES `llx_mailing_unsubscribe` WRITE;
/*!40000 ALTER TABLE `llx_mailing_unsubscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mailing_unsubscribe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_menu`
--

DROP TABLE IF EXISTS `llx_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_menu` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `menu_handler` varchar(16) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `module` varchar(255) DEFAULT NULL,
  `type` varchar(4) NOT NULL,
  `mainmenu` varchar(100) NOT NULL,
  `leftmenu` varchar(100) DEFAULT NULL,
  `fk_menu` int NOT NULL,
  `fk_mainmenu` varchar(100) DEFAULT NULL,
  `fk_leftmenu` varchar(100) DEFAULT NULL,
  `position` int NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(100) DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `prefix` varchar(255) DEFAULT NULL,
  `langs` varchar(100) DEFAULT NULL,
  `level` smallint DEFAULT NULL,
  `perms` text,
  `enabled` text,
  `usertype` int NOT NULL DEFAULT '0',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_menu_uk_menu` (`menu_handler`,`fk_menu`,`position`,`url`,`entity`),
  KEY `idx_menu_menuhandler_type` (`menu_handler`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_menu`
--

LOCK TABLES `llx_menu` WRITE;
/*!40000 ALTER TABLE `llx_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_mrp_mo`
--

DROP TABLE IF EXISTS `llx_mrp_mo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_mrp_mo` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `mrptype` int DEFAULT '0',
  `label` varchar(255) DEFAULT NULL,
  `qty` double NOT NULL,
  `fk_warehouse` int DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `note_public` text,
  `note_private` text,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` int NOT NULL,
  `fk_product` int NOT NULL,
  `date_start_planned` datetime DEFAULT NULL,
  `date_end_planned` datetime DEFAULT NULL,
  `fk_bom` int DEFAULT NULL,
  `fk_project` int DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_parent_line` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_mrp_mo_ref` (`ref`),
  KEY `idx_mrp_mo_entity` (`entity`),
  KEY `idx_mrp_mo_fk_soc` (`fk_soc`),
  KEY `fk_mrp_mo_fk_user_creat` (`fk_user_creat`),
  KEY `idx_mrp_mo_status` (`status`),
  KEY `idx_mrp_mo_fk_product` (`fk_product`),
  KEY `idx_mrp_mo_date_start_planned` (`date_start_planned`),
  KEY `idx_mrp_mo_date_end_planned` (`date_end_planned`),
  KEY `idx_mrp_mo_fk_bom` (`fk_bom`),
  KEY `idx_mrp_mo_fk_project` (`fk_project`),
  CONSTRAINT `fk_mrp_mo_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mrp_mo`
--

LOCK TABLES `llx_mrp_mo` WRITE;
/*!40000 ALTER TABLE `llx_mrp_mo` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mrp_mo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_mrp_mo_extrafields`
--

DROP TABLE IF EXISTS `llx_mrp_mo_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_mrp_mo_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_mrp_mo_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mrp_mo_extrafields`
--

LOCK TABLES `llx_mrp_mo_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_mrp_mo_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mrp_mo_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_mrp_production`
--

DROP TABLE IF EXISTS `llx_mrp_production`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_mrp_production` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_mo` int NOT NULL,
  `origin_id` int DEFAULT NULL,
  `origin_type` varchar(10) DEFAULT NULL,
  `position` int NOT NULL DEFAULT '0',
  `fk_product` int NOT NULL,
  `fk_warehouse` int DEFAULT NULL,
  `qty` double NOT NULL DEFAULT '1',
  `qty_frozen` smallint DEFAULT '0',
  `disable_stock_change` smallint DEFAULT '0',
  `batch` varchar(128) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  `fk_mrp_production` int DEFAULT NULL,
  `fk_stock_movement` int DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_default_workstation` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `fk_mrp_production_product` (`fk_product`),
  KEY `fk_mrp_production_stock_movement` (`fk_stock_movement`),
  KEY `idx_mrp_production_fk_mo` (`fk_mo`),
  CONSTRAINT `fk_mrp_production_mo` FOREIGN KEY (`fk_mo`) REFERENCES `llx_mrp_mo` (`rowid`),
  CONSTRAINT `fk_mrp_production_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_mrp_production_stock_movement` FOREIGN KEY (`fk_stock_movement`) REFERENCES `llx_stock_mouvement` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_mrp_production`
--

LOCK TABLES `llx_mrp_production` WRITE;
/*!40000 ALTER TABLE `llx_mrp_production` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_mrp_production` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_multicurrency`
--

DROP TABLE IF EXISTS `llx_multicurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_multicurrency` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `date_create` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entity` int DEFAULT '1',
  `fk_user` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_multicurrency`
--

LOCK TABLES `llx_multicurrency` WRITE;
/*!40000 ALTER TABLE `llx_multicurrency` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_multicurrency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_multicurrency_rate`
--

DROP TABLE IF EXISTS `llx_multicurrency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_multicurrency_rate` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `date_sync` datetime DEFAULT NULL,
  `rate` double NOT NULL DEFAULT '0',
  `fk_multicurrency` int NOT NULL,
  `entity` int DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_multicurrency_rate`
--

LOCK TABLES `llx_multicurrency_rate` WRITE;
/*!40000 ALTER TABLE `llx_multicurrency_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_multicurrency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_notify`
--

DROP TABLE IF EXISTS `llx_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_notify` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `daten` datetime DEFAULT NULL,
  `fk_action` int NOT NULL,
  `fk_soc` int DEFAULT NULL,
  `fk_contact` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `type` varchar(16) DEFAULT 'email',
  `type_target` varchar(16) DEFAULT NULL,
  `objet_type` varchar(24) NOT NULL,
  `objet_id` int NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_notify`
--

LOCK TABLES `llx_notify` WRITE;
/*!40000 ALTER TABLE `llx_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_notify_def`
--

DROP TABLE IF EXISTS `llx_notify_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_notify_def` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` date DEFAULT NULL,
  `fk_action` int NOT NULL,
  `fk_soc` int DEFAULT NULL,
  `fk_contact` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `threshold` double(24,8) DEFAULT NULL,
  `context` varchar(128) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'email',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_notify_def`
--

LOCK TABLES `llx_notify_def` WRITE;
/*!40000 ALTER TABLE `llx_notify_def` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_notify_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_notify_def_object`
--

DROP TABLE IF EXISTS `llx_notify_def_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_notify_def_object` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `objet_type` varchar(16) DEFAULT NULL,
  `objet_id` int NOT NULL,
  `type_notif` varchar(16) DEFAULT 'browser',
  `date_notif` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `moreparam` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_notify_def_object`
--

LOCK TABLES `llx_notify_def_object` WRITE;
/*!40000 ALTER TABLE `llx_notify_def_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_notify_def_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_oauth_state`
--

DROP TABLE IF EXISTS `llx_oauth_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_oauth_state` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `service` varchar(36) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_adherent` int DEFAULT NULL,
  `entity` int DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_oauth_state`
--

LOCK TABLES `llx_oauth_state` WRITE;
/*!40000 ALTER TABLE `llx_oauth_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_oauth_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_oauth_token`
--

DROP TABLE IF EXISTS `llx_oauth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_oauth_token` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `service` varchar(36) DEFAULT NULL,
  `token` text,
  `tokenstring` text,
  `state` text,
  `fk_soc` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_adherent` int DEFAULT NULL,
  `restricted_ips` varchar(200) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entity` int DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_oauth_token`
--

LOCK TABLES `llx_oauth_token` WRITE;
/*!40000 ALTER TABLE `llx_oauth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_oauth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_object_lang`
--

DROP TABLE IF EXISTS `llx_object_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_object_lang` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_object` int NOT NULL DEFAULT '0',
  `type_object` varchar(32) NOT NULL,
  `property` varchar(32) NOT NULL,
  `lang` varchar(5) NOT NULL DEFAULT '',
  `value` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_object_lang` (`fk_object`,`type_object`,`property`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_object_lang`
--

LOCK TABLES `llx_object_lang` WRITE;
/*!40000 ALTER TABLE `llx_object_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_object_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_onlinesignature`
--

DROP TABLE IF EXISTS `llx_onlinesignature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_onlinesignature` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `object_type` varchar(32) NOT NULL,
  `object_id` int NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `pathoffile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_onlinesignature`
--

LOCK TABLES `llx_onlinesignature` WRITE;
/*!40000 ALTER TABLE `llx_onlinesignature` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_onlinesignature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_overwrite_trans`
--

DROP TABLE IF EXISTS `llx_overwrite_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_overwrite_trans` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `lang` varchar(5) DEFAULT NULL,
  `transkey` varchar(128) DEFAULT NULL,
  `transvalue` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_overwrite_trans` (`entity`,`lang`,`transkey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_overwrite_trans`
--

LOCK TABLES `llx_overwrite_trans` WRITE;
/*!40000 ALTER TABLE `llx_overwrite_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_overwrite_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_paiement`
--

DROP TABLE IF EXISTS `llx_paiement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_paiement` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `multicurrency_amount` double(24,8) DEFAULT '0.00000000',
  `fk_paiement` int NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text,
  `ext_payment_id` varchar(255) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  `fk_bank` int NOT NULL DEFAULT '0',
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `statut` smallint NOT NULL DEFAULT '0',
  `fk_export_compta` int NOT NULL DEFAULT '0',
  `pos_change` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiement`
--

LOCK TABLES `llx_paiement` WRITE;
/*!40000 ALTER TABLE `llx_paiement` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_paiement_facture`
--

DROP TABLE IF EXISTS `llx_paiement_facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_paiement_facture` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_paiement` int DEFAULT NULL,
  `fk_facture` int DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_amount` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_paiement_facture` (`fk_paiement`,`fk_facture`),
  KEY `idx_paiement_facture_fk_facture` (`fk_facture`),
  KEY `idx_paiement_facture_fk_paiement` (`fk_paiement`),
  CONSTRAINT `fk_paiement_facture_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_paiement_facture_fk_paiement` FOREIGN KEY (`fk_paiement`) REFERENCES `llx_paiement` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiement_facture`
--

LOCK TABLES `llx_paiement_facture` WRITE;
/*!40000 ALTER TABLE `llx_paiement_facture` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiement_facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_paiementcharge`
--

DROP TABLE IF EXISTS `llx_paiementcharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_paiementcharge` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_charge` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `fk_typepaiement` int NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int NOT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiementcharge`
--

LOCK TABLES `llx_paiementcharge` WRITE;
/*!40000 ALTER TABLE `llx_paiementcharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiementcharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_paiementfourn`
--

DROP TABLE IF EXISTS `llx_paiementfourn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_paiementfourn` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int DEFAULT '1',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `multicurrency_amount` double(24,8) DEFAULT '0.00000000',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_paiement` int NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int NOT NULL,
  `statut` smallint NOT NULL DEFAULT '0',
  `model_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiementfourn`
--

LOCK TABLES `llx_paiementfourn` WRITE;
/*!40000 ALTER TABLE `llx_paiementfourn` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiementfourn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_paiementfourn_facturefourn`
--

DROP TABLE IF EXISTS `llx_paiementfourn_facturefourn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_paiementfourn_facturefourn` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_paiementfourn` int DEFAULT NULL,
  `fk_facturefourn` int DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_amount` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_paiementfourn_facturefourn` (`fk_paiementfourn`,`fk_facturefourn`),
  KEY `idx_paiementfourn_facturefourn_fk_facture` (`fk_facturefourn`),
  KEY `idx_paiementfourn_facturefourn_fk_paiement` (`fk_paiementfourn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_paiementfourn_facturefourn`
--

LOCK TABLES `llx_paiementfourn_facturefourn` WRITE;
/*!40000 ALTER TABLE `llx_paiementfourn_facturefourn` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_paiementfourn_facturefourn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_payment_donation`
--

DROP TABLE IF EXISTS `llx_payment_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_payment_donation` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_donation` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `fk_typepayment` int NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note` text,
  `ext_payment_id` varchar(255) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  `fk_bank` int NOT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_donation`
--

LOCK TABLES `llx_payment_donation` WRITE;
/*!40000 ALTER TABLE `llx_payment_donation` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_donation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_payment_expensereport`
--

DROP TABLE IF EXISTS `llx_payment_expensereport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_payment_expensereport` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_expensereport` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `fk_typepayment` int NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int NOT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_expensereport`
--

LOCK TABLES `llx_payment_expensereport` WRITE;
/*!40000 ALTER TABLE `llx_payment_expensereport` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_expensereport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_payment_loan`
--

DROP TABLE IF EXISTS `llx_payment_loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_payment_loan` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_loan` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount_capital` double(24,8) DEFAULT '0.00000000',
  `amount_insurance` double(24,8) DEFAULT '0.00000000',
  `amount_interest` double(24,8) DEFAULT '0.00000000',
  `fk_typepayment` int NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `fk_bank` int NOT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_loan`
--

LOCK TABLES `llx_payment_loan` WRITE;
/*!40000 ALTER TABLE `llx_payment_loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_payment_salary`
--

DROP TABLE IF EXISTS `llx_payment_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_payment_salary` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `datep` datetime DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `fk_projet` int DEFAULT NULL,
  `fk_typepayment` int NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `note` text,
  `fk_bank` int DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_salary` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_payment_salary_ref` (`num_payment`),
  KEY `idx_payment_salary_user` (`fk_user`,`entity`),
  KEY `idx_payment_salary_datep` (`datep`),
  KEY `idx_payment_salary_datesp` (`datesp`),
  KEY `idx_payment_salary_dateep` (`dateep`),
  CONSTRAINT `fk_payment_salary_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_salary`
--

LOCK TABLES `llx_payment_salary` WRITE;
/*!40000 ALTER TABLE `llx_payment_salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_payment_various`
--

DROP TABLE IF EXISTS `llx_payment_various`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_payment_various` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `sens` smallint NOT NULL DEFAULT '0',
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `fk_typepayment` int NOT NULL,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `note` text,
  `fk_bank` int DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_various`
--

LOCK TABLES `llx_payment_various` WRITE;
/*!40000 ALTER TABLE `llx_payment_various` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_various` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_payment_vat`
--

DROP TABLE IF EXISTS `llx_payment_vat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_payment_vat` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_tva` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `fk_typepaiement` int NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int NOT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_payment_vat`
--

LOCK TABLES `llx_payment_vat` WRITE;
/*!40000 ALTER TABLE `llx_payment_vat` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_payment_vat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_pos_cash_fence`
--

DROP TABLE IF EXISTS `llx_pos_cash_fence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_pos_cash_fence` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref` varchar(64) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `opening` double(24,8) DEFAULT '0.00000000',
  `cash` double(24,8) DEFAULT '0.00000000',
  `card` double(24,8) DEFAULT '0.00000000',
  `cheque` double(24,8) DEFAULT '0.00000000',
  `status` int DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `day_close` int DEFAULT NULL,
  `month_close` int DEFAULT NULL,
  `year_close` int DEFAULT NULL,
  `posmodule` varchar(30) DEFAULT NULL,
  `posnumber` varchar(30) DEFAULT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `tms` timestamp NULL DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_pos_cash_fence`
--

LOCK TABLES `llx_pos_cash_fence` WRITE;
/*!40000 ALTER TABLE `llx_pos_cash_fence` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_pos_cash_fence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_prelevement`
--

DROP TABLE IF EXISTS `llx_prelevement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_prelevement` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_facture` int DEFAULT NULL,
  `fk_facture_fourn` int DEFAULT NULL,
  `fk_salary` int DEFAULT NULL,
  `fk_prelevement_lignes` int NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_fk_prelevement_lignes` (`fk_prelevement_lignes`),
  CONSTRAINT `fk_prelevement_fk_prelevement_lignes` FOREIGN KEY (`fk_prelevement_lignes`) REFERENCES `llx_prelevement_lignes` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement`
--

LOCK TABLES `llx_prelevement` WRITE;
/*!40000 ALTER TABLE `llx_prelevement` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_prelevement_bons`
--

DROP TABLE IF EXISTS `llx_prelevement_bons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_prelevement_bons` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `type` varchar(16) DEFAULT 'debit-order',
  `ref` varchar(12) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `statut` smallint DEFAULT '0',
  `credite` smallint DEFAULT '0',
  `note` text,
  `date_trans` datetime DEFAULT NULL,
  `method_trans` smallint DEFAULT NULL,
  `fk_user_trans` int DEFAULT NULL,
  `date_credit` datetime DEFAULT NULL,
  `fk_user_credit` int DEFAULT NULL,
  `fk_bank_account` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_prelevement_bons_ref` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement_bons`
--

LOCK TABLES `llx_prelevement_bons` WRITE;
/*!40000 ALTER TABLE `llx_prelevement_bons` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement_bons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_prelevement_demande`
--

DROP TABLE IF EXISTS `llx_prelevement_demande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_prelevement_demande` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_facture` int DEFAULT NULL,
  `fk_facture_fourn` int DEFAULT NULL,
  `fk_salary` int DEFAULT NULL,
  `sourcetype` varchar(32) DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `date_demande` datetime NOT NULL,
  `traite` smallint DEFAULT '0',
  `date_traite` datetime DEFAULT NULL,
  `fk_prelevement_bons` int DEFAULT NULL,
  `fk_user_demande` int NOT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `type` varchar(12) DEFAULT '',
  `ext_payment_id` varchar(255) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_demande_fk_facture` (`fk_facture`),
  KEY `idx_prelevement_demande_fk_facture_fourn` (`fk_facture_fourn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement_demande`
--

LOCK TABLES `llx_prelevement_demande` WRITE;
/*!40000 ALTER TABLE `llx_prelevement_demande` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement_demande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_prelevement_lignes`
--

DROP TABLE IF EXISTS `llx_prelevement_lignes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_prelevement_lignes` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_prelevement_bons` int DEFAULT NULL,
  `fk_soc` int NOT NULL,
  `statut` smallint DEFAULT '0',
  `client_nom` varchar(255) DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_lignes_fk_prelevement_bons` (`fk_prelevement_bons`),
  CONSTRAINT `fk_prelevement_lignes_fk_prelevement_bons` FOREIGN KEY (`fk_prelevement_bons`) REFERENCES `llx_prelevement_bons` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement_lignes`
--

LOCK TABLES `llx_prelevement_lignes` WRITE;
/*!40000 ALTER TABLE `llx_prelevement_lignes` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement_lignes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_prelevement_rejet`
--

DROP TABLE IF EXISTS `llx_prelevement_rejet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_prelevement_rejet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_prelevement_lignes` int DEFAULT NULL,
  `date_rejet` datetime DEFAULT NULL,
  `motif` int DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_creation` int DEFAULT NULL,
  `note` text,
  `afacturer` tinyint DEFAULT '0',
  `fk_facture` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_prelevement_rejet`
--

LOCK TABLES `llx_prelevement_rejet` WRITE;
/*!40000 ALTER TABLE `llx_prelevement_rejet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_prelevement_rejet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_printing`
--

DROP TABLE IF EXISTS `llx_printing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_printing` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `printer_name` text NOT NULL,
  `printer_location` text NOT NULL,
  `printer_id` varchar(255) NOT NULL,
  `copy` int NOT NULL DEFAULT '1',
  `module` varchar(16) NOT NULL,
  `driver` varchar(16) NOT NULL,
  `userid` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_printing`
--

LOCK TABLES `llx_printing` WRITE;
/*!40000 ALTER TABLE `llx_printing` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_printing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product`
--

DROP TABLE IF EXISTS `llx_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(128) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_parent` int DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  `note_public` text,
  `note` text,
  `customcode` varchar(32) DEFAULT NULL,
  `fk_country` int DEFAULT NULL,
  `fk_state` int DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `price_ttc` double(24,8) DEFAULT '0.00000000',
  `price_min` double(24,8) DEFAULT '0.00000000',
  `price_min_ttc` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `cost_price` double(24,8) DEFAULT NULL,
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(7,4) DEFAULT NULL,
  `recuperableonly` int NOT NULL DEFAULT '0',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `tosell` tinyint DEFAULT '1',
  `tobuy` tinyint DEFAULT '1',
  `onportal` tinyint DEFAULT '0',
  `tobatch` tinyint NOT NULL DEFAULT '0',
  `sell_or_eat_by_mandatory` tinyint NOT NULL DEFAULT '0',
  `batch_mask` varchar(32) DEFAULT NULL,
  `fk_product_type` int DEFAULT '0',
  `duration` varchar(6) DEFAULT NULL,
  `seuil_stock_alerte` float DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int DEFAULT NULL,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_export` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  `accountancy_code_buy_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_buy_export` varchar(32) DEFAULT NULL,
  `partnumber` varchar(32) DEFAULT NULL,
  `net_measure` float DEFAULT NULL,
  `net_measure_units` tinyint DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` tinyint DEFAULT NULL,
  `length` float DEFAULT NULL,
  `length_units` tinyint DEFAULT NULL,
  `width` float DEFAULT NULL,
  `width_units` tinyint DEFAULT NULL,
  `height` float DEFAULT NULL,
  `height_units` tinyint DEFAULT NULL,
  `surface` float DEFAULT NULL,
  `surface_units` tinyint DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `volume_units` tinyint DEFAULT NULL,
  `stock` double DEFAULT NULL,
  `pmp` double(24,8) NOT NULL DEFAULT '0.00000000',
  `fifo` double(24,8) DEFAULT NULL,
  `lifo` double(24,8) DEFAULT NULL,
  `fk_default_warehouse` int DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `finished` tinyint DEFAULT NULL,
  `lifetime` int DEFAULT NULL,
  `qc_frequency` int DEFAULT NULL,
  `hidden` tinyint DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_price_expression` int DEFAULT NULL,
  `desiredstock` float DEFAULT '0',
  `fk_unit` int DEFAULT NULL,
  `price_autogen` tinyint DEFAULT '0',
  `fk_project` int DEFAULT NULL,
  `mandatory_period` tinyint DEFAULT '0',
  `fk_default_bom` int DEFAULT NULL,
  `fk_default_workstation` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_product_label` (`label`),
  KEY `idx_product_barcode` (`barcode`),
  KEY `idx_product_import_key` (`import_key`),
  KEY `idx_product_seuil_stock_alerte` (`seuil_stock_alerte`),
  KEY `idx_product_fk_country` (`fk_country`),
  KEY `idx_product_fk_user_author` (`fk_user_author`),
  KEY `idx_product_fk_barcode_type` (`fk_barcode_type`),
  KEY `idx_product_fk_project` (`fk_project`),
  KEY `fk_product_fk_unit` (`fk_unit`),
  KEY `fk_product_finished` (`finished`),
  KEY `fk_product_default_warehouse` (`fk_default_warehouse`),
  CONSTRAINT `fk_product_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `llx_c_barcode_type` (`rowid`),
  CONSTRAINT `fk_product_default_warehouse` FOREIGN KEY (`fk_default_warehouse`) REFERENCES `llx_entrepot` (`rowid`),
  CONSTRAINT `fk_product_finished` FOREIGN KEY (`finished`) REFERENCES `llx_c_product_nature` (`code`),
  CONSTRAINT `fk_product_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `llx_c_country` (`rowid`),
  CONSTRAINT `fk_product_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product`
--

LOCK TABLES `llx_product` WRITE;
/*!40000 ALTER TABLE `llx_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_association`
--

DROP TABLE IF EXISTS `llx_product_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_association` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_product_pere` int NOT NULL DEFAULT '0',
  `fk_product_fils` int NOT NULL DEFAULT '0',
  `qty` double DEFAULT NULL,
  `incdec` int DEFAULT '1',
  `rang` int DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_association` (`fk_product_pere`,`fk_product_fils`),
  KEY `idx_product_association_fils` (`fk_product_fils`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_association`
--

LOCK TABLES `llx_product_association` WRITE;
/*!40000 ALTER TABLE `llx_product_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_attribute`
--

DROP TABLE IF EXISTS `llx_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_attribute` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `position` int NOT NULL DEFAULT '0',
  `entity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_attribute_ref` (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute`
--

LOCK TABLES `llx_product_attribute` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_attribute_combination`
--

DROP TABLE IF EXISTS `llx_product_attribute_combination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_attribute_combination` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_product_parent` int NOT NULL,
  `fk_product_child` int NOT NULL,
  `variation_price` double(24,8) NOT NULL,
  `variation_price_percentage` int DEFAULT NULL,
  `variation_weight` double NOT NULL,
  `variation_ref_ext` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  KEY `idx_product_att_com_product_parent` (`fk_product_parent`),
  KEY `idx_product_att_com_product_child` (`fk_product_child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute_combination`
--

LOCK TABLES `llx_product_attribute_combination` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute_combination` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute_combination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_attribute_combination2val`
--

DROP TABLE IF EXISTS `llx_product_attribute_combination2val`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_attribute_combination2val` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_prod_combination` int NOT NULL,
  `fk_prod_attr` int NOT NULL,
  `fk_prod_attr_val` int NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute_combination2val`
--

LOCK TABLES `llx_product_attribute_combination2val` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute_combination2val` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute_combination2val` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_attribute_combination_price_level`
--

DROP TABLE IF EXISTS `llx_product_attribute_combination_price_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_attribute_combination_price_level` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_product_attribute_combination` int NOT NULL DEFAULT '1',
  `fk_price_level` int NOT NULL DEFAULT '1',
  `variation_price` double(24,8) NOT NULL,
  `variation_price_percentage` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_prod_att_comb_price_level` (`fk_product_attribute_combination`,`fk_price_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute_combination_price_level`
--

LOCK TABLES `llx_product_attribute_combination_price_level` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute_combination_price_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute_combination_price_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_attribute_value`
--

DROP TABLE IF EXISTS `llx_product_attribute_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_attribute_value` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_product_attribute` int NOT NULL,
  `ref` varchar(180) NOT NULL,
  `value` varchar(255) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `position` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_attribute_value` (`fk_product_attribute`,`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_attribute_value`
--

LOCK TABLES `llx_product_attribute_value` WRITE;
/*!40000 ALTER TABLE `llx_product_attribute_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_batch`
--

DROP TABLE IF EXISTS `llx_product_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_batch` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product_stock` int NOT NULL,
  `eatby` datetime DEFAULT NULL,
  `sellby` datetime DEFAULT NULL,
  `batch` varchar(128) NOT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_batch` (`fk_product_stock`,`batch`),
  KEY `idx_fk_product_stock` (`fk_product_stock`),
  KEY `idx_batch` (`batch`),
  CONSTRAINT `fk_product_batch_fk_product_stock` FOREIGN KEY (`fk_product_stock`) REFERENCES `llx_product_stock` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_batch`
--

LOCK TABLES `llx_product_batch` WRITE;
/*!40000 ALTER TABLE `llx_product_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_customer_price`
--

DROP TABLE IF EXISTS `llx_product_customer_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_customer_price` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int NOT NULL,
  `fk_soc` int NOT NULL,
  `ref_customer` varchar(128) DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `price_ttc` double(24,8) DEFAULT '0.00000000',
  `price_min` double(24,8) DEFAULT '0.00000000',
  `price_min_ttc` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(7,4) DEFAULT NULL,
  `recuperableonly` int NOT NULL DEFAULT '0',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_customer_price_fk_product_fk_soc` (`fk_product`,`fk_soc`),
  KEY `idx_product_customer_price_fk_user` (`fk_user`),
  KEY `idx_product_customer_price_fk_soc` (`fk_soc`),
  CONSTRAINT `fk_product_customer_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_product_customer_price_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_product_customer_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_customer_price`
--

LOCK TABLES `llx_product_customer_price` WRITE;
/*!40000 ALTER TABLE `llx_product_customer_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_customer_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_customer_price_log`
--

DROP TABLE IF EXISTS `llx_product_customer_price_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_customer_price_log` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `fk_product` int NOT NULL,
  `fk_soc` int NOT NULL DEFAULT '0',
  `ref_customer` varchar(30) DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `price_ttc` double(24,8) DEFAULT '0.00000000',
  `price_min` double(24,8) DEFAULT '0.00000000',
  `price_min_ttc` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(7,4) DEFAULT NULL,
  `recuperableonly` int NOT NULL DEFAULT '0',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_customer_price_log`
--

LOCK TABLES `llx_product_customer_price_log` WRITE;
/*!40000 ALTER TABLE `llx_product_customer_price_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_customer_price_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_extrafields`
--

DROP TABLE IF EXISTS `llx_product_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_extrafields`
--

LOCK TABLES `llx_product_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_fournisseur_price`
--

DROP TABLE IF EXISTS `llx_product_fournisseur_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_fournisseur_price` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `ref_fourn` varchar(128) DEFAULT NULL,
  `desc_fourn` text,
  `fk_availability` int DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT '0',
  `remise` double NOT NULL DEFAULT '0',
  `unitprice` double(24,8) DEFAULT '0.00000000',
  `charges` double(24,8) DEFAULT '0.00000000',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int DEFAULT NULL,
  `tva_tx` double(7,4) NOT NULL,
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `info_bits` int NOT NULL DEFAULT '0',
  `fk_user` int DEFAULT NULL,
  `fk_supplier_price_expression` int DEFAULT NULL,
  `delivery_time_days` int DEFAULT NULL,
  `supplier_reputation` varchar(10) DEFAULT NULL,
  `packaging` double DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_fournisseur_price_ref` (`ref_fourn`,`fk_soc`,`quantity`,`entity`),
  UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_product_fournisseur_price_fk_user` (`fk_user`),
  KEY `idx_product_fourn_price_fk_product` (`fk_product`,`entity`),
  KEY `idx_product_fourn_price_fk_soc` (`fk_soc`,`entity`),
  KEY `idx_product_barcode` (`barcode`),
  KEY `idx_product_fk_barcode_type` (`fk_barcode_type`),
  CONSTRAINT `fk_product_fournisseur_price_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `llx_c_barcode_type` (`rowid`),
  CONSTRAINT `fk_product_fournisseur_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_product_fournisseur_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_fournisseur_price`
--

LOCK TABLES `llx_product_fournisseur_price` WRITE;
/*!40000 ALTER TABLE `llx_product_fournisseur_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_fournisseur_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_fournisseur_price_extrafields`
--

DROP TABLE IF EXISTS `llx_product_fournisseur_price_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_fournisseur_price_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_fournisseur_price_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_fournisseur_price_extrafields`
--

LOCK TABLES `llx_product_fournisseur_price_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_fournisseur_price_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_fournisseur_price_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_fournisseur_price_log`
--

DROP TABLE IF EXISTS `llx_product_fournisseur_price_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_fournisseur_price_log` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `fk_product_fournisseur` int NOT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `quantity` double DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_fournisseur_price_log_fk_product_fournisseur` (`fk_product_fournisseur`),
  KEY `idx_product_fournisseur_price_log_fk_user` (`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_fournisseur_price_log`
--

LOCK TABLES `llx_product_fournisseur_price_log` WRITE;
/*!40000 ALTER TABLE `llx_product_fournisseur_price_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_fournisseur_price_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_lang`
--

DROP TABLE IF EXISTS `llx_product_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_lang` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_product` int NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  `note` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_lang` (`fk_product`,`lang`),
  CONSTRAINT `fk_product_lang_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_lang`
--

LOCK TABLES `llx_product_lang` WRITE;
/*!40000 ALTER TABLE `llx_product_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_lot`
--

DROP TABLE IF EXISTS `llx_product_lot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_lot` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '1',
  `fk_product` int NOT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `note_public` text,
  `note_private` text,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `eol_date` datetime DEFAULT NULL,
  `manufacturing_date` datetime DEFAULT NULL,
  `scrapping_date` datetime DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_lot` (`fk_product`,`batch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_lot`
--

LOCK TABLES `llx_product_lot` WRITE;
/*!40000 ALTER TABLE `llx_product_lot` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_lot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_lot_extrafields`
--

DROP TABLE IF EXISTS `llx_product_lot_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_lot_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_lot_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_lot_extrafields`
--

LOCK TABLES `llx_product_lot_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_product_lot_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_lot_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_price`
--

DROP TABLE IF EXISTS `llx_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_price` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int NOT NULL,
  `date_price` datetime NOT NULL,
  `price_level` smallint DEFAULT '1',
  `price` double(24,8) DEFAULT NULL,
  `price_ttc` double(24,8) DEFAULT NULL,
  `price_min` double(24,8) DEFAULT NULL,
  `price_min_ttc` double(24,8) DEFAULT NULL,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(7,4) NOT NULL DEFAULT '0.0000',
  `recuperableonly` int NOT NULL DEFAULT '0',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user_author` int DEFAULT NULL,
  `tosell` tinyint DEFAULT '1',
  `price_by_qty` int NOT NULL DEFAULT '0',
  `fk_price_expression` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_price_fk_user_author` (`fk_user_author`),
  KEY `idx_product_price_fk_product` (`fk_product`),
  CONSTRAINT `fk_product_price_user_author` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_price`
--

LOCK TABLES `llx_product_price` WRITE;
/*!40000 ALTER TABLE `llx_product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_price_by_qty`
--

DROP TABLE IF EXISTS `llx_product_price_by_qty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_price_by_qty` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_product_price` int NOT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT '0',
  `remise` double NOT NULL DEFAULT '0',
  `unitprice` double(24,8) DEFAULT '0.00000000',
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_price_by_qty_level` (`fk_product_price`,`quantity`),
  KEY `idx_product_price_by_qty_fk_product_price` (`fk_product_price`),
  CONSTRAINT `fk_product_price_by_qty_fk_product_price` FOREIGN KEY (`fk_product_price`) REFERENCES `llx_product_price` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_price_by_qty`
--

LOCK TABLES `llx_product_price_by_qty` WRITE;
/*!40000 ALTER TABLE `llx_product_price_by_qty` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_price_by_qty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_pricerules`
--

DROP TABLE IF EXISTS `llx_product_pricerules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_pricerules` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `level` int NOT NULL,
  `fk_level` int NOT NULL,
  `var_percent` double NOT NULL,
  `var_min_percent` double NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `unique_level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_pricerules`
--

LOCK TABLES `llx_product_pricerules` WRITE;
/*!40000 ALTER TABLE `llx_product_pricerules` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_pricerules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_stock`
--

DROP TABLE IF EXISTS `llx_product_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_stock` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int NOT NULL,
  `fk_entrepot` int NOT NULL,
  `reel` double DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_stock` (`fk_product`,`fk_entrepot`),
  KEY `idx_product_stock_fk_product` (`fk_product`),
  KEY `idx_product_stock_fk_entrepot` (`fk_entrepot`),
  CONSTRAINT `fk_entrepot_entrepot_rowid` FOREIGN KEY (`fk_entrepot`) REFERENCES `llx_entrepot` (`rowid`),
  CONSTRAINT `fk_product_product_rowid` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_stock`
--

LOCK TABLES `llx_product_stock` WRITE;
/*!40000 ALTER TABLE `llx_product_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_product_warehouse_properties`
--

DROP TABLE IF EXISTS `llx_product_warehouse_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_product_warehouse_properties` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int NOT NULL,
  `fk_entrepot` int NOT NULL,
  `seuil_stock_alerte` float DEFAULT '0',
  `desiredstock` float DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_product_warehouse_properties`
--

LOCK TABLES `llx_product_warehouse_properties` WRITE;
/*!40000 ALTER TABLE `llx_product_warehouse_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_product_warehouse_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_projet`
--

DROP TABLE IF EXISTS `llx_projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_projet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_project` int DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `description` text,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `public` int DEFAULT NULL,
  `fk_statut` int NOT NULL DEFAULT '0',
  `fk_opp_status` int DEFAULT NULL,
  `opp_percent` double(5,2) DEFAULT NULL,
  `fk_opp_status_end` int DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `fk_user_close` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `email_msgid` varchar(175) DEFAULT NULL,
  `opp_amount` double(24,8) DEFAULT NULL,
  `budget_amount` double(24,8) DEFAULT NULL,
  `usage_opportunity` int DEFAULT '0',
  `usage_task` int DEFAULT '1',
  `usage_bill_time` int DEFAULT '0',
  `usage_organize_event` int DEFAULT '0',
  `date_start_event` datetime DEFAULT NULL,
  `date_end_event` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `accept_conference_suggestions` int DEFAULT '0',
  `accept_booth_suggestions` int DEFAULT '0',
  `max_attendees` int DEFAULT '0',
  `price_registration` double(24,8) DEFAULT NULL,
  `price_booth` double(24,8) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_projet_ref` (`ref`,`entity`),
  KEY `idx_projet_fk_soc` (`fk_soc`),
  KEY `idx_projet_ref` (`ref`),
  KEY `idx_projet_fk_statut` (`fk_statut`),
  KEY `idx_projet_fk_opp_status` (`fk_opp_status`),
  CONSTRAINT `fk_projet_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_projet`
--

LOCK TABLES `llx_projet` WRITE;
/*!40000 ALTER TABLE `llx_projet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_projet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_projet_extrafields`
--

DROP TABLE IF EXISTS `llx_projet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_projet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_projet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_projet_extrafields`
--

LOCK TABLES `llx_projet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_projet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_projet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_projet_task`
--

DROP TABLE IF EXISTS `llx_projet_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_projet_task` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_projet` int NOT NULL,
  `fk_task_parent` int NOT NULL DEFAULT '0',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateo` datetime DEFAULT NULL,
  `datee` datetime DEFAULT NULL,
  `datev` datetime DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `description` text,
  `duration_effective` double DEFAULT '0',
  `planned_workload` double DEFAULT '0',
  `progress` int DEFAULT '0',
  `priority` int DEFAULT '0',
  `budget_amount` double(24,8) DEFAULT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_statut` smallint NOT NULL DEFAULT '0',
  `note_private` text,
  `note_public` text,
  `rang` int DEFAULT '0',
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_projet_task_ref` (`ref`,`entity`),
  KEY `idx_projet_task_fk_projet` (`fk_projet`),
  KEY `idx_projet_task_fk_user_creat` (`fk_user_creat`),
  KEY `idx_projet_task_fk_user_valid` (`fk_user_valid`),
  CONSTRAINT `fk_projet_task_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_projet_task_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_projet_task_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_projet_task`
--

LOCK TABLES `llx_projet_task` WRITE;
/*!40000 ALTER TABLE `llx_projet_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_projet_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_projet_task_extrafields`
--

DROP TABLE IF EXISTS `llx_projet_task_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_projet_task_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_projet_task_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_projet_task_extrafields`
--

LOCK TABLES `llx_projet_task_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_projet_task_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_projet_task_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_propal`
--

DROP TABLE IF EXISTS `llx_propal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_propal` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `fin_validite` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_signature` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_user_signature` int DEFAULT NULL,
  `fk_user_cloture` int DEFAULT NULL,
  `fk_statut` smallint NOT NULL DEFAULT '0',
  `price` double DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_account` int DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int DEFAULT NULL,
  `deposit_percent` varchar(63) DEFAULT NULL,
  `fk_mode_reglement` int DEFAULT NULL,
  `online_sign_ip` varchar(48) DEFAULT NULL,
  `online_sign_name` varchar(64) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int DEFAULT NULL,
  `fk_warehouse` int DEFAULT NULL,
  `fk_availability` int DEFAULT NULL,
  `fk_input_reason` int DEFAULT NULL,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_delivery_address` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_propal_ref` (`ref`,`entity`),
  KEY `idx_propal_fk_soc` (`fk_soc`),
  KEY `idx_propal_fk_user_author` (`fk_user_author`),
  KEY `idx_propal_fk_user_valid` (`fk_user_valid`),
  KEY `idx_propal_fk_user_signature` (`fk_user_signature`),
  KEY `idx_propal_fk_user_cloture` (`fk_user_cloture`),
  KEY `idx_propal_fk_projet` (`fk_projet`),
  KEY `idx_propal_fk_account` (`fk_account`),
  KEY `idx_propal_fk_currency` (`fk_currency`),
  KEY `idx_propal_fk_warehouse` (`fk_warehouse`),
  CONSTRAINT `fk_propal_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_propal_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_signature` FOREIGN KEY (`fk_user_signature`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propal`
--

LOCK TABLES `llx_propal` WRITE;
/*!40000 ALTER TABLE `llx_propal` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_propal_extrafields`
--

DROP TABLE IF EXISTS `llx_propal_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_propal_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_propal_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propal_extrafields`
--

LOCK TABLES `llx_propal_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_propal_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propal_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_propal_merge_pdf_product`
--

DROP TABLE IF EXISTS `llx_propal_merge_pdf_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_propal_merge_pdf_product` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_product` int NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `lang` varchar(5) DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_mod` int NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propal_merge_pdf_product`
--

LOCK TABLES `llx_propal_merge_pdf_product` WRITE;
/*!40000 ALTER TABLE `llx_propal_merge_pdf_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propal_merge_pdf_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_propaldet`
--

DROP TABLE IF EXISTS `llx_propaldet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_propaldet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_propal` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `fk_remise_except` int DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int DEFAULT NULL,
  `special_code` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `fk_unit` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_propaldet_fk_propal` (`fk_propal`),
  KEY `idx_propaldet_fk_product` (`fk_product`),
  KEY `fk_propaldet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_propaldet_fk_propal` FOREIGN KEY (`fk_propal`) REFERENCES `llx_propal` (`rowid`),
  CONSTRAINT `fk_propaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propaldet`
--

LOCK TABLES `llx_propaldet` WRITE;
/*!40000 ALTER TABLE `llx_propaldet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propaldet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_propaldet_extrafields`
--

DROP TABLE IF EXISTS `llx_propaldet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_propaldet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_propaldet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_propaldet_extrafields`
--

LOCK TABLES `llx_propaldet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_propaldet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_propaldet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_reception`
--

DROP TABLE IF EXISTS `llx_reception`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_reception` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `fk_projet` int DEFAULT NULL,
  `ref_ext` varchar(30) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_reception` datetime DEFAULT NULL,
  `fk_shipping_method` int DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `fk_statut` smallint DEFAULT '0',
  `billed` smallint DEFAULT '0',
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_reception_uk_ref` (`ref`,`entity`),
  KEY `idx_reception_fk_soc` (`fk_soc`),
  KEY `idx_reception_fk_user_author` (`fk_user_author`),
  KEY `idx_reception_fk_user_valid` (`fk_user_valid`),
  KEY `idx_reception_fk_shipping_method` (`fk_shipping_method`),
  CONSTRAINT `fk_reception_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `llx_c_shipment_mode` (`rowid`),
  CONSTRAINT `fk_reception_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_reception_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_reception_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_reception`
--

LOCK TABLES `llx_reception` WRITE;
/*!40000 ALTER TABLE `llx_reception` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_reception` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_reception_extrafields`
--

DROP TABLE IF EXISTS `llx_reception_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_reception_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_reception_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_reception_extrafields`
--

LOCK TABLES `llx_reception_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_reception_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_reception_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_resource`
--

DROP TABLE IF EXISTS `llx_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_resource` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref` varchar(255) DEFAULT NULL,
  `asset_number` varchar(255) DEFAULT NULL,
  `description` text,
  `fk_code_type_resource` varchar(32) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_statut` smallint NOT NULL DEFAULT '0',
  `note_public` text,
  `note_private` text,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_country` int DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_resource_ref` (`ref`,`entity`),
  KEY `fk_code_type_resource_idx` (`fk_code_type_resource`),
  KEY `idx_resource_fk_country` (`fk_country`),
  CONSTRAINT `fk_resource_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `llx_c_country` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_resource`
--

LOCK TABLES `llx_resource` WRITE;
/*!40000 ALTER TABLE `llx_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_resource_extrafields`
--

DROP TABLE IF EXISTS `llx_resource_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_resource_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_resource_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_resource_extrafields`
--

LOCK TABLES `llx_resource_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_resource_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_resource_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_rights_def`
--

DROP TABLE IF EXISTS `llx_rights_def`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_rights_def` (
  `id` int NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `module` varchar(64) DEFAULT NULL,
  `module_position` int NOT NULL DEFAULT '0',
  `family_position` int NOT NULL DEFAULT '0',
  `entity` int NOT NULL DEFAULT '1',
  `perms` varchar(50) DEFAULT NULL,
  `subperms` varchar(50) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `bydefault` tinyint DEFAULT '0',
  PRIMARY KEY (`id`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_rights_def`
--

LOCK TABLES `llx_rights_def` WRITE;
/*!40000 ALTER TABLE `llx_rights_def` DISABLE KEYS */;
INSERT INTO `llx_rights_def` VALUES
(0,1,0,121,'Read third parties','societe',0,'lire',NULL,'r'),
(0,1,0,122,'Create and update third parties','societe',0,'creer',NULL,'w'),
(0,1,0,125,'Delete third parties','societe',0,'supprimer',NULL,'d'),
(0,1,0,126,'Export third parties','societe',0,'export',NULL,'r'),
(0,1,0,130,'Modify thirdparty information payment','societe',0,'thirdparty_paymentinformation_advance','write','w'),
(0,1,0,251,'Read information of other users, groups and permissions','user',0,'user','lire','r'),
(0,1,0,252,'Read permissions of other users','user',0,'user_advance','readperms','r'),
(0,1,0,253,'Create/modify internal and external users, groups and permissions','user',0,'user','creer','w'),
(0,1,0,254,'Create/modify external users only','user',0,'user_advance','write','w'),
(0,1,0,255,'Modify the password of other users','user',0,'user','password','w'),
(0,1,0,256,'Delete or disable other users','user',0,'user','supprimer','d'),
(0,1,0,262,'Read all third parties (and their objects) by internal users (otherwise only if commercial contact). Not effective for external users (limited to themselves).','societe',0,'client','voir','r'),
(0,1,0,281,'Read contacts','societe',0,'contact','lire','r'),
(0,1,0,282,'Create and update contact','societe',0,'contact','creer','w'),
(0,1,0,283,'Delete contacts','societe',0,'contact','supprimer','d'),
(0,1,0,286,'Export contacts','societe',0,'contact','export','d'),
(0,1,0,341,'Read its own permissions','user',0,'self_advance','readperms','r'),
(0,1,0,342,'Create/modify of its own user','user',0,'self','creer','w'),
(0,1,0,343,'Modify its own password','user',0,'self','password','w'),
(0,1,0,344,'Modify its own permissions','user',0,'self_advance','writeperms','w'),
(0,1,0,351,'Read groups','user',0,'group_advance','read','r'),
(0,1,0,352,'Read permissions of groups','user',0,'group_advance','readperms','r'),
(0,1,0,353,'Create/modify groups and permissions','user',0,'group_advance','write','w'),
(0,1,0,354,'Delete groups','user',0,'group_advance','delete','d'),
(0,1,0,358,'Export all users','user',0,'user','export','r'),
(0,1,0,1201,'Read exports','export',0,'lire',NULL,'r'),
(0,1,0,1202,'Creeate/modify export','export',0,'creer',NULL,'w'),
(0,1,0,1251,'Run mass imports of external data (data load)','import',0,'run',NULL,'r');
/*!40000 ALTER TABLE `llx_rights_def` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_salary`
--

DROP TABLE IF EXISTS `llx_salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_salary` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user` int NOT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `fk_projet` int DEFAULT NULL,
  `fk_typepayment` int NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `note` text,
  `fk_bank` int DEFAULT NULL,
  `paye` smallint NOT NULL DEFAULT '0',
  `fk_account` int DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_salary`
--

LOCK TABLES `llx_salary` WRITE;
/*!40000 ALTER TABLE `llx_salary` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_salary_extrafields`
--

DROP TABLE IF EXISTS `llx_salary_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_salary_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_salary_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_salary_extrafields`
--

LOCK TABLES `llx_salary_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_salary_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_salary_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_session`
--

DROP TABLE IF EXISTS `llx_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_session` (
  `session_id` varchar(50) NOT NULL,
  `session_variable` text,
  `last_accessed` datetime NOT NULL,
  `fk_user` int NOT NULL,
  `remote_ip` varchar(64) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_session`
--

LOCK TABLES `llx_session` WRITE;
/*!40000 ALTER TABLE `llx_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe`
--

DROP TABLE IF EXISTS `llx_societe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(128) DEFAULT NULL,
  `name_alias` varchar(128) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `statut` tinyint DEFAULT '0',
  `parent` int DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `code_client` varchar(24) DEFAULT NULL,
  `code_fournisseur` varchar(24) DEFAULT NULL,
  `code_compta` varchar(24) DEFAULT NULL,
  `code_compta_fournisseur` varchar(24) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_departement` int DEFAULT '0',
  `fk_pays` int DEFAULT '0',
  `fk_account` int DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `socialnetworks` text,
  `fk_effectif` int DEFAULT '0',
  `fk_typent` int DEFAULT NULL,
  `fk_forme_juridique` int DEFAULT '0',
  `fk_currency` varchar(3) DEFAULT NULL,
  `siren` varchar(128) DEFAULT NULL,
  `siret` varchar(128) DEFAULT NULL,
  `ape` varchar(128) DEFAULT NULL,
  `idprof4` varchar(128) DEFAULT NULL,
  `idprof5` varchar(128) DEFAULT NULL,
  `idprof6` varchar(128) DEFAULT NULL,
  `tva_intra` varchar(20) DEFAULT NULL,
  `capital` double(24,8) DEFAULT NULL,
  `fk_stcomm` int NOT NULL DEFAULT '0',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `prefix_comm` varchar(5) DEFAULT NULL,
  `client` tinyint DEFAULT '0',
  `fournisseur` tinyint DEFAULT '0',
  `supplier_account` varchar(32) DEFAULT NULL,
  `fk_prospectlevel` varchar(12) DEFAULT NULL,
  `fk_incoterms` int DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `customer_bad` tinyint DEFAULT '0',
  `customer_rate` double DEFAULT '0',
  `supplier_rate` double DEFAULT '0',
  `remise_client` double DEFAULT '0',
  `remise_supplier` double DEFAULT '0',
  `mode_reglement` tinyint DEFAULT NULL,
  `cond_reglement` tinyint DEFAULT NULL,
  `deposit_percent` varchar(63) DEFAULT NULL,
  `transport_mode` tinyint DEFAULT NULL,
  `mode_reglement_supplier` tinyint DEFAULT NULL,
  `cond_reglement_supplier` tinyint DEFAULT NULL,
  `transport_mode_supplier` tinyint DEFAULT NULL,
  `fk_shipping_method` int DEFAULT NULL,
  `tva_assuj` tinyint DEFAULT '1',
  `vat_reverse_charge` tinyint DEFAULT '0',
  `localtax1_assuj` tinyint DEFAULT '0',
  `localtax1_value` double(7,4) DEFAULT NULL,
  `localtax2_assuj` tinyint DEFAULT '0',
  `localtax2_value` double(7,4) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int DEFAULT '0',
  `price_level` int DEFAULT NULL,
  `outstanding_limit` double(24,8) DEFAULT NULL,
  `order_min_amount` double(24,8) DEFAULT NULL,
  `supplier_order_min_amount` double(24,8) DEFAULT NULL,
  `default_lang` varchar(6) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `logo_squarred` varchar(255) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `fk_warehouse` int DEFAULT NULL,
  `webservices_url` varchar(255) DEFAULT NULL,
  `webservices_key` varchar(128) DEFAULT NULL,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_prefix_comm` (`prefix_comm`,`entity`),
  UNIQUE KEY `uk_societe_code_client` (`code_client`,`entity`),
  UNIQUE KEY `uk_societe_code_fournisseur` (`code_fournisseur`,`entity`),
  UNIQUE KEY `uk_societe_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_societe_nom` (`nom`),
  KEY `idx_societe_user_creat` (`fk_user_creat`),
  KEY `idx_societe_user_modif` (`fk_user_modif`),
  KEY `idx_societe_stcomm` (`fk_stcomm`),
  KEY `idx_societe_pays` (`fk_pays`),
  KEY `idx_societe_account` (`fk_account`),
  KEY `idx_societe_prospectlevel` (`fk_prospectlevel`),
  KEY `idx_societe_typent` (`fk_typent`),
  KEY `idx_societe_forme_juridique` (`fk_forme_juridique`),
  KEY `idx_societe_shipping_method` (`fk_shipping_method`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe`
--

LOCK TABLES `llx_societe` WRITE;
/*!40000 ALTER TABLE `llx_societe` DISABLE KEYS */;
INSERT INTO `llx_societe` VALUES
('','','iut de elbeuf mais pas à rouen','333',NULL,NULL,2.00000000,1,'CU2311-00001',NULL,NULL,NULL,NULL,NULL,0,0,'2023-11-27 09:43:27',NULL,NULL,'haar@balete.com',1,'99887766554433',0,0,NULL,327,5,84,0,0,1,'',NULL,0,3,1,1,NULL,0,'444','55555','',NULL,NULL,NULL,0.0000,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,'','','baletehaar','haarbalete',NULL,NULL,NULL,NULL,NULL,'1122334455667788',NULL,NULL,NULL,0,0,2,'1111','222','[]',1,0,NULL,NULL,0,'2023-11-27 09:43:27','elbeiuf',NULL,NULL,1,'','haarbalet.com',0,NULL,NULL,'sssssssssssss');
/*!40000 ALTER TABLE `llx_societe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_account`
--

DROP TABLE IF EXISTS `llx_societe_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_account` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int DEFAULT '1',
  `login` varchar(128) NOT NULL,
  `pass_encoding` varchar(24) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `pass_temp` varchar(128) DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `fk_website` int DEFAULT NULL,
  `site` varchar(128) DEFAULT NULL,
  `site_account` varchar(128) DEFAULT NULL,
  `key_account` varchar(128) DEFAULT NULL,
  `note_private` text,
  `date_last_login` datetime DEFAULT NULL,
  `date_previous_login` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int NOT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_account_login_website_soc` (`entity`,`fk_soc`,`login`,`site`,`fk_website`),
  UNIQUE KEY `uk_societe_account_key_account_soc` (`entity`,`fk_soc`,`key_account`,`site`,`fk_website`),
  KEY `idx_societe_account_rowid` (`rowid`),
  KEY `idx_societe_account_login` (`login`),
  KEY `idx_societe_account_status` (`status`),
  KEY `idx_societe_account_fk_website` (`fk_website`),
  KEY `idx_societe_account_fk_soc` (`fk_soc`),
  CONSTRAINT `llx_societe_account_fk_societe` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_account`
--

LOCK TABLES `llx_societe_account` WRITE;
/*!40000 ALTER TABLE `llx_societe_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_address`
--

DROP TABLE IF EXISTS `llx_societe_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_address` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(30) DEFAULT NULL,
  `fk_soc` int DEFAULT '0',
  `name` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_pays` int DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `note` text,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_address`
--

LOCK TABLES `llx_societe_address` WRITE;
/*!40000 ALTER TABLE `llx_societe_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_commerciaux`
--

DROP TABLE IF EXISTS `llx_societe_commerciaux`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_commerciaux` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_soc` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_commerciaux` (`fk_soc`,`fk_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_commerciaux`
--

LOCK TABLES `llx_societe_commerciaux` WRITE;
/*!40000 ALTER TABLE `llx_societe_commerciaux` DISABLE KEYS */;
INSERT INTO `llx_societe_commerciaux` VALUES
(2,1,NULL,1);
/*!40000 ALTER TABLE `llx_societe_commerciaux` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_contacts`
--

DROP TABLE IF EXISTS `llx_societe_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_contacts` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `date_creation` datetime NOT NULL,
  `fk_soc` int NOT NULL,
  `fk_c_type_contact` int NOT NULL,
  `fk_socpeople` int NOT NULL,
  `tms` timestamp NULL DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_societe_contacts_idx1` (`entity`,`fk_soc`,`fk_c_type_contact`,`fk_socpeople`),
  KEY `fk_societe_contacts_fk_c_type_contact` (`fk_c_type_contact`),
  KEY `fk_societe_contacts_fk_soc` (`fk_soc`),
  KEY `fk_societe_contacts_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_societe_contacts_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `llx_c_type_contact` (`rowid`),
  CONSTRAINT `fk_societe_contacts_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_societe_contacts_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `llx_socpeople` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_contacts`
--

LOCK TABLES `llx_societe_contacts` WRITE;
/*!40000 ALTER TABLE `llx_societe_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_extrafields`
--

DROP TABLE IF EXISTS `llx_societe_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_extrafields`
--

LOCK TABLES `llx_societe_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_societe_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_prices`
--

DROP TABLE IF EXISTS `llx_societe_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_prices` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_soc` int DEFAULT '0',
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `price_level` tinyint DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_prices`
--

LOCK TABLES `llx_societe_prices` WRITE;
/*!40000 ALTER TABLE `llx_societe_prices` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_prices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_remise`
--

DROP TABLE IF EXISTS `llx_societe_remise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_remise` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `remise_client` double(7,4) NOT NULL DEFAULT '0.0000',
  `note` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_remise`
--

LOCK TABLES `llx_societe_remise` WRITE;
/*!40000 ALTER TABLE `llx_societe_remise` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_remise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_remise_except`
--

DROP TABLE IF EXISTS `llx_societe_remise_except`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_remise_except` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `discount_type` int NOT NULL DEFAULT '0',
  `datec` datetime DEFAULT NULL,
  `amount_ht` double(24,8) NOT NULL,
  `amount_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `amount_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `tva_tx` double(7,4) NOT NULL DEFAULT '0.0000',
  `vat_src_code` varchar(10) DEFAULT '',
  `fk_user` int NOT NULL,
  `fk_facture_line` int DEFAULT NULL,
  `fk_facture` int DEFAULT NULL,
  `fk_facture_source` int DEFAULT NULL,
  `fk_invoice_supplier_line` int DEFAULT NULL,
  `fk_invoice_supplier` int DEFAULT NULL,
  `fk_invoice_supplier_source` int DEFAULT NULL,
  `description` text NOT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT NULL,
  `multicurrency_amount_ht` double(24,8) NOT NULL DEFAULT '0.00000000',
  `multicurrency_amount_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `multicurrency_amount_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `idx_societe_remise_except_fk_user` (`fk_user`),
  KEY `idx_societe_remise_except_fk_soc` (`fk_soc`),
  KEY `idx_societe_remise_except_fk_facture_line` (`fk_facture_line`),
  KEY `idx_societe_remise_except_fk_facture` (`fk_facture`),
  KEY `idx_societe_remise_except_fk_facture_source` (`fk_facture_source`),
  KEY `idx_societe_remise_except_discount_type` (`discount_type`),
  KEY `fk_soc_remise_fk_invoice_supplier_line` (`fk_invoice_supplier_line`),
  KEY `fk_societe_remise_fk_invoice_supplier_source` (`fk_invoice_supplier`),
  CONSTRAINT `fk_soc_remise_fk_facture_line` FOREIGN KEY (`fk_facture_line`) REFERENCES `llx_facturedet` (`rowid`),
  CONSTRAINT `fk_soc_remise_fk_invoice_supplier_line` FOREIGN KEY (`fk_invoice_supplier_line`) REFERENCES `llx_facture_fourn_det` (`rowid`),
  CONSTRAINT `fk_soc_remise_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_invoice_supplier` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `llx_facture_fourn` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_invoice_supplier_source` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `llx_facture_fourn` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_remise_except`
--

LOCK TABLES `llx_societe_remise_except` WRITE;
/*!40000 ALTER TABLE `llx_societe_remise_except` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_remise_except` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_remise_supplier`
--

DROP TABLE IF EXISTS `llx_societe_remise_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_remise_supplier` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_soc` int NOT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `remise_supplier` double(7,4) NOT NULL DEFAULT '0.0000',
  `note` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_remise_supplier`
--

LOCK TABLES `llx_societe_remise_supplier` WRITE;
/*!40000 ALTER TABLE `llx_societe_remise_supplier` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_remise_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_societe_rib`
--

DROP TABLE IF EXISTS `llx_societe_rib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_societe_rib` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL DEFAULT 'ban',
  `label` varchar(200) DEFAULT NULL,
  `fk_soc` int NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bank` varchar(255) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(20) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `default_rib` smallint NOT NULL DEFAULT '0',
  `state_id` int DEFAULT NULL,
  `fk_country` int DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  `rum` varchar(32) DEFAULT NULL,
  `date_rum` date DEFAULT NULL,
  `frstrecur` varchar(16) DEFAULT 'FRST',
  `last_four` varchar(4) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `cvn` varchar(255) DEFAULT NULL,
  `exp_date_month` int DEFAULT NULL,
  `exp_date_year` int DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `approved` int DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `max_total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `preapproval_key` varchar(255) DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `stripe_card_ref` varchar(128) DEFAULT NULL,
  `stripe_account` varchar(128) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `ipaddress` varchar(68) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_rib` (`label`,`fk_soc`),
  KEY `llx_societe_rib_fk_societe` (`fk_soc`),
  CONSTRAINT `llx_societe_rib_fk_societe` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_societe_rib`
--

LOCK TABLES `llx_societe_rib` WRITE;
/*!40000 ALTER TABLE `llx_societe_rib` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_societe_rib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_socpeople`
--

DROP TABLE IF EXISTS `llx_socpeople`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_socpeople` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_soc` int DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `fk_departement` int DEFAULT NULL,
  `fk_pays` int DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `poste` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `phone_perso` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `socialnetworks` text,
  `photo` varchar(255) DEFAULT NULL,
  `no_email` smallint NOT NULL DEFAULT '0',
  `priv` smallint NOT NULL DEFAULT '0',
  `fk_prospectlevel` varchar(12) DEFAULT NULL,
  `fk_stcommcontact` int NOT NULL DEFAULT '0',
  `fk_user_creat` int DEFAULT '0',
  `fk_user_modif` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `default_lang` varchar(6) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `statut` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  KEY `idx_socpeople_fk_soc` (`fk_soc`),
  KEY `idx_socpeople_fk_user_creat` (`fk_user_creat`),
  KEY `idx_socpeople_lastname` (`lastname`),
  CONSTRAINT `fk_socpeople_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_socpeople_user_creat_user_rowid` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_socpeople`
--

LOCK TABLES `llx_socpeople` WRITE;
/*!40000 ALTER TABLE `llx_socpeople` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_socpeople` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_socpeople_extrafields`
--

DROP TABLE IF EXISTS `llx_socpeople_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_socpeople_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_socpeople_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_socpeople_extrafields`
--

LOCK TABLES `llx_socpeople_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_socpeople_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_socpeople_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_stock_mouvement`
--

DROP TABLE IF EXISTS `llx_stock_mouvement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_stock_mouvement` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datem` datetime DEFAULT NULL,
  `fk_product` int NOT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `fk_entrepot` int NOT NULL,
  `value` double DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `type_mouvement` smallint DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `inventorycode` varchar(128) DEFAULT NULL,
  `fk_project` int DEFAULT NULL,
  `fk_origin` int DEFAULT NULL,
  `origintype` varchar(64) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_projet` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_stock_mouvement_fk_product` (`fk_product`),
  KEY `idx_stock_mouvement_fk_entrepot` (`fk_entrepot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_stock_mouvement`
--

LOCK TABLES `llx_stock_mouvement` WRITE;
/*!40000 ALTER TABLE `llx_stock_mouvement` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_stock_mouvement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_stock_mouvement_extrafields`
--

DROP TABLE IF EXISTS `llx_stock_mouvement_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_stock_mouvement_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_stock_mouvement_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_stock_mouvement_extrafields`
--

LOCK TABLES `llx_stock_mouvement_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_stock_mouvement_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_stock_mouvement_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_subscription`
--

DROP TABLE IF EXISTS `llx_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_subscription` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_adherent` int DEFAULT NULL,
  `fk_type` int DEFAULT NULL,
  `dateadh` datetime DEFAULT NULL,
  `datef` datetime DEFAULT NULL,
  `subscription` double(24,8) DEFAULT NULL,
  `fk_bank` int DEFAULT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_subscription` (`fk_adherent`,`dateadh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_subscription`
--

LOCK TABLES `llx_subscription` WRITE;
/*!40000 ALTER TABLE `llx_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_supplier_proposal`
--

DROP TABLE IF EXISTS `llx_supplier_proposal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_supplier_proposal` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `fk_soc` int DEFAULT NULL,
  `fk_projet` int DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `fk_user_valid` int DEFAULT NULL,
  `fk_user_cloture` int DEFAULT NULL,
  `fk_statut` smallint NOT NULL DEFAULT '0',
  `price` double DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_account` int DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int DEFAULT NULL,
  `fk_mode_reglement` int DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_supplier_proposal_ref` (`ref`,`entity`),
  KEY `idx_supplier_proposal_fk_soc` (`fk_soc`),
  KEY `idx_supplier_proposal_fk_user_author` (`fk_user_author`),
  KEY `idx_supplier_proposal_fk_user_valid` (`fk_user_valid`),
  KEY `idx_supplier_proposal_fk_projet` (`fk_projet`),
  KEY `idx_supplier_proposal_fk_account` (`fk_account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_supplier_proposal`
--

LOCK TABLES `llx_supplier_proposal` WRITE;
/*!40000 ALTER TABLE `llx_supplier_proposal` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_supplier_proposal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_supplier_proposal_extrafields`
--

DROP TABLE IF EXISTS `llx_supplier_proposal_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_supplier_proposal_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_supplier_proposal_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_supplier_proposal_extrafields`
--

LOCK TABLES `llx_supplier_proposal_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_supplier_proposal_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_supplier_proposal_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_supplier_proposaldet`
--

DROP TABLE IF EXISTS `llx_supplier_proposaldet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_supplier_proposaldet` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_supplier_proposal` int NOT NULL,
  `fk_parent_line` int DEFAULT NULL,
  `fk_product` int DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `fk_remise_except` int DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_tx` double(7,4) DEFAULT '0.0000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(7,4) DEFAULT '0.0000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int DEFAULT NULL,
  `special_code` int DEFAULT '0',
  `rang` int DEFAULT '0',
  `ref_fourn` varchar(30) DEFAULT NULL,
  `fk_multicurrency` int DEFAULT NULL,
  `multicurrency_code` varchar(3) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_unit` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_supplier_proposaldet_fk_supplier_proposal` (`fk_supplier_proposal`),
  KEY `idx_supplier_proposaldet_fk_product` (`fk_product`),
  KEY `fk_supplier_proposaldet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_supplier_proposaldet_fk_supplier_proposal` FOREIGN KEY (`fk_supplier_proposal`) REFERENCES `llx_supplier_proposal` (`rowid`),
  CONSTRAINT `fk_supplier_proposaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_supplier_proposaldet`
--

LOCK TABLES `llx_supplier_proposaldet` WRITE;
/*!40000 ALTER TABLE `llx_supplier_proposaldet` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_supplier_proposaldet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_supplier_proposaldet_extrafields`
--

DROP TABLE IF EXISTS `llx_supplier_proposaldet_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_supplier_proposaldet_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_supplier_proposaldet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_supplier_proposaldet_extrafields`
--

LOCK TABLES `llx_supplier_proposaldet_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_supplier_proposaldet_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_supplier_proposaldet_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_tva`
--

DROP TABLE IF EXISTS `llx_tva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_tva` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `fk_typepayment` int DEFAULT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `note` text,
  `paye` smallint NOT NULL DEFAULT '0',
  `fk_account` int DEFAULT NULL,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_tva`
--

LOCK TABLES `llx_tva` WRITE;
/*!40000 ALTER TABLE `llx_tva` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_tva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user`
--

DROP TABLE IF EXISTS `llx_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref_employee` varchar(50) DEFAULT NULL,
  `ref_ext` varchar(50) DEFAULT NULL,
  `admin` smallint DEFAULT '0',
  `employee` tinyint DEFAULT '1',
  `fk_establishment` int DEFAULT '0',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `pass_encoding` varchar(24) DEFAULT NULL,
  `pass` varchar(128) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `pass_temp` varchar(128) DEFAULT NULL,
  `api_key` varchar(128) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_state` int DEFAULT '0',
  `fk_country` int DEFAULT '0',
  `birth` date DEFAULT NULL,
  `birth_place` varchar(64) DEFAULT NULL,
  `job` varchar(128) DEFAULT NULL,
  `office_phone` varchar(20) DEFAULT NULL,
  `office_fax` varchar(20) DEFAULT NULL,
  `user_mobile` varchar(20) DEFAULT NULL,
  `personal_mobile` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `personal_email` varchar(255) DEFAULT NULL,
  `signature` text,
  `socialnetworks` text,
  `fk_soc` int DEFAULT NULL,
  `fk_socpeople` int DEFAULT NULL,
  `fk_member` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `fk_user_expense_validator` int DEFAULT NULL,
  `fk_user_holiday_validator` int DEFAULT NULL,
  `idpers1` varchar(128) DEFAULT NULL,
  `idpers2` varchar(128) DEFAULT NULL,
  `idpers3` varchar(128) DEFAULT NULL,
  `note_public` text,
  `note_private` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `datelastlogin` datetime DEFAULT NULL,
  `datepreviouslogin` datetime DEFAULT NULL,
  `datelastpassvalidation` datetime DEFAULT NULL,
  `datestartvalidity` datetime DEFAULT NULL,
  `dateendvalidity` datetime DEFAULT NULL,
  `flagdelsessionsbefore` datetime DEFAULT NULL,
  `iplastlogin` varchar(250) DEFAULT NULL,
  `ippreviouslogin` varchar(250) DEFAULT NULL,
  `egroupware_id` int DEFAULT NULL,
  `ldap_sid` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `statut` tinyint DEFAULT '1',
  `photo` varchar(255) DEFAULT NULL,
  `lang` varchar(6) DEFAULT NULL,
  `color` varchar(6) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `fk_barcode_type` int DEFAULT '0',
  `accountancy_code` varchar(32) DEFAULT NULL,
  `nb_holiday` int DEFAULT '0',
  `thm` double(24,8) DEFAULT NULL,
  `tjm` double(24,8) DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `default_range` int DEFAULT NULL,
  `default_c_exp_tax_cat` int DEFAULT NULL,
  `national_registration_number` varchar(50) DEFAULT NULL,
  `fk_warehouse` int DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_login` (`login`,`entity`),
  UNIQUE KEY `uk_user_fk_socpeople` (`fk_socpeople`),
  UNIQUE KEY `uk_user_fk_member` (`fk_member`),
  UNIQUE KEY `uk_user_api_key` (`api_key`),
  KEY `idx_user_fk_societe` (`fk_soc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user`
--

LOCK TABLES `llx_user` WRITE;
/*!40000 ALTER TABLE `llx_user` DISABLE KEYS */;
INSERT INTO `llx_user` VALUES
('','',1,NULL,NULL,NULL,NULL,'','','2023-11-27 09:34:21',NULL,NULL,NULL,'2023-11-27 09:35:29',NULL,NULL,NULL,NULL,NULL,NULL,'',1,0,'',0,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-11-27 09:34:16','',NULL,NULL,NULL,NULL,'172.18.0.1',NULL,'',NULL,'SuperAdmin','','Haar',NULL,'',0,'','','','',NULL,NULL,'$2y$10$DFK4.YnX5HmZ.jCegpa0NeqvKyj.oeAz6E7pqh0dCTAMhzFLJkXU2',NULL,NULL,'','',NULL,'',NULL,1,NULL,NULL,'','null',1,NULL,NULL,'2023-11-27 09:34:21','','',NULL,'');
/*!40000 ALTER TABLE `llx_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user_alert`
--

DROP TABLE IF EXISTS `llx_user_alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user_alert` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL,
  `fk_contact` int DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_alert`
--

LOCK TABLES `llx_user_alert` WRITE;
/*!40000 ALTER TABLE `llx_user_alert` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user_clicktodial`
--

DROP TABLE IF EXISTS `llx_user_clicktodial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user_clicktodial` (
  `fk_user` int NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `pass` varchar(64) DEFAULT NULL,
  `poste` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_clicktodial`
--

LOCK TABLES `llx_user_clicktodial` WRITE;
/*!40000 ALTER TABLE `llx_user_clicktodial` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_clicktodial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user_employment`
--

DROP TABLE IF EXISTS `llx_user_employment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user_employment` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `ref` varchar(50) DEFAULT NULL,
  `ref_ext` varchar(50) DEFAULT NULL,
  `fk_user` int DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int DEFAULT NULL,
  `fk_user_modif` int DEFAULT NULL,
  `job` varchar(128) DEFAULT NULL,
  `status` int NOT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_employment` (`ref`,`entity`),
  KEY `fk_user_employment_fk_user` (`fk_user`),
  CONSTRAINT `fk_user_employment_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_employment`
--

LOCK TABLES `llx_user_employment` WRITE;
/*!40000 ALTER TABLE `llx_user_employment` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_employment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user_extrafields`
--

DROP TABLE IF EXISTS `llx_user_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_user_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_extrafields`
--

LOCK TABLES `llx_user_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_user_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user_param`
--

DROP TABLE IF EXISTS `llx_user_param`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user_param` (
  `fk_user` int NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `param` varchar(180) NOT NULL,
  `value` text NOT NULL,
  UNIQUE KEY `uk_user_param` (`fk_user`,`param`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_param`
--

LOCK TABLES `llx_user_param` WRITE;
/*!40000 ALTER TABLE `llx_user_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_param` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user_rib`
--

DROP TABLE IF EXISTS `llx_user_rib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user_rib` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `fk_user` int NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(30) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `state_id` int DEFAULT NULL,
  `fk_country` int DEFAULT NULL,
  `currency_code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_rib`
--

LOCK TABLES `llx_user_rib` WRITE;
/*!40000 ALTER TABLE `llx_user_rib` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_user_rib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_user_rights`
--

DROP TABLE IF EXISTS `llx_user_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_user_rights` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_user` int NOT NULL,
  `fk_id` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_rights` (`entity`,`fk_user`,`fk_id`),
  KEY `fk_user_rights_fk_user_user` (`fk_user`),
  CONSTRAINT `fk_user_rights_fk_user_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_user_rights`
--

LOCK TABLES `llx_user_rights` WRITE;
/*!40000 ALTER TABLE `llx_user_rights` DISABLE KEYS */;
INSERT INTO `llx_user_rights` VALUES
(1,121,1,6),
(1,122,1,3),
(1,125,1,5),
(1,126,1,7),
(1,130,1,8),
(1,262,1,9),
(1,281,1,15),
(1,282,1,12),
(1,283,1,14),
(1,286,1,16),
(1,1201,1,19),
(1,1202,1,20),
(1,1251,1,17);
/*!40000 ALTER TABLE `llx_user_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_usergroup`
--

DROP TABLE IF EXISTS `llx_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_usergroup` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(180) NOT NULL,
  `entity` int NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_name` (`nom`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_usergroup`
--

LOCK TABLES `llx_usergroup` WRITE;
/*!40000 ALTER TABLE `llx_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_usergroup_extrafields`
--

DROP TABLE IF EXISTS `llx_usergroup_extrafields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_usergroup_extrafields` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `tms` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_usergroup_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_usergroup_extrafields`
--

LOCK TABLES `llx_usergroup_extrafields` WRITE;
/*!40000 ALTER TABLE `llx_usergroup_extrafields` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_usergroup_extrafields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_usergroup_rights`
--

DROP TABLE IF EXISTS `llx_usergroup_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_usergroup_rights` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_usergroup` int NOT NULL,
  `fk_id` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_rights` (`entity`,`fk_usergroup`,`fk_id`),
  KEY `fk_usergroup_rights_fk_usergroup` (`fk_usergroup`),
  CONSTRAINT `fk_usergroup_rights_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `llx_usergroup` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_usergroup_rights`
--

LOCK TABLES `llx_usergroup_rights` WRITE;
/*!40000 ALTER TABLE `llx_usergroup_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_usergroup_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `llx_usergroup_user`
--

DROP TABLE IF EXISTS `llx_usergroup_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `llx_usergroup_user` (
  `rowid` int NOT NULL AUTO_INCREMENT,
  `entity` int NOT NULL DEFAULT '1',
  `fk_user` int NOT NULL,
  `fk_usergroup` int NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_user` (`entity`,`fk_user`,`fk_usergroup`),
  KEY `fk_usergroup_user_fk_user` (`fk_user`),
  KEY `fk_usergroup_user_fk_usergroup` (`fk_usergroup`),
  CONSTRAINT `fk_usergroup_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_usergroup_user_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `llx_usergroup` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `llx_usergroup_user`
--

LOCK TABLES `llx_usergroup_user` WRITE;
/*!40000 ALTER TABLE `llx_usergroup_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `llx_usergroup_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-27 10:45:34
