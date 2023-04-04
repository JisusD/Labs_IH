# INSTRUCTION 1
SHOW DATABASES;
USE sakila;
SHOW TABLES;

# INSTRUCTION 2
SELECT * FROM actor,film, customer;

# INSTRUCTION 3
SELECT title FROM film;

# INSTRUCTION 4
SELECT * FROM language;
SELECT * FROM film;
SELECT title,language_id FROM film
	WHERE language_id = 1;


# INSTRUCTION 5.1
SELECT * FROM store;
# INSTRUCTION 5.2
SELECT * FROM staff;
# INSTRUCTION 5.3
SELECT first_name, last_name FROM staff;