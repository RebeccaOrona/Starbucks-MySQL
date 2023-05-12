-- CREACION TRIGGERS

-- Trigger 1 (client)
CREATE DEFINER=`root`@`localhost` TRIGGER `log_in_client` AFTER INSERT ON `client` FOR EACH ROW INSERT INTO `log_in_client` (`client_id`, `first_name`, `last_name`, `payment_method`, `insert_user`, `insert_date`, `insert_time`)
VALUES (NEW.`client_id`, NEW.`first_name`, NEW.`last_name`, NEW.`payment_method`, USER(), CURDATE(), CURTIME());
-- Trigger 2 (client)
CREATE DEFINER=`root`@`localhost` TRIGGER `before_delete_client` BEFORE DELETE ON `client` FOR EACH ROW INSERT INTO `deleted_log_client` (`deleted_client_id`, `deleted_time`, `deleted_date`)	
VALUES (OLD.`client_id`, CURTIME(), CURDATE());

-- Trigger 3 (elaboration)
CREATE DEFINER=`root`@`localhost` TRIGGER `log_in_elaboration` AFTER INSERT ON `elaboration` FOR EACH ROW INSERT INTO `log_in_elaboration` (`elaboration_id`, `elaboration_minutes`, `insert_user`, `insert_date`, `insert_time`)
VALUES (NEW.`elaboration_id`, NEW.`elaboration_minutes`, USER(), CURDATE(), CURTIME());
-- Trigger 4 (elaboration)
CREATE DEFINER=`root`@`localhost` TRIGGER `before_delete_elaboration` BEFORE DELETE ON `elaboration` FOR EACH ROW INSERT INTO `deleted_log_elaboration` (`deleted_elaboration_id`, `deleted_time`, `deleted_date`)	
VALUES (OLD.`elaboration_id`, CURTIME(), CURDATE());

-- Trigger 5 (order)
CREATE DEFINER=`root`@`localhost` TRIGGER `log_in_order` AFTER INSERT ON `order` FOR EACH ROW INSERT INTO `log_in_order` (`order_id`, `order_date`, `delivery_id`, `payment_method`, `client_id`, `insert_user`, `insert_date`, `insert_time`)
VALUES (NEW.`order_id`, NEW.`order_date`, NEW.`delivery_id`, NEW.`payment_method`, NEW.`client_id`, USER(), CURDATE(), CURTIME());
-- Trigger 6 (order)
CREATE DEFINER=`root`@`localhost` TRIGGER `before_delete_order` BEFORE DELETE ON `order` FOR EACH ROW INSERT INTO `deleted_log_order` (`deleted_order_id`, `deleted_time`, `deleted_date`)	
VALUES (OLD.`order_id`, CURTIME(), CURDATE());

-- Trigger 7 (ordered_products)
 CREATE DEFINER=`root`@`localhost` TRIGGER `log_in_ordered_products` AFTER INSERT ON `ordered_products` FOR EACH ROW INSERT INTO `log_ordered_products` (`order_id`, `aggregate`, `temperature`, `amount`, `milk_type`, `product_id`, `insert_user`, `insert_date`, `insert_time`)
VALUES (NEW.`order_id`, NEW.`aggregate`, NEW.`temperature`, NEW.`amount`, NEW.`milk_type`, NEW.`product_id`, USER(), CURDATE(), CURTIME());
-- Trigger 8 (ordered_products)
CREATE DEFINER=`root`@`localhost` TRIGGER `before_delete_ordered_products` BEFORE DELETE ON `ordered_products` FOR EACH ROW INSERT INTO `deleted_log_ordered_products` (`deleted_ordered_products_id`, `deleted_time`, `deleted_date`)	
VALUES (OLD.`order_id`, CURTIME(), CURDATE());

-- Trigger 9 (product)
CREATE DEFINER=`root`@`localhost` TRIGGER `log_in_product` AFTER INSERT ON `product` FOR EACH ROW INSERT INTO `log_in_product` (`product_id`, `elaboration_date`, `elaboration_id`, `insert_user`, `insert_date`, `insert_time`)
VALUES (NEW.`product_id`, NEW.`elaboration_date`, NEW.`elaboration_id`, USER(), CURDATE(), CURTIME());
-- Trigger 10 (product)
CREATE DEFINER=`root`@`localhost` TRIGGER `before_delete_product` BEFORE DELETE ON `product` FOR EACH ROW INSERT INTO `deleted_log_order` (`deleted_product_id`, `deleted_time`, `deleted_date`)	
VALUES (OLD.`product_id`, CURTIME(), CURDATE());

-- Trigger 11 (starbucks)
CREATE DEFINER=`root`@`localhost` TRIGGER `log_in_starbucks` AFTER INSERT ON `starbucks` FOR EACH ROW INSERT INTO `log_in_starbucks` (`delivery_id`, `delivery_date`, `delivery_address`, `employee_id`, `insert_user`, `insert_date`, `insert_time`)
VALUES (NEW.`delivery_id`, NEW.`delivery_date`, NEW.`delivery_address`, NEW.`employee_id`, USER(), CURDATE(), CURTIME());
-- Trigger 12 (starbucks)
CREATE DEFINER=`root`@`localhost` TRIGGER `before_delete_starbucks` BEFORE DELETE ON `starbucks` FOR EACH ROW INSERT INTO `deleted_log_starbucks` (`deleted_starbucks_id`, `deleted_time`, `deleted_date`)	
VALUES (OLD.`delivery_id`, CURTIME(), CURDATE());
