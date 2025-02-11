-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jan 2025 pada 15.37
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel-test`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `grup`
--

CREATE TABLE `grup` (
  `grupid` varchar(36) NOT NULL,
  `nama_grup` varchar(36) NOT NULL,
  `created_by` varchar(36) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `finish_at` datetime(3) DEFAULT NULL,
  `open_user` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `roomid` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `grup`
--

INSERT INTO `grup` (`grupid`, `nama_grup`, `created_by`, `created_at`, `finish_at`, `open_user`, `status`, `userId`, `roomid`) VALUES
('148ba633-4156-43a4-8064-e4b5e290f21e', 'Grup Testing 4', 'Admin Untuk Testing', '2024-12-12 01:57:58.311', NULL, 1, 'open', '57cab79f-78fb-42b0-a3da-2b3f57596b7e', '675a482002147c4bc59fddbe'),
('d99f51dd-2e38-4706-9cdb-ef933ff98fe3', 'Umroh 2026 Januari', 'Ust Herlin', '2024-12-10 07:35:03.868', NULL, 1, 'open', '3d934706-3cc4-4fc2-ad76-a9e675f49c03', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `perjalanan`
--

CREATE TABLE `perjalanan` (
  `perjalananid` varchar(36) NOT NULL,
  `nama_perjalanan` varchar(100) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `perjalanan`
--

INSERT INTO `perjalanan` (`perjalananid`, `nama_perjalanan`, `sort_order`) VALUES
('91b8ea5e-0cb4-4213-89b5-a0b55be4beb7', 'Manasik', 0),
('d0b942c2-c4e7-4c59-b747-877d58d5d3bc', 'Umroh', 0),
('e8edfa36-f93e-48ce-86eb-247bc7fb8d37', 'Tawaf wada', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `peserta_grup`
--

CREATE TABLE `peserta_grup` (
  `peserta_grupid` varchar(36) NOT NULL,
  `grupid` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `roomid` varchar(191) DEFAULT NULL,
  `joinedAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `online` varchar(10) NOT NULL,
  `usersGoogleId` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `peserta_grup`
--

