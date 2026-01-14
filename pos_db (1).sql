-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-01-2026 a las 16:42:50
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pos_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp(),
  `actualizado_en` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `estado`, `creado_en`, `actualizado_en`) VALUES
(5, 'aaaaaa', 0, '2025-12-26 23:11:16', '2026-01-10 22:49:42'),
(6, 'xxxxxxxxx', 0, '2025-12-27 16:52:15', '2026-01-11 16:29:34'),
(8, 'aaaaaaa', 0, '2025-12-27 21:03:15', '2026-01-11 01:57:38'),
(10, 'iuuuuu', 0, '2025-12-28 08:16:26', '2026-01-11 16:38:14'),
(12, 'frank', 0, '2026-01-11 16:29:42', '2026-01-11 17:35:57'),
(13, 'erika', 1, '2026-01-11 16:38:03', '2026-01-11 16:38:03'),
(14, 'felo', 1, '2026-01-11 17:36:10', '2026-01-11 17:36:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `cc` varchar(20) NOT NULL COMMENT 'Cédula de ciudadanía',
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `cc`, `telefono`, `email`, `direccion`, `creado_en`) VALUES
(1, 'xxxxx', '2323232', '232344', 'afdfsfs@gma.com', 'calle 4344343 ', '2026-01-10 16:08:38'),
(2, 'fffff', '44444', '555555', 'sese@gmail.com', 'sen33333', '2026-01-10 21:12:48'),
(3, 'dan', '333', '333', 'zzz@gmail.com', 'san felipe', '2026-01-10 22:15:05'),
(5, 'dan3', '33333', '33333', 'zzeeez@gmail.com', 'san felipe333', '2026-01-10 22:25:40'),
(6, 'frank', '1111111', '1111111', 'frank@frank.com', 'san felipe', '2026-01-11 16:30:27'),
(7, 'erika', '1111111333', '1111111', 'fran444k@frank.com', 'san felipe', '2026-01-11 16:38:41'),
(8, 'felo', '111111133366', '1111111', 'fran444k66@frank.com', 'san felipe', '2026-01-11 17:36:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock_unidades` int(11) NOT NULL DEFAULT 0,
  `peso_unitario` decimal(10,2) DEFAULT NULL,
  `unidad_peso` enum('g','kg','lb') DEFAULT 'kg',
  `talla` varchar(20) DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp(),
  `actualizado_en` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `stock_unidades`, `peso_unitario`, `unidad_peso`, `talla`, `imagen_url`, `estado`, `categoria_id`, `creado_en`, `actualizado_en`) VALUES
