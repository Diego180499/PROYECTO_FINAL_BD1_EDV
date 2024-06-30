CREATE VIEW cursos_carrera as
select curso.id as id_curso , curso.nombre as curso_nombre , carrera.id as carrera_id, carrera.nombre as nombre_carrera  from pensum
INNER JOIN carrera
ON pensum.id_carrera = carrera.id
INNER JOIN curso_pensum
ON curso_pensum.id_pensum = pensum.id
INNER JOIN curso 
ON curso_pensum.id_curso = curso.id
;



SELECT * FROM cursos_carrera
where carrera_id = 2
;