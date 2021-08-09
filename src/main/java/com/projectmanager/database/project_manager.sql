-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.6.3-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for project_manager
CREATE DATABASE IF NOT EXISTS `project_manager` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_bin */;
USE `project_manager`;

-- Dumping structure for table project_manager.project
CREATE TABLE IF NOT EXISTS `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb3_bin NOT NULL,
  `des` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_deleted` binary(1) NOT NULL,
  `status` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_date` timestamp NULL DEFAULT NULL,
  `create_user` int(11) NOT NULL,
  `update_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `TK_CREATE_USER_ID_idx` (`create_user`),
  KEY `TK_UPDATE_USER_ID_idx` (`update_user`),
  CONSTRAINT `TK_CREATE_USER_ID` FOREIGN KEY (`create_user`) REFERENCES `user` (`id`),
  CONSTRAINT `TK_UPDATE_USER_ID` FOREIGN KEY (`update_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Data exporting was unselected.

-- Dumping structure for table project_manager.project_employee
CREATE TABLE IF NOT EXISTS `project_employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `des` varchar(200) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_USER_ID_idx` (`user_id`),
  KEY `FK_PROJECT_ID_idx` (`project_id`),
  CONSTRAINT `FK_PROJECT_ID` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Data exporting was unselected.

-- Dumping structure for table project_manager.task
CREATE TABLE IF NOT EXISTS `task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb3_bin NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `task_type` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `priority` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `status` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `project_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_date` timestamp NULL DEFAULT NULL,
  `create_user` int(11) NOT NULL,
  `task_manager_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_PROJECT_ID_idx` (`project_id`),
  KEY `FK_CREATE_USER_ID_idx` (`create_user`),
  KEY `FK_TASK_MANAGER_ID_idx` (`task_manager_id`),
  CONSTRAINT `FK_CREATE_USER_ID` FOREIGN KEY (`create_user`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_OF_PROJECT_ID` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`),
  CONSTRAINT `FK_TASK_MANAGER_ID` FOREIGN KEY (`task_manager_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Data exporting was unselected.

-- Dumping structure for table project_manager.task_history
CREATE TABLE IF NOT EXISTS `task_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `des` varchar(200) COLLATE utf8mb3_bin DEFAULT NULL,
  `pre_starus` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `status` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_user` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TASK_ID_idx` (`task_id`),
  KEY `FK_UPDATE_USER_ID_idx` (`update_user`),
  CONSTRAINT `FK_TASK_ID` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  CONSTRAINT `FK_UPDATE_USER_ID` FOREIGN KEY (`update_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Data exporting was unselected.

-- Dumping structure for table project_manager.todo
CREATE TABLE IF NOT EXISTS `todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb3_bin NOT NULL,
  `des` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_deleted` binary(1) NOT NULL,
  `todo_type` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `status` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `task_id` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_date` timestamp NULL DEFAULT NULL,
  `create_user` int(11) NOT NULL,
  `assigned_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TODO_TASK_ID_idx` (`task_id`),
  KEY `FK_CREATE_USER_ID_idx` (`create_user`),
  KEY `FK_ASSIGNED_USER_ID_idx` (`assigned_user`),
  CONSTRAINT `FK_TODO_ASSIGNED_USER_ID` FOREIGN KEY (`assigned_user`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_TODO_CREATE_USER_ID` FOREIGN KEY (`create_user`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_TODO_TASK_ID` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Data exporting was unselected.

-- Dumping structure for table project_manager.todo_history
CREATE TABLE IF NOT EXISTS `todo_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `des` varchar(200) COLLATE utf8mb3_bin DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb3_bin NOT NULL,
  `pre_status` varchar(45) COLLATE utf8mb3_bin NOT NULL,
  `update_date` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `update_user` int(11) DEFAULT NULL,
  `todo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_TODO_ID_idx` (`todo_id`),
  KEY `FK_TH_UPDATE_USER_idx` (`update_user`),
  CONSTRAINT `FK_TH_UPDATE_USER` FOREIGN KEY (`update_user`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_TODO_ID` FOREIGN KEY (`todo_id`) REFERENCES `todo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Data exporting was unselected.

-- Dumping structure for table project_manager.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(200) COLLATE utf8mb3_bin NOT NULL,
  `is_admin` binary(1) NOT NULL,
  `is_delete` binary(1) NOT NULL,
  `email` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `phone` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `address` varchar(45) COLLATE utf8mb3_bin DEFAULT NULL,
  `create_date` date NOT NULL,
  `update_date` date DEFAULT NULL,
  `create_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
