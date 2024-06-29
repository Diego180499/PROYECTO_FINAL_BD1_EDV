/* 6) *Listado de Aprobaciones de Estudiantes de una Seccion* */
DELIMITER $$
CREATE PROCEDURE obtenerEstudiantesSeccion(
    IN p_id_curso INT,
    IN p_id_ciclo VARCHAR(10),
    IN p_anio INT,
    IN p_seccion VARCHAR(10)
)
BEGIN
    DECLARE curso_existente INT;
    DECLARE ciclo_existente INT;

    -- Verificar si el curso existe
    SELECT COUNT(*)
    INTO curso_existente
    FROM Curso
    WHERE id = p_id_curso;

    IF curso_existente = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No existe el curso con el id proporcionado.';
    ELSE
        -- Verificar si el ciclo existe
        SELECT COUNT(*)
        INTO ciclo_existente
        FROM Seccion
        WHERE id_ciclo = p_id_ciclo
        -- AND anio = p_anio
        ;

        IF ciclo_existente = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No existe el ciclo con el id proporcionados.';
        ELSE
            -- Seleccionar la información de los estudiantes asignados a la sección/curso
            SELECT 
                e.carne AS Carnet_Estudiante,
                CONCAT(e.nombre, ' ', e.apellido) AS Nombre_Completo,
                CASE
                    WHEN ac.aprobado = 1 THEN 'Aprobado'
                    ELSE 'Reprobado'
                END AS Estado
            FROM 
                Estudiante e
            INNER JOIN 
                Asignacion a ON e.carne = a.id_estudiante
            INNER JOIN 
                Seccion s ON a.id_seccion = s.id
            LEFT JOIN 
                Acta_Nota an ON a.id = an.id_asignacion
            LEFT JOIN 
                Aprobacion_Curso ac ON an.id = ac.acta_nota_codigo
            WHERE 
                s.id_curso = p_id_curso
                AND s.id_ciclo = p_id_ciclo
                AND s.anio = p_anio
                AND s.seccion = p_seccion;
        END IF;
    END IF;
END $$
DELIMITER ;

CALL obtenerEstudiantesSeccion(1, '1S', 2024, 'A'); -- ID CURSO, CICLO (1S, 2S...), AÑO, SECCION ('A','B','C')