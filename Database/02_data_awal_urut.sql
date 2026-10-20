-- Data asli, urutan INSERT disesuaikan dengan relasi.
-- Hanya untuk tabel KOSONG; jangan impor berulang.
USE db_inventori_lab;
START TRANSACTION;
INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(4, 'Alat Ukur'),
(2, 'Kabel dan Konektor'),
(1, 'Perangkat Input'),
(3, 'Perangkat Jaringan');

INSERT INTO `pengguna` (`id_pengguna`, `username`, `password_hash`, `nama_lengkap`, `peran`, `aktif`, `dibuat_pada`) VALUES
(1, 'admin', 'BELUM_DIATUR_P14', 'Administrator Lab', 'admin', 1, '2026-10-12 11:26:26'),
(2, 'petugas1', 'BELUM_DIATUR_P14', 'Petugas Lab Satu', 'petugas', 1, '2026-10-12 11:26:26');

INSERT INTO `barang` (`kode_barang`, `nama_barang`, `id_kategori`, `jumlah_tersedia`, `keterangan`) VALUES
('BRG-001', 'Keyboard USB', 1, 10, 'Rak A1'),
('BRG-002', 'Mouse USB', 1, 8, 'Rak A1'),
('BRG-003', 'Kabel HDMI 1,5 m', 2, 12, 'Rak A2'),
('BRG-004', 'Kabel UTP Cat6 5 m', 2, 20, 'Rak A2'),
('BRG-005', 'Switch 8 Port', 3, 4, 'Lemari B'),
('BRG-006', 'Access Point', 3, 2, 'Lemari B'),
('BRG-007', 'Multimeter Digital', 4, 5, 'Lemari C'),
('BRG-008', 'LAN Tester', 4, 3, 'Selesai diperbaiki');

INSERT INTO `peminjaman` (`id_peminjaman`, `nomor_transaksi`, `nama_peminjam`, `tanggal_pinjam`, `tanggal_kembali`, `status`, `id_pengguna`) VALUES
(1, 'PJM-0001', 'Andi Pratama', '2026-10-05', '2026-10-07', 'DIKEMBALIKAN', 2),
(2, 'PJM-0002', 'Siti Rahma', '2026-10-08', NULL, 'DIPINJAM', 2),
(3, 'PJM-0003', 'Budi Santoso', '2026-10-09', NULL, 'DIPINJAM', 1);

INSERT INTO `detail_peminjaman` (`id_detail`, `id_peminjaman`, `kode_barang`, `jumlah`) VALUES
(1, 1, 'BRG-007', 1),
(2, 1, 'BRG-004', 2),
(3, 2, 'BRG-001', 2),
(4, 2, 'BRG-002', 2),
(5, 3, 'BRG-005', 1);

COMMIT;