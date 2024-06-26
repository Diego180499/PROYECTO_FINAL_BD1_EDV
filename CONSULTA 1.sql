CREATE VIEW promedio_estudiante as
select estudiante_nota.carne, estudiante_nota.nombre, estudiante_nota.promedio, ca.id, ins.fecha from
(select   con.carne, con.nombre, sum(con.zona_obtenida), sum(con.nota_examen_final), avg(zona_obtenida+nota_examen_final) as promedio FROM
(SELECT e.carne, e.nombre, an.zona_obtenida, an.nota_examen_final FROM estudiante as e
INNER JOIN asignacion as a
ON e.carne = a.id_estudiante
INNER JOIN acta_nota as an
ON an.id_asignacion = a.id
INNER JOIN aprobacion_curso as ac
ON ac.acta_nota_codigo = an.id
WHERE ac.aprobado = 1
) as con
GROUP BY con.carne
)
as estudiante_nota

INNER JOIN inscripcion as ins
ON estudiante_nota.carne = ins.id_estudiante
INNER JOIN pensum as p
ON ins.id_pensum = p.id
INNER JOIN carrera as ca
ON p.id_carrera = ca.id
 ;
 /*----------*/
 
 
 select * from promedio_estudiante;

SELECT
    c.nombre AS carrera_nombre,
    p.nombre,
    p.promedio
FROM
    promedio_estudiante as p
INNER JOIN
    carrera as c ON p.id = c.id
WHERE
    p.promedio = (
        SELECT MAX(p1.promedio)
        FROM promedio_estudiante as p1
        WHERE p1.id = p.id
    )
AND
p.fecha < '2022-01-01'
;