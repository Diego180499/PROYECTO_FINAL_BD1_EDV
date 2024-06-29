/* INSERTS DE DATA EN LA DB */

-- 1. UNIDAD ACADEMICA
INSERT INTO registroacademico_f1.unidad_academica (id, unidad, ubicacion, telefono, sitio_web) VALUES 
(1, 'Facultad de Ingeniería', 'Avenida de la Ingeniería, Zona 1', '1234-5678', 'http://ingenieria.universidad.edu');
INSERT INTO registroacademico_f1.unidad_academica (id, unidad, ubicacion, telefono, sitio_web) VALUES 
(2, 'Facultad de Ciencias Económicas', 'Calle de la Economía, Zona 2', '2345-6789', 'http://economia.universidad.edu');
INSERT INTO registroacademico_f1.unidad_academica (id, unidad, ubicacion, telefono, sitio_web) VALUES 
(3, 'Facultad de Medicina', 'Avenida de la Salud, Zona 3', '3456-7890', 'http://medicina.universidad.edu');


-- 2. EDIFICIO
INSERT INTO registroacademico_f1.edificio (id, nombre, direccion) VALUES 
(1, 'Edificio Central', 'Avenida Principal, Zona 1');
INSERT INTO registroacademico_f1.edificio (id, nombre, direccion) VALUES 
(2, 'Edificio de Ciencias', 'Calle de la Ciencia, Zona 2');
INSERT INTO registroacademico_f1.edificio (id, nombre, direccion) VALUES 
(3, 'Edificio Administrativo', 'Boulevard Administrativo, Zona 3');


-- 3. CATEDRATICO
INSERT INTO registroacademico_f1.catedratico (codigo, dpi, nombre, apellido, fecha_nacimiento, sueldo_mensual, sueldo_letras, telefono, direccion, correo) VALUES 
(1, '1234567890123', 'Juan', 'Pérez', '1980-05-15', 5000.00, 'Cinco mil quetzales', '1234-5678', 'Avenida Principal, Zona 1', 'juan.perez@universidad.edu');
INSERT INTO registroacademico_f1.catedratico (codigo, dpi, nombre, apellido, fecha_nacimiento, sueldo_mensual, sueldo_letras, telefono, direccion, correo) VALUES 
(2, '2345678901234', 'María', 'Gómez', '1985-08-22', 5500.00, 'Cinco mil quinientos quetzales', '2345-6789', 'Calle Secundaria, Zona 2', 'maria.gomez@universidad.edu');
INSERT INTO registroacademico_f1.catedratico (codigo, dpi, nombre, apellido, fecha_nacimiento, sueldo_mensual, sueldo_letras, telefono, direccion, correo) VALUES 
(3, '3456789012345', 'Carlos', 'López', '1979-03-30', 5200.00, 'Cinco mil doscientos quetzales', '3456-7890', 'Boulevard Central, Zona 3', 'carlos.lopez@universidad.edu');
INSERT INTO registroacademico_f1.catedratico (codigo, dpi, nombre, apellido, fecha_nacimiento, sueldo_mensual, sueldo_letras, telefono, direccion, correo) VALUES 
(4, '4567890123456', 'Ana', 'Martínez', '1983-11-05', 5300.00, 'Cinco mil trescientos quetzales', '4567-8901', 'Avenida de la Reforma, Zona 4', 'ana.martinez@universidad.edu');
INSERT INTO registroacademico_f1.catedratico (codigo, dpi, nombre, apellido, fecha_nacimiento, sueldo_mensual, sueldo_letras, telefono, direccion, correo) VALUES 
(5, '5678901234567', 'Luis', 'Rodríguez', '1975-09-12', 5100.00, 'Cinco mil cien quetzales', '5678-9012', 'Calle de los Próceres, Zona 5', 'luis.rodriguez@universidad.edu');
INSERT INTO registroacademico_f1.catedratico (codigo, dpi, nombre, apellido, fecha_nacimiento, sueldo_mensual, sueldo_letras, telefono, direccion, correo) VALUES 
(6, '6789012345678', 'Laura', 'Hernández', '1988-04-18', 5400.00, 'Cinco mil cuatrocientos quetzales', '6789-0123', 'Boulevard de los Héroes, Zona 6', 'laura.hernandez@universidad.edu');
INSERT INTO registroacademico_f1.catedratico (codigo, dpi, nombre, apellido, fecha_nacimiento, sueldo_mensual, sueldo_letras, telefono, direccion, correo) VALUES 
(7, '7890123456789', 'José', 'Fernández', '1977-07-25', 5600.00, 'Cinco mil seiscientos quetzales', '7890-1234', 'Avenida de la Paz, Zona 7', 'jose.fernandez@universidad.edu');
INSERT INTO registroacademico_f1.catedratico (codigo, dpi, nombre, apellido, fecha_nacimiento, sueldo_mensual, sueldo_letras, telefono, direccion, correo) VALUES 
(8, '8901234567890', 'Sofía', 'García', '1990-01-10', 5500.00, 'Cinco mil quinientos quetzales', '8901-2345', 'Calle del Trabajo, Zona 8', 'sofia.garcia@universidad.edu');
INSERT INTO registroacademico_f1.catedratico (codigo, dpi, nombre, apellido, fecha_nacimiento, sueldo_mensual, sueldo_letras, telefono, direccion, correo) VALUES 
(9, '9012345678901', 'David', 'Sánchez', '1982-12-03', 5700.00, 'Cinco mil setecientos quetzales', '9012-3456', 'Boulevard del Comercio, Zona 9', 'david.sanchez@universidad.edu');
INSERT INTO registroacademico_f1.catedratico (codigo, dpi, nombre, apellido, fecha_nacimiento, sueldo_mensual, sueldo_letras, telefono, direccion, correo) VALUES 
(10, '0123456789012', 'Lucía', 'Ramírez', '1992-06-14', 5300.00, 'Cinco mil trescientos quetzales', '0123-4567', 'Avenida de la Libertad, Zona 10', 'lucia.ramirez@universidad.edu');

