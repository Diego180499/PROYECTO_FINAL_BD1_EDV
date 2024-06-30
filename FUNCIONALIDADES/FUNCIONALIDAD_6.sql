DELIMITER $$
CREATE PROCEDURE crearSeccionCurso(
    IN id_curso_p INT,
    IN id_salon_p INT,
    IN id_catedratico_p INT,
    IN id_ciclo_p CHAR(2),
    IN seccion_p CHAR(1)
)
BEGIN  
    
    IF EXISTS (SELECT * FROM registroacademico_f1.curso WHERE id = id_curso_p LIMIT 1) THEN
        IF EXISTS (SELECT * FROM registroacademico_f1.catedratico WHERE codigo = id_catedratico_p LIMIT 1) THEN
            IF EXISTS (SELECT * FROM registroacademico_f1.salon WHERE id = id_salon_p LIMIT 1) THEN
                IF id_ciclo_p NOT IN ('1S', '2S', 'VJ', 'VD') THEN
                    SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'El valor del ciclo no es válido. Debe ser uno de los siguientes: 1S, 2S, VJ, VD';
                ELSE
                    IF NOT (seccion_p REGEXP '^[A-Z]$') THEN
                        SIGNAL SQLSTATE '45000'
                        SET MESSAGE_TEXT = 'El valor de la sección no es válido. Debe ser una sola letra mayúscula';
                    ELSE
                        IF EXISTS (SELECT * FROM registroacademico_f1.seccion WHERE id_curso = id_curso_p AND id_ciclo = id_ciclo_p AND seccion = seccion_p LIMIT 1) THEN
                            SIGNAL SQLSTATE '45000'
                            SET MESSAGE_TEXT = 'La seccion ya existe';
                        ELSE
                            INSERT INTO registroacademico_f1.seccion (id_curso, id_salon, id_catedratico, id_ciclo, seccion, anio) 
                            VALUES (id_curso_p, id_salon_p, id_catedratico_p, id_ciclo_p, seccion_p,  YEAR(CURDATE()));
                        END IF;
                    END IF;
                END IF;
            ELSE
                SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'El salon no existe aún';
            END IF;
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El catedratico no ha sido registrado aún';
        END IF;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El curso no existe aún';
    END IF;
END$$
DELIMITER ;


CALL crearSeccionCurso(1, 1, 3, '1S', 'B'); -- ID CURSO (1), ID SALON(1), ID CATED(1), ID CICLO('1S'), SECCION ('B')