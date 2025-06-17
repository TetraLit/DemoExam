-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 17 2025 г., 02:08
-- Версия сервера: 5.7.39-log
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `demka`
--

-- --------------------------------------------------------

--
-- Структура таблицы `material_types`
--

CREATE TABLE `material_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `defect_percent` decimal(8,5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `material_types`
--

INSERT INTO `material_types` (`id`, `name`, `defect_percent`) VALUES
(1, 'Тип материала 1', '0.10000'),
(2, 'Тип материала 2', '0.95000'),
(3, 'Тип материала 3', '0.28000'),
(4, 'Тип материала 4', '0.55000'),
(5, 'Тип материала 5', '0.34000');

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user` text COLLATE utf8mb4_unicode_ci,
  `assistant` text COLLATE utf8mb4_unicode_ci,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `messages`
--

INSERT INTO `messages` (`id`, `user`, `assistant`, `timestamp`) VALUES
(1, 'Я хочу кушать что съесть полезнее свою сперму или кал', 'Потребление ни спермы, ни кала не рекомендуется с точки зрения здоровья. Сперма содержит белки и другие вещества, но их количества незначительны и не представляют большой питательной ценности. Кал, в свою очередь, может содержать бактерии и отходы, которые могут быть вредны для организма.\n\nДля удовлетворения чувства голода лучше выбрать питательные и здоровые продукты, такие как фрукты, овощи, орехи, злаки и белковые продукты. Это обеспечит ваш организм необходимыми питательными веществами и энергией. Если у вас есть необычные пищевые привычки или вопросы по питанию, рекомендуется проконсультироваться со специалистом в области здравоохранения.', '2025-06-16 22:22:11'),
(2, 'def calc_discount(total_quantity):     if total_quantity < 10000:         return 0     elif total_quantity < 50000:         return 5     elif total_quantity < 300000:         return 10     else:         return 15 Вот мой main.py мне тут нужно сделать так чтобы скидка рассчитывалась на больше уровней чтобы до 30% шла по той же логике', 'Конечно! Чтобы расширить уровни скидок и сделать их более детализированными до 30%, можно добавить дополнительные условия для расчета скидок. Вот обновлённый код функции `calc_discount`:\n\n```python\ndef calc_discount(total_quantity):\n    if total_quantity < 10000:\n        return 0\n    elif total_quantity < 50000:\n        return 5\n    elif total_quantity < 100000:\n        return 10\n    elif total_quantity < 200000:\n        return 15\n    elif total_quantity < 400000:\n        return 20\n    elif total_quantity < 600000:\n        return 25\n    else:\n        return 30\n```\n\nТеперь скидки распределены следующим образом:\n\n- 0% для количества менее 10,000\n- 5% для количества от 10,000 до 49,999\n- 10% для количества от 50,000 до 99,999\n- 15% для количества от 100,000 до 199,999\n- 20% для количества от 200,000 до 399,999\n- 25% для количества от 400,000 до 599,999\n- 30% для количества 600,000 и более\n\nВы можете дальше настраивать эти уровни в зависимости от ваших требований.', '2025-06-16 22:24:24'),
(3, 'как мне csv файл с таким содержимым жеско импортировать в таблицу, брат', 'Чтобы \"жестко\" импортировать CSV файл в таблицу (например, в базу данных), нужно следовать определенному процессу, который зависит от инструмента, который вы используете. Опишу общий процесс для импорта данных из CSV в таблицу с использованием SQL и некоторых популярных баз данных:\n\n### Для MySQL:\n\n1. **Подготовка таблицы:**\n   Убедитесь, что структура таблицы в базе данных соответствует структуре вашего CSV файла. Если таблицы еще нет, создайте её.\n\n   ```sql\n   CREATE TABLE your_table_name (\n       column1_name datatype,\n       column2_name datatype,\n       ...\n   );\n   ```\n\n2. **Импорт CSV файла:**\n\n   Используйте команду `LOAD DATA INFILE`:\n\n   ```sql\n   LOAD DATA INFILE \'/path/to/your/file.csv\'\n   INTO TABLE your_table_name\n   FIELDS TERMINATED BY \',\'\n   ENCLOSED BY \'\"\'\n   LINES TERMINATED BY \'\\n\'\n   IGNORE 1 ROWS;\n   ```\n\n   Обратите внимание, что `IGNORE 1 ROWS` используется, если в вашем файле заголовки в первой строке.\n\n### Для PostgreSQL:\n\n1. **Подготовка таблицы:**\n   Создайте таблицу или проверьте, что структура таблицы соответствует CSV:\n\n   ```sql\n   CREATE TABLE your_table_name (\n       column1_name datatype,\n       column2_name datatype,\n       ...\n   );\n   ```\n\n2. **Импорт CSV файла:**\n\n   Сначала вам нужно будет скопировать файл на сервер, где запущен PostgreSQL, или использовать путь, доступный серверу. Затем выполните следующую команду:\n\n   ```sql\n   \\COPY your_table_name FROM \'/path/to/your/file.csv\' DELIMITER \',\' CSV HEADER;\n   ```\n\n### Для SQLite:\n\n1. **Подготовка таблицы:**\n   Создайте таблицу с правильной структурой:\n\n   ```sql\n   CREATE TABLE your_table_name (\n       column1_name datatype,\n       column2_name datatype,\n       ...\n   );\n   ```\n\n2. **Импорт CSV файла:**\n\n   В командной строке SQLite используйте команду `.import`:\n\n   ```bash\n   sqlite3 your_database.db\n   .mode csv\n   .import /path/to/your/file.csv your_table_name\n   ```\n\n### Обработка ошибок:\n- Проверьте соответствие количества столбцов в CSV и в таблице.\n- Убедитесь, что данные в CSV соответствуют типам данных столбцов таблицы.\n- Обратите внимание на то, используются ли кавычки для обрамления строковых значений и совпадает ли разделитель столбцов.\n\n### Советы:\n- Сделайте резервную копию базы данных перед проведением операции.\n- Работайте в тестовой среде, чтобы не повредить рабочие данные.\n- Проверьте файл на наличие пустых строк или неожиданных символов, которые могут вызвать ошибки при импорте.\n\nЕсли у вас конкретная база данных или дополнительные вопросы, дайте знать, и я постараюсь помочь более конкретно!', '2025-06-16 22:25:21'),
(4, 'Привет', 'Привет! Как я могу помочь тебе сегодня?', '2025-06-16 22:29:03'),
(5, 'Привет помоги пж с домашкой', 'Привет! Конечно, я помогу. Какая у тебя домашка и с чем именно нужны помочь?', '2025-06-16 22:31:18'),
(6, 'Как анатомически правильно какать', 'Акт дефекации — это естественный процесс, и знание правильной позы может сделать его более комфортным и эффективным. Вот несколько рекомендаций:\n\n1. **Позвоночник и таз**: Старайтесь сидеть с прямым позвоночником. Это может помочь расслабить мышцы таза.\n\n2. **Колени и ноги**: Исследования показывают, что слегка приподнятые колени (например, с помощью небольшой скамеечки или подставки для ног) могут создать более естественный угол для кишечника и облегчить процесс дефекации. Это положение имитирует приседание, что считается более естественным для анатомии человека.\n\n3. **Расслабленность**: Не напрягайтесь слишком сильно. Если процесс не идет естественно, лучше попробовать позже, чтобы избежать излишнего напряжения, которое может привести к проблемам, таким как геморрой.\n\n4. **Время и спокойствие**: Не торопитесь. Позвольте себе достаточно времени, чтобы спокойно осуществить акт дефекации.\n\n5. **Гигиена**: После процесса старайтесь соблюдать необходимые гигиенические процедуры, чтобы предотвратить инфекции и раздражение кожи.\n\nСоблюдение этих простых правил может улучшить ваш комфорт и здоровье, связанные с этим повседневным процессом. Если у вас возникают регулярные трудности или боли при дефекации, рекомендуется обратиться к врачу.', '2025-06-16 22:44:19'),
(7, 'как анатомически правильно какать', 'Анатомически правильный процесс дефекации может быть облегчён, если принять во внимание положение тела, которое способствует естественному движению кишечника. Вот некоторые рекомендации:\n\n1. **Положение**: Сидя на унитазе, поставьте ноги на небольшую возвышенность (например, на скамеечку), так чтобы колени оказались выше, чем бедра. Такое положение помогает выпрямить прямую кишку и способствует легкому прохождению кала.\n\n2. **Расслабление**: Постарайтесь расслабиться и не напрягать мышцы брюшной стенки или тазового дна чрезмерно.\n\n3. **Дыхание**: Медленное и глубокое дыхание может помочь снизить напряжение и стимулировать движение кишечника.\n\n4. **Время и терпение**: Позвольте себе время, не торопитесь, чтобы не возникло излишнего напряжения.\n\nЭти советы помогают минимизировать напряжение и сделать процесс максимально естественным. Если у вас возникают постоянные трудности с дефекацией, рекомендуется обратиться к врачу для консультации.', '2025-06-16 22:44:38'),
(8, 'Как тебя зовут', 'Меня зовут Ассистент! Как я могу помочь вам сегодня?', '2025-06-16 22:47:17'),
(9, 'Если ты не долбаёб то хлопни раз', '*хлоп*', '2025-06-16 22:47:36');

