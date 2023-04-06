USE sakila;
SHOW TABLES;

## Instruction 1
SELECT * FROM film;
SELECT DISTINCT release_year FROM film;

## Instruction 2
SELECT * FROM film
WHERE title REGEXP 'ARMAGEDDON';

## Instruction 3
SELECT * FROM film
WHERE title REGEXP 'APOLLO$';

## Instruction 4
SELECT * FROM film;
SELECT *  FROM film
ORDER BY length DESC
LIMIT 10;

## Instruction 5
SELECT * FROM film
WHERE special_features REGEXP 'Behind the Scenes';

## Instruction 6
SELECT * FROM staff;
ALTER TABLE staff
DROP COLUMN picture;

## Instruction 7
SELECT * FROM customer
WHERE first_name REGEXP 'TAMMY';
insert into staff values
(3,'Tammy','Sanders',79,'TAMMY.SANDERS@sakilacustomer.org',2,1,'Tammy','34tammy','2006-02-15 03:57:16');
SELECT * FROM staff;

## Instruction 8
SELECT * FROM rental;
SELECT * FROM film;
SELECT * FROM inventory;
SELECT * FROM staff;
SELECT customer_id FROM sakila.customer
WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER';

insert into rental values
(16050,'2005-08-23 22:55:33',7,130,'2005-08-20 02:19:33',1,'2006-02-15 21:30:53');
SELECT * FROM rental
ORDER BY rental_id DESC
LIMIT 10;

## Instruction 9
SHOW TABLES;
SELECT * FROM customer;
SELECT * FROM customer
ORDER BY active ASC
LIMIT 20;

DROP TABLE IF EXISTS delete_users;
CREATE TABLE IF NOT EXISTS delete_users (
  customer_id int UNIQUE NOT NULL,
  store_id int DEFAULT NULL,
  first_name text DEFAULT NULL,
  last_name text DEFAULT NULL,
  email text DEFAULT NULL,
  address_id int UNIQUE NOT NULL,
  create_date text DEFAULT NULL,
  last_update text DEFAULT NULL,
  CONSTRAINT PRIMARY KEY (customer_id)
) ;

SELECT * FROM delete_users;

INSERT INTO delete_users (customer_id,store_id,first_name,last_name,email,address_id,create_date,last_update)
SELECT customer_id,store_id,first_name,last_name,email,address_id,create_date,last_update
FROM customer
WHERE active = 0;

SELECT * FROM delete_users;
SELECT * FROM customer
ORDER BY active ASC
LIMIT 20;


SET foreign_key_checks = 0;
DELETE FROM customer
WHERE active = 0;

SELECT * FROM customer
ORDER BY active ASC
LIMIT 20;

