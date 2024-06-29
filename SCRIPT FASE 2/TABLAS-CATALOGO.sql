
INSERT INTO `registroacademico_f1`.`ciclo` (`id`, `ciclo`) VALUES
('1S', 'Primer S'),
('2S', 'Segundo S'),
('VJ', 'EVJ'),
('VD', 'EVD');


INSERT INTO `registroacademico_f1`.`jornada` (`id`, `jornada`, `hora_inicio`, `hora_fin`) VALUES
(1,'Matutina', '08:00:00', '12:00:00'),
(2,'Vespertina', '12:00:00', '18:00:00'),
(3,'Nocturna', '18:00:00', '22:00:00'),
(4,'Mixta', '08:00:00', '22:00:00');

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
(1, '09:00:00', '10:00:00'),
(1, '10:00:00', '11:00:00'),
(1, '11:00:00', '12:00:00'),
(2, '12:00:00', '13:00:00'),
(2, '13:00:00', '14:00:00'),
(2, '14:00:00', '15:00:00'),
(2, '15:00:00', '16:00:00'),
(2, '16:00:00', '17:00:00'),
(2, '17:00:00', '18:00:00'),
(3, '18:00:00', '19:00:00'),
(3, '19:00:00', '20:00:00'),
(3, '20:00:00', '21:00:00'),
(3, '21:00:00', '22:00:00'),
(4, '08:00:00', '22:00:00');


INSERT INTO `registroacademico_f1`.`tipo_transaccion` (`nombre`)  VALUES
(1,'INSERT'),
(2,'SELECT'),
(3,'UPDATE'),
(4,'DELETE');