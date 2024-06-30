-- -----------------------------------------------------
-- Schema registroacademico_f1
-- -----------------------------------------------------
DROP USER registroacademico_f1 CASCADE;

-- -----------------------------------------------------
-- Schema registroacademico_f1
-- -----------------------------------------------------
CREATE USER registroacademico_f1 IDENTIFIED BY password;
GRANT CONNECT, RESOURCE TO registroacademico_f1;

-- -----------------------------------------------------
-- Table registroacademico_f1.estudiante
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.estudiante (
  carne NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  ingreso_familiar NUMBER(10, 2) DEFAULT NULL,
  fecha_nacimiento DATE NOT NULL,
  telefono VARCHAR2(15) DEFAULT NULL,
  correo VARCHAR2(100) NOT NULL,
  CONSTRAINT carne_UNIQUE UNIQUE (carne),
  CONSTRAINT correo_UNIQUE UNIQUE (correo)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.curso
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.curso (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  creditos NUMBER NOT NULL,
  CONSTRAINT nombre_UNIQUE UNIQUE (nombre),
  CONSTRAINT id_UNIQUE UNIQUE (id)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.edificio
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.edificio (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  direccion VARCHAR2(100) NOT NULL,
  CONSTRAINT id_UNIQUE UNIQUE (id),
  CONSTRAINT nombre_UNIQUE UNIQUE (nombre)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.salon
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.salon (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  id_edificio NUMBER NOT NULL,
  nombre VARCHAR2(50) NOT NULL,
  capacidad NUMBER NOT NULL,
  nivel NUMBER NOT NULL,
  CONSTRAINT id_UNIQUE UNIQUE (id),
  CONSTRAINT fk_salon_edificio FOREIGN KEY (id_edificio) REFERENCES registroacademico_f1.edificio(id)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.catedratico
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.catedratico (
  codigo NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  nombre VARCHAR2(50) NOT NULL,
  apellido VARCHAR2(50) NOT NULL,
  sueldo_mensual NUMBER(10, 2) NOT NULL,
  telefono VARCHAR2(15) DEFAULT NULL,
  correo VARCHAR2(100) NOT NULL,
  CONSTRAINT codigo_UNIQUE UNIQUE (codigo),
  CONSTRAINT correo_UNIQUE UNIQUE (correo)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.ciclo
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.ciclo (
  id CHAR(2) PRIMARY KEY,
  ciclo VARCHAR2(10) NOT NULL,
  CONSTRAINT id_UNIQUE UNIQUE (id),
  CONSTRAINT ciclo_UNIQUE UNIQUE (ciclo)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.seccion
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.seccion (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  id_curso NUMBER NOT NULL,
  id_salon NUMBER NOT NULL,
  id_catedratico NUMBER NOT NULL,
  id_ciclo CHAR(2) NOT NULL,
  seccion CHAR(1) NOT NULL,
  anio NUMBER NOT NULL,
  CONSTRAINT id_UNIQUE UNIQUE (id),
  CONSTRAINT fk_seccion_curso FOREIGN KEY (id_curso) REFERENCES registroacademico_f1.curso(id),
  CONSTRAINT fk_seccion_salon FOREIGN KEY (id_salon) REFERENCES registroacademico_f1.salon(id),
  CONSTRAINT fk_seccion_catedratico FOREIGN KEY (id_catedratico) REFERENCES registroacademico_f1.catedratico(codigo),
  CONSTRAINT fk_seccion_ciclo FOREIGN KEY (id_ciclo) REFERENCES registroacademico_f1.ciclo(id)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.asignacion
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.asignacion (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  id_estudiante NUMBER NOT NULL,
  id_seccion NUMBER NOT NULL,
  fecha DATE NOT NULL,
  CONSTRAINT id_UNIQUE UNIQUE (id),
  CONSTRAINT fk_asignacion_estudiante FOREIGN KEY (id_estudiante) REFERENCES registroacademico_f1.estudiante(carne),
  CONSTRAINT fk_asignacion_seccion FOREIGN KEY (id_seccion) REFERENCES registroacademico_f1.seccion(id)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.acta_nota
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.acta_nota (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  id_asignacion NUMBER NOT NULL,
  zona_obtenida NUMBER NOT NULL CHECK (zona_obtenida BETWEEN 1 AND 100),
  nota_examen_final NUMBER NOT NULL CHECK (nota_examen_final BETWEEN 1 AND 100),
  fecha DATE NOT NULL,
  CONSTRAINT id_UNIQUE UNIQUE (id),
  CONSTRAINT fk_acta_nota_asignacion FOREIGN KEY (id_asignacion) REFERENCES registroacademico_f1.asignacion(id)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.aprobacion_curso
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.aprobacion_curso (
  id NUMBER PRIMARY KEY,
  acta_nota_codigo NUMBER NOT NULL,
  aprobado NUMBER(1) NOT NULL,
  CONSTRAINT id_UNIQUE UNIQUE (id),
  CONSTRAINT fk_aprobacion_curso_acta_nota FOREIGN KEY (acta_nota_codigo) REFERENCES registroacademico_f1.acta_nota(id)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.unidad_academica
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.unidad_academica (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  unidad VARCHAR2(100) NOT NULL,
  ubicacion VARCHAR2(100) DEFAULT NULL,
  telefono VARCHAR2(15) DEFAULT NULL,
  sitio_web VARCHAR2(100) DEFAULT NULL,
  CONSTRAINT unidad_UNIQUE UNIQUE (unidad),
  CONSTRAINT id_UNIQUE UNIQUE (id)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.carrera
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.carrera (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  id_unidad_academica NUMBER NOT NULL,
  nombre VARCHAR2(100) NOT NULL,
  CONSTRAINT id_UNIQUE UNIQUE (id),
  CONSTRAINT nombre_UNIQUE UNIQUE (nombre),
  CONSTRAINT fk_carrera_unidad_academica FOREIGN KEY (id_unidad_academica) REFERENCES registroacademico_f1.unidad_academica(id)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.jornada
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.jornada (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  jornada VARCHAR2(50) NOT NULL,
  hora_inicio TIME NOT NULL,
  hora_fin TIME NOT NULL,
  CONSTRAINT id_UNIQUE UNIQUE (id),
  CONSTRAINT jornada_UNIQUE UNIQUE (jornada)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.semestre
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.semestre (
  id CHAR(3) PRIMARY KEY,
  semestre VARCHAR2(20) NOT NULL,
  CONSTRAINT id_UNIQUE UNIQUE (id),
  CONSTRAINT semestre_UNIQUE UNIQUE (semestre)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.pensum
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.pensum (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  id_carrera NUMBER NOT NULL,
  id_jornada NUMBER NOT NULL,
  id_semestre_inicio CHAR(3) NOT NULL,
  id_semestre_fin CHAR(3) NOT NULL,
  nombre VARCHAR2(100) NOT NULL,
  anio_inicio NUMBER NOT NULL,
  anio_fin NUMBER DEFAULT NULL,
  creditos_cierre NUMBER NOT NULL,
  cantidad_semestres NUMBER NOT NULL,
  CONSTRAINT id_UNIQUE UNIQUE (id),
  CONSTRAINT fk_pensum_carrera FOREIGN KEY (id_carrera) REFERENCES registroacademico_f1.carrera(id),
  CONSTRAINT fk_pensum_jornada FOREIGN KEY (id_jornada) REFERENCES registroacademico_f1.jornada(id),
  CONSTRAINT fk_pensum_semestre_fin FOREIGN KEY (id_semestre_fin) REFERENCES registroacademico_f1.semestre(id),
  CONSTRAINT fk_pensum_semestre_inicio FOREIGN KEY (id_semestre_inicio) REFERENCES registroacademico_f1.semestre(id)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.curso_pensum
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.curso_pensum (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  id_pensum NUMBER NOT NULL,
  id_curso NUMBER NOT NULL,
  id_semestre CHAR(3) NOT NULL,
  obligatorio NUMBER(1) NOT NULL,
  nota_aprobacion NUMBER NOT NULL CHECK (nota_aprobacion BETWEEN 1 AND 100),
  zona_minima NUMBER NOT NULL CHECK (zona_minima BETWEEN 1 AND 100),
  CONSTRAINT id_UNIQUE UNIQUE (id),
  CONSTRAINT fk_curso_pensum_pensum FOREIGN KEY (id_pensum) REFERENCES registroacademico_f1.pensum(id),
  CONSTRAINT fk_curso_pensum_curso FOREIGN KEY (id_curso) REFERENCES registroacademico_f1.curso(id),
  CONSTRAINT fk_curso_pensum_semestre FOREIGN KEY (id_semestre) REFERENCES registroacademico_f1.semestre(id)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.inscripcion_carrera
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.inscripcion_carrera (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  id_estudiante NUMBER NOT NULL,
  id_carrera NUMBER NOT NULL,
  fecha DATE NOT NULL,
  CONSTRAINT id_UNIQUE UNIQUE (id),
  CONSTRAINT fk_inscripcion_carrera_estudiante FOREIGN KEY (id_estudiante) REFERENCES registroacademico_f1.estudiante(carne),
  CONSTRAINT fk_inscripcion_carrera_carrera FOREIGN KEY (id_carrera) REFERENCES registroacademico_f1.carrera(id)
);

-- -----------------------------------------------------
-- Table registroacademico_f1.horario_clase
-- -----------------------------------------------------
CREATE TABLE registroacademico_f1.horario_clase (
  id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  id_seccion NUMBER NOT NULL,
  dia VARCHAR2(15) NOT NULL,
  hora_inicio TIME NOT NULL,
  hora_fin TIME NOT NULL,
  CONSTRAINT id_UNIQUE UNIQUE (id),
  CONSTRAINT fk_horario_clase_seccion FOREIGN KEY (id_seccion) REFERENCES registroacademico_f1.seccion(id)
);