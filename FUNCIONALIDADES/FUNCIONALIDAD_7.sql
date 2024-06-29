DELIMITER $$

CREATE PROCEDURE agregarHorario(
    IN id_seccion_p INT,
    IN id_periodo_p INT,
    IN id_dia_p INT
)
BEGIN  
    -- Verificamos que la sección esté registrada
    IF EXISTS (SELECT * FROM registroacademico_f1.seccion WHERE id = id_seccion_p LIMIT 1) THEN
        -- Verificamos que el periodo esté registrado
        IF EXISTS (SELECT * FROM registroacademico_f1.periodo WHERE id = id_periodo_p LIMIT 1) THEN
            -- Verificamos que el día esté registrado
            IF EXISTS (SELECT * FROM registroacademico_f1.dia WHERE id = id_dia_p LIMIT 1) THEN
                -- Insertamos la informacion en día_seccion, si no ha sido insertada aún
                IF NOT EXISTS (SELECT * FROM registroacademico_f1.dia_seccion WHERE id_seccion = id_seccion_p AND id_dia = id_dia_p LIMIT 1) THEN
                    INSERT INTO registroacademico_f1.dia_seccion (id_seccion, id_dia) 
                    VALUES (id_seccion_p, id_dia_p);
                END IF;
                -- Insertamos la informacion en periodo_seccion, si no ha sido insertada aún
                IF NOT EXISTS (SELECT * FROM registroacademico_f1.periodo_seccion WHERE id_seccion = id_seccion_p AND id_periodo = id_periodo_p LIMIT 1) THEN
                    INSERT INTO registroacademico_f1.periodo_seccion (id_seccion, id_periodo) 
                    VALUES (id_seccion_p, id_periodo_p);
                END IF;
            ELSE
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'No hay día registrado el id ingresado';
            END IF;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No hay registro de algun periodo con el id ingresado';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La sección no existe aún';
    END IF;
END$$

DELIMITER ;

-- Llamada al procedimiento con parámetros de prueba
CALL agregarHorario(1, 1, 5);