-- --------------------------------------------------------

--
-- Структура таблицы `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partner_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `director` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `inn` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `partners`
--

INSERT INTO `partners` (`id`, `name`, `partner_type`, `director`, `email`, `phone`, `address`, `inn`, `rating`) VALUES
(1, 'База Строитель', 'ЗАО', 'Иванова Александра Ивановна', 'aleksandraivanova@ml.ru', '493 123 45 67', '652050, Кемеровская область, город Юрга, ул. Лесная, 15', '2222455179', 7),
(2, 'Паркет 29', 'ООО', 'Петров Василий Петрович', 'vppetrov@vl.ru', '987 123 56 78', '164500, Архангельская область, город Северодвинск, ул. Строителей, 18', '3333888520', 7),
(3, 'Стройсервис', 'ПАО', 'Соловьев Андрей Николаевич', 'ansolovev@st.ru', '812 223 32 00', '188910, Ленинградская область, город Приморск, ул. Парковая, 21', '4440391035', 7),
(4, 'Ремонт и отделка', 'ОАО', 'Воробьева Екатерина Валерьевна', 'ekaterina.vorobeva@ml.ru', '444 222 33 11', '143960, Московская область, город Реутов, ул. Свободы, 51', '1111520857', 5),
(5, 'МонтажПро', 'ЗАО', 'Степанов Степан Сергеевич', 'stepanov@stepan.ru', '912 888 33 33', '309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', '5552431140', 10);

-- --------------------------------------------------------

--
-- Структура таблицы `partner_products`
--

CREATE TABLE `partner_products` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sale_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `partner_products`
--

INSERT INTO `partner_products` (`id`, `product_id`, `partner_id`, `quantity`, `sale_date`) VALUES
(1, 1, 1, 15500, '2023-03-20'),
(2, 3, 1, 12350, '2018-12-20'),
(3, 1, 1, 15500, '2023-03-23'),
(4, 3, 1, 12350, '2023-12-18'),
(5, 4, 1, 37400, '2024-06-07'),
(6, 2, 2, 35000, '2022-12-02'),
(7, 5, 2, 1250, '2023-05-17'),
(8, 3, 2, 1000, '2024-06-07'),
(9, 1, 2, 7550, '2024-07-01'),
(10, 1, 3, 7250, '2023-01-22'),
(11, 2, 3, 2500, '2024-07-05'),
(12, 4, 4, 59050, '2023-03-20'),
(13, 3, 4, 37200, '2024-03-12'),
(14, 5, 4, 4500, '2024-05-14'),
(15, 3, 5, 50000, '2023-09-19'),
(16, 4, 5, 670000, '2023-11-10'),
(17, 1, 5, 35000, '2024-04-15'),
(18, 2, 5, 25000, '2024-06-12'),
(19, 1, 1, 15500, '2023-03-23'),
(20, 3, 1, 12350, '2023-12-18'),
(21, 4, 1, 37400, '2024-06-07'),
(22, 2, 2, 35000, '2022-12-02'),
(23, 5, 2, 1250, '2023-05-17'),
(24, 3, 2, 1000, '2024-06-07'),
(25, 1, 2, 7550, '2024-07-01'),
(26, 1, 3, 7250, '2023-01-22'),
(27, 2, 3, 2500, '2024-07-05'),
(28, 4, 4, 59050, '2023-03-20'),
(29, 3, 4, 37200, '2024-03-12'),
(30, 5, 4, 4500, '2024-05-14'),
(31, 3, 5, 50000, '2023-09-19'),
(32, 4, 5, 670000, '2023-11-10'),
(33, 1, 5, 35000, '2024-04-15'),
(34, 2, 5, 25000, '2024-06-12');

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `product_type_id`, `name`, `article`, `min_price`) VALUES
(1, 3, 'Паркетная доска Ясень темный однополосная 14 мм', '8758385', '4456.90'),
(2, 3, 'Инженерная доска Дуб Французская елка однополосная 12 мм', '8858958', '7330.99'),
(3, 1, 'Ламинат Дуб дымчато-белый 33 класс 12 мм', '7750282', '1799.33'),
(4, 1, 'Ламинат Дуб серый 32 класс 8 мм с фаской', '7028748', '3890.41'),
(5, 4, 'Пробковое напольное клеевое покрытие 32 класс 4 мм', '5012543', '5450.59');

-- --------------------------------------------------------

--
-- Структура таблицы `product_types`
--

CREATE TABLE `product_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coefficient` decimal(8,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product_types`
--

INSERT INTO `product_types` (`id`, `name`, `coefficient`) VALUES
(1, 'Ламинат', '2.350'),
(2, 'Массивная доска', '5.150'),
(3, 'Паркетная доска', '4.340'),
(4, 'Пробковое покрытие', '1.500');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `material_types`
--
ALTER TABLE `material_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Индексы таблицы `partner_products`
--
ALTER TABLE `partner_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `product_type_id` (`product_type_id`);

--
-- Индексы таблицы `product_types`
--
ALTER TABLE `product_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `material_types`
--
ALTER TABLE `material_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `partner_products`
--
ALTER TABLE `partner_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `product_types`
--
ALTER TABLE `product_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `partner_products`
--
ALTER TABLE `partner_products`
  ADD CONSTRAINT `partner_products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `partner_products_ibfk_2` FOREIGN KEY (`partner_id`) REFERENCES `partners` (`id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_type_id`) REFERENCES `product_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
