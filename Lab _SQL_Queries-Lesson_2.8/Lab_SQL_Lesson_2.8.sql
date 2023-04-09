USE sakila;
SHOW TABLES;

# Rank films by length (filter out the rows with nulls or zeros in length column). 
# Select only columns title, length and rank in your output.

SELECT * FROM film;
SELECT title, length, rating ,RANK() OVER (ORDER BY length ASC) AS 'RANK'
FROM film;

# Rank films by length within the rating category (filter out the rows with nulls or zeros 
# in length column). In your output, only select the columns title, length, rating and rank.

SELECT title, length, rating ,RANK() OVER (ORDER BY length ASC) AS 'RANK'
FROM film
ORDER BY rating;

#How many films are there for each of the categories in the category table? 
#Hint: Use appropriate join between the tables "category" and "film_category".

SELECT * FROM category;
SELECT * FROM film_category;

SELECT category.name ,count(*) AS count_category
FROM film_category
JOIN category ON category.category_id = film_category.category_id
GROUP BY category.name
ORDER BY count_category;

# Which actor has appeared in the most films? Hint: You can create a join between the tables 
# "actor" and "film actor" and count the number of times an actor appears.
SELECT * FROM actor;
SELECT * FROM film_actor;

SELECT actor.first_name,count(*) AS count_films
FROM film_actor
JOIN actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.first_name
ORDER BY count_films;

# Which is the most active customer (the customer that has rented the most number of films)? 
# Hint: Use appropriate join between the tables "customer" and "rental" and count the 
# rental_id for each customer.
SELECT * FROM customer;
SELECT * FROM rental;

SELECT customer.first_name, COUNT(*) AS count_rental_films
FROM rental
JOIN customer ON customer.customer_id = rental.customer_id
GROUP BY customer.first_name
ORDER BY count_rental_films DESC;

# Bonus: Which is the most rented film? (The answer is Bucket Brotherhood).
# This query might require using more than one join statement. Give it a try. 
# We will talk about queries with multiple join statements later in the lessons.
# Hint: You can use join between three tables - "Film", "Inventory", and "Rental" 
# and count the rental ids for each film
SELECT * FROM film;
SELECT * FROM inventory;
SELECT * FROM rental;

SELECT film.title, COUNT(*) AS count_rental_films
FROM rental
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
GROUP BY film.title
ORDER BY count_rental_films DESC;

-- Get a rank of districts ordered by the number of customers.
SELECT * FROM customer;
SELECT * FROM address;

SELECT RANK() OVER (ORDER BY count(*) DESC) AS 'rank', 
   address.district  AS district_name, 
   count(*) AS num_customers
FROM customer
JOIN address ON customer.address_id = address.address_id 
GROUP BY address.address_id ;