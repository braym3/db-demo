INSERT INTO `customers` (`name`, `email`, `house_number`,`postcode`)
VALUES ("Millie", "millie@email", 3, "SK1129"),
("Bob", "bob@email", 18, "SHJ29"),
("Gerry", "Gerry@email", 10, "DNWIU3"),
("Larry", "Larry@email", 1, "WOI8D"),
("Sally", "sally@email", 37, "SE48");

SELECT * FROM `customers`;

INSERT INTO `products` (`title`, `price`, `stock`)
VALUES ("Over The Hedge PS2", 4.99, 7),
("Mario Party DS", 8.50, 42),
("Animal Crossing: New Leaf", 12.99, 132),
("Forza", 32.00, 175),
("Grand Theft Auto V", 15.99, 291);

SELECT * FROM `products`;

INSERT INTO `orders` (`customer_id`, `product_id`, `date_placed`)
VALUES (3, 2, '2023-3-2'),
(3, 2, '2023-3-2'),
(1, 5, '2023-2-12'),
(2, 2, '2023-1-24'),
(4, 3, '2023-3-1');

SELECT * FROM `orders`;

USE `sakila`;

-- Select all actors from the table

SELECT * FROM `actor`;

-- Find all actors with the first name 'John'

SELECT * FROM `actor`
WHERE `first_name` = 'John';

-- Find all actors with the surname 'Neeson'

SELECT * FROM `actor`
WHERE `last_name` = 'Neeson';

-- Find all actors with ID numbers divisible by 10

SELECT * FROM `actor`
WHERE `actor_id` % 10 = 0;

-- What is description of the movie with ID of 100

SELECT `description` FROM `film`
WHERE `film_id` = 100;

-- Find every movie with rating R

SELECT `title`, `rating` FROM `film`
WHERE `rating` = 'R';

-- Find every movie except those rated R

SELECT `title`, `rating` FROM `film`
WHERE `rating` != 'R';

-- Find the 10 shortest movies

SELECT `title`, `length` FROM `film`
ORDER BY `length` LIMIT 10;

-- Now return only the movie titles

SELECT `title` FROM `film`
ORDER BY `length` LIMIT 10;

-- Find all movies with deleted scenes

SELECT `title`, `special_features` FROM `film`
WHERE `special_features` LIKE '%Deleted Scenes%';

-- How many distinct countries are there?

SELECT COUNT(DISTINCT `country`) FROM `country`;

-- What are all the languages in the database (alphabetically)

SELECT `name` FROM `language`
ORDER BY `name`;
