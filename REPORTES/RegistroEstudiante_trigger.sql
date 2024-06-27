ALTER TABLE estudiante
ADD COLUMN direccion VARCHAR(100);       
-----------------------------------------|
ALTER TABLE estudiante
ADD COLUMN dpi VARCHAR(13);
----------------------------------------|
alter table estudiante
add column apellido varchar(100) after nombre;
---------------------------------------|



DELIMITER $$

CREATE PROCEDURE insertarEstudiante(
    IN carnet_p INT,
    IN nombre_p VARCHAR(50), 
    IN apellido_p VARCHAR(50),
    IN fecha_nacimiento_p DATE, 
    IN correo_p VARCHAR(100), 
    IN telefono_p VARCHAR(15),
    IN direccion_p VARCHAR(100), 
    IN dpi_p VARCHAR(20),
    IN carrera_p INT,
    IN jornada_id INT
)
BEGIN
    DECLARE id_pensum_var INT;
    
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
                -- Verificar existencia en pensum
                IF EXISTS (SELECT * FROM pensum WHERE id_carrera = carrera_p AND id_jornada = jornada_id LIMIT 1) THEN
                    INSERT INTO estudiante(carne, nombre, apellido, fecha_nacimiento, correo, telefono, direccion, dpi)
                    VALUES (carnet_p, nombre_p, apellido_p, fecha_nacimiento_p, correo_p, telefono_p, direccion_p, dpi_p);
                    
                    SELECT id INTO id_pensum_var 
                    FROM pensum 
                    WHERE id_carrera = carrera_p AND id_jornada = jornada_id 
                    LIMIT 1;
                    
                    INSERT INTO inscripcion (id_estudiante, id_pensum, fecha) 
                    VALUES (carnet_p, id_pensum_var, NOW());
                ELSE
                    SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Error al insertar un estudiante/asignacion';
                END IF;
            END IF;
        END IF;
    END IF;
END$$

DELIMITER ;


CALL insertarEstudiante(
    585, 
    'Juan', 
    'Perez', 
    '2000-01-01', 
    'juanitopepito3@example.com', 
    '12345', 
    'Avenida Principal 123', 
    '1234567890123', 
    1, 
    2
);