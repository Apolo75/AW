-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-11-2023 a las 03:40:35
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `viajes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `destino_id` int(11) DEFAULT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `comentario` text NOT NULL,
  `fecha_comentario` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinos`
--

CREATE TABLE `destinos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `destinos`
--

INSERT INTO `destinos` (`id`, `nombre`, `descripcion`, `imagen`, `precio`) VALUES
(1, 'Paris', 'Paris es una ciudad maravillosa.  Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem est provident commodi totam, ducimus quasi optio quas quam aliquam placeat aut tempore alias sint possimus sequi cupiditate quibusdam porro sed animi et ut. Sint perferendis reiciendis excepturi beatae deleniti consequuntur doloremque incidunt id placeat. Dolores aliquid alias dicta blanditiis delectus.', 'images/paris.png,images/paris_2.png,images/paris_3.png', 55.00),
(2, 'Roma', 'En roma te enamoras de cualquiera.  Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorem est provident commodi totam, ducimus quasi optio quas quam aliquam placeat aut tempore alias sint possimus sequi cupiditate quibusdam porro sed animi et ut. Sint perferendis reiciendis excepturi beatae deleniti consequuntur doloremque incidunt id placeat. Dolores aliquid alias dicta blanditiis delectus. ' , 'images/roma.png,images/roma_2.png,images/roma_3.png', 150.00),
(3, 'Nueva york', 'En la ciudad de la gran manzana, podrás vivir experiencias mágicas. En la ciudad de la gran manzana, podrás vivir experiencias mágicas. En la ciudad de la gran manzana, podrás vivir experiencias mágicas. En la ciudad de la gran manzana, podrás vivir experiencias mágicas.  En la ciudad de la gran manzana, podrás vivir experiencias mágicas. En la ciudad de la gran manzana, podrás vivir experiencias mágicas. En la ciudad de la gran manzana, podrás vivir experiencias mágicas. En la ciudad de la gran manzana, podrás vivir experiencias mágicas. ', 'images/newyork.png,images/newyork_2.png,images/newyork_3.png', 230.00),
(4, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(5, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(6, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(7, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(8, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(9, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(10, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(11, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(12, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(13, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(14, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(15, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(16, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(17, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(18, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(19, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(20, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(21, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00),
(22, 'Paris', 'paris es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiasticaparis es fantiastica', 'images/paris.png,images/paris_2.png,images/paris_3.png', 444.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `destino_id` int(11) DEFAULT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `correo_cliente` varchar(255) NOT NULL,
  `fecha_reserva` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destino_id` (`destino_id`);

--
-- Indices de la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `destino_id` (`destino_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`destino_id`) REFERENCES `destinos` (`id`);

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`destino_id`) REFERENCES `destinos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
