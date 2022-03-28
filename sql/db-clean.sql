-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server versie:                10.4.20-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Versie:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Databasestructuur van px_beta wordt geschreven
CREATE DATABASE IF NOT EXISTS `px_beta` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `px_beta`;

-- Structuur van  tabel px_beta.characters wordt geschreven
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientId` varchar(50) NOT NULL,
  `ssn` varchar(50) NOT NULL,
  `location` longtext NOT NULL,
  `info` longtext NOT NULL,
  `funds` longtext DEFAULT NULL,
  `meta` longtext NOT NULL,
  `job` longtext NOT NULL,
  `inv` longtext NOT NULL,
  PRIMARY KEY (`ssn`),
  UNIQUE KEY `row_id` (`id`) USING BTREE,
  KEY `FK_characters_players` (`clientId`),
  CONSTRAINT `FK_characters_players` FOREIGN KEY (`clientId`) REFERENCES `players` (`clientId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel px_beta.char_clothes wordt geschreven
CREATE TABLE IF NOT EXISTS `char_clothes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ssn` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `current` tinyint(4) DEFAULT NULL,
  `clothing` longtext NOT NULL,
  `accessoires` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__characters` (`ssn`),
  CONSTRAINT `FK__characters` FOREIGN KEY (`ssn`) REFERENCES `characters` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

-- Structuur van  tabel px_beta.players wordt geschreven
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `clientId` varchar(50) NOT NULL,
  `identifiers` longtext NOT NULL,
  PRIMARY KEY (`clientId`) USING BTREE,
  UNIQUE KEY `row_id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- Data exporteren was gedeselecteerd

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
