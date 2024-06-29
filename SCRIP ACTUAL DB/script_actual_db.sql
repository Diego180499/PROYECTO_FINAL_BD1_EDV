-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema registroacademico_f1
-- -----------------------------------------------------

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
  `dpi` VARCHAR(13) NULL DEFAULT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `apellido` VARCHAR(100) NULL DEFAULT NULL,
  `ingreso_familiar` DECIMAL(10,2) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `telefono` INT NULL DEFAULT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `direccion` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`carne`),
  UNIQUE INDEX `carne_UNIQUE` (`carne` ASC) VISIBLE,
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 790
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `registroacademico_f1`.`catedratico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`catedratico` (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `sueldo_mensual` DECIMAL(10,2) NOT NULL,
  `sueldo_letras` TEXT NULL DEFAULT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  `correo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE INDEX `codigo_UNIQUE` (`codigo` ASC) VISIBLE,
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `registroacademico_f1`.`ciclo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`ciclo` (
  `id` CHAR(2) NOT NULL,
  `ciclo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `ciclo_UNIQUE` (`ciclo` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `registroacademico_f1`.`acta_nota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`acta_nota` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_asignacion` INT NOT NULL,
  `zona_obtenida` INT NOT NULL,
  `nota_examen_final` INT NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_asignacion` (`id_asignacion` ASC) VISIBLE,
  CONSTRAINT `acta_nota_ibfk_1`
    FOREIGN KEY (`id_asignacion`)
    REFERENCES `registroacademico_f1`.`asignacion` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `registroacademico_f1`.`semestre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`semestre` (
  `id` CHAR(3) NOT NULL,
  `semestre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `semestre_UNIQUE` (`semestre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
  CONSTRAINT `fk_pensum_semestre1`
    FOREIGN KEY (`id_semestre_inicio`)
    REFERENCES `registroacademico_f1`.`semestre` (`id`),
  CONSTRAINT `pensum_ibfk_1`
    FOREIGN KEY (`id_carrera`)
    REFERENCES `registroacademico_f1`.`carrera` (`id`),
  CONSTRAINT `pensum_ibfk_2`
    FOREIGN KEY (`id_jornada`)
    REFERENCES `registroacademico_f1`.`jornada` (`id`),
  CONSTRAINT `pensum_ibfk_4`
    FOREIGN KEY (`id_semestre_fin`)
    REFERENCES `registroacademico_f1`.`semestre` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `registroacademico_f1`.`creditos_prerrequisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`creditos_prerrequisito` (
  `id` INT NOT NULL,
  `creditos_requeridos` VARCHAR(45) NOT NULL,
  `curso_pensum_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_creditos_prerrequisito_curso_pensum1_idx` (`curso_pensum_id` ASC) VISIBLE,
  CONSTRAINT `fk_creditos_prerrequisito_curso_pensum1`
    FOREIGN KEY (`curso_pensum_id`)
    REFERENCES `registroacademico_f1`.`curso_pensum` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `registroacademico_f1`.`desasignacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`desasignacion` (
  `id` INT NOT NULL,
  `id_asignacion` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `motivo` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_desasignacion_asignacion1_idx` (`id_asignacion` ASC) VISIBLE,
  CONSTRAINT `fk_desasignacion_asignacion1`
    FOREIGN KEY (`id_asignacion`)
    REFERENCES `registroacademico_f1`.`asignacion` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `registroacademico_f1`.`dia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`dia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dia` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `dia_UNIQUE` (`dia` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


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
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `registroacademico_f1`.`tipo_transaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`tipo_transaccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `registroacademico_f1`.`transacciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`transacciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_transaccion` INT NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `codigo_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `id_tipo_transaccion` (`id_tipo_transaccion` ASC) VISIBLE,
  CONSTRAINT `transacciones_ibfk_1`
    FOREIGN KEY (`id_tipo_transaccion`)
    REFERENCES `registroacademico_f1`.`tipo_transaccion` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `registroacademico_f1` ;

-- -----------------------------------------------------
-- Placeholder table for view `registroacademico_f1`.`catedratico_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`catedratico_curso` (`id_curso` INT, `curso` INT, `seccion` INT, `id_catedratico` INT, `nombre_catedratico` INT);

-- -----------------------------------------------------
-- Placeholder table for view `registroacademico_f1`.`catedratico_sistemas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`catedratico_sistemas` (`codigo` INT, `nombre` INT, `apellido` INT, `ciclo_id` INT, `ciclo` INT, `carrera_id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `registroacademico_f1`.`consulta2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`consulta2` (`id_curso` INT, `curso_nombre` INT, `carrera` INT, `seccion` INT, `hora_inicio` INT, `hora_fin` INT, `dia` INT, `salon` INT, `edificio` INT, `catedratico` INT, `ciclo_id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `registroacademico_f1`.`curso_postrequisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`curso_postrequisito` (`id_curso_postrequisito` INT, `curso_postrequisito` INT, `creditos` INT, `id_curso` INT, `curso` INT);

-- -----------------------------------------------------
-- Placeholder table for view `registroacademico_f1`.`curso_prerequisito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`curso_prerequisito` (`id_curso_prerequisito` INT, `curso_prerequisito` INT, `creditos` INT, `id_curso` INT, `curso` INT);

-- -----------------------------------------------------
-- Placeholder table for view `registroacademico_f1`.`estudiante_creditos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`estudiante_creditos` (`carne` INT, `nombre` INT, `total_creditos` INT);

-- -----------------------------------------------------
-- Placeholder table for view `registroacademico_f1`.`estudiante_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`estudiante_curso` (`carne` INT, `estudiante` INT, `curso_id` INT, `curso` INT, `seccion_id` INT, `seccion` INT);

-- -----------------------------------------------------
-- Placeholder table for view `registroacademico_f1`.`estudiante_curso_aprobado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`estudiante_curso_aprobado` (`carne` INT, `estudiante` INT, `codigo_curso` INT, `curso` INT, `codigo` INT, `ciclo_id` INT, `aprobado` INT);

-- -----------------------------------------------------
-- Placeholder table for view `registroacademico_f1`.`estudiantes_curso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`estudiantes_curso` (`carne` INT, `estudiante` INT, `seccion_id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `registroacademico_f1`.`promedio_estudiante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `registroacademico_f1`.`promedio_estudiante` (`carne` INT, `nombre` INT, `promedio` INT, `id` INT, `fecha` INT);

-- -----------------------------------------------------
-- procedure InsertCarrera
-- -----------------------------------------------------

DELIMITER $$
USE `registroacademico_f1`$$
CREATE DEFINER=`diego`@`localhost` PROCEDURE `InsertCarrera`(IN id_unidad_academica_param INT, IN nombre_param VARCHAR(100))
BEGIN
    -- Verificar que el nombre de la carrera solo contenga letras y espacios
    IF NOT (nombre_param REGEXP '^[a-zA-Z ]+$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre de la carrera debe contener solo letras y espacios';
    ELSE
        -- Verificar si ya existe una carrera con el mismo nombre
        IF EXISTS (SELECT * FROM registroacademico_f1.carrera WHERE nombre = nombre_param) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La carrera ya existe';
        ELSE
            -- Insertar la nueva carrera
            INSERT INTO registroacademico_f1.carrera (id_unidad_academica, nombre) VALUES (id_unidad_academica_param, nombre_param);
        END IF;
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure insertarEstudiante
-- -----------------------------------------------------

DELIMITER $$
USE `registroacademico_f1`$$
CREATE DEFINER=`diego`@`localhost` PROCEDURE `insertarEstudiante`(
    IN carnet_p INT,
    IN nombre_p VARCHAR(50), 
    IN apellido_p VARCHAR(50),
    IN fecha_nacimiento_p DATE, 
    IN correo_p VARCHAR(100), 
    IN telefono_p VARCHAR(15),
    IN direccion_p VARCHAR(100), 
    IN dpi_p VARCHAR(20),
    IN carrera_p INT,
    IN jornada_id INT
)
BEGIN
    DECLARE id_pensum_var INT;
    
    -- Validar nombre y apellido
    IF NOT (nombre_p REGEXP '^[a-zA-Z ]+$' AND apellido_p REGEXP '^[a-zA-Z ]+$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre o apellido debe contener solo letras y espacios';
    ELSE 
        -- Validar correo
        IF NOT (correo_p REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$') THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El correo no es válido';
        ELSE
            -- Validar telefono
            IF NOT (telefono_p REGEXP '^[0-9]{2,5}$') THEN
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'El teléfono no es válido';
            ELSE
                -- Verificar existencia en pensum
                IF EXISTS (SELECT * FROM pensum WHERE id_carrera = carrera_p AND id_jornada = jornada_id LIMIT 1) THEN
                    INSERT INTO estudiante(carne, nombre, apellido, fecha_nacimiento, correo, telefono, direccion, dpi)
                    VALUES (carnet_p, nombre_p, apellido_p, fecha_nacimiento_p, correo_p, telefono_p, direccion_p, dpi_p);
                    
                    SELECT id INTO id_pensum_var 
                    FROM pensum 
                    WHERE id_carrera = carrera_p AND id_jornada = jornada_id 
                    LIMIT 1;
                    
                    INSERT INTO inscripcion (id_estudiante, id_pensum, fecha) 
                    VALUES (carnet_p, id_pensum_var, NOW());
                ELSE
                    SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Error al insertar un estudiante/asignacion';
                END IF;
            END IF;
        END IF;
    END IF;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `registroacademico_f1`.`catedratico_curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroacademico_f1`.`catedratico_curso`;
USE `registroacademico_f1`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`diego`@`localhost` SQL SECURITY DEFINER VIEW `registroacademico_f1`.`catedratico_curso` AS select `registroacademico_f1`.`curso`.`id` AS `id_curso`,`registroacademico_f1`.`curso`.`nombre` AS `curso`,`registroacademico_f1`.`seccion`.`seccion` AS `seccion`,`registroacademico_f1`.`catedratico`.`codigo` AS `id_catedratico`,`registroacademico_f1`.`catedratico`.`nombre` AS `nombre_catedratico` from ((`registroacademico_f1`.`seccion` join `registroacademico_f1`.`curso` on((`registroacademico_f1`.`seccion`.`id_curso` = `registroacademico_f1`.`curso`.`id`))) join `registroacademico_f1`.`catedratico` on((`registroacademico_f1`.`seccion`.`id_catedratico` = `registroacademico_f1`.`catedratico`.`codigo`)));

-- -----------------------------------------------------
-- View `registroacademico_f1`.`catedratico_sistemas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroacademico_f1`.`catedratico_sistemas`;
USE `registroacademico_f1`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`diego`@`localhost` SQL SECURITY DEFINER VIEW `registroacademico_f1`.`catedratico_sistemas` AS select `cat`.`codigo` AS `codigo`,`cat`.`nombre` AS `nombre`,`cat`.`apellido` AS `apellido`,`ci`.`id` AS `ciclo_id`,`ci`.`ciclo` AS `ciclo`,`car`.`id` AS `carrera_id` from ((((((`registroacademico_f1`.`seccion` `s` join `registroacademico_f1`.`curso` `c` on((`s`.`id_curso` = `c`.`id`))) join `registroacademico_f1`.`curso_pensum` `cp` on((`cp`.`id_curso` = `c`.`id`))) join `registroacademico_f1`.`pensum` `p` on((`cp`.`id_pensum` = `p`.`id`))) join `registroacademico_f1`.`carrera` `car` on((`p`.`id_carrera` = `car`.`id`))) join `registroacademico_f1`.`ciclo` `ci` on((`s`.`id_ciclo` = `ci`.`id`))) join `registroacademico_f1`.`catedratico` `cat` on((`s`.`id_catedratico` = `cat`.`codigo`)));

-- -----------------------------------------------------
-- View `registroacademico_f1`.`consulta2`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroacademico_f1`.`consulta2`;
USE `registroacademico_f1`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`diego`@`localhost` SQL SECURITY DEFINER VIEW `registroacademico_f1`.`consulta2` AS select `registroacademico_f1`.`curso`.`id` AS `id_curso`,`registroacademico_f1`.`curso`.`nombre` AS `curso_nombre`,`registroacademico_f1`.`carrera`.`nombre` AS `carrera`,`registroacademico_f1`.`seccion`.`seccion` AS `seccion`,`p`.`hora_inicio` AS `hora_inicio`,`p`.`hora_fin` AS `hora_fin`,`registroacademico_f1`.`dia`.`dia` AS `dia`,`registroacademico_f1`.`salon`.`nombre` AS `salon`,`registroacademico_f1`.`edificio`.`nombre` AS `edificio`,`registroacademico_f1`.`catedratico`.`nombre` AS `catedratico`,`registroacademico_f1`.`ciclo`.`id` AS `ciclo_id` from ((((((((((((`registroacademico_f1`.`seccion` join `registroacademico_f1`.`periodo_seccion` `ps` on((`ps`.`id_seccion` = `registroacademico_f1`.`seccion`.`id`))) join `registroacademico_f1`.`periodo` `p` on((`ps`.`id_periodo` = `p`.`id`))) join `registroacademico_f1`.`curso` on((`registroacademico_f1`.`seccion`.`id_curso` = `registroacademico_f1`.`curso`.`id`))) join `registroacademico_f1`.`ciclo` on((`registroacademico_f1`.`seccion`.`id_ciclo` = `registroacademico_f1`.`ciclo`.`id`))) join `registroacademico_f1`.`salon` on((`registroacademico_f1`.`seccion`.`id_salon` = `registroacademico_f1`.`salon`.`id`))) join `registroacademico_f1`.`catedratico` on((`registroacademico_f1`.`seccion`.`id_catedratico` = `registroacademico_f1`.`catedratico`.`codigo`))) join `registroacademico_f1`.`edificio` on((`registroacademico_f1`.`salon`.`id_edificio` = `registroacademico_f1`.`edificio`.`id`))) join `registroacademico_f1`.`dia_seccion` on((`registroacademico_f1`.`seccion`.`id` = `registroacademico_f1`.`dia_seccion`.`id_seccion`))) join `registroacademico_f1`.`dia` on((`registroacademico_f1`.`dia_seccion`.`id_dia` = `registroacademico_f1`.`dia`.`id`))) join `registroacademico_f1`.`curso_pensum` on((`registroacademico_f1`.`curso_pensum`.`id_curso` = `registroacademico_f1`.`curso`.`id`))) join `registroacademico_f1`.`pensum` on((`registroacademico_f1`.`curso_pensum`.`id_pensum` = `registroacademico_f1`.`pensum`.`id`))) join `registroacademico_f1`.`carrera` on((`registroacademico_f1`.`pensum`.`id_carrera` = `registroacademico_f1`.`carrera`.`id`)));

-- -----------------------------------------------------
-- View `registroacademico_f1`.`curso_postrequisito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroacademico_f1`.`curso_postrequisito`;
USE `registroacademico_f1`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`diego`@`localhost` SQL SECURITY DEFINER VIEW `registroacademico_f1`.`curso_postrequisito` AS select `c1`.`id` AS `id_curso_postrequisito`,`c1`.`nombre` AS `curso_postrequisito`,`c1`.`creditos` AS `creditos`,`c`.`id` AS `id_curso`,`c`.`nombre` AS `curso` from (((`registroacademico_f1`.`curso_prerrequisito` `cpre` join `registroacademico_f1`.`curso` `c` on((`cpre`.`id_curso_prerrequisito` = `c`.`id`))) join `registroacademico_f1`.`curso_pensum` `cp` on((`cpre`.`id_curso_pensum` = `cp`.`id`))) join `registroacademico_f1`.`curso` `c1` on((`cp`.`id_curso` = `c1`.`id`)));

-- -----------------------------------------------------
-- View `registroacademico_f1`.`curso_prerequisito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroacademico_f1`.`curso_prerequisito`;
USE `registroacademico_f1`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`diego`@`localhost` SQL SECURITY DEFINER VIEW `registroacademico_f1`.`curso_prerequisito` AS select `c1`.`id` AS `id_curso_prerequisito`,`c1`.`nombre` AS `curso_prerequisito`,`c1`.`creditos` AS `creditos`,`c`.`id` AS `id_curso`,`c`.`nombre` AS `curso` from (((`registroacademico_f1`.`curso_prerrequisito` `cpre` join `registroacademico_f1`.`curso_pensum` `cp` on((`cpre`.`id_curso_pensum` = `cp`.`id`))) join `registroacademico_f1`.`curso` `c` on((`cp`.`id_curso` = `c`.`id`))) join `registroacademico_f1`.`curso` `c1` on((`cpre`.`id_curso_prerrequisito` = `c1`.`id`)));

-- -----------------------------------------------------
-- View `registroacademico_f1`.`estudiante_creditos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroacademico_f1`.`estudiante_creditos`;
USE `registroacademico_f1`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`diego`@`localhost` SQL SECURITY DEFINER VIEW `registroacademico_f1`.`estudiante_creditos` AS select `registroacademico_f1`.`estudiante`.`carne` AS `carne`,`registroacademico_f1`.`estudiante`.`nombre` AS `nombre`,sum(`registroacademico_f1`.`curso`.`creditos`) AS `total_creditos` from (((((`registroacademico_f1`.`estudiante` join `registroacademico_f1`.`asignacion` `a` on((`registroacademico_f1`.`estudiante`.`carne` = `a`.`id_estudiante`))) join `registroacademico_f1`.`acta_nota` `an` on((`an`.`id_asignacion` = `a`.`id`))) join `registroacademico_f1`.`aprobacion_curso` `ac` on((`ac`.`acta_nota_codigo` = `an`.`id`))) join `registroacademico_f1`.`seccion` `sec` on((`a`.`id_seccion` = `sec`.`id`))) join `registroacademico_f1`.`curso` on((`sec`.`id_curso` = `registroacademico_f1`.`curso`.`id`))) where (`ac`.`aprobado` = true) group by `registroacademico_f1`.`estudiante`.`carne`;

-- -----------------------------------------------------
-- View `registroacademico_f1`.`estudiante_curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroacademico_f1`.`estudiante_curso`;
USE `registroacademico_f1`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`diego`@`localhost` SQL SECURITY DEFINER VIEW `registroacademico_f1`.`estudiante_curso` AS select `e`.`carne` AS `carne`,`e`.`nombre` AS `estudiante`,`c`.`id` AS `curso_id`,`c`.`nombre` AS `curso`,`s`.`id` AS `seccion_id`,`s`.`seccion` AS `seccion` from (((`registroacademico_f1`.`estudiante` `e` join `registroacademico_f1`.`asignacion` `a` on((`a`.`id_estudiante` = `e`.`carne`))) join `registroacademico_f1`.`seccion` `s` on((`a`.`id_seccion` = `s`.`id`))) join `registroacademico_f1`.`curso` `c` on((`s`.`id_curso` = `c`.`id`)));

-- -----------------------------------------------------
-- View `registroacademico_f1`.`estudiante_curso_aprobado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroacademico_f1`.`estudiante_curso_aprobado`;
USE `registroacademico_f1`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`diego`@`localhost` SQL SECURITY DEFINER VIEW `registroacademico_f1`.`estudiante_curso_aprobado` AS select `e`.`carne` AS `carne`,`e`.`nombre` AS `estudiante`,`c`.`id` AS `codigo_curso`,`c`.`nombre` AS `curso`,`cat`.`codigo` AS `codigo`,`ci`.`id` AS `ciclo_id`,`ac`.`aprobado` AS `aprobado` from (((((((`registroacademico_f1`.`estudiante` `e` join `registroacademico_f1`.`asignacion` `a` on((`a`.`id_estudiante` = `e`.`carne`))) join `registroacademico_f1`.`seccion` `s` on((`a`.`id_seccion` = `s`.`id`))) join `registroacademico_f1`.`curso` `c` on((`s`.`id_curso` = `c`.`id`))) join `registroacademico_f1`.`catedratico` `cat` on((`s`.`id_catedratico` = `cat`.`codigo`))) join `registroacademico_f1`.`ciclo` `ci` on((`s`.`id_ciclo` = `ci`.`id`))) join `registroacademico_f1`.`acta_nota` `an` on((`an`.`id_asignacion` = `a`.`id`))) join `registroacademico_f1`.`aprobacion_curso` `ac` on((`ac`.`acta_nota_codigo` = `an`.`id`)));

-- -----------------------------------------------------
-- View `registroacademico_f1`.`estudiantes_curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroacademico_f1`.`estudiantes_curso`;
USE `registroacademico_f1`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`diego`@`localhost` SQL SECURITY DEFINER VIEW `registroacademico_f1`.`estudiantes_curso` AS select `e`.`carne` AS `carne`,`e`.`nombre` AS `estudiante`,`s`.`id` AS `seccion_id` from (((`registroacademico_f1`.`estudiante` `e` join `registroacademico_f1`.`asignacion` `a` on((`a`.`id_estudiante` = `e`.`carne`))) join `registroacademico_f1`.`seccion` `s` on((`a`.`id_seccion` = `s`.`id`))) join `registroacademico_f1`.`curso` `c` on((`s`.`id_curso` = `c`.`id`)));

-- -----------------------------------------------------
-- View `registroacademico_f1`.`promedio_estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `registroacademico_f1`.`promedio_estudiante`;
USE `registroacademico_f1`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`diego`@`localhost` SQL SECURITY DEFINER VIEW `registroacademico_f1`.`promedio_estudiante` AS select `estudiante_nota`.`carne` AS `carne`,`estudiante_nota`.`nombre` AS `nombre`,`estudiante_nota`.`promedio` AS `promedio`,`ca`.`id` AS `id`,`ins`.`fecha` AS `fecha` from ((((select `con`.`carne` AS `carne`,`con`.`nombre` AS `nombre`,sum(`con`.`zona_obtenida`) AS `sum(con.zona_obtenida)`,sum(`con`.`nota_examen_final`) AS `sum(con.nota_examen_final)`,avg((`con`.`zona_obtenida` + `con`.`nota_examen_final`)) AS `promedio` from (select `e`.`carne` AS `carne`,`e`.`nombre` AS `nombre`,`an`.`zona_obtenida` AS `zona_obtenida`,`an`.`nota_examen_final` AS `nota_examen_final` from (((`registroacademico_f1`.`estudiante` `e` join `registroacademico_f1`.`asignacion` `a` on((`e`.`carne` = `a`.`id_estudiante`))) join `registroacademico_f1`.`acta_nota` `an` on((`an`.`id_asignacion` = `a`.`id`))) join `registroacademico_f1`.`aprobacion_curso` `ac` on((`ac`.`acta_nota_codigo` = `an`.`id`))) where (`ac`.`aprobado` = 1)) `con` group by `con`.`carne`) `estudiante_nota` join `registroacademico_f1`.`inscripcion` `ins` on((`estudiante_nota`.`carne` = `ins`.`id_estudiante`))) join `registroacademico_f1`.`pensum` `p` on((`ins`.`id_pensum` = `p`.`id`))) join `registroacademico_f1`.`carrera` `ca` on((`p`.`id_carrera` = `ca`.`id`)));

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
