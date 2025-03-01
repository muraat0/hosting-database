-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 01 Mar 2025, 11:59:12
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `hosting`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `domains`
--

CREATE TABLE `domains` (
  `user_name` varchar(255) NOT NULL,
  `Domainname` varchar(255) DEFAULT NULL,
  `Kalan_sure` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `domains`
--
DELIMITER $$
CREATE TRIGGER `update_domain_after_insert` AFTER INSERT ON `domains` FOR EACH ROW BEGIN
    UPDATE users
    SET vds = 'var'
    WHERE Ad = NEW.user_name;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `gameservers`
--

CREATE TABLE `gameservers` (
  `user_name` varchar(255) DEFAULT NULL,
  `Gameserver` varchar(255) DEFAULT NULL,
  `s_kalansure` date DEFAULT NULL,
  `s_ozellikler` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tetikleyiciler `gameservers`
--
DELIMITER $$
CREATE TRIGGER `update_gameserver_after_insert` AFTER INSERT ON `gameservers` FOR EACH ROW BEGIN
    UPDATE users
    SET vds = 'var'
    WHERE Ad = NEW.user_name;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `servers`
--

CREATE TABLE `servers` (
  `user_name` varchar(255) DEFAULT NULL,
  `IP` int(11) DEFAULT NULL,
  `Sure` date DEFAULT NULL,
  `Ozellikler` text DEFAULT NULL,
  `İD` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `servers`
--

INSERT INTO `servers` (`user_name`, `IP`, `Sure`, `Ozellikler`, `İD`) VALUES
('Murat', 540, '2025-03-31', '8GB RAM', 1);

--
-- Tetikleyiciler `servers`
--
DELIMITER $$
CREATE TRIGGER `update_vds_after_insert` AFTER INSERT ON `servers` FOR EACH ROW BEGIN
    UPDATE users
    SET Vds = 'var'
    WHERE Ad = NEW.user_name;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `İD` int(11) NOT NULL,
  `Ad` varchar(55) NOT NULL,
  `Soyad` varchar(55) NOT NULL,
  `Yas` int(11) NOT NULL,
  `Telefon` int(11) NOT NULL DEFAULT 0,
  `Bakiye` int(11) NOT NULL,
  `Eposta` varchar(255) NOT NULL,
  `Adres` varchar(255) NOT NULL,
  `Domain` varchar(5) DEFAULT 'Yok',
  `Vds` varchar(5) DEFAULT 'Yok',
  `Gameserver` varchar(5) DEFAULT 'Yok'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `users`
--

INSERT INTO `users` (`İD`, `Ad`, `Soyad`, `Yas`, `Telefon`, `Bakiye`, `Eposta`, `Adres`, `Domain`, `Vds`, `Gameserver`) VALUES
(1, 'Murat', 'Cinar', 19, 2147, 10, 'krozfayerxx@gmail.com', 'Mus', 'yok', 'var', 'yok');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `domains`
--
ALTER TABLE `domains`
  ADD PRIMARY KEY (`user_name`);

--
-- Tablo için indeksler `servers`
--
ALTER TABLE `servers`
  ADD PRIMARY KEY (`İD`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`İD`),
  ADD UNIQUE KEY `Eposta` (`Eposta`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `servers`
--
ALTER TABLE `servers`
  MODIFY `İD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `İD` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
