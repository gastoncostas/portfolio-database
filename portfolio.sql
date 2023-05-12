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
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `fechaNac` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`url_img`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`url_img` (
  `id` INT NOT NULL,
  `foto_perfil` VARCHAR(100) NOT NULL,
  `background` VARCHAR(100) NOT NULL,
  `facebook_logo` VARCHAR(100) NOT NULL,
  `github_logo` VARCHAR(100) NOT NULL,
  `linkedin_logo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `portfolio`.`objetivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`objetivos` (
  `id` INT NOT NULL,
  `contenido` VARCHAR(200) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_objetivos_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_objetivos_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`habilidades` (
  `id` INT NOT NULL,
  `contenido` VARCHAR(200) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_habilidades_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_habilidades_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`formacion_academica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`formacion_academica` (
  `id` INT NOT NULL,
  `contenido` VARCHAR(200) NOT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_formacion_academica_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_formacion_academica_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`header`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`header` (
  `id` INT NOT NULL,
  `foto_perfil` VARCHAR(100) NOT NULL,
  `background` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`header_tiene_url_img`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`header_tiene_url_img` (
  `header_id` INT NOT NULL,
  `url_img_id` INT NOT NULL,
  PRIMARY KEY (`header_id`, `url_img_id`),
  INDEX `fk_header_has_url_img_url_img1_idx` (`url_img_id` ASC) VISIBLE,
  INDEX `fk_header_has_url_img_header_idx` (`header_id` ASC) VISIBLE,
  CONSTRAINT `fk_header_has_url_img_header`
    FOREIGN KEY (`header_id`)
    REFERENCES `portfolio`.`header` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_header_has_url_img_url_img1`
    FOREIGN KEY (`url_img_id`)
    REFERENCES `portfolio`.`url_img` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`logos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`logos` (
  `id` INT NOT NULL,
  `facebook_logo` VARCHAR(100) NOT NULL,
  `linkedin_logo` VARCHAR(100) NOT NULL,
  `github_logo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`logos_tiene_url_img`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`logos_tiene_url_img` (
  `logos_id` INT NOT NULL,
  `url_img_id` INT NOT NULL,
  PRIMARY KEY (`logos_id`, `url_img_id`),
  INDEX `fk_logos_has_url_img_url_img1_idx` (`url_img_id` ASC) VISIBLE,
  INDEX `fk_logos_has_url_img_logos1_idx` (`logos_id` ASC) VISIBLE,
  CONSTRAINT `fk_logos_has_url_img_logos1`
    FOREIGN KEY (`logos_id`)
    REFERENCES `portfolio`.`logos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_logos_has_url_img_url_img1`
    FOREIGN KEY (`url_img_id`)
    REFERENCES `portfolio`.`url_img` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
