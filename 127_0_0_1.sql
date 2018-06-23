-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2018 at 06:30 PM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `notes_app`
--
CREATE DATABASE IF NOT EXISTS `notes_app` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `notes_app`;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` bigint(20) NOT NULL,
  `comment` longtext NOT NULL,
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `manufacture`
--

CREATE TABLE `manufacture` (
  `id` bigint(20) NOT NULL,
  `manufacture_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `manufactures`
--

CREATE TABLE `manufactures` (
  `manufacture_id` bigint(20) NOT NULL,
  `manufacture_name` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufactures`
--

INSERT INTO `manufactures` (`manufacture_id`, `manufacture_name`) VALUES
(1, 'Hyundai'),
(2, 'Honda'),
(3, 'Maruthi'),
(4, 'Suzuki'),
(5, 'Hero Motocorp'),
(6, 'Yamaha'),
(7, 'Ducati'),
(8, 'Hayrley-Davidson'),
(9, 'Kawasaki'),
(10, 'BMW'),
(11, 'Aprilia'),
(12, 'Triumph'),
(13, 'KTM'),
(14, 'MV Agusta'),
(15, 'Bajaj'),
(16, 'Royal Enfield'),
(17, 'Hyosung'),
(18, 'TVS'),
(19, 'Indian'),
(20, 'Benelli'),
(21, 'Norton'),
(22, 'Moto Guzzi'),
(23, 'Mahindra'),
(24, 'Keeway'),
(25, 'SYM Motors'),
(26, 'Lifan'),
(27, 'Lamborghini'),
(28, 'Rusi'),
(29, 'Walton'),
(30, 'Victory Motorcycles'),
(31, 'Skygo'),
(32, 'Haojue'),
(33, 'Buell'),
(34, 'Motorstar'),
(35, 'Racal Motors'),
(36, 'Piaggio'),
(37, 'CF Moto'),
(38, 'Puch'),
(39, 'Demak'),
(40, 'Birmingham Small Arms'),
(41, 'Bimota'),
(42, 'Vyrus'),
(43, 'Ideal Jawa'),
(44, 'Racal'),
(45, 'Derbi'),
(46, 'Can Am'),
(47, 'Dayun'),
(48, 'Gilera'),
(49, 'Rieju'),
(50, 'Vincent'),
(51, 'Megelli'),
(52, 'Confederate'),
(53, 'Eagle-Wing'),
(54, 'Cagiva'),
(55, 'Jianshe'),
(56, 'CZ Moto'),
(57, 'Modenas'),
(58, 'Atomik'),
(59, 'Kinlon'),
(60, 'Bashan'),
(61, 'Yamoto'),
(62, 'Thunder'),
(63, 'Sunriser'),
(64, 'Regal Raptor'),
(65, 'Fantic Motor'),
(66, 'Paton'),
(67, 'CR&S'),
(68, 'Sachs'),
(69, 'Ural'),
(70, 'Lucky Star'),
(71, 'Sunbeam'),
(72, 'WSK');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `media_id` bigint(20) NOT NULL,
  `media_name` longtext NOT NULL,
  `media_type` int(11) NOT NULL,
  `media_url` varchar(255) NOT NULL,
  `ref_id` bigint(20) NOT NULL,
  `ref_type` int(11) NOT NULL,
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`media_id`, `media_name`, `media_type`, `media_url`, `ref_id`, `ref_type`, `id`) VALUES
(1, 'ggfh', 1, 'https://imgd.aeplcdn.com/1056x594/cw/ec/22900/Hyundai-Elantra-Exterior-94094.jpg', 1, 1, 0),
(2, 'ggfh', 1, 'https://imgd.aeplcdn.com/1056x594/cw/ec/22900/Hyundai-Elantra-Exterior-94094.jpg', 1, 1, 0),
(3, 'ggfh', 1, 'https://imgd.aeplcdn.com/1056x594/cw/ec/22900/Hyundai-Elantra-Exterior-94094.jpg', 2, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `vehicle_id` bigint(20) NOT NULL,
  `currency_type` varchar(255) NOT NULL,
  `currency_unit` varchar(255) NOT NULL,
  `vehicle_name` varchar(255) NOT NULL,
  `vehicle_price` double NOT NULL,
  `manufacture_id` bigint(20) NOT NULL,
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `manufacture`
--
ALTER TABLE `manufacture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufactures`
--
ALTER TABLE `manufactures`
  ADD PRIMARY KEY (`manufacture_id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`media_id`),
  ADD KEY `FKtbkdrcykpp8mylc4iuq5rvpc9` (`ref_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`vehicle_id`),
  ADD KEY `FKx6q0adnp1waksr3jel2t7rlk` (`manufacture_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacture`
--
ALTER TABLE `manufacture`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufactures`
--
ALTER TABLE `manufactures`
  MODIFY `manufacture_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `media_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `vehicle_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FKpp3nf0i4kqu7j5v28yfpf8jx` FOREIGN KEY (`media_id`) REFERENCES `manufactures` (`manufacture_id`),
  ADD CONSTRAINT `FKtbkdrcykpp8mylc4iuq5rvpc9` FOREIGN KEY (`ref_id`) REFERENCES `manufactures` (`manufacture_id`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `FKx6q0adnp1waksr3jel2t7rlk` FOREIGN KEY (`manufacture_id`) REFERENCES `manufactures` (`manufacture_id`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'notes_app', 'manufactures', '[]', '2018-05-12 03:17:59');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2018-05-28 16:29:52', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `service_app`
--
CREATE DATABASE IF NOT EXISTS `service_app` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `service_app`;

-- --------------------------------------------------------

--
-- Table structure for table `availability`
--

CREATE TABLE `availability` (
  `id` int(11) NOT NULL,
  `vehicle_id` bigint(20) NOT NULL,
  `showromm_id` bigint(20) NOT NULL,
  `status` bigint(20) NOT NULL,
  `deliver_in` text NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `manufactures`
--

CREATE TABLE `manufactures` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufactures`
--

INSERT INTO `manufactures` (`id`, `name`) VALUES
(1, 'Hyundai'),
(2, 'Honda'),
(3, 'Maruthi'),
(4, 'Suzuki'),
(5, 'Hero Motocorp'),
(6, 'Yamaha'),
(7, 'Ducati'),
(8, 'Hayrley-Davidson'),
(9, 'Kawasaki'),
(10, 'BMW'),
(11, 'Aprilia'),
(12, 'Triumph'),
(13, 'KTM'),
(14, 'MV Agusta'),
(15, 'Bajaj'),
(16, 'Royal Enfield'),
(17, 'Hyosung'),
(18, 'TVS'),
(19, 'Indian'),
(20, 'Benelli'),
(21, 'Norton'),
(22, 'Moto Guzzi'),
(23, 'Mahindra'),
(24, 'Keeway'),
(25, 'SYM Motors'),
(26, 'Lifan'),
(27, 'Lamborghini'),
(28, 'Rusi'),
(29, 'Walton'),
(30, 'Victory Motorcycles'),
(31, 'Skygo'),
(32, 'Haojue'),
(33, 'Buell'),
(34, 'Motorstar'),
(35, 'Racal Motors'),
(36, 'Piaggio'),
(37, 'CF Moto'),
(38, 'Puch'),
(39, 'Demak'),
(40, 'Birmingham Small Arms'),
(41, 'Bimota'),
(42, 'Vyrus'),
(43, 'Ideal Jawa'),
(44, 'Racal'),
(45, 'Derbi'),
(46, 'Can Am'),
(47, 'Dayun'),
(48, 'Gilera'),
(49, 'Rieju'),
(50, 'Vincent'),
(51, 'Megelli'),
(52, 'Confederate'),
(53, 'Eagle-Wing'),
(54, 'Cagiva'),
(55, 'Jianshe'),
(56, 'CZ Moto'),
(57, 'Modenas'),
(58, 'Atomik'),
(59, 'Kinlon'),
(60, 'Bashan'),
(61, 'Yamoto'),
(62, 'Thunder'),
(63, 'Sunriser'),
(64, 'Regal Raptor'),
(65, 'Fantic Motor'),
(66, 'Paton'),
(67, 'CR&S'),
(68, 'Sachs'),
(69, 'Ural'),
(70, 'Lucky Star'),
(71, 'Sunbeam'),
(72, 'WSK'),
(73, 'test'),
(74, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) NOT NULL,
  `ref_id` bigint(20) NOT NULL,
  `ref_type` int(11) NOT NULL,
  `media_type` int(11) NOT NULL,
  `media_url` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` bigint(20) NOT NULL,
  `rating` double NOT NULL,
  `comment` text NOT NULL,
  `rating_for` int(11) NOT NULL,
  `rating_for_id` bigint(20) NOT NULL,
  `rating_by` bigint(20) NOT NULL,
  `review_ref_id` bigint(20) NOT NULL COMMENT 'if has parent comment, parent_tef_id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `service_history`
--

CREATE TABLE `service_history` (
  `id` int(11) NOT NULL,
  `user_vehicle_id` int(11) NOT NULL,
  `showroom_id` int(11) NOT NULL,
  `description` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `showrooms`
--

CREATE TABLE `showrooms` (
  `id` bigint(20) NOT NULL,
  `name` varchar(500) NOT NULL,
  `service_type` varchar(100) NOT NULL COMMENT '1-service center, 2-showroom',
  `email` varchar(200) NOT NULL,
  `mobile` bigint(18) NOT NULL,
  `address` mediumtext NOT NULL,
  `lattitude` double NOT NULL,
  `longitude` double NOT NULL,
  `type` int(10) NOT NULL COMMENT 'authorised/unauthorised',
  `isVerified` int(11) NOT NULL COMMENT 'is verified status by us',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `manufacture_id` bigint(20) NOT NULL,
  `my_tag` varchar(150) NOT NULL,
  `timings` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `showrooms`
--

INSERT INTO `showrooms` (`id`, `name`, `service_type`, `email`, `mobile`, `address`, `lattitude`, `longitude`, `type`, `isVerified`, `created_at`, `updated_at`, `manufacture_id`, `my_tag`, `timings`) VALUES
(1, 'Sri laxmi motors', '2', 'srilaxmimotors@gmail.com', 40, 'HN 16/11/20/6/172, PN 105, Saleem Nagar Colony, Malakpet, Srinagar Colony, Malakpet Extension, Old Malakpet, Hyderabad, Telangana 500036', 17.3719687, 78.51963, 4, 0, '2018-05-27 07:38:27', '0000-00-00 00:00:00', 5, '', ''),
(2, 'Variety Motors - Hero Showroom', '2', 'srilaxmimotors@gmail.com', 40, '17-1-375/26/A/5, DMRL Crossroads, Santosh Nagar, Owaisi Nagar, Hasnabad, Santosh Nagar, Hyderabad, Telangana 500059', 17.3439923, 78.5077083, 4, 0, '2018-05-27 07:42:25', '0000-00-00 00:00:00', 5, '', ''),
(3, 'Hero Moto', '2', 'srilaxmimotors@gmail.com', 1800, 'Bapu Nagar, Amberpet, Hyderabad, Telangana 500013', 17.389428, 78.5291975, 4, 0, '2018-05-27 07:45:13', '0000-00-00 00:00:00', 5, '', ''),
(4, 'Prestige Hero', '2', 'srilaxmimotors@gmail.com', 40, 'D.No.19-ABC, Beside Metro 70MM,, 19-2-238/4/4, Kamatipura, Bahadurpura, Hyderabad, Telangana 500064', 17.3609628, 78.4663694, 4, 0, '2018-05-27 07:46:51', '0000-00-00 00:00:00', 5, '', ''),
(5, 'Fortune Honda Darulshifah', '2', 'fortunehonda.com', 99488, '22-1-8/1, Opp Mesco Clinic Darulshifa, Old City, Purani Haveli, Darulshifa, Hyderabad, Telangana 500002', 17.3730479, 78.4821462, 4, 0, '2018-05-27 08:02:21', '0000-00-00 00:00:00', 2, '', ''),
(6, 'Aadi Honda', '2', 'aadihonda.com', 40, 'No.16-11-19/8/1, Appaji Complex, Saleem Nagar Colony, Malakpet,Beside HDFC Bank, Saleem Nagar Colony, Malakpet Extension, New Malakpet, Hyderabad, Telangana 500036', 17.372369, 78.4989723, 4, 0, '2018-05-27 08:05:08', '0000-00-00 00:00:00', 2, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `id` bigint(20) NOT NULL,
  `tag_name` varchar(150) NOT NULL,
  `tag_desc` longtext NOT NULL,
  `tag_type` int(11) NOT NULL,
  `tag_status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(155) NOT NULL,
  `mobile` varchar(155) NOT NULL,
  `password` varchar(155) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `role` int(11) NOT NULL,
  `name` varchar(155) NOT NULL,
  `is_verified` int(2) NOT NULL,
  `otp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `mobile`, `password`, `created_at`, `updated_at`, `role`, `name`, `is_verified`, `otp`) VALUES
(1, 'shiva@mail.com', '8106547939', '$2a$10$NIsPMia4XF2BqsY9K/ITVuVV6hria3G68ZwdJYMgWmfaveGcZV78a', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Shiva', 0, 0),
(2, 'devi@mail.com', '9052250084', '$2a$10$3B3bYJ863.B4gOWNvnY5MOXZLhbyMn05sljmi5DUhu70ut81nAOPW', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'Devi', 0, 0),
(3, 'sathish@mail.com', '9874563210', '$2a$10$TeIj4z/M6v7i8e5SLbkcZ.NqRGk3MQ1kOyuFupXTOBwUVEVYvlNvW', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 'sathish', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_vehicles`
--

CREATE TABLE `user_vehicles` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `vehicle_id` bigint(20) NOT NULL,
  `vehicle_reg_number` varchar(155) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `model_name` varchar(500) NOT NULL COMMENT 'like CBZ',
  `manufacture_id` bigint(20) NOT NULL COMMENT 'like HeroMotocorp id',
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `model_name`, `manufacture_id`, `description`) VALUES
(1, 'test model', 1, 'khbsdjk ,dbnfjkdsf djklfnds dslkfnhds flkdsnf'),
(2, 'test model1', 1, 'khbsdjk ,dbnfjkdsf djklfnds dslkfnhds flkdsnf'),
(3, 'test model2', 1, 'khbsdjk ,dbnfjkdsf djklfnds dslkfnhds flkdsnf'),
(4, '2test model2', 1, 'khbsdjk ,dbnfjkdsf djklfnds dslkfnhds flkdsnf'),
(5, '2werwtest model2', 2, 'khbsdjk ,dbnfjkdsf djklfnds dslkfnhds flkdsnf'),
(6, 'model2', 2, 'khbsdjk ,dbnfjkdsf djklfnds dslkfnhds flkdsnf'),
(7, 'model2', 2, 'khbsdjk ,dbnfjkdsf djklfnds dslkfnhds flkdsnf'),
(8, 'model3', 3, 'khbsdjk ,dbnfjkdsf djklfnds dslkfnhds flkdsnf'),
(9, 'model3 u f gfj gh j', 3, 'khbsdjk ,dbnfjkdsf djklfnds dslkfnhds flkdsnf'),
(10, '2werwtest model24', 2, 'khbsdjk ,dbnfjkdsf djklfnds dslkfnhds flkdsnf');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `manufactures`
--
ALTER TABLE `manufactures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `showrooms`
--
ALTER TABLE `showrooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `manufactures`
--
ALTER TABLE `manufactures`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `showrooms`
--
ALTER TABLE `showrooms`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(255) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`branch_id`, `branch_name`, `company_id`) VALUES
(4, 'Hyderabad', 2),
(5, 'Hyderabad', 1),
(6, 'Hyderabad', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL,
  `comment` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`) VALUES
(1, 'Invia'),
(2, 'Invia Info Systems'),
(3, 'BeHolics');

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(7),
(7);

-- --------------------------------------------------------

--
-- Table structure for table `manufacture`
--

CREATE TABLE `manufacture` (
  `id` bigint(20) NOT NULL,
  `manufacture_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacture`
--

INSERT INTO `manufacture` (`id`, `manufacture_name`) VALUES
(1, 'Hyundai'),
(2, 'Honda'),
(3, 'Maruthi'),
(4, 'Suzuki'),
(5, 'Hero Motocorp'),
(6, 'Yamaha'),
(7, 'Ducati'),
(8, 'Hayrley-Davidson'),
(9, 'Kawasaki'),
(10, 'BMW'),
(11, 'Aprilia'),
(12, 'Triumph'),
(13, 'KTM'),
(14, 'MV Agusta'),
(15, 'Bajaj'),
(16, 'Royal Enfield'),
(17, 'Hyosung'),
(18, 'TVS'),
(19, 'Indian'),
(20, 'Benelli'),
(21, 'Norton'),
(22, 'Moto Guzzi'),
(23, 'Mahindra'),
(24, 'Keeway'),
(25, 'SYM Motors'),
(26, 'Lifan'),
(27, 'Lamborghini'),
(28, 'Rusi'),
(29, 'Walton'),
(30, 'Victory Motorcycles'),
(31, 'Skygo'),
(32, 'Haojue'),
(33, 'Buell'),
(34, 'Motorstar'),
(35, 'Racal Motors'),
(36, 'Piaggio'),
(37, 'CF Moto'),
(38, 'Puch'),
(39, 'Demak'),
(40, 'Birmingham Small Arms'),
(41, 'Bimota'),
(42, 'Vyrus'),
(43, 'Ideal Jawa'),
(44, 'Racal'),
(45, 'Derbi'),
(46, 'Can Am'),
(47, 'Dayun'),
(48, 'Gilera'),
(49, 'Rieju'),
(50, 'Vincent'),
(51, 'Megelli'),
(52, 'Confederate'),
(53, 'Eagle-Wing'),
(54, 'Cagiva'),
(55, 'Jianshe'),
(56, 'CZ Moto'),
(57, 'Modenas'),
(58, 'Atomik'),
(59, 'Kinlon'),
(60, 'Bashan'),
(61, 'Yamoto'),
(62, 'Thunder'),
(63, 'Sunriser'),
(64, 'Regal Raptor'),
(65, 'Fantic Motor'),
(66, 'Paton'),
(67, 'CR&S'),
(68, 'Sachs'),
(69, 'Ural'),
(70, 'Lucky Star'),
(71, 'Sunbeam'),
(72, 'WSK');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) NOT NULL,
  `media_name` longtext NOT NULL,
  `media_type` int(11) NOT NULL,
  `media_url` varchar(255) NOT NULL,
  `ref_id` bigint(20) NOT NULL,
  `ref_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` bigint(20) NOT NULL,
  `currency_type` varchar(255) NOT NULL,
  `currency_unit` varchar(255) NOT NULL,
  `vehicle_name` varchar(255) NOT NULL,
  `vehicle_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `currency_type`, `currency_unit`, `vehicle_name`, `vehicle_price`) VALUES
(1, 'Lakhs', 'INR', 'BMW 6 Series', 2.62),
(2, 'Lakhs', 'INR', 'BMW 5 Series', 2.62);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branch_id`),
  ADD KEY `FK14f9k065wqeubl6tl0gdumcp5` (`company_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `manufacture`
--
ALTER TABLE `manufacture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK658xkgj0qrhnltr9hpas6piv8` (`ref_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `manufacture`
--
ALTER TABLE `manufacture`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `FK14f9k065wqeubl6tl0gdumcp5` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`);

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK658xkgj0qrhnltr9hpas6piv8` FOREIGN KEY (`ref_id`) REFERENCES `manufacture` (`id`);

--
-- Constraints for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD CONSTRAINT `FKs808cntwf6p24uee69pmwnbqe` FOREIGN KEY (`id`) REFERENCES `manufacture` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
