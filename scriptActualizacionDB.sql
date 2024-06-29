/* ----------------- *
 * DDL Actualizacion *
 * ----------------- */
 -------------------------------
 -- CREACION DE TABLAS EXTRAS --
 -------------------------------
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
;

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
;


CREATE TABLE  IF NOT EXISTS `registroacademico_f1`.`tipo_transaccion` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC)
  );


 CREATE TABLE  IF NOT EXISTS `registroacademico_f1`.`transacciones` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_tipo_transaccion` INT NOT NULL,
  `fecha_hora` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (id_tipo_transaccion)
  REFERENCES tipo_transaccion(id),
  UNIQUE INDEX `codigo_UNIQUE` (`id` ASC))
  ;
-----------------------------------------------------------------------|


/* 1) Reglas de Negocio */
-- Regla X: descrip...
ALTER TABLE curso_pensum
ADD CONSTRAINT chk_nota_aprobacion CHECK (nota_aprobacion BETWEEN 1 AND 100),
ADD CONSTRAINT chk_zona_minima CHECK (zona_minima BETWEEN 1 AND 100);

-- Regla Y: decrip...
ALTER TABLE acta_nota
ADD CONSTRAINT chk_zona_obtenida CHECK (zona_obtenida BETWEEN 1 AND 100),
ADD CONSTRAINT chk_nota_examen_final CHECK (nota_examen_final BETWEEN 1 AND 100);

-- --------------------------------------------------------------------------------

/* 2) Consultas */
-- Consulta 1: Estudiante con mejor promedio por carrera (antes de 2022)

-- Consulta 2: Cursos en mismo Periodo, Jornada y Año determinado

-- Conuslta 3: Cursos de una Carrera determinada

-- Conuslta 4: Cursos Pre-requisito y Post-requisito de un Curso determinado

-- Conuslta 5: Cursos impartido por un Catedrático determinado

-- Conuslta 6: Aprobación/Desaprobación de Curso de Estudiante determinado

-- Conuslta 7: Promedio y Créditos obtenidos por Estudiante (con Carrera de Ingeniería en Ciencias y Sistemas cerrada)

-- Conuslta 8: Carrera, Promedio y Créditos de Estudiantes que han cerrado alguna carrera

-- Conuslta 9: Estudiantes que ganaron algun curso impartido por Catedráticos (que han brindado algún curso de Ingeniería en Ciencias y Sistemas) en algún plan del semestre pasado

-- Conuslta 10: Estudiantes que estuvieron en las mismas secciones que un Estudiante determinado que ha cerrado alguna Carrera

-- --------------------------------------------------------------------------------

/* 3) Funcionalidades */
-- Funcionalidad 1: Registrar Estudiante  👍👍
ALTER TABLE estudiante
ADD COLUMN direccion VARCHAR(100);       

ALTER TABLE estudiante
ADD COLUMN dpi VARCHAR(13);

alter table estudiante
add column apellido varchar(100) after nombre;

-- Funcionalidad 2: Crear Carrera  👍👍
ALTER TABLE registroacademico_f1.carrera
ADD CONSTRAINT chk_nombre_carrera_formato CHECK (nombre REGEXP '^[a-zA-Z]+$');

-- Funcionalidad 3: Registrar Docente 👍👍
ALTER TABLE catedratico
ADD COLUMN fecha_nacimiento DATE AFTER apellido;       

ALTER TABLE catedratico
ADD COLUMN direccion VARCHAR(100) AFTER telefono;

ALTER TABLE catedratico
ADD COLUMN dpi VARCHAR(13) AFTER codigo;       

----------------------------------------|

-- Funcionalidad 4: Registrar Curso en Pensum



-- Funcionalidad 5: Registrar Curso Prerrequisito 👍👍
-- NO HAY ALTERACIONES EN LAS TABLAS --

-- Funcionalidad 6: Crear Sección   👍👍
-- NO HAY ALTERACIONES EN LAS TABLAS --

-- Funcionalidad 7: *Agregar Horario*


-- Funcionalidad 8: Asignación Estudiante a Seccion


-- Funcionalidad 9: Ingresar Acta Nota de Asignación


-- Funcionalidad 10: Desasignar Curso

--------------------------------------------------------------------------------

/* 4) Reportes */
-- Reporte 1: Listado de Cursos de un Pensum de una Carrera


-- Reporte 2: Consultar infromacion de Estudiante determinado


-- Reporte 3: Consultar informacion de Docente determinado


-- Reporte 4: Listado de Asignaciones de Estudiantes a Curso


-- Reporte 5: Listado de Periodos de los Cursos asignados de un Estudiante (en un semestre y año)


-- Reporte 6: Listado de Aprobaciones


-- Reporte 7: Listado de Cursos que un Estudiante puede Asignarse el siguiente Semestre


-- Reporte 8: Agregar nueva columna a Catedratico y Control de Transacciones en la DB

-- -------------------------
/* USE registroacademico_f1;
SELECT * FROM estudiante; */