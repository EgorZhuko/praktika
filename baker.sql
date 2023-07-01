-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 01 2023 г., 16:34
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `baker`
--

-- --------------------------------------------------------

--
-- Структура таблицы `create_isd`
--

CREATE TABLE `create_isd` (
  `id` int NOT NULL,
  `id_smena` int NOT NULL,
  `id_isd` int DEFAULT NULL,
  `kolvo_isd` int NOT NULL,
  `id_ingr` int NOT NULL,
  `kolvo_ingr` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `create_isd`
--

INSERT INTO `create_isd` (`id`, `id_smena`, `id_isd`, `kolvo_isd`, `id_ingr`, `kolvo_ingr`) VALUES
(1, 1, 1, 5, 1, 2.3),
(2, 1, 1, 5, 2, 1.5),
(3, 1, 2, 3, 3, 0.8),
(4, 1, 2, 3, 4, 0.5),
(5, 2, 3, 2, 4, 1.1),
(6, 2, 3, 2, 5, 1.8),
(7, 2, 4, 4, 1, 3.2),
(8, 2, 4, 4, 2, 1.6),
(9, 3, 2, 1, 3, 0.3),
(10, 3, 2, 1, 4, 0.7);

-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE `feedback` (
  `ID` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `feedback`
--

INSERT INTO `feedback` (`ID`, `name`, `email`, `subject`) VALUES
(2, 'Pavel', 'email@gmail.com', 'Testing...'),
(3, 'Pavel', 'email@gmail.com', 'Testing...');

-- --------------------------------------------------------

--
-- Структура таблицы `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `price`) VALUES
(1, 'Мука', 50),
(2, 'Сахар', 30),
(3, 'Яйца', 80),
(4, 'Молоко', 100),
(5, 'Соль', 60),
(6, 'Сливочное масло', 120),
(7, 'Ванильный сахар', 30),
(8, 'Разрыхлитель', 20),
(9, 'Какао', 130),
(10, 'Крахмал', 90);

-- --------------------------------------------------------

--
-- Структура таблицы `ingredienty_dlya_receptov`
--

CREATE TABLE `ingredienty_dlya_receptov` (
  `id` int NOT NULL,
  `id_ingredient` int NOT NULL,
  `id_recept` int NOT NULL,
  `kolvo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `ingredienty_dlya_receptov`
--

INSERT INTO `ingredienty_dlya_receptov` (`id`, `id_ingredient`, `id_recept`, `kolvo`) VALUES
(1, 1, 1, 4),
(2, 2, 1, 2),
(3, 3, 1, 4),
(4, 4, 1, 5),
(5, 5, 1, 1),
(6, 6, 2, 2),
(7, 2, 2, 1),
(8, 7, 2, 2),
(9, 1, 3, 2),
(10, 4, 3, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `isdelya`
--

CREATE TABLE `isdelya` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_type_isdelya` int NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `isdelya`
--

INSERT INTO `isdelya` (`id`, `name`, `id_type_isdelya`, `img`, `price`) VALUES
(1, 'Торт весенний', 1, 'cake1.png', 150),
(2, 'Торт друзья', 1, 'cake2.png', 200),
(3, 'Пирог яблочный', 2, 'cake3.png', 100),
(4, 'Пирог ягодный', 2, 'cake4.png', 300),
(5, 'Круассан с шоколадом', 4, 'cake5.png', 600),
(6, 'Батон хлеба', 4, 'cake5.png', 500),
(7, 'Банановый кекс', 3, 'cake7.png', 800),
(8, 'Абрикосовый кекс', 3, 'cake8.png', 950);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `id_sale` int NOT NULL,
  `id_isdelya` int NOT NULL,
  `kolvo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `id_sale`, `id_isdelya`, `kolvo`) VALUES
(1, 1, 1, 2),
(2, 1, 2, 3),
(3, 2, 1, 4),
(4, 2, 3, 1),
(5, 3, 4, 2),
(6, 4, 2, 1),
(7, 4, 1, 3),
(8, 5, 5, 2),
(9, 5, 4, 1),
(10, 6, 3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `postavka_ingr`
--

CREATE TABLE `postavka_ingr` (
  `id` int NOT NULL,
  `id_postavshik` int NOT NULL,
  `id_ingredient` int NOT NULL,
  `kolvo` int NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `postavka_ingr`
--

INSERT INTO `postavka_ingr` (`id`, `id_postavshik`, `id_ingredient`, `kolvo`, `date`) VALUES
(1, 1, 1, 1000, '2023-06-01 00:00:00'),
(2, 1, 2, 500, '2021-06-01 00:00:00'),
(3, 2, 4, 800, '2021-06-03 00:00:00'),
(4, 3, 5, 50, '2021-06-05 00:00:00'),
(5, 4, 6, 300, '2021-06-06 00:00:00'),
(6, 2, 3, 200, '2021-06-02 00:00:00'),
(7, 5, 7, 50, '2021-06-09 00:00:00'),
(8, 1, 8, 100, '2021-06-11 00:00:00'),
(9, 3, 9, 150, '2021-06-15 00:00:00'),
(10, 4, 10, 50, '2021-06-17 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `postavka_isd`
--

CREATE TABLE `postavka_isd` (
  `ID` int NOT NULL,
  `id_isd` int DEFAULT NULL,
  `kolvo` int DEFAULT NULL,
  `id_postavshik` int DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `postavka_isd`
--

INSERT INTO `postavka_isd` (`ID`, `id_isd`, `kolvo`, `id_postavshik`, `date`) VALUES
(1, 8, 10, 2, '2023-06-19'),
(2, 1, 40, 1, '2023-02-19'),
(3, 1, 35, 2, '2023-02-19'),
(4, 2, 10, 3, '2023-03-19'),
(5, 2, 30, 4, '2023-03-19'),
(6, 3, 20, 5, '2023-04-19'),
(7, 3, 10, 1, '2023-04-19'),
(8, 4, 50, 4, '2023-05-19'),
(9, 4, 30, 2, '2023-05-19'),
(10, 5, 20, 3, '2023-06-19'),
(11, 5, 10, 1, '2023-06-19');

-- --------------------------------------------------------

--
-- Структура таблицы `postavshiki`
--

CREATE TABLE `postavshiki` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `postavshiki`
--

INSERT INTO `postavshiki` (`id`, `title`) VALUES
(1, 'ООО Рога и Копыта'),
(2, 'ООО Вкусные продукты'),
(3, 'ИП Петров'),
(4, 'ООО Здоровое питание'),
(5, 'ИП Сидоров');

-- --------------------------------------------------------

--
-- Структура таблицы `recepty`
--

CREATE TABLE `recepty` (
  `id` int NOT NULL,
  `id_isdelye` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `recepty`
--

INSERT INTO `recepty` (`id`, `id_isdelye`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `sales`
--

CREATE TABLE `sales` (
  `id` int NOT NULL,
  `id_sotrudnika` int NOT NULL,
  `id_smeny` int NOT NULL,
  `Id_pokupatel` int NOT NULL,
  `Id_isd` int NOT NULL,
  `Kolvo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sales`
--

INSERT INTO `sales` (`id`, `id_sotrudnika`, `id_smeny`, `Id_pokupatel`, `Id_isd`, `Kolvo`) VALUES
(1, 1, 1, 5, 1, 1),
(2, 2, 1, 6, 2, 1),
(3, 3, 2, 6, 3, 2),
(4, 4, 2, 5, 4, 3),
(5, 1, 3, 5, 5, 1),
(6, 2, 3, 7, 6, 4),
(7, 3, 4, 7, 7, 3),
(8, 4, 4, 5, 8, 2),
(9, 1, 5, 5, 1, 1),
(10, 2, 5, 7, 2, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `smeny`
--

CREATE TABLE `smeny` (
  `id` int NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `smeny`
--

INSERT INTO `smeny` (`id`, `date`) VALUES
(1, '2023-06-01'),
(2, '2023-06-02'),
(3, '2023-06-17'),
(4, '2023-06-26'),
(5, '2021-06-05');

-- --------------------------------------------------------

--
-- Структура таблицы `sotrdniki`
--

CREATE TABLE `sotrdniki` (
  `id` int NOT NULL,
  `fio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sotrdniki`
--

INSERT INTO `sotrdniki` (`id`, `fio`, `salary`) VALUES
(1, 'Иванов Иван Иванович', 25000),
(2, 'Петров Петр Петрович', 30000),
(3, 'Сидорова Елена Ивановна', 28000),
(4, 'Смирнов Алексей Николаевич', 32000),
(5, 'Козлова Ольга Владимировна', 27000);

-- --------------------------------------------------------

--
-- Структура таблицы `sotrudniki_na_smene`
--

CREATE TABLE `sotrudniki_na_smene` (
  `id` int NOT NULL,
  `id_sotrudnik` int NOT NULL,
  `id_smeny` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `sotrudniki_na_smene`
--

INSERT INTO `sotrudniki_na_smene` (`id`, `id_sotrudnik`, `id_smeny`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 1, 2),
(4, 3, 2),
(5, 4, 3),
(6, 5, 3),
(7, 3, 4),
(8, 4, 4),
(9, 1, 5),
(10, 2, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `types_isdely`
--

CREATE TABLE `types_isdely` (
  `id` int NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `types_isdely`
--

INSERT INTO `types_isdely` (`id`, `title`, `img`) VALUES
(1, 'Торты', 'card1.png'),
(2, 'Пироги', 'card2.png'),
(3, 'Кексы', 'card3.png'),
(4, 'Выпечка', 'card4.png');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `ID` int NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `is_admin` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`ID`, `firstname`, `lastname`, `username`, `email`, `password`, `avatar`, `date`, `is_admin`) VALUES
(5, 'Егор', 'Жуков', 'admin', 'admin@gmail.com', '$2y$10$xR.hFK9tmwILgVBfhrswgOiKjr7kO1ZI1nqdLFjMl6XPaEVyLS.ee', '1687005335мужик.jpg', '2020-10-10', 1),
(6, 'Админ', 'Админов', 'admin1', 'admin1@mail.com', '$2y$10$VU5lIdlvVK5zEy1Fyju.1eWpDhNyVKSODQrsZ5bF25qPry3UOG3na', '1687023716я.jpg', '2020-10-10', 1),
(7, 'клим', 'куликов', 'klimkulikov', 'klim@mail.com', '$2y$10$1IZf8F8OYRFUjXbl5RpH7OOjjSEw5A3GCYk58L3WjzXcMB.3ChWz2', '1687103247haha.jpg', '2023-06-18', 0),
(8, 'Егор', 'Корова', 'korova', 'pasha16032004@gmail.com', '$2y$10$/jHJo9RrwEQ5Lz3VzaspG.AruIixm45BphETJFGuOyic.sQJ8tq3u', '1688147133WIN_20230317_13_08_53_Pro.jpg', '2023-06-30', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `create_isd`
--
ALTER TABLE `create_isd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ingr` (`id_ingr`),
  ADD KEY `id_smena` (`id_smena`),
  ADD KEY `create_isd_ibfk_4` (`id_isd`);

--
-- Индексы таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ingredienty_dlya_receptov`
--
ALTER TABLE `ingredienty_dlya_receptov`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ingredient` (`id_ingredient`),
  ADD KEY `id_recept` (`id_recept`);

--
-- Индексы таблицы `isdelya`
--
ALTER TABLE `isdelya`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_type_isdelya` (`id_type_isdelya`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_sale` (`id_sale`),
  ADD KEY `id_isdelya` (`id_isdelya`);

--
-- Индексы таблицы `postavka_ingr`
--
ALTER TABLE `postavka_ingr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_ingredient` (`id_ingredient`),
  ADD KEY `postavki_ibfk_1` (`id_postavshik`);

--
-- Индексы таблицы `postavka_isd`
--
ALTER TABLE `postavka_isd`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_postavshik` (`id_postavshik`),
  ADD KEY `postavka_isd_ibfk_1` (`id_isd`);

--
-- Индексы таблицы `postavshiki`
--
ALTER TABLE `postavshiki`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `recepty`
--
ALTER TABLE `recepty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_isdelye` (`id_isdelye`);

--
-- Индексы таблицы `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_smeny` (`id_smeny`),
  ADD KEY `id_sotrudnika` (`id_sotrudnika`),
  ADD KEY `Id_pokupatel` (`Id_pokupatel`),
  ADD KEY `sales_ibfk_4` (`Id_isd`);

--
-- Индексы таблицы `smeny`
--
ALTER TABLE `smeny`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sotrdniki`
--
ALTER TABLE `sotrdniki`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sotrudniki_na_smene`
--
ALTER TABLE `sotrudniki_na_smene`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_smeny` (`id_smeny`),
  ADD KEY `id_sotrudnik` (`id_sotrudnik`);

--
-- Индексы таблицы `types_isdely`
--
ALTER TABLE `types_isdely`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `create_isd`
--
ALTER TABLE `create_isd`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `feedback`
--
ALTER TABLE `feedback`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `ingredienty_dlya_receptov`
--
ALTER TABLE `ingredienty_dlya_receptov`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `isdelya`
--
ALTER TABLE `isdelya`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `postavka_ingr`
--
ALTER TABLE `postavka_ingr`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `postavka_isd`
--
ALTER TABLE `postavka_isd`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `postavshiki`
--
ALTER TABLE `postavshiki`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `recepty`
--
ALTER TABLE `recepty`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `smeny`
--
ALTER TABLE `smeny`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `sotrdniki`
--
ALTER TABLE `sotrdniki`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `sotrudniki_na_smene`
--
ALTER TABLE `sotrudniki_na_smene`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `types_isdely`
--
ALTER TABLE `types_isdely`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `create_isd`
--
ALTER TABLE `create_isd`
  ADD CONSTRAINT `create_isd_ibfk_1` FOREIGN KEY (`id_ingr`) REFERENCES `ingredients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `create_isd_ibfk_3` FOREIGN KEY (`id_smena`) REFERENCES `smeny` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `create_isd_ibfk_4` FOREIGN KEY (`id_isd`) REFERENCES `isdelya` (`id`) ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `ingredienty_dlya_receptov`
--
ALTER TABLE `ingredienty_dlya_receptov`
  ADD CONSTRAINT `ingredienty_dlya_receptov_ibfk_1` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ingredienty_dlya_receptov_ibfk_2` FOREIGN KEY (`id_recept`) REFERENCES `recepty` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `isdelya`
--
ALTER TABLE `isdelya`
  ADD CONSTRAINT `isdelya_ibfk_1` FOREIGN KEY (`id_type_isdelya`) REFERENCES `types_isdely` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_sale`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`id_isdelya`) REFERENCES `isdelya` (`id`) ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `postavka_ingr`
--
ALTER TABLE `postavka_ingr`
  ADD CONSTRAINT `postavka_ingr_ibfk_1` FOREIGN KEY (`id_postavshik`) REFERENCES `postavshiki` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `postavka_ingr_ibfk_2` FOREIGN KEY (`id_ingredient`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `postavka_isd`
--
ALTER TABLE `postavka_isd`
  ADD CONSTRAINT `postavka_isd_ibfk_1` FOREIGN KEY (`id_isd`) REFERENCES `isdelya` (`id`) ON UPDATE RESTRICT,
  ADD CONSTRAINT `postavka_isd_ibfk_2` FOREIGN KEY (`id_postavshik`) REFERENCES `postavshiki` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `recepty`
--
ALTER TABLE `recepty`
  ADD CONSTRAINT `recepty_ibfk_2` FOREIGN KEY (`id_isdelye`) REFERENCES `isdelya` (`id`) ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`id_smeny`) REFERENCES `smeny` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`id_sotrudnika`) REFERENCES `sotrdniki` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_ibfk_4` FOREIGN KEY (`Id_isd`) REFERENCES `isdelya` (`id`) ON UPDATE RESTRICT,
  ADD CONSTRAINT `sales_ibfk_5` FOREIGN KEY (`Id_pokupatel`) REFERENCES `users` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Ограничения внешнего ключа таблицы `sotrudniki_na_smene`
--
ALTER TABLE `sotrudniki_na_smene`
  ADD CONSTRAINT `sotrudniki_na_smene_ibfk_1` FOREIGN KEY (`id_smeny`) REFERENCES `smeny` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sotrudniki_na_smene_ibfk_2` FOREIGN KEY (`id_sotrudnik`) REFERENCES `sotrdniki` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
