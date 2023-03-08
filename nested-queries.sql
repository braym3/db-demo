USE sakila;

-- Nested queries

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
 