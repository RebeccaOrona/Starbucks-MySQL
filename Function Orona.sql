USE `starbucks`;
DROP function IF EXISTS `saludarCliente`;

DELIMITER $$
USE `starbucks`$$

CREATE FUNCTION `saludarCliente` (nombre VARCHAR(60)) RETURNS VARCHAR(60) 
deterministic
BEGIN
DECLARE resultado VARCHAR(40);
SET resultado = concat('Hola ', nombre);
RETURN resultado;


END$$

DELIMITER ;

SELECT saludarCliente ((SELECT concat(`first_name`, ' ', `last_name`) FROM `client` WHERE `client_id` LIKE 1)) AS Result;



DELIMITER $$
USE `starbucks`$$

CREATE FUNCTION `estaCaliente?`(id INT) RETURNS boolean
reads sql data
BEGIN
DECLARE temp INT;
SET temp = (SELECT `temperature` FROM `ordered_products` WHERE `order_id` LIKE id);
RETURN temp > 25;
END$$

DELIMITER ;
SELECT `estaCaliente?`(5) AS `esta_caliente?`;








