CREATE VIEW curso_prerequisito as
SELECT
c1.id as id_curso_prerequisito,
c1.nombre as curso_prerequisito,
c1.creditos, 
c.id as id_curso, 
c.nombre as curso 
FROM curso_prerrequisito as cpre
INNER JOIN curso_pensum as cp
ON cpre.id_curso_pensum = cp.id
INNER JOIN curso as c
ON cp.id_curso = c.id
INNER JOIN curso as c1
ON cpre.id_curso_prerrequisito = c1.id
;

-- --------------------

CREATE VIEW curso_postrequisito as
SELECT
c1.id as id_curso_postrequisito,
c1.nombre as curso_postrequisito,
c1.creditos,
c.id as id_curso,
c.nombre as curso

FROM curso_prerrequisito as cpre
INNER JOIN curso as c
ON cpre.id_curso_prerrequisito = c.id
INNER JOIN curso_pensum as cp
ON cpre.id_curso_pensum = cp.id

INNER JOIN curso as c1
ON cp.id_curso = c1.id
;

SELECT * FROM curso_prerequisito as cpre
LEFT  JOIN curso_postrequisito as cpost 
ON cpre.curso = cpost.curso
UNION
SELECT * FROM curso_prerequisito as cpre
RIGHT JOIN curso_postrequisito as cpost 
ON cpre.curso = cpost.curso

-- WHERE cp.curso_pensum = 15 (NO FUNCIONA)
;

-- SELECT * FROM CURSO_PRERREQUISITO;

/*
cpost.id_curso_postrequisito, cpost.curso_postrequisito, cpost.creditos
*/