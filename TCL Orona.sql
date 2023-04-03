START TRANSACTION; 
UPDATE `client` SET first_name='Pagani', last_name='Lingue' 
WHERE client_id=3;
UPDATE `client` SET first_name='Linterno', last_name='Adams' 
WHERE client_id=4;
/*(first_name, last_name, payment_method) 
values ('Pepito', 'Titani', 'Efectivo'); */
SELECT * FROM `client`;
COMMIT;

START TRANSACTION; 
UPDATE `ordered_products` SET amount=3, milk_type='Avellana' 
WHERE order_id=3;
UPDATE `ordered_products` SET temperature=36, `aggregate`='Chips de chocolate' 
WHERE order_id=4;
SELECT * FROM `ordered_products`;
COMMIT;

/* SELECT @@AUTOCOMMIT
SET AUTOCOMMIT = 0 */