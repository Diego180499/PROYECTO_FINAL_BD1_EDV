ALTER TABLE registroacademico_f1.creditos_prerrequisito
MODIFY COLUMN creditos_requeridos INT NOT NULL;

-----------------------
ALTER TABLE curso_pensum
MODIFY COLUMN id INT AUTO_INCREMENT PRIMARY KEY
;

--------------------------------
ALTER TABLE `registroacademico_f1`.`creditos_prerrequisito` 
CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT ;

-------------------------|
/* MODIFICACIONES  */
ALTER TABLE estudiante
MODIFY COLUMN `telefono` INT(8)
;

ALTER TABLE `registroacademico_f1`.`estudiante`
ADD CONSTRAINT `chk_correo_formato` CHECK (`correo` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

ALTER TABLE `registroacademico_f1`.`catedratico`
ADD CONSTRAINT `chk_correo_formato` CHECK (`correo` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

--ALTERA LA TABLA PARA QUE SE VERIFIQUE EL EL NOMBRE DE LA CARRERA SEAN SOLAMENTE LETRAS--
ALTER TABLE registroacademico_f1.carrera
ADD  CONSTRAINT `chk_nombre_carrera_formato` CHECK (nombre REGEXP '^[a-zA-Z]+$');