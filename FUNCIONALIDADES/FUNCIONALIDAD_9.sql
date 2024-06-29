DELIMITER $$

CREATE PROCEDURE ingresarNota(
    IN id_seccion_p INT,
    IN id_estudiante_p INT,
    IN zona_p DECIMAL(10, 2),
    IN examen_final_p DECIMAL(10, 2)
)
BEGIN  
    DECLARE id_asignacion_var INT;
    DECLARE id_curso_var INT;
    DECLARE acta_nota_codigo_var INT;
    DECLARE nota_aprobacion_var INT,
    DECLARE zona_minima_var INT;
    DECLARE aprobado_var BOOLEAN;
    -- Verificamos que la sección esté registrada
    IF EXISTS (SELECT * FROM registroacademico_f1.seccion WHERE id = id_seccion_p LIMIT 1) THEN
        -- Verificamos que el estudiante exista
        IF EXISTS (SELECT * FROM registroacademico_f1.estudiante WHERE carne = id_estudiante_p LIMIT 1) THEN
            -- Verificamos que tanto el valor de la zona como el de el examen final sean valores válidos
            IF (zona_p > 0 AND examen_final_p > 0) THEN
                -- Obtenemos el id de la asignacion
                SELECT id INTO id_asignacion_var 
                FROM asignacion 
                WHERE id_estudiante = id_estudiante_p AND id_seccion = id_seccion_p
                LIMIT 1;

                -- Ingresamos las notas a la tabla acta_nota
                INSERT INTO registroacademico_f1.asignacion (id_asignacion, zona_obtenida, nota_examen_final, fecha) 
                VALUES (id_asignacion_var, ROUND(zona_p), ROUND(examen_final_p), CURRENT_DATE());

                -- Buscamos el id_curso que se impartirá en la seccion
                SELECT c.id INTO id_curso_var FROM seccion as s
                INNER JOIN curso as c
                ON s.id_curso = c.id 
                WHERE s.id = id_seccion_p
                LIMIT 1;
                -- Buscamos las notas de aprobación y zona minima del curso
                SELECT cp.nota_aprobacion, cp.zona_minima INTO nota_aprobacion_var, zona_minima_var FROM registroacademico_f1.estudiante as e 
                INNER JOIN inscripcion as i 
                ON e.carne = i.id_estudiante
                INNER JOIN pensum as p
                ON p.id = i.id_pensum
                INNER JOIN curso_pensum as cp 
                ON p.id = cp.id_pensum
                WHERE e.carne = id_estudiante_p AND cp.id_curso = id_curso_var
                LIMIT 1;
                -- Realizamos la comparación
                IF ( ROUND(zona_p) >= zona_minima_var AND (ROUND(zona_p) + ROUND(examen_final_p)) >= nota_aprobacion) THEN
                    aprobado_var = 1;
                ELSE
                    aprobado_var = 0;
                END IF;
                -- Buscamos el acta_nota_codigo
                SELECT id INTO acta_nota_codigo_var FROM acta_nota 
                WHERE id_asignacion = id_asignacion_var
                LIMIT 1;

                -- Realizamos el insert a la tabla aprobacion_curso
                INSERT INTO registroacademico_f1.aprobacion_curso (acta_nota_codigo, aprobado) 
                VALUES (acta_nota_codigo_var, aprobado_var);

            ELSE
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Los valores de la zona y/o el examen final son inválidos';    
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

CALL ingresarNota(1, 123, 25.5, 40.0);
