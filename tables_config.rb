-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'drinks'
--
-- ---

DROP TABLE IF EXISTS `drinks`;

CREATE TABLE `drinks` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'ingredients'
--
-- ---

DROP TABLE IF EXISTS `ingredients`;

CREATE TABLE `ingredients` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NOT NULL DEFAULT 'NULL',
  `category_id` INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'categories'
--
-- ---

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `name` VARCHAR NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'mixed_drinks'
--
-- ---

DROP TABLE IF EXISTS `mixed_drinks`;

CREATE TABLE `mixed_drinks` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `drink_id` INTEGER NOT NULL DEFAULT NULL,
  `ingredient_id` INTEGER NOT NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'games'
--
-- ---

DROP TABLE IF EXISTS `games`;

CREATE TABLE `games` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `session` INTEGER NOT NULL DEFAULT NULL,
  `user_id` INTEGER NOT NULL DEFAULT NULL,
  `drink_id` INTEGER NOT NULL DEFAULT NULL,
  `correct?` INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys
-- ---

ALTER TABLE `ingredients` ADD FOREIGN KEY (category_id) REFERENCES `categories` (`id`);
ALTER TABLE `mixed_drinks` ADD FOREIGN KEY (drink_id) REFERENCES `drinks` (`id`);
ALTER TABLE `mixed_drinks` ADD FOREIGN KEY (ingredient_id) REFERENCES `ingredients` (`id`);
ALTER TABLE `games` ADD FOREIGN KEY (drink_id) REFERENCES `drinks` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `drinks` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `ingredients` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `categories` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `mixed_drinks` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `games` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `drinks` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `ingredients` (`id`,`name`,`category_id`) VALUES
-- ('','','');
-- INSERT INTO `categories` (`id`,`name`) VALUES
-- ('','');
-- INSERT INTO `mixed_drinks` (`id`,`drink_id`,`ingredient_id`) VALUES
-- ('','','');
-- INSERT INTO `games` (`id`,`session`,`user_id`,`drink_id`,`correct?`) VALUES
-- ('','','','','');
