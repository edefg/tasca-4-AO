-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Mer7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Mer7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Mer7` ;
USE `Mer7` ;

-- -----------------------------------------------------
-- Table `Mer7`.`Empleats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer7`.`Empleats` (
  `DNI` VARCHAR(9) NULL,
  `ID` INT NOT NULL,
  `cognom` VARCHAR(45) NULL,
  `direccio` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `Mer7`.`Tickwt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer7`.`Tickwt` (
  `Num` INT NOT NULL,
  `num_factuta` VARCHAR(45) NULL,
  `NIF` VARCHAR(45) NULL,
  `domicui_fiscal` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `web` VARCHAR(45) NULL,
  `correu` VARCHAR(45) NULL,
  `data` DATE NULL COMMENT '	',
  `Empleats_ID` INT NOT NULL,
  PRIMARY KEY (`Num`),
  INDEX `fk_Tickwt_Empleats_idx` (`Empleats_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Tickwt_Empleats`
    FOREIGN KEY (`Empleats_ID`)
    REFERENCES `Mer7`.`Empleats` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Mer7`.`producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer7`.`producte` (
  `nom` TIMESTAMP NULL,
  `descripccio` VARCHAR(45) NULL,
  `IVA` VARCHAR(45) NULL,
  `preu_unitari` VARCHAR(45) NULL,
  `ID` INT NOT NULL,
  PRIMARY KEY (`ID`));


-- -----------------------------------------------------
-- Table `Mer7`.`Linia_Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer7`.`Linia_Ticket` (
  `ID` INT NOT NULL,
  `quantitat` VARCHAR(45) NULL,
  `descompte` VARCHAR(45) NULL,
  `Tickwt_Num` INT NOT NULL,
  `producte_ID` INT NOT NULL,
  INDEX `fk_Linia_Ticket_Tickwt1_idx` (`Tickwt_Num` ASC) VISIBLE,
  PRIMARY KEY (`ID`),
  INDEX `fk_Linia_Ticket_producte1_idx` (`producte_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Linia_Ticket_Tickwt1`
    FOREIGN KEY (`Tickwt_Num`)
    REFERENCES `Mer7`.`Tickwt` (`Num`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linia_Ticket_producte1`
    FOREIGN KEY (`producte_ID`)
    REFERENCES `Mer7`.`producte` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Mer7`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Mer7`.`Client` (
  `ID` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  `direccio` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
