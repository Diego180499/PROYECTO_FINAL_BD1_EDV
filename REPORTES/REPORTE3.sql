DELIMITER $$
CREATE PROCEDURE obtenerInfoCatedratico(
    IN idDocente INT
)
BEGIN
    SELECT 
        codigo, 
        CONCAT(nombre, ' ', apellido) AS nombre_completo, 
        fecha_nacimiento, 
        correo, 
        telefono, 
        direccion, 
        dpi
    FROM 
        registroacademico_f1.catedratico 
    WHERE 
        codigo = idDocente;
END$$
DELIMITER ;


CALL obtenerInfoCatedratico(3);