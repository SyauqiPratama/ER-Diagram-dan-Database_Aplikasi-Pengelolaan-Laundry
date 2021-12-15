-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Des 2021 pada 16.28
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dblaundry`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `form_login`
--

CREATE TABLE `form_login` (
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `form_registrasipelanggan`
--

CREATE TABLE `form_registrasipelanggan` (
  `#` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `jenis_kelamin` enum('Laki Laki','Perempuan') NOT NULL,
  `no_ktp` char(16) NOT NULL,
  `no_telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_crud_outlet`
--

CREATE TABLE `tb_crud_outlet` (
  `#` int(11) NOT NULL,
  `nama_outlet` varchar(100) NOT NULL,
  `owner` varchar(100) NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `alamat` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_crud_pengguna`
--

CREATE TABLE `tb_crud_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nama_pengguna` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `role` enum('admin','kasir','owner') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_crud_produkataupaketcucian`
--

CREATE TABLE `tb_crud_produkataupaketcucian` (
  `#` int(11) NOT NULL,
  `jenis_produk` enum('satuan','kiloan','selimut','bed_cover','kaos') NOT NULL,
  `harga_produk` decimal(10,0) NOT NULL,
  `nama_paket` enum('Cuci Komplet Reguler','Cuci Komplet Kilat','Cuci Komplet Express','Cuci Kering Regular','Cuci Kering Kilat','Cuci Kering Express','Setrika Reguler','Setrika Kilat','Setrika Express') NOT NULL,
  `nama_outlet` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_entritransaksi`
--

CREATE TABLE `tb_entritransaksi` (
  `id_transaksi` int(11) NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `pembayaran` enum('dibayar','belum dibayar') NOT NULL,
  `total_transaksi` decimal(10,0) NOT NULL,
  `status_produk` enum('baru','proses','selesai','diambil') NOT NULL,
  `nama_paket` enum('Cuci Komplet Reguler','Cuci Komplet Kilat','Cuci Komplet Express','Cuci Kering Reguler','Cuci Kering Kilat','Cuci Kering Express','Setrika Reguler','Setrika Kilat','Setrika Express') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kasir`
--

CREATE TABLE `tb_kasir` (
  `id_kasir` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `nama_kasir` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_laporan`
--

CREATE TABLE `tb_laporan` (
  `id_transaksi` int(11) NOT NULL,
  `nama_paket` enum('Cuci Komplet Regular','Cuci Komplet Kilat','Cuci Komplet Express','Cuci Kering Regular','Cuci Kering Kilat','Cuci Kering Express','Setrika Regular','Setrika Kilat','Setrika Express') NOT NULL,
  `jumlah_transaksi` int(11) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `total_transaksi` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_owner`
--

CREATE TABLE `tb_owner` (
  `id_owner` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `nama_owner` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `form_login`
--
ALTER TABLE `form_login`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `form_registrasipelanggan`
--
ALTER TABLE `form_registrasipelanggan`
  ADD PRIMARY KEY (`#`),
  ADD UNIQUE KEY `nama_pelanggan` (`nama_pelanggan`);

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `nama_admin` (`nama_admin`);

--
-- Indeks untuk tabel `tb_crud_outlet`
--
ALTER TABLE `tb_crud_outlet`
  ADD PRIMARY KEY (`#`),
  ADD UNIQUE KEY `nama_outlet` (`nama_outlet`);

--
-- Indeks untuk tabel `tb_crud_pengguna`
--
ALTER TABLE `tb_crud_pengguna`
  ADD PRIMARY KEY (`id_pengguna`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `nama_pengguna` (`nama_pengguna`);

--
-- Indeks untuk tabel `tb_crud_produkataupaketcucian`
--
ALTER TABLE `tb_crud_produkataupaketcucian`
  ADD PRIMARY KEY (`#`),
  ADD UNIQUE KEY `nama_paket` (`nama_paket`),
  ADD UNIQUE KEY `nama_outlet` (`nama_outlet`);

--
-- Indeks untuk tabel `tb_entritransaksi`
--
ALTER TABLE `tb_entritransaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `nama_pelanggan` (`nama_pelanggan`),
  ADD UNIQUE KEY `nama_paket` (`nama_paket`),
  ADD UNIQUE KEY `id_transaksi` (`id_transaksi`),
  ADD UNIQUE KEY `status_produk` (`status_produk`),
  ADD UNIQUE KEY `pembayaran` (`pembayaran`),
  ADD UNIQUE KEY `total_transaksi` (`total_transaksi`);

--
-- Indeks untuk tabel `tb_kasir`
--
ALTER TABLE `tb_kasir`
  ADD PRIMARY KEY (`id_kasir`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `nama_kasir` (`nama_kasir`);

--
-- Indeks untuk tabel `tb_laporan`
--
ALTER TABLE `tb_laporan`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `nama_paket` (`nama_paket`),
  ADD UNIQUE KEY `total_transaksi` (`total_transaksi`),
  ADD UNIQUE KEY `id_transaksi` (`id_transaksi`);

--
-- Indeks untuk tabel `tb_owner`
--
ALTER TABLE `tb_owner`
  ADD PRIMARY KEY (`id_owner`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `nama_owner` (`nama_owner`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `form_registrasipelanggan`
--
ALTER TABLE `form_registrasipelanggan`
  MODIFY `#` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_crud_outlet`
--
ALTER TABLE `tb_crud_outlet`
  MODIFY `#` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_crud_pengguna`
--
ALTER TABLE `tb_crud_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_crud_produkataupaketcucian`
--
ALTER TABLE `tb_crud_produkataupaketcucian`
  MODIFY `#` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_entritransaksi`
--
ALTER TABLE `tb_entritransaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_kasir`
--
ALTER TABLE `tb_kasir`
  MODIFY `id_kasir` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tb_owner`
--
ALTER TABLE `tb_owner`
  MODIFY `id_owner` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `form_login`
--
ALTER TABLE `form_login`
  ADD CONSTRAINT `relasi login dengan admin` FOREIGN KEY (`username`) REFERENCES `tb_admin` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi login dengan kasir` FOREIGN KEY (`username`) REFERENCES `tb_kasir` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relasi login dengan owner` FOREIGN KEY (`username`) REFERENCES `tb_owner` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `form_registrasipelanggan`
--
ALTER TABLE `form_registrasipelanggan`
  ADD CONSTRAINT `relasi pelanggan dengan transaksi` FOREIGN KEY (`nama_pelanggan`) REFERENCES `tb_entritransaksi` (`nama_pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`id_admin`) REFERENCES `tb_crud_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_admin_ibfk_2` FOREIGN KEY (`nama_admin`) REFERENCES `tb_crud_pengguna` (`nama_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_admin_ibfk_3` FOREIGN KEY (`username`) REFERENCES `tb_crud_pengguna` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_crud_outlet`
--
ALTER TABLE `tb_crud_outlet`
  ADD CONSTRAINT `relasi outlet dengan paket` FOREIGN KEY (`nama_outlet`) REFERENCES `tb_crud_produkataupaketcucian` (`nama_outlet`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_crud_pengguna`
--
ALTER TABLE `tb_crud_pengguna`
  ADD CONSTRAINT `tb_crud_pengguna_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `tb_owner` (`id_owner`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_crud_pengguna_ibfk_2` FOREIGN KEY (`nama_pengguna`) REFERENCES `tb_owner` (`nama_owner`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_crud_pengguna_ibfk_3` FOREIGN KEY (`username`) REFERENCES `tb_kasir` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_crud_produkataupaketcucian`
--
ALTER TABLE `tb_crud_produkataupaketcucian`
  ADD CONSTRAINT `relasi paket dengan laporan` FOREIGN KEY (`nama_paket`) REFERENCES `tb_laporan` (`nama_paket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_entritransaksi`
--
ALTER TABLE `tb_entritransaksi`
  ADD CONSTRAINT `tb_entritransaksi_ibfk_1` FOREIGN KEY (`nama_paket`) REFERENCES `tb_crud_produkataupaketcucian` (`nama_paket`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_entritransaksi_ibfk_3` FOREIGN KEY (`total_transaksi`) REFERENCES `tb_laporan` (`total_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_kasir`
--
ALTER TABLE `tb_kasir`
  ADD CONSTRAINT `tb_kasir_ibfk_1` FOREIGN KEY (`id_kasir`) REFERENCES `tb_crud_pengguna` (`id_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_kasir_ibfk_2` FOREIGN KEY (`nama_kasir`) REFERENCES `tb_crud_pengguna` (`nama_pengguna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_laporan`
--
ALTER TABLE `tb_laporan`
  ADD CONSTRAINT `tb_laporan_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `tb_entritransaksi` (`id_transaksi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_laporan_ibfk_2` FOREIGN KEY (`nama_paket`) REFERENCES `tb_entritransaksi` (`nama_paket`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_owner`
--
ALTER TABLE `tb_owner`
  ADD CONSTRAINT `tb_owner_ibfk_1` FOREIGN KEY (`username`) REFERENCES `tb_crud_pengguna` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
