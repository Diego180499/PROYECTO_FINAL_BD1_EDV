-- 2) Consultar informacion de Estudiante determindo
DELIMITER $$
CREATE PROCEDURE obtenerInfoEstudiante(IN p_carne INT)
BEGIN
    DECLARE estudiante_existente INT;

    -- Verificar si existe el estudiante con el parámetro dado
    SELECT COUNT(*)
    INTO estudiante_existente
    FROM Estudiante
    WHERE carne = p_carne;

    -- Si no existe, mostrar mensaje de error
    IF estudiante_existente = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontró el estudiante con el carne proporcionado.';
    ELSE
        -- Seleccionar la información del estudiante
        SELECT 
            e.carne AS Carne,
            CONCAT(e.nombre, ' ', e.apellido) AS Nombre_Completo,
            e.fecha_nacimiento AS Fecha_Nacimiento,
            e.correo AS Correo,
            e.telefono AS Telefono,
            e.direccion AS Dirección,
            e.dpi AS DPI,
            ca.nombre AS Carrera,
            IFNULL(SUM(c.creditos), 0) AS Creditos_Posee
        FROM 
            Estudiante e
        INNER JOIN 
            Inscripcion i ON e.carne = i.id_estudiante
        INNER JOIN 
            Pensum p ON i.id_pensum = p.id
        INNER JOIN 
            Carrera ca ON p.id_carrera = ca.id
        LEFT JOIN 
            Asignacion a ON e.carne = a.id_estudiante
        LEFT JOIN 
            Acta_Nota an ON a.id = an.id_asignacion
        LEFT JOIN 
            Aprobacion_Curso ac ON an.id = ac.acta_nota_codigo AND ac.aprobado = 1
        LEFT JOIN 
            Seccion s ON a.id_seccion = s.id
        LEFT JOIN 
            Curso c ON s.id_curso = c.id
        WHERE 
            e.carne = p_carne
        GROUP BY 
            e.carne, e.nombre, e.apellido, e.fecha_nacimiento, e.correo, e.telefono, e.direccion, e.dpi, ca.nombre;
    END IF;
END $$
DELIMITER ;
   
CALL obtenerInfoEstudiante(1);