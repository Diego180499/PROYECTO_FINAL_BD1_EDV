select 
e.carne as id_estudiante , e.nombre as nombre_estudiante , curso.id as codigo_curso, curso.nombre as nombre_curso, ac.aprobado
from aprobacion_curso as ac
INNER JOIN acta_nota as an
ON ac.acta_nota_codigo = an.id
INNER JOIN asignacion as asign
ON an.id_asignacion = asign.id
INNER JOIN estudiante as e
ON asign.id_estudiante = e.carne
INNER JOIN seccion as sec
ON asign.id_seccion = sec.id
INNER JOIN curso
ON sec.id_curso = curso.id
WHERE curso.id = "1" -- ID de Curso
;