(2, 'sssss', 'ssssss', 2.00, 953, 2.00, 'g', 's', 'sdsdsdsds', 1, 5, '2025-12-27 18:04:36', '2026-01-11 00:56:37'),
(3, 'daniel de avila', 'dfdfdfdfd', 2.00, 958, 2.00, 'kg', '', '', 0, 8, '2025-12-27 21:11:56', '2026-01-12 02:54:59'),
(4, 'zzzz', 'zzzzz', 5.00, 99911107, 991.00, 'kg', '', '', 1, 10, '2026-01-10 20:33:41', '2026-01-11 18:41:24'),
(5, 'fffff', 'zzzzz', 777.00, 7767, 77777.00, 'lb', '', '', 0, 6, '2026-01-10 21:42:12', '2026-01-12 02:54:59'),
(6, 'jabon2', 'dfdfdfdfd', 444.00, 55550, 5555.00, 'kg', '', '', 0, 6, '2026-01-10 22:26:38', '2026-01-11 18:41:24'),
(7, 'frank', 'dfdfdfdfd', 166.00, 162, 166.00, 'g', '', '', 0, 12, '2026-01-11 16:30:57', '2026-01-11 18:41:24'),
(8, 'erikaedit', 'dfdfdfdfd', 3.00, 1, 4.00, 'kg', '', '', 1, 13, '2026-01-11 16:39:29', '2026-01-11 18:41:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `creado_en`) VALUES
(1, 'ADMIN', '2025-12-23 06:13:27'),
(2, 'VENDEDOR', '2025-12-23 06:13:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol_id` int(10) UNSIGNED NOT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp(),
  `actualizado_en` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol_id`, `estado`, `creado_en`, `actualizado_en`) VALUES
(4, 'Admin', 'admin444@pos.com', '$2b$10$p6z/1L5c7XIeNWbPKjAzHuiWZm2O5KakpO3ettLboK/bb0vvZMspS', 1, 1, '2025-12-25 00:43:47', '2025-12-25 00:43:47'),
(5, 'daniel', 'daniel411@pos.com', '$2b$10$VbHqerfQScMxJnw/JMwlOOWT4ccJCYqFucqFfk6AKXy1EpVm6aXK6', 1, 1, '2025-12-26 03:20:15', '2025-12-26 03:20:15'),
(6, 'daniel de avila', 'daniel412@pos.com', '$2b$10$gtpVEQOWuWdRiTdvVw1Nkewixvja7nRPec/uE7WNm/2mJ7LENMzsm', 1, 1, '2025-12-26 17:32:07', '2025-12-26 17:32:07'),
(7, 'ganador', 'gane@pos.com', '$2b$10$NQKBUMBXQQczGwZ0XaIVX.L3QR3muRZ2J1HZQT.Gc1GQN4H79w0wq', 1, 1, '2025-12-26 22:37:35', '2025-12-26 22:37:35'),
(8, 'xxxxxx', 'ganexxxxx@pos.com', '$2b$10$iYMC04qWCjwCIecoAEzIZe/GIA.7I/Jrj/hGDtOehQWeTMYNxUgVi', 1, 1, '2025-12-28 08:16:14', '2025-12-28 08:16:14'),
(9, 'dan', 'dan12@gmail.com', '$2b$10$sHn5GIBEx2Oh5eN34afOLulUX4bfayw/m0bAegS8CiW2NU7QaYD.6', 1, 1, '2026-01-04 16:32:05', '2026-01-04 16:32:05'),
(10, 'dan2', 'jetocho3@gmail.com', '$2b$10$hUmYkKeiBACQ1tQgxZDJU.x.AVLL/f4d.t/eGLBHMQEZfNLP6i5WG', 2, 1, '2026-01-10 22:28:54', '2026-01-10 22:28:54'),
(11, 'Franklin', 'frank@frank.com', '$2b$10$aDL0QBcZdC/dIO7zlrrsu.XlT/jvMVS9nZsT/ezjKxp9BebB9JXbW', 2, 1, '2026-01-11 16:29:12', '2026-01-11 16:29:12'),
(12, 'erika', 'jetocho@gmail.com', '$2b$10$aZ3VISqR9V9rs1gx1Azu0.zjq16dv7k7kTtP8t6to1Xtq3D/CjFqe', 1, 1, '2026-01-11 16:37:27', '2026-01-11 16:37:27'),
(13, 'felo', 'felo@gmail.com', '$2b$10$bSHLOo8l6UuVb.VxwChojec6hRCzZMOMRjRMRV7z.VW8vswF7RExG', 1, 1, '2026-01-11 17:35:08', '2026-01-11 17:35:08');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `cliente_id` int(10) UNSIGNED DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `metodo_pago` enum('EFECTIVO','TARJETA','TRANSFERENCIA') NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('COMPLETADA','ANULADA') NOT NULL DEFAULT 'COMPLETADA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `usuario_id`, `cliente_id`, `total`, `metodo_pago`, `creado_en`, `estado`) VALUES
(8, 4, NULL, 4.00, 'EFECTIVO', '2026-01-06 22:00:27', 'COMPLETADA'),
(9, 4, NULL, 4.00, 'EFECTIVO', '2026-01-06 22:13:52', 'COMPLETADA'),
(13, 4, NULL, 4.00, 'EFECTIVO', '2026-01-07 00:17:03', 'COMPLETADA'),
(14, 4, NULL, 4.00, 'EFECTIVO', '2026-01-07 00:39:56', 'COMPLETADA'),
(15, 9, NULL, 4.00, 'EFECTIVO', '2026-01-07 01:06:11', 'COMPLETADA'),
(16, 9, NULL, 4.00, 'EFECTIVO', '2026-01-07 20:56:27', 'COMPLETADA'),
(17, 9, NULL, 2.00, 'EFECTIVO', '2026-01-07 20:56:38', 'COMPLETADA'),
(18, 9, NULL, 18.00, 'EFECTIVO', '2026-01-08 01:54:04', 'COMPLETADA'),
(19, 9, NULL, 22.00, 'EFECTIVO', '2026-01-08 15:43:56', 'COMPLETADA'),
(20, 9, 1, 2.00, 'EFECTIVO', '2026-01-10 17:43:04', 'COMPLETADA'),
(21, 9, 1, 2.00, 'EFECTIVO', '2026-01-10 17:43:04', 'COMPLETADA'),
(22, 9, 1, 6.00, 'EFECTIVO', '2026-01-10 18:13:32', 'COMPLETADA'),
(23, 9, 1, 6.00, 'EFECTIVO', '2026-01-10 18:13:32', 'COMPLETADA'),
(24, 9, 1, 10.00, 'EFECTIVO', '2026-01-10 18:35:48', 'COMPLETADA'),
(25, 9, 1, 10.00, 'EFECTIVO', '2026-01-10 18:35:48', 'COMPLETADA'),
(26, 9, 1, 2.00, 'EFECTIVO', '2026-01-10 18:37:41', 'COMPLETADA'),
(27, 9, 1, 2.00, 'EFECTIVO', '2026-01-10 18:37:41', 'COMPLETADA'),
(28, 9, 1, 4.00, 'EFECTIVO', '2026-01-10 18:44:34', 'COMPLETADA'),
(29, 9, 1, 4.00, 'EFECTIVO', '2026-01-10 18:44:35', 'COMPLETADA'),
(30, 9, 1, 4.00, 'EFECTIVO', '2026-01-10 18:48:14', 'COMPLETADA'),
(31, 9, 1, 4.00, 'EFECTIVO', '2026-01-10 18:48:14', 'COMPLETADA'),
(33, 9, 1, 4.00, 'EFECTIVO', '2026-01-10 19:09:47', 'COMPLETADA'),
(34, 9, 2, 2.00, 'EFECTIVO', '2026-01-10 22:01:50', 'COMPLETADA'),
(35, 9, 2, 444.00, 'EFECTIVO', '2026-01-10 22:27:10', 'COMPLETADA'),
(36, 10, 5, 888.00, 'EFECTIVO', '2026-01-10 22:46:25', 'COMPLETADA'),
(37, 10, 2, 2.00, 'EFECTIVO', '2026-01-10 23:18:45', 'COMPLETADA'),
(38, 10, 2, 4.00, 'EFECTIVO', '2026-01-10 23:23:47', 'COMPLETADA'),
(39, 10, 2, 4.00, 'EFECTIVO', '2026-01-10 23:25:18', 'COMPLETADA'),
(40, 10, 2, 2.00, 'EFECTIVO', '2026-01-10 23:30:26', 'COMPLETADA'),
(41, 10, 2, 2.00, 'EFECTIVO', '2026-01-10 23:35:05', 'COMPLETADA'),
(42, 10, 2, 4.00, 'EFECTIVO', '2026-01-10 23:41:47', 'COMPLETADA'),
(43, 10, 2, 2.00, 'EFECTIVO', '2026-01-10 23:47:47', 'COMPLETADA'),
(44, 10, 2, 2.00, 'EFECTIVO', '2026-01-10 23:49:00', 'COMPLETADA'),
(45, 10, 2, 2.00, 'EFECTIVO', '2026-01-10 23:50:37', 'COMPLETADA'),
(46, 10, 2, 5.00, 'EFECTIVO', '2026-01-11 00:21:33', 'COMPLETADA'),
(47, 10, 2, 6.00, 'EFECTIVO', '2026-01-11 00:29:21', 'COMPLETADA'),
(48, 10, 2, 2.00, 'EFECTIVO', '2026-01-11 00:32:33', 'COMPLETADA'),
(49, 10, 2, 4.00, 'EFECTIVO', '2026-01-11 00:38:04', 'COMPLETADA'),
(50, 10, 2, 782.00, 'EFECTIVO', '2026-01-11 00:54:23', 'COMPLETADA'),
(51, 10, 2, 782.00, 'EFECTIVO', '2026-01-11 00:55:58', 'COMPLETADA'),
(52, 10, 2, 781.00, 'EFECTIVO', '2026-01-11 00:56:37', 'COMPLETADA'),
(53, 10, 2, 448.00, 'EFECTIVO', '2026-01-11 01:06:43', 'COMPLETADA'),
(54, 10, 2, 2.00, 'EFECTIVO', '2026-01-11 01:13:55', 'COMPLETADA'),
(55, 10, 2, 777.00, 'EFECTIVO', '2026-01-11 01:35:03', 'COMPLETADA'),
(56, 10, 2, 2.00, 'EFECTIVO', '2026-01-11 01:55:53', 'COMPLETADA'),
(57, 10, 2, 2.00, 'EFECTIVO', '2026-01-11 02:04:32', 'COMPLETADA'),
(58, 10, 2, 779.00, 'EFECTIVO', '2026-01-11 03:24:15', 'COMPLETADA'),
(59, 11, 2, 168.00, 'EFECTIVO', '2026-01-11 16:31:40', 'COMPLETADA'),
(60, 12, 2, 169.00, 'EFECTIVO', '2026-01-11 16:40:34', 'COMPLETADA'),
(61, 13, 2, 169.00, 'EFECTIVO', '2026-01-11 17:37:29', 'COMPLETADA'),
(62, 13, 2, 1397.00, 'EFECTIVO', '2026-01-11 18:41:24', 'COMPLETADA'),
(63, 13, 2, 3110.00, 'EFECTIVO', '2026-01-12 02:54:59', 'COMPLETADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

CREATE TABLE `venta_detalle` (
  `id` int(10) UNSIGNED NOT NULL,
  `venta_id` int(10) UNSIGNED NOT NULL,
  `producto_id` int(10) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `venta_detalle`
--

INSERT INTO `venta_detalle` (`id`, `venta_id`, `producto_id`, `cantidad`, `precio_unitario`, `subtotal`, `creado_en`) VALUES
(1, 8, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(2, 8, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(3, 9, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(4, 9, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(8, 13, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(9, 13, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(10, 14, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(11, 14, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(12, 15, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(13, 15, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(14, 16, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(15, 16, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(16, 17, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(17, 18, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(18, 18, 2, 8, 2.00, 16.00, '2026-01-10 22:23:35'),
(19, 19, 3, 5, 2.00, 10.00, '2026-01-10 22:23:35'),
(20, 19, 2, 6, 2.00, 12.00, '2026-01-10 22:23:35'),
(21, 20, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(22, 21, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(23, 22, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(24, 22, 3, 2, 2.00, 4.00, '2026-01-10 22:23:35'),
(25, 23, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(26, 23, 3, 2, 2.00, 4.00, '2026-01-10 22:23:35'),
(27, 24, 3, 3, 2.00, 6.00, '2026-01-10 22:23:35'),
(28, 24, 2, 2, 2.00, 4.00, '2026-01-10 22:23:35'),
(29, 25, 3, 3, 2.00, 6.00, '2026-01-10 22:23:35'),
(30, 25, 2, 2, 2.00, 4.00, '2026-01-10 22:23:35'),
(31, 26, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(32, 27, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(33, 28, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(34, 28, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(35, 29, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(36, 29, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(37, 30, 2, 2, 2.00, 4.00, '2026-01-10 22:23:35'),
(38, 31, 2, 2, 2.00, 4.00, '2026-01-10 22:23:35'),
(39, 33, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(40, 33, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(41, 34, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(42, 35, 6, 1, 444.00, 444.00, '2026-01-10 22:23:35'),
(43, 36, 6, 2, 444.00, 888.00, '2026-01-10 22:23:35'),
(44, 37, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(45, 38, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(46, 38, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(47, 39, 2, 2, 2.00, 4.00, '2026-01-10 22:23:35'),
(48, 40, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(49, 41, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(50, 42, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(51, 42, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(52, 43, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(53, 44, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(54, 45, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(55, 46, 4, 1, 5.00, 5.00, '2026-01-10 22:23:35'),
(56, 47, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(57, 47, 3, 2, 2.00, 4.00, '2026-01-10 22:23:35'),
(58, 48, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(59, 49, 2, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(60, 49, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(61, 50, 4, 1, 5.00, 5.00, '2026-01-10 22:23:35'),
(62, 50, 5, 1, 777.00, 777.00, '2026-01-10 22:23:35'),
(63, 51, 4, 1, 5.00, 5.00, '2026-01-10 22:23:35'),
(64, 51, 5, 1, 777.00, 777.00, '2026-01-10 22:23:35'),
(65, 52, 2, 2, 2.00, 4.00, '2026-01-10 22:23:35'),
(66, 52, 5, 1, 777.00, 777.00, '2026-01-10 22:23:35'),
(67, 53, 3, 2, 2.00, 4.00, '2026-01-10 22:23:35'),
(68, 53, 6, 1, 444.00, 444.00, '2026-01-10 22:23:35'),
(69, 54, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(70, 55, 5, 1, 777.00, 777.00, '2026-01-10 22:23:35'),
(71, 56, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(72, 57, 3, 1, 2.00, 2.00, '2026-01-10 22:23:35'),
(73, 58, 3, 1, 2.00, 2.00, '2026-01-10 22:24:15'),
(74, 58, 5, 1, 777.00, 777.00, '2026-01-10 22:24:15'),
(75, 59, 7, 1, 166.00, 166.00, '2026-01-11 11:31:40'),
(76, 59, 3, 1, 2.00, 2.00, '2026-01-11 11:31:40'),
(77, 60, 7, 1, 166.00, 166.00, '2026-01-11 11:40:34'),
(78, 60, 8, 1, 3.00, 3.00, '2026-01-11 11:40:34'),
(79, 61, 8, 1, 3.00, 3.00, '2026-01-11 12:37:29'),
(80, 61, 7, 1, 166.00, 166.00, '2026-01-11 12:37:29'),
(81, 62, 7, 1, 166.00, 166.00, '2026-01-11 13:41:24'),
(82, 62, 8, 1, 3.00, 3.00, '2026-01-11 13:41:24'),
(83, 62, 3, 1, 2.00, 2.00, '2026-01-11 13:41:24'),
(84, 62, 4, 1, 5.00, 5.00, '2026-01-11 13:41:24'),
(85, 62, 5, 1, 777.00, 777.00, '2026-01-11 13:41:24'),
(86, 62, 6, 1, 444.00, 444.00, '2026-01-11 13:41:24'),
(87, 63, 3, 1, 2.00, 2.00, '2026-01-11 21:54:59'),
(88, 63, 5, 4, 777.00, 3108.00, '2026-01-11 21:54:59');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_clientes_cc` (`cc`),
  ADD UNIQUE KEY `uk_clientes_email` (`email`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_productos_categoria` (`categoria_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_usuario_rol` (`rol_id`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ventas_usuario` (`usuario_id`),
  ADD KEY `fk_ventas_cliente` (`cliente_id`);

--
-- Indices de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detalle_venta` (`venta_id`),
  ADD KEY `fk_detalle_producto` (`producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `fk_venta_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `fk_ventas_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `fk_detalle_venta` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