INSERT INTO `peserta_grup` (`peserta_grupid`, `grupid`, `userId`, `roomid`, `joinedAt`, `online`, `usersGoogleId`) VALUES
('067e60d5-1621-424e-86d9-6b80ea6314e6', 'd99f51dd-2e38-4706-9cdb-ef933ff98fe3', '545c7baa-bdde-4e6e-bf2f-8c567eaffac3', NULL, '2024-12-10 07:37:56.097', '0', NULL),
('35213b60-e8b8-42b2-a23b-f58d760db384', 'd99f51dd-2e38-4706-9cdb-ef933ff98fe3', '21e66b08-16ce-45af-bebd-9739fdf01139', NULL, '2024-12-25 04:03:52.617', '1', NULL),
('716e22de-40ec-4332-9ff8-bf1623dafddd', 'd99f51dd-2e38-4706-9cdb-ef933ff98fe3', 'af0d3785-a9a9-41a0-9a93-7b66481affb5', NULL, '2024-12-25 04:03:08.178', '1', NULL),
('8832b6c7-1772-453d-857d-846a1c4740f5', '148ba633-4156-43a4-8064-e4b5e290f21e', 'a594e5cb-f7d2-4d80-bcc8-8569e95c9f1c', NULL, '2024-12-30 03:55:24.070', '1', NULL),
('bdb4c7fa-c5f8-41fe-9e29-a0df5d9a28d3', '148ba633-4156-43a4-8064-e4b5e290f21e', '74c65e86-2183-4f96-b116-53afd5c159db', NULL, '2025-01-02 04:02:01.304', '0', NULL),
('f42b23c6-cb2f-4c89-8074-28d65678912e', 'd99f51dd-2e38-4706-9cdb-ef933ff98fe3', 'f77de55a-eea4-4535-b6df-4d213579942f', NULL, '2024-12-10 07:41:02.963', '0', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `profiles`
--

CREATE TABLE `profiles` (
  `profileid` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `whatsapp` varchar(191) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `userId` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `profiles`
--

INSERT INTO `profiles` (`profileid`, `name`, `whatsapp`, `photo`, `createdAt`, `updatedAt`, `userId`) VALUES
('119a512e-cef3-4aae-8cd8-c5fffd91de1f', 'Ust Herlin', '087741250305', 'https://api.dicebear.com/8.x/identicon/svg?seed=Ust Herlin', '2024-12-10 07:34:14.111', '2024-12-10 07:34:14.111', '3d934706-3cc4-4fc2-ad76-a9e675f49c03'),
('1ace3288-6090-4352-80f6-f91e5beac8df', 'Ustadz Fauzan', '082312343212', 'https://api.dicebear.com/8.x/identicon/svg?seed=Ustadz Fauzan', '2024-12-10 07:35:02.721', '2024-12-10 07:35:02.721', '74c65e86-2183-4f96-b116-53afd5c159db'),
('1c474608-ae45-47a1-851d-c63b7f71899b', 'Fery', '082312343213', 'https://api.dicebear.com/8.x/identicon/svg?seed=Fery', '2024-12-10 07:35:36.098', '2024-12-10 07:35:36.098', '545c7baa-bdde-4e6e-bf2f-8c567eaffac3'),
('4b0c4464-6530-4648-8290-4a1c9270d1bd', 'Ade Fery', '082312343223', 'https://api.dicebear.com/8.x/identicon/svg?seed=Ade Fery', '2024-12-10 07:36:04.346', '2024-12-10 07:36:04.346', 'a594e5cb-f7d2-4d80-bcc8-8569e95c9f1c'),
('73a68e81-20ee-4096-8430-3f99fd73c994', 'Admin Untuk Testing', '082312343217', 'https://api.dicebear.com/8.x/identicon/svg?seed=Admin Untuk Testing', '2024-12-11 08:28:08.447', '2024-12-11 08:28:08.447', '57cab79f-78fb-42b0-a3da-2b3f57596b7e'),
('76aaf3d0-c204-481d-9c80-2389f8ae00bd', 'Ade Fery', '082312343228', 'https://api.dicebear.com/8.x/identicon/svg?seed=Ade Fery', '2024-12-10 07:36:50.637', '2024-12-10 07:36:50.637', '6f853bbb-c118-47e8-9604-16d66ff8301e'),
('7b40dd99-8737-47f9-b862-c887c2b51651', 'Ade Feryy', '082312343224', 'https://api.dicebear.com/8.x/identicon/svg?seed=Ade Fery', '2024-12-10 07:36:14.269', '2024-12-20 10:36:57.506', '83795b10-061b-42a4-8fb9-75ab4e0bd847'),
('7d0e9240-fc2b-44fb-b483-9e7933522ceb', 'Ust Herlin admin', '087741250308', 'https://api.dicebear.com/8.x/identicon/svg?seed=Ust Herlin admin', '2024-12-10 07:39:06.079', '2024-12-10 07:39:06.079', '1e79ee3f-89d5-4918-aaef-da899227d509'),
('7f352f52-5e21-4c61-a47c-81168566b841', 'miftah', '087741250377', 'https://api.dicebear.com/8.x/identicon/svg?seed=miftah', '2024-12-25 03:59:11.236', '2024-12-25 03:59:11.236', 'af0d3785-a9a9-41a0-9a93-7b66481affb5'),
('8115c738-90fa-40ea-bfcb-faab9e918d19', 'Angriawan', '082312343225', 'https://api.dicebear.com/8.x/identicon/svg?seed=Ade Fery', '2024-12-10 07:36:26.654', '2024-12-10 07:41:21.605', 'f77de55a-eea4-4535-b6df-4d213579942f'),
('9d9d3a98-1752-4f73-840d-7f234180b034', 'Raihan', '082312343211', 'https://api.dicebear.com/8.x/identicon/svg?seed=Raihan', '2024-12-10 07:34:18.930', '2024-12-10 07:34:18.930', '754a35a4-195d-4c21-86e0-f1d3cc39b44a'),
('9dc9cc42-8f35-44f8-8b2a-df50c53144ea', 'Ade Fery', '082312343227', 'https://api.dicebear.com/8.x/identicon/svg?seed=Ade Fery', '2024-12-10 07:36:43.416', '2024-12-10 07:36:43.416', '8bfba152-b881-4a8c-98cc-06185d330d4c'),
('a7146d74-d737-40d7-97c2-c40f51416a9c', 'Ade Fery', '082312343210', 'https://api.dicebear.com/8.x/identicon/svg?seed=Ade Fery', '2024-12-10 07:37:07.939', '2024-12-10 07:37:07.939', 'f20c96f7-58d8-452e-9fdf-e401ef23642d'),
('c3ac0049-ccff-433a-a827-b939f412478e', 'Ade Fery', '082312343229', 'https://api.dicebear.com/8.x/identicon/svg?seed=Ade Fery', '2024-12-10 07:36:58.108', '2024-12-10 07:36:58.108', 'd3b077bc-be1e-4671-88f0-7a9a8607072e'),
('ca5bcd8d-5ffb-4110-a679-2b2fa08ad80b', 'Ade Fery', '082312343226', 'https://api.dicebear.com/8.x/identicon/svg?seed=Ade Fery', '2024-12-10 07:36:36.224', '2024-12-10 07:36:36.224', '37c74edf-0cc5-40a9-8336-1b314ab37938'),
('e7ab919d-6877-46ee-af94-69190a3da1b3', 'Ust Herlin', '087741250303', 'https://api.dicebear.com/8.x/identicon/svg?seed=Ust Herlin', '2024-12-10 07:36:01.895', '2024-12-10 07:36:01.895', 'f8063fbb-0586-4a75-957c-ef3085e21882'),
('f3720f5f-3e9f-4877-b533-451fe7a05a39', 'User Test', '082312343261', 'https://api.dicebear.com/8.x/identicon/svg?seed=User Test', '2024-12-25 04:03:28.306', '2024-12-25 04:03:28.306', '21e66b08-16ce-45af-bebd-9739fdf01139');

-- --------------------------------------------------------

--
-- Struktur dari tabel `progress`
--

CREATE TABLE `progress` (
  `progressid` varchar(36) NOT NULL,
  `grupid` varchar(36) NOT NULL,
  `jenis_perjalanan` varchar(20) NOT NULL,
  `live` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `progress`
--

INSERT INTO `progress` (`progressid`, `grupid`, `jenis_perjalanan`, `live`, `status`) VALUES
('3911e51d-e66b-40b7-9a78-bd7d00fe63d8', '148ba633-4156-43a4-8064-e4b5e290f21e', 'Manasik', 0, 1),
('56bce8c2-7b13-4d58-a76c-c9e9e7e0df8f', 'd99f51dd-2e38-4706-9cdb-ef933ff98fe3', 'Manasik', 0, 1),
('613307fe-f206-40d5-8005-02c31c4ca26f', '148ba633-4156-43a4-8064-e4b5e290f21e', 'Umroh', 0, 1),
('79eb5bee-b665-40e5-831d-26ef0f0c60b7', '148ba633-4156-43a4-8064-e4b5e290f21e', 'Tawaf wada', 0, 1),
('ef4063bd-3d7e-49c1-841b-d239a5179b10', '148ba633-4156-43a4-8064-e4b5e290f21e', 'Manasik', 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `progress_perjalanan`
--

CREATE TABLE `progress_perjalanan` (
  `progress_perjalananid` varchar(36) NOT NULL,
  `progressid` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `perjalananid` varchar(36) NOT NULL,
  `waktu_mulai` datetime(3) NOT NULL,
  `time_selesai` datetime(3) DEFAULT NULL,
  `usersGoogleId` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `progress_perjalanan`
--

INSERT INTO `progress_perjalanan` (`progress_perjalananid`, `progressid`, `userId`, `perjalananid`, `waktu_mulai`, `time_selesai`, `usersGoogleId`) VALUES
('05027df7-6381-4ca6-9fea-4ece55383006', '56bce8c2-7b13-4d58-a76c-c9e9e7e0df8f', 'af0d3785-a9a9-41a0-9a93-7b66481affb5', '91b8ea5e-0cb4-4213-89b5-a0b55be4beb7', '2024-12-25 04:04:08.065', '2024-12-25 04:09:54.177', NULL),
('aff07f9b-ab4c-4c80-a1be-cf305af9e4ae', '56bce8c2-7b13-4d58-a76c-c9e9e7e0df8f', '21e66b08-16ce-45af-bebd-9739fdf01139', '91b8ea5e-0cb4-4213-89b5-a0b55be4beb7', '2024-12-25 04:04:08.065', '2024-12-25 04:09:54.177', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `room`
--

CREATE TABLE `room` (
  `id` varchar(36) NOT NULL,
  `nama_room` varchar(100) NOT NULL,
  `token_speaker` varchar(1000) NOT NULL,
  `token_listener` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `room`
--

INSERT INTO `room` (`id`, `nama_room`, `token_speaker`, `token_listener`) VALUES
('675a482002147c4bc59fddbe', 'Room 2024-12-12T02:19:11.841Z', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2ZXJzaW9uIjoyLCJ0eXBlIjoiYXBwIiwiYXBwX2RhdGEiOm51bGwsImFjY2Vzc19rZXkiOiI2NzIzMzhhMzMzY2U3NGFiOWJlOTQ1NjkiLCJyb29tX2lkIjoiNjc1YTQ4MjAwMjE0N2M0YmM1OWZkZGJlIiwidXNlcl9pZCI6Ijc0YzY1ZTg2LTIxODMtNGY5Ni1iMTE2LTUzYWZkNWMxNTlkYiIsImV4cCI6MTczNjIyMjM4NSwiaWF0IjoxNzM2MTM1OTg1LCJuYmYiOjE3MzYxMzU5ODUsImlzcyI6IjY3MjMzOGEzMzNjZTc0YWI5YmU5NDU2NyIsInN1YiI6ImFwaSIsImp0aSI6ImRjOGY0MDMyLTI2NDctNGE3NS05NDU5LTk3YzAwM2ZhNzc3YiIsInJvbGUiOiJzcGVha2VyIn0.duXvL0q54iW1uvHynlLhIerPaYkg6RrABmiH05AiXUk', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2ZXJzaW9uIjoyLCJ0eXBlIjoiYXBwIiwiYXBwX2RhdGEiOm51bGwsImFjY2Vzc19rZXkiOiI2NzIzMzhhMzMzY2U3NGFiOWJlOTQ1NjkiLCJyb29tX2lkIjoiNjc1YTQ4MjAwMjE0N2M0YmM1OWZkZGJlIiwidXNlcl9pZCI6ImFmMGQzNzg1LWE5YTktNDFhMC05YTkzLTdiNjY0ODFhZmZiNSIsImV4cCI6MTczNTg3NjY1OCwiaWF0IjoxNzM1NzkwMjU4LCJuYmYiOjE3MzU3OTAyNTgsImlzcyI6IjY3MjMzOGEzMzNjZTc0YWI5YmU5NDU2NyIsInN1YiI6ImFwaSIsImp0aSI6ImExYTI0ZjNjLWY5Y2ItNDc0ZC1iZTM0LTQ0MWM0YmJiYzA3NSIsInJvbGUiOiJsaXN0ZW5lciJ9.pIvCpwvdzNue31b_JoZ7lmxqUcJZzjkReYQe3TXm2d0'),
('675bdabbb72a0fec60a46b31', 'Room 2024-12-13T06:56:58.454Z', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2ZXJzaW9uIjoyLCJ0eXBlIjoiYXBwIiwiYWNjZXNzX2tleSI6IjY3MjMzOGEzMzNjZTc0YWI5YmU5NDU2OSIsInJvbGUiOiJzcGVha2VyIiwicm9vbV9pZCI6IjY3NWJkYWJiYjcyYTBmZWM2MGE0NmIzMSIsInVzZXJfaWQiOiI3NGM2NWU4Ni0yMTgzLTRmOTYtYjExNi01M2FmZDVjMTU5ZGIiLCJleHAiOjE3MzQxNTk0MTksImlhdCI6MTczNDA3MzAxOSwibmJmIjoxNzM0MDczMDE5LCJpc3MiOiI2NzIzMzhhMzMzY2U3NGFiOWJlOTQ1NjkiLCJzdWIiOiJhcGkifQ.nOa4AjRK84L3mK-41vtZCUKMWm2hAkt-ewO8GqFA9i0', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ2ZXJzaW9uIjoyLCJ0eXBlIjoiYXBwIiwiYWNjZXNzX2tleSI6IjY3MjMzOGEzMzNjZTc0YWI5YmU5NDU2OSIsInJvbGUiOiJsaXN0ZW5lciIsInJvb21faWQiOiI2NzViZGFiYmI3MmEwZmVjNjBhNDZiMzEiLCJ1c2VyX2lkIjoiNzRjNjVlODYtMjE4My00Zjk2LWIxMTYtNTNhZmQ1YzE1OWRiIiwiZXhwIjoxNzM0MTU5NDE5LCJpYXQiOjE3MzQwNzMwMTksIm5iZiI6MTczNDA3MzAxOSwiaXNzIjoiNjcyMzM4YTMzM2NlNzRhYjliZTk0NTY5Iiwic3ViIjoiYXBpIn0.p_XmzA6Q9NrUVdZhONkRX4PE8PeF6vCSTtxFDXPBJ10');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `whatsapp` varchar(255) NOT NULL,
  `role` enum('user','ustadz','admin') DEFAULT 'user',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `lastLogin` datetime(3) DEFAULT NULL,
  `status_login` tinyint(1) NOT NULL DEFAULT 0,
  `currentToken` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `email`, `whatsapp`, `role`, `createdAt`, `updatedAt`, `lastLogin`, `status_login`, `currentToken`) VALUES
('1e79ee3f-89d5-4918-aaef-da899227d509', 'Ust Herlin admin', '$2a$10$YJt5KCcyyKu.zfuSAWF2C.SPDrnSt879g5lmLm7FwKJG/G4EzNgry', 'Herlinadminn@gmail.com', '087741250308', 'admin', '2024-12-10 07:39:06.063', '2024-12-10 07:39:13.710', '2024-12-10 07:39:13.709', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiMWU3OWVlM2YtODlkNS00OTE4LWFhZWYtZGE4OTkyMjdkNTA5Iiwicm9sZSI6ImFkbWluIn0sImlhdCI6MTczMzgxNjM1MywiZXhwIjoxNzMzODIzNTUzfQ.Frb3bXP9XKQzxpu1SOxQQZsUCqO2nv16Lea6HgFtMfE'),
('21e66b08-16ce-45af-bebd-9739fdf01139', 'User Test', '$2a$10$W8SyU1kV9x1nmW8UDr4IhOai7Wk5GRSDtfxp077h1vrvM5kF7utfW', 'testuser@gmail.com', '082312343261', 'user', '2024-12-25 04:03:28.289', '2024-12-25 04:05:09.026', '2024-12-25 04:03:46.247', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiMjFlNjZiMDgtMTZjZS00NWFmLWJlYmQtOTczOWZkZjAxMTM5Iiwicm9sZSI6InVzZXIifSwiaWF0IjoxNzM1MDk5NDI2LCJleHAiOjE3MzUxMDY2MjZ9.3tJUmbAOw39TNUozwKBmwBNMyEnW0RDEJt2wplp64gI'),
('37c74edf-0cc5-40a9-8336-1b314ab37938', 'Ade Fery', '$2a$10$kAHRkdWv.Ngfvj1AYx4Qq.l/kjEPfNswXavHMhrXKNn0diFKp2XlG', 'testjam6@gmail.com', '082312343226', 'user', '2024-12-10 07:36:36.220', '2024-12-10 07:36:36.220', NULL, 0, NULL),
('3d934706-3cc4-4fc2-ad76-a9e675f49c03', 'Ust Herlin', '$2a$10$NENn36GcDW0ibM3Hxlx7R.EnGaIBiAIxpsd33coS22Rj5ZjRiqd8.', 'Herlin@gmail.com', '087741250305', 'ustadz', '2024-12-10 07:34:14.108', '2024-12-25 03:56:25.938', '2024-12-25 03:56:25.937', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiM2Q5MzQ3MDYtM2NjNC00ZmMyLWFkNzYtYTllNjc1ZjQ5YzAzIiwicm9sZSI6InVzdGFkeiJ9LCJpYXQiOjE3MzUwOTg5ODUsImV4cCI6MTczNTEwNjE4NX0.2r6cfalG3tM6J5dxjnjJzv1UyJMmILKcyQmfC41CEfg'),
('545c7baa-bdde-4e6e-bf2f-8c567eaffac3', 'Fery', '$2a$10$MO6USDdKZeotHpgVM33ti.i1Ij8Dl6HMnrf2iClITSPBGoA3ktDpW', 'testjam2@gmail.com', '082312343213', 'user', '2024-12-10 07:35:36.080', '2024-12-10 07:38:50.400', '2024-12-10 07:37:48.650', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNTQ1YzdiYWEtYmRkZS00ZTZlLWJmMmYtOGM1NjdlYWZmYWMzIiwicm9sZSI6InVzZXIifSwiaWF0IjoxNzMzODE2MjY4LCJleHAiOjE3MzM4MjM0Njh9.6jh-ESf2Eqa9mqVAZgbgcTgXfllIS53WFYncgnvuOQw'),
('57cab79f-78fb-42b0-a3da-2b3f57596b7e', 'Admin Untuk Testing', '$2a$10$d/PGl1.bhZMCakSgmxAqXOf290cL/atyD48gQ2IQaiBOdo4ohr102', 'testAdmin@gmail.com', '082312343217', 'admin', '2024-12-11 08:28:08.432', '2024-12-26 12:34:44.709', '2024-12-26 12:34:44.708', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNTdjYWI3OWYtNzhmYi00MmIwLWEzZGEtMmIzZjU3NTk2YjdlIiwicm9sZSI6ImFkbWluIn0sImlhdCI6MTczNTIxNjQ4NCwiZXhwIjoxNzM1MjIzNjg0fQ.vf_WrJFvX6iuicBR6jdd6eaAUPR8kbA_wEtlOiq_JSg'),
('6f853bbb-c118-47e8-9604-16d66ff8301e', 'Ade Fery', '$2a$10$yJ4OJfeEVcfvuBG1GiSxR.dbN9QNWX8dl3jQePpMzSv9dyF4e5hVm', 'testjam8@gmail.com', '082312343228', 'user', '2024-12-10 07:36:50.623', '2024-12-10 07:36:50.623', NULL, 0, NULL),
('74c65e86-2183-4f96-b116-53afd5c159db', 'Ustadz Fauzan', '$2a$10$4lwTq0u3QGAdslF5D4mTjO5k7fPUXuxPz34BXEj0E3wp4ttbW6RW2', 'testustad@gmail.com', '082312343212', 'ustadz', '2024-12-10 07:35:02.705', '2025-01-06 04:28:32.542', '2025-01-06 04:28:32.541', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiNzRjNjVlODYtMjE4My00Zjk2LWIxMTYtNTNhZmQ1YzE1OWRiIiwicm9sZSI6InVzdGFkeiJ9LCJpYXQiOjE3MzYxMzc3MTIsImV4cCI6MTczNjE0NDkxMn0.uUONoXKpSyMT7PSX1s3LuGXSnJLRgkILGZc9l-w4zx0'),
('754a35a4-195d-4c21-86e0-f1d3cc39b44a', 'Raihan', '$2a$10$eS1L1jyilH4b4JVty3NRCuDpZ/H6YyEjxvxaiNIJN7GXSntLpMpF.', 'testjam14@gmail.com', '082312343211', 'user', '2024-12-10 07:34:18.926', '2024-12-10 07:34:18.926', NULL, 0, NULL),
('83795b10-061b-42a4-8fb9-75ab4e0bd847', 'Ade Feryy', '$2a$10$HuTJ8KO.lKo.a4GP/aSVZuxNRt0agTNib84CUUCU5rjSBp1CgnlOu', 'testjam4@gmail.com', '082312343224', 'user', '2024-12-10 07:36:14.251', '2025-01-02 03:58:16.782', '2025-01-02 03:58:16.781', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiODM3OTViMTAtMDYxYi00MmE0LThmYjktNzVhYjRlMGJkODQ3Iiwicm9sZSI6InVzZXIifSwiaWF0IjoxNzM1NzkwMjk2LCJleHAiOjE3MzU3OTc0OTZ9.z7qVAipiKcix2JV46RPc6uyznYtNW91ynVBYj1qPELs'),
('8bfba152-b881-4a8c-98cc-06185d330d4c', 'Ade Fery', '$2a$10$8Vh8b.lMFRHJlzXG9qGVVOp5nGN2Pj4mIRnL7g9gHw8Eqyl01pJyu', 'testjam7@gmail.com', '082312343227', 'user', '2024-12-10 07:36:43.403', '2024-12-10 07:36:43.403', NULL, 0, NULL),
('a594e5cb-f7d2-4d80-bcc8-8569e95c9f1c', 'Ade Fery', '$2a$10$2rtVEJZLZMOvpOR.QhM7bOIxbth75fiAWMC4giH5EpJRe/c8HYBnW', 'testjam3@gmail.com', '082312343223', 'user', '2024-12-10 07:36:04.341', '2024-12-30 03:56:18.370', '2024-12-30 03:56:18.369', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiYTU5NGU1Y2ItZjdkMi00ZDgwLWJjYzgtODU2OWU5NWM5ZjFjIiwicm9sZSI6InVzZXIifSwiaWF0IjoxNzM1NTMwOTc4LCJleHAiOjE3MzU1MzgxNzh9.quQcEXc-BNBgjEvNAivU-NBUDz0MoDSIt_xVrC9ZPd0'),
('af0d3785-a9a9-41a0-9a93-7b66481affb5', 'miftah', '$2a$10$oRAyFRl5Ynv./QwO.k1f9OAhGHi/AavdLk.d.CkNx2pyFJnkMvy7y', 'miftah@gmail.com', '087741250377', 'user', '2024-12-25 03:59:11.220', '2025-01-02 04:03:06.154', '2025-01-02 04:03:06.153', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiYWYwZDM3ODUtYTlhOS00MWEwLTlhOTMtN2I2NjQ4MWFmZmI1Iiwicm9sZSI6InVzZXIifSwiaWF0IjoxNzM1NzkwNTg2LCJleHAiOjE3MzU3OTc3ODZ9.NsdGDkDM35cmESqgGy2VFnkXQbP_MOq1P2vX55_ca6Y'),
('d3b077bc-be1e-4671-88f0-7a9a8607072e', 'Ade Fery', '$2a$10$EjAfhppXX.wAfOG8F0DQn.KB7XmMwmnV9yMJxIMe499J0/xI9grMO', 'testjam9@gmail.com', '082312343229', 'user', '2024-12-10 07:36:58.095', '2024-12-10 07:36:58.095', NULL, 0, NULL),
('f20c96f7-58d8-452e-9fdf-e401ef23642d', 'Ade Fery', '$2a$10$AziZaquTlCjvtdGH/Oq0/eh2Nyex8EEyfMigTkpV6lY5VZMQFq1yW', 'testjam10@gmail.com', '082312343210', 'user', '2024-12-10 07:37:07.935', '2024-12-10 07:37:07.935', NULL, 0, NULL),
('f77de55a-eea4-4535-b6df-4d213579942f', 'Angriawan', '$2a$10$YDqC.kkUVzoQffC.yHJ87e08be86Ylo.dqzWLoRqTkiS4k1GglFsW', 'testjam5@gmail.com', '082312343225', 'user', '2024-12-10 07:36:26.635', '2025-01-06 04:01:41.668', '2025-01-06 04:01:05.702', 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiZjc3ZGU1NWEtZWVhNC00NTM1LWI2ZGYtNGQyMTM1Nzk5NDJmIiwicm9sZSI6InVzZXIifSwiaWF0IjoxNzM2MTM2MDY1LCJleHAiOjE3MzYxNDMyNjV9.61hG2vr4Xof5fv6LMC0pY0bsqFSSRQJtltgRvg88nIo'),
('f8063fbb-0586-4a75-957c-ef3085e21882', 'Ust Herlin', '$2a$10$9bNJ/xRM8dsYxl3xtPvmwO3r.rJzAUtCc7IkSwZgye4ff7Kfz0.ke', 'Herlinadmin@gmail.com', '087741250303', 'ustadz', '2024-12-10 07:36:01.877', '2024-12-10 07:37:36.387', '2024-12-10 07:37:36.386', 1, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoiZjgwNjNmYmItMDU4Ni00YTc1LTk1N2MtZWYzMDg1ZTIxODgyIiwicm9sZSI6InVzdGFkeiJ9LCJpYXQiOjE3MzM4MTYyNTYsImV4cCI6MTczMzgyMzQ1Nn0.xg-n5M0zQAqr1eqwlOHst3f7D_wVifg1p--45ehgYSg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `usersgoogle`
--

CREATE TABLE `usersgoogle` (
  `id` varchar(36) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `whatsapp` varchar(255) NOT NULL,
  `role` enum('user','ustadz','admin') DEFAULT 'user',
  `createdAt` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `updatedAt` datetime(3) NOT NULL,
  `lastLogin` datetime(3) DEFAULT NULL,
  `status_login` tinyint(1) NOT NULL DEFAULT 0,
  `grupGrupid` varchar(36) DEFAULT NULL,
  `profilesProfileid` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `_gruptopeserta_grup`
--

CREATE TABLE `_gruptopeserta_grup` (
  `A` varchar(36) NOT NULL,
  `B` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) NOT NULL,
  `checksum` varchar(64) NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) NOT NULL,
  `logs` text DEFAULT NULL,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT current_timestamp(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('4f5c86f3-5879-41de-87bf-bd29971de6db', '7684692b502af3d2ed5c982e87c4014acf9308a9e248159d59783d6d0d317795', '2024-12-10 07:33:23.688', '20241210073322_migration_fix', NULL, NULL, '2024-12-10 07:33:22.845', 1),
('cc7c8e25-d490-419c-b9d2-c7bf95b2c8ae', '6782cab45e7f7de1be0f9cb3005d40dff97ac040972d49001a1f7fefd040fc53', '2024-12-10 08:02:46.888', '20241210080246_add_uuid_default', NULL, NULL, '2024-12-10 08:02:46.877', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `grup`
--
ALTER TABLE `grup`
  ADD PRIMARY KEY (`grupid`),
  ADD UNIQUE KEY `Grup_roomid_key` (`roomid`),
  ADD KEY `Grup_userId_idx` (`userId`);

--
-- Indeks untuk tabel `perjalanan`
--
ALTER TABLE `perjalanan`
  ADD PRIMARY KEY (`perjalananid`);

--
-- Indeks untuk tabel `peserta_grup`
--
ALTER TABLE `peserta_grup`
  ADD PRIMARY KEY (`peserta_grupid`),
  ADD UNIQUE KEY `Peserta_Grup_grupid_userId_key` (`grupid`,`userId`),
  ADD UNIQUE KEY `Peserta_Grup_roomid_key` (`roomid`),
  ADD KEY `Peserta_Grup_userId_fkey` (`userId`),
  ADD KEY `Peserta_Grup_usersGoogleId_fkey` (`usersGoogleId`);

--
-- Indeks untuk tabel `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`profileid`),
  ADD UNIQUE KEY `Profiles_userId_key` (`userId`);

--
-- Indeks untuk tabel `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`progressid`),
  ADD KEY `Progress_grupid_fkey` (`grupid`);

--
-- Indeks untuk tabel `progress_perjalanan`
--
ALTER TABLE `progress_perjalanan`
  ADD PRIMARY KEY (`progress_perjalananid`),
  ADD KEY `Progress_perjalanan_progressid_fkey` (`progressid`),
  ADD KEY `Progress_perjalanan_userId_fkey` (`userId`),
  ADD KEY `Progress_perjalanan_perjalananid_fkey` (`perjalananid`),
  ADD KEY `Progress_perjalanan_usersGoogleId_fkey` (`usersGoogleId`);

--
-- Indeks untuk tabel `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Users_email_key` (`email`),
  ADD UNIQUE KEY `Users_whatsapp_key` (`whatsapp`);

--
-- Indeks untuk tabel `usersgoogle`
--
ALTER TABLE `usersgoogle`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UsersGoogle_name_key` (`name`),
  ADD UNIQUE KEY `UsersGoogle_email_key` (`email`),
  ADD UNIQUE KEY `UsersGoogle_whatsapp_key` (`whatsapp`),
  ADD KEY `UsersGoogle_profilesProfileid_fkey` (`profilesProfileid`),
  ADD KEY `UsersGoogle_grupGrupid_fkey` (`grupGrupid`);

--
-- Indeks untuk tabel `_gruptopeserta_grup`
--
ALTER TABLE `_gruptopeserta_grup`
  ADD UNIQUE KEY `_GrupToPeserta_Grup_AB_unique` (`A`,`B`),
  ADD KEY `_GrupToPeserta_Grup_B_index` (`B`);

--
-- Indeks untuk tabel `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `grup`
--
ALTER TABLE `grup`
  ADD CONSTRAINT `Grup_roomid_fkey` FOREIGN KEY (`roomid`) REFERENCES `room` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Grup_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `peserta_grup`
--
ALTER TABLE `peserta_grup`
  ADD CONSTRAINT `Peserta_Grup_roomid_fkey` FOREIGN KEY (`roomid`) REFERENCES `room` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Peserta_Grup_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Peserta_Grup_usersGoogleId_fkey` FOREIGN KEY (`usersGoogleId`) REFERENCES `usersgoogle` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `Profiles_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `Progress_grupid_fkey` FOREIGN KEY (`grupid`) REFERENCES `grup` (`grupid`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `progress_perjalanan`
--
ALTER TABLE `progress_perjalanan`
  ADD CONSTRAINT `Progress_perjalanan_perjalananid_fkey` FOREIGN KEY (`perjalananid`) REFERENCES `perjalanan` (`perjalananid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Progress_perjalanan_progressid_fkey` FOREIGN KEY (`progressid`) REFERENCES `progress` (`progressid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Progress_perjalanan_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Progress_perjalanan_usersGoogleId_fkey` FOREIGN KEY (`usersGoogleId`) REFERENCES `usersgoogle` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `usersgoogle`
--
ALTER TABLE `usersgoogle`
  ADD CONSTRAINT `UsersGoogle_grupGrupid_fkey` FOREIGN KEY (`grupGrupid`) REFERENCES `grup` (`grupid`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `UsersGoogle_profilesProfileid_fkey` FOREIGN KEY (`profilesProfileid`) REFERENCES `profiles` (`profileid`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `_gruptopeserta_grup`
--
ALTER TABLE `_gruptopeserta_grup`
  ADD CONSTRAINT `_GrupToPeserta_Grup_A_fkey` FOREIGN KEY (`A`) REFERENCES `grup` (`grupid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_GrupToPeserta_Grup_B_fkey` FOREIGN KEY (`B`) REFERENCES `peserta_grup` (`peserta_grupid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
