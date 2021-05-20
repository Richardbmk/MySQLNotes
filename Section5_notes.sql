#CRUDs command

CREATE TABLE cats 
(
	cat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT
);

INSERT INTO cats(name, breed, age)
VALUES  ('Ringo', 'Tabby', 4),
		('Cindy', 'Maine Coon', 10),
        ('Dumbledore', 'Maine Coon', 11),
        ('Egg', 'Persian', 4),
        ('Misty', 'Tabby', 13),
        ('George Michael', 'Ragdoll', 9),
        ('Jackson', 'Sphynx', 7);
        

# R of CRUD
SELECT * FROM cats;
SELECT name FROM cats;
SELECT age FROM cats;
SELECT name, age FROM cats;

# Introduction to WHERE
SELECT * FROM cats WHERE age=4;
SELECT * FROM cats WHERE name='Egg'; #Case insensitibe!!
SELECT name, age FROM cats WHERE breed='Tabby';
SELECT cat_id, age FROM cats WHERE cat_id=age;

# Introduction to Aliases
SELECT cat_id AS id, name FROM cats;
SELECT name AS 'Coolt cats', breed AS 'Kitty breed' FROM cats;

# The update command
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
UPDATE cats SET age=14 WHERE name='Misty';
	#Update exercise
SELECT * FROM cats WHERE name="Jackson";
UPDATE cats SET name="Jack" WHERE name="Jackson";
SELECT * FROM cats WHERE name="Jack";

UPDATE cats SET breed='Bitish Shorthair' WHERE name='Ringo';

UPDATE cats SET age=12 WHERE breed='Maine Coon';

#The Delete command
SELECT * FROM cats WHERE name='Egg';
DELETE FROM cats WHERE name='Egg';
DELETE FROM cats; # Drops everything!! but we still have the TABLE
	#Exercise DELETE
DELETE FROM cats WHERE age=4;
DELETE FROM cats WHERE cat_id=age;
DELETE FROM cats;





