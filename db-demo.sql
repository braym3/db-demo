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

SELECT * FROM `actor`;

SELECT * FROM `actor`
WHERE `first_name` = 'John';

SELECT * FROM `actor`
WHERE `last_name` = 'Neeson';

SELECT * FROM `actor`
WHERE `actor_id` % 10 = 0;

SELECT * FROM `actor`
WHERE `actor_id` % 10 = 0;

SELECT `description` FROM `film`
WHERE `film_id` = 100;

SELECT `title`, `rating` FROM `film`
WHERE `rating` = 'R';

SELECT `title`, `rating` FROM `film`
WHERE `rating` != 'R';

SELECT `title`, `length` FROM `film`
ORDER BY `length` LIMIT 10;

SELECT `title`, `special_features` FROM `film`
WHERE `special_features` IN ('Deleted Scenes');

SELECT COUNT(DISTINCT `country`) FROM `country`;

SELECT `name` FROM `language`
ORDER BY `name`;