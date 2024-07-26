-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 24 juil. 2024 à 14:08
-- Version du serveur : 8.0.31
-- Version de PHP : 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `accounts`
--
CREATE DATABASE IF NOT EXISTS `accounts` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `accounts`;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id_category` int NOT NULL,
  `category_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `icon_class` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id_category`, `category_name`, `icon_class`) VALUES
(1, 'Habitation', 'house-door'),
(2, 'Travail', 'person-workspace'),
(3, 'Cadeau', 'gift'),
(4, 'Numérique', 'wifi'),
(5, 'Alimentation', 'egg-fried'),
(6, 'Voyage', 'train-front'),
(7, 'Loisir', 'emoji-smile'),
(8, 'Voiture', 'car-front'),
(9, 'Santé', 'bandaid');

-- --------------------------------------------------------

--
-- Structure de la table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `id_transaction` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `date_transaction` date NOT NULL,
  `id_category` int DEFAULT NULL,
  PRIMARY KEY (`id_transaction`),
  KEY `id_category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `transaction`
--

INSERT INTO `transaction` (`id_transaction`, `name`, `amount`, `date_transaction`, `id_category`) VALUES
(1, 'Bar', '-21.00', '2023-06-10', 7),
(2, 'Loyer de juin 2023', '-432.00', '2023-06-10', 1),
(3, 'RDV médecin', '-25.00', '2023-06-12', 9),
(4, 'Facture électricité', '-62.00', '2023-06-13', 1),
(5, 'Facture eau', '-152.00', '2023-06-13', 1),
(6, 'Essence voiture', '-58.00', '2023-06-19', 8),
(7, 'Course Biocoop', '-35.00', '2023-06-21', 5),
(8, 'Abonnement Sosh mobile', '-12.00', '2023-06-21', 4),
(9, 'Salle de sport', '-69.00', '2023-06-25', 7),
(10, 'Bar', '-32.00', '2023-06-26', 7),
(11, 'Reboursement sécurité sociale', '20.00', '2023-06-30', 9),
(12, 'Course Carrefour', '-60.00', '2023-07-05', 5),
(13, 'Virement salaire juillet 2023', '1326.00', '2023-07-05', 2),
(14, 'Essence voiture', '-59.00', '2023-07-06', 8),
(15, 'Loyer de juillet 2023', '-438.00', '2023-07-10', 1),
(16, 'Bar', '-41.00', '2023-07-12', 7),
(17, 'RDV ophtalmo', '-35.00', '2023-07-13', 9),
(18, 'Facture électricité', '-62.00', '2023-07-13', 1),
(19, 'Course Carrefour ', '-40.00', '2023-07-19', 5),
(20, 'Abonnement Sosh mobile', '-12.00', '2023-07-21', 4),
(21, 'Essence voiture', '-61.00', '2023-07-23', 8),
(22, 'Bar', '-20.00', '2023-07-28', 7),
(23, 'Reboursement sécurité sociale', '28.00', '2023-07-31', 9),
(24, 'Course Biocoop', '-25.00', '2023-08-02', 5),
(25, 'Virement salaire août 2023', '1326.00', '2023-08-04', 2),
(26, 'Essence voiture', '-62.00', '2023-08-09', 8),
(27, 'Billets de train Paris', '-72.00', '2023-08-10', 6),
(28, 'Loyer de août 2023', '-432.00', '2023-08-10', 1),
(29, 'RDV dentiste', '-60.00', '2023-08-13', 9),
(30, 'Bar', '-30.00', '2023-08-13', 7),
(31, 'Facture électricité', '-62.00', '2023-08-13', 1),
(32, 'Course Carrefour ', '-71.00', '2023-08-16', 5),
(33, 'Remise de chèque 1136528 Mamie', '120.00', '2023-08-17', 3),
(34, 'Abonnement Sosh mobile', '-12.00', '2023-08-21', 4),
(35, 'Essence voiture', '-64.00', '2023-08-26', 8),
(36, 'Bar', '-10.00', '2023-08-29', 7),
(37, 'Course Biocoop', '-57.00', '2023-08-30', 5),
(38, 'Reboursement sécurité sociale', '48.00', '2023-08-31', 9),
(39, 'Virement salaire septembre 2023', '1326.00', '2023-09-04', 2),
(40, 'Remise de chèque 1136529 Maman', '80.00', '2023-09-07', 3),
(41, 'Loyer de septembre 2023', '-432.00', '2023-09-10', 1),
(42, 'Essence voiture', '-66.00', '2023-09-12', 8),
(43, 'RDV médecin', '-25.00', '2023-09-13', 9),
(44, 'Course Carrefour ', '-61.00', '2023-09-13', 5),
(45, 'Facture électricité', '-62.00', '2023-09-13', 1),
(46, 'Facture eau', '-152.00', '2023-09-13', 1),
(47, 'Bar', '-17.00', '2023-09-14', 7),
(48, 'Assurance habitation', '-230.00', '2023-09-17', 1),
(49, 'Abonnement Sosh mobile', '-12.00', '2023-09-21', 4),
(50, 'Salle de sport', '-69.00', '2023-09-25', 7),
(51, 'Course Carrefour', '-64.00', '2023-09-27', 5),
(52, 'Essence voiture', '-67.00', '2023-09-29', 8),
(53, 'Restaurant Libanais', '-30.00', '2023-09-30', 7),
(54, 'Bar', '-15.00', '2023-09-30', 7),
(55, 'Abonnement Netflix', '-9.00', '2023-09-30', 4),
(56, 'Reboursement sécurité sociale', '20.00', '2023-10-01', 9),
(57, 'Virement salaire octobre 2023', '1326.00', '2023-10-05', 2),
(58, 'Loyer de octobre 2023', '-432.00', '2023-10-10', 1),
(59, 'Course Biocoop', '-68.00', '2023-10-11', 5),
(60, 'Facture électricité', '-64.00', '2023-10-13', 1),
(61, 'RDV médecin', '-25.00', '2023-10-14', 9),
(62, 'Essence voiture', '-69.00', '2023-10-16', 8),
(63, 'Bar', '-32.00', '2023-10-16', 7),
(64, 'Abonnement Sosh mobile', '-12.00', '2023-10-21', 4),
(65, 'Course Biocoop', '-72.00', '2023-10-25', 5),
(66, 'McDo', '-12.00', '2023-10-30', 7),
(67, 'Abonnement Netflix', '-9.00', '2023-10-30', 4),
(68, 'Reboursement sécurité sociale', '20.00', '2023-11-01', 9),
(69, 'Bar', '-41.00', '2023-11-01', 7),
(70, 'Essence voiture', '-70.00', '2023-11-02', 8),
(71, 'Virement salaire novembre 2023', '1326.00', '2023-11-04', 2),
(72, 'Course Carrefour ', '-75.00', '2023-11-08', 5),
(73, 'BGK', '-18.00', '2023-11-10', 7),
(74, 'Loyer de novembre 2023', '-502.00', '2023-11-10', 1),
(75, 'Facture électricité', '-64.00', '2023-11-13', 1),
(76, 'RDV médecin', '-25.00', '2023-11-14', 9),
(77, 'Bar', '-20.00', '2023-11-17', 7),
(78, 'Essence voiture', '-72.00', '2023-11-19', 8),
(79, 'Abonnement Sosh mobile', '-12.00', '2023-11-21', 4),
(80, 'Course Carrefour', '-79.00', '2023-11-22', 5),
(81, 'Restaurant Italien', '-24.00', '2023-11-25', 7),
(82, 'KFC', '-16.00', '2023-11-30', 7),
(83, 'Abonnement Netflix', '-9.00', '2023-11-30', 4),
(84, 'Reboursement sécurité sociale', '20.00', '2023-12-02', 9),
(85, 'Bar', '-32.00', '2023-12-03', 7),
(86, 'Virement salaire décembre 2023', '1326.00', '2023-12-05', 2),
(87, 'Essence voiture', '-74.00', '2023-12-06', 8),
(88, 'Course Carrefour', '-83.00', '2023-12-06', 5),
(89, 'McDo', '-11.00', '2023-12-10', 7),
(90, 'Loyer de décembre 2023', '-432.00', '2023-12-10', 1),
(91, 'Facture électricité', '-64.00', '2023-12-13', 1),
(92, 'Facture eau', '-152.00', '2023-12-13', 1),
(93, 'RDV kiné', '-35.00', '2023-12-15', 9),
(94, 'Assurance voiture', '-352.00', '2023-12-17', 8),
(95, 'Bar', '-30.00', '2023-12-19', 7),
(96, 'Billets de train Lyon', '-145.00', '2023-12-19', 6),
(97, 'Course Biocoop', '-25.00', '2023-12-20', 5),
(98, 'Abonnement Sosh mobile', '-12.00', '2023-12-21', 4),
(99, 'Essence voiture', '-75.00', '2023-12-23', 8),
(100, 'Salle de sport', '-69.00', '2023-12-25', 7),
(101, 'Abonnement Netflix', '-9.00', '2023-12-30', 4),
(102, 'Reboursement sécurité sociale', '28.00', '2024-01-02', 9),
(103, 'Course Carrefour', '-71.00', '2024-01-03', 5),
(105, 'Virement salaire janvier 2024', '1630.00', '2024-01-04', 2),
(106, 'Essence voiture', '-77.00', '2024-01-09', 8),
(107, 'KFC', '-16.00', '2024-01-10', 7),
(108, 'Loyer de janvier 2024', '-438.00', '2024-01-10', 1),
(109, 'Facture électricité', '-72.00', '2024-01-13', 1),
(110, 'RDV médecin', '-25.00', '2024-01-15', 9),
(111, 'BGK', '-18.00', '2024-01-17', 7),
(112, 'Course Carrefour', '-57.00', '2024-01-17', 5),
(113, 'Bar', '-17.00', '2024-01-20', 7),
(114, 'Abonnement Sosh mobile', '-15.00', '2024-01-21', 4),
(115, 'Essence voiture', '-78.00', '2024-01-26', 8),
(116, 'Abonnement Netflix', '-9.00', '2024-01-30', 4),
(117, 'Course Biocoop', '-61.00', '2024-01-31', 5),
(118, 'Reboursement sécurité sociale', '20.00', '2024-02-02', 9),
(119, 'Virement salaire février 2024', '1326.00', '2024-02-04', 2),
(120, 'Bar', '-15.00', '2024-02-05', 7),
(121, 'Loyer de février 2024', '-432.00', '2024-02-10', 1),
(122, 'Essence voiture', '-80.00', '2024-02-12', 8),
(123, 'Facture électricité', '-72.00', '2024-02-13', 1),
(124, 'Course Carrefour', '-25.00', '2024-02-14', 5),
(125, 'RDV médecin', '-25.00', '2024-02-15', 9),
(126, 'Bar', '-30.00', '2024-02-21', 7),
(127, 'Abonnement Sosh mobile', '-15.00', '2024-02-21', 4),
(128, 'Course Biocoop', '-71.00', '2024-02-28', 5),
(129, 'Essence voiture', '-82.00', '2024-02-29', 8),
(130, 'Restaurant Chinois', '-14.00', '2024-03-01', 7),
(131, 'Abonnement Netflix', '-9.00', '2024-03-01', 4),
(132, 'Reboursement sécurité sociale', '20.00', '2024-03-04', 9),
(133, 'Virement salaire mars 2024', '1326.00', '2024-03-04', 2),
(134, 'Bar', '-10.00', '2024-03-08', 7),
(135, 'Loyer de mars 2024', '-432.00', '2024-03-09', 1),
(136, 'Facture électricité', '-78.00', '2024-03-12', 1),
(137, 'Facture eau', '-152.00', '2024-03-12', 1),
(138, 'Course Carrefour', '-57.00', '2024-03-13', 5),
(139, 'RDV médecin', '-25.00', '2024-03-17', 9),
(140, 'Essence voiture', '-83.00', '2024-03-17', 8),
(141, 'Abonnement Sosh mobile', '-15.00', '2024-03-20', 4),
(142, 'Salle de sport', '-69.00', '2024-03-24', 7),
(143, 'Bar', '-17.00', '2024-03-24', 7),
(144, 'Course Biocoop', '-61.00', '2024-03-27', 5),
(145, 'McDo', '-12.00', '2024-03-29', 7),
(146, 'Abonnement Netflix', '-9.00', '2024-03-29', 4),
(147, 'Essence voiture', '-85.00', '2024-04-03', 8),
(148, 'Virement salaire avril 2024', '1326.00', '2024-04-03', 2),
(149, 'Reboursement sécurité sociale', '20.00', '2024-04-04', 9),
(150, 'Bar', '-15.00', '2024-04-09', 7),
(151, 'Loyer de avril 2024', '-432.00', '2024-04-09', 1),
(152, 'Course Carrefour', '-25.00', '2024-04-10', NULL),
(153, 'Facture électricité', '-78.00', '2024-04-12', 1),
(154, 'BGK', '-18.00', '2024-04-16', 7),
(155, 'RDV médecin', '-25.00', '2024-04-17', NULL),
(156, 'Essence voiture', '-86.00', '2024-04-20', 8),
(157, 'Abonnement Sosh mobile', '-15.00', '2024-04-20', 4),
(158, 'Course Biocoop', '-71.00', '2024-04-24', 5),
(159, 'Bar', '-32.00', '2024-04-25', 7),
(160, 'Billets de train Paris', '-72.00', '2024-04-28', 6),
(161, 'KFC', '-16.00', '2024-04-29', NULL),
(162, 'Abonnement Netflix', '-13.00', '2024-04-29', 4),
(163, 'Virement salaire mai 2024', '1326.00', '2024-05-04', 2),
(164, 'Reboursement sécurité sociale', '20.00', '2024-05-05', 9),
(165, 'Essence voiture', '-88.00', '2024-05-07', 8),
(166, 'Course Carrefour', '-57.00', '2024-05-08', 5),
(167, 'Loyer de mai 2024', '-438.00', '2024-05-09', NULL),
(168, 'Bar', '-30.00', '2024-05-11', 7),
(169, 'Facture électricité', '-80.00', '2024-05-12', 1),
(170, 'RDV dentiste', '-60.00', '2024-05-18', 9),
(171, 'Abonnement Sosh mobile', '-15.00', '2024-05-20', 4),
(172, 'Course Carrefour', '-61.00', '2024-05-22', 5),
(173, 'Essence voiture', '-90.00', '2024-05-24', NULL),
(174, 'Bar', '-10.00', '2024-05-27', 7),
(175, 'Abonnement Netflix', '-13.00', '2024-05-29', 4),
(176, 'Virement salaire juin 2024', '1326.00', '2024-06-03', 2),
(177, 'Reboursement sécurité sociale', '48.00', '2024-06-05', NULL),
(178, 'Course Biocoop', '-57.00', '2024-06-05', 5),
(179, 'Remise de chèque 1136530 Papa', '600.00', '2024-06-06', 3),
(180, 'Loyer de juin 2024', '-432.00', '2024-06-09', NULL),
(181, 'Essence voiture', '-91.00', '2024-06-10', 8),
(182, 'Bar', '-17.00', '2024-06-12', 7),
(183, 'Facture électricité', '-81.00', '2024-06-12', 1),
(184, 'Facture eau', '-152.00', '2024-06-12', 1),
(185, 'RDV dentiste', '-60.00', '2024-06-18', NULL),
(186, 'Course Carrefour', '-61.00', '2024-06-19', 5),
(187, 'Abonnement Sosh mobile', '-15.00', '2024-06-20', 4),
(188, 'Salle de sport', '-69.00', '2024-06-24', 7),
(189, 'Essence voiture', '-93.00', '2024-06-27', NULL),
(190, 'Bar', '-15.00', '2024-06-28', 7),
(191, 'Abonnement Netflix', '-13.00', '2024-06-29', 4),
(192, 'Course Biocoop', '-137.00', '2024-07-03', 5),
(193, 'Virement salaire juillet 2024', '1326.00', '2024-07-04', 2),
(194, 'Reboursement sécurité sociale', '48.00', '2024-07-06', 9),
(195, 'Billets de train Lille', '-89.00', '2024-07-06', NULL),
(196, 'Loyer de juillet 2024', '-432.00', '2024-07-09', 1),
(197, 'Facture électricité', '-83.00', '2024-07-12', 1),
(199, 'Bar', '-32.00', '2024-07-14', NULL),
(201, 'Course Carrefour', '-141.00', '2024-07-17', NULL),
(203, 'Abonnement Sosh mobile', '-15.00', '2024-07-20', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
