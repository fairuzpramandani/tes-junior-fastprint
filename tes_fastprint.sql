-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versi server:                 8.0.30 - MySQL Community Server - GPL
-- OS Server:                    Win64
-- HeidiSQL Versi:               12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Membuang struktur basisdata untuk tes_fastprint
CREATE DATABASE IF NOT EXISTS `tes_fastprint` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tes_fastprint`;

-- membuang struktur untuk table tes_fastprint.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel tes_fastprint.auth_group: ~0 rows (lebih kurang)
DELETE FROM `auth_group`;

-- membuang struktur untuk table tes_fastprint.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel tes_fastprint.auth_group_permissions: ~0 rows (lebih kurang)
DELETE FROM `auth_group_permissions`;

-- membuang struktur untuk table tes_fastprint.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel tes_fastprint.auth_permission: ~36 rows (lebih kurang)
DELETE FROM `auth_permission`;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add kategori', 7, 'add_kategori'),
	(26, 'Can change kategori', 7, 'change_kategori'),
	(27, 'Can delete kategori', 7, 'delete_kategori'),
	(28, 'Can view kategori', 7, 'view_kategori'),
	(29, 'Can add status', 8, 'add_status'),
	(30, 'Can change status', 8, 'change_status'),
	(31, 'Can delete status', 8, 'delete_status'),
	(32, 'Can view status', 8, 'view_status'),
	(33, 'Can add produk', 9, 'add_produk'),
	(34, 'Can change produk', 9, 'change_produk'),
	(35, 'Can delete produk', 9, 'delete_produk'),
	(36, 'Can view produk', 9, 'view_produk');

-- membuang struktur untuk table tes_fastprint.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel tes_fastprint.auth_user: ~0 rows (lebih kurang)
DELETE FROM `auth_user`;

-- membuang struktur untuk table tes_fastprint.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel tes_fastprint.auth_user_groups: ~0 rows (lebih kurang)
DELETE FROM `auth_user_groups`;

-- membuang struktur untuk table tes_fastprint.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel tes_fastprint.auth_user_user_permissions: ~0 rows (lebih kurang)
DELETE FROM `auth_user_user_permissions`;

-- membuang struktur untuk table tes_fastprint.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel tes_fastprint.django_admin_log: ~0 rows (lebih kurang)
DELETE FROM `django_admin_log`;

-- membuang struktur untuk table tes_fastprint.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel tes_fastprint.django_content_type: ~9 rows (lebih kurang)
DELETE FROM `django_content_type`;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'produk', 'kategori'),
	(9, 'produk', 'produk'),
	(8, 'produk', 'status'),
	(6, 'sessions', 'session');

-- membuang struktur untuk table tes_fastprint.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel tes_fastprint.django_migrations: ~5 rows (lebih kurang)
DELETE FROM `django_migrations`;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2026-02-02 15:33:03.404112'),
	(2, 'auth', '0001_initial', '2026-02-02 15:33:03.894765'),
	(3, 'admin', '0001_initial', '2026-02-02 15:33:03.965471'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2026-02-02 15:33:03.970444'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-02-02 15:33:03.975003'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2026-02-02 15:33:04.025167'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2026-02-02 15:33:04.065175'),
	(8, 'auth', '0003_alter_user_email_max_length', '2026-02-02 15:33:04.076180'),
	(9, 'auth', '0004_alter_user_username_opts', '2026-02-02 15:33:04.085567'),
	(10, 'auth', '0005_alter_user_last_login_null', '2026-02-02 15:33:04.119670'),
	(11, 'auth', '0006_require_contenttypes_0002', '2026-02-02 15:33:04.124867'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2026-02-02 15:33:04.131575'),
	(13, 'auth', '0008_alter_user_username_max_length', '2026-02-02 15:33:04.169963'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2026-02-02 15:33:04.207250'),
	(15, 'auth', '0010_alter_group_name_max_length', '2026-02-02 15:33:04.218772'),
	(16, 'auth', '0011_update_proxy_permissions', '2026-02-02 15:33:04.221648'),
	(17, 'auth', '0012_alter_user_first_name_max_length', '2026-02-02 15:33:04.265883'),
	(18, 'produk', '0001_initial', '2026-02-02 15:33:04.366308'),
	(19, 'sessions', '0001_initial', '2026-02-02 15:33:04.389447'),
	(20, 'produk', '0002_produk_gambar', '2026-02-02 16:08:19.751636'),
	(21, 'produk', '0003_remove_produk_gambar', '2026-02-02 16:25:23.016955');

-- membuang struktur untuk table tes_fastprint.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel tes_fastprint.django_session: ~0 rows (lebih kurang)
DELETE FROM `django_session`;

-- membuang struktur untuk table tes_fastprint.kategori
CREATE TABLE IF NOT EXISTS `kategori` (
  `id_kategori` int NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel tes_fastprint.kategori: ~6 rows (lebih kurang)
DELETE FROM `kategori`;
INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
	(1, 'L QUEENLY'),
	(2, 'L MTH AKSESORIS (IM)'),
	(3, 'L MTH TABUNG (LK)'),
	(4, 'SP MTH SPAREPART (LK)'),
	(5, 'CI MTH TINTA LAIN (IM)'),
	(6, 'L MTH AKSESORIS (LK)'),
	(7, 'S MTH STEMPEL (IM)');

-- membuang struktur untuk table tes_fastprint.produk
CREATE TABLE IF NOT EXISTS `produk` (
  `id_produk` int NOT NULL,
  `nama_produk` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `harga` decimal(12,0) NOT NULL,
  `kategori_id` int NOT NULL,
  `status_id` int NOT NULL,
  PRIMARY KEY (`id_produk`),
  KEY `produk_kategori_id_1c4a5c0e_fk_kategori_id_kategori` (`kategori_id`),
  KEY `produk_status_id_b270dde3_fk_status_id_status` (`status_id`),
  CONSTRAINT `produk_kategori_id_1c4a5c0e_fk_kategori_id_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id_kategori`),
  CONSTRAINT `produk_status_id_b270dde3_fk_status_id_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel tes_fastprint.produk: ~31 rows (lebih kurang)
