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