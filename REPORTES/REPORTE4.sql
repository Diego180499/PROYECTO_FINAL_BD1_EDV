-- 4) Listado de Asignaciones de Estudiantes a Seccion/Curso
DELIMITER $$
CREATE PROCEDURE obtenerEstudiantesAsignadosSeccion(
    IN p_id_curso INT,
    IN p_id_ciclo INT,
    IN p_anio INT,
    IN p_seccion VARCHAR(10)
)
BEGIN
    DECLARE curso_existente INT;
    DECLARE seccion_existente INT;
    
    -- Verificar si existe el curso con el parámetro dado
    SELECT COUNT(*)
    INTO curso_existente
    FROM Curso
    WHERE id = p_id_curso;
    
    -- Si no existe, mostrar mensaje de error
    IF curso_existente = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se encontró el curso con el id proporcionado.';
    ELSE
        -- Verificar si existe la sección con los parámetros dados
        SELECT COUNT(*)
        INTO seccion_existente
        FROM Seccion
        WHERE id_curso = p_id_curso
          AND id_ciclo = p_id_ciclo
          AND anio = p_anio
          AND seccion = p_seccion;
        
        -- Si no existe, mostrar mensaje de error
        IF seccion_existente = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No se encontró la sección con los parámetros proporcionados.';
        ELSE
            -- Seleccionar los estudiantes asignados a la sección especificada
            SELECT 
                e.carne AS Carnet_Estudiante,
                CONCAT(e.nombre, ' ', e.apellido) AS Nombre_Completo
            FROM 
                Estudiante e
            INNER JOIN 
                Asignacion a ON e.carne = a.id_estudiante
            INNER JOIN 
                Seccion s ON a.id_seccion = s.id
            WHERE 
                s.id_curso = p_id_curso
                AND s.id_ciclo = p_id_ciclo
                AND s.anio = p_anio
                AND s.seccion = p_seccion;
        END IF;
    END IF;
END $$
DELIMITER ;

-- DROP PROCEDURE obtenerEstudiantesAsignadosSeccion;
CALL obtenerEstudiantesAsignadosSeccion(3, 1, 2025, 'C'); -- (ID CURSO(1,2,3...), CICLO(1S,2S,VJ,VD), ANIO(2024, 2025), SECCION('A','B','C'))