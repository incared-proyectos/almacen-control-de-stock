-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2022 a las 04:22:06
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `almacen-control-de-stock`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacens`
--

CREATE TABLE `almacens` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `almacens`
--

INSERT INTO `almacens` (`id`, `nombre`, `created_at`, `updated_at`) VALUES
(1, 'Almacen 1', '2021-05-24 12:57:33', '2021-05-24 12:57:33'),
(2, 'Almacen 2', '2021-05-24 12:57:33', '2021-05-24 12:57:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombres` varchar(150) NOT NULL,
  `apellidos` varchar(150) NOT NULL,
  `identificacion` varchar(150) NOT NULL,
  `telefono` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `ruta_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombres`, `apellidos`, `identificacion`, `telefono`, `email`, `direccion`, `ruta_id`, `created_at`, `updated_at`) VALUES
(1, 'Pedro J', 'Avila', '25129301', '0545645646', 'pedrojam14@gmail.com', 'asadsd', 1, '2021-05-28 10:35:05', '2021-05-28 10:35:05'),
(2, 'Arnoldo ', 'Perez', '4546545646', '56564656', 'pepdxpd', '', 1, '2021-05-28 10:35:42', '2021-05-28 10:35:42'),
(5, 'pedro', 'Smit', '251293013', '04127709844', 'pedrojam134@gmail.com', 'ALTAGRACIA DE ORITUCO URB EL DIAMANTE CASA NUMERO 58, Principal', 2, '2021-05-28 23:46:00', '2021-07-16 16:32:46'),
(9, 'Pruebas cliente', 'pruebas', '544645646546', '64654564879', 'pruebascli@almacen.com', 'new york', 18, '2021-07-16 18:20:25', '2021-07-16 18:20:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_de_pagos`
--

CREATE TABLE `forma_de_pagos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `cod` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `forma_de_pagos`
--

INSERT INTO `forma_de_pagos` (`id`, `nombre`, `cod`, `created_at`, `updated_at`) VALUES
(1, 'Contado', 'cond', '2021-05-30 20:15:54', '2021-05-30 20:15:54'),
(2, 'credito', 'cred', '2021-05-30 20:15:54', '2021-05-30 20:15:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `precio` double NOT NULL,
  `precio_rebaja` double DEFAULT NULL,
  `marca` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `stock`, `precio`, `precio_rebaja`, `marca`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Galletas de  chocolate2', 70, 100, NULL, 'Royale club', 'asdasdasd', '2021-05-24 14:43:35', '2021-06-04 20:05:55'),
(2, 'Galletas', 900, 10000, NULL, 'Gap', '', '2021-06-04 18:32:34', '2021-07-16 18:19:18'),
(25, 'Chocolates', 80, 2000, NULL, 'sav', 'asdaksjdhajsdhak', '2021-07-16 18:16:13', '2021-07-16 18:19:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas`
--

CREATE TABLE `rutas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `direccion` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rutas`
--

INSERT INTO `rutas` (`id`, `nombre`, `direccion`, `created_at`, `updated_at`) VALUES
(1, 'Ruta 2', 'Direccion central al cruce, calle 4, casa numero 80', '2021-05-24 14:44:35', '2021-06-07 14:59:30'),
(2, 'Ruta 1', 'Direccion central, calle 7, casa numero 100', '2021-05-24 14:44:35', '2021-05-24 14:44:35'),
(3, 'Ruta 4', 'asdasdasdasdasd', '2021-06-07 14:59:44', '2021-06-07 14:59:44'),
(18, 'Ruta para video', 'New york calle 2', '2021-07-16 18:17:06', '2021-07-16 18:17:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_historias`
--

CREATE TABLE `stock_historias` (
  `id` int(11) NOT NULL,
  `vehiculo` varchar(100) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `stock_actual` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `stock_historias`
--

INSERT INTO `stock_historias` (`id`, `vehiculo`, `vehiculo_id`, `producto`, `producto_id`, `stock_actual`, `created_at`, `updated_at`) VALUES
(32, 'Vehiculo9', 4, 'paquete de galletas', 1, 135, '2021-05-28 01:55:18', '2021-05-28 01:55:18'),
(33, 'Vehiculo9', 4, 'Galletas de  chocolate', 2, 98, '2021-05-28 01:55:18', '2021-05-28 01:55:18'),
(34, 'vehiculo4', 6, 'paquete de galletas', 1, 3, '2021-05-28 02:00:21', '2021-05-28 02:00:21'),
(35, 'Vehiculo2', 2, 'paquete de galletas', 1, 24, '2021-05-31 03:44:04', '2021-05-31 03:44:04'),
(36, 'vehiculo 2', 3, 'paquete de galletas', 1, 20, '2021-05-31 03:45:43', '2021-05-31 03:45:43'),
(37, 'Vehiculo9', 4, 'Pruebas productos', 5, 0, '2021-06-08 01:23:03', '2021-06-08 01:23:03'),
(38, 'Vehiculo2', 2, 'Pruebas productos', 5, 0, '2021-06-09 15:14:33', '2021-06-09 15:14:33'),
(39, 'Vehiculo2', 2, 'Galletas', 2, 3, '2021-06-09 15:14:33', '2021-06-09 15:14:33'),
(40, 'Vehiculo2', 2, 'Galletas', 2, 8, '2021-06-09 15:14:49', '2021-06-09 15:14:49'),
(41, 'Vehiculo2', 2, 'Pruebas productos', 5, 7, '2021-06-09 15:17:17', '2021-06-09 15:17:17'),
(42, 'Vehiculo de pruebas', 9, 'chocolate', 9, 0, '2021-07-16 15:34:12', '2021-07-16 15:34:12'),
(43, 'Vehiculo de pruebas', 10, 'Chocolate', 12, 0, '2021-07-16 16:02:06', '2021-07-16 16:02:06'),
(44, 'Vehiculo de pruebas', 10, 'Galletas', 2, 0, '2021-07-16 16:02:06', '2021-07-16 16:02:06'),
(45, 'Vehiculo para pruebas', 11, 'Chocolates  2', 14, 0, '2021-07-16 16:30:42', '2021-07-16 16:30:42'),
(46, 'Vehiculo para pruebas', 11, 'Galletas', 2, 0, '2021-07-16 16:30:42', '2021-07-16 16:30:42'),
(47, 'Rutas para video', 12, 'Chocolates', 20, 0, '2021-07-16 17:45:15', '2021-07-16 17:45:15'),
(48, 'Rutas para video', 12, 'Galletas', 2, 0, '2021-07-16 17:45:15', '2021-07-16 17:45:15'),
(49, 'Vehiculo de video', 13, 'Chocolates para video', 24, 0, '2021-07-16 18:08:35', '2021-07-16 18:08:35'),
(50, 'Vehiculo de video', 13, 'Galletas', 2, 0, '2021-07-16 18:08:36', '2021-07-16 18:08:36'),
(51, 'Vehiculo para video', 14, 'Chocolates', 25, 0, '2021-07-16 18:19:18', '2021-07-16 18:19:18'),
(52, 'Vehiculo para video', 14, 'Galletas', 2, 0, '2021-07-16 18:19:18', '2021-07-16 18:19:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_vehiculos`
--

CREATE TABLE `stock_vehiculos` (
  `id` int(11) NOT NULL,
  `vehiculos_id` int(11) NOT NULL,
  `productos_id` int(11) NOT NULL,
  `stock_product` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `stock_vehiculos`
--

INSERT INTO `stock_vehiculos` (`id`, `vehiculos_id`, `productos_id`, `stock_product`) VALUES
(1, 2, 1, '2'),
(2, 2, 2, '8'),
(3, 4, 1, '103'),
(4, 4, 2, '93'),
(5, 3, 1, '8'),
(6, 3, 2, '10'),
(7, 6, 1, '3'),
(8, 6, 2, '3'),
(9, 4, 5, '2'),
(10, 2, 5, '7'),
(11, 9, 9, '17'),
(12, 10, 12, '15'),
(13, 10, 2, '20'),
(14, 11, 14, '20'),
(15, 11, 2, '20'),
(16, 12, 20, '20'),
(17, 12, 2, '20'),
(18, 13, 24, '17'),
(19, 13, 2, '18'),
(20, 14, 25, '17'),
(21, 14, 2, '9');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_src` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `img_src`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@almacen.com', NULL, '$2y$10$bFm5znijdBDhZsbv4oDXJ.js8lbakkA2ObZrXyDnnCqxqke54WNxC', NULL, '3k1KCleNly6mrJUh3tGMp8sh065NVRVUwm4zTepF.jpg', '2021-05-23 03:36:27', '2021-07-17 19:14:01'),
(4, 'sss', 'elvisvc85@gmail.com', NULL, '$2y$10$TsogWGBgwoOkkxzBiLkJq.8RsIGVxSoE.YTJdcNScB.MxtXmtJJX.', NULL, NULL, '2022-07-02 07:20:50', '2022-07-02 07:20:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculos`
--

CREATE TABLE `vehiculos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `marca` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `rutas_json` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vehiculos`
--

INSERT INTO `vehiculos` (`id`, `nombre`, `modelo`, `marca`, `color`, `rutas_json`, `created_at`, `updated_at`) VALUES
(2, 'Vehiculo2', 'chevrolet', 'blazer', 'verde', '[{\"id\":1,\"nombre\":\"Ruta 1\",\"direccion\":\"Direccion central al cruce, calle 4, casa numero 80\",\"created_at\":\"2021-05-24T14:44:35.000000Z\",\"updated_at\":\"2021-05-24T14:44:35.000000Z\"},{\"id\":2,\"nombre\":\"Ruta 1\",\"direccion\":\"Direccion central, calle 7, casa numero 100\",\"created_at\":\"2021-05-24T14:44:35.000000Z\",\"updated_at\":\"2021-05-24T14:44:35.000000Z\"}]', '2021-05-25 18:23:44', '2021-06-09 15:17:17'),
(3, 'vehiculo 2', 'chevrolet3', 'blazer', 'azul', '[{\"id\":1,\"nombre\":\"Ruta 1\",\"direccion\":\"Direccion central al cruce, calle 4, casa numero 80\",\"created_at\":\"2021-05-24T14:44:35.000000Z\",\"updated_at\":\"2021-05-24T14:44:35.000000Z\"},{\"id\":2,\"nombre\":\"Ruta 1\",\"direccion\":\"Direccion central, calle 7, casa numero 100\",\"created_at\":\"2021-05-24T14:44:35.000000Z\",\"updated_at\":\"2021-05-24T14:44:35.000000Z\"}]', '2021-05-25 18:25:43', '2021-05-31 03:45:50'),
(4, 'Vehiculo9', 'chevrolet', 'adads', 'asdasd', '[{\"id\":1,\"nombre\":\"Ruta 1\",\"direccion\":\"Direccion central al cruce, calle 4, casa numero 80\",\"created_at\":\"2021-05-24T14:44:35.000000Z\",\"updated_at\":\"2021-05-24T14:44:35.000000Z\"}]', '2021-05-26 16:18:33', '2021-06-08 01:23:03'),
(7, 'Vehiculo10', 'chevrolet', 'blazer', 'rojo', '[{\"id\":1,\"nombre\":\"Ruta 2\",\"direccion\":\"Direccion central al cruce, calle 4, casa numero 80\",\"created_at\":\"2021-05-24T14:44:35.000000Z\",\"updated_at\":\"2021-06-07T14:59:30.000000Z\"},{\"id\":2,\"nombre\":\"Ruta 1\",\"direccion\":\"Direccion central, calle 7, casa numero 100\",\"created_at\":\"2021-05-24T14:44:35.000000Z\",\"updated_at\":\"2021-05-24T14:44:35.000000Z\"}]', '2021-07-16 14:32:45', '2021-07-16 14:32:45'),
(14, 'Vehiculo para video', 'chevrolet', 'blazer', 'amarillo', '[{\"id\":18,\"nombre\":\"Ruta para video\",\"direccion\":\"New york calle 2\",\"created_at\":\"2021-07-16T18:17:06.000000Z\",\"updated_at\":\"2021-07-16T18:17:19.000000Z\"},{\"id\":2,\"nombre\":\"Ruta 1\",\"direccion\":\"Direccion central, calle 7, casa numero 100\",\"created_at\":\"2021-05-24T14:44:35.000000Z\",\"updated_at\":\"2021-05-24T14:44:35.000000Z\"}]', '2021-07-16 18:18:31', '2021-07-16 18:19:18'),
(15, 'ff', 'ff', 'ff', 'fff', '[{\"id\":3,\"nombre\":\"Ruta 4\",\"direccion\":\"asdasdasdasdasd\",\"created_at\":\"2021-06-07T14:59:44.000000Z\",\"updated_at\":\"2021-06-07T14:59:44.000000Z\"}]', '2022-07-02 02:21:47', '2022-07-02 02:21:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_clientes`
--

CREATE TABLE `venta_clientes` (
  `id` int(11) NOT NULL,
  `codigo` varchar(100) NOT NULL,
  `cifnif` varchar(150) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `ciudad` varchar(150) DEFAULT NULL,
  `fpago` varchar(100) DEFAULT NULL,
  `ruta_id` int(11) NOT NULL,
  `vehiculo_id` int(11) NOT NULL,
  `total_precio` double NOT NULL,
  `fecha_venta` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta_clientes`
--

INSERT INTO `venta_clientes` (`id`, `codigo`, `cifnif`, `direccion`, `nombres`, `apellidos`, `telefono`, `ciudad`, `fpago`, `ruta_id`, `vehiculo_id`, `total_precio`, `fecha_venta`, `created_at`, `updated_at`) VALUES
(8, '00000001', '4546545646', 'Ruta 1', 'Arnoldo', 'Perez2', '56564656', NULL, 'cond', 1, 4, 1100, '2021-06-01', '2021-06-01 20:25:03', '2021-06-06 17:17:52'),
(9, '00000002', '251293013', 'Ruta 1', 'pedro45', 'pedro4', '04127709844', NULL, 'cond', 2, 3, 600, '2021-06-01', '2021-06-01 20:30:50', '2021-06-01 20:30:50'),
(11, '00000003', '4546545646', 'Ruta 1', 'Arnoldo', 'Perez', '56564656', NULL, 'cond', 1, 4, 600, '2021-06-04', '2021-06-04 14:03:28', '2021-06-04 14:32:41'),
(14, '00000004', '544645646546', 'Ruta para video', 'Pruebas cliente', 'pruebas', '64654564879', NULL, 'cond', 18, 14, 26000, '2021-07-16', '2021-07-16 18:22:56', '2021-07-16 18:22:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_clientes_lineas`
--

CREATE TABLE `venta_clientes_lineas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `stock_venta` int(11) NOT NULL,
  `precio` double NOT NULL,
  `precio_total` double DEFAULT NULL,
  `venta_cliente_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta_clientes_lineas`
--

INSERT INTO `venta_clientes_lineas` (`id`, `nombre`, `stock_venta`, `precio`, `precio_total`, `venta_cliente_id`, `producto_id`, `created_at`, `updated_at`) VALUES
(8, 'paquete de galletas', 3, 100, 300, 6, 1, '2021-06-01 19:19:48', '2021-06-04 14:28:07'),
(10, 'paquete de galletas', 9, 100, 900, 8, 1, '2021-06-01 20:25:03', '2021-06-03 00:54:38'),
(11, 'Galletas de  chocolate', 2, 100, 200, 8, 2, '2021-06-01 20:25:03', '2021-06-01 20:25:03'),
(12, 'paquete de galletas', 3, 100, 300, 9, 1, '2021-06-01 20:30:50', '2021-06-01 20:30:50'),
(13, 'Galletas de  chocolate', 3, 100, 300, 9, 2, '2021-06-01 20:30:50', '2021-06-01 20:30:50'),
(14, 'Galletas de  chocolate', 3, 100, 300, 11, 2, '2021-06-04 14:03:28', '2021-06-04 14:03:28'),
(17, 'paquete de galletas', 3, 100, 300, 11, 1, '2021-06-04 14:34:26', '2021-06-04 14:34:26'),
(21, 'Chocolates', 3, 2000, 6000, 14, 25, '2021-07-16 18:22:56', '2021-07-16 18:22:56'),
(22, 'Galletas', 2, 10000, 20000, 14, 2, '2021-07-16 18:22:56', '2021-07-16 18:22:56');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacens`
--
ALTER TABLE `almacens`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `forma_de_pagos`
--
ALTER TABLE `forma_de_pagos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rutas`
--
ALTER TABLE `rutas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `stock_historias`
--
ALTER TABLE `stock_historias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `stock_vehiculos`
--
ALTER TABLE `stock_vehiculos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta_clientes`
--
ALTER TABLE `venta_clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta_clientes_lineas`
--
ALTER TABLE `venta_clientes_lineas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacens`
--
ALTER TABLE `almacens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `forma_de_pagos`
--
ALTER TABLE `forma_de_pagos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `rutas`
--
ALTER TABLE `rutas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `stock_historias`
--
ALTER TABLE `stock_historias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `stock_vehiculos`
--
ALTER TABLE `stock_vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `venta_clientes`
--
ALTER TABLE `venta_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `venta_clientes_lineas`
--
ALTER TABLE `venta_clientes_lineas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
