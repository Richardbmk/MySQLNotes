#Inserting Data
INSERT INTO cats(name, age) VALUES ('Jetson', 7);

# Example:
CREATE TABLE cats(name VARCHAR(50), age INT);
INSERT INTO cats(name, age) VALUES ('Blue', 1);
INSERT INTO cats(age, name) VALUES (11, 'Marco');

#Show data in the table
SELECT * FROM cats;

#Multiple insert
INSERT INTO cats(name, age)
VALUES ('Charlie', 10), ('Sadie', 3), ('Lazy Bear', 1);

# To write quotes
INSERT INTO quotes(quote) 
VALUES ("This text has \"quotes\" in it");

INSERT INTO quotes(quote) 
VALUES ('This text has \'quotes\' in it');

INSERT INTO quotes(quote) 
VALUES ("This text has 'quotes' in it");

INSERT INTO quotes(quote) 
VALUES ('This text has "quotes" in it');


# Show the warning info (Exemple)
INSERT INTO cats(name, age) VALUES ('This cat names
is charlie, wich is also a human name. In fact  I know a couple
 of Charlies. Fun Fact.', 10);
SHOW WARNINGS;

# How to not allow null values in a table
CREATE TABLE cats2 (
	name VARCHAR(100) NOT NULL, 
    age INT NOT NULL);
    
# To Set Default Values
CREATE TABLE cats3(
	name VARCHAR(100) DEFAULT 'unnamed',
	age INT DEFAULT 99);
    
INSERT INTO cats3(name, age) VALUES('Montana', NULL);

# A combo of Default and NOT NULL
CREATE TABLE cats4(
	name VARCHAR(20) NOT NULL DEFAULT 'unnamed',
    age INT NOT NULL DEFAULT 0);
    
INSERT INTO cats4(name, age) VALUES('Cali', NULL);

# Working with Primary Keys
CREATE TABLE unique_cats (cat_id INT NOT NULL,
	name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id));
    
INSERT INTO unique_cats(cat_id, name, age) VALUES (
	1, 'Fric', 25);

# A better way to apply Primary Key
CREATE TABLE unique_cats2(cat_id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id));
    
INSERT INTO unique_cats2(name, age) VALUES('Narow', 4);
INSERT INTO unique_cats2(name, age) VALUES('fIZ', 5);

#EXERCICE
CREATE TABLE employees
(
	id INT NOT NULL AUTO_INCREMENT,
    last_name VARCHAR(200) NOT NULL,
    first_name VARCHAR(200) NOT NULL,
    middle_name VARCHAR(290),
    age INTEGER NOT NULL,
    current_status VARCHAR(100) NOT NULL DEFAULT 'employed',
    PRIMARY KEY (id)
);

INSERT INTO employees(first_name, last_name, age, 
middle_name, current_status) VALUES 
(
	'Fina',
    'Matxchi',
    27,
    'Ficki',
    'Junior Engineer'
);  
    
	# One of Coolt solutions
CREATE TABLE employees (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(255) NOT NULL DEFAULT 'employed'
);

INSERT INTO employees(first_name, last_name, age) VALUES
('Dora', 'Smith', 58);



    





