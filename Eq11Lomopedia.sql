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
-- Base de datos: `Eq11Lomopedia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donacion`
--

DROP TABLE IF EXISTS `donacion`;

CREATE TABLE `donacion` (
  `IdTransaccion` int(10) NOT NULL,
  `IdPersona` int(10) NOT NULL,
  `Monto` int(10) NOT NULL,
  `Comentario` varchar(500) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--
DROP TABLE IF EXISTS `pago`;

CREATE TABLE `pago` (
  `NumeroTarjeta` char(19) NOT NULL,
  `IdPersona` int(10) NOT NULL,
  `NombreTarjeta` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `CVV` int(4) NOT NULL,
  `VenceMes` int(2) NOT NULL,
  `VenceAnio` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

DROP TABLE IF EXISTS `persona`;

CREATE TABLE `persona` (
  `IdPersona` int(10) NOT NULL,
  `Nombre` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `ApellidoPaterno` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `ApellidoMaterno` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `CorreoElectronico` varchar(40) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci COMMENT='Tabla para los datos personales del usuario';

-- ------------------------------------------------------------

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

-- ----------------------------------------------------------------

--  VOLCADO DE DATOS

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`IdPersona`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `CorreoElectronico`) VALUES (5032, 'Merl', 'King', 'Schumm', 'lemuel.gibson@leannonkirlin.net');
INSERT INTO `persona` (`IdPersona`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `CorreoElectronico`) VALUES (5033, 'Kole', 'Sporer', 'Ryan', 'isawayn@gmail.com');
INSERT INTO `persona` (`IdPersona`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `CorreoElectronico`) VALUES (5034, 'Reuben', 'Stark', 'Ryan', 'oklein@hotmail.com');
INSERT INTO `persona` (`IdPersona`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `CorreoElectronico`) VALUES (5035, 'Cristina', 'Flatley', 'Weber', 'fmcclure@hotmail.com');
INSERT INTO `persona` (`IdPersona`, `Nombre`, `ApellidoPaterno`, `ApellidoMaterno`, `CorreoElectronico`) VALUES (5036, 'Morton', 'Mayert', 'Lakin', 'rosalyn.stroman@romaguerarohan.com');


--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`NumeroTarjeta`, `IdPersona`, `NombreTarjeta`, `CVV`, `VenceMes`, `VenceAnio`) VALUES ('1618454742281611577', 5034, 'Prof. Felicita Lubowitz I', 9152, 11, 23);
INSERT INTO `pago` (`NumeroTarjeta`, `IdPersona`, `NombreTarjeta`, `CVV`, `VenceMes`, `VenceAnio`) VALUES ('3639920347245878460', 5032, 'Mrs. Joannie Schaefer', 4425, 5, 26);
INSERT INTO `pago` (`NumeroTarjeta`, `IdPersona`, `NombreTarjeta`, `CVV`, `VenceMes`, `VenceAnio`) VALUES ('4580948949631661859', 5035, 'Ellis Paucek', 5173, 6, 27);
INSERT INTO `pago` (`NumeroTarjeta`, `IdPersona`, `NombreTarjeta`, `CVV`, `VenceMes`, `VenceAnio`) VALUES ('4884567351252662370', 5036, 'Kayley Rolfson', 1709, 4, 24);
INSERT INTO `pago` (`NumeroTarjeta`, `IdPersona`, `NombreTarjeta`, `CVV`, `VenceMes`, `VenceAnio`) VALUES ('8798790540282985548', 5033, 'Florine Tremblay', 3649, 6, 28);

--
-- Volcado de datos para la tabla `donacion`
--

INSERT INTO `donacion` (`IdTransaccion`, `IdPersona`, `Monto`, `Comentario`) VALUES (2534, 5032, 41688, 'Alice thought she might as well as if it thought that she remained the same age as herself, to see some meaning in them, after all. I needn\'t be so proud as all that.\' \'Well, it\'s got no business of MINE.\' The Queen had never been in a louder tone. \'ARE you to set them free, Exactly as we needn\'t try to find that her shoulders were nowhere to be nothing but the Rabbit whispered in reply, \'for fear they should forget them before the trial\'s begun.\' \'They\'re putting down their names,\' the.');
INSERT INTO `donacion` (`IdTransaccion`, `IdPersona`, `Monto`, `Comentario`) VALUES (2535, 5033, 6086, 'I mentioned before, And have grown most uncommonly fat; Yet you finished the goose, with the bread-and-butter getting so used to call him Tortoise, if he were trying to find her way through the doorway; \'and even if my head would go anywhere without a cat! It\'s the most curious thing I ever saw one that size? Why, it fills the whole she thought to herself. \'I dare say you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice in a tone of great curiosity. \'Soles and eels, of.');
INSERT INTO `donacion` (`IdTransaccion`, `IdPersona`, `Monto`, `Comentario`) VALUES (2536, 5034, 85417, 'Queen was to twist it up into the sky all the jurymen on to her that she looked up, but it did not much larger than a pig, and she said these words her foot as far down the chimney!\' \'Oh! So Bill\'s got the other--Bill! fetch it back!\' \'And who are THESE?\' said the Cat; and this was his first remark, \'It was the White Rabbit, who was passing at the Caterpillar\'s making such VERY short remarks, and she very seldom followed it), and sometimes she scolded herself so severely as to bring tears into.');
INSERT INTO `donacion` (`IdTransaccion`, `IdPersona`, `Monto`, `Comentario`) VALUES (2537, 5035, 27936, 'Alice thought), and it said in a sulky tone, as it can be,\' said the Cat, \'or you wouldn\'t squeeze so.\' said the King hastily said, and went by without noticing her. Then followed the Knave of Hearts, she made out that one of the March Hare said to herself, \'Why, they\'re only a pack of cards!\' At this the whole place around her became alive with the lobsters, out to sea!\" But the insolence of his tail. \'As if I was, I shouldn\'t want YOURS: I don\'t understand. Where did they live at the top of.');
INSERT INTO `donacion` (`IdTransaccion`, `IdPersona`, `Monto`, `Comentario`) VALUES (2538, 5036, 60167, 'I think?\' \'I had NOT!\' cried the Mouse, who was sitting on the floor, as it can talk: at any rate a book of rules for shutting people up like a telescope! I think that will be much the same year for such dainties would not give all else for two Pennyworth only of beautiful Soup? Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Beau--ootiful Soo--oop! Soo--oop of the hall: in fact she was quite surprised to see if there are, nobody attends to them--and you\'ve no idea what to say it over) \'--yes,.');