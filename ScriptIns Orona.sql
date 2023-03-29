CREATE DATABASE `starbucks` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `starbucks`;
/* CREACION TABLAS */

CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `idx_fk_payment_method` (`payment_method`),
  KEY `idx_fk_client_first_name` (`first_name`),
  KEY `idx_fk_client_last_name` (`last_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `elaboration` (
  `elaboration_id` int NOT NULL,
  `elaboration_minutes` int DEFAULT NULL,
  PRIMARY KEY (`elaboration_id`),
  KEY `idx_fk_elaboration_id` (`elaboration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `starbucks` (
  `delivery_id` int NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `idx_fk_delivery_address` (`delivery_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `elaboration_date` date DEFAULT NULL,
  `elaboration_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `idx_fk_elaboration_id` (`elaboration_id`) /*!80000 INVISIBLE */
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


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


/* INSERCIONES DE REGISTROS */

INSERT INTO client (client_id, first_name, last_name, payment_method) VALUES
(1, 'Elizabeth', 'Vila', 'Transferencia'), 
(2, 'Becca', 'Adams', 'Transferencia'), 
(3, 'Terry', 'Alvarez', 'Efectivo'), 
(4, 'Lucas', 'Arts', 'Efectivo'),
(5, 'Blahaj', 'Vera', 'Transferencia');


INSERT INTO elaboration (elaboration_id, elaboration_minutes) VALUES
(1, 35),
(2, 60),
(3, 43),
(4, 59),
(5, 80);


INSERT INTO starbucks (delivery_id, delivery_date, delivery_address, employee_id) VALUES 
(3, '2023-01-13', 'Av. Meritxell, 96', 1),
(4, '2023-02-24', '1 Street 69, Al Jarf', 2),
(5, '2023-04-20', 'Sheikh Khalifa Bin Zayed St.', 1),
(6, '2023-04-11', 'Najda Street, Higher Colleges of Technology', 3),
(7, '2023-05-19', 'Nicaragua 6045, CABA', 3);


INSERT INTO `order` (order_id, order_date, delivery_id, payment_method, client_id) VALUES
(1, '2023-01-13', 3, 'Transferencia', 1),
(2, '2023-02-24', 4, 'Transferencia', 2),
(3, '2023-04-20', 5, 'Efectivo', 3),
(4, '2023-04-11', 6, 'Efectivo', 4),
(5, '2023-05-19', 7, 'Transferencia', 5);


INSERT INTO product (product_id, elaboration_date, elaboration_id) VALUES
(1, '2023-01-5', 2),
(2, '2023-02-2', 4),
(3, '2023-02-6', 5),
(4, '2023-02-11', 7),
(5, '2023-03-4', 8);


INSERT INTO ordered_products (order_id, aggregate, temperature, amount, milk_type, product_id) VALUES
(1, 'Crema de leche', 24, 1, 'Comun', 1),
(2, 'Canela', 30, 2, 'Leche de avellana', 2),
(3, 'Nuez moscada', 40, 4, 'Leche de soja', 3),
(4, 'Chocolate', 29, 1, 'Leche de coco', 4),
(5, 'Chocolate rallado', 37, 1, 'Leche de avena', 5);



SELECT * FROM CLIENT;
SELECT * FROM ELABORATION;
SELECT * FROM STARBUCKS;
SELECT * FROM `ORDER`;
SELECT * FROM PRODUCT;
SELECT * FROM ORDERED_PRODUCTS;

