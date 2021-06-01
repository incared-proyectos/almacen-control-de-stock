-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2021 a las 04:05:52
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `vuejs2`
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
(3, 'pruebas', 'pruebas', '546546546', '464564654', 'pruebas@gmail.com', 'asasdas', 2, '2021-05-28 10:47:22', '2021-05-28 10:47:22'),
(5, 'pedro45', 'pedro4', '251293013', '04127709844', 'pedrojam134@gmail.com', 'ALTAGRACIA DE ORITUCO URB EL DIAMANTE CASA NUMERO 58, Principal', 2, '2021-05-28 23:46:00', '2021-05-28 23:57:26');

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
(1, 'paquete de galletas', 74, 100, NULL, 'Royale', 'asdasd', '2021-05-24 14:43:35', '2021-05-31 03:45:43'),
(2, 'Galletas de  chocolate', 70, 100, NULL, 'Royale club', 'asdasdasd', '2021-05-24 14:43:35', '2021-05-28 01:55:18');

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
(1, 'Ruta 1', 'Direccion central al cruce, calle 4, casa numero 80', '2021-05-24 14:44:35', '2021-05-24 14:44:35'),
(2, 'Ruta 1', 'Direccion central, calle 7, casa numero 100', '2021-05-24 14:44:35', '2021-05-24 14:44:35');

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
(36, 'vehiculo 2', 3, 'paquete de galletas', 1, 20, '2021-05-31 03:45:43', '2021-05-31 03:45:43');

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
(2, 2, 2, '0'),
(3, 4, 1, '135'),
(4, 4, 2, '98'),
(5, 3, 1, '17'),
(6, 3, 2, '13'),
(7, 6, 1, '3'),
(8, 6, 2, '3');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'pedro', 'pedrojam14@gmail.com', NULL, '$2y$10$36yThdWohsf7l2y79Kr.neZ0n.uIJHBjzlmDaeVfiIgIY/I.1o/p6', NULL, '2021-05-23 03:36:27', '2021-05-23 03:36:27'),
(2, 'nuevo', 'nuevo@gmail.com', NULL, '$2y$10$.g9RY680r75uukzg68rNseDfthdnzkExvFmOaMkpyCX7.2wiYcEze', NULL, '2021-05-23 07:09:27', '2021-05-23 07:09:27');

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
(2, 'Vehiculo2', 'chevrolet', 'blazer', 'verde', '[{\"id\":1,\"nombre\":\"Ruta 1\",\"direccion\":\"Direccion central al cruce, calle 4, casa numero 80\",\"created_at\":\"2021-05-24T14:44:35.000000Z\",\"updated_at\":\"2021-05-24T14:44:35.000000Z\"},{\"id\":2,\"nombre\":\"Ruta 1\",\"direccion\":\"Direccion central, calle 7, casa numero 100\",\"created_at\":\"2021-05-24T14:44:35.000000Z\",\"updated_at\":\"2021-05-24T14:44:35.000000Z\"}]', '2021-05-25 18:23:44', '2021-05-31 03:44:04'),
(3, 'vehiculo 2', 'chevrolet3', 'blazer', 'azul', '[{\"id\":1,\"nombre\":\"Ruta 1\",\"direccion\":\"Direccion central al cruce, calle 4, casa numero 80\",\"created_at\":\"2021-05-24T14:44:35.000000Z\",\"updated_at\":\"2021-05-24T14:44:35.000000Z\"},{\"id\":2,\"nombre\":\"Ruta 1\",\"direccion\":\"Direccion central, calle 7, casa numero 100\",\"created_at\":\"2021-05-24T14:44:35.000000Z\",\"updated_at\":\"2021-05-24T14:44:35.000000Z\"}]', '2021-05-25 18:25:43', '2021-05-31 03:45:50'),
(4, 'Vehiculo9', 'chevrolet', 'adads', 'asdasd', '[{\"id\":1,\"nombre\":\"Ruta 1\",\"direccion\":\"Direccion central al cruce, calle 4, casa numero 80\",\"created_at\":\"2021-05-24T14:44:35.000000Z\",\"updated_at\":\"2021-05-24T14:44:35.000000Z\"}]', '2021-05-26 16:18:33', '2021-05-28 01:55:18');

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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta_clientes`
--

INSERT INTO `venta_clientes` (`id`, `codigo`, `cifnif`, `direccion`, `nombres`, `apellidos`, `telefono`, `ciudad`, `fpago`, `ruta_id`, `vehiculo_id`, `total_precio`, `created_at`, `updated_at`) VALUES
(1, '5664654645', '4546545646', 'Ruta 1', 'Arnoldo', 'Perez', '56564656', NULL, 'cond', 1, 2, 400, '2021-05-31 19:11:48', '2021-05-31 19:13:02'),
(2, '11669977', '25129301', 'Ruta 1', 'Pedro J', 'Avila', '0545645646', NULL, 'cond', 1, 2, 200, '2021-05-31 19:12:16', '2021-05-31 19:12:16'),
(3, '9977888', '546546546', 'Ruta 1', 'pruebas', 'pruebas', '464564654', NULL, 'cond', 2, 2, 1000, '2021-05-31 19:13:32', '2021-05-31 19:13:32'),
(4, '879798798', '4546545646', 'Ruta 1', 'Arnoldo', 'Perez', '56564656', NULL, 'cond', 1, 2, 400, '2021-06-01 01:55:14', '2021-06-01 01:55:14'),
(5, '4654654654', '251293013', 'Ruta 1', 'pedro45', 'pedro4', '04127709844', NULL, 'cond', 2, 3, 300, '2021-06-01 01:59:33', '2021-06-01 01:59:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_clientes_lineas`
--

CREATE TABLE `venta_clientes_lineas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `stock_venta` int(11) NOT NULL,
  `precio` double NOT NULL,
  `venta_cliente_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venta_clientes_lineas`
--

INSERT INTO `venta_clientes_lineas` (`id`, `nombre`, `stock_venta`, `precio`, `venta_cliente_id`, `producto_id`, `created_at`, `updated_at`) VALUES
(1, 'paquete de galletas', 2, 300, 1, 1, '2021-05-31 19:11:48', '2021-05-31 19:13:02'),
(2, 'Galletas de  chocolate', 1, 100, 1, 2, '2021-05-31 19:11:48', '2021-05-31 19:11:48'),
(3, 'paquete de galletas', 3, 100, 2, 1, '2021-05-31 19:12:16', '2021-05-31 19:12:16'),
(4, 'paquete de galletas', 3, 900, 3, 1, '2021-05-31 19:13:32', '2021-05-31 19:13:32'),
(5, 'Galletas de  chocolate', 2, 100, 3, 2, '2021-05-31 19:13:32', '2021-05-31 19:13:32'),
(6, 'paquete de galletas', 2, 300, 4, 1, '2021-06-01 01:55:14', '2021-06-01 01:55:14'),
(7, 'paquete de galletas', 3, 300, 5, 1, '2021-06-01 01:59:33', '2021-06-01 01:59:33');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rutas`
--
ALTER TABLE `rutas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `stock_historias`
--
ALTER TABLE `stock_historias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `stock_vehiculos`
--
ALTER TABLE `stock_vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vehiculos`
--
ALTER TABLE `vehiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `venta_clientes`
--
ALTER TABLE `venta_clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `venta_clientes_lineas`
--
ALTER TABLE `venta_clientes_lineas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
