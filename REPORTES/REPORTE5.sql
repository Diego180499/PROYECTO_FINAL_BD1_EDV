-- 5) *Listado de Periodos de los Cursos/Secciones asignados de un Estudiante (en un semestre y año)* [Periodo]
DELIMITER $$
CREATE PROCEDURE obtenerCursosAsignadosEstudiante(
    IN p_carne INT,
    IN p_id_ciclo VARCHAR(10),
    IN p_anio INT
)
BEGIN
    DECLARE estudiante_existente INT;
    DECLARE ciclo_existente INT;

    -- Verificar si el estudiante existe
    SELECT COUNT(*)
    INTO estudiante_existente
    FROM Estudiante
    WHERE carne = p_carne;

    IF estudiante_existente = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No existe el estudiante con el carne proporcionado.';
    ELSE
        -- Verificar si el ciclo existe
        SELECT COUNT(*)
        INTO ciclo_existente
        FROM Seccion
        WHERE id_ciclo = p_id_ciclo
        AND anio = p_anio
        ;

        IF ciclo_existente = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'No existe el ciclo con el id proporcionado.';
        ELSE
            -- Seleccionar la información de las secciones del estudiante
            SELECT 
                c.nombre AS Curso,
                s.seccion AS Seccion,
                d.dia AS Dia,
                
                CONCAT(
                    MIN(p.hora_inicio), ' - ', MAX(p.hora_fin)
                ) AS Periodo,
                CONCAT(ed.nombre, ', ', sa.nombre) AS Lugar
            FROM 
                Estudiante e
            INNER JOIN 
                Asignacion a ON e.carne = a.id_estudiante
            INNER JOIN 
                Seccion s ON a.id_seccion = s.id
            INNER JOIN 
                Curso c ON s.id_curso = c.id
            INNER JOIN 
                Dia_Seccion ds ON s.id = ds.id_seccion
            INNER JOIN 
                Dia d ON ds.id_dia = d.id
            INNER JOIN 
                Periodo_Seccion ps ON s.id = ps.id_seccion
            INNER JOIN 
			Periodo p ON ps.id_periodo = p.id
            INNER JOIN 
                Salon sa ON s.id_salon = sa.id
            INNER JOIN 
                Edificio ed ON sa.id_edificio = ed.id
            WHERE 
                e.carne = p_carne
                AND s.id_ciclo = p_id_ciclo
                AND s.anio = p_anio
            GROUP BY 
                c.nombre, s.seccion, d.dia, ed.nombre, sa.nombre;
        END IF;
    END IF;
END $$
DELIMITER ;

CALL obtenerCursosAsignadosEstudiante(1, '1S', 2024); -- ID Estudiante, CICLO (1S, 2S), Año (2024)
-- DROP PROCEDURE obtenerCursosAsignadosEstudiante;