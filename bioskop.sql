-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 06:08 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bioskop`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id_akun` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id_akun`, `nama`, `email`, `username`, `password`) VALUES
(1, 'Budi Santoso', 'budi@example.com', 'admin', '1234');

-- --------------------------------------------------------

--
-- Table structure for table `film`
--

CREATE TABLE `film` (
  `id_film` int(11) NOT NULL,
  `judul_film` varchar(255) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `durasi` int(11) DEFAULT NULL CHECK (`durasi` > 0),
  `harga` int(11) DEFAULT 0,
  `gambar` varchar(255) DEFAULT NULL,
  `sinopsis` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `film`
--

INSERT INTO `film` (`id_film`, `judul_film`, `genre`, `durasi`, `harga`, `gambar`, `sinopsis`) VALUES
(1, 'Laskar Pelangi', 'Drama', 120, 0, 'laskar_pelangi.jpg', 'Mengisahkan perjuangan 10 anak dari keluarga sederhana di Belitung untuk mendapatkan pendidikan di sekolah yang hampir tutup karena kekurangan murid.'),
(2, 'Pengabdi Setan', 'Horor', 100, 0, 'pengabdi_setan.jpg', 'Setelah ibu mereka meninggal, sebuah keluarga dihantui oleh kejadian-kejadian mistis yang berhubungan dengan masa lalu sang ibu.'),
(3, 'Gundala', 'Aksi', 123, 0, 'gundala.jpg', 'Kisah seorang pahlawan lokal, Sancaka, yang mendapatkan kekuatan petir.'),
(4, 'Dilan 1990', 'Romantis', 110, 0, 'dilan_1990.jpg', 'Cerita cinta remaja antara Dilan dan Milea berlatar tahun 1990.'),
(5, 'Yowis Ben', 'Komedi', 100, 0, 'yowis_ben.jpg', 'Mengisahkan sekelompok pemuda yang membentuk band lokal demi menarik perhatian gadis yang disukai salah satu dari mereka.'),
(6, 'Habibie & Ainun', 'Drama Romantis', 123, 0, 'habibie_ainun.jpg', 'Kisah cinta sejati antara BJ Habibie dan istrinya, Ainun.'),
(7, 'KKN di Desa Penari', 'Horor', 100, 0, 'kkn_desa_penari.jpg', 'Sekelompok mahasiswa menjalani program KKN di sebuah desa terpencil.'),
(8, 'Warkop DKI Reborn', 'Komedi', 110, 0, 'warkop_dki_reborn.jpg', 'Reinkarnasi dari humor klasik Warkop DKI.'),
(9, 'The Raid: Redemption', 'Aksi', 110, 0, 'the_raid_redemption.jpg', 'Sebuah tim SWAT terperangkap di sebuah gedung yang dikendalikan oleh bos kriminal.'),
(10, 'Kartini', 'Sejarah', 119, 0, 'kartini.jpg', 'Menceritakan perjuangan Kartini dalam memperjuangkan hak pendidikan dan kesetaraan.'),
(11, 'Susi Susanti: Love All', 'Biopik/Drama', 100, 0, 'susi_susanti.jpg', 'Mengangkat kisah hidup Susi Susanti, atlet bulutangkis legendaris Indonesia.'),
(12, 'Marlina Si Pembunuh dalam Empat Babak', 'Thriller', 93, 0, 'marlina.jpg', 'Kisah seorang wanita yang membalas dendam setelah diserang oleh sekelompok pria di rumahnya.'),
(13, 'Perempuan Tanah Jahanam', 'Horor/Thriller', 108, 0, 'perempuan_tanah_jahanam.jpg', 'Seorang wanita kembali ke desa asalnya untuk mengklaim warisan, tetapi malah menemukan rahasia kelam.');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_film` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `studio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `id_film`, `tanggal`, `waktu`, `studio`) VALUES
(2, 4, '2024-12-03', '06:47:36', 'Studio 1'),
(4, 4, '2024-12-01', '12:12:00', 'Studio 2'),
(5, 12, '2024-12-01', '15:12:00', 'Studio 4'),
(6, 3, '2024-11-01', '19:00:00', 'Studio 1');

-- --------------------------------------------------------

--
-- Table structure for table `pemesanan`
--

CREATE TABLE `pemesanan` (
  `id_pemesanan` int(11) NOT NULL,
  `nama_pelanggan` varchar(255) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `jumlah_tiket` int(11) DEFAULT NULL CHECK (`jumlah_tiket` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id_akun`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id_film`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_film` (`id_film`);

--
-- Indexes for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD PRIMARY KEY (`id_pemesanan`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id_akun` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `film`
--
ALTER TABLE `film`
  MODIFY `id_film` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pemesanan`
--
ALTER TABLE `pemesanan`
  MODIFY `id_pemesanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`) ON DELETE CASCADE;

--
-- Constraints for table `pemesanan`
--
ALTER TABLE `pemesanan`
  ADD CONSTRAINT `pemesanan_ibfk_1` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal` (`id_jadwal`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
