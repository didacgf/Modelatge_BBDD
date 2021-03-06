-- MySQL Script generated by MySQL Workbench
-- Thu Oct  1 18:18:36 2020
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`Adreça`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Adreça` (
  `idAdreça` INT NOT NULL AUTO_INCREMENT,
  `carrer` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `pis` INT NOT NULL,
  `porta` INT NOT NULL,
  `ciutat` VARCHAR(45) NOT NULL,
  `codi_postal` INT NOT NULL,
  `pais` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`idAdreça`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Clients` (
  `idClients` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(45) NOT NULL,
  `telefon` INT NOT NULL,
  `correu_electronic` VARCHAR(45) NOT NULL,
  `data_registre` DATETIME NOT NULL,
  `idClients_Recom` INT NULL,
  PRIMARY KEY (`idClients`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ulleres` (
  `idUlleres` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(15) NOT NULL,
  `graduacio` DECIMAL(4) NOT NULL,
  `montura` VARCHAR(10) NOT NULL,
  `color_montura` VARCHAR(45) NOT NULL,
  `color_vidre` VARCHAR(45) NOT NULL,
  `preu` INT NOT NULL,
  `Clients_idClients` INT NOT NULL,
  PRIMARY KEY (`idUlleres`, `Clients_idClients`),
  INDEX `fk_Ulleres_Clients1_idx` (`Clients_idClients` ASC) VISIBLE,
  CONSTRAINT `fk_Ulleres_Clients1`
    FOREIGN KEY (`Clients_idClients`)
    REFERENCES `mydb`.`Clients` (`idClients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Proveïdor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proveïdor` (
  `idProveïdor` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `Adreça_idAdreça` INT NOT NULL,
  `telefon` INT NOT NULL,
  `fax` INT NULL,
  `CIF` VARCHAR(10) NOT NULL,
  `Ulleres_idUlleres` INT NOT NULL,
  PRIMARY KEY (`idProveïdor`, `Adreça_idAdreça`, `Ulleres_idUlleres`),
  INDEX `fk_Proveïdor_Adreça_idx` (`Adreça_idAdreça` ASC) VISIBLE,
  INDEX `fk_Proveïdor_Ulleres1_idx` (`Ulleres_idUlleres` ASC) VISIBLE,
  CONSTRAINT `fk_Proveïdor_Adreça`
    FOREIGN KEY (`Adreça_idAdreça`)
    REFERENCES `mydb`.`Adreça` (`idAdreça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Proveïdor_Ulleres1`
    FOREIGN KEY (`Ulleres_idUlleres`)
    REFERENCES `mydb`.`Ulleres` (`idUlleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleat` (
  `idEmpleat` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognom` VARCHAR(45) NOT NULL,
  `Ulleres_idUlleres` INT NOT NULL,
  PRIMARY KEY (`idEmpleat`, `Ulleres_idUlleres`),
  INDEX `fk_Empleat_Ulleres1_idx` (`Ulleres_idUlleres` ASC) VISIBLE,
  CONSTRAINT `fk_Empleat_Ulleres1`
    FOREIGN KEY (`Ulleres_idUlleres`)
    REFERENCES `mydb`.`Ulleres` (`idUlleres`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
