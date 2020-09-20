-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Sep 2020 pada 09.42
-- Versi server: 10.1.37-MariaDB
-- Versi PHP: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `absen_unp`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `phone`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Bambang pamungkas', 'bambang@gmail.com', '$2y$10$WaFUf4qb6pNk8eW8FICu5.XsXQ2yJuxK7UdVEWCIF7vZ9lf9zdIwe', '059347504839', NULL, '2020-09-17 07:12:03', '2020-09-17 07:12:03'),
(2, 'Walter White', 'walter@gmail.com', '$2y$10$feOZvvtFjI2pdlpV.ajKz.Qz3njDnvWhA9u1TTGYB9aVl3gWMuI7e', '059347504839', NULL, '2020-09-17 14:16:54', '2020-09-17 14:16:54'),
(3, 'Rudi tabootie', 'rudi@gmail.com', '$2y$10$MDo6yxI3bPkW3CdST3aAoeT.tck.v6kkAiKiy9kLsA1.VlbLIBwPu', '08912325223', NULL, '2020-09-17 16:35:35', '2020-09-17 16:35:35');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cutis`
--

CREATE TABLE `cutis` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `judul` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0: unapproved, 1: approved',
  `tanggal_mulai` date NOT NULL,
  `tanggal_akhir` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `cutis`
--

INSERT INTO `cutis` (`id`, `user_id`, `judul`, `keterangan`, `status`, `tanggal_mulai`, `tanggal_akhir`, `created_at`, `updated_at`) VALUES
(1, 6, 'Izin Urusan Keluarga', 'Kaka saya akan menikah, jadi saya tidak bisa mengikuti pelajaran', '1', '2020-09-21', '2020-09-23', '2020-09-14 06:16:54', '2020-09-17 05:31:54'),
(2, 6, 'Izin Sakit', 'Badan saya panas jadi tidak bisa masuk', '1', '2020-09-27', '2020-09-28', '2020-09-14 06:20:51', '2020-09-14 06:20:51'),
(28, 6, 'Judul cuti', 'Keterangan cuti', '1', '2020-09-25', '2020-09-25', '2020-09-15 14:21:33', '2020-09-16 15:00:04'),
(38, 6, 'izin pulang kampung', 'adik saya sunat', '1', '2020-09-30', '2020-09-30', '2020-09-16 15:35:28', '2020-09-16 15:35:38');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kehadirans`
--

CREATE TABLE `kehadirans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `status` char(1) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '0: Pulang, 1: Hadir',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `imei` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kehadirans`
--

INSERT INTO `kehadirans` (`id`, `user_id`, `location_id`, `status`, `created_at`, `updated_at`, `imei`) VALUES
(11, 6, 3, '1', '2020-09-12 14:57:43', '2020-09-12 14:57:43', '865029031591145'),
(12, 6, 3, '0', '2020-09-12 15:00:39', '2020-09-12 15:00:39', '865029031591145'),
(13, 6, 3, '1', '2020-09-12 15:06:13', '2020-09-12 15:06:13', '865029031591145'),
(14, 6, 3, '1', '2020-09-12 15:32:31', '2020-09-12 15:32:31', '865029031591145'),
(15, 6, 3, '0', '2020-09-12 15:32:36', '2020-09-12 15:32:36', '865029031591145'),
(16, 6, 3, '1', '2020-09-12 15:58:01', '2020-09-12 15:58:01', '865029031591145'),
(17, 6, 3, '1', '2020-09-13 16:04:48', '2020-09-13 16:04:48', '865029031591145'),
(18, 6, 3, '0', '2020-09-13 17:11:10', '2020-09-13 17:11:10', '865029031591145'),
(19, 6, 3, '1', '2020-09-15 12:31:23', '2020-09-15 12:31:23', '865029031591145'),
(20, 6, 3, '0', '2020-09-15 14:22:16', '2020-09-15 14:22:16', '865029031591145'),
(21, 6, 3, '1', '2020-09-16 03:55:37', '2020-09-16 03:55:37', '865029031591145'),
(22, 6, 3, '0', '2020-09-16 04:09:26', '2020-09-16 04:09:26', '865029031591145'),
(23, 2, 3, '1', '2020-09-18 07:09:55', '2020-09-18 07:09:55', '865029031591145'),
(24, 6, 3, '0', '2020-09-18 07:20:36', '2020-09-18 07:20:36', '865029031591145');

