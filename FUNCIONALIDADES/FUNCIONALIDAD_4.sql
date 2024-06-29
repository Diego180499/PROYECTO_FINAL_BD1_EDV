-------------------------|

ALTER TABLE registroacademico_f1.creditos_prerrequisito
MODIFY COLUMN creditos_requeridos INT NOT NULL;

-----------------------
ALTER TABLE curso_pensum
MODIFY COLUMN id INT AUTO_INCREMENT PRIMARY KEY
;

--------------------------------
ALTER TABLE `registroacademico_f1`.`creditos_prerrequisito` 
CHANGE COLUMN `id` `id` INT NOT NULL AUTO_INCREMENT ;

-------------------------|

DELIMITER $$

CREATE PROCEDURE crearCursoPensum(
    IN id_curso_p INT,
    IN creditos_necesarios_p INT,
    IN obligatorio_p BOOLEAN,
    IN id_jornada_p INT,
    IN id_carrera_p INT,
    IN nota_aprobacion_p INT,
    IN zona_minima_p INT,
    IN id_semestre_p CHAR(3)
)
BEGIN  
    DECLARE id_pensum_var INT;
    DECLARE id_curso_pensum_var INT;
    -- Verifica que el curso exista 
    IF EXISTS (SELECT * FROM registroacademico_f1.curso WHERE id = id_curso_p LIMIT 1) THEN
    -- Valida los enteros positivos
        IF (creditos_necesarios_p > 0 AND nota_aprobacion_p > 0 AND zona_minima_p > 0)THEN
            IF EXISTS (SELECT * FROM registroacademico_f1.pensum WHERE id_carrera = id_carrera_p AND id_jornada = id_jornada_p LIMIT 1) THEN
                -- Buscamos el pensum que corresponda a la carrera y jornada
                SELECT id INTO id_pensum_var 
                            FROM pensum 
                            WHERE id_carrera = id_carrera_p AND id_jornada = id_jornada_p 
                            LIMIT 1;

                -- Insertar curso_pensum
                INSERT INTO registroacademico_f1.curso_pensum (id_pensum, id_curso, id_semestre, obligatorio, nota_aprobacion, zona_minima) 
                VALUES (id_pensum_var, id_curso_p, id_semestre_p, obligatorio_p, nota_aprobacion_p, zona_minima_p);

                -- Buscamos al curso_pensum que corresponda al pensum y al curso
                SELECT id INTO id_curso_pensum_var 
                        FROM curso_pensum 
                        WHERE id_curso = id_curso_p AND id_pensum = id_pensum_var 
                        LIMIT 1;

                -- Insertar creditos_prerrequisito
                INSERT INTO registroacademico_f1.creditos_prerrequisito (creditos_requeridos, curso_pensum_id) 
                VALUES (creditos_necesarios_p, id_curso_pensum_var);

            ELSE
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'No existe pensum con la carrera y jornada seleccionada';
            END IF;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Los valores de creditos, nota de aprobacion o zona minima son inválidos';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El curso no existe aún';
    END IF;
END$$

DELIMITER ;

CALL crearCursoPensum(
    1,         -- id_curso_p (por ejemplo, el ID del curso es 1)
    5,         -- creditos_necesarios_p (por ejemplo, se requieren 5 créditos)
    1,      -- obligatorio_p (por ejemplo, el curso es obligatorio)
    1,         -- id_jornada_p (por ejemplo, la jornada es 1)
    1,         -- id_carrera_p (por ejemplo, la carrera es 1)
    61,        -- nota_aprobacion_p (por ejemplo, la nota de aprobación es 61)
    31,        -- zona_minima_p (por ejemplo, la zona mínima es 31)
    '1S'       -- id_semestre_p (por ejemplo, el semestre es '1S')
);