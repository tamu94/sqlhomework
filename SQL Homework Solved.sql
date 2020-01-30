use sakila;
-- 1a
select * from actor;
SELECT a.first_name, a.last_name from actor a;
-- 1b
SELECT CONCAT(first_name, " ", last_name) FROM actor AS `Actor Name`;
-- 2a
SELECT actor_id, first_name, last_name FROM actor
WHERE first_name = 'Joe';
-- 2b
SELECT actor_id, first_name, last_name FROM actor
WHERE last_name LIKE "%GEN%";
-- 2c
SELECT actor_id, first_name, last_name FROM actor
WHERE last_name LIKE "%LI%"
ORDER BY last_name, first_name ASC;
-- 2d
SELECT * FROM country
WHERE country IN ("Afghanistan","China","Bangladesh");
-- 3a
ALTER TABLE actor
ADD `description` BLOB;
-- 3b
ALTER TABLE actor
DROP `description`;
-- 4a
SELECT last_name, COUNT(*) FROM actor
GROUP By last_name;
-- 4b
SELECT last_name, COUNT(*) FROM actor
GROUP By last_name
HAVING COUNT(*)>=2;
-- 4c
UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = "GROUCHO" AND last_name = 'WILLIAMS';
-- 4d
UPDATE actor
SET first_name = 'GROUCHO'
WHERE first_name = 'HARPO' AND last_name = '%';
-- 5a
SHOW CREATE TABLE address;
-- 6a
SELECT first_name, last_name, address
FROM staff
LEFT JOIN address ON staff.address_id = address.address_id;
-- 6b
SELECT first_name, last_name, sum(amount)
FROM staff
LEFT JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY last_name;
-- 6c
SELECT title, count(actor_id)
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY title;
-- 6d
SELECT f.title, count(*) AS 'Number of Copies' FROM film f
JOIN inventory i USING (film_id) 
WHERE f.title = "Hunchback Impossible";
-- 6e
SELECT last_name, sum(amount)
FROM customer
INNER JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY last_name;
-- 7a
SELECT title FROM film
WHERE title LIKE "K%" or title Like "Q%";


