-- CREACION DE LA BASE DE DATOS

CREATE DATABASE `starbucks2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `starbucks2`;

-- TABLAS
-- Tabla 1
CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `idx_fk_payment_method` (`payment_method`),
  KEY `idx_fk_client_first_name` (`first_name`),
  KEY `idx_fk_client_last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla 2
CREATE TABLE `elaboration` (
  `elaboration_id` int NOT NULL,
  `elaboration_minutes` int DEFAULT NULL,
  PRIMARY KEY (`elaboration_id`),
  KEY `idx_fk_elaboration_id` (`elaboration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla 3
CREATE TABLE `starbucks` (
  `delivery_id` int NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `idx_fk_delivery_address` (`delivery_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabla 4
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `elaboration_date` date DEFAULT NULL,
  `elaboration_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `idx_fk_elaboration_id` (`elaboration_id`) /*!80000 INVISIBLE */
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Tabla 5 
CREATE TABLE `ordered_products` (
  `order_id` int NOT NULL,
  `aggregate` varchar(255) DEFAULT NULL,
  `temperature` varchar(60) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `milk_type` varchar(100) DEFAULT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `idx_fk_order_id` (`order_id`) /*!80000 INVISIBLE */,
  KEY `idx_fk_product_id` (`product_id`),
  CONSTRAINT `fk_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla 6
CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `delivery_id` int DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `idx_fk_delivery_id` (`delivery_id`) /*!80000 INVISIBLE */,
  KEY `idx_fk_client_id` (`client_id`),
  CONSTRAINT `fk_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`),
  CONSTRAINT `fk_delivery_id` FOREIGN KEY (`delivery_id`) REFERENCES `starbucks` (`delivery_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Vistas
-- Vista 1 
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `buscar_cliente` AS
    SELECT 
        `client`.`client_id` AS `client_id`,
        `client`.`first_name` AS `first_name`,
        `client`.`last_name` AS `last_name`,
        `client`.`payment_method` AS `payment_method`
    FROM
        `client`
    WHERE
        (`client`.`first_name` LIKE 'b%');
        
-- Vista 2
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `mayor_fecha` AS
    SELECT 
        MAX(`product`.`elaboration_date`) AS `max(elaboration_date)`
    FROM
        `product`;
        
-- Vista 3
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `temperatura_maxima` AS
    SELECT 
        MAX(`ordered_products`.`temperature`) AS `max(temperature)`
    FROM
        `ordered_products`;
        
-- Vista 4
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `temperatura_promedio` AS
    SELECT 
        AVG(`ordered_products`.`temperature`) AS `avg(temperature)`
    FROM
        `ordered_products`;
        
-- Vista 5
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `tiempo_promedio` AS
    SELECT 
        AVG(`elaboration`.`elaboration_minutes`) AS `avg(elaboration_minutes)`
    FROM
        `elaboration`;
        
        
        -- STORED PROCEDURES
-- SP 1
DELIMITER $$
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

END$$
DELIMITER ;;


-- SP 2
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_en_tabla_especifica`(IN tabla CHAR(20), registros CHAR(30))
BEGIN
 --
IF tabla <> '' THEN -- la condicion verifica que lo que se obtuvo no es un parametro vacio
	SET @registros_client = concat('INSERT INTO ', tabla, ' VALUES ', registros); --
ELSE
	SET @registros_client = ''; -- si el parametro es vacio, declara la variable pero le asigna una cadena de caracteres vacia
END IF;

SET @clausula = concat('SELECT * FROM ', tabla);
PREPARE runSQLregistros FROM @registros_client; -- prepara la peticion sql armada y le da nombre
EXECUTE runSQLregistros; -- ejecuta el sentencia preparada
DEALLOCATE PREPARE runSQLregistros;  -- anula la sentencia preparada
PREPARE runSQL FROM @clausula; -- prepara la peticion sql armada y le da nombre
EXECUTE runSQL; -- ejecuta el sentencia preparada
DEALLOCATE PREPARE runSQL; -- anula la sentencia preparada
    
END$$
DELIMITER ;;


		-- FUNCIONES
        
-- Funcion 1
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `estaCaliente?`(id INT) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
DECLARE temp INT;
SET temp = (SELECT `temperature` FROM `ordered_products` WHERE `order_id` LIKE id);
RETURN temp > 25;
END$$
DELIMITER ;;

-- Funcion 2
DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `saludarCliente`(nombre VARCHAR(60)) RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE resultado VARCHAR(40);
SET resultado = concat('Hola ', nombre);
RETURN resultado;

END$$
DELIMITER ;;