-- --------------------------------------------------------

--
-- Struktur dari tabel `locations`
--

CREATE TABLE `locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `locations`
--

INSERT INTO `locations` (`id`, `name`, `address`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 'Kampus 2', 'Mojoroto Gg. 1 No. 6, Kediri, Jawa Timur 64112', '-7.80364590', '112.00552560', '2020-09-10 08:45:37', '2020-09-10 08:45:37'),
(2, 'Kampus 1', 'Jl. KH. Ahmad Dahlan, Mojoroto, Kec. Mojoroto, Kota Kediri, Jawa Timur 64112', '-7.80012700', '112.00286200', '2020-09-10 08:46:04', '2020-09-10 08:46:04'),
(3, 'LocalHost', 'Jalan Semeru Gg. 1, Kediri, Jawa Timur, 64117\nMojoroto Kediri Indonesia', '-7.82686400', '111.99480200', '2020-09-11 08:30:03', '2020-09-11 08:30:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2014_10_12_000000_create_users_table', 1),
(9, '2019_08_19_000000_create_failed_jobs_table', 1),
(10, '2020_09_08_045956_create_admins_table', 1),
(11, '2020_09_08_071535_create_locations_table', 1),
(12, '2020_09_09_015531_create_kehadirans_table', 1),
(14, '2020_09_14_121948_create_cutis_table', 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `npm` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gambar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `address`, `password`, `phone`, `npm`, `remember_token`, `created_at`, `updated_at`, `gambar`) VALUES
(2, 'Rina Moonfang', 'rina@gmail.com', 'Nirvana, NotWorld', '$2y$10$K/faDQTcwrlES6CvaniUO.uCrNHQVRU8S.oymY.VsgkkFXbcnluo2', '081232534523', '18.1.03.02.0132', NULL, '2020-09-11 07:47:45', '2020-09-11 07:47:45', '1561153129.jpg'),
(3, 'neko chan', 'neko@gmail.com', 'neko land', '$2y$10$R9fHbeKrKNKjM6lX.xFAM.K.fRu.3UpzBYCBUFbEkckwJeAR4NPdu', '08965487345', '14.19.76.497.7', NULL, '2020-09-11 08:10:49', '2020-09-11 08:10:49', '3468948.jpg'),
(6, 'Rifqi Arfani', 'rifqi@gmail.com', 'Kediri, Jatim', '$2y$10$Bv/c2Gpx9hTVb3zwXAEa/.MGPIgKqSHbXtBYmo1c6BwEeVxFUOT3S', '081234123423', '18.1.03.02.0144', NULL, '2020-09-11 09:01:23', '2020-09-16 03:42:41', '1889207819.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indeks untuk tabel `cutis`
--
ALTER TABLE `cutis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cutis_user_id_foreign` (`user_id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kehadirans`
--
ALTER TABLE `kehadirans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kehadirans_user_id_foreign` (`user_id`),
  ADD KEY `kehadirans_location_id_foreign` (`location_id`);

--
-- Indeks untuk tabel `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `cutis`
--
ALTER TABLE `cutis`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kehadirans`
--
ALTER TABLE `kehadirans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `locations`
--
ALTER TABLE `locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `cutis`
--
ALTER TABLE `cutis`
  ADD CONSTRAINT `cutis_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ketidakleluasaan untuk tabel `kehadirans`
--
ALTER TABLE `kehadirans`
  ADD CONSTRAINT `kehadirans_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`),
  ADD CONSTRAINT `kehadirans_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
