

-- creacion tabla auditoria de ordered_products
CREATE TABLE `log_ordered_products` (
  `order_id` int NOT NULL,
  `aggregate` varchar(255) DEFAULT NULL,
  `temperature` varchar(60) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `milk_type` varchar(100) DEFAULT NULL,
  `product_id` int NOT NULL,
  `insert_user` varchar(45) DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `insert_time` time DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- creacion tabla log de eliminaciones ordered_products
CREATE TABLE `deleted_log_ordered_products` (
  `deleted_ordered_products_id` int NOT NULL,
  `deleted_time` time DEFAULT NULL,
  `deleted_date` date DEFAULT NULL,
  PRIMARY KEY (`deleted_ordered_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- creacion trigger auditoria tabla ordered_products
CREATE TRIGGER `log_in_ordered_products` 
AFTER INSERT ON `ordered_products`
FOR EACH ROW
INSERT INTO `log_ordered_products` (`order_id`, `aggregate`, `temperature`, `amount`, `milk_type`, `product_id`, `insert_user`, `insert_date`, `insert_time`)
VALUES (NEW.`order_id`, NEW.`aggregate`, NEW.`temperature`, NEW.`amount`, NEW.`milk_type`, NEW.`product_id`, USER(), CURDATE(), CURTIME());


-- creacion trigger eliminacion tabla ordered_products

CREATE TRIGGER `before_delete_ordered_products`
BEFORE DELETE ON `ordered_products`
FOR EACH ROW
INSERT INTO `deleted_log_ordered_products` (`deleted_ordered_products_id`, `deleted_time`, `deleted_date`)	
VALUES (OLD.`order_id`, CURTIME(), CURDATE());


-- creacion tabla auditoria de order
CREATE TABLE `log_in_order` (
  `order_id` int NOT NULL,
  `order_date` date DEFAULT NULL,
  `delivery_id` int DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `insert_user` varchar(45) DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `insert_time` time DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- creacion tabla log de eliminaciones order
CREATE TABLE `deleted_log_order` (
  `deleted_order_id` int NOT NULL,
  `deleted_time` time DEFAULT NULL,
  `deleted_date` date DEFAULT NULL,
  PRIMARY KEY (`deleted_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- creacion trigger auditoria tabla order
CREATE TRIGGER `log_in_order` 
AFTER INSERT ON `order`
FOR EACH ROW
INSERT INTO `log_in_order` (`order_id`, `order_date`, `delivery_id`, `payment_method`, `client_id`, `insert_user`, `insert_date`, `insert_time`)
VALUES (NEW.`order_id`, NEW.`order_date`, NEW.`delivery_id`, NEW.`payment_method`, NEW.`client_id`, USER(), CURDATE(), CURTIME());


-- creacion trigger log de eliminaciones tabla order
CREATE TRIGGER `before_delete_order`
BEFORE DELETE ON `order`
FOR EACH ROW
INSERT INTO `deleted_log_order` (`deleted_order_id`, `deleted_time`, `deleted_date`)	
VALUES (OLD.`order_id`, CURTIME(), CURDATE());




-- INSERCIONES PARA TESTEO

INSERT INTO `ordered_products` VALUES (6, 'Cacao', 20, 1, 'Leche de avena', 6);

INSERT INTO `product` VALUES (6, '2023-02-11', 7);

INSERT INTO `order` VALUES (6, '2023-05-19', 7, 'Transferencia', 6);

INSERT INTO `client` VALUES (6, 'Bleb', 'Mona', 'Transferencia');

-- ELIMINACIONES PARA TESTEO 

DELETE FROM `ordered_products` WHERE `order_id`=6;

DELETE FROM `order` WHERE `order_id`=6;

