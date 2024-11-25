-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 25 nov. 2024 à 13:14
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_jobz`
--

-- --------------------------------------------------------

--
-- Structure de la table `candidature`
--

CREATE TABLE `candidature` (
  `id` int(11) NOT NULL,
  `condidat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contenu` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `job_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `candidature`
--

INSERT INTO `candidature` (`id`, `condidat`, `contenu`, `date`, `job_id`) VALUES
(1, 'Rhaiem', 'formation J2EE', '2024-11-18 10:02:11', 7),
(2, 'Salima', 'formation Symfony', '2024-11-18 10:02:11', 7),
(3, 'Rhaiem', 'formation J2EE', '2024-11-18 10:17:46', 8),
(4, 'Salima', 'formation Symfony', '2024-11-18 10:17:46', 8),
(5, 'Rhaiem', 'formation J2EE', '2024-11-22 13:09:46', 9),
(6, 'Salima', 'formation Symfony', '2024-11-22 13:09:46', 9),
(7, 'Rhaiem', 'formation J2EE', '2024-11-25 09:02:06', 10),
(8, 'Salima', 'formation Symfony', '2024-11-25 09:02:06', 10),
(9, 'amine', 'hallo', '2021-10-12 00:00:00', 3);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20241028085101', '2024-10-28 09:51:46', 188),
('DoctrineMigrations\\Version20241118083021', '2024-11-18 09:30:43', 152);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `url`, `alt`) VALUES
(1, 'https://cdn.pixabay.com/photo/2015/10/30/10/03/gold-1013618_960_720.jpg ', 'job de reves'),
(2, 'https://cdn.pixabay.com/photo/2015/10/30/10/03/gold-1013618_960_720.jpg ', 'job de reves'),
(3, 'https://cdn.pixabay.com/photo/2015/10/30/10/03/gold-1013618_960_720.jpg ', 'job de reves'),
(4, 'https://cdn.pixabay.com/photo/2015/10/30/10/03/gold-1013618_960_720.jpg ', 'job de reves'),
(5, 'https://cdn.pixabay.com/photo/2015/10/30/10/03/gold-1013618_960_720.jpg ', 'job de reves');

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expire_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`id`, `type`, `company`, `description`, `expire_at`, `email`, `image_id`) VALUES
(1, 'Développeur', 'SOTORIPOP', 'LARAVEL', '2024-10-28 13:13:08', 'haykel@gmail.com', NULL),
(2, 'Développeur', 'SAGECOM', 'C++', '2024-10-28 13:17:14', 'Amine@gmail.com', NULL),
(3, 'Entreprise', 'MYTEK', 'iot', '2024-10-28 13:18:30', 'mytek@gmail.com', NULL),
(4, 'Développeur', 'vetter', 'python', '2024-11-11 08:56:35', 'vetter@gmail.com', NULL),
(5, 'Développeur', 'vetter', 'python', '2024-11-11 08:56:41', 'vetter@gmail.com', NULL),
(6, 'Développeur', 'vetter', 'python', '2024-11-11 10:25:48', 'vetter@gmail.com', 1),
(7, 'Développeur', 'vetter', 'python', '2024-11-18 10:02:11', 'vetter@gmail.com', 2),
(8, 'Développeur', 'vetter', 'python', '2024-11-18 10:17:46', 'vetter@gmail.com', 3),
(9, 'Développeur', 'vetter', 'python', '2024-11-22 13:09:46', 'vetter@gmail.com', 4),
(10, 'Développeur', 'vetter', 'python', '2024-11-25 09:02:06', 'vetter@gmail.com', 5);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E33BD3B8BE04EA9` (`job_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_FBD8E0F83DA5256D` (`image_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `candidature`
--
ALTER TABLE `candidature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `candidature`
--
ALTER TABLE `candidature`
  ADD CONSTRAINT `FK_E33BD3B8BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Contraintes pour la table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F83DA5256D` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
