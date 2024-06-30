DELIMITER $$
CREATE PROCEDURE agregarPrerrequisito(
    IN id_carrera_p INT,
    IN id_jornada_p INT,
    IN id_curso_p INT, 
    IN id_curso_prerrequisito_p INT
)
BEGIN  
    DECLARE id_pensum_var INT;
    DECLARE id_curso_pensum_var INT;
    IF EXISTS (SELECT * FROM registroacademico_f1.curso WHERE id = id_curso_p LIMIT 1) THEN
        IF EXISTS (SELECT * FROM registroacademico_f1.curso WHERE id = id_curso_p LIMIT 1) THEN
            -- buscamos el pensum que corresponda a la carrera y jornada
            IF EXISTS (SELECT * FROM pensum 
                        WHERE id_carrera = id_carrera_p AND id_jornada = id_jornada_p 
                        LIMIT 1)THEN
                            SELECT id INTO id_pensum_var 
                                FROM pensum 
                                WHERE id_carrera = id_carrera_p AND id_jornada = id_jornada_p 
                                LIMIT 1;

                        IF EXISTS (SELECT * FROM curso_pensum 
                        WHERE id_curso = id_curso_p AND id_pensum = id_pensum_var 
                        LIMIT 1)THEN

                            SELECT id INTO id_curso_pensum_var 
                                FROM curso_pensum 
                                WHERE id_curso = id_curso_p AND id_pensum = id_pensum_var 
                                LIMIT 1;
                            IF NOT EXISTS (SELECT * FROM registroacademico_f1.curso_prerrequisito WHERE id_curso_pensum = id_curso_pensum_var AND id_curso_prerrequisito = id_curso_prerrequisito_p LIMIT 1) THEN
                                -- Insertar curso prerrequisito
                                INSERT INTO registroacademico_f1.curso_prerrequisito (id_curso_pensum, id_curso_prerrequisito) 
                                VALUES (id_curso_pensum_var, id_curso_prerrequisito_p);
                            ELSE
                                 SIGNAL SQLSTATE '45000'
                            SET MESSAGE_TEXT = 'Ya se le asignó el curso prerrequisito al curso seleccionado'; 
                            END IF;
                        ELSE
                            SIGNAL SQLSTATE '45000'
                            SET MESSAGE_TEXT = 'No existe un curso_pensum que contenga la carrera en la jornada seleccionada'; 
                        END IF;
            ELSE
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'No existe un pensum que contenga la carrera en la jornada seleccionada';
            END IF;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El curso prerrequisito que se desea agregar no existe aún';
         END IF;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El curso al que se desea agregar un prerequisito no existe aún';
    END IF;
END$$
DELIMITER ;

-- id_curso_pensum = null (no existe Pensum con esa jornada y/o carrera)
-- VALIDAR que el el "id_curso_pensum" y "id_curso_prerrequsito" no sean los mismo que en otro registro
CALL agregarPrerrequisito(
    2,    -- id_carrera_p
    2,    -- id_jornada_p
    2,  -- id_curso_p
    1   -- id_curso_prerrequisito_p
);

SELECT * FROM CURSO_PENSUM;
SELECT * FROM CURSO_PRERREQUISITO;
-- DROP PROCEDURE agregarPrerrequisito;