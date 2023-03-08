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
