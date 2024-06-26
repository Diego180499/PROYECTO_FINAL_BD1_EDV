/* MODIFICACIONES  */
ALTER TABLE estudiante
MODIFY COLUMN `telefono` INT(8)
;

ALTER TABLE `registroacademico_f1`.`estudiante`
ADD CONSTRAINT `chk_correo_formato` CHECK (`correo` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

ALTER TABLE `registroacademico_f1`.`catedratico`
ADD CONSTRAINT `chk_correo_formato` CHECK (`correo` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');


-- VALIDACIONES PT.1 --
/* 1. Registrar Estudiante */
ALTER TABLE `registroacademico_f1`.`estudiante`
ADD COLUMN `dpi` varchar(13) AFTER `carne`;

-- CONSULTAS --
/* 8. Insertar Columna */
ALTER TABLE `registroacademico_f1`.`catedratico`
ADD COLUMN `sueldo_letras` TEXT AFTER `sueldo_mensual`;

/* Trigger para Transacciones (Inserts, Updates, Deletes)
 * Se almacenar[a la hora, fecha y nombre_tabla afectada
 */

 CREATE TABLE  IF NOT EXISTS `registroacademico_f1`.`tipo_transaccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `codigo_UNIQUE` (`id` ASC) ,
  UNIQUE INDEX `codigo_UNIQUE` (`nombre` ASC) ;

 CREATE TABLE  IF NOT EXISTS `registroacademico_f1`.`transacciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_transaccion` INT NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (id_tipo_transaccion)
  REFERENCES tipo_transaccion(id),
  UNIQUE INDEX `codigo_UNIQUE` (`id` ASC))
  ;

  /* Trigger */

-- CHECK CONSTRAINTS --