-- 4. ESTUDIANTE
INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(1, '1234567890123', 'Pedro', 'González', 2500.00, '2000-01-15', 12345678, 'pedro.gonzalez@universidad.edu', 'Avenida Central, Zona 1');
INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(2, '2345678901234', 'María', 'Ramírez', 3000.00, '1999-05-22', 23456789, 'maria.ramirez@universidad.edu', 'Calle Secundaria, Zona 2');
INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(3, '3456789012345', 'Juan', 'López', 2800.00, '1998-11-10', 34567890, 'juan.lopez@universidad.edu', 'Boulevard Central, Zona 3');
INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(4, '4567890123456', 'Ana', 'Martínez', 3500.00, '2001-07-18', 45678901, 'ana.martinez@universidad.edu', 'Avenida de la Reforma, Zona 4');
INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(5, '5678901234567', 'Luis', 'Rodríguez', 3200.00, '1997-09-12', 56789012, 'luis.rodriguez@universidad.edu', 'Calle de los Próceres, Zona 5');
INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(6, '6789012345678', 'Laura', 'Hernández', 2700.00, '2002-04-18', 67890123, 'laura.hernandez@universidad.edu', 'Boulevard de los Héroes, Zona 6');
INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(7, '7890123456789', 'José', 'Fernández', 2600.00, '1996-07-25', 78901234, 'jose.fernandez@universidad.edu', 'Avenida de la Paz, Zona 7');
INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(8, '8901234567890', 'Sofía', 'García', 2900.00, '2000-01-10', 89012345, 'sofia.garcia@universidad.edu', 'Calle del Trabajo, Zona 8');
INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(9, '9012345678901', 'David', 'Sánchez', 3300.00, '1998-12-03', 90123456, 'david.sanchez@universidad.edu', 'Boulevard del Comercio, Zona 9');
INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(10, '0123456789012', 'Lucía', 'Ramírez', 3100.00, '1999-06-14', 1234567, 'lucia.ramirez@universidad.edu', 'Avenida de la Libertad, Zona 10');

INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(11, '4567890123456', 'Miguel', 'Reyes', 2700.00, '2001-11-11', 12345679, 'miguel.reyes@universidad.edu', 'Calle 11, Zona 11');
INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(12, '5678901234567', 'Julia', 'Fernández', 3100.00, '2000-09-15', 23456780, 'julia.fernandez@universidad.edu', 'Avenida 12, Zona 12');
INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(13, '6789012345678', 'Roberto', 'Martínez', 2800.00, '1999-08-20', 34567891, 'roberto.martinez@universidad.edu', 'Boulevard 13, Zona 13');
INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(14, '7890123456789', 'Gabriela', 'López', 3000.00, '1998-05-30', 45678912, 'gabriela.lopez@universidad.edu', 'Calle 14, Zona 14');
INSERT INTO registroacademico_f1.estudiante (carne, dpi, nombre, apellido, ingreso_familiar, fecha_nacimiento, telefono, correo, direccion) VALUES 
(15, '8901234567890', 'Daniel', 'González', 3200.00, '2001-12-01', 56789023, 'daniel.gonzalez@universidad.edu', 'Avenida 15, Zona 15');


-- 5. CARRERAS
INSERT INTO registroacademico_f1.carrera (id, id_unidad_academica, nombre) VALUES 
(1, 1, 'Ingeniería en Sistemas');
INSERT INTO registroacademico_f1.carrera (id, id_unidad_academica, nombre) VALUES 
(2, 1, 'Ingeniería Civil');
INSERT INTO registroacademico_f1.carrera (id, id_unidad_academica, nombre) VALUES 
(3, 2, 'Administración de Empresas');
INSERT INTO registroacademico_f1.carrera (id, id_unidad_academica, nombre) VALUES 
(4, 2, 'Contaduría Pública y Auditoría');
INSERT INTO registroacademico_f1.carrera (id, id_unidad_academica, nombre) VALUES 
(5, 3, 'Medicina General');


-- 6. SALONES
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(1, 1, 'Aula 101', 30, 1);
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(2, 1, 'Aula 102', 30, 1);
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(3, 1, 'Aula 201', 30, 2);
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(4, 2, 'Laboratorio 301', 20, 3);
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(5, 2, 'Laboratorio 302', 20, 3);
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(6, 2, 'Aula 101', 40, 1);
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(7, 2, 'Aula 102', 40, 1);
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(8, 3, 'Auditorio 1', 100, 1);
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(9, 3, 'Aula 101', 50, 1);
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(10, 3, 'Aula 102', 50, 1);
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(11, 3, 'Aula 201', 50, 2);
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(12, 3, 'Aula 202', 50, 2);
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(13, 1, 'Laboratorio 101', 25, 1);
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(14, 1, 'Laboratorio 102', 25, 1);
INSERT INTO registroacademico_f1.salon (id, id_edificio, nombre, capacidad, nivel) VALUES 
(15, 1, 'Aula Magna', 200, 1);


-- 7. CURSOS
INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(1, 'Programación I', 4);
INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(2, 'Estructuras de Datos', 4);
INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(3, 'Sistemas Operativos', 5);

INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(4, 'Mecánica de Suelos', 3);
INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(5, 'Cálculo Estructural', 4);
INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(6, 'Materiales de Construcción', 3);

INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(7, 'Fundamentos de Administración', 3);
INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(8, 'Contabilidad General', 3);
INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(9, 'Marketing Estratégico', 4);

INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(10, 'Contabilidad de Costos', 3);
INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(11, 'Auditoría Financiera', 4);
INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(12, 'Normas Internacionales de Información Financiera', 3);

INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(13, 'Anatomía Humana', 5);
INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(14, 'Fisiología', 5);
INSERT INTO registroacademico_f1.curso (id, nombre, creditos) VALUES 
(15, 'Farmacología', 4);

