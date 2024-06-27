CREATE VIEW catedratico_curso as
select curso.id as id_curso, curso.nombre as curso, seccion.seccion as seccion, catedratico.codigo as id_catedratico, catedratico.nombre as nombre_catedratico from seccion
INNER JOIN curso
ON seccion.id_curso = curso.id
INNER JOIN catedratico 
ON seccion.id_catedratico = catedratico.codigo
;


SELECT * FROM catedratico_curso
WHERE catedratico_curso.id_catedratico = "";