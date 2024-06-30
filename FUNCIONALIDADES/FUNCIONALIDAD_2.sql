-- DROP PROCEDURE InsertCarrera;

DELIMITER $$
CREATE PROCEDURE InsertCarrera(IN id_unidad_academica_param INT, IN nombre_param VARCHAR(100))
BEGIN
    -- Verificar que el nombre de la carrera solo contenga letras y espacios
    IF NOT (nombre_param REGEXP '^[a-zA-Z ]+$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre de la carrera debe contener solo letras y espacios';
    ELSE
        -- Verificar si ya existe una carrera con el mismo nombre
        IF EXISTS (SELECT * FROM registroacademico_f1.carrera WHERE nombre = nombre_param) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'La carrera ya existe';
        ELSE
            -- Insertar la nueva carrera
            INSERT INTO registroacademico_f1.carrera (id_unidad_academica, nombre) VALUES (id_unidad_academica_param, nombre_param);
        END IF;
    END IF;
END$$
DELIMITER ;


CALL InsertCarrera(1,'Ingenieria Mecanica'); -- UNIDAD ACADEMICA, NombreCarrera