-- 8. SECCIONES
INSERT INTO registroacademico_f1.seccion (id, id_curso, id_salon, id_catedratico, id_ciclo, seccion, anio) VALUES 
(1, 1, 1, 1, '1S', 'A', 2024);
INSERT INTO registroacademico_f1.seccion (id, id_curso, id_salon, id_catedratico, id_ciclo, seccion, anio) VALUES 
(2, 2, 2, 3, '2S', 'B', 2024);
INSERT INTO registroacademico_f1.seccion (id, id_curso, id_salon, id_catedratico, id_ciclo, seccion, anio) VALUES 
(3, 3, 3, 3, '1S', 'C', 2025);
INSERT INTO registroacademico_f1.seccion (id, id_curso, id_salon, id_catedratico, id_ciclo, seccion, anio) VALUES 
(4, 1, 4, 4, '2S', 'A', 2024);
INSERT INTO registroacademico_f1.seccion (id, id_curso, id_salon, id_catedratico, id_ciclo, seccion, anio) VALUES 
(5, 2, 5, 5, '1S', 'B', 2024);
INSERT INTO registroacademico_f1.seccion (id, id_curso, id_salon, id_catedratico, id_ciclo, seccion, anio) VALUES 
(6, 3, 6, 6, '2S', 'C', 2025);
INSERT INTO registroacademico_f1.seccion (id, id_curso, id_salon, id_catedratico, id_ciclo, seccion, anio) VALUES 
(7, 1, 7, 7, '1S', 'A', 2024);
INSERT INTO registroacademico_f1.seccion (id, id_curso, id_salon, id_catedratico, id_ciclo, seccion, anio) VALUES 
(8, 2, 8, 8, '2S', 'B', 2024);
INSERT INTO registroacademico_f1.seccion (id, id_curso, id_salon, id_catedratico, id_ciclo, seccion, anio) VALUES 
(9, 3, 9, 9, '1S', 'C', 2025);
INSERT INTO registroacademico_f1.seccion (id, id_curso, id_salon, id_catedratico, id_ciclo, seccion, anio) VALUES 
(10, 1, 10, 10, '2S', 'A', 2024);


-- 9. DIA_SECCION
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(1, 1, 1);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(2, 1, 3);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(3, 1, 5);

INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(4, 2, 1);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(5, 2, 3);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(6, 2, 5);

INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(7, 3, 1);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(8, 3, 3);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(9, 3, 5);

INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(10, 4, 1);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(11, 4, 3);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(12, 4, 5);

INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(13, 5, 1);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(14, 5, 3);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(15, 5, 5);

INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(16, 6, 1);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(17, 6, 3);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(18, 6, 5);

INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(19, 7, 1);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(20, 7, 3);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(21, 7, 5);

INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(22, 8, 1);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(23, 8, 3);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(24, 8, 5);

INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(25, 9, 1);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(26, 9, 3);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(27, 9, 5);

INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(28, 10, 1);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(29, 10, 3);
INSERT INTO registroacademico_f1.dia_seccion (id, id_seccion, id_dia) VALUES 
(30, 10, 5);


-- 10. PERIODO_SECCION
-- Sección 1
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(1, 1, 1);
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(2, 1, 2);

-- Sección 2
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(3, 2, 1);
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(4, 2, 2);

-- Sección 3
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(5, 3, 7);
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(6, 3, 8);

-- Sección 4
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(7, 4, 1);
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(8, 4, 2);

-- Sección 5
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(9, 5, 1);
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(10, 5, 2);

-- Sección 6
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(11, 6, 7);
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(12, 6, 8);

-- Sección 7
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(13, 7, 3);
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(14, 7, 4);

-- Sección 8
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(15, 8, 5);
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(16, 8, 6);

-- Sección 9
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(17, 9, 9);
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(18, 9, 10);

-- Sección 10
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(19, 10, 4);
INSERT INTO registroacademico_f1.periodo_seccion (id, id_seccion, id_periodo) VALUES 
(20, 10, 6);


