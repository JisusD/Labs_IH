SHOW DATABASES;
USE sakila;
SHOW TABLES;

# Instruction 1
SELECT * FROM actor;
SELECT * FROM actor
	WHERE first_name = 'Scarlett';
    
# Instruction 2
SELECT *FROM film;
SELECT count(rental_rate) AS films_have_been_rented FROM film
WHERE rental_rate = 4.99;
SELECT count(rental_rate) AS films_are_available_for_rent FROM film
WHERE rental_rate < 4.99;

#Instruction 3
SELECT *FROM film;
SELECT max(length) AS max_duration,min(length) AS min_duration FROM film;

#Instruction 4
SELECT *FROM film;
SELECT SEC_TO_TIME(AVG(length)) AS average_movie_duration FROM film;

#Instruction 5
SELECT * FROM actor;
SELECT count( DISTINCT last_name)
FROM actor;

#Instruction 6
SELECT * FROM rental;
SELECT DATEDIFF(max(last_update),min(rental_date)) FROM rental;

#Instruction 7
SELECT rental_date, MONTHNAME(rental_date) AS Month, date_format(rental_date,'%W') as weekday
FROM rental
LIMIT 20;

#Instruction 8
SELECT *,
monthname(rental_date) as Month,
date_format(rental_date,'%W') AS Day,
CASE
WHEN date_format(rental_date,'%W') = 'Sunday' THEN 'workday'
WHEN date_format(rental_date,'%W') = 'Monday' THEN 'workday'
WHEN date_format(rental_date,'%W') = 'Tuesday' THEN 'workday'
WHEN date_format(rental_date,'%W') = 'Wednesday' THEN 'workday'
WHEN date_format(rental_date,'%W') = 'Thursday' THEN 'workday'
ELSE 'weekend'
END AS "day_type"
FROM sakila.rental;

#Instruction 9
SELECT * FROM rental;
SELECT count(monthname(last_update)= 2) FROM rental;