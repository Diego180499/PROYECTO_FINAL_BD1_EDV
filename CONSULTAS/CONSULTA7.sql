CREATE VIEW estudiante_creditos AS
SELECT estudiante.carne, estudiante.nombre, sum(curso.creditos) as total_creditos  FROM estudiante
	INNER JOIN asignacion as a
	ON estudiante.carne = a.id_estudiante -- SELECT * FROM ASIGNACION;
	INNER JOIN acta_nota as an
	ON an.id_asignacion = a.id -- SELECT * FROM ACTA_NOTA;
	INNER JOIN aprobacion_curso as ac
	ON ac.acta_nota_codigo = an.id -- SELECT * FROM APROBACION_CURSO;
	INNER JOIN seccion as sec
	ON a.id_seccion = sec.id -- SELECT * FROM SECCION;
	INNER JOIN curso
	ON sec.id_curso = curso.id -- SELECT * FROM CURSO;
WHERE ac.aprobado = 1 GROUP BY estudiante.carne
;

-- Acceder a Inscripcion->Pensum->Carrera->
SELECT estudiante.carne, estudiante.nombre, estudiante_creditos.total_creditos, carrera.nombre, promedio_estudiante.promedio
FROM estudiante
	INNER JOIN inscripcion
	ON estudiante.carne = inscripcion.id_estudiante -- SELECT * FROM INSCRIPCION;
	INNER JOIN pensum
	ON inscripcion.id_pensum = pensum.id -- SELECT * FROM PENSUM;
	INNER JOIN carrera
	ON pensum.id_carrera = carrera.id -- SELECT * FROM CARRERA;
	INNER JOIN estudiante_creditos
	ON estudiante.carne = estudiante_creditos.carne -- SELECT * FROM estudiante_creditos; -- CREDITOS ganados x ESTUDIANTE
	INNER JOIN promedio_estudiante
	ON estudiante.carne = promedio_estudiante.carne -- SELECT * FROM promedio_estudiante; -- PROMEDIO cursos aprob x ESTUDIANTE
-- Conocer ESTUDIANTES de X CARRERA con sus CREDITOS aprobados, y su PROMEDIO sobre CURSOS_APROBADOS)
WHERE carrera.id = 1 -- ID Ing. Sistemas
AND estudiante_creditos.total_creditos >= pensum.creditos_cierre;

-- SELECT * FROM PENSUM;