CREATE VIEW catedratico_sistemas AS
SELECT cat.codigo, cat.nombre, cat.apellido, ci.ciclo FROM seccion AS s
INNER JOIN curso AS c
ON s.id_curso = c.id
INNER JOIN curso_pensum AS cp
ON cp.id_curso = c.id 
INNER JOIN pensum AS p
ON cp.id_pensum = p.id
INNER JOIN carrera AS car 
ON p.id_carrera = car.id 
INNER JOIN ciclo AS ci 
ON s.id_ciclo = ci.id 
INNER JOIN catedratico AS cat
ON s.id_catedratico = cat.codigo
WHERE car.id = "ICS" AND ci.id = "S1" 
;

CREATE VIEW estudiante_curso_aprobado AS
SELECT e.carne, e.nombre AS estudiante, c.id AS codigo_curso, c.nombre AS curso, cat.codigo FROM estudiante AS e
INNER JOIN asignacion AS a
ON a.id_estudiante = e.carne
INNER JOIN seccion AS s
ON a.id_seccion = s.id
INNER JOIN curso AS c
ON s.id_curso = c.id 
INNER JOIN catedratico AS cat 
ON s.id_catedratico = cat.codigo 
INNER JOIN ciclo AS ci 
ON s.id_ciclo = ci.id 
INNER JOIN acta_nota AS an 
ON an.id_asignacion = a.id 
INNER JOIN aprobacion_curso AS ac 
ON ac.acta_nota_codigo = an.id 
WHERE ci.id = "S1" AND ac.aprobado = true
;


SELECT eca.carne, eca.estudiante, eca.codigo_curso, eca.curso, eca.codigo as id_catedratico, cs.nombre, cs.apellido, cs.ciclo
FROM estudiante_curso_aprobado AS eca 
INNER JOIN catedratico_sistemas AS cs
ON eca.codigo = cs.codigo
;
