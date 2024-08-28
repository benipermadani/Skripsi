-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 20, 2024 at 01:36 PM
-- Server version: 8.0.30
-- PHP Version: 8.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pln`
--

-- --------------------------------------------------------

--
-- Table structure for table `daya`
--

CREATE TABLE `daya` (
  `id_daya` int NOT NULL,
  `jenis_daya` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `golongan` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `jml_daya` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `biaya_pasang` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `biaya_ubah_daya` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `daya`
--

INSERT INTO `daya` (`id_daya`, `jenis_daya`, `golongan`, `jml_daya`, `biaya_pasang`, `biaya_ubah_daya`) VALUES
(1, 'Pelayanan Sosial', 'S-1', '220 VA', '200000', '100000'),
(2, 'Pelayanan Sosial', 'S-2', '450 VA', '400000', '200000'),
(3, 'Pelayanan Sosial', 'S-2', '200 kVA', '180000000', '90000000'),
(4, 'Rumah Tangga', 'R-1', '450 VA', '400000', '200000'),
(5, 'Rumah Tangga', 'R-1', '900 VA', '800000', '400000'),
(6, 'Rumah Tangga', 'R-1', '2200 VA', '2000000', '1000000'),
(7, 'Rumah Tangga', 'R-2', '3500 VA', '3200000', '1600000'),
(8, 'Rumah Tangga', 'R-2', '5500 VA', '5000000', '2500000'),
(9, 'Rumah Tangga', 'R-3', '6600 VA', '6000000', '3000000'),
(10, 'Bisnis', 'B-1', '450 VA', '400000', '200000'),
(11, 'Bisnis', 'B-1', '2200 VA', '2000000', '1000000'),
(12, 'Bisnis', 'B-2', '3500 VA', '3200000', '1600000'),
(13, 'Bisnis', 'B-2', '200 kVA', '180000000', '90000000'),
(14, 'Bisnis', 'B-3', '200 kVA', '180000000', '90000000'),
(15, 'Industri', 'I-1', '450 VA', '400000', '200000'),
(16, 'Industri', 'I-1', '14 kVA', '12800000', '6400000'),
(17, 'Industri', 'I-2', '14 kVA', '12800000', '6400000'),
(18, 'Industri', 'I-2', '200 kVA', '180000000', '90000000'),
(19, 'Industri', 'I-3', '200 kVA', '180000000', '90000000'),
(20, 'Industri', 'I-4', '30000 kVA', '27000000000', '13500000000');

-- --------------------------------------------------------

--
-- Table structure for table `gardu`
--

CREATE TABLE `gardu` (
  `id_gardu` int NOT NULL,
  `nm_gardu` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `area` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gardu`
--

INSERT INTO `gardu` (`id_gardu`, `nm_gardu`, `area`) VALUES
(2, 'Gardu Induk', 'Asam-Asam sekitar PLTU'),
(3, 'Gardu Cabang 1', 'Asam Asam menuju Kintap');

-- --------------------------------------------------------

--
-- Table structure for table `kerusakan`
--

