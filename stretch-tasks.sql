USE `movielens`;

-- List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
SELECT `title`, `release_date` FROM `movies`
WHERE `release_date` >= '1983-01-01' AND `release_date` < '1994-01-01'
ORDER BY `release_date` DESC;



-- Without using LIMIT, list the titles of the movies with the lowest average rating
SELECT `movies`.`title`, `ratings`.`rating` FROM `movies`
JOIN `ratings` ON `movies`.`id` = `ratings`.`movie_id`
WHERE `rating` = (
		SELECT MIN(`rating`) FROM `ratings`
        );


-- List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings
SELECT `movies`.`title` FROM `movies`
JOIN `ratings` ON `movies`.`id` = `ratings`.`movie_id`
JOIN `users` ON `ratings`.`user_id` = `users`.`id`
JOIN `occupations` ON `users`.`occupation_id` = `occupations`.`id`
JOIN `genres_movies` ON `movies`.`id` = `genres_movies`.`movie_id`
JOIN `genres` ON `genres_movies`.`genre_id` = `genres`.`id`
WHERE `genres`.`name` LIKE '%Sci-Fi%' AND `ratings`.`rating` = 5 AND `users`.`age` = 24 AND `occupations`.`name` LIKE '%student%'
GROUP BY `movies`.`id`
HAVING COUNT(`movies`.`id`) = 1;