DELETE FROM `produk`;
INSERT INTO `produk` (`id_produk`, `nama_produk`, `harga`, `kategori_id`, `status_id`) VALUES
	(6, 'ALCOHOL GEL POLISH CLEANSER GP-CLN01', 12500, 1, 1),
	(9, 'ALUMUNIUM FOIL ALL IN ONE BULAT 23mm IM', 1000, 2, 1),
	(11, 'ALUMUNIUM FOIL ALL IN ONE BULAT 30mm IM', 1000, 2, 1),
	(12, 'ALUMUNIUM FOIL ALL IN ONE SHEET 250mm IM', 12500, 2, 2),
	(15, 'ALUMUNIUM FOIL HDPE/PE BULAT 23mm IM', 12500, 2, 1),
	(17, 'ALUMUNIUM FOIL HDPE/PE BULAT 30mm IM', 1000, 2, 1),
	(18, 'ALUMUNIUM FOIL HDPE/PE SHEET 250mm IM', 13000, 2, 2),
	(19, 'ALUMUNIUM FOIL PET SHEET 250mm IM', 1000, 2, 2),
	(22, 'ARM PENDEK MODEL U', 13000, 2, 1),
	(23, 'ARM SUPPORT KECIL', 13000, 3, 2),
	(24, 'ARM SUPPORT KOTAK PUTIH', 13000, 2, 2),
	(26, 'ARM SUPPORT PENDEK POLOS', 13000, 3, 1),
	(27, 'ARM SUPPORT S IM', 1000, 2, 2),
	(28, 'ARM SUPPORT T (IMPORT)', 13000, 2, 1),
	(29, 'ARM SUPPORT T - MODEL 1 ( LOKAL )', 10000, 3, 1),
	(50, 'BLACK LASER TONER FP-T3 (100gr)', 13000, 2, 2),
	(56, 'BODY PRINTER CANON IP2770', 500, 4, 1),
	(58, 'BODY PRINTER T13X', 15000, 4, 1),
	(59, 'BOTOL 1000ML BLUE KHUSUS UNTUK EPSON R1800/R800 - 4180 IM (T054920)', 10000, 5, 1),
	(60, 'BOTOL 1000ML CYAN KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4120 IM (T054220)', 10000, 5, 2),
	(61, 'BOTOL 1000ML GLOSS OPTIMIZER KHUSUS UNTUK EPSON R1800/R800/R1900/R2000/IX7000/MG6170 - 4100 IM (T054020)', 1500, 5, 1),
	(62, 'BOTOL 1000ML L.LIGHT BLACK KHUSUS UNTUK EPSON 2400 - 0599 IM', 1500, 5, 2),
	(63, 'BOTOL 1000ML LIGHT BLACK KHUSUS UNTUK EPSON 2400 - 0597 IM', 1500, 5, 2),
	(64, 'BOTOL 1000ML MAGENTA KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4140 IM (T054320)', 1000, 5, 1),
	(65, 'BOTOL 1000ML MATTE BLACK KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 3503 IM (T054820)', 1500, 5, 2),
	(66, 'BOTOL 1000ML ORANGE KHUSUS UNTUK EPSON R1900/R2000 IM - 4190 (T087920)', 1500, 5, 1),
	(67, 'BOTOL 1000ML RED KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4170 IM (T054720)', 1000, 5, 2),
	(68, 'BOTOL 1000ML YELLOW KHUSUS UNTUK EPSON R1800/R800/R1900/R2000 - 4160 IM (T054420)', 1500, 5, 2),
	(70, 'BOTOL KOTAK 100ML LK', 1000, 6, 1),
	(72, 'BOTOL 10ML IM', 1000, 7, 2),
	(73, 'Roller Penarik Kertas', 55000, 2, 1);

-- membuang struktur untuk table tes_fastprint.status
CREATE TABLE IF NOT EXISTS `status` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `nama_status` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Membuang data untuk tabel tes_fastprint.status: ~2 rows (lebih kurang)
DELETE FROM `status`;
INSERT INTO `status` (`id_status`, `nama_status`) VALUES
	(1, 'bisa dijual'),
	(2, 'tidak bisa dijual');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
