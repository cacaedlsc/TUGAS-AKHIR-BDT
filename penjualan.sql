-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Jan 2024 pada 20.55
-- Versi server: 10.4.32-MariaDB-log
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `kode_brg` varchar(10) NOT NULL,
  `nama_brg` varchar(20) DEFAULT NULL,
  `harga` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `kode_brg`, `nama_brg`, `harga`) VALUES
(1, 'BR001', 'Laptop', 7000000),
(2, 'BR002', 'HP', 1000000),
(3, 'BR003', 'Printer', 1500000),
(4, 'BR004', 'Changer USB', 75000),
(10, 'BR005', 'Changer Type C', 80000),
(11, 'BR006', 'Earphone Lenoffo', 210000),
(12, 'BR007', 'TWS Azuzza', 321000);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `barang_harga`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `barang_harga` (
`id_barang` int(11)
,`kode_brg` varchar(10)
,`harga` int(20)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `barang_info`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `barang_info` (
`id_barang` int(11)
,`kode_brg` varchar(10)
,`nama_brg` varchar(20)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `info_jumlah_atas_tiga`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `info_jumlah_atas_tiga` (
`id_transaksi` int(11)
,`kode_plg` varchar(15)
,`kode_brg` varchar(10)
,`jumlah_beli` int(20)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `kode_plg` varchar(15) NOT NULL,
  `nama_plg` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `kode_plg`, `nama_plg`) VALUES
(1, 'LT001', 'Lintang Ayundia'),
(3, 'LT003', 'Anastavia Vanza Azzahra');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `kode_plg` varchar(15) NOT NULL,
  `kode_brg` varchar(10) NOT NULL,
  `jumlah_beli` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `kode_plg`, `kode_brg`, `jumlah_beli`) VALUES
(1, 'LT001', 'BR001', 2),
(2, 'LT001', 'BR002', 3),
(3, 'LT001', 'BR003', 1),
(4, 'LT001', 'BR007', 1),
(5, 'LT002', 'BR002', 5),
(13, 'LT002', 'BR007', 2),
(14, 'LT004', 'BR006', 2),
(15, 'LT005', 'BR005', 10);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `transaksi_pelanggan_lt001`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `transaksi_pelanggan_lt001` (
`id_transaksi` int(11)
,`kode_plg` varchar(15)
,`kode_brg` varchar(10)
,`jumlah_beli` int(20)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `barang_harga`
--
DROP TABLE IF EXISTS `barang_harga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `barang_harga`  AS SELECT `barang`.`id_barang` AS `id_barang`, `barang`.`kode_brg` AS `kode_brg`, `barang`.`harga` AS `harga` FROM `barang` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `barang_info`
--
DROP TABLE IF EXISTS `barang_info`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `barang_info`  AS SELECT `barang`.`id_barang` AS `id_barang`, `barang`.`kode_brg` AS `kode_brg`, `barang`.`nama_brg` AS `nama_brg` FROM `barang` ;

-- --------------------------------------------------------

--
-- Struktur untuk view `info_jumlah_atas_tiga`
--
DROP TABLE IF EXISTS `info_jumlah_atas_tiga`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `info_jumlah_atas_tiga`  AS SELECT `transaksi`.`id_transaksi` AS `id_transaksi`, `transaksi`.`kode_plg` AS `kode_plg`, `transaksi`.`kode_brg` AS `kode_brg`, `transaksi`.`jumlah_beli` AS `jumlah_beli` FROM `transaksi` WHERE `transaksi`.`jumlah_beli` > 3 ;

-- --------------------------------------------------------

--
-- Struktur untuk view `transaksi_pelanggan_lt001`
--
DROP TABLE IF EXISTS `transaksi_pelanggan_lt001`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transaksi_pelanggan_lt001`  AS SELECT `transaksi`.`id_transaksi` AS `id_transaksi`, `transaksi`.`kode_plg` AS `kode_plg`, `transaksi`.`kode_brg` AS `kode_brg`, `transaksi`.`jumlah_beli` AS `jumlah_beli` FROM `transaksi` WHERE `transaksi`.`kode_plg` = 'LT001' ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
