-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 14 déc. 2022 à 00:30
-- Version du serveur : 10.4.24-MariaDB
-- Version de PHP : 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `hitec`
--

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `orders_reference` tinytext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orders_date` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `pictures`
--

CREATE TABLE `pictures` (
  `pictures_id` int(11) NOT NULL,
  `pictures_src` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `products_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `portrait`
--

CREATE TABLE `portrait` (
  `portrait_id` int(11) NOT NULL,
  `portrait_title` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `portrait_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `portrait_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `products_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `products_id` int(11) NOT NULL,
  `products_brand` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `products_reference` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `products_label` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `products_price` int(11) NOT NULL,
  `products_price_ecology` int(11) NOT NULL,
  `products_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `products_status` enum('En attente','En boutique','Retirer') COLLATE utf8mb4_unicode_ci NOT NULL,
  `shopray_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products_orders`
--

CREATE TABLE `products_orders` (
  `products_orders_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `shopray`
--

CREATE TABLE `shopray` (
  `shopray_id` int(11) NOT NULL,
  `shopray_name_ray` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `shopray_name_shop` tinytext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `users_id` int(11) NOT NULL,
  `users_lastname` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_firstname` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `users_role` enum('customer','admin') COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`users_id`, `users_lastname`, `users_firstname`, `users_email`, `users_password`, `users_role`) VALUES
(1, 'ABOUDOU', 'Kolade', 'koladeabd@gmail.com', '123', 'admin'),
(2, 'kolad', 'kola', 'kola@gm.com', '159', 'customer'),
(3, 'DJIDONOU', 'Mathéos', 'math@gmail.com', '$2y$10$Hf4J94.ojNQoIQrVTgZBTuV2yJ8QrNJQveWQlPt9cZtbAtHu3qgRe', 'customer'),
(4, 'Ditban', 'Marcos', 'ban@gmail.com', '$2y$10$P1Z9InHEILmWiytfS7INXe2Swrynq7WWyoqJ3wTGx8.NIPEd.hogS', 'customer'),
(5, 'ADJAYA', 'Exaucée', 'adjaya@gmail.com', '$2y$10$rjsV/dH78saEWMupIAyjbOptEzyjXBqZLwqZvHS1rb6SIhxi.Tlbe', 'customer'),
(6, 'ABOUDOU', 'Koladé', 'freek@gmail.com', '$2y$10$Cp7eFLApwXEegn.1QA7fH.0YClFEt/RoZKYBlTlrxuWJyc1qMBc.C', 'admin');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`),
  ADD KEY `users_id` (`users_id`);

--
-- Index pour la table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`pictures_id`),
  ADD KEY `products_pictures` (`products_id`);

--
-- Index pour la table `portrait`
--
ALTER TABLE `portrait`
  ADD PRIMARY KEY (`portrait_id`),
  ADD KEY `products_id` (`products_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`products_id`),
  ADD KEY `shopray_id` (`shopray_id`);

--
-- Index pour la table `products_orders`
--
ALTER TABLE `products_orders`
  ADD PRIMARY KEY (`products_orders_id`),
  ADD KEY `products_id` (`products_id`,`orders_id`),
  ADD KEY `orders_products_orders` (`orders_id`);

--
-- Index pour la table `shopray`
--
ALTER TABLE `shopray`
  ADD PRIMARY KEY (`shopray_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`users_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `pictures`
--
ALTER TABLE `pictures`
  MODIFY `pictures_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `portrait`
--
ALTER TABLE `portrait`
  MODIFY `portrait_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `products_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products_orders`
--
ALTER TABLE `products_orders`
  MODIFY `products_orders_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `shopray`
--
ALTER TABLE `shopray`
  MODIFY `shopray_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `users_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `users_orders` FOREIGN KEY (`users_id`) REFERENCES `users` (`users_id`);

--
-- Contraintes pour la table `pictures`
--
ALTER TABLE `pictures`
  ADD CONSTRAINT `products_pictures` FOREIGN KEY (`products_id`) REFERENCES `products` (`products_id`);

--
-- Contraintes pour la table `portrait`
--
ALTER TABLE `portrait`
  ADD CONSTRAINT `products_portrait` FOREIGN KEY (`products_id`) REFERENCES `products` (`products_id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `shopray_and_products` FOREIGN KEY (`shopray_id`) REFERENCES `shopray` (`shopray_id`);

--
-- Contraintes pour la table `products_orders`
--
ALTER TABLE `products_orders`
  ADD CONSTRAINT `orders_products_orders` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`orders_id`),
  ADD CONSTRAINT `products_products_orders` FOREIGN KEY (`products_id`) REFERENCES `products` (`products_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