CREATE TABLE `kerusakan` (
  `id_kerusakan` int NOT NULL,
  `id_pelanggan` int NOT NULL,
  `pesan_kerusakan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_gardu` int NOT NULL,
  `bukti_kerusakan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `verif` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `waktu_laporan` datetime NOT NULL,
  `status_kerusakan` tinyint(1) DEFAULT NULL,
  `pesan_verifikasi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kerusakan`
--

INSERT INTO `kerusakan` (`id_kerusakan`, `id_pelanggan`, `pesan_kerusakan`, `id_gardu`, `bukti_kerusakan`, `verif`, `waktu_laporan`, `status_kerusakan`, `pesan_verifikasi`) VALUES
(2, 6, 'Trafo Menyala sekitar pasar simpang 4', 3, '9612915.jpg', '1', '2024-08-18 23:19:36', 1, 'Laporan Kerusakan Disetujui, Petugas akan segera melakukan perbaikan'),
(3, 6, 'contoh kerusakan', 2, '7775878.jpg', '1', '2024-08-19 23:27:16', 1, 'Laporan Kerusakan Disetujui, Petugas akan segera melakukan perbaikan');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `id_maintenance` int NOT NULL,
  `id_gardu` int NOT NULL,
  `tgl_mulai_maintenance` date NOT NULL,
  `tgl_selesai_maintenance` date NOT NULL,
  `deskripsi_maintenance` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`id_maintenance`, `id_gardu`, `tgl_mulai_maintenance`, `tgl_selesai_maintenance`, `deskripsi_maintenance`) VALUES
(2, 2, '2024-08-20', '2024-08-21', 'Maintenance Device');

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_up3`
--

CREATE TABLE `maintenance_up3` (
  `id_maintenance_up3` int NOT NULL,
  `id_maintenance` int NOT NULL,
  `id_up3` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintenance_up3`
--

INSERT INTO `maintenance_up3` (`id_maintenance_up3`, `id_maintenance`, `id_up3`) VALUES
(4, 2, 2),
(5, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int NOT NULL,
  `nm_pelanggan` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nik_pelanggan` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `jk_pelanggan` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `pekerjaan` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat_pelanggan` text COLLATE utf8mb4_general_ci NOT NULL,
  `file_ktp` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `hp_pelanggan` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `email_pelanggan` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nm_pelanggan`, `nik_pelanggan`, `jk_pelanggan`, `pekerjaan`, `alamat_pelanggan`, `file_ktp`, `hp_pelanggan`, `email_pelanggan`, `time`) VALUES
(5, 'Ramadhan Kurnia', '4857485748574857', 'Laki-laki', 'Freelancer', 'Asam-asam', '2796797.jpg', '08', 'ramakurnia@mail.com', '2024-08-08 23:10:49'),
(6, 'Beni Permadani', '1111111111111119', 'Laki-laki', 'PNS', 'Banjarbaru', '8779637.jpg', '0813', 'beni@mail.com', '2024-08-10 21:16:58');

-- --------------------------------------------------------

--
-- Table structure for table `pemasangan`
--

CREATE TABLE `pemasangan` (
  `id_pemasangan` int NOT NULL,
  `id_pelanggan` int NOT NULL,
  `no_pemasangan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_daya` int NOT NULL,
  `id_gardu` int NOT NULL,
  `alamat_pemasangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `waktu_pengajuan` datetime NOT NULL,
  `verif` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_pemasangan` date DEFAULT NULL,
  `pesan_ditolak` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemasangan`
--

INSERT INTO `pemasangan` (`id_pemasangan`, `id_pelanggan`, `no_pemasangan`, `id_daya`, `id_gardu`, `alamat_pemasangan`, `waktu_pengajuan`, `verif`, `tgl_pemasangan`, `pesan_ditolak`) VALUES
(2, 5, 'NPB000001', 5, 3, 'lorem alamat 2', '2024-08-09 21:29:01', '1', '2024-08-12', NULL),
(3, 6, 'NPB000002', 5, 2, 'Asam asam RW 02 RT 01 nomor 13', '2024-08-10 21:23:01', '2', NULL, 'Karena alamat belum tercover pln asam asam'),
(4, 6, 'NPB000003', 6, 2, 'contoh disetujui', '2024-08-10 21:24:54', '1', '2024-08-16', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pemasangan_up3`
--

CREATE TABLE `pemasangan_up3` (
  `id_pemasangan_up3` int NOT NULL,
  `id_pemasangan` int DEFAULT NULL,
  `id_up3` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pemasangan_up3`
--

INSERT INTO `pemasangan_up3` (`id_pemasangan_up3`, `id_pemasangan`, `id_up3`) VALUES
(4, 2, 2),
(5, 2, 3),
(6, 4, 2),
(7, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int NOT NULL,
  `pesan_pengaduan` text COLLATE utf8mb4_general_ci NOT NULL,
  `id_gardu` int NOT NULL,
  `bukti_pengaduan` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `id_pelanggan` int NOT NULL,
  `status_pengaduan` tinyint(1) NOT NULL,
  `waktu_pengaduan` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `pesan_pengaduan`, `id_gardu`, `bukti_pengaduan`, `id_pelanggan`, `status_pengaduan`, `waktu_pengaduan`) VALUES
(2, 'lorem dolor\r\ndfkdf\r\ndfkdfk rgrgrg ok', 3, '8961332.jpg', 5, 1, '2024-08-10 19:19:40'),
(3, 'Listriknya padam terus', 2, '6348678.jpg', 6, 1, '2024-08-10 21:31:46');

-- --------------------------------------------------------

--
-- Table structure for table `perbaikan`
--

CREATE TABLE `perbaikan` (
  `id_perbaikan` int NOT NULL,
  `id_kerusakan` int NOT NULL,
  `tgl_mulai_perbaikan` date NOT NULL,
  `tgl_selesai_perbaikan` date NOT NULL,
  `pesan_perbaikan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status_perbaikan` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perbaikan`
--

INSERT INTO `perbaikan` (`id_perbaikan`, `id_kerusakan`, `tgl_mulai_perbaikan`, `tgl_selesai_perbaikan`, `pesan_perbaikan`, `status_perbaikan`) VALUES
(5, 2, '2024-08-19', '2024-08-20', 'oke', 1),
(6, 2, '2024-08-20', '2024-08-20', 'testing', 1),
(8, 3, '2024-08-21', '2024-08-21', 'lorem', 1);

-- --------------------------------------------------------

--
-- Table structure for table `perbaikan_up3`
--

CREATE TABLE `perbaikan_up3` (
  `id_perbaikan_up3` int NOT NULL,
  `id_perbaikan` int NOT NULL,
  `id_up3` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `perbaikan_up3`
--

INSERT INTO `perbaikan_up3` (`id_perbaikan_up3`, `id_perbaikan`, `id_up3`) VALUES
(3, 5, 2),
(4, 6, 2),
(5, 6, 3),
(8, 8, 2),
(9, 8, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tanggapan`
--

CREATE TABLE `tanggapan` (
  `id_tanggapan` int NOT NULL,
  `id_pengaduan` int NOT NULL,
  `pesan_tanggapan` text COLLATE utf8mb4_general_ci NOT NULL,
  `bukti_tanggapan` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `waktu_tanggapan` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tanggapan`
--

INSERT INTO `tanggapan` (`id_tanggapan`, `id_pengaduan`, `pesan_tanggapan`, `bukti_tanggapan`, `waktu_tanggapan`) VALUES
(1, 2, 'coba tanggapan', NULL, '2024-08-10 20:56:52'),
(3, 2, 'testing tanggapan\r\nabc', '48027.jpg', '2024-08-10 20:52:49'),
(4, 3, 'akan segera dilakukan perbaikan', NULL, '2024-08-10 21:32:24'),
(5, 3, 'listrik kembali normal', '8293.jpg', '2024-08-10 21:32:52');

-- --------------------------------------------------------

--
-- Table structure for table `ubah_daya`
--

CREATE TABLE `ubah_daya` (
  `id_ubah_daya` int NOT NULL,
  `no_ubah_daya` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `id_pemasangan` int NOT NULL,
  `id_daya_lama` int NOT NULL,
  `id_daya` int NOT NULL,
  `waktu_pengajuan_ubah_daya` datetime NOT NULL,
  `verif_ubah_daya` char(1) COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_ubah_daya` date DEFAULT NULL,
  `ubah_daya_ditolak` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ubah_daya`
--

INSERT INTO `ubah_daya` (`id_ubah_daya`, `no_ubah_daya`, `id_pemasangan`, `id_daya_lama`, `id_daya`, `waktu_pengajuan_ubah_daya`, `verif_ubah_daya`, `tgl_ubah_daya`, `ubah_daya_ditolak`) VALUES
(2, 'NUD000001', 2, 4, 5, '2024-08-10 14:12:23', '1', '2024-08-17', NULL),
(4, 'NUD000002', 4, 5, 6, '2024-08-10 21:28:02', '1', '2024-08-31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ubah_daya_up3`
--

CREATE TABLE `ubah_daya_up3` (
  `id_ubah_daya_up3` int NOT NULL,
  `id_ubah_daya` int NOT NULL,
  `id_up3` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ubah_daya_up3`
--

INSERT INTO `ubah_daya_up3` (`id_ubah_daya_up3`, `id_ubah_daya`, `id_up3`) VALUES
(1, 2, 2),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `up3`
--

CREATE TABLE `up3` (
  `id_up3` int NOT NULL,
  `kode_up3` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nm_up3` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nik_up3` varchar(16) COLLATE utf8mb4_general_ci NOT NULL,
  `jk_up3` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `tmpt_lahir_up3` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_lahir_up3` date NOT NULL,
  `agama_up3` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `alamat_up3` text COLLATE utf8mb4_general_ci NOT NULL,
  `hp_up3` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `tmt` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `up3`
--

INSERT INTO `up3` (`id_up3`, `kode_up3`, `nm_up3`, `nik_up3`, `jk_up3`, `tmpt_lahir_up3`, `tgl_lahir_up3`, `agama_up3`, `alamat_up3`, `hp_up3`, `tmt`) VALUES
(2, 'UP3-00001', 'Ilham Fikrian', '5695685965896384', 'Perempuan', 'Banjarmasin', '1998-12-13', 'Islam', 'lorem', '081391701919', '2022-06-26'),
(3, 'UP3-00002', 'Fazrudin', '3847856458675867', 'Laki-laki', 'Banjarmasin', '2000-08-22', 'Islam', 'lorem', '0813', '2021-08-22');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int NOT NULL,
  `id_pelanggan` int DEFAULT NULL,
  `nm_user` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `id_pelanggan`, `nm_user`, `username`, `password`, `level`) VALUES
(1, NULL, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', '1'),
(4, NULL, 'Direktur PLN Asam Asam', 'direktur', '4fbfd324f5ffcdff5dbf6f019b02eca8', '3'),
(6, 5, 'Ramadhan Kurnia', '4857485748574857', 'f164d6ea053e633413507cef2d750392', '2'),
(7, 6, 'Beni Permadani', '1111111111111119', '0efac2a544c45d1d3232bf768be8609f', '2');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_daya_pelanggan`
-- (See below for the actual view)
--
CREATE TABLE `v_rekap_daya_pelanggan` (
`id_daya` int
,`jenis_daya` varchar(100)
,`golongan` varchar(50)
,`jml_daya` varchar(20)
,`jumlah_pemasangan` bigint
,`jumlah_pelanggan` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_daya_pelanggan_comprehensive`
-- (See below for the actual view)
--
CREATE TABLE `v_rekap_daya_pelanggan_comprehensive` (
`id_daya` int
,`jenis_daya` varchar(100)
,`golongan` varchar(50)
,`jml_daya` varchar(20)
,`jumlah_pemasangan_verified` bigint
,`jumlah_pelanggan_verified` bigint
,`jumlah_pemasangan_total` bigint
,`jumlah_pelanggan_total` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_kerusakan_gardu`
-- (See below for the actual view)
--
CREATE TABLE `v_rekap_kerusakan_gardu` (
`id_gardu` int
,`nm_gardu` varchar(50)
,`jumlah_kerusakan` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_maintenance_gardu`
-- (See below for the actual view)
--
CREATE TABLE `v_rekap_maintenance_gardu` (
`id_gardu` int
,`nm_gardu` varchar(50)
,`jumlah_maintenance` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_maintenance_up3`
-- (See below for the actual view)
--
CREATE TABLE `v_rekap_maintenance_up3` (
`id_up3` int
,`nm_up3` varchar(50)
,`jumlah_maintenance` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_pemasangan_gardu`
-- (See below for the actual view)
--
CREATE TABLE `v_rekap_pemasangan_gardu` (
`id_gardu` int
,`nm_gardu` varchar(50)
,`jumlah_pemasangan` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_pemasangan_up3`
-- (See below for the actual view)
--
CREATE TABLE `v_rekap_pemasangan_up3` (
`id_up3` int
,`nm_up3` varchar(50)
,`jumlah_pemasangan` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_pengaduan_gardu`
-- (See below for the actual view)
--
CREATE TABLE `v_rekap_pengaduan_gardu` (
`id_gardu` int
,`nm_gardu` varchar(50)
,`jumlah_pengaduan` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_perbaikan_up3`
-- (See below for the actual view)
--
CREATE TABLE `v_rekap_perbaikan_up3` (
`id_up3` int
,`nm_up3` varchar(50)
,`jumlah_perbaikan` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_semua_aktivitas_gardu`
-- (See below for the actual view)
--
CREATE TABLE `v_rekap_semua_aktivitas_gardu` (
`id_gardu` int
,`nm_gardu` varchar(50)
,`area` text
,`jumlah_pemasangan` bigint
,`jumlah_pengaduan` bigint
,`jumlah_kerusakan` bigint
,`jumlah_maintenance` bigint
,`total_aktivitas` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_semua_aktivitas_up3`
-- (See below for the actual view)
--
CREATE TABLE `v_rekap_semua_aktivitas_up3` (
`id_up3` int
,`kode_up3` varchar(12)
,`nm_up3` varchar(50)
,`nik_up3` varchar(16)
,`jk_up3` varchar(20)
,`tmpt_lahir_up3` varchar(50)
,`tgl_lahir_up3` date
,`agama_up3` varchar(20)
,`alamat_up3` text
,`hp_up3` varchar(20)
,`tmt` date
,`jumlah_pemasangan` bigint
,`jumlah_ubah_daya` bigint
,`jumlah_perbaikan` bigint
,`jumlah_maintenance` bigint
,`total_aktivitas` bigint
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_rekap_ubah_daya_up3`
-- (See below for the actual view)
--
CREATE TABLE `v_rekap_ubah_daya_up3` (
`id_up3` int
,`nm_up3` varchar(50)
,`jumlah_ubah_daya` bigint
);

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_daya_pelanggan`
--
DROP TABLE IF EXISTS `v_rekap_daya_pelanggan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rekap_daya_pelanggan`  AS SELECT `d`.`id_daya` AS `id_daya`, `d`.`jenis_daya` AS `jenis_daya`, `d`.`golongan` AS `golongan`, `d`.`jml_daya` AS `jml_daya`, count(`p`.`id_pemasangan`) AS `jumlah_pemasangan`, count(distinct `p`.`id_pelanggan`) AS `jumlah_pelanggan` FROM (`daya` `d` left join `pemasangan` `p` on(((`d`.`id_daya` = `p`.`id_daya`) and (`p`.`verif` = 1)))) GROUP BY `d`.`id_daya`, `d`.`jenis_daya`, `d`.`golongan`, `d`.`jml_daya` ORDER BY `jumlah_pemasangan` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_daya_pelanggan_comprehensive`
--
DROP TABLE IF EXISTS `v_rekap_daya_pelanggan_comprehensive`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rekap_daya_pelanggan_comprehensive`  AS SELECT `d`.`id_daya` AS `id_daya`, `d`.`jenis_daya` AS `jenis_daya`, `d`.`golongan` AS `golongan`, `d`.`jml_daya` AS `jml_daya`, count(`p_verified`.`id_pemasangan`) AS `jumlah_pemasangan_verified`, count(distinct `p_verified`.`id_pelanggan`) AS `jumlah_pelanggan_verified`, count(`p_all`.`id_pemasangan`) AS `jumlah_pemasangan_total`, count(distinct `p_all`.`id_pelanggan`) AS `jumlah_pelanggan_total` FROM ((`daya` `d` left join `pemasangan` `p_verified` on(((`d`.`id_daya` = `p_verified`.`id_daya`) and (`p_verified`.`verif` = 1)))) left join `pemasangan` `p_all` on((`d`.`id_daya` = `p_all`.`id_daya`))) GROUP BY `d`.`id_daya`, `d`.`jenis_daya`, `d`.`golongan`, `d`.`jml_daya` ORDER BY `jumlah_pemasangan_verified` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_kerusakan_gardu`
--
DROP TABLE IF EXISTS `v_rekap_kerusakan_gardu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rekap_kerusakan_gardu`  AS SELECT `g`.`id_gardu` AS `id_gardu`, `g`.`nm_gardu` AS `nm_gardu`, count(`k`.`id_kerusakan`) AS `jumlah_kerusakan` FROM (`gardu` `g` left join `kerusakan` `k` on((`g`.`id_gardu` = `k`.`id_gardu`))) GROUP BY `g`.`id_gardu`, `g`.`nm_gardu` ;

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_maintenance_gardu`
--
DROP TABLE IF EXISTS `v_rekap_maintenance_gardu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rekap_maintenance_gardu`  AS SELECT `g`.`id_gardu` AS `id_gardu`, `g`.`nm_gardu` AS `nm_gardu`, count(`m`.`id_maintenance`) AS `jumlah_maintenance` FROM (`gardu` `g` left join `maintenance` `m` on((`g`.`id_gardu` = `m`.`id_gardu`))) GROUP BY `g`.`id_gardu`, `g`.`nm_gardu` ;

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_maintenance_up3`
--
DROP TABLE IF EXISTS `v_rekap_maintenance_up3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rekap_maintenance_up3`  AS SELECT `u`.`id_up3` AS `id_up3`, `u`.`nm_up3` AS `nm_up3`, count(distinct `m`.`id_maintenance`) AS `jumlah_maintenance` FROM ((`up3` `u` left join `maintenance_up3` `mu` on((`u`.`id_up3` = `mu`.`id_up3`))) left join `maintenance` `m` on((`mu`.`id_maintenance` = `m`.`id_maintenance`))) GROUP BY `u`.`id_up3`, `u`.`nm_up3` ;

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_pemasangan_gardu`
--
DROP TABLE IF EXISTS `v_rekap_pemasangan_gardu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rekap_pemasangan_gardu`  AS SELECT `g`.`id_gardu` AS `id_gardu`, `g`.`nm_gardu` AS `nm_gardu`, count(`p`.`id_pemasangan`) AS `jumlah_pemasangan` FROM (`gardu` `g` left join `pemasangan` `p` on((`g`.`id_gardu` = `p`.`id_gardu`))) GROUP BY `g`.`id_gardu`, `g`.`nm_gardu` ;

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_pemasangan_up3`
--
DROP TABLE IF EXISTS `v_rekap_pemasangan_up3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rekap_pemasangan_up3`  AS SELECT `u`.`id_up3` AS `id_up3`, `u`.`nm_up3` AS `nm_up3`, count(distinct `p`.`id_pemasangan`) AS `jumlah_pemasangan` FROM ((`up3` `u` left join `pemasangan_up3` `pu` on((`u`.`id_up3` = `pu`.`id_up3`))) left join `pemasangan` `p` on((`pu`.`id_pemasangan` = `p`.`id_pemasangan`))) GROUP BY `u`.`id_up3`, `u`.`nm_up3` ;

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_pengaduan_gardu`
--
DROP TABLE IF EXISTS `v_rekap_pengaduan_gardu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rekap_pengaduan_gardu`  AS SELECT `g`.`id_gardu` AS `id_gardu`, `g`.`nm_gardu` AS `nm_gardu`, count(`pg`.`id_pengaduan`) AS `jumlah_pengaduan` FROM (`gardu` `g` left join `pengaduan` `pg` on((`g`.`id_gardu` = `pg`.`id_gardu`))) GROUP BY `g`.`id_gardu`, `g`.`nm_gardu` ;

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_perbaikan_up3`
--
DROP TABLE IF EXISTS `v_rekap_perbaikan_up3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rekap_perbaikan_up3`  AS SELECT `u`.`id_up3` AS `id_up3`, `u`.`nm_up3` AS `nm_up3`, count(distinct `p`.`id_perbaikan`) AS `jumlah_perbaikan` FROM ((`up3` `u` left join `perbaikan_up3` `pu` on((`u`.`id_up3` = `pu`.`id_up3`))) left join `perbaikan` `p` on((`pu`.`id_perbaikan` = `p`.`id_perbaikan`))) GROUP BY `u`.`id_up3`, `u`.`nm_up3` ;

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_semua_aktivitas_gardu`
--
DROP TABLE IF EXISTS `v_rekap_semua_aktivitas_gardu`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rekap_semua_aktivitas_gardu`  AS SELECT `g`.`id_gardu` AS `id_gardu`, `g`.`nm_gardu` AS `nm_gardu`, `g`.`area` AS `area`, coalesce(`p`.`jumlah_pemasangan`,0) AS `jumlah_pemasangan`, coalesce(`pg`.`jumlah_pengaduan`,0) AS `jumlah_pengaduan`, coalesce(`k`.`jumlah_kerusakan`,0) AS `jumlah_kerusakan`, coalesce(`m`.`jumlah_maintenance`,0) AS `jumlah_maintenance`, (((coalesce(`p`.`jumlah_pemasangan`,0) + coalesce(`pg`.`jumlah_pengaduan`,0)) + coalesce(`k`.`jumlah_kerusakan`,0)) + coalesce(`m`.`jumlah_maintenance`,0)) AS `total_aktivitas` FROM ((((`gardu` `g` left join `v_rekap_pemasangan_gardu` `p` on((`g`.`id_gardu` = `p`.`id_gardu`))) left join `v_rekap_pengaduan_gardu` `pg` on((`g`.`id_gardu` = `pg`.`id_gardu`))) left join `v_rekap_kerusakan_gardu` `k` on((`g`.`id_gardu` = `k`.`id_gardu`))) left join `v_rekap_maintenance_gardu` `m` on((`g`.`id_gardu` = `m`.`id_gardu`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_semua_aktivitas_up3`
--
DROP TABLE IF EXISTS `v_rekap_semua_aktivitas_up3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rekap_semua_aktivitas_up3`  AS SELECT `u`.`id_up3` AS `id_up3`, `u`.`kode_up3` AS `kode_up3`, `u`.`nm_up3` AS `nm_up3`, `u`.`nik_up3` AS `nik_up3`, `u`.`jk_up3` AS `jk_up3`, `u`.`tmpt_lahir_up3` AS `tmpt_lahir_up3`, `u`.`tgl_lahir_up3` AS `tgl_lahir_up3`, `u`.`agama_up3` AS `agama_up3`, `u`.`alamat_up3` AS `alamat_up3`, `u`.`hp_up3` AS `hp_up3`, `u`.`tmt` AS `tmt`, coalesce(`p`.`jumlah_pemasangan`,0) AS `jumlah_pemasangan`, coalesce(`ud`.`jumlah_ubah_daya`,0) AS `jumlah_ubah_daya`, coalesce(`pb`.`jumlah_perbaikan`,0) AS `jumlah_perbaikan`, coalesce(`m`.`jumlah_maintenance`,0) AS `jumlah_maintenance`, (((coalesce(`p`.`jumlah_pemasangan`,0) + coalesce(`ud`.`jumlah_ubah_daya`,0)) + coalesce(`pb`.`jumlah_perbaikan`,0)) + coalesce(`m`.`jumlah_maintenance`,0)) AS `total_aktivitas` FROM ((((`up3` `u` left join `v_rekap_pemasangan_up3` `p` on((`u`.`id_up3` = `p`.`id_up3`))) left join `v_rekap_ubah_daya_up3` `ud` on((`u`.`id_up3` = `ud`.`id_up3`))) left join `v_rekap_perbaikan_up3` `pb` on((`u`.`id_up3` = `pb`.`id_up3`))) left join `v_rekap_maintenance_up3` `m` on((`u`.`id_up3` = `m`.`id_up3`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_rekap_ubah_daya_up3`
--
DROP TABLE IF EXISTS `v_rekap_ubah_daya_up3`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_rekap_ubah_daya_up3`  AS SELECT `u`.`id_up3` AS `id_up3`, `u`.`nm_up3` AS `nm_up3`, count(distinct `ud`.`id_ubah_daya`) AS `jumlah_ubah_daya` FROM ((`up3` `u` left join `ubah_daya_up3` `udu` on((`u`.`id_up3` = `udu`.`id_up3`))) left join `ubah_daya` `ud` on((`udu`.`id_ubah_daya` = `ud`.`id_ubah_daya`))) GROUP BY `u`.`id_up3`, `u`.`nm_up3` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `daya`
--
ALTER TABLE `daya`
  ADD PRIMARY KEY (`id_daya`);

--
-- Indexes for table `gardu`
--
ALTER TABLE `gardu`
  ADD PRIMARY KEY (`id_gardu`);

--
-- Indexes for table `kerusakan`
--
ALTER TABLE `kerusakan`
  ADD PRIMARY KEY (`id_kerusakan`),
  ADD KEY `id_gardu` (`id_gardu`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id_maintenance`),
  ADD KEY `id_gardu` (`id_gardu`);

--
-- Indexes for table `maintenance_up3`
--
ALTER TABLE `maintenance_up3`
  ADD PRIMARY KEY (`id_maintenance_up3`),
  ADD KEY `id_maintenance` (`id_maintenance`),
  ADD KEY `id_up3` (`id_up3`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pemasangan`
--
ALTER TABLE `pemasangan`
  ADD PRIMARY KEY (`id_pemasangan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_daya` (`id_daya`),
  ADD KEY `id_gardu` (`id_gardu`);

--
-- Indexes for table `pemasangan_up3`
--
ALTER TABLE `pemasangan_up3`
  ADD PRIMARY KEY (`id_pemasangan_up3`),
  ADD KEY `id_up3` (`id_up3`),
  ADD KEY `id_pemasangan` (`id_pemasangan`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_gardu` (`id_gardu`);

--
-- Indexes for table `perbaikan`
--
ALTER TABLE `perbaikan`
  ADD PRIMARY KEY (`id_perbaikan`),
  ADD KEY `id_kerusakan` (`id_kerusakan`);

--
-- Indexes for table `perbaikan_up3`
--
ALTER TABLE `perbaikan_up3`
  ADD PRIMARY KEY (`id_perbaikan_up3`),
  ADD KEY `id_perbaikan` (`id_perbaikan`),
  ADD KEY `id_up3` (`id_up3`);

--
-- Indexes for table `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD PRIMARY KEY (`id_tanggapan`),
  ADD KEY `id_pengaduan` (`id_pengaduan`);

--
-- Indexes for table `ubah_daya`
--
ALTER TABLE `ubah_daya`
  ADD PRIMARY KEY (`id_ubah_daya`),
  ADD KEY `id_pemasangan` (`id_pemasangan`),
  ADD KEY `id_daya` (`id_daya`);

--
-- Indexes for table `ubah_daya_up3`
--
ALTER TABLE `ubah_daya_up3`
  ADD PRIMARY KEY (`id_ubah_daya_up3`),
  ADD KEY `id_ubah_daya` (`id_ubah_daya`),
  ADD KEY `id_up3` (`id_up3`);

--
-- Indexes for table `up3`
--
ALTER TABLE `up3`
  ADD PRIMARY KEY (`id_up3`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `daya`
--
ALTER TABLE `daya`
  MODIFY `id_daya` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `gardu`
--
ALTER TABLE `gardu`
  MODIFY `id_gardu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kerusakan`
--
ALTER TABLE `kerusakan`
  MODIFY `id_kerusakan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id_maintenance` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `maintenance_up3`
--
ALTER TABLE `maintenance_up3`
  MODIFY `id_maintenance_up3` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pemasangan`
--
ALTER TABLE `pemasangan`
  MODIFY `id_pemasangan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pemasangan_up3`
--
ALTER TABLE `pemasangan_up3`
  MODIFY `id_pemasangan_up3` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `perbaikan`
--
ALTER TABLE `perbaikan`
  MODIFY `id_perbaikan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `perbaikan_up3`
--
ALTER TABLE `perbaikan_up3`
  MODIFY `id_perbaikan_up3` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tanggapan`
--
ALTER TABLE `tanggapan`
  MODIFY `id_tanggapan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ubah_daya`
--
ALTER TABLE `ubah_daya`
  MODIFY `id_ubah_daya` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ubah_daya_up3`
--
ALTER TABLE `ubah_daya_up3`
  MODIFY `id_ubah_daya_up3` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `up3`
--
ALTER TABLE `up3`
  MODIFY `id_up3` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kerusakan`
--
ALTER TABLE `kerusakan`
  ADD CONSTRAINT `kerusakan_ibfk_1` FOREIGN KEY (`id_gardu`) REFERENCES `gardu` (`id_gardu`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `kerusakan_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`id_gardu`) REFERENCES `gardu` (`id_gardu`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `maintenance_up3`
--
ALTER TABLE `maintenance_up3`
  ADD CONSTRAINT `maintenance_up3_ibfk_1` FOREIGN KEY (`id_maintenance`) REFERENCES `maintenance` (`id_maintenance`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `maintenance_up3_ibfk_2` FOREIGN KEY (`id_up3`) REFERENCES `up3` (`id_up3`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pemasangan`
--
ALTER TABLE `pemasangan`
  ADD CONSTRAINT `pemasangan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemasangan_ibfk_2` FOREIGN KEY (`id_daya`) REFERENCES `daya` (`id_daya`),
  ADD CONSTRAINT `pemasangan_ibfk_3` FOREIGN KEY (`id_gardu`) REFERENCES `gardu` (`id_gardu`);

--
-- Constraints for table `pemasangan_up3`
--
ALTER TABLE `pemasangan_up3`
  ADD CONSTRAINT `pemasangan_up3_ibfk_2` FOREIGN KEY (`id_up3`) REFERENCES `up3` (`id_up3`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pemasangan_up3_ibfk_3` FOREIGN KEY (`id_pemasangan`) REFERENCES `pemasangan` (`id_pemasangan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD CONSTRAINT `pengaduan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pengaduan_ibfk_2` FOREIGN KEY (`id_gardu`) REFERENCES `gardu` (`id_gardu`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `perbaikan`
--
ALTER TABLE `perbaikan`
  ADD CONSTRAINT `perbaikan_ibfk_1` FOREIGN KEY (`id_kerusakan`) REFERENCES `kerusakan` (`id_kerusakan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `perbaikan_up3`
--
ALTER TABLE `perbaikan_up3`
  ADD CONSTRAINT `perbaikan_up3_ibfk_1` FOREIGN KEY (`id_perbaikan`) REFERENCES `perbaikan` (`id_perbaikan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `perbaikan_up3_ibfk_2` FOREIGN KEY (`id_up3`) REFERENCES `up3` (`id_up3`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tanggapan`
--
ALTER TABLE `tanggapan`
  ADD CONSTRAINT `tanggapan_ibfk_1` FOREIGN KEY (`id_pengaduan`) REFERENCES `pengaduan` (`id_pengaduan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ubah_daya`
--
ALTER TABLE `ubah_daya`
  ADD CONSTRAINT `ubah_daya_ibfk_1` FOREIGN KEY (`id_pemasangan`) REFERENCES `pemasangan` (`id_pemasangan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ubah_daya_ibfk_2` FOREIGN KEY (`id_daya`) REFERENCES `daya` (`id_daya`);

--
-- Constraints for table `ubah_daya_up3`
--
ALTER TABLE `ubah_daya_up3`
  ADD CONSTRAINT `ubah_daya_up3_ibfk_1` FOREIGN KEY (`id_ubah_daya`) REFERENCES `ubah_daya` (`id_ubah_daya`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ubah_daya_up3_ibfk_2` FOREIGN KEY (`id_up3`) REFERENCES `up3` (`id_up3`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
