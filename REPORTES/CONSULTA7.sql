select estudiante.carne as carne_estudiante, estudiante.nombre as nombre_estudiante , curso.nombre as nombre_curso, aprobacion_curso.aprobado from aprobacion_curso
INNER JOIN acta_nota
ON aprobacion_curso.acta_nota_codigo = acta_nota.id
INNER JOIN asignacion
ON acta_nota.id_asignacion = asignacion.id
INNER JOIN seccion
ON asignacion.id_seccion = seccion.id
INNER JOIN estudiante
ON asignacion.id_estudiante = estudiante.carne
INNER JOIN curso
ON seccion.id_curso = curso.id
where carne_estudiante = 1
;

