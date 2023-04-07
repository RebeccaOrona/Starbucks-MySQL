-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: starbucks
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- TABLAS QUE SE IMPORTAN:
-- client, deleted_log_order, deleted_log_ordered, elaboration, log_in_order, log_ordered_products, 
-- order, ordered_products, product, starbucks

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Elizabeth','Vila','Transferencia'),(2,'Becca','Adams','Transferencia'),(3,'Pagani','Lingue','Efectivo'),(4,'Linterno','Adams','Efectivo'),(5,'Blahaj','Vera','Transferencia'),(6,'Bleb','Mona','Transferencia'),(10,'Pepito','Titani','Efectivo'),(11,'Pagani','Lingue','Efectivo'),(12,'Pepito','Titani','Efectivo'),(13,'Carlos Tomas','Bokita el mas grande','Transferencia');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `deleted_log_order`
--

LOCK TABLES `deleted_log_order` WRITE;
/*!40000 ALTER TABLE `deleted_log_order` DISABLE KEYS */;
INSERT INTO `deleted_log_order` VALUES (6,'22:13:56','2023-03-23');
/*!40000 ALTER TABLE `deleted_log_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `deleted_log_ordered_products`
--

LOCK TABLES `deleted_log_ordered_products` WRITE;
/*!40000 ALTER TABLE `deleted_log_ordered_products` DISABLE KEYS */;
INSERT INTO `deleted_log_ordered_products` VALUES (6,'22:13:19','2023-03-23');
/*!40000 ALTER TABLE `deleted_log_ordered_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `elaboration`
--

LOCK TABLES `elaboration` WRITE;
/*!40000 ALTER TABLE `elaboration` DISABLE KEYS */;
INSERT INTO `elaboration` VALUES (1,35),(2,60),(3,43),(4,59),(5,80),(6,32),(7,35),(8,32),(9,32);
/*!40000 ALTER TABLE `elaboration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_in_order`
--

LOCK TABLES `log_in_order` WRITE;
/*!40000 ALTER TABLE `log_in_order` DISABLE KEYS */;
INSERT INTO `log_in_order` VALUES (6,'2023-05-19',7,'Transferencia',6,'root@localhost','2023-03-23','21:51:18');
/*!40000 ALTER TABLE `log_in_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_ordered_products`
--

LOCK TABLES `log_ordered_products` WRITE;
/*!40000 ALTER TABLE `log_ordered_products` DISABLE KEYS */;
INSERT INTO `log_ordered_products` VALUES (6,'Cacao','20',1,'Leche de avena',6,'root@localhost','2023-03-23','21:20:53');
/*!40000 ALTER TABLE `log_ordered_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2023-01-13',3,'Transferencia',1),(2,'2023-02-24',4,'Transferencia',2),(3,'2023-04-20',5,'Efectivo',3),(4,'2023-04-11',6,'Efectivo',4),(5,'2023-05-19',7,'Transferencia',5);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_in_order` AFTER INSERT ON `order` FOR EACH ROW INSERT INTO `log_in_order` (`order_id`, `order_date`, `delivery_id`, `payment_method`, `client_id`, `insert_user`, `insert_date`, `insert_time`)
VALUES (NEW.`order_id`, NEW.`order_date`, NEW.`delivery_id`, NEW.`payment_method`, NEW.`client_id`, USER(), CURDATE(), CURTIME()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_order` BEFORE DELETE ON `order` FOR EACH ROW INSERT INTO `deleted_log_order` (`deleted_order_id`, `deleted_time`, `deleted_date`)	
VALUES (OLD.`order_id`, CURTIME(), CURDATE()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `ordered_products`
--

LOCK TABLES `ordered_products` WRITE;
/*!40000 ALTER TABLE `ordered_products` DISABLE KEYS */;
INSERT INTO `ordered_products` VALUES (1,'Crema de leche','24',1,'Comun',1),(2,'Canela','30',2,'Leche de avellana',2),(3,'Nuez moscada','40',3,'Avellana',3),(4,'Chips de chocolate','36',1,'Leche de coco',4),(5,'Chocolate rallado','37',1,'Leche de avena',5);
/*!40000 ALTER TABLE `ordered_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_in_ordered_products` AFTER INSERT ON `ordered_products` FOR EACH ROW INSERT INTO `log_ordered_products` (`order_id`, `aggregate`, `temperature`, `amount`, `milk_type`, `product_id`, `insert_user`, `insert_date`, `insert_time`)
VALUES (NEW.`order_id`, NEW.`aggregate`, NEW.`temperature`, NEW.`amount`, NEW.`milk_type`, NEW.`product_id`, USER(), CURDATE(), CURTIME()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_delete_ordered_products` BEFORE DELETE ON `ordered_products` FOR EACH ROW INSERT INTO `deleted_log_ordered_products` (`deleted_ordered_products_id`, `deleted_time`, `deleted_date`)	
VALUES (OLD.`order_id`, CURTIME(), CURDATE()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'2023-01-05',2),(2,'2023-02-02',4),(3,'2023-02-06',5),(4,'2023-02-11',7),(5,'2023-03-04',8),(6,'2023-02-11',7);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `starbucks`
--

LOCK TABLES `starbucks` WRITE;
/*!40000 ALTER TABLE `starbucks` DISABLE KEYS */;
INSERT INTO `starbucks` VALUES (3,'2023-01-13','Av. Meritxell, 96',1),(4,'2023-02-24','1 Street 69, Al Jarf',2),(5,'2023-04-20','Sheikh Khalifa Bin Zayed St.',1),(6,'2023-04-11','Najda Street, Higher Colleges of Technology',3),(7,'2023-05-19','Nicaragua 6045, CABA',3);
/*!40000 ALTER TABLE `starbucks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'starbucks'
--

--
-- Dumping routines for database 'starbucks'
--
/*!50003 DROP FUNCTION IF EXISTS `estaCaliente?` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `estaCaliente?`(id INT) RETURNS tinyint(1)
    READS SQL DATA
BEGIN
DECLARE temp INT;
SET temp = (SELECT `temperature` FROM `ordered_products` WHERE `order_id` LIKE id);
RETURN temp > 25;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `saludarCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `saludarCliente`(nombre VARCHAR(60)) RETURNS varchar(60) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
DECLARE resultado VARCHAR(40);
SET resultado = concat('Hola ', nombre);
RETURN resultado;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `indicar_orden_de_clientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_en_tabla_especifica` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
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
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-06 23:07:16
