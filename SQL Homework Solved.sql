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
SELECT f.title, l.name 
FROM film f, language l
WHERE f.language_id = l.language_id
AND title LIKE "K%" 
OR title LIKE "Q%"
AND
(SELECT name
FROM language WHERE name = "ENGLISH");
-- 7b
SELECT film_id, first_name, last_name
FROM film_actor, actor
WHERE film_actor.actor_id=actor.actor_id
AND
film_id = 
(SELECT film_id 
FROM film 
WHERE title = "Alone Trip");
-- 7c
select email, country
from customer c
inner join address a on c.customer_id = a.address_id
inner join city y on y.city_id=a.city_id
inner join country co on y.country_id = co.country_id
where co.country = "Canada";
-- 7d
select title, name
from film f
inner join film_category fc on fc.film_id = f.film_id
inner join category c on c.category_id=fc.category_id
where c.name = "Family";
-- 7e
select title, count(*) AS 'Number of Rentals'
from film f
inner join inventory i on f.film_id = i.film_id
inner join rental r on i.inventory_id = r.inventory_id;
-- 7f
select store_id, sum(amount) as "total sales"
from payment p
inner join rental r on r.rental_id = p.rental_id
inner join staff s on s.staff_id = r.staff_id;
-- 7g
select store_id, city, country
from store s 
inner join address a on s.store_id = a.address_id
inner join city c on c.city_id = a.city_id
inner join country ct on ct.country_id = c.country_id;
-- 7h

