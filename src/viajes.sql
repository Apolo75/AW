-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2023 at 05:44 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `viajes`
--

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `destino_id` int(11) DEFAULT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `comentario` text NOT NULL,
  `fecha_comentario` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `comentarios`
--

INSERT INTO `comentarios` (`id`, `destino_id`, `nombre_usuario`, `comentario`, `fecha_comentario`) VALUES
(1, 1, 'Juan', 'Muy bonito!', '2023-11-30 16:26:35'),
(2, 2, 'Juan', 'Precioso!', '2023-11-30 16:26:59'),
(3, 2, 'Maria', 'Me encantó!', '2023-11-30 16:27:58'),
(4, 3, 'Maria', 'Muy bonito!', '2023-11-30 16:28:19'),
(5, 3, 'Pepe', 'Precioso!', '2023-11-30 16:29:12');

-- --------------------------------------------------------

--
-- Table structure for table `destinos`
--

CREATE TABLE `destinos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `destinos`
--

INSERT INTO `destinos` (`id`, `nombre`, `descripcion`, `imagen`, `precio`) VALUES
(1, 'Paris', 'Paris es una ciudad maravillosa.  Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem est provident commodi totam, ducimus quasi optio quas quam aliquam placeat aut tempore alias sint possimus sequi cupiditate quibusdam porro sed animi et ut. Sint perferendis reiciendis excepturi beatae deleniti consequuntur doloremque incidunt id placeat. Dolores aliquid alias dicta blanditiis delectus.', 'paris.png,paris_2.png,paris_3.png', 55.00),
(2, 'Roma', 'En roma te enamoras de cualquiera.  Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem est provident commodi totam, ducimus quasi optio quas quam aliquam placeat aut tempore alias sint possimus sequi cupiditate quibusdam porro sed animi et ut. Sint perferendis reiciendis excepturi beatae deleniti consequuntur doloremque incidunt id placeat. Dolores aliquid alias dicta blanditiis delectus. ', 'roma.png,roma_2.png,roma_3.png', 150.00),
(3, 'Nueva york', 'En la ciudad de la gran manzana, podrás vivir experiencias mágicas. En la ciudad de la gran manzana, podrás vivir experiencias mágicas. En la ciudad de la gran manzana, podrás vivir experiencias mágicas. En la ciudad de la gran manzana, podrás vivir experiencias mágicas.  En la ciudad de la gran manzana, podrás vivir experiencias mágicas. En la ciudad de la gran manzana, podrás vivir experiencias mágicas. En la ciudad de la gran manzana, podrás vivir experiencias mágicas. En la ciudad de la gran manzana, podrás vivir experiencias mágicas. ', 'newyork.png,newyork_2.png,newyork_3.png', 230.00),
(4, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(5, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(6, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(7, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(8, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(9, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(10, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(11, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(12, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(13, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(14, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(15, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(16, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(17, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(18, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(19, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(20, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(21, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00),
(22, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'paris.png,paris_2.png,paris_3.png', 444.00);

-- --------------------------------------------------------

--
-- Table structure for table `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `destino_id` int(11) DEFAULT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `correo_cliente` varchar(255) NOT NULL,
  `fecha_reserva` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `reservas`
--

INSERT INTO `reservas` (`id`, `destino_id`, `nombre_cliente`, `correo_cliente`, `fecha_reserva`) VALUES
(1, 1, 'pruebaaaa', 'prueba@prueba', '2023-11-19');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `correo` varchar(255) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `contrasena`) VALUES
(2, 'Juan', 'correoprueba@gmail.com', 'Contraseña22'),
(3, 'Pepe', 'correoprueba@gmail.com', 'Contraseña11'),
(4, 'Maria', 'correoprueba@gmail.com', 'Palabra55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destino_id` (`destino_id`);

--
-- Indexes for table `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destino_id` (`destino_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`destino_id`) REFERENCES `destinos` (`id`);

--
-- Constraints for table `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`destino_id`) REFERENCES `destinos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
