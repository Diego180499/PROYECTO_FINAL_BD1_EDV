DELIMITER $$

CREATE PROCEDURE asignacionCurso(
    IN id_seccion_p INT,
    IN id_estudiante_p INT
)
BEGIN  
    DECLARE id_curso_var INT;
    DECLARE creditos_estudiante_var INT;
    DECLARE creditos_curso_prerrequisito_var INT;
    -- Verificamos que la sección esté registrada
    IF EXISTS (SELECT * FROM registroacademico_f1.seccion WHERE id = id_seccion_p LIMIT 1) THEN
        -- Verificamos que el periodo esté registrado
        IF EXISTS (SELECT * FROM registroacademico_f1.estudiante WHERE carne = id_estudiante_p LIMIT 1) THEN
            -- Obtenemos el ID del curso al cual corresonde dicha seccion
            SELECT id_curso INTO id_curso_var 
                FROM seccion 
                WHERE id = id_seccion_p
                LIMIT 1;
            -- Verificamos si el estudiante ya está asignado a otra sección del mismo curso o si se intenta reasignar
            IF EXISTS ( 
                SELECT * FROM registroacademico_f1.asignacion as a 
                INNER JOIN seccion as s 
                ON a.id_seccion = s.id
                WHERE a.id_estudiante = id_estudiante_p AND s.id_curso = id_curso_var LIMIT 1) THEN
                    SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'El estudiante ya se ha asignado a otra seccion del curso o intenta volverse asignar a la misma seccion';
            ELSE

            -- Verificar que el curso corresponde a la carrera
                IF EXISTS ( 
                    SELECT * FROM registroacademico_f1.estudiante as e 
                    INNER JOIN inscripcion as i 
                    ON e.carne = i.id_estudiante
                    INNER JOIN pensum as p
                    ON p.id = i.id_pensum
                    INNER JOIN curso_pensum as cp 
                    ON p.id = cp.id_pensum
                    INNER JOIN creditos_prerrequisito as cpre
                    ON cp.id = cpre.curso_pensum_id
                    WHERE e.carne = id_estudiante_p AND cp.id_curso = id_curso_var GROUP BY curso_pensum LIMIT 1) THEN

                    -- Verificamos cuantos creditos prerrequisito tiene el curso
                    SELECT cpre.creditos_prerrequisito INTO creditos_curso_prerrequisito_var FROM registroacademico_f1.estudiante as e 
                    INNER JOIN inscripcion as i 
                    ON e.carne = i.id_estudiante
                    INNER JOIN pensum as p
                    ON p.id = i.id_pensum
                    INNER JOIN curso_pensum as cp 
                    ON p.id = cp.id_pensum
                    INNER JOIN creditos_prerrequisito as cpre
                    ON cp.id = cpre.curso_pensum_id
                    WHERE e.carne = id_estudiante_p AND cp.id_curso = id_curso_var GROUP BY curso_pensum LIMIT 1;

                    -- Verificamos cuantos creditos tiene el estudiante
                    SELECT sum(curso.creditos) as total_creditos INTO creditos_estudiante_var FROM estudiante
                    INNER JOIN asignacion as a
                    ON estudiante.carne = a.id_estudiante
                    INNER JOIN acta_nota as an
                    ON an.id_asignacion = a.id
                    INNER JOIN aprobacion_curso as ac
                    ON ac.acta_nota_codigo = an.id
                    INNER JOIN seccion as sec
                    ON a.id_seccion = sec.id
                    INNER JOIN curso
                    ON sec.id_curso = curso.id
                    WHERE ac.aprobado = 1 AND estudiante.carne = id_estudiante_p       
                    GROUP BY estudiante.carne
                    LIMIT 1;
                    -- Verificamos que el estudiante tenga los creditos suficientes
                    IF(creditos_estudiante_var => creditos_curso_prerrequisito_var) THEN 
                        INSERT INTO registroacademico_f1.asignacion (id_estudiante, id_seccion, fecha) 
                        VALUES (id_estudiante_p, id_seccion_p, CURRENT_DATE());
                    ELSE
                        SIGNAL SQLSTATE '45000'
                        SET MESSAGE_TEXT = 'No tiene los creditos necesarios para asignarse al curso';
                    END IF;
                ELSE
                    SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'El curso no pertenece al pensum de ninguna carrera asignada';
                END IF;
            END IF;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No hay registro de algun estudiante con el carné ingresado';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La sección no existe aún';
    END IF;
END$$

DELIMITER ;