-- 11. PENSUMS
INSERT INTO registroacademico_f1.pensum (id, id_carrera, id_jornada, id_semestre_inicio, id_semestre_fin, nombre, anio_inicio, anio_fin, creditos_cierre, cantidad_semestres) VALUES 
(1, 1, 4, '1S', '10S', 'ING-SIS-2024', 2024, NULL, 300, 10);

INSERT INTO registroacademico_f1.pensum (id, id_carrera, id_jornada, id_semestre_inicio, id_semestre_fin, nombre, anio_inicio, anio_fin, creditos_cierre, cantidad_semestres) VALUES 
(2, 2, 2, '1S', '10S', 'ING-CIV-2024', 2024, NULL, 320, 10);

INSERT INTO registroacademico_f1.pensum (id, id_carrera, id_jornada, id_semestre_inicio, id_semestre_fin, nombre, anio_inicio, anio_fin, creditos_cierre, cantidad_semestres) VALUES 
(3, 3, 1, '1S', '10S', 'ADM-EMP-2024', 2024, NULL, 280, 10);

INSERT INTO registroacademico_f1.pensum (id, id_carrera, id_jornada, id_semestre_inicio, id_semestre_fin, nombre, anio_inicio, anio_fin, creditos_cierre, cantidad_semestres) VALUES 
(4, 4, 3, '1S', '10S', 'CON-PAU-2024', 2024, NULL, 290, 10);

INSERT INTO registroacademico_f1.pensum (id, id_carrera, id_jornada, id_semestre_inicio, id_semestre_fin, nombre, anio_inicio, anio_fin, creditos_cierre, cantidad_semestres) VALUES 
(5, 5, 1, '1S', '10S', 'MED-GEN-2024', 2024, NULL, 350, 10);


-- 12. CURSOS_PENSUM
INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(1, 1, 1, '1S', 1, 61, 31);
INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(2, 1, 2, '2S', 1, 61, 31);
INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(3, 1, 3, '3S', 1, 61, 31);

INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(4, 2, 4, '4S', 1, 61, 31);
INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(5, 2, 5, '5S', 1, 61, 31);
INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(6, 2, 6, '6S', 1, 61, 31);

INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(7, 3, 7, '1S', 1, 61, 31);
INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(8, 3, 8, '2S', 1, 61, 31);
INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(9, 3, 9, '3S', 1, 61, 31);

INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(10, 4, 10, '4S', 1, 61, 31);
INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(11, 4, 11, '5S', 1, 61, 31);
INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(12, 4, 12, '6S', 1, 61, 31);

INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(13, 5, 13, '1S', 1, 61, 31);
INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(14, 5, 14, '2S', 1, 61, 31);
INSERT INTO registroacademico_f1.curso_pensum (id, id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) VALUES 
(15, 5, 15, '3S', 1, 61, 31);


-- 13. INSCRIPCIONES
INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(1, 1, 1, '2024-01-10');
INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(2, 2, 2, '2024-01-10');
INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(3, 3, 3, '2024-01-10');
INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(4, 4, 4, '2024-01-10');
INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(5, 5, 5, '2024-01-10');
INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(6, 6, 1, '2024-01-10');
INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(7, 7, 2, '2024-01-10');
INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(8, 8, 3, '2024-01-10');
INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(9, 9, 4, '2024-01-10');
INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(10, 10, 5, '2024-01-10');

INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(11, 11, 1, '2024-01-10');
INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(12, 12, 1, '2024-01-10');
INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(13, 13, 1, '2024-01-10');
INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(14, 14, 1, '2024-01-10');
INSERT INTO registroacademico_f1.inscripcion (id, id_estudiante, id_pensum, fecha) VALUES 
(15, 15, 1, '2024-01-10');


-- 14. CURSOS_PRERREQUISITO
INSERT INTO registroacademico_f1.curso_prerrequisito (id, id_curso_pensum, id_curso_prerrequisito) VALUES 
(1, 15, 14);
INSERT INTO registroacademico_f1.curso_prerrequisito (id, id_curso_pensum, id_curso_prerrequisito) VALUES 
(2, 14, 13);

