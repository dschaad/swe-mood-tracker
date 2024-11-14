-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`user` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mood`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`mood` ;

CREATE TABLE IF NOT EXISTS `mydb`.`mood` (
  `mood_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mood_name` VARCHAR(15) NOT NULL,
  `mood_img` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mood_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mood_entry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`mood_entry` ;

CREATE TABLE IF NOT EXISTS `mydb`.`mood_entry` (
  `user_id` INT UNSIGNED NOT NULL,
  `mood_id` INT UNSIGNED NOT NULL,
  `datetime` DATETIME NOT NULL,
  `journal` VARCHAR(150) NULL,
  `mood_entry_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  INDEX `fk_user_has_mood_mood2_idx` (`mood_id` ASC) VISIBLE,
  INDEX `fk_user_has_mood_user1_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`mood_entry_id`),
  CONSTRAINT `fk_user_has_mood_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_mood_mood2`
    FOREIGN KEY (`mood_id`)
    REFERENCES `mydb`.`mood` (`mood_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
