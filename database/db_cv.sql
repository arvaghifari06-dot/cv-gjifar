-- Import file ini lewat phpMyAdmin (tab Import) atau tab SQL.
CREATE DATABASE IF NOT EXISTS db_cv CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_cv;

-- Tabel pesan kontak (Tugas Pendahuluan)
CREATE TABLE IF NOT EXISTS pesan_kontak (
  id      INT AUTO_INCREMENT PRIMARY KEY,
  nama    VARCHAR(100) NOT NULL,
  email   VARCHAR(100) NOT NULL,
  subjek  VARCHAR(150) NOT NULL DEFAULT '',
  pesan   TEXT NOT NULL,
  tanggal TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel admin (login)
DROP TABLE IF EXISTS admin;
CREATE TABLE admin (
  id       INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL
);

-- Tabel skill (CRUD Tugas Praktikum)
DROP TABLE IF EXISTS skill;
CREATE TABLE skill (
  id         INT AUTO_INCREMENT PRIMARY KEY,
  nama_skill VARCHAR(100) NOT NULL,
  tingkat    VARCHAR(20)  NOT NULL,
  nilai      TINYINT      NOT NULL DEFAULT 1
);

INSERT INTO skill (nama_skill, tingkat, nilai) VALUES
('Desain Grafis', 'MAHIR', 9),
('Videografi', 'MAHIR', 9),
('Fotografi', 'MENENGAH', 6),
('Strategi Konten', 'MAHIR', 9),
('Manajemen Media Sosial', 'MAHIR', 8);

-- Akun admin awal -> username: admin | password: admin123 (disimpan sebagai hash bcrypt)
INSERT INTO admin (username, password) VALUES
('admin', '$2b$12$v3b1ePwR/bFrya2HmpCbR.WSCoIrVpxxIVxZjO3RRUKfoibFOHrrS');
