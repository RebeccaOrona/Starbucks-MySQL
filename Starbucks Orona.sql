CREATE TABLE `client` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `payment_method` varchar(100) NOT NULL,
  PRIMARY KEY (`client_id`),
  KEY `idx_fk_payment_method` (`payment_method`),
  KEY `idx_fk_client_first_name` (`first_name`),
  KEY `idx_fk_client_last_name` (`last_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `starbucks` (
  `delivery_id` int NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_address` varchar(255) NOT NULL,
  `employee_id` int DEFAULT NULL,
  PRIMARY KEY (`delivery_id`),
  KEY `idx_fk_delivery_address` (`delivery_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` date DEFAULT NULL,
  `delivery_address` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `aggregate` varchar(255) DEFAULT NULL,
  `temperature` varchar(60) DEFAULT NULL,
  `milk_type` varchar(100) DEFAULT NULL,
  `client_first_name` varchar(255) DEFAULT NULL,
  `client_last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_payment_method_idx` (`payment_method`) /*!80000 INVISIBLE */,
  KEY `fk_client_first_name` (`client_first_name`) /*!80000 INVISIBLE */,
  KEY `fk_client_last_name` (`client_last_name`),
  KEY `fk_delivery_address_idx` (`delivery_address`) /*!80000 INVISIBLE */,
  KEY `fk_milk_type` (`milk_type`) /*!80000 INVISIBLE */,
  KEY `fk_amount` (`amount`) /*!80000 INVISIBLE */,
  KEY `fk_temperature` (`temperature`),
  KEY `fk_aggregate` (`aggregate`),
  CONSTRAINT `fk_client_first_name` FOREIGN KEY (`client_first_name`) REFERENCES `client` (`first_name`),
  CONSTRAINT `fk_client_last_name` FOREIGN KEY (`client_last_name`) REFERENCES `client` (`last_name`),
  CONSTRAINT `fk_delivery_address` FOREIGN KEY (`delivery_address`) REFERENCES `starbucks` (`delivery_address`),
  CONSTRAINT `fk_payment_method` FOREIGN KEY (`payment_method`) REFERENCES `client` (`payment_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `elaboration_date` date DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `aggregate` varchar(255) DEFAULT NULL,
  `temperature` varchar(60) DEFAULT NULL,
  `milk_type` varchar(100) DEFAULT NULL,
  `elaboration_time` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `idx_fk_aggregate` (`aggregate`) /*!80000 INVISIBLE */,
  KEY `idx_fk_amount` (`amount`) /*!80000 INVISIBLE */,
  KEY `idx_fk_temperature` (`temperature`) /*!80000 INVISIBLE */,
  KEY `idx_fk_milk_type` (`milk_type`) /*!80000 INVISIBLE */,
  KEY `idx_fk_elaboration_time` (`elaboration_time`),
  CONSTRAINT `fk_aggregate` FOREIGN KEY (`aggregate`) REFERENCES `order` (`aggregate`),
  CONSTRAINT `fk_amount` FOREIGN KEY (`amount`) REFERENCES `order` (`amount`),
  CONSTRAINT `fk_milk_type` FOREIGN KEY (`milk_type`) REFERENCES `order` (`milk_type`),
  CONSTRAINT `fk_temperature` FOREIGN KEY (`temperature`) REFERENCES `order` (`temperature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `elaboration` (
  `elaboration_id` int NOT NULL,
  `elaboration_time` int DEFAULT NULL,
  PRIMARY KEY (`elaboration_id`),
  KEY `idx_fk_elaboration_time` (`elaboration_time`),
  CONSTRAINT `fk_elaboration_time` FOREIGN KEY (`elaboration_time`) REFERENCES `product` (`elaboration_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




