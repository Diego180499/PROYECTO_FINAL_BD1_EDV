-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema registroacademico_f1
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `registroacademico_f1` ;

-- -----------------------------------------------------
-- Schema registroacademico_f1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `registroacademico_f1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `registroacademico_f1` ;

-- -----------------------------------------------------
-- Table `registroacademico_f1`.`estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`estudiante` (
  `carne` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `ingreso_familiar` DECIMAL(10,2) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `telefono` VARCHAR(15) NULL,
  `correo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`carne`),
  UNIQUE INDEX `carne_UNIQUE` (`carne` ASC) VISIBLE,
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC) VISIBLE)



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`curso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `creditos` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`edificio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`edificio` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`salon`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`salon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_edificio` INT NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `capacidad` INT NOT NULL,
  `nivel` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_edificio` (`id_edificio` ASC) VISIBLE,
  CONSTRAINT `salon_ibfk_1`
    FOREIGN KEY (`id_edificio`)
    REFERENCES `registroacademico_f1`.`edificio` (`id`))



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`catedratico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`catedratico` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `sueldo_mensual` DECIMAL(10,2) NOT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  `correo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE,
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC) VISIBLE)



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`ciclo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`ciclo` (
  `id` CHAR(2) NOT NULL,
  `ciclo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `ciclo_UNIQUE` (`ciclo` ASC) VISIBLE)



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`seccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`seccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_curso` INT NOT NULL,
  `id_salon` INT NOT NULL,
  `id_catedratico` INT NOT NULL,
  `id_ciclo` CHAR(2) NOT NULL,
  `seccion` CHAR(1) NOT NULL,
  `anio` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_curso` (`id_curso` ASC) VISIBLE,
  INDEX `id_salon` (`id_salon` ASC) VISIBLE,
  INDEX `id_catedratico` (`id_catedratico` ASC) VISIBLE,
  INDEX `id_ciclo` (`id_ciclo` ASC) VISIBLE,
  CONSTRAINT `seccion_ibfk_1`
    FOREIGN KEY (`id_curso`)
    REFERENCES `registroacademico_f1`.`curso` (`id`),
  CONSTRAINT `seccion_ibfk_2`
    FOREIGN KEY (`id_salon`)
    REFERENCES `registroacademico_f1`.`salon` (`id`),
  CONSTRAINT `seccion_ibfk_3`
    FOREIGN KEY (`id_catedratico`)
    REFERENCES `registroacademico_f1`.`catedratico` (`codigo`),
  CONSTRAINT `seccion_ibfk_4`
    FOREIGN KEY (`id_ciclo`)
    REFERENCES `registroacademico_f1`.`ciclo` (`id`))



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`asignacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`asignacion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_estudiante` INT NOT NULL,
  `id_seccion` INT NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_estudiante` (`id_estudiante` ASC) VISIBLE,
  INDEX `id_seccion` (`id_seccion` ASC) VISIBLE,
  CONSTRAINT `asignacion_ibfk_1`
    FOREIGN KEY (`id_estudiante`)
    REFERENCES `registroacademico_f1`.`estudiante` (`carne`),
  CONSTRAINT `asignacion_ibfk_2`
    FOREIGN KEY (`id_seccion`)
    REFERENCES `registroacademico_f1`.`seccion` (`id`))



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`acta_nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`acta_nota` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_asignacion` INT NOT NULL,
  `zona_obtenida` INT NOT NULL,
  `nota_examen_final` INT NOT NULL,
  `fecha` DATE NOT NULL,
  CHECK (zona_obtenida BETWEEN 1 AND 100),
  CHECK (nota_examen_final BETWEEN 1 AND 100),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_asignacion` (`id_asignacion` ASC) VISIBLE,
  CONSTRAINT `acta_nota_ibfk_1`
    FOREIGN KEY (`id_asignacion`)
    REFERENCES `registroacademico_f1`.`asignacion` (`id`))



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`aprobacion_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`aprobacion_curso` (
  `id` INT NOT NULL,
  `acta_nota_codigo` INT NOT NULL,
  `aprobado` TINYINT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `codigo_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_aprobacion_curso_acta_nota_idx` (`acta_nota_codigo` ASC) VISIBLE,
  CONSTRAINT `fk_aprobacion_curso_acta_nota`
    FOREIGN KEY (`acta_nota_codigo`)
    REFERENCES `registroacademico_f1`.`acta_nota` (`id`))



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`unidad_academica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`unidad_academica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `unidad` VARCHAR(100) NOT NULL,
  `ubicacion` VARCHAR(100) NULL DEFAULT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  `sitio_web` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `unidad_UNIQUE` (`unidad` ASC) VISIBLE,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`carrera` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_unidad_academica` INT NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `codigo_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  INDEX `id_unidad_academica` (`id_unidad_academica` ASC) VISIBLE,
  CONSTRAINT `carrera_ibfk_1`
    FOREIGN KEY (`id_unidad_academica`)
    REFERENCES `registroacademico_f1`.`unidad_academica` (`id`))



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`jornada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`jornada` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `jornada` VARCHAR(50) NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_fin` TIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `jornada_UNIQUE` (`jornada` ASC) VISIBLE)



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`semestre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`semestre` (
  `id` CHAR(3) NOT NULL,
  `semestre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `semestre_UNIQUE` (`semestre` ASC) VISIBLE)



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`pensum`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`pensum` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_carrera` INT NOT NULL,
  `id_jornada` INT NOT NULL,
  `id_semestre_inicio` CHAR(3) NOT NULL,
  `id_semestre_fin` CHAR(3) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `anio_inicio` INT NOT NULL,
  `anio_fin` INT NULL DEFAULT NULL,
  `creditos_cierre` INT NOT NULL,
  `cantidad_semestres` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_carrera` (`id_carrera` ASC) VISIBLE,
  INDEX `id_jornada` (`id_jornada` ASC) VISIBLE,
  INDEX `id_semestre_fin` (`id_semestre_fin` ASC) VISIBLE,
  INDEX `fk_pensum_semestre1_idx` (`id_semestre_inicio` ASC) VISIBLE,
  CONSTRAINT `pensum_ibfk_1`
    FOREIGN KEY (`id_carrera`)
    REFERENCES `registroacademico_f1`.`carrera` (`id`),
  CONSTRAINT `pensum_ibfk_2`
    FOREIGN KEY (`id_jornada`)
    REFERENCES `registroacademico_f1`.`jornada` (`id`),
  CONSTRAINT `pensum_ibfk_4`
    FOREIGN KEY (`id_semestre_fin`)
    REFERENCES `registroacademico_f1`.`semestre` (`id`),
  CONSTRAINT `fk_pensum_semestre1`
    FOREIGN KEY (`id_semestre_inicio`)
    REFERENCES `registroacademico_f1`.`semestre` (`id`))



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`curso_pensum`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`curso_pensum` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_pensum` INT NOT NULL,
  `id_curso` INT NOT NULL,
  `id_semestre` CHAR(3) NOT NULL,
  `obligatorio` TINYINT(1) NOT NULL,
  `nota_aprobacion` INT NOT NULL,
  `zona_minima` INT NOT NULL,
  CHECK (nota_aprobacion BETWEEN 1 AND 100),
  CHECK (zona_minima BETWEEN 1 AND 100),
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_pensum` (`id_pensum` ASC) VISIBLE,
  INDEX `id_curso` (`id_curso` ASC) VISIBLE,
  INDEX `id_semestre` (`id_semestre` ASC) VISIBLE,
  CONSTRAINT `curso_pensum_ibfk_1`
    FOREIGN KEY (`id_pensum`)
    REFERENCES `registroacademico_f1`.`pensum` (`id`),
  CONSTRAINT `curso_pensum_ibfk_2`
    FOREIGN KEY (`id_curso`)
    REFERENCES `registroacademico_f1`.`curso` (`id`),
  CONSTRAINT `curso_pensum_ibfk_3`
    FOREIGN KEY (`id_semestre`)
    REFERENCES `registroacademico_f1`.`semestre` (`id`))



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`curso_prerrequisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`curso_prerrequisito` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_curso_pensum` INT NOT NULL,
  `id_curso_prerrequisito` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_curso_pensum` (`id_curso_pensum` ASC) VISIBLE,
  INDEX `id_curso_prerrequisito` (`id_curso_prerrequisito` ASC) VISIBLE,
  CONSTRAINT `curso_prerrequisito_ibfk_1`
    FOREIGN KEY (`id_curso_pensum`)
    REFERENCES `registroacademico_f1`.`curso_pensum` (`id`),
  CONSTRAINT `curso_prerrequisito_ibfk_2`
    FOREIGN KEY (`id_curso_prerrequisito`)
    REFERENCES `registroacademico_f1`.`curso` (`id`))



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`dia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`dia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dia` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `dia_UNIQUE` (`dia` ASC) VISIBLE)



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`dia_seccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`dia_seccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_seccion` INT NOT NULL,
  `id_dia` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_seccion` (`id_seccion` ASC) VISIBLE,
  INDEX `id_dia` (`id_dia` ASC) VISIBLE,
  CONSTRAINT `dia_seccion_ibfk_1`
    FOREIGN KEY (`id_seccion`)
    REFERENCES `registroacademico_f1`.`seccion` (`id`),
  CONSTRAINT `dia_seccion_ibfk_2`
    FOREIGN KEY (`id_dia`)
    REFERENCES `registroacademico_f1`.`dia` (`id`))



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`inscripcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`inscripcion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_estudiante` INT NOT NULL,
  `id_pensum` INT NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_estudiante` (`id_estudiante` ASC) VISIBLE,
  INDEX `id_pensum` (`id_pensum` ASC) VISIBLE,
  CONSTRAINT `inscripcion_ibfk_1`
    FOREIGN KEY (`id_estudiante`)
    REFERENCES `registroacademico_f1`.`estudiante` (`carne`),
  CONSTRAINT `inscripcion_ibfk_2`
    FOREIGN KEY (`id_pensum`)
    REFERENCES `registroacademico_f1`.`pensum` (`id`))



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`periodo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_jornada` INT NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_fin` TIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `codigo_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_jornada` (`id_jornada` ASC) VISIBLE,
  CONSTRAINT `periodo_ibfk_1`
    FOREIGN KEY (`id_jornada`)
    REFERENCES `registroacademico_f1`.`jornada` (`id`))



-- -----------------------------------------------------
-- Table `registroacademico_f1`.`periodo_seccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`periodo_seccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_seccion` INT NOT NULL,
  `id_periodo` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_seccion` (`id_seccion` ASC) VISIBLE,
  INDEX `id_periodo` (`id_periodo` ASC) VISIBLE,
  CONSTRAINT `periodo_seccion_ibfk_1`
    FOREIGN KEY (`id_seccion`)
    REFERENCES `registroacademico_f1`.`seccion` (`id`),
  CONSTRAINT `periodo_seccion_ibfk_2`
    FOREIGN KEY (`id_periodo`)
    REFERENCES `registroacademico_f1`.`periodo` (`id`))







SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;