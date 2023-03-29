USE `starbucks`;

CREATE VIEW temperatura_maxima AS (SELECT max(temperature) FROM ordered_products);
SELECT * FROM temperatura_maxima;


CREATE VIEW temperatura_promedio AS (SELECT avg(temperature) FROM ordered_products);
SELECT * FROM temperatura_promedio;


CREATE VIEW tiempo_promedio AS (SELECT avg(elaboration_minutes) FROM elaboration);
SELECT * FROM tiempo_promedio;


CREATE VIEW mayor_fecha AS (SELECT max(elaboration_date) FROM product);
SELECT * FROM mayor_fecha;


CREATE VIEW buscar_cliente AS (SELECT * FROM client WHERE first_name LIKE 'b%');
SELECT * FROM buscar_cliente