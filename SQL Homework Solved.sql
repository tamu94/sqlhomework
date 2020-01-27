use sakila;
-- 1a
select * from actor;
SELECT a.first_name, a.last_name from actor a;
-- 1b
ALTER TABLE actor
ADD COLUMN `Actor Name` VARCHAR(50);
SELECT CONCAT (first_name," ", last_name) FROM actor;
-- 2a
SELECT actor_id, first_name, last_name FROM actor
WHERE first_name = 'Joe';
-- 2b
SELECT actor_id, first_name, last_name FROM actor
WHERE last_name LIKE "%GEN%";
-- 2c



