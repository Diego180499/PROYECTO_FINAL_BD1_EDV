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

-- -------------------------------------------------------------
    
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
   
CALL obtenerInfoEstudiante(4);

-- -------------------------------------------------------------

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
          AND nombre_seccion = p_seccion;
        
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
                AND s.nombre_seccion = p_seccion;
        END IF;
    END IF;
END $$
DELIMITER ;

CALL obtenerEstudiantesAsignadosSeccion(2020306, 1, 2024, 'A');

-- -------------------------------------------------------------

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
        -- AND anio = p_anio
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

CALL obtenerCursosAsignadosEstudiante(202030627, '1S', 2024);

-------------------------------------------------------------

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

CALL obtenerEstudiantesSeccion(101, '1S', 2024, 'A');

/* 8) ** */