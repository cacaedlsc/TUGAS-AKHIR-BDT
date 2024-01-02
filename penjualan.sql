-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2024 at 09:39 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

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
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `kode_brg` varchar(10) NOT NULL,
  `nama_brg` varchar(20) DEFAULT NULL,
  `harga` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `kode_brg`, `nama_brg`, `harga`) VALUES
(1, 'BR001', 'Laptop ASUS', 7000000),
(2, 'BR002', 'iPHONE PRO MAX 17', 25999000),
(3, 'BR003', 'Printer', 1500000),
(4, 'BR004', 'Changer USB', 75000),
(5, 'BR005', 'Changer Type C', 80000),
(8, 'BR006', 'Earphone Lenoffo', 210000);

-- --------------------------------------------------------

--
-- Table structure for table `barang_harga`
--

CREATE TABLE `barang_harga` (
  `kode_brg` varchar(10) NOT NULL,
  `harga` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_harga`
--

INSERT INTO `barang_harga` (`kode_brg`, `harga`) VALUES
('BR001', 7000000),
('BR002', 1000000),
('BR003', 1500000),
('BR004', 75000),
('BR005', 80000),
('BR006', 210000),
('BR007', 321000);

-- --------------------------------------------------------

--
-- Table structure for table `barang_info`
--

CREATE TABLE `barang_info` (
  `kode_brg` varchar(10) NOT NULL,
  `nama_brg` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_info`
--

INSERT INTO `barang_info` (`kode_brg`, `nama_brg`) VALUES
('BR001', 'Laptop'),
('BR002', 'HP'),
('BR003', 'Printer'),
('BR004', 'Changer USB'),
('BR005', 'Changer Type C'),
('BR006', 'Earphone Lenoffo'),
('BR007', 'TWS Azuzza');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `kode_plg` varchar(15) NOT NULL,
  `nama_plg` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `kode_plg`, `nama_plg`) VALUES
(1, 'LT001', 'Lintang Ayundia'),
(3, 'LT003', 'Anastavia Vanza'),
(5, 'LT009', 'Ita');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `kode_plg` varchar(15) NOT NULL,
  `kode_brg` varchar(10) NOT NULL,
  `jumlah_beli` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `kode_plg`, `kode_brg`, `jumlah_beli`) VALUES
(1, 'LT001', 'BR001', 2),
(2, 'LT001', 'BR002', 3),
(3, 'LT001', 'BR003', 1),
(4, 'LT001', 'BR007', 1),
(5, 'LT002', 'BR002', 5),
(11, 'LT011', 'BR004', 20),
(12, 'LT012', 'BR007', 2);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_atas_tiga`
--

CREATE TABLE `transaksi_atas_tiga` (
  `kode_plg` varchar(15) NOT NULL,
  `kode_brg` varchar(10) NOT NULL,
  `jumlah_beli` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_atas_tiga`
--

INSERT INTO `transaksi_atas_tiga` (`kode_plg`, `kode_brg`, `jumlah_beli`) VALUES
('LT002', 'BR002', 5),
('LT005', 'BR005', 10);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_lt001`
--

CREATE TABLE `transaksi_lt001` (
  `kode_plg` varchar(15) NOT NULL,
  `kode_brg` varchar(10) NOT NULL,
  `jumlah_beli` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi_lt001`
--

INSERT INTO `transaksi_lt001` (`kode_plg`, `kode_brg`, `jumlah_beli`) VALUES
('LT001', 'BR001', 2),
('LT001', 'BR002', 3),
('LT001', 'BR003', 1),
('LT001', 'BR007', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