INSERT INTO registroacademico_f1.curso_prerrequisito (id, id_curso_pensum, id_curso_prerrequisito) VALUES 
(3, 12, 11);
INSERT INTO registroacademico_f1.curso_prerrequisito (id, id_curso_pensum, id_curso_prerrequisito) VALUES 
(4, 11, 10);

INSERT INTO registroacademico_f1.curso_prerrequisito (id, id_curso_pensum, id_curso_prerrequisito) VALUES 
(5, 9, 8);
INSERT INTO registroacademico_f1.curso_prerrequisito (id, id_curso_pensum, id_curso_prerrequisito) VALUES 
(6, 8, 7);

INSERT INTO registroacademico_f1.curso_prerrequisito (id, id_curso_pensum, id_curso_prerrequisito) VALUES 
(7, 6, 5);
INSERT INTO registroacademico_f1.curso_prerrequisito (id, id_curso_pensum, id_curso_prerrequisito) VALUES 
(8, 5, 4);

INSERT INTO registroacademico_f1.curso_prerrequisito (id, id_curso_pensum, id_curso_prerrequisito) VALUES 
(9, 3, 2);
INSERT INTO registroacademico_f1.curso_prerrequisito (id, id_curso_pensum, id_curso_prerrequisito) VALUES 
(10, 2, 1);


-- 15. CREDITOS_PRERREQUISITO
INSERT INTO registroacademico_f1.creditos_prerrequisito (id, creditos_requeridos, curso_pensum_id) VALUES 
(1, 6, 3);
INSERT INTO registroacademico_f1.creditos_prerrequisito (id, creditos_requeridos, curso_pensum_id) VALUES 
(2, 7, 6);
INSERT INTO registroacademico_f1.creditos_prerrequisito (id, creditos_requeridos, curso_pensum_id) VALUES 
(3, 8, 9);
INSERT INTO registroacademico_f1.creditos_prerrequisito (id, creditos_requeridos, curso_pensum_id) VALUES 
(4, 9, 12);
INSERT INTO registroacademico_f1.creditos_prerrequisito (id, creditos_requeridos, curso_pensum_id) VALUES 
(5, 10, 15);


