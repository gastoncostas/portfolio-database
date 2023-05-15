-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET utf8 ;
USE `portfolio` ;

-- -----------------------------------------------------
-- Table `portfolio`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`persona` (
  `ID_PERSONA` INT NOT NULL AUTO_INCREMENT,
  `fechaNac` VARCHAR(12) NOT NULL,
  `nacionalidad` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(35) NOT NULL,
  `apellido` VARCHAR(35) NOT NULL,
  `linkedin` VARCHAR(100) NOT NULL,
  `github` VARCHAR(100) NOT NULL,
  `facebook` VARCHAR(100) NOT NULL,
  `portfolio_ID_PORTFOLIO` INT NOT NULL,
  PRIMARY KEY (`ID_PERSONA`, `portfolio_ID_PORTFOLIO`),
  UNIQUE INDEX `idPersona_UNIQUE` (`ID_PERSONA` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`portfolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`portfolio` (
  `ID_PORTFOLIO` INT NOT NULL AUTO_INCREMENT,
  `persona_ID_PERSONA` INT NOT NULL,
  `persona_portfolio_ID_PORTFOLIO` INT NOT NULL,
  PRIMARY KEY (`ID_PORTFOLIO`, `persona_ID_PERSONA`, `persona_portfolio_ID_PORTFOLIO`),
  UNIQUE INDEX `idPortfolio_UNIQUE` (`ID_PORTFOLIO` ASC) VISIBLE,
  INDEX `fk_portfolio_persona1_idx` (`persona_ID_PERSONA` ASC, `persona_portfolio_ID_PORTFOLIO` ASC) VISIBLE,
  CONSTRAINT `fk_portfolio_persona1`
    FOREIGN KEY (`persona_ID_PERSONA` , `persona_portfolio_ID_PORTFOLIO`)
    REFERENCES `portfolio`.`persona` (`ID_PERSONA` , `portfolio_ID_PORTFOLIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`objetivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`objetivos` (
  `ID_PERSONA` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(200) NOT NULL,
  `persona_ID_PERSONA` INT NOT NULL,
  `persona_portfolio_ID_PORTFOLIO` INT NOT NULL,
  PRIMARY KEY (`ID_PERSONA`, `persona_ID_PERSONA`, `persona_portfolio_ID_PORTFOLIO`),
  UNIQUE INDEX `idObjetivos_UNIQUE` (`ID_PERSONA` ASC) VISIBLE,
  INDEX `fk_objetivos_persona1_idx` (`persona_ID_PERSONA` ASC, `persona_portfolio_ID_PORTFOLIO` ASC) VISIBLE,
  CONSTRAINT `fk_objetivos_persona1`
    FOREIGN KEY (`persona_ID_PERSONA` , `persona_portfolio_ID_PORTFOLIO`)
    REFERENCES `portfolio`.`persona` (`ID_PERSONA` , `portfolio_ID_PORTFOLIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`habilidades` (
  `ID_PERSONA` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `persona_ID_PERSONA` INT NOT NULL,
  `persona_portfolio_ID_PORTFOLIO` INT NOT NULL,
  PRIMARY KEY (`ID_PERSONA`, `persona_ID_PERSONA`, `persona_portfolio_ID_PORTFOLIO`),
  UNIQUE INDEX `idHabilidades_UNIQUE` (`ID_PERSONA` ASC) VISIBLE,
  INDEX `fk_habilidades_persona1_idx` (`persona_ID_PERSONA` ASC, `persona_portfolio_ID_PORTFOLIO` ASC) VISIBLE,
  CONSTRAINT `fk_habilidades_persona1`
    FOREIGN KEY (`persona_ID_PERSONA` , `persona_portfolio_ID_PORTFOLIO`)
    REFERENCES `portfolio`.`persona` (`ID_PERSONA` , `portfolio_ID_PORTFOLIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`formacionAcademica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`formacionAcademica` (
  `ID_PERSONA` INT NOT NULL AUTO_INCREMENT,
  `institucion` VARCHAR(100) NOT NULL,
  `inicio` VARCHAR(12) NOT NULL,
  `fin` VARCHAR(12) NOT NULL,
  `url` VARCHAR(100) NOT NULL,
  `persona_ID_PERSONA` INT NOT NULL,
  `persona_portfolio_ID_PORTFOLIO` INT NOT NULL,
  PRIMARY KEY (`ID_PERSONA`, `persona_ID_PERSONA`, `persona_portfolio_ID_PORTFOLIO`),
  INDEX `fk_formacionAcademica_persona1_idx` (`persona_ID_PERSONA` ASC, `persona_portfolio_ID_PORTFOLIO` ASC) VISIBLE,
  CONSTRAINT `fk_formacionAcademica_persona1`
    FOREIGN KEY (`persona_ID_PERSONA` , `persona_portfolio_ID_PORTFOLIO`)
    REFERENCES `portfolio`.`persona` (`ID_PERSONA` , `portfolio_ID_PORTFOLIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`urlFotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`urlFotos` (
  `ID_PERSONA` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(200) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `portfolio_ID_PORTFOLIO` INT NOT NULL,
  PRIMARY KEY (`ID_PERSONA`, `portfolio_ID_PORTFOLIO`),
  UNIQUE INDEX `idUrlFotos_UNIQUE` (`ID_PERSONA` ASC) VISIBLE,
  INDEX `fk_urlFotos_portfolio_idx` (`portfolio_ID_PORTFOLIO` ASC) VISIBLE,
  CONSTRAINT `fk_urlFotos_portfolio`
    FOREIGN KEY (`portfolio_ID_PORTFOLIO`)
    REFERENCES `portfolio`.`portfolio` (`ID_PORTFOLIO`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
