
INSERT INTO `registroacademico_f1`.`ciclo` (`id`, `ciclo`) VALUES
('1S', 'Primer S'),
('2S', 'Segundo S'),
('VJ', 'EVJ'),
('VD', 'EVD');


INSERT INTO `registroacademico_f1`.`jornada` (`jornada`, `hora_inicio`, `hora_fin`) VALUES
('Matutina', '08:00:00', '12:00:00'),
('Vespertina', '12:00:00', '18:00:00'),
('Nocturna', '18:00:00', '22:00:00'),
('Mixta', '08:00:00', '22:00:00');

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


INSERT INTO `registroacademico_f1`.`dia` (`dia`) VALUES
('Lunes'),
('Martes'),
('Miercoles'),
('Jueves'),
('Viernes');


INSERT INTO `registroacademico_f1`.`periodo` (`id_jornada`, `hora_inicio`, `hora_fin`) VALUES
(1, '08:00:00', '09:00:00'),
(2, '14:00:00', '15:00:00');


INSERT INTO `registroacademico_f1`.`tipo_transaccion` (`nombre`)  VALUES
('INSERT'),
('SELECT'),
('UPDATE'),
('DELETE');