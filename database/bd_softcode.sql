-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 13 déc. 2022 à 13:46
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `google-jetstream`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `info`, `image`) VALUES
(1, 'Laravel 9', 'laravel-9', 'Laravel 9 a été publié officiellement. J’en profite pour toiletter mon cours.', '1670236010.png');

-- --------------------------------------------------------

--
-- Structure de la table `category_gerso`
--

CREATE TABLE `category_gerso` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `gerso_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category_gerso`
--

INSERT INTO `category_gerso` (`id`, `category_id`, `gerso_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `category_post`
--

CREATE TABLE `category_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category_post`
--

INSERT INTO `category_post` (`id`, `category_id`, `post_id`) VALUES
(1, 1, 1),
(5, 1, 2),
(6, 1, 3),
(7, 1, 4),
(9, 1, 5),
(10, 1, 6),
(11, 1, 7),
(12, 1, 8),
(13, 1, 9),
(14, 1, 10);

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `_lft` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `_rgt` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `created_at`, `updated_at`, `body`, `_lft`, `_rgt`, `parent_id`, `user_id`, `post_id`) VALUES
(1, '2022-12-05 11:34:32', '2022-12-05 11:34:32', 'Migration Et Modèle Migration Et Modèle Migration Et Modèle Migration Et Modèle Migration Et Modèle Migration Et Modèle Migration Et Modèle Migration Et Modèle Migration Et ModèleMigration Et Modèle Migration Et Modèle Migration Et Modèle Migration Et Modèle Migration Et Modèle Migration Et Modèle Migration Et Modèle Migration Et Modèle', 1, 2, NULL, 1, 5),
(2, '2022-12-05 12:50:35', '2022-12-05 12:50:35', 'Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream Jetstream', 3, 4, NULL, 1, 10),
(3, '2022-12-06 21:09:06', '2022-12-06 21:09:06', 'Classiquement On Prévoit Un Bouton Pour Fermer La Barre De Notification. Là Encore Je Vais Simplifier Parce C’est Aussi Un Traitement Purement Client. Il Suffit D’ajouter Un Peu De Javascript Pour Le Faire (Vous Pouvez Consulter La Documentation De Bulma Sur Le Sujet).', 5, 6, NULL, 1, 10),
(4, '2022-12-06 21:10:05', '2022-12-06 21:10:05', 'Classiquement On Prévoit Un Bouton Pour Fermer La Barre De Notification. Là Encore Je Vais Simplifier Parce C’est Aussi Un Traitement Purement Client. Il Suffit D’ajouter Un Peu De Javascript Pour Le Faire (Vous Pouvez Consulter La Documentation De Bulma Sur Le Sujet).', 7, 8, NULL, 1, 9),
(5, '2022-12-07 11:28:56', '2022-12-07 11:28:56', 'Public Function Definition()\n{\n    Return [\n        \'Title\' => $This->Faker->Sentence(2, True),\n        \'Year\' => $This->Faker->Year,\n        \'Description\' => $This->Faker->Paragraph(),\n    ];\n}', 9, 10, NULL, 1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `fichiers`
--

CREATE TABLE `fichiers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fichiers`
--

INSERT INTO `fichiers` (`id`, `title`, `slug`, `image`) VALUES
(1, 'laravel', 'laravel', '1670237225.zip');

-- --------------------------------------------------------

--
-- Structure de la table `fichier_post`
--

CREATE TABLE `fichier_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fichier_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `fichier_post`
--

INSERT INTO `fichier_post` (`id`, `fichier_id`, `post_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 8),
(8, 1, 9),
(9, 1, 10);

-- --------------------------------------------------------

--
-- Structure de la table `follows`
--

CREATE TABLE `follows` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `href` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `gersos`
--

CREATE TABLE `gersos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `info` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gersos`
--

INSERT INTO `gersos` (`id`, `title`, `slug`, `info`) VALUES
(1, 'I - les bases', 'i-les-bases', 'Il est très important de faire assoire les bases de tous langages des programmantion, pour une bonne assimulation de la matière'),
(2, 'II - Les données', 'ii-les-donnees', 'Laravel 9 A Été Publié Officiellement.'),
(3, 'III – La sécurité', 'iii-la-securite', 'III – La sécurité III – La sécurité III'),
(4, 'IV – Plus loin avec Laravel', 'iv-plus-loin-avec-laravel', 'IV – Plus loin avec Laravel IV');

-- --------------------------------------------------------

--
-- Structure de la table `gerso_post`
--

CREATE TABLE `gerso_post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gerso_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `gerso_post`
--

INSERT INTO `gerso_post` (`id`, `gerso_id`, `post_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 2, 5),
(6, 2, 6),
(7, 2, 7),
(8, 3, 8),
(9, 3, 9),
(10, 3, 10);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_09_24_134844_create_sessions_table', 1),
(7, '2022_09_24_154332_create_notifications_table', 1),
(8, '2022_09_24_154927_add_google_id_column_in_users_tables', 1),
(9, '2022_09_24_160917_create_categories_table', 1),
(10, '2022_09_24_161055_create_gersos_table', 1),
(11, '2022_09_24_161204_create_tags_table', 1),
(12, '2022_09_24_161337_create_posts_table', 1),
(13, '2022_09_24_161452_category_post_table', 1),
(14, '2022_09_24_161543_category_gerso_table', 1),
(15, '2022_09_24_161651_gerso_post_table', 1),
(16, '2022_09_24_161734_post_tag_table', 1),
(17, '2022_09_24_161846_create_comments_table', 1),
(18, '2022_09_24_181314_create_contacts_table', 1),
(19, '2022_09_24_183012_create_pages_table', 1),
(20, '2022_09_24_183422_create_follows_table', 1),
(21, '2022_09_27_114258_create_fichiers_table', 1),
(22, '2022_09_27_114554_fichier_post_table', 1),
(23, '2022_10_01_100840_create_softcodes_table', 1),
(24, '2022_10_07_211232_add_phone_column_in_users_table', 1),
(25, '2022_10_24_134228_create_payments_table', 1);

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('176bc068-beca-4111-a6bb-3e6c18fefe07', 'App\\Notifications\\ModelCreated', 'App\\Models\\Post', 4, '[]', NULL, '2022-12-05 10:55:56', '2022-12-05 10:55:56'),
('216f5b46-81df-46e8-b574-28a3c02527a2', 'App\\Notifications\\ModelCreated', 'App\\Models\\Post', 2, '[]', NULL, '2022-12-05 10:51:15', '2022-12-05 10:51:15'),
('261ba51d-69d8-423c-923a-1bbb01361770', 'App\\Notifications\\ModelCreated', 'App\\Models\\Post', 3, '[]', NULL, '2022-12-05 10:53:55', '2022-12-05 10:53:55'),
('35e0aee9-5a34-4ae7-9733-21f9a1c306d2', 'App\\Notifications\\ModelCreated', 'App\\Models\\Post', 9, '[]', NULL, '2022-12-05 11:50:29', '2022-12-05 11:50:29'),
('57998675-a434-4d31-ab43-b48d3dcec8f3', 'App\\Notifications\\ModelCreated', 'App\\Models\\Post', 1, '[]', NULL, '2022-12-05 09:50:54', '2022-12-05 09:50:54'),
('5bc0650e-da1a-4fe6-87d0-131723b64cb6', 'App\\Notifications\\ModelCreated', 'App\\Models\\User', 1, '[]', NULL, '2022-12-05 09:20:37', '2022-12-05 09:20:37'),
('6bdc4182-e5a2-4aeb-89d2-e16846305302', 'App\\Notifications\\ModelCreated', 'App\\Models\\Post', 8, '[]', NULL, '2022-12-05 11:45:50', '2022-12-05 11:45:50'),
('7fb7c518-a3a9-412f-9c32-3a67d5c90ed4', 'App\\Notifications\\ModelCreated', 'App\\Models\\Post', 10, '[]', NULL, '2022-12-05 12:10:03', '2022-12-05 12:10:03'),
('940789ea-785a-402e-a312-49e306884046', 'App\\Notifications\\ModelCreated', 'App\\Models\\Comment', 5, '[]', NULL, '2022-12-07 11:28:58', '2022-12-07 11:28:58'),
('999f7c52-6ced-4522-ad5c-d227090ea39c', 'App\\Notifications\\ModelCreated', 'App\\Models\\Comment', 4, '[]', NULL, '2022-12-06 21:10:06', '2022-12-06 21:10:06'),
('a7cb679f-7a4b-4a04-8cf8-eac0dab4132c', 'App\\Notifications\\ModelCreated', 'App\\Models\\Comment', 1, '[]', NULL, '2022-12-05 11:34:32', '2022-12-05 11:34:32'),
('b722c9a7-7d06-47af-a0aa-289d05e0aaa8', 'App\\Notifications\\ModelCreated', 'App\\Models\\Post', 6, '[]', NULL, '2022-12-05 11:32:28', '2022-12-05 11:32:28'),
('cef5acfe-1ee4-4a99-8f96-87d55690eb73', 'App\\Notifications\\ModelCreated', 'App\\Models\\Comment', 2, '[]', NULL, '2022-12-05 12:50:36', '2022-12-05 12:50:36'),
('dc576f2a-46f2-4bd3-ad52-5c0c982cc789', 'App\\Notifications\\ModelCreated', 'App\\Models\\Comment', 3, '[]', NULL, '2022-12-06 21:09:09', '2022-12-06 21:09:09'),
('efd87956-a995-4a96-9adc-559c7aeb2417', 'App\\Notifications\\ModelCreated', 'App\\Models\\Post', 5, '[]', NULL, '2022-12-05 11:29:38', '2022-12-05 11:29:38'),
('f689780f-d646-4013-b924-f05a6f69bff6', 'App\\Notifications\\ModelCreated', 'App\\Models\\Post', 7, '[]', NULL, '2022-12-05 11:36:37', '2022-12-05 11:36:37');

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `slug`, `title`, `body`) VALUES
(1, 'actualites', 'Actualités', '<p><em>Laravel 9 A &Eacute;t&eacute; Publi&eacute; Officiellement. J&rsquo;en Profite Pour Toiletter Mon Cours.&nbsp;Laravel 9 A &Eacute;t&eacute; Publi&eacute; Officiellement. J&rsquo;en Profite Pour Toiletter Mon Cours.Laravel 9 A &Eacute;t&eacute; Publi&eacute; Officiellement. J&rsquo;en Profite Pour Toiletter Mon Cours.Laravel 9 A &Eacute;t&eacute; Publi&eacute; Officiellement. J&rsquo;en Profite Pour Toiletter Mon Cours.</em></p>'),
(2, 'politique-de-confidentialite', 'Politique de confidentialité', '<p>Laravel 9 A &Eacute;t&eacute; Publi&eacute; Officiellement. J&rsquo;en Profite Pour Toiletter Mon Cours.&nbsp;Laravel 9 A &Eacute;t&eacute; Publi&eacute; Officiellement. J&rsquo;en Profite Pour Toiletter Mon Cours.&nbsp;Laravel 9 A &Eacute;t&eacute; Publi&eacute; Officiellement. J&rsquo;en Profite Pour Toiletter Mon Cours.&nbsp;Laravel 9 A &Eacute;t&eacute; Publi&eacute; Officiellement. J&rsquo;en Profite Pour Toiletter Mon Cours.</p>'),
(3, 'mentions-legales', 'Mentions légales', '<p>Laravel 9 A &Eacute;t&eacute; Publi&eacute; Officiellement. J&rsquo;en Profite Pour Toiletter Mon Cours.&nbsp;Laravel 9 A &Eacute;t&eacute; Publi&eacute; Officiellement. J&rsquo;en Profite Pour Toiletter Mon Cours.&nbsp;Laravel 9 A &Eacute;t&eacute; Publi&eacute; Officiellement. J&rsquo;en Profite Pour Toiletter Mon Cours.&nbsp;Laravel 9 A &Eacute;t&eacute; Publi&eacute; Officiellement. J&rsquo;en Profite Pour Toiletter Mon Cours.&nbsp;&nbsp;Laravel 9 A &Eacute;t&eacute; Publi&eacute; Officiellement. J&rsquo;en Profite Pour Toiletter Mon Cours.</p>');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payement_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(10,2) NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `created_at`, `updated_at`, `title`, `slug`, `seo_title`, `excerpt`, `body`, `meta_description`, `meta_keywords`, `active`, `image`, `user_id`) VALUES
(1, '2022-12-05 09:50:52', '2022-12-06 20:29:01', 'Présentation générale', 'presentation-generale', 'présentation', 'Dans ce premier chapitre je vais évoquer PHP, son historique rapide et sa situation actuelle. Je vais aussi expliquer l’intérêt d’utiliser un framework pour ce langage et surtout pourquoi j’ai choisi Laravel. J’évoquerai enfin le patron MVC et la Programmation Orientée Objet.', '<h2>Un framework ?</h2>\r\n\r\n<h3>Approche personnelle</h3>\r\n\r\n<p>PHP est un langage populaire et accessible. Il est facile &agrave; installer et pr&eacute;sent chez tous les h&eacute;bergeurs. C&rsquo;est un langage riche et plut&ocirc;t facile &agrave; aborder, surtout pour quelqu&rsquo;un qui a d&eacute;j&agrave; des bases en programmation. On peut r&eacute;aliser rapidement une application web fonctionnelle gr&acirc;ce &agrave; lui. Mais le revers de cette simplicit&eacute; est que bien souvent le code cr&eacute;&eacute; est confus, complexe, sans aucune coh&eacute;rence. Il faut reconna&icirc;tre que PHP n&rsquo;encourage pas &agrave; organiser son code et rien n&rsquo;oblige &agrave; le faire.</p>\r\n\r\n<p>Lorsqu&rsquo;on cr&eacute;e des applications PHP on finit par avoir des routines personnelles toutes pr&ecirc;tes pour les fonctionnalit&eacute;s r&eacute;currentes, par exemple pour g&eacute;rer des pages de fa&ccedil;on dynamique. Une fois qu&rsquo;on a cr&eacute;&eacute; une fonction ou une classe pour r&eacute;aliser une t&acirc;che il est naturel d&rsquo;aller la chercher lorsque la m&ecirc;me situation se pr&eacute;sente. Puisque c&rsquo;est une biblioth&egrave;que personnelle et qu&rsquo;on est seul ma&icirc;tre &agrave; bord il faut &eacute;videmment la mettre &agrave; jour lorsque c&rsquo;est n&eacute;cessaire, et c&rsquo;est parfois fastidieux.</p>\r\n\r\n<p>En g&eacute;n&eacute;ral on a aussi une hi&eacute;rarchie de dossiers &agrave; laquelle on est habitu&eacute; et on la reproduit quand on commence le d&eacute;veloppement d&rsquo;une nouvelle application. On se rend compte des fois que cette habitude a des effets pervers parce que la hi&eacute;rarchie qu&rsquo;on met ainsi en place de fa&ccedil;on syst&eacute;matique n&rsquo;est pas forc&eacute;ment la plus adapt&eacute;e.</p>\r\n\r\n<p>En r&eacute;sum&eacute; l&rsquo;approche personnelle est plut&ocirc;t du bricolage &agrave; la hauteur de ses comp&eacute;tences et de sa disponibilit&eacute;.</p>\r\n\r\n<h3>(Re)d&eacute;couvrir PHP</h3>\r\n\r\n<p>Lorsque j&rsquo;ai d&eacute;couvert PHP &agrave; la fin du dernier mill&eacute;naire (&ccedil;a fait plus impressionnant dit comme &ccedil;a ) il en &eacute;tait &agrave; la version 3. C&rsquo;&eacute;tait essentiellement un langage de script en g&eacute;n&eacute;ral m&eacute;lang&eacute; au HTML qui permettait de faire du templating, des acc&egrave;s aux donn&eacute;es et du traitement. La version 4 en 2000 a apport&eacute; plus de stabilit&eacute; et une &eacute;bauche de l&rsquo;approche objet. Mais il a fallu attendre la version 5 en 2004 pour disposer d&rsquo;un langage de programmation &agrave; la hauteur du standard existant pour les autres langages. Ensuite la version 7, puis la 8, n&rsquo;ont fait que renforcer le s&eacute;rieux de ce langage.</p>\r\n\r\n<p>Cette &eacute;volution incite &agrave; perdre les mauvaises habitudes si on en avait. Un site comme&nbsp;<a href=\"http://www.phptherightway.com/\" rel=\"noopener noreferrer\" target=\"_blank\">http://www.phptherightway.com</a>&nbsp;offre des pistes pour mettre en place de bonnes pratiques. Donc si vous &ecirc;tes un bidouilleur de code PHP je vous conseille cette saine lecture qui devrait vous offrir un nouvel &eacute;clairage sur ce langage et surtout vous permettre de vous lancer de fa&ccedil;on correcte dans le code de Laravel.</p>\r\n\r\n<h3>Un framework</h3>\r\n\r\n<p>D&rsquo;apr&egrave;s Wikipedia un framework informatique est un &laquo;&nbsp;ensemble coh&eacute;rent de composants logiciels structurels, qui sert &agrave; cr&eacute;er les fondations ainsi que les grandes lignes de tout ou d&rsquo;une partie d&rsquo;un logiciel&nbsp;&raquo;. Autrement dit une base homog&egrave;ne avec des briques toutes pr&ecirc;tes &agrave; disposition. Il existe des frameworks pour tous les langages de programmation et en particulier pour PHP. En faire la liste serait laborieux tant il en existe !</p>\r\n\r\n<p>L&rsquo;utilit&eacute; d&rsquo;un framework est d&rsquo;&eacute;viter de passer du temps &agrave; d&eacute;velopper ce qui a d&eacute;j&agrave; &eacute;t&eacute; fait par d&rsquo;autres souvent plus comp&eacute;tents et qui a en plus &eacute;t&eacute; utilis&eacute; et valid&eacute; par de nombreux utilisateurs. On peut imaginer un framework comme un ensemble d&rsquo;outils &agrave; disposition. Par exemple je dois faire du routage pour mon site, je prends un composant d&eacute;j&agrave; tout pr&ecirc;t et qui a fait ses preuves et je l&rsquo;utilise : gain de temps, fiabilit&eacute;, mise &agrave; jour si n&eacute;cessaire&hellip;</p>\r\n\r\n<p>Il serait vraiment dommage de se passer d&rsquo;un framework alors que le fait d&rsquo;en utiliser un pr&eacute;sente pratiquement uniquement des avantages.</p>\r\n\r\n<h2>Pourquoi Laravel ?</h2>\r\n\r\n<h3>Constitution de Laravel</h3>\r\n\r\n<p>Laravel, cr&eacute;&eacute; par Taylor Otwel, initie une nouvelle fa&ccedil;on de concevoir un framework en utilisant ce qui existe de mieux pour chaque fonctionnalit&eacute;. Par exemple toute application web a besoin d&rsquo;un syst&egrave;me qui g&egrave;re les requ&ecirc;tes HTTP. Plut&ocirc;t que de r&eacute;inventer quelque chose, le concepteur de Laravel a tout simplement utilis&eacute; celui de&nbsp;<strong>Symfony</strong>&nbsp;en l&rsquo;&eacute;tendant pour cr&eacute;er un syst&egrave;me de routage efficace. En quelque sorte Otwel a fait son march&eacute; parmi toutes les biblioth&egrave;ques disponibles. Nous verrons dans ce cours comment cela est r&eacute;alis&eacute;. Mais Laravel ce n&rsquo;est pas seulement le regroupement de biblioth&egrave;ques existantes (d&rsquo;ailleurs quelques mauvaises langues insistent l&agrave; dessus), c&rsquo;est aussi de nombreux composants originaux et surtout une orchestration de tout &ccedil;a.</p>\r\n\r\n<p>Vous allez trouver dans Laravel :</p>\r\n\r\n<ul>\r\n	<li>un syst&egrave;me de routage (RESTFul et ressources),</li>\r\n	<li>un cr&eacute;ateur de requ&ecirc;tes SQL et un ORM,</li>\r\n	<li>un moteur de template,</li>\r\n	<li>un syst&egrave;me d&rsquo;authentification pour les connexions,</li>\r\n	<li>un syst&egrave;me de validation,</li>\r\n	<li>un syst&egrave;me de pagination,</li>\r\n	<li>un syst&egrave;me de migration pour les bases de donn&eacute;es,</li>\r\n	<li>un syst&egrave;me d&rsquo;envoi d&rsquo;emails,</li>\r\n	<li>un syst&egrave;me de cache,</li>\r\n	<li>un syst&egrave;me de gestion des &eacute;v&eacute;nements,</li>\r\n	<li>un syst&egrave;me d&rsquo;autorisations,</li>\r\n	<li>une gestion des sessions,</li>\r\n	<li>un syst&egrave;me de localisation,</li>\r\n	<li>un syst&egrave;me de notifications&hellip;</li>\r\n</ul>\r\n\r\n<p>Et d&rsquo;autres choses encore que nous allons d&eacute;couvrir ensemble. Il est probable que certains &eacute;l&eacute;ments de cette liste ne vous &eacute;voquent pas grand-chose, mais ce n&rsquo;est pas important pour le moment, tout cela deviendra plus clair au fil des chapitres.</p>\r\n\r\n<h2>MVC ? POO ?</h2>\r\n\r\n<h3>MVC</h3>\r\n\r\n<p>On peut difficilement parler d&rsquo;un framework sans &eacute;voquer le patron&nbsp;<strong>Mod&egrave;le-Vue-Contr&ocirc;leur</strong>. Pour certains il s&rsquo;agit de la cl&eacute; de vo&ucirc;te de toute application rigoureuse, pour d&rsquo;autres c&rsquo;est une contrainte qui emp&ecirc;che d&rsquo;organiser judicieusement son code. De quoi s&rsquo;agit-il ? Voici un petit sch&eacute;ma pour y voir clair :</p>\r\n\r\n<p><a href=\"http://127.0.0.1:8000/storage/photos/1/laravel.png\" target=\"_self\"><img alt=\"\" src=\"http://127.0.0.1:8000/storage/photos/1/maxresdefault.jpg\" style=\"height:260px; margin-left:100px; margin-right:100px; width:430px\" /></a></p>\r\n\r\n<h2>En r&eacute;sum&eacute;</h2>\r\n\r\n<ul>\r\n	<li>Un framework fait gagner du temps et donne l&rsquo;assurance de disposer de composants bien cod&eacute;s et fiables</li>\r\n	<li>Laravel est un framework novateur, complet, qui utilise les possibilit&eacute;s les plus r&eacute;centes de PHP et qui est impeccablement cod&eacute; et organis&eacute;</li>\r\n	<li>La documentation de Laravel est compl&egrave;te, pr&eacute;cise et de nombreux tutoriels et exemples sont disponibles sur la toile</li>\r\n	<li>Laravel adopte le patron MVC mais ne l&rsquo;impose pas, il est totalement orient&eacute; objet</li>\r\n</ul>', 'presentation', 'prensent', 1, 'laravel.png', 1),
(2, '2022-12-05 10:51:15', '2022-12-05 10:51:15', 'Un environement de developpement', 'un-environement-de-developpement', 'environement de developpement', 'Un environement de developpement Un environement de developpement Un environement de developpement Un environement de developpement', '<p>Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpementUn environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpementUn environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement&nbsp;Un environement de developpement</p>', 'environement', 'enviro', 1, '5.PNG', 1),
(3, '2022-12-05 10:53:55', '2022-12-05 10:53:55', 'Installation et organisation', 'installation-et-organisation', 'installation', 'Installation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisation', '<p>Installation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisationInstallation et organisation</p>', 'innst', 'insta', 1, 'S2.PNG', 1),
(4, '2022-12-05 10:55:56', '2022-12-05 10:55:56', 'Le routage', 'le-routage', 'le routage', 'Le routage Le routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routage', '<p>Le routage Le routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routage Le routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routage Le routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routage Le routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routage Le routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routage Le routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routageLe routage</p>', 'routage', 'routage', 1, 'Capture.PNG', 1),
(5, '2022-12-05 11:29:38', '2022-12-05 11:29:38', 'Migration et Modèle', 'migration-et-modele', 'migration et route', 'Migration et Modèle Migration et Modèle Migration et Modèle Migration et Modèle Migration et Modèle Migration et Modèle Migration et Modèle Migration et Modèle Migration et Modèle', '<p>Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;leMigration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;leMigration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;leMigration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;leMigration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le Migration et Mod&egrave;le</p>', 'migration', 'migrat', 1, '5.PNG', 1),
(6, '2022-12-05 11:32:27', '2022-12-05 11:32:27', 'Jouer avec Eloquent', 'jouer-avec-eloquent', 'jouer avec eloquant', 'Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent  Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent', '<p>Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent &nbsp;Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec EloquentJouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent &nbsp;Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec EloquentJouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent &nbsp;Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec EloquentJouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent &nbsp;Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent Jouer avec Eloquent</p>', 'eloquante', 'eloquante', 1, 'S2.PNG', 1),
(7, '2022-12-05 11:36:37', '2022-12-06 20:58:37', 'Les ressources (1/2)', 'les-ressources-1-2', 'le ressource', 'Dans ce chapitre nous allons commencer à étudier les ressources qui permettent de créer des routes « CRUD » (Create, Read, Update, Delete) adaptées à la persistance de données. Comme exemple pratique nous allons prendre le cas d’une table de films.', '<h2>Les donn&eacute;es</h2>\r\n\r\n<p>On repart d&rsquo;un Laravel vierge et on cr&eacute;e une base comme on l&rsquo;a vu pr&eacute;c&eacute;demment. Appelons la par exemple&nbsp;<strong>laravel9</strong>&nbsp;pour faire original. On renseigne le fichier&nbsp;<strong>.env</strong>&nbsp;en cons&eacute;quence :</p>\r\n\r\n<p><code>DB_CONNECTION=mysql</code></p>\r\n\r\n<p><code>DB_HOST=127.0.0.1</code></p>\r\n\r\n<p><code>DB_PORT=3306</code></p>\r\n\r\n<p><code>DB_DATABASE=soft_pharma</code></p>\r\n\r\n<p><code>DB_USERNAME=root</code></p>\r\n\r\n<p><code>DB_PASSWORD=</code></p>\r\n\r\n<h3>La migration</h3>\r\n\r\n<p>On va cr&eacute;er avec Artisan le mod&egrave;le&nbsp;<strong>Film</strong>&nbsp;en m&ecirc;me temps que la migration :</p>\r\n\r\n<p><code>php artisan make:model Film --migration</code></p>\r\n\r\n<p><code><a href=\"http://127.0.0.1:8000/storage/photos/1/model.PNG\" target=\"_self\"><img alt=\"\" src=\"http://127.0.0.1:8000/storage/photos/1/model.PNG\" style=\"height:166px; margin-left:100px; margin-right:100px; width:300px\" /></a></code></p>\r\n\r\n<p><code><a href=\"http://127.0.0.1:8000/storage/photos/1/migration.PNG\" target=\"_self\"><img alt=\"\" src=\"http://127.0.0.1:8000/storage/photos/1/migration.PNG\" style=\"height:35px; margin-left:200px; margin-right:200px; width:400px\" /></a></code></p>\r\n\r\n<p>Pour faire simple on va se contenter de 3 colonnes pour le titre du film, son ann&eacute;e de sortie et sa description :</p>\r\n\r\n<pre>\r\n<code>public function up()\r\n{\r\n    Schema::create(&#39;films&#39;, function (Blueprint $table) {\r\n        $table-&gt;id();\r\n        $table-&gt;string(&#39;title&#39;);\r\n        $table-&gt;year(&#39;year&#39;);\r\n        $table-&gt;text(&#39;description&#39;);\r\n        $table-&gt;timestamps();\r\n    });\r\n}</code></pre>\r\n\r\n<p>On a ce code :</p>\r\n\r\n<pre>\r\n<code>&lt;?php\r\n\r\nnamespace Database\\Factories;\r\n\r\nuse Illuminate\\Database\\Eloquent\\Factories\\Factory;\r\n\r\n/**\r\n * @extends \\Illuminate\\Database\\Eloquent\\Factories\\Factory&lt;\\App\\Models\\Film&gt;\r\n */\r\nclass FilmFactory extends Factory\r\n{\r\n    /**\r\n     * Define the model&#39;s default state.\r\n     *\r\n     * @return array\r\n     */\r\n    public function definition()\r\n    {\r\n        return [\r\n            //\r\n        ];\r\n    }\r\n}</code></pre>\r\n\r\n<pre>\r\npublic function definition()\r\n{\r\n    return [\r\n        &#39;title&#39; =&gt; $this-&gt;faker-&gt;sentence(2, true),\r\n        &#39;year&#39; =&gt; $this-&gt;faker-&gt;year,\r\n        &#39;description&#39; =&gt; $this-&gt;faker-&gt;paragraph(),\r\n    ];\r\n}</pre>\r\n\r\n<pre>\r\n&lt;?php\r\n\r\nnamespace App\\Http\\Requests;\r\n\r\nuse Illuminate\\Foundation\\Http\\FormRequest;\r\n\r\nclass Film extends FormRequest\r\n{\r\n    /**\r\n     * Determine if the user is authorized to make this request.\r\n     *\r\n     * @return bool\r\n     */\r\n    public function authorize()\r\n    {\r\n        return true;\r\n    }\r\n\r\n    /**\r\n     * Get the validation rules that apply to the request.\r\n     *\r\n     * @return array\r\n     */\r\n    public function rules()\r\n    {\r\n        return [\r\n            &#39;title&#39; =&gt; [&#39;required&#39;, &#39;string&#39;, &#39;max:100&#39;],\r\n            &#39;year&#39; =&gt; [&#39;required&#39;, &#39;numeric&#39;, &#39;min:1950&#39;, &#39;max:&#39; . date(&#39;Y&#39;)],\r\n            &#39;description&#39; =&gt; [&#39;required&#39;, &#39;string&#39;, &#39;max:500&#39;],\r\n        ];\r\n    }\r\n}</pre>\r\n\r\n<hr />\r\n<h2>En r&eacute;sum&eacute;</h2>\r\n\r\n<ul>\r\n	<li>Une ressource dans Laravel est constitu&eacute;e d&rsquo;un contr&ocirc;leur comportant les 7 m&eacute;thodes permettant une gestion compl&egrave;te.</li>\r\n	<li>Les routes vers une ressource sont cr&eacute;&eacute;es avec une simple ligne de code.</li>\r\n	<li>Laravel permet de mettre en place facilement une pagination, il faut adapter l&rsquo;apparence en fonction du framework CSS qu&rsquo;on utilise.</li>\r\n	<li>On peut mettre en place dans le routage une liaison&nbsp;implicite&nbsp;pour g&eacute;n&eacute;rer automatiquement une instance de la classe&nbsp;dont l&rsquo;identifiant est pass&eacute;e dans l&rsquo;url.</li>\r\n</ul>', 'ressource', 'ressource', 1, 'github.PNG', 1),
(8, '2022-12-05 11:45:50', '2022-12-05 12:12:17', 'L’authentification', 'l-authentification', 'authentification', 'une authentification est une maniere de faire  une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire', '<p>une authentification est une maniere de faire &nbsp;une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire&nbsp;une authentification est une maniere de faire &nbsp;une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire&nbsp;une authentification est une maniere de faire &nbsp;une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire&nbsp;une authentification est une maniere de faire &nbsp;une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire&nbsp;une authentification est une maniere de faire &nbsp;une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire une authentification est une maniere de faire&nbsp;</p>', 'authentif', 'authentification', 1, '5.PNG', 1),
(9, '2022-12-05 11:50:29', '2022-12-05 12:57:06', 'L’oubli du mot de passe', 'l-oubli-du-mot-de-passe', 'oubli du mot de passe', 'L’oubli du mot de passeL’oubli du mot de passeL’oubli du mot de passeL’oubli du mot de passeL’oubli du mot de passeL’oubli du mot de passeL’oubli du mot de passeL’oubli du mot de passeL’oubli du mot de passeL’oubli du mot de passeL’oubli du mot de passe', '<p>L&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passeL&rsquo;oubli du mot de passe</p>', 'oubli', 'oubli', 1, '5.PNG', 1),
(10, '2022-12-05 12:10:03', '2022-12-06 21:06:29', 'Jetstream', 'jetstream', 'jestreame', 'Classiquement on prévoit un bouton pour fermer la barre de notification. Là encore je vais simplifier parce c’est aussi un traitement purement client. Il suffit d’ajouter un peu de Javascript pour le faire (vous pouvez consulter la documentation de Bulma sur le sujet).', '<p>Classiquement on pr&eacute;voit un bouton pour fermer la barre de notification. L&agrave; encore je vais simplifier parce c&rsquo;est aussi un traitement purement client. Il suffit d&rsquo;ajouter un peu de Javascript pour le faire (vous pouvez consulter la documentation de Bulma sur le sujet).</p>\r\n\r\n<p><a href=\"http://127.0.0.1:8000/storage/photos/1/1.PNG\" target=\"_self\"><img alt=\"\" src=\"http://127.0.0.1:8000/storage/photos/1/1.PNG\" style=\"height:140px; margin-left:100px; margin-right:100px; width:500px\" /></a></p>\r\n\r\n<p>Comme pour la m&eacute;thode show on utilise une liaison implicite et on obtient du coup imm&eacute;diatement une instance du mod&egrave;le. Comme c&rsquo;est un peu brutal comme suppression il peut &ecirc;tre judicieux de fournir un message de confirmation pour l&rsquo;utilisateur. Je ne vais pas le faire ici pour ne pas trop alourdir le projet et il s&rsquo;agit uniquement de traitement c&ocirc;t&eacute; client.</p>\r\n\r\n<p>Par contre apr&egrave;s la suppression il faut afficher quelque chose pour dire que l&rsquo;op&eacute;ration s&rsquo;est r&eacute;alis&eacute;e correctement. On voit qu&rsquo;il y a une redirection avec la m&eacute;thode&nbsp;<strong>back</strong>&nbsp;qui renvoie la m&ecirc;me page. D&rsquo;autre part la m&eacute;thode&nbsp;<strong>with</strong>&nbsp;permet de flasher une information dans la session. Cette information ne sera valide que pour la requ&ecirc;te suivante. Dans notre vue&nbsp;<strong>index</strong>&nbsp;on va pr&eacute;voir quelque chose pour afficher cette information :</p>\r\n\r\n<p><code>@if ($paginator-&gt;hasPages())</code></p>\r\n\r\n<p><code>&lt;nav class=&quot;pagination is-centered&quot; role=&quot;navigation&quot; aria-label=&quot;pagination&quot;&gt;</code></p>\r\n\r\n<p><code>{{-- Previous Page Link --}}</code></p>\r\n\r\n<p><code>@if ($paginator-&gt;onFirstPage())</code></p>\r\n\r\n<p><code>&lt;a class=&quot;pagination-previous&quot; disabled&gt;@lang(&#39;pagination.previous&#39;)&lt;/a&gt;</code></p>\r\n\r\n<p><code>@else</code></p>\r\n\r\n<p><code>&lt;a class=&quot;pagination-previous&quot; href=&quot;{{ $paginator-&gt;previousPageUrl() }}&quot;&gt;@lang(&#39;pagination.previous&#39;)&lt;/a&gt;</code></p>\r\n\r\n<p><code>@endif</code></p>\r\n\r\n<p><code>{{-- Next Page Link --}}</code></p>\r\n\r\n<p><code>@if ($paginator-&gt;hasMorePages())</code></p>\r\n\r\n<p><code>&lt;a class=&quot;pagination-next&quot; href=&quot;{{ $paginator-&gt;nextPageUrl() }}&quot;&gt;@lang(&#39;pagination.next&#39;)&lt;/a&gt;</code></p>\r\n\r\n<p><code>@else</code></p>\r\n\r\n<p><code>&lt;a class=&quot;pagination-next&quot; disabled&gt;@lang(&#39;pagination.next&#39;)&lt;/a&gt;</code></p>\r\n\r\n<p><code>@endif</code></p>\r\n\r\n<p><code>{{-- Pagination Elements --}}</code></p>\r\n\r\n<p><code>&lt;ul class=&quot;pagination-list&quot;&gt;</code></p>\r\n\r\n<p><code>@foreach ($elements as $element)</code></p>\r\n\r\n<p><code>{{-- &quot;Three Dots&quot; Separator --}}</code></p>\r\n\r\n<p><code>@if (is_string($element))</code></p>\r\n\r\n<p><code>&lt;li&gt;&lt;span class=&quot;pagination-ellipsis&quot;&gt;&amp;hellip;&lt;/span&gt;&lt;/li&gt;</code></p>\r\n\r\n<p><code>@endif</code></p>\r\n\r\n<p><code>{{-- Array Of Links --}}</code></p>\r\n\r\n<p><code>@if (is_array($element))</code></p>\r\n\r\n<p><code>@foreach ($element as $page =&gt; $url)</code></p>\r\n\r\n<p><code>@if ($page == $paginator-&gt;currentPage())</code></p>\r\n\r\n<p><code>&lt;li&gt;&lt;a class=&quot;pagination-link is-current&quot; aria-label=&quot;Goto page {{ $page }}&quot;&gt;{{ $page }}&lt;/a&gt;&lt;/li&gt;</code></p>\r\n\r\n<p><code>@else</code></p>\r\n\r\n<p><code>&lt;li&gt;&lt;a href=&quot;{{ $url }}&quot; class=&quot;pagination-link&quot; aria-label=&quot;Goto page {{ $page }}&quot;&gt;{{ $page }}&lt;/a&gt;&lt;/li&gt;</code></p>\r\n\r\n<p><code>@endif</code></p>\r\n\r\n<p><code>@endforeach</code></p>\r\n\r\n<p><code>@endif</code></p>\r\n\r\n<p><code>@endforeach</code></p>\r\n\r\n<p><code>&lt;/ul&gt;</code></p>\r\n\r\n<p><code>&lt;/nav&gt;</code></p>\r\n\r\n<p><code>@endif</code></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><code>@extends(&#39;template&#39;)</code></p>\r\n\r\n<p><code>@section(&#39;content&#39;)</code></p>\r\n\r\n<p><code>&lt;div class=&quot;card&quot;&gt;</code></p>\r\n\r\n<p><code>&lt;header class=&quot;card-header&quot;&gt;</code></p>\r\n\r\n<p><code>&lt;p class=&quot;card-header-title&quot;&gt;Films&lt;/p&gt;</code></p>\r\n\r\n<p><code>&lt;/header&gt;</code></p>\r\n\r\n<p><code>&lt;div class=&quot;card-content&quot;&gt;</code></p>\r\n\r\n<p><code>&lt;div class=&quot;content&quot;&gt;</code></p>\r\n\r\n<p><code>&lt;table class=&quot;table is-hoverable&quot;&gt;</code></p>\r\n\r\n<p><code>&lt;thead&gt;</code></p>\r\n\r\n<p><code>&lt;tr&gt;</code></p>\r\n\r\n<p><code>&lt;th&gt;#&lt;/th&gt;</code></p>\r\n\r\n<p><code>&lt;th&gt;Titre&lt;/th&gt;</code></p>\r\n\r\n<p><code>&lt;th&gt;&lt;/th&gt;</code></p>\r\n\r\n<p><code>&lt;th&gt;&lt;/th&gt;</code></p>\r\n\r\n<p><code>&lt;th&gt;&lt;/th&gt;</code></p>\r\n\r\n<p><code>&lt;/tr&gt;</code></p>\r\n\r\n<p><code>&lt;/thead&gt;</code></p>\r\n\r\n<p><code>&lt;tbody&gt;</code></p>\r\n\r\n<p><code>@foreach($films as $film)</code></p>\r\n\r\n<p><code>&lt;tr&gt;</code></p>\r\n\r\n<p><code>&lt;td&gt;{{ $film-&gt;id }}&lt;/td&gt;</code></p>\r\n\r\n<p><code>&lt;td&gt;&lt;strong&gt;{{ $film-&gt;title }}&lt;/strong&gt;&lt;/td&gt;</code></p>\r\n\r\n<p><code>&lt;td&gt;&lt;a class=&quot;button is-primary&quot; href=&quot;{{ route(&#39;films.show&#39;, $film-&gt;id) }}&quot;&gt;Voir&lt;/a&gt;&lt;/td&gt;</code></p>\r\n\r\n<p><code>&lt;td&gt;&lt;a class=&quot;button is-warning&quot; href=&quot;{{ route(&#39;films.edit&#39;, $film-&gt;id) }}&quot;&gt;Modifier&lt;/a&gt;&lt;/td&gt;</code></p>\r\n\r\n<p><code>&lt;td&gt;</code></p>\r\n\r\n<p><code>&lt;form action=&quot;{{ route(&#39;films.destroy&#39;, $film-&gt;id) }}&quot; method=&quot;post&quot;&gt;</code></p>\r\n\r\n<p><code>@csrf</code></p>\r\n\r\n<p><code>@method(&#39;DELETE&#39;)</code></p>\r\n\r\n<p><code>&lt;button class=&quot;button is-danger&quot; type=&quot;submit&quot;&gt;Supprimer&lt;/button&gt;</code></p>\r\n\r\n<p><code>&lt;/form&gt;</code></p>\r\n\r\n<p><code>&lt;/td&gt;</code></p>\r\n\r\n<p><code>&lt;/tr&gt;</code></p>\r\n\r\n<p><code>@endforeach</code></p>\r\n\r\n<p><code>&lt;/tbody&gt;</code></p>\r\n\r\n<p><code>&lt;/table&gt;</code></p>\r\n\r\n<p><code>&lt;/div&gt;</code></p>\r\n\r\n<p><code>&lt;/div&gt;</code></p>\r\n\r\n<p><code>&lt;/div&gt;</code></p>\r\n\r\n<p><code>@endsection</code></p>', 'jetsream', 'jestream', 1, 'laravel.png', 1);

-- --------------------------------------------------------

--
-- Structure de la table `post_tag`
--

CREATE TABLE `post_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `tag_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0N76j0JTgBqt3bhFrdpZrQ13peuaXmaRduO9hzpc', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieWR1bEdKbGtqc3lzOUtrR3NXb3g0NkxhS05uVWtQVGl2M2JsNlphUCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670775948),
('6JjzJSwR2lsZjbsW4MAznK3lrB1yfAxR8DDTnjyL', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZE03Y3RTWElFcnVId0ltc0cyZktobW1VMW9sMWZDYW5Tc2xEa3VsVCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670775946),
('6vW1QTH4mLuX9xAjJDy37aTIhTjDiUijjSHsNLBK', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUEJ0MXh6R1lya2ZqclJ0WWlFeVFoUTNmWFhOVHB3NlViSGtyUXV0aSI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0MToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL3Bvc3RzLzEwL2VkaXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670775951),
('GygTCoZAwu3V49X2e2BNOVLmhNZL5uQhjK1UMmwN', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicnIyeGV0cUd1bUVIQmpremRFWFdWVmpzdmZpTzF6RDFLVDZzcG1oeCI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo0MToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2FkbWluL3Bvc3RzLzEwL2VkaXQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1670775982),
('SnqevZdej8jX3IKu5QdiJxnvPmli5KxqKzrBciTU', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWE5iaDNlUXNaRTFmS0hSVExxalhWNmE3VVdSQzZtSlFuSlRMT0J0VyI7czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1670791530),
('tFnzBjAPCviWg1c3ugs1ruUMaVWIc9atAeenHW0O', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ3IwTDFZY0pSZk5pV0UxejF5dWhCSllYekRKZTlMZUd6bDZsSGE2WiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1670768503);

-- --------------------------------------------------------

--
-- Structure de la table `softcodes`
--

CREATE TABLE `softcodes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_infos` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `home_infos_sub` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `softcodes`
--

INSERT INTO `softcodes` (`id`, `name`, `address`, `email`, `home_infos`, `home_infos_sub`, `created_at`, `updated_at`) VALUES
(2, 'Softcode', '+243 816 14 757', 'softcode.gersogni@gmail.com', 'Bienvenue dans softcode un site d\'apprentissage en ligne de l\'informatique', 'Bienvenue dans softcode un site d\'apprentissage en ligne de l\'informatique, nous sommes disponible sur youtube et facebook', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `role` enum('user','redac','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `role`, `valid`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `google_id`, `phone`) VALUES
(1, 'Bashiya', 'gersogniyampanya@gmail.com', NULL, '$2y$10$zvwq3EUAHv8W3mj290S93eEZQTCYmJ03YFLSC2R05xaPLNws4JBlK', NULL, NULL, NULL, 'admin', 1, 'bkhhPznTMHgo1o05lnRZFxqvikDunJLayMI8owVQwvKucrRXw1hiBiYs2mjb', NULL, NULL, '2022-12-05 09:20:37', '2022-12-06 21:11:00', NULL, NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_title_unique` (`title`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`);

--
-- Index pour la table `category_gerso`
--
ALTER TABLE `category_gerso`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_gerso_category_id_foreign` (`category_id`),
  ADD KEY `category_gerso_gerso_id_foreign` (`gerso_id`);

--
-- Index pour la table `category_post`
--
ALTER TABLE `category_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_post_category_id_foreign` (`category_id`),
  ADD KEY `category_post_post_id_foreign` (`post_id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `fichiers`
--
ALTER TABLE `fichiers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fichiers_title_unique` (`title`),
  ADD UNIQUE KEY `fichiers_slug_unique` (`slug`);

--
-- Index pour la table `fichier_post`
--
ALTER TABLE `fichier_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fichier_post_fichier_id_foreign` (`fichier_id`),
  ADD KEY `fichier_post_post_id_foreign` (`post_id`);

--
-- Index pour la table `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `gersos`
--
ALTER TABLE `gersos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gersos_title_unique` (`title`),
  ADD UNIQUE KEY `gersos_slug_unique` (`slug`);

--
-- Index pour la table `gerso_post`
--
ALTER TABLE `gerso_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gerso_post_gerso_id_foreign` (`gerso_id`),
  ADD KEY `gerso_post_post_id_foreign` (`post_id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Index pour la table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Index pour la table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_tag_post_id_foreign` (`post_id`),
  ADD KEY `post_tag_tag_id_foreign` (`tag_id`);

--
-- Index pour la table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Index pour la table `softcodes`
--
ALTER TABLE `softcodes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_tag_unique` (`tag`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `category_gerso`
--
ALTER TABLE `category_gerso`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `category_post`
--
ALTER TABLE `category_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `fichiers`
--
ALTER TABLE `fichiers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `fichier_post`
--
ALTER TABLE `fichier_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `follows`
--
ALTER TABLE `follows`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `gersos`
--
ALTER TABLE `gersos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `gerso_post`
--
ALTER TABLE `gerso_post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `post_tag`
--
ALTER TABLE `post_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `softcodes`
--
ALTER TABLE `softcodes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `category_gerso`
--
ALTER TABLE `category_gerso`
  ADD CONSTRAINT `category_gerso_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_gerso_gerso_id_foreign` FOREIGN KEY (`gerso_id`) REFERENCES `gersos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `category_post`
--
ALTER TABLE `category_post`
  ADD CONSTRAINT `category_post_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `fichier_post`
--
ALTER TABLE `fichier_post`
  ADD CONSTRAINT `fichier_post_fichier_id_foreign` FOREIGN KEY (`fichier_id`) REFERENCES `fichiers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fichier_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `gerso_post`
--
ALTER TABLE `gerso_post`
  ADD CONSTRAINT `gerso_post_gerso_id_foreign` FOREIGN KEY (`gerso_id`) REFERENCES `gersos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `gerso_post_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `post_tag_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
