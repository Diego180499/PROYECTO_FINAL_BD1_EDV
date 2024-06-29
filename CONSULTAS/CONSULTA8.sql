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
WHERE carrera.id = 1 -- puede ser cualquier otra carrera
AND estudiante_creditos.total_creditos >= pensum.creditos_cierre;