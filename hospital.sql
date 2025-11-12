-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 12-11-2025 a las 23:53:50
-- Versión del servidor: 10.4.32-MariaDB-log
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospital`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita`
--

CREATE TABLE `cita` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `hora` time NOT NULL,
  `observacion` text DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `doctor_id` int(11) NOT NULL,
  `paciente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cita`
--

INSERT INTO `cita` (`id`, `fecha`, `hora`, `observacion`, `estado`, `doctor_id`, `paciente_id`) VALUES
(1, '2025-11-12 09:00:00', '09:00:00', 'Dolor de cabeza persistente', 'Atendida', 1, 1),
(2, '2025-11-12 10:30:00', '10:30:00', 'Control pediátrico', 'Atendida', 2, 2),
(3, '2025-11-13 08:15:00', '08:15:00', 'Chequeo de rutina', 'Pendiente', 3, 3),
(4, '2025-11-13 11:00:00', '11:00:00', 'Limpieza dental', 'Atendida', 4, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta`
--

CREATE TABLE `consulta` (
  `id` int(11) NOT NULL,
  `diagnostico` text NOT NULL,
  `tratamiento` text NOT NULL,
  `honorario` decimal(10,2) NOT NULL,
  `cita_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `consulta`
--

INSERT INTO `consulta` (`id`, `diagnostico`, `tratamiento`, `honorario`, `cita_id`) VALUES
(1, 'Migraña leve', 'Paracetamol cada 8h por 3 días', 25.00, 1),
(2, 'Control normal, sin complicaciones', 'Continuar vitaminas diarias', 30.00, 2),
(3, 'Presión arterial elevada', 'Dieta baja en sal y medicación Losartán 50mg', 40.00, 3),
(4, 'Limpieza y aplicación de flúor', 'Cepillado 3 veces al día y enjuague bucal', 20.00, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `sueldo_base` decimal(10,2) NOT NULL,
  `especialidad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `doctor`
--

INSERT INTO `doctor` (`id`, `cedula`, `nombres`, `apellidos`, `telefono`, `correo`, `sueldo_base`, `especialidad_id`) VALUES
(1, '1102567890', 'María', 'Pérez López', '0987654321', 'maria.perez@clinic.com', 1200.00, 1),
(2, '1104789632', 'Carlos', 'Ramírez Gómez', '0991234567', 'carlos.ramirez@clinic.com', 1500.00, 2),
(3, '1105689741', 'Ana', 'Jiménez Torres', '0987456321', 'ana.jimenez@clinic.com', 1800.00, 3),
(4, '1109658741', 'Luis', 'Martínez Ruiz', '0989345621', 'luis.martinez@clinic.com', 1300.00, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidad`
--

CREATE TABLE `especialidad` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `especialidad`
--

INSERT INTO `especialidad` (`id`, `nombre`) VALUES
(1, 'Medicina General'),
(2, 'Pediatría'),
(3, 'Cardiología'),
(4, 'Odontología');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `id` int(11) NOT NULL,
  `numero` varchar(50) NOT NULL,
  `fecha` datetime NOT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `consulta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`id`, `numero`, `fecha`, `metodo_pago`, `total`, `consulta_id`) VALUES
(1, 'FAC-001', '2025-11-12 09:30:00', 'Efectivo', 25.00, 1),
(2, 'FAC-002', '2025-11-12 11:00:00', 'Tarjeta', 30.00, 2),
(3, 'FAC-003', '2025-11-13 08:45:00', 'Efectivo', 40.00, 3),
(4, 'FAC-004', '2025-11-13 11:30:00', 'Transferencia', 20.00, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamento`
--

CREATE TABLE `medicamento` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_caduca` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `medicamento`
--

INSERT INTO `medicamento` (`id`, `codigo`, `nombre`, `tipo`, `precio`, `cantidad`, `fecha_caduca`) VALUES
(1, 'MED001', 'Paracetamol 500mg', 'Tableta', 0.50, 200, '2026-01-01'),
(2, 'MED002', 'Amoxicilina 500mg', 'Cápsula', 0.80, 150, '2026-03-10'),
(3, 'MED003', 'Losartán 50mg', 'Tableta', 1.00, 100, '2026-02-20'),
(4, 'MED004', 'Enjuague Bucal Menta', 'Líquido', 3.50, 80, '2026-05-15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `tipo_sangre` varchar(10) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id`, `cedula`, `nombre`, `direccion`, `telefono`, `correo`, `tipo_sangre`, `fecha_nacimiento`) VALUES
(1, '0156324891', 'Juan Morales', 'Av. Quito y Loja', '0981112233', 'juan.morales@mail.com', 'O+', '1992-05-14'),
(2, '0178945632', 'Rosa Torres', 'Calle Bolívar y Sucre', '0982223344', 'rosa.torres@mail.com', 'A-', '1985-11-22'),
(3, '0132154879', 'Pedro Ramírez', 'Av. Amazonas 123', '0983334455', 'pedro.ramirez@mail.com', 'B+', '2001-07-09'),
(4, '0178945611', 'Lucía García', 'Av. Gualaquiza Central', '0984445566', 'lucia.garcia@mail.com', 'AB+', '1998-03-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id` int(11) NOT NULL,
  `consulta_id` int(11) NOT NULL,
  `medicamento_id` int(11) NOT NULL,
  `dosis` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`id`, `consulta_id`, `medicamento_id`, `dosis`) VALUES
(1, 1, 1, '1 tableta cada 8 horas por 3 días'),
(2, 3, 3, '1 tableta diaria por 15 días'),
(3, 4, 4, 'Usar dos veces al día después del cepillado');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_factura_especialidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_factura_especialidad` (
`nombre_paciente` varchar(100)
,`especialidad` varchar(100)
,`numero_de_factura` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_paciente_cita`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_paciente_cita` (
`id_cita` int(11)
,`fecha` datetime
,`hora` time
,`estado` varchar(50)
,`doctor` varchar(100)
,`paciente` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_paciente_especialidad`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_paciente_especialidad` (
`nombre_paciente` varchar(100)
,`especialidad` varchar(100)
,`numero_de_factura` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_paciente_medicamento_especifico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_paciente_medicamento_especifico` (
`id` int(11)
,`nombre` varchar(100)
,`cedula` varchar(20)
,`telefono` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_pendiente_cita`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_pendiente_cita` (
`id_cita` int(11)
,`fecha` datetime
,`hora` time
,`estado` varchar(50)
,`doctor` varchar(100)
,`paciente` varchar(100)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `view_factura_especialidad`
--
DROP TABLE IF EXISTS `view_factura_especialidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_factura_especialidad`  AS SELECT `p`.`nombre` AS `nombre_paciente`, `e`.`nombre` AS `especialidad`, `f`.`numero` AS `numero_de_factura` FROM (((((`paciente` `p` join `cita` `ci` on(`p`.`id` = `ci`.`paciente_id`)) join `consulta` `co` on(`ci`.`id` = `co`.`cita_id`)) join `factura` `f` on(`co`.`id` = `f`.`consulta_id`)) join `doctor` `d` on(`ci`.`doctor_id` = `d`.`id`)) join `especialidad` `e` on(`d`.`especialidad_id` = `e`.`id`)) WHERE `f`.`total` <= 30 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_paciente_cita`
--
DROP TABLE IF EXISTS `view_paciente_cita`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_paciente_cita`  AS SELECT `c`.`id` AS `id_cita`, `c`.`fecha` AS `fecha`, `c`.`hora` AS `hora`, `c`.`estado` AS `estado`, `d`.`nombres` AS `doctor`, `p`.`nombre` AS `paciente` FROM ((`cita` `c` join `doctor` `d` on(`c`.`doctor_id` = `d`.`id`)) join `paciente` `p` on(`c`.`paciente_id` = `p`.`id`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_paciente_especialidad`
--
DROP TABLE IF EXISTS `view_paciente_especialidad`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_paciente_especialidad`  AS SELECT `p`.`nombre` AS `nombre_paciente`, `e`.`nombre` AS `especialidad`, `f`.`numero` AS `numero_de_factura` FROM (((((`paciente` `p` join `cita` `ci` on(`p`.`id` = `ci`.`paciente_id`)) join `consulta` `co` on(`ci`.`id` = `co`.`cita_id`)) join `factura` `f` on(`co`.`id` = `f`.`consulta_id`)) join `doctor` `d` on(`ci`.`doctor_id` = `d`.`id`)) join `especialidad` `e` on(`d`.`especialidad_id` = `e`.`id`)) WHERE `f`.`total` <= 30 ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_paciente_medicamento_especifico`
--
DROP TABLE IF EXISTS `view_paciente_medicamento_especifico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_paciente_medicamento_especifico`  AS SELECT `p`.`id` AS `id`, `p`.`nombre` AS `nombre`, `p`.`cedula` AS `cedula`, `p`.`telefono` AS `telefono` FROM ((`paciente` `p` join `cita` `ci` on(`p`.`id` = `ci`.`paciente_id`)) join `consulta` `co` on(`ci`.`id` = `co`.`cita_id`)) WHERE `co`.`id` in (select `r`.`consulta_id` from (`receta` `r` join `medicamento` `m` on(`r`.`medicamento_id` = `m`.`id`)) where `m`.`nombre` = 'Paracetamol 500mg') ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_pendiente_cita`
--
DROP TABLE IF EXISTS `view_pendiente_cita`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_pendiente_cita`  AS SELECT `c`.`id` AS `id_cita`, `c`.`fecha` AS `fecha`, `c`.`hora` AS `hora`, `c`.`estado` AS `estado`, `d`.`nombres` AS `doctor`, `p`.`nombre` AS `paciente` FROM ((`cita` `c` join `doctor` `d` on(`c`.`doctor_id` = `d`.`id`)) join `paciente` `p` on(`c`.`paciente_id` = `p`.`id`)) WHERE `c`.`estado` = 'Pendiente' ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cita`
--
ALTER TABLE `cita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `paciente_id` (`paciente_id`);

--
-- Indices de la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cita_id` (`cita_id`);

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `especialidad_id` (`especialidad_id`);

--
-- Indices de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `consulta_id` (`consulta_id`);

--
-- Indices de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consulta_id` (`consulta_id`),
  ADD KEY `medicamento_id` (`medicamento_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cita`
--
ALTER TABLE `cita`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cita`
--
ALTER TABLE `cita`
  ADD CONSTRAINT `cita_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`),
  ADD CONSTRAINT `cita_ibfk_2` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`);

--
-- Filtros para la tabla `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`cita_id`) REFERENCES `cita` (`id`);

--
-- Filtros para la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidad` (`id`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`id`);

--
-- Filtros para la tabla `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `receta_ibfk_1` FOREIGN KEY (`consulta_id`) REFERENCES `consulta` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `receta_ibfk_2` FOREIGN KEY (`medicamento_id`) REFERENCES `medicamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
