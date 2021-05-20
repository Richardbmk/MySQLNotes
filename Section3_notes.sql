#Show the databases in MySQL
SHOW DATABASES;

# To create a new databases
CREATE DATABASE hello_world_db;
CREATE DATABASE testing_db;

# To delete a database
DROP DATABASE hello_world_db;
DROP DATABASE database_name;

# To use a concrete database
CREATE DATABASE dog_walking_app;
USE dog_walking_app;
SELECT database();
DROP DATABASE dog_walking_app;

# Creating tables in the database
CREATE TABLE cats
	(
		name VARCHAR(100),
		age INT 
    );
    
# How to know if the table I create worked
SHOW TABLES;
SHOW COLUMNS FROM cats;
DESC cats; # is just another way to show the tabla. DESC (DESCribe)

# Delete tables
DROP TABLE cats;


    
    










