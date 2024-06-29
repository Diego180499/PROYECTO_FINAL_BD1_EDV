DELIMITER $$

CREATE PROCEDURE insertarCatedratico(
    IN nombre_p VARCHAR(50), 
    IN apellido_p VARCHAR(50),
    IN fecha_nacimiento_p DATE, 
    IN correo_p VARCHAR(100), 
    IN telefono_p VARCHAR(15),
    IN direccion_p VARCHAR(100), 
    IN dpi_p VARCHAR(13),
    IN sueldo_mensual_p DECIMAL(10,2)
)
BEGIN  
    -- Validar nombre y apellido
    IF NOT (nombre_p REGEXP '^[a-zA-Z ]+$' AND apellido_p REGEXP '^[a-zA-Z ]+$') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre o apellido debe contener solo letras y espacios';
    ELSE 
        -- Validar correo
        IF NOT (correo_p REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$') THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El correo no es válido';
        ELSE
            -- Validar telefono
            IF NOT (telefono_p REGEXP '^[0-9]{2,5}$') THEN
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'El teléfono no es válido';
            ELSE
                -- Verificar un valor positivo y no mayor a 99.000
                IF NOT (sueldo_mensual_p > 0 AND sueldo_mensual_p <= 99000.00) THEN
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'El valor del sueldo mensual es inválido';
                ELSE
                    IF EXISTS (SELECT * FROM registroacademico_f1.catedratico WHERE dpi = dpi_p LIMIT 1) THEN
                    SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'El catedratico ya ha sido ingresado';
                    ELSE
                    --Insertar la nueva carrera
                    INSERT INTO registroacademico_f1.catedratico (dpi, nombre, apellido, fecha_nacimiento, sueldo_mensual, telefono, direccion, correo) 
                    VALUES (dpi_p, nombre_p, apellido_p, fecha_nacimiento_p, sueldo_mensual_p, telefono_p, direccion_p, correo_p);
                    END IF;
                END IF;
            END IF;
        END IF;
    END IF;
END$$

DELIMITER ;


CALL insertarCatedratico(
    'Juan',               -- nombre_p
    'Perez',              -- apellido_p
    '1980-05-20',         -- fecha_nacimiento_p
    'juan.perez@example.com', -- correo_p
    '12345',              -- telefono_p
    '123 Calle Falsa',    -- direccion_p
    '1234567890123',      -- dpi_p
    4500.00               -- sueldo_mensual_p
);
