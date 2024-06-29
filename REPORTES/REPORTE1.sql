-- 1) Lista de Cursos Pensum
DELIMITER $$
CREATE PROCEDURE obtenerCursosPensumCarrera(IN p_carrera_id INT)
BEGIN
    DECLARE carrera_existente INT;

    -- Verificar si existe la carrera con el parámetro dado
    SELECT COUNT(*)
    INTO carrera_existente
    FROM Carrera
    WHERE id = p_carrera_id;

    -- Si no existe, mostrar mensaje de error
    IF carrera_existente = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontró la carrera con el id proporcionado.';
    ELSE
        -- Seleccionar la información de los cursos del pensum
        SELECT 
            c.id AS Codigo_Curso,
            c.nombre AS Nombre_Curso,
            cp.obligatorio AS Obligatorio,
            c.creditos AS Creditos_Otorgados,
            cr.creditos_requeridos AS Creditos_Necesarios
        FROM 
            Curso c
        JOIN 
            Curso_Pensum cp ON c.id = cp.id_curso
        JOIN 
            Pensum p ON cp.id_pensum = p.id
        JOIN 
            Carrera ca ON p.id_carrera = ca.id
        LEFT JOIN 
            Creditos_Prerrequisito cr ON c.id = cr.curso_pensum_id
        WHERE 
            ca.id = p_carrera_id;
    END IF;
END $$
DELIMITER ;

CALL obtenerCursosPensumCarrera(1);