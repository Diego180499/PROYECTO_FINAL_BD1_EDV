CREATE VIEW catedratico_sistemas AS
SELECT cat.codigo, cat.nombre, cat.apellido,ci.id as ciclo_id, ci.ciclo, car.id as carrera_id, s.anio
FROM seccion AS s
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
;


CREATE VIEW estudiante_curso_aprobado AS
SELECT e.carne, e.nombre AS estudiante, c.id AS codigo_curso, c.nombre AS curso, cat.codigo, ci.id as ciclo_id, ac.aprobado, s.anio
FROM estudiante AS e
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
;


SELECT eca.carne, eca.estudiante, eca.codigo_curso, eca.curso, eca.codigo as id_catedratico, cs.nombre, cs.apellido, cs.ciclo, eca.anio
FROM estudiante_curso_aprobado AS eca 
	INNER JOIN catedratico_sistemas AS cs
	ON eca.codigo = cs.codigo
	WHERE cs.carrera_id = 1 AND cs.ciclo_id = "2S" AND cs.anio = 2024 -- CICLO y ANIO EN EL QUE SE APROBO EL CURSO DE SISTEMAS CON EL CATEDRATICO DE SISTEMAS: 
    AND eca.ciclo_id = "1S" AND eca.aprobado = 1 AND eca.anio = 2025; -- CICLO Y ANIO EN EL QUE SE LLEVA EL CURSO CON EL CATEDRATCIO DE SISTEMAS;
;

-- SELECT * FROM SECCION

-- SELECT * FROM estudiante_curso_aprobado;
-- SELECT * FROM catedratico_sistemas;

-- DROP VIEW estudiante_curso_aprobado;
-- DROP VIEW catedratico_sistemas;