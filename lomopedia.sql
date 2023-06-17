-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 17-06-2023 a las 00:49:05
-- Versión del servidor: 5.7.15-log
-- Versión de PHP: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `lomopedia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donacion`
--

CREATE TABLE `donacion` (
  `IdTransaccion` int(10) NOT NULL,
  `IdPersona` int(10) NOT NULL,
  `Monto` int(10) NOT NULL,
  `Comentario` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `donacion`
--

INSERT INTO `donacion` (`IdTransaccion`, `IdPersona`, `Monto`, `Comentario`) VALUES
(2533, 5031, 200, 'Ya jala esto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `NumeroTarjeta` int(16) NOT NULL,
  `IdPersona` int(10) NOT NULL,
  `NombreTarjeta` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `CVV` int(4) NOT NULL,
  `VenceMes` int(2) NOT NULL,
  `VenceAnio` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`NumeroTarjeta`, `IdPersona`, `NombreTarjeta`, `CVV`, `VenceMes`, `VenceAnio`) VALUES
(0, 5031, '', 9958, 6, 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `IdPersona` int(10) NOT NULL,
  `Nombre` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `ApellidoPaterno` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `ApellidoMaterno` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `CorreoElectronico` varchar(40) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Tabla para los datos personales del usuario';

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`IdPersona`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `CorreoElectronico`) VALUES
(5031, 'Nelly', '', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `donacion`
--
ALTER TABLE `donacion`
  ADD PRIMARY KEY (`IdTransaccion`),
  ADD KEY `IdPersona` (`IdPersona`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`NumeroTarjeta`),
  ADD KEY `IdPersona` (`IdPersona`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`IdPersona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `donacion`
--
ALTER TABLE `donacion`
  MODIFY `IdTransaccion` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2534;
--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `IdPersona` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5032;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `donacion`
--
ALTER TABLE `donacion`
  ADD CONSTRAINT `donacion_ibfk_1` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`IdPersona`) REFERENCES `persona` (`IdPersona`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
