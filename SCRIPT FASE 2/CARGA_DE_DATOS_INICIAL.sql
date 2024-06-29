/* 1. Estudiante */
INSERT INTO `registroacademico_f1`.`estudiante` (`nombre`, `ingreso_familiar`, `fecha_nacimiento`, `telefono`, `correo`)
VALUES
('Juan Pérez', 2500.00, '2000-05-15', '55512342', 'juan.perez@example.com'),
('María López', 3200.00, '1999-11-20', '55556786', 'maria.lopez@example.com');

/* 2. Curso */
INSERT INTO `registroacademico_f1`.`curso` (`nombre`, `creditos`) VALUES
('Matemáticas Básicas', 4),
('Historia Universal', 3);

/* 3. Edificio */
INSERT INTO `registroacademico_f1`.`edificio` (`nombre`, `direccion`) VALUES
('MODULO G', 'Av. Central 123'),
('MODULO E', 'Calle 45 Norte');

/* 4. Salon */
INSERT INTO `registroacademico_f1`.`salon` (`id_edificio`, `nombre`, `capacidad`, `nivel`) VALUES
(1, 'Salon Hugo Piena', 30, 1),
(1, 'Salon de proyecciones', 25, 1),
(2, 'Salon Mayor', 40, 2);

/* 5. Catedratico */
INSERT INTO `registroacademico_f1`.`catedratico` (`nombre`, `apellido`, `sueldo_mensual`, `telefono`, `correo`) VALUES
('Moi', 'Guevara', 15000.00, '55598876', 'carlos.gonzalez@example.com'),
('MauGod', 'López', 4800.00, '55565543', 'ana.martinez@example.com');

/* 6. Ciclo */
INSERT INTO `registroacademico_f1`.`ciclo` (`id`, `ciclo`) VALUES
('1S', 'Primer S'),
('2S', 'Segundo S'),
('VJ', 'EVJ'),
('VD', 'EVD');

/* 7. Seccion */
INSERT INTO `registroacademico_f1`.`seccion` (`id_curso`, `id_salon`, `id_catedratico`, `id_ciclo`, `seccion`, `anio`) VALUES
(1, 1, 1, '1S', 'A', 2024),
(2, 2, 2, '2S', 'B', 2024);

/* 8. Asignacion */
INSERT INTO `registroacademico_f1`.`asignacion` (`id_estudiante`, `id_seccion`, `fecha`) VALUES
(1, 1, '2024-01-15'),
(2, 2, '2024-01-15');

/* 9. Acta Nota */
/*Se puede crear un TRIGGER para validar que la zona sea entre 0 y 70, y el examen entre 0 y 30*/
INSERT INTO `registroacademico_f1`.`acta_nota` (`id_asignacion`, `zona_obtenida`, `nota_examen_final`, `fecha`) VALUES
(1, 50, 25, '2024-05-30'),
(2, 61,28, '2024-05-30');


/* 10. Aprobacion Curso */
INSERT INTO `registroacademico_f1`.`aprobacion_curso` (`id`, `acta_nota_codigo`, `aprobado`) VALUES
(1, 1, 1),
(2, 2, 1);

/* 11. Unidad Academica */
INSERT INTO `registroacademico_f1`.`unidad_academica` (`unidad`, `ubicacion`, `telefono`, `sitio_web`) VALUES
('Facultad de Ingeniería', 'Av. Las Americas', '55585432', 'www.ingenieria.edu.gt'),
('Facultad de Humanidades', 'Calle Cultura 200', '55538765', 'www.humanidades.edu.gt');

/* 12. Carrera */
INSERT INTO `registroacademico_f1`.`carrera` (`id_unidad_academica`, `nombre`) VALUES
(1, 'Ingeniería en Ciencias y Sistemas'),
(2, 'Licenciatura en Filosofía');

/* 13. Jornada */
INSERT INTO `registroacademico_f1`.`jornada` (`jornada`, `hora_inicio`, `hora_fin`) VALUES
('Matutina', '08:00:00', '12:00:00'),
('Vespertina', '12:00:00', '18:00:00'),
('Nocturna', '18:00:00', '22:00:00'),
('Mixta', '08:00:00', '22:00:00');

/* 14. Semestre */
INSERT INTO `registroacademico_f1`.`semestre` (`id`, `semestre`) VALUES
('1S', 'Primer Semestre'),
('2S', 'Segundo Semestre'),
('3S', 'Tercer Semestre'),
('4S', 'Cuarto Semestre'),
('5S', 'Quinto Semestre'),
('6S', 'Sexto Semestre'),
('7S', 'Septimo Semestre'),
('8S', 'Octavo Semestre'),
('9S', 'Noveno Semestre'),
('10S', 'Decimo Semestre');

INSERT INTO `registroacademico_f1`.`pensum` (`id_carrera`, `id_jornada`, `id_semestre_inicio`, `id_semestre_fin`, `nombre`, `anio_inicio`, `anio_fin`, `creditos_cierre`, `cantidad_semestres`) VALUES
(1, 1, '1S', '10S', 'Pensum 2024', 2024, NULL, 260, 10);

/* 16. Curso Pensum */
INSERT INTO `registroacademico_f1`.`curso_pensum` (`id_pensum`, `id_curso`, `id_semestre`, `obligatorio`, `nota_aprobacion`, `zona_minima`) VALUES
(3, 1, '1S', 1, 61, 31),
(3, 2, '2S', 0, 61, 31);

/* 17. Creditos Prerrequisito */
INSERT INTO `registroacademico_f1`.`creditos_prerrequisito` (`id`, `creditos_requeridos`, `curso_pensum_id`) VALUES
(1, '15', 1);

/* 18. Curso Prerrequisito */
INSERT INTO `registroacademico_f1`.`curso_prerrequisito` (`id_curso_pensum`, `id_curso_prerrequisito`) VALUES
(5, 1);

/* 19. Dia */
INSERT INTO `registroacademico_f1`.`dia` (`dia`) VALUES
('Lunes'),
('Martes'),
('Miercoles'),
('Jueves'),
('Viernes');

/* 20. Dia seccion */
INSERT INTO `registroacademico_f1`.`dia_seccion` (`id_seccion`, `id_dia`) VALUES
(1, 1),
(2, 2);

/* 21. Inscripcion */
INSERT INTO `registroacademico_f1`.`inscripcion` (`id_estudiante`, `id_pensum`, `fecha`) VALUES
(1, 3, '2024-01-10'),
(2, 3, '2024-01-10');

/* 22. Periodo */
INSERT INTO `registroacademico_f1`.`periodo` (`id_jornada`, `hora_inicio`, `hora_fin`) VALUES
(1, '08:00:00', '09:00:00'),
(2, '14:00:00', '15:00:00');

/* 23. periodo Seccion */
INSERT INTO `registroacademico_f1`.`periodo_seccion` (`id_seccion`, `id_periodo`) VALUES
(1, 1),
(2, 2);

/* 23. Desasignacion */
INSERT INTO `registroacademico_f1`.`desasignacion` (`id`, `id_asignacion`, `fecha`, `motivo`) VALUES
(1, 1, '2024-03-01', 'Traslape de cursos'),
(2, 2, '2024-03-01', 'Cambio de horario');


