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
