-- STRUKTUR PENDAMPING HASIL REKONSTRUKSI DARI KOLOM DUMP.
-- Jalankan hanya pada database latihan BARU/KOSONG.
-- Jika tabel sudah tersedia, gunakan struktur asli dan jangan jalankan file ini.
CREATE DATABASE IF NOT EXISTS db_inventori_lab
CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_inventori_lab;

CREATE TABLE kategori (
    id_kategori INT NOT NULL AUTO_INCREMENT,
    nama_kategori VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_kategori),
    UNIQUE KEY uk_kategori_nama (nama_kategori)
) ENGINE=InnoDB;

CREATE TABLE pengguna (
    id_pengguna INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    nama_lengkap VARCHAR(100) NOT NULL,
    peran ENUM('admin', 'petugas') NOT NULL,
    aktif TINYINT(1) NOT NULL DEFAULT 1,
    dibuat_pada DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_pengguna),
    UNIQUE KEY uk_pengguna_username (username)
) ENGINE=InnoDB;

CREATE TABLE barang (
    kode_barang VARCHAR(20) NOT NULL,
    nama_barang VARCHAR(150) NOT NULL,
    id_kategori INT NOT NULL,
    jumlah_tersedia INT NOT NULL DEFAULT 0,
    keterangan VARCHAR(255) NULL,
    PRIMARY KEY (kode_barang),
    CONSTRAINT fk_barang_kategori FOREIGN KEY (id_kategori)
        REFERENCES kategori (id_kategori)
) ENGINE=InnoDB;

CREATE TABLE peminjaman (
    id_peminjaman INT NOT NULL AUTO_INCREMENT,
    nomor_transaksi VARCHAR(30) NOT NULL,
    nama_peminjam VARCHAR(100) NOT NULL,
    tanggal_pinjam DATE NOT NULL,
    tanggal_kembali DATE NULL,
    status ENUM('DIPINJAM', 'DIKEMBALIKAN') NOT NULL DEFAULT 'DIPINJAM',
    id_pengguna INT NOT NULL,
    PRIMARY KEY (id_peminjaman),
    UNIQUE KEY uk_peminjaman_nomor (nomor_transaksi),
    CONSTRAINT fk_peminjaman_pengguna FOREIGN KEY (id_pengguna)
        REFERENCES pengguna (id_pengguna)
) ENGINE=InnoDB;

CREATE TABLE detail_peminjaman (
    id_detail INT NOT NULL AUTO_INCREMENT,
    id_peminjaman INT NOT NULL,
    kode_barang VARCHAR(20) NOT NULL,
    jumlah INT NOT NULL,
    PRIMARY KEY (id_detail),
    CONSTRAINT fk_detail_peminjaman FOREIGN KEY (id_peminjaman)
        REFERENCES peminjaman (id_peminjaman),
    CONSTRAINT fk_detail_barang FOREIGN KEY (kode_barang)
        REFERENCES barang (kode_barang)
) ENGINE=InnoDB;