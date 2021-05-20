# CRUD CHALLANGE SECTION

# Database creation 
SHOW DATABASES;
CREATE DATABASE shirts_db;
SHOW DATABASES;
USE shirts_db;
SELECT database();

# Table creation
CREATE TABLE shirts
(
	shirt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(100),
    color VARCHAR(100),
    shirt_size VARCHAR(100),
    last_worn VARCHAR(100)
);

# Insert things
INSERT INTO shirts(article, color, shirt_size, last_worn)
VALUE
	('t-shirt', 'white', 'S', 10),
	('t-shirt', 'green', 'S', 200),
	('polo shirt', 'black', 'M', 10),
	('tank top', 'blue', 'S', 50),
	('t-shirt', 'pink', 'S', 0),
	('polo shirt', 'red', 'M', 5),
	('tank top', 'white', 'S', 200),
	('tank top', 'blue', 'M', 15);

INSERT INTO shirts (article, color, shirt_size, last_worn) 
VALUE ('Polo', 'Purple', 'M', 50);

# SELECT Things
SELECT article, color FROM shirts;


SELECT article, color, shirt_size, last_worn FROM shirts 
WHERE shirt_size='M';


# Update things
UPDATE shirts SET shirt_size='L';
UPDATE shirts SET last_worn=0 WHERE last_worn=15;
UPDATE shirts SET shirt_size='XS', color='off white'
WHERE color='white';


# Delete things
DELETE FROM shirts WHERE last_worn=200;
DELETE FROM shirts WHERE article='Tank top';
DELETE FROM shirts;
DROP TABLE shirts;








