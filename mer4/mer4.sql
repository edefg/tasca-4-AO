-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mer4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mer4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mer4` ;
USE `mer4` ;

-- -----------------------------------------------------
-- Table `mer4`.`CLIENT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer4`.`CLIENT` (
  `nom` VARCHAR(45) NULL,
  `DNI` INT NOT NULL,
  `cognom` VARCHAR(45) NULL,
  `adreça` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `NºVIP` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`));


-- -----------------------------------------------------
-- Table `mer4`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer4`.`Venedor` (
  `DNI` TIMESTAMP NOT NULL,
  `nom` VARCHAR(45) NULL,
  `identificador` VARCHAR(45) NULL,
  PRIMARY KEY (`DNI`));


-- -----------------------------------------------------
-- Table `mer4`.`TIPUS_POLISSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer4`.`TIPUS_POLISSA` (
  `ID` INT(9) NOT NULL,
  `nom` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `mer4`.`POLISSA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mer4`.`POLISSA` (
  `preu_anual` INT NULL,
  `tipus_pagament` VARCHAR(45) NULL,
  `data_contractacio` VARCHAR(45) NULL,
  `Venedor_DNI` TIMESTAMP NOT NULL,
  `CLIENT_DNI` INT NOT NULL,
  `TIPUS_POLISSA_ID` INT(9) NOT NULL,
  `num polissa` VARCHAR(45) NOT NULL,
  INDEX `fk_POLISSA_Venedor_idx` (`Venedor_DNI` ASC) VISIBLE,
  INDEX `fk_POLISSA_CLIENT1_idx` (`CLIENT_DNI` ASC) VISIBLE,
  INDEX `fk_POLISSA_TIPUS_POLISSA1_idx` (`TIPUS_POLISSA_ID` ASC) VISIBLE,
  PRIMARY KEY (`num polissa`),
  CONSTRAINT `fk_POLISSA_Venedor`
    FOREIGN KEY (`Venedor_DNI`)
    REFERENCES `mer4`.`Venedor` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_POLISSA_CLIENT1`
    FOREIGN KEY (`CLIENT_DNI`)
    REFERENCES `mer4`.`CLIENT` (`DNI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_POLISSA_TIPUS_POLISSA1`
    FOREIGN KEY (`TIPUS_POLISSA_ID`)
    REFERENCES `mer4`.`TIPUS_POLISSA` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
