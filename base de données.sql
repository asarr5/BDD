-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 17 jan. 2023 à 22:38
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `données clients`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `NumCli` int(11) NOT NULL,
  `Nom` varchar(25) NOT NULL,
  `Prénom` varchar(25) NOT NULL,
  `Email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`NumCli`, `Nom`, `Prénom`, `Email`) VALUES
(150, 'ANIS', 'Silimane', 'silimaneanis12@gmail.com'),
(200, 'Ba', 'Mamadou', 'mamadouba15@gmail.com'),
(345, 'DIOP', 'Ousmane', 'diopousmane02@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `NumCom` int(11) UNSIGNED ZEROFILL NOT NULL,
  `NumLiv` int(11) NOT NULL,
  `NumCli` int(11) NOT NULL,
  `NumProd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`NumCom`, `NumLiv`, `NumCli`, `NumProd`) VALUES
(00000000019, 75, 200, 24),
(00000000059, 23, 345, 11);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE `livreur` (
  `NumLiv` int(11) NOT NULL,
  `Nom` varchar(25) NOT NULL,
  `Prénom` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`NumLiv`, `Nom`, `Prénom`) VALUES
(23, 'Peterle', 'Sylvain'),
(75, 'Borges', 'Michel');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `NumProd` int(11) NOT NULL,
  `NbreProd` varchar(11) DEFAULT NULL,
  `Prix` varchar(11) NOT NULL,
  `Désignation` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`NumProd`, `NbreProd`, `Prix`, `Désignation`) VALUES
(11, '4', '560', 'Grand boubou'),
(24, '2', '210', 'Caftan'),
(65, '2', '70', 'Obasanjo'),
(277, '3', '105', 'Baye Laat');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`NumCli`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`NumCom`),
  ADD KEY `commande_ibfk_1` (`NumLiv`),
  ADD KEY `commande_ibfk_2` (`NumCli`),
  ADD KEY `NumProd` (`NumProd`);

--
-- Index pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`NumLiv`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`NumProd`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `NumCli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=346;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `NumCom` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`NumLiv`) REFERENCES `livreur` (`NumLiv`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`NumCli`) REFERENCES `client` (`NumCli`),
  ADD CONSTRAINT `commande_ibfk_3` FOREIGN KEY (`NumProd`) REFERENCES `produit` (`NumProd`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
