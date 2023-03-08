USE `sakila`;

-- What is the average running time of films by category?
SELECT `category`.`name`, AVG(`film`.`length`) AS `average_length`  FROM `film`
JOIN `film_category` ON `film`.`film_id` = `film_category`.`film_id`
JOIN `category` ON `film_category`.`category_id` = `category`.`category_id`
GROUP BY `category`.`category_id`;


-- Which last names appear more than once?
SELECT `last_name`, COUNT(`last_name`) AS `occurences` FROM `actor`
GROUP BY `last_name`
HAVING `occurences` > 1;


-- Retrieve all movies that Fred Costner has appeared in
SELECT `film`.`title` FROM `film`
JOIN `film_actor` ON `film`.`film_id` = `film_actor`.`film_id`
JOIN `actor` ON `film_actor`.`actor_id` = `actor`.`actor_id`
WHERE `actor`.`first_name` = 'Fred' AND `actor`.`last_name` = 'Costner';



-- Find out which location has the most copies of BUCKET BROTHERHOOD
SELECT COUNT(`inventory`.`film_id`) AS `copies`, `film`.`title`, `address`.`address` 
FROM `inventory`
JOIN `film` ON `inventory`.`film_id` = `film`.`film_id`
JOIN `store` ON `inventory`.`store_id` = `store`.`store_id`
JOIN `address` ON `store`.`address_id` = `address`.`address_id`
GROUP BY `inventory`.`film_id`, `store`.`store_id`
HAVING `film`.`title` = 'BUCKET BROTHERHOOD'
ORDER BY `copies` DESC LIMIT 1;


-- Create a list of categories and the number of films for each category
SELECT `category`.`name`, COUNT(`film_category`.`film_id`) AS `number_of_films`
FROM `category`
JOIN `film_category` ON `category`.`category_id` = `film_category`.`category_id`
GROUP BY `category`.`category_id`;


-- Create a list of actors and the number of movies by each actor
SELECT CONCAT(`actor`.`first_name`, ' ', `actor`.`last_name`) AS `full_name`,
	   COUNT(`film_actor`.`film_id`) AS `number_of_films`
FROM `actor`
JOIN `film_actor` ON `actor`.`actor_id` = `film_actor`.`actor_id`
GROUP BY `actor`.`actor_id`
ORDER BY `number_of_films` DESC;


-- Is 'Academy Dinosaur' available to rent from Store 1?
SELECT `film`.`title`, COUNT(`inventory`.`film_id`) AS `stock`
FROM `film`
JOIN `inventory` ON `film`.`film_id` = `inventory`.`film_id`
WHERE `inventory`.`store_id` = 1 AND `film`.`title` = 'Academy Dinosaur'
GROUP BY `film`.`film_id`;
