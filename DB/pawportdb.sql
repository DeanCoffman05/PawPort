-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pawportdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `pawportdb` ;

-- -----------------------------------------------------
-- Schema pawportdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pawportdb` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `pawportdb` ;

-- -----------------------------------------------------
-- Table `pawportdb`.`kanine`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pawportdb`.`kanine` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `pawportdb`.`kanine` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `breed` VARCHAR(45) NULL,
  `purpose` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pawportdb`.`handler`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pawportdb`.`handler` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `pawportdb`.`handler` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `badge_number` INT NULL,
  `start_date` DATETIME NULL,
  `kanine_id` INT NOT NULL,
  `training_training_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_handler_kanine_idx` (`kanine_id` ASC),
  CONSTRAINT `fk_handler_kanine`
    FOREIGN KEY (`kanine_id`)
    REFERENCES `pawportdb`.`kanine` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pawportdb`.`narc_training`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pawportdb`.`narc_training` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `pawportdb`.`narc_training` (
  `narc_id` INT NOT NULL AUTO_INCREMENT,
  `aid` VARCHAR(45) NULL,
  `weight` VARCHAR(45) NULL,
  `height` VARCHAR(45) NULL,
  `depth` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `set_time` DATETIME NULL,
  `packaging` VARCHAR(45) NULL,
  `notes` TEXT(2000) NULL,
  `hide_details` TEXT(2000) NULL,
  `handler_id` INT NOT NULL,
  PRIMARY KEY (`narc_id`, `handler_id`),
  INDEX `fk_narc_training_handler1_idx` (`handler_id` ASC),
  CONSTRAINT `fk_narc_training_handler1`
    FOREIGN KEY (`handler_id`)
    REFERENCES `pawportdb`.`handler` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pawportdb`.`patrol_training`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pawportdb`.`patrol_training` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `pawportdb`.`patrol_training` (
  `patroltraining_id` INT NOT NULL AUTO_INCREMENT,
  `equipment` VARCHAR(45) NULL,
  `start_time` VARCHAR(45) NULL,
  `stop_time` VARCHAR(45) NULL,
  `notes` TEXT(2000) NULL,
  `tasks` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `handler_id` INT NOT NULL,
  PRIMARY KEY (`patroltraining_id`, `handler_id`),
  INDEX `fk_patrol_training_handler1_idx` (`handler_id` ASC),
  CONSTRAINT `fk_patrol_training_handler1`
    FOREIGN KEY (`handler_id`)
    REFERENCES `pawportdb`.`handler` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pawportdb`.`ob_training`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pawportdb`.`ob_training` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `pawportdb`.`ob_training` (
  `ob_id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NULL,
  `start_time` DATETIME NULL,
  `stop_time` DATETIME NULL,
  `notes` TEXT(2000) NULL,
  `handler_id` INT NOT NULL,
  `location` VARCHAR(45) NULL,
  PRIMARY KEY (`ob_id`, `handler_id`),
  INDEX `fk_ob_training_handler1_idx` (`handler_id` ASC),
  CONSTRAINT `fk_ob_training_handler1`
    FOREIGN KEY (`handler_id`)
    REFERENCES `pawportdb`.`handler` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pawportdb`.`tracking_training`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pawportdb`.`tracking_training` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `pawportdb`.`tracking_training` (
  `trackingtraining_id` INT NOT NULL AUTO_INCREMENT,
  `location` VARCHAR(45) NULL,
  `length` VARCHAR(45) NULL,
  `start_time` DATETIME NULL,
  `stop_time` DATETIME NULL,
  `cook_time` VARCHAR(45) NULL,
  `weather` VARCHAR(45) NULL,
  `notes` VARCHAR(45) NULL,
  `handler_id` INT NOT NULL,
  PRIMARY KEY (`trackingtraining_id`, `handler_id`),
  INDEX `fk_tracking_training_handler1_idx` (`handler_id` ASC),
  CONSTRAINT `fk_tracking_training_handler1`
    FOREIGN KEY (`handler_id`)
    REFERENCES `pawportdb`.`handler` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pawportdb`.`deploy_patrol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pawportdb`.`deploy_patrol` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `pawportdb`.`deploy_patrol` (
  `deploypatrol_id` INT NOT NULL AUTO_INCREMENT,
  `case_number` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `success` VARCHAR(45) NULL,
  `bite_info` DATETIME NULL,
  `start_time` DATETIME NULL,
  `end_time` DATETIME NULL,
  `comments` TEXT(2000) NULL,
  `handler_id` INT NOT NULL,
  PRIMARY KEY (`deploypatrol_id`, `handler_id`),
  INDEX `fk_deploy_patrol_handler1_idx` (`handler_id` ASC),
  CONSTRAINT `fk_deploy_patrol_handler1`
    FOREIGN KEY (`handler_id`)
    REFERENCES `pawportdb`.`handler` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pawportdb`.`deploy_tracking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pawportdb`.`deploy_tracking` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `pawportdb`.`deploy_tracking` (
  `deploytracking_id` INT NOT NULL AUTO_INCREMENT,
  `location_start` VARCHAR(45) NULL,
  `call_time` VARCHAR(45) NULL,
  `arrival_time` VARCHAR(45) NULL,
  `deploy_trackingcol` VARCHAR(45) NULL,
  `location_end` VARCHAR(45) NULL,
  `successful` TINYINT NOT NULL,
  `handler_id` INT NOT NULL,
  PRIMARY KEY (`deploytracking_id`, `handler_id`),
  INDEX `fk_deploy_tracking_handler1_idx` (`handler_id` ASC),
  CONSTRAINT `fk_deploy_tracking_handler1`
    FOREIGN KEY (`handler_id`)
    REFERENCES `pawportdb`.`handler` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pawportdb`.`deploy_narc`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `pawportdb`.`deploy_narc` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `pawportdb`.`deploy_narc` (
  `deploynarc_id` INT NOT NULL AUTO_INCREMENT,
  `start_time` DATETIME NULL,
  `stop_time` DATETIME NULL,
  `case_number` INT NULL,
  `vehicle` VARCHAR(45) NULL,
  `find` TINYINT NULL,
  `find_type` VARCHAR(45) NULL,
  `find_weight` VARCHAR(45) NULL,
  `comments` TEXT(2000) NULL,
  `handler_id` INT NOT NULL,
  PRIMARY KEY (`deploynarc_id`, `handler_id`),
  INDEX `fk_deploy_narc_handler1_idx` (`handler_id` ASC),
  CONSTRAINT `fk_deploy_narc_handler1`
    FOREIGN KEY (`handler_id`)
    REFERENCES `pawportdb`.`handler` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;
SET SQL_MODE = '';
DROP USER IF EXISTS pawport;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
SHOW WARNINGS;
CREATE USER 'pawport' IDENTIFIED BY 'password';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `pawportdb`.* TO 'pawport';
SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
