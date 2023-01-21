-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : sam. 21 jan. 2023 à 19:34
-- Version du serveur : 5.7.33
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `shop_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(58, 34, 39, 'Le Paulette', 10, 1, 'img-Paulette-hiver.png'),
(59, 34, 35, 'Nos gazeux ', 7, 1, 'img-gazeux.png');

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id`, `name`, `email`, `number`, `message`) VALUES
(19, 'Geoffroy OTEGBEYE', 'geoffroyotegbeye@gmail.com', '55887744', 'Je t&#039;aimerai toujours comme si c&#039;était le début <br />\r\n<br />\r\nAuprès de toi ma vie prend sens. Je t&#039;ai dans la peau, je t&#039;ai dans l&#039;âme. Sans toi je ne suis rien. Tu es ma drogue, mon espérance, tu es mon idéal. Je t&#039;aime.');

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_products` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_price` int(11) NOT NULL,
  `placed_on` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'En attente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `name`, `number`, `email`, `method`, `address`, `total_products`, `total_price`, `placed_on`, `payment_status`) VALUES
(15, 34, 'Geoffroy OTEGBEYE', '40258877', 'geoffroyotegbeye@gmail.com', 'Paiement à la livraison', 'Appartement n°. OTEGBEYE Zogbo Cotonou Littoral Bénin - 0000', ', Le Victor ( 1 ), Vins ( 1 )', 60, '21-Jan-2023', 'En attente');

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name`, `category`, `details`, `price`, `image`) VALUES
(25, 'Les Gargandines', 'a-cote', 'Les meilleur des accompagnements pour un Hamburgé ! Les Gargandines, c’est une recette inspirée des « loaded fries » mais repensée à la mode Big Fernand.', 5, 'img-gargandines-scaled.jpg'),
(27, 'Falade', 'a-cote', 'Pour un accompagnement tout en fraîcheur, optez pour la falade. Du mesclun, des tomates séchées et de la ciboulette, un sans faute pour accompagner votre Hamburgé ou votre Big toasté.', 5, 'img-falade-2.png'),
(28, 'Fernandines', 'a-cote', 'Avant chaque service, les patates sont coupées, blanchies puis frites au moment de votre commande pour vous offrir de délicieuses frites croustillantes et assaisonnées selon votre convenance.', 8, 'img-fernandines.png'),
(29, 'Les Grenailles', 'a-cote', 'De bonnes pommes de terres cuites à la friteuse pour être croustillantes à l’extérieur et fondantes à l’intérieur. Et comme à chaque fois chez nous, toutes les pommes de terre sont directement livrée par notre maraîcher pour vous offrir encore plus de saveurs.', 6, 'img-grenailles-1.png'),
(30, 'La Crème Vanille &amp; Spéculoos', 'desserts', 'On vous en dit plus ?\r\n\r\nVous êtes de vraies crèmes, vous méritez bien une fin de repas mémorable !', 10, 'img-cremevanillespeculoos.png'),
(31, 'Les Archi glaces', 'desserts', 'Plus qu’à fondre pour les glaces artisanales du Maître artisan Philippe Faure, fabriquées à Caumont dans l’Ariège. Chocolat, passion ou framboise, en plus d’avoir des parfums et des saveurs incroyables, les fabrications sont 100% naturelles, sans exhausteurs de goûts, sans arômes artificiels, sans conservateurs et sans colorants. Faudrait être complètement givré pour ne pas les goûter !', 12, 'img-archiglace-1.png'),
(32, 'Le Fondant Baulois', 'desserts', 'Pour que vos panses se réjouissent, ce fondant chocolat et pointe caramel a débarqué tout droit de la Baule, pour notre plus grand plaisir. Le goût des vacances. Si ce n’est pas vous qui allez à la Baule, la Baule viendra à vous.', 3, 'img-fondantbaulois.png'),
(33, 'Nos Cookies', 'desserts', 'Et pourquoi pas une spécialité de la Fabrique Cookies pour finir sur une note croustillante ?  Caramel d’Isigny au sel de Guérande, pralines roses ou chocolat au lait, grand dilemme…les deux sont de vraies pépites.', 2, 'img-cremevanille-min-scaled.jpg'),
(34, 'Limonades Artisanales (Elixirs)', 'boissons', 'Citron, pomme ou encore grenade-menthe-citron, offrez vous une pause rafraîchissante avec nos Élixirs pétillants !', 15, 'img-elixir.png'),
(35, 'Nos gazeux ', 'boissons', 'On va buller et se la couler douce avec eux !\r\n\r\nCoca, Coca Zéro, Coca Cherry, Canada Dry, Liptonic… qu’est ce qui vous ferait plaisir ?', 7, 'img-gazeux.png'),
(36, 'Vins', 'boissons', 'Blanc, rosé ou rouge, laissez-vous tenter par notre Big cave(rne) d’Alibaba !', 50, 'img-vins.png'),
(37, 'Nos eaux', 'boissons', 'Que demande une Vittel à un Perrier ?\r\n\r\n“Alors, ça gaze ?”\r\n\r\nEt oui chez nous vous avez le choix. Eau minérale avec une Vittel ou gazeuse avec un Perrier Fines Bulles ?', 10, 'img-vittel.png'),
(38, 'Formule SMASH FERNAND', 'hamburges', 'Et la recette de notre Smash Fernand ?\r\n\r\n🥩 Bœuf smashé de race Limousine ou Charolaise d’origine française\r\n\r\n🧀 Raclette au lait cru\r\n\r\n🌿 Ciboulette ciselée', 8, 'coverSmash-1.png'),
(39, 'Le Paulette', 'hamburges', 'Filet de poulet mariné (poulet fermier Label Rouge d’origine française),\r\n\r\nTomme de montagne au lait cru,\r\n\r\nOignons confits\r\n\r\nPersil plat', 10, 'img-Paulette-hiver.png'),
(40, 'Le Big Fernand', 'hamburges', 'Généreuse et gourmande : une recette qui nous ressemble !\r\nBœuf de race Limousine ou Charolaise d’origine française,\r\n\r\nTomme de montagne au lait cru,\r\n\r\nTomates séchées,\r\n\r\nPersil plat,', 10, 'img-BF-1.png'),
(41, 'Le Batholomé', 'hamburges', 'La recette du succès🤤\r\nBœuf de race Limousine ou Charolaise d’origine française,\r\n\r\nRaclette au lait cru,\r\n\r\nPoitrine de porc fumée,', 10, 'img-Bartho-1.png'),
(42, 'Le Victor', 'hamburges', 'Une bonne recette pour vous égayer les papilles :\r\n \r\n\r\nVeau d’origine française,\r\n\r\nFourme d’Ambert,\r\n\r\nOignons confits,', 10, 'img-Victor-1.png'),
(43, 'Le Lucien', 'hamburges', 'Une bonne recette pour vous égayer les papilles :\r\n \r\n\r\nVeau d’origine française,\r\n\r\nFourme d’Ambert,\r\n\r\nOignons confits,', 10, 'img-Lucien-1.png');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`, `image`) VALUES
(34, 'Geoffroy OTEGBEYE', 'geoffroyotegbeye@gmail.com', '$2y$10$VvbpQb1oUNBv5os1C5m9t.db8BqM1styGrFDiDhPlhEYfmeyBJpze', 'admin', 'img-user-63cc2ff1ca8350.12502220.png'),
(35, 'Johannes OTEGBEYE', 'otegbeyejohannes00@gmail.com', '$2y$10$Um9jR2p3eAj7KF03Xy.XGeiuZg5EIIIwGYsXpfBhm4pj6CY9TKXmC', 'user', 'default-img.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `pid`, `name`, `price`, `image`) VALUES
(51, 34, 40, 'Le Big Fernand', 10, 'img-BF-1.png'),
(52, 34, 34, 'Limonades Artisanales (Elixirs)', 15, 'img-elixir.png');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT pour la table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
