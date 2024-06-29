DELIMITER $$

CREATE PROCEDURE desasignacionCurso(
    IN id_seccion_p INT,
    IN id_estudiante_p INT,
    IN motivo_p TEXT
)
BEGIN  
    DECLARE id_asignacion_var INT;
    -- Verificamos que la sección esté registrada
    IF EXISTS (SELECT * FROM registroacademico_f1.seccion WHERE id = id_seccion_p LIMIT 1) THEN
        -- Verificamos que el estudiante esté registrado
        IF EXISTS (SELECT * FROM registroacademico_f1.estudiante WHERE carne = id_estudiante_p LIMIT 1) THEN
            -- Verificamos si el estudiante ya estaba asignado a dicha sección
            IF EXISTS ( 
                SELECT * FROM registroacademico_f1.asignacion 
                WHERE id_estudiante = id_estudiante_p AND id_seccion = id_seccion_p LIMIT 1) THEN
                -- Buscamos el ID de la asignación
                SELECT id INTO id_asignacion_var FROM registroacademico_f1.asignacion 
                WHERE id_estudiante = id_estudiante_p AND id_seccion = id_seccion_p LIMIT 1;
                -- Insertamos la desasignación con los datos obtenidos
                INSERT INTO registroacademico_f1.desasignacion (asignacion_id, fecha, motivo) 
                VALUES (id_asignacion_var, CURRENT_DATE(), motivo_p);

            ELSE
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'El estudiante no estaba asignado a dicha sección';
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

CALL desasignacionCurso(1, 123, 'Cambio de horario');
