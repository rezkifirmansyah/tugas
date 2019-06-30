-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2018 at 04:31 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpus`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(5) NOT NULL,
  `nama_admin` varchar(25) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `username`, `password`) VALUES
(1, 'Admin', 'admin', 'c33367701511b4f6020ec61ded352059'),
(2, 'Ismoyo', 'ind2906', '827ccb0eea8a706c4c34a16891f84e7b');

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(5) NOT NULL,
  `nama_anggota` varchar(45) NOT NULL,
  `gender` enum('laki-laki','perempuan') NOT NULL,
  `no_tlpn` varchar(15) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nama_anggota`, `gender`, `no_tlpn`, `alamat`, `email`, `password`) VALUES
(1, 'Faris Hendra', 'laki-laki', '012345678911', 'alam sutra', 'faris.hendra@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(5) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `judul_buku` varchar(50) NOT NULL,
  `pengarang` varchar(35) NOT NULL,
  `thn_terbit` date NOT NULL,
  `penerbit` varchar(50) NOT NULL,
  `isbn` varchar(25) NOT NULL,
  `jumlah_buku` int(3) NOT NULL,
  `lokasi` enum('Rak 1','Rak 2','Rak 3') NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `tgl_input` date NOT NULL,
  `status_buku` enum('1','0') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `id_kategori`, `judul_buku`, `pengarang`, `thn_terbit`, `penerbit`, `isbn`, `jumlah_buku`, `lokasi`, `gambar`, `tgl_input`, `status_buku`) VALUES
(11, 23132, 'Belajar CodeIgniter', 'Ismoyo Nugroho Djayusman', '2018-11-30', 'IND2906', '321421', 1, 'Rak 1', '', '0000-00-00', '1'),
(12, 23133, 'Belajar Membuat Website', 'Faris Hendra', '2009-11-30', 'IND2906', '9898978776', 100, 'Rak 2', 'gambartime.jpg', '2018-11-30', '1'),
(13, 23132, 'Sistem Informasi Manajemen', 'Djayusman', '2017-11-30', 'IND2906', '789564678656467', 21, 'Rak 3', '', '0000-00-00', '1');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(23132, 'Sistem Informasi'),
(23133, 'Web Programming');

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pinjam` int(5) NOT NULL,
  `tgl_pencatatan` datetime NOT NULL,
  `id_anggota` int(5) NOT NULL,
  `id_buku` int(5) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `tgl_kembali` date NOT NULL,
  `denda` double NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `total_denda` double NOT NULL,
  `status_buku` enum('1','0') NOT NULL,
  `status_pengembalian` varchar(15) NOT NULL,
  `status_peminjaman` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_pinjam`, `tgl_pencatatan`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `denda`, `tgl_pengembalian`, `total_denda`, `status_buku`, `status_pengembalian`, `status_peminjaman`) VALUES
(10, '2018-12-01 18:12:45', 0, 0, '2018-12-08', '2018-12-11', 123, '0000-00-00', 0, '1', '0', '0'),
(11, '2018-12-01 18:21:44', 0, 0, '2018-12-13', '2018-12-29', 495648, '0000-00-00', 0, '1', '0', '0'),
(12, '2018-12-01 18:22:52', 0, 0, '2018-12-29', '2018-12-28', 456, '0000-00-00', 0, '1', '0', '0'),
(13, '2018-12-01 18:25:37', 0, 0, '2018-12-21', '2018-12-20', 45, '0000-00-00', 0, '1', '0', '0'),
(14, '2018-12-01 18:26:29', 0, 0, '2018-11-29', '2018-12-01', 54, '0000-00-00', 0, '1', '0', '0'),
(15, '2018-12-01 18:30:31', 0, 0, '2018-12-03', '2018-12-04', 34, '0000-00-00', 0, '1', '0', '0'),
(16, '2018-12-01 18:34:39', 0, 0, '2018-12-05', '2018-12-14', 23, '0000-00-00', 0, '1', '0', '0'),
(17, '2018-12-01 18:36:29', 0, 0, '2018-12-07', '2018-12-29', 54, '0000-00-00', 0, '1', '0', '0');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pinjam`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23134;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_pinjam` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
