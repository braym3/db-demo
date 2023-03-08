USE sakila;

-- Which actor has appeared in the most films?

-- two queries
SELECT `actor_id`, COUNT(`actor_id`) AS `number` FROM `film_actor`
GROUP BY `actor_id`
ORDER BY `number` DESC LIMIT 1;

SELECT CONCAT(`first_name`, ' ', `last_name`) AS `full_name` FROM `actor`
WHERE `actor_id` = 107;

-- trying to remember join

SELECT CONCAT(`actor`.`first_name`, ' ', `actor`.`last_name`) AS `full_name`, COUNT(`film_actor`.`actor_id`) AS `num_of_films`
FROM `actor`
JOIN `film_actor` ON `actor`.`actor_id` = `film_actor`.`actor_id`
GROUP BY `actor`.`actor_id`
ORDER BY `num_of_films` DESC LIMIT 1;


-- What is the average running time of all the films in the database

SELECT AVG(`length`) AS `average_length` FROM `film`;


-- What is the average running time of films by category?

SELECT `category`.`name`, AVG(`film`.`length`) AS `average_length`  FROM `film`
JOIN `film_category` ON `film`.`film_id` = `film_category`.`film_id`
JOIN `category` ON `film_category`.`category_id` = `category`.`category_id`
GROUP BY `category`.`name`;


-- How many movies have robots in them?

SELECT COUNT(`film_id`) AS `robot_films` FROM `film`
WHERE `description` LIKE '%robot%';


-- Find the movie(s) with the longest runtime

SELECT `title`, MAX(`length`) AS `runtime` FROM `film`
GROUP BY `film_id`
ORDER BY `runtime` DESC LIMIT 1;


-- Count how many movies were released in 2010?

SELECT COUNT(`film_id`) AS `number` FROM `film`
WHERE `release_year` = '2010';


-- Which last names are not repeated?
-- DISTINCT only pulls first unique one it finds - not for this situation

SELECT DISTINCT `last_name` FROM `actor`;



-- Re-doing tasks with nested queries

-- Which actor has appeared in the most films?
SELECT CONCAT(`first_name`, ' ', `last_name`) AS `full_name` FROM `actor`
WHERE `actor_id` = (
	SELECT `actor_id` FROM `film_actor` 
    GROUP BY `actor_id`
    ORDER BY COUNT(`actor_id`) DESC LIMIT 1
);


 -- Find the movie(s) with the longest runtime
 SELECT `title`, `length` FROM `film`
 WHERE `length` = (
	SELECT `length` FROM `film`
    ORDER BY `length` DESC LIMIT 1
 );
