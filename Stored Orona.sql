DELIMITER $$
use `starbucks`$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `indicar_orden_de_clientes`(IN field CHAR(20), orden CHAR(10))
BEGIN
 -- en los parametros se requiere primero el campo especifico para ordenar y segundo el tipo de ordenamiento
IF field <> '' THEN -- la condicion verifica que lo que se obtuvo no es un parametro vacio
	SET @client_order = concat('ORDER BY ', field ,' ', orden); -- declara una variable en la cual se concatena el orden con el campo recibido y el ordenamiento
ELSE
	SET @client_order = ''; -- si el parametro es vacio, declara la variable pero le asigna una cadena de caracteres vacia
END IF;
SET @clausula = concat('SELECT * FROM `client` ', @client_order);  -- declara una variable en la cual asigna la secuencia sql en la que selecciona todo sobre la tabla clientes con el ordenamiento armado en @client_order
PREPARE runSQL FROM @clausula; -- prepara la peticion sql armada y le da nombre
EXECUTE runSQL; -- ejecuta el sentencia preparada
DEALLOCATE PREPARE runSQL; -- anula la sentencia preparada

END;

DELIMITER ;
call starbucks.indicar_orden_de_clientes('first_name', 'DESC');



DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_en_tabla_especifica`(IN tabla CHAR(20), registros CHAR(30))
BEGIN
 --
IF tabla <> '' THEN -- la condicion verifica que lo que se obtuvo no es un parametro vacio
	SET @registros_client = concat('INSERT INTO ', tabla, ' VALUES ', registros); --
ELSE
	SET @registros_client = ''; -- si el parametro es vacio, declara la variable pero le asigna una cadena de caracteres vacia
END IF;

SET @clausula = concat('SELECT * FROM ', tabla); -- concatena un select con la tabla recibida para mostrarla en pantalla
PREPARE runSQLregistros FROM @registros_client; -- prepara la peticion sql armada y le da nombre
EXECUTE runSQLregistros; -- ejecuta el sentencia preparada
DEALLOCATE PREPARE runSQLregistros;  -- anula la sentencia preparada
PREPARE runSQL FROM @clausula; -- prepara la peticion sql armada y le da nombre
EXECUTE runSQL; -- ejecuta el sentencia preparada
DEALLOCATE PREPARE runSQL; -- anula la sentencia preparada
    
END;

DELIMITER ;
call starbucks.insertar_en_tabla_especifica('elaboration', "(9, 32)");