-- 16. ASIGNACIONES
-- Curso 1, 1S
-- Aprobaran
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(1, 1, 1, '2024-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(2, 2, 1, '2024-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(3, 3, 1, '2024-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(4, 4, 1, '2024-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(5, 5, 1, '2024-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(6, 6, 1, '2024-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(7, 7, 1, '2024-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(8, 8, 1, '2024-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(9, 9, 1, '2024-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(10, 10, 1, '2024-02-01');

-- Reprobaran
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(11, 11, 1, '2024-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(12, 12, 1, '2024-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(13, 13, 1, '2024-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(14, 14, 1, '2024-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(15, 15, 1, '2024-02-01');

-- -----------------------------------------------------------------------------------------
-- Curso 2, 2S
-- Aprobaran
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(16, 1, 2, '2024-07-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(17, 2, 2, '2024-07-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(18, 3, 2, '2024-07-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(19, 4, 2, '2024-07-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(20, 5, 2, '2024-07-01');

-- Reprobaran
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(21, 6, 2, '2024-07-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(22, 7, 2, '2024-07-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(23, 8, 2, '2024-07-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(24, 9, 2, '2024-07-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(25, 10, 2, '2024-07-01');

-- --------------------------------------------------------------------------------------------
-- Curso 3
-- Aprobaran
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(26, 1, 3, '2025-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(27, 2, 3, '2025-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(28, 3, 3, '2025-02-01');

-- Reprobaron
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(29, 4, 3, '2025-02-01');
INSERT INTO registroacademico_f1.asignacion (id, id_estudiante, id_seccion, fecha) VALUES 
(30, 5, 3, '2025-02-01');

/* ¡BANDERA! => Eliminar 29 y 30 para probar Trigger que:
				Al insertar "Acta_Nota" analice si aprobó o no
                y cree el insert en "Aprobaacion_Curso"
*/


-- 17. ACTAS_NOTA
-- Curso 1, 1S - Aprobaron
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(1, 1, 40, 30, '2024-06-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(2, 2, 42, 28, '2024-06-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(3, 3, 44, 26, '2024-06-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(4, 4, 45, 25, '2024-06-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(5, 5, 43, 27, '2024-06-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(6, 6, 46, 24, '2024-06-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(7, 7, 47, 20, '2024-06-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(8, 8, 48, 22, '2024-06-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(9, 9, 49, 21, '2024-06-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(10, 10, 50, 20, '2024-06-15');

-- Curso 1, 1S - Reprobaron
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(11, 11, 30, 0, '2024-06-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(12, 12, 32, 18, '2024-06-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(13, 13, 28, 0, '2024-06-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(14, 14, 35, 25, '2024-06-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(15, 15, 33, 27, '2024-06-15');

-- Curso 2, 2S - Aprobaron
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(16, 16, 40, 20, '2024-12-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(17, 17, 42, 28, '2024-12-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(18, 18, 44, 26, '2024-12-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(19, 19, 45, 25, '2024-12-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(20, 20, 43, 27, '2024-12-15');

-- Curso 2, 2S - Reprobaron
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(21, 21, 30, 0, '2024-12-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(22, 22, 32, 18, '2024-12-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(23, 23, 28, 0, '2024-12-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(24, 24, 35, 25, '2024-12-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(25, 25, 32, 12, '2024-12-15');

-- Curso 3 (Aprobaron)
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(26, 26, 42, 22, '2025-06-15');
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(27, 27, 45, 23, '2025-06-15');

-- Curso 3 (Reprobaron)
INSERT INTO registroacademico_f1.acta_nota (id, id_asignacion, zona_obtenida, nota_examen_final, fecha) VALUES 
(28, 28, 47, 12, '2025-06-15');


/* ¡BANDERA! => Eliminar 29 y 30 para probar Trigger que:
				Al insertar "Acta_Nota" analice si aprobó o no
                y cree el insert en "Aprobaacion_Curso"
*/


-- 18. APROBACION
-- Curso 1, 1S - Aprobaron
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(1, 1, 1);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(2, 2, 1);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(3, 3, 1);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(4, 4, 1);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(5, 5, 1);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(6, 6, 1);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(7, 7, 1);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(8, 8, 1);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(9, 9, 1);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(10, 10, 1);

-- Curso 1, 1S - Reprobaron
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(11, 11, 0);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(12, 12, 0);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(13, 13, 0);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(14, 14, 0);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(15, 15, 0);

-- Curso 2, 2S - Aprobaron
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(16, 16, 1);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(17, 17, 1);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(18, 18, 1);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(19, 19, 1);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(20, 20, 1);

-- Curso 2, 2S - Reprobaron
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(21, 21, 0);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(22, 22, 0);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(23, 23, 0);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(24, 24, 0);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(25, 25, 0);

-- Curso 3 - Aprobaron
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(26, 26, 1);
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(27, 27, 1);

-- Curso 3 - Reprobó
INSERT INTO registroacademico_f1.aprobacion_curso (id, acta_nota_codigo, aprobado) VALUES 
(28, 28, 0);


-- 19: Desasignacion
INSERT INTO registroacademico_f1.desasignacion (id, id_asignacion, fecha, motivo) VALUES 
(1, 29, '2025-07-01', 'Baja voluntaria (Enfermedad)');
INSERT INTO registroacademico_f1.desasignacion (id, id_asignacion, fecha, motivo) VALUES 
(2, 30, '2025-07-01', 'Cambio de genero xD');


-- 20: TRANSACCIONES
/* SE GENERAN CON TRIGGER AUTOMATICO*/


/*
SELECT * FROM ESTUDIANTE;
SELECT * FROM INSCRIPCION; -- A CARRERA

SELECT * FROM ASIGNACION;

SELECT * FROM SECCION; -- CURSO (1, 2 Y 3 = SISETMAS)
SELECT * FROM CURSO;
----------------------
SELECT * FROM PERIODO_SECCION
*/