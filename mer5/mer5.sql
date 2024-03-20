-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex5.taller mecanic
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex5.taller mecanic
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex5.taller mecanic` ;
USE `Ex5.taller mecanic` ;

-- -----------------------------------------------------
-- Table `Ex5.taller mecanic`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5.taller mecanic`.`client` (
  `DNI` VARCHAR(9) NOT NULL,
  `Cognom` VARCHAR(45) NULL,
  `direccio` VARCHAR(45) NULL,
  `municipi` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `user` VARCHAR(45) NULL,
  `pwd` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`));


-- -----------------------------------------------------
-- Table `Ex5.taller mecanic`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5.taller mecanic`.`Vehicle` (
  `matricula` VARCHAR(10) NULL,
  `model` VARCHAR(45) NULL,
  `marca` VARCHAR(45) NULL,
  `any_matriculacio` VARCHAR(45) NULL,
  `num_bastidor` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`num_bastidor`));


-- -----------------------------------------------------
-- Table `Ex5.taller mecanic`.`CLIENT_VEHICLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5.taller mecanic`.`CLIENT_VEHICLE` (
  `any_compra` TIMESTAMP NULL,
  `any_venta` VARCHAR(45) NULL,
  `data_darrera_revisio` VARCHAR(45) NULL,
  `ID` INT NOT NULL,
  `client_DNI` VARCHAR(9) NOT NULL,
  `Vehicle_num_bastidor` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_CLIENT_VEHICLE_client_idx` (`client_DNI` ASC) VISIBLE,
  INDEX `fk_CLIENT_VEHICLE_Vehicle1_idx` (`Vehicle_num_bastidor` ASC) VISIBLE,
  CONSTRAINT `fk_CLIENT_VEHICLE_client`
    FOREIGN KEY (`client_DNI`)
    REFERENCES `Ex5.taller mecanic`.`client` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CLIENT_VEHICLE_Vehicle1`
    FOREIGN KEY (`Vehicle_num_bastidor`)
    REFERENCES `Ex5.taller mecanic`.`Vehicle` (`num_bastidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Ex5.taller mecanic`.`cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5.taller mecanic`.`cita` (
  `ID` INT NOT NULL,
  `data` DATE NULL,
  `lloc` VARCHAR(100) NULL,
  `CLIENT_VEHICLE_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_cita_CLIENT_VEHICLE1_idx` (`CLIENT_VEHICLE_ID` ASC) VISIBLE,
  CONSTRAINT `fk_cita_CLIENT_VEHICLE1`
    FOREIGN KEY (`CLIENT_VEHICLE_ID`)
    REFERENCES `Ex5.taller mecanic`.`CLIENT_VEHICLE` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Ex5.taller mecanic`.`Tipus_vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex5.taller mecanic`.`Tipus_vehicle` (
  `ID` INT NOT NULL,
  `Nom` VARCHAR(100) NULL,
  `Vehicle_num_bastidor` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Tipus_vehicle_Vehicle1_idx` (`Vehicle_num_bastidor` ASC) VISIBLE,
  CONSTRAINT `fk_Tipus_vehicle_Vehicle1`
    FOREIGN KEY (`Vehicle_num_bastidor`)
    REFERENCES `Ex5.taller mecanic`.`Vehicle` (`num_bastidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
