Use sakila;
SHOW TABLES;
# LAB PART 1

drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

# Instructions
#Add the new films to the database.
show variables like 'local_infile';
set global local_infile = 1;

load data LOCAL INFILE 'C:\\Users\\SPARTAN PC\\Documents\\IRONHACK\\Lab_SQL_Queries-Lesson_2.7\\films_2020.csv'
into table films_2020
fields terminated BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
(film_id,title,description,release_year,language_id,original_language_id,rental_duration,rental_rate,length,replacement_cost,rating);

## DELETE FROM films_2020;

SHOW TABLES;
SELECT * FROM films_2020;

#Update information on rental_duration, rental_rate, and replacement_cost.
SELECT * FROM film;


UPDATE films_2020
SET rental_duration = 3
WHERE rental_duration = 0;

UPDATE films_2020
SET rental_rate = 2.99
WHERE rental_rate = 0.00;

UPDATE films_2020
SET replacement_cost = 8.99
WHERE replacement_cost = 0.00;

#In the table actor, what last names are not repeated? For example if you would sort the data in the table actor by last_name, 
#you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. 
#So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", 
#hence we would want this in our output list.
SELECT * FROM actor;
SELECT last_name AS last_name, count(*) AS rep
FROM actor
GROUP BY last_name
ORDER BY rep;

SELECT last_name AS last_name, count(*) AS rep
FROM actor
GROUP BY last_name
HAVING rep < 2
ORDER BY rep;


#Which last names appear more than once? We would use the same logic as in the previous question but this time we want to 
#include the last names of the actors where the last name was present more than once
SELECT * FROM actor;
SELECT first_name,last_name, count(*) AS rep
FROM actor
GROUP BY first_name,last_name
ORDER BY rep;

#Using the rental table, find out how many rentals were processed by each employee.
SELECT * FROM rental;

#Using the film table, find out how many films were released.
SELECT staff_id, count(*) AS many_films
FROM rental
GROUP BY staff_id
ORDER BY many_films;

#Using the film table, find out how many films there are of each rating.
SELECT * FROM film;
SELECT count(*) AS released_movies
FROM film;

#What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT * FROM film;
SELECT rating, round(AVG(length),2) AS average
FROM film
GROUP BY rating
ORDER BY average;

#Which kind of movies (rating) have a mean duration of more than two hours?
# Dado el resultado anterior solo 1




