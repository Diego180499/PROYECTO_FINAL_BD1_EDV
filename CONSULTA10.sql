CREATE VIEW estudiante_curso AS
SELECT e.carne, e.nombre AS estudiante, c.id AS curso_id, c.nombre AS curso, s.id AS seccion_id, s.seccion FROM estudiante AS e
INNER JOIN asignacion AS a
ON a.id_estudiante = e.carne 
INNER JOIN seccion AS s
ON a.id_seccion = s.id 
INNER JOIN curso AS c
ON s.id_curso = c.id
WHERE e.carne = ""
;
CREATE VIEW estudiantes_curso AS
SELECT e.carne, e.nombre AS estudiante, s.id AS seccion_id FROM estudiante AS e
INNER JOIN asignacion AS a
ON a.id_estudiante = e.carne 
INNER JOIN seccion AS s
ON a.id_seccion = s.id 
INNER JOIN curso AS c
ON s.id_curso = c.id
WHERE e.carne != ""
;

SELECT * FROM estudiante_curso AS ec
INNER JOIN estudiantes_curso AS esc
ON ec.seccion_id = esc.seccion_id
;