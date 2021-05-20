######## REVISITING DATA TYPES ###########

## VAR AND VARCHAR

mysql> SHOW DATABASES;
mysql> CREATE DATABASE testing_db;

CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));

INSERT INTO dogs (name, breed) VALUES ('bob', 'beagle');
INSERT INTO dogs(name, breed) VALUES ('robby', 'corgi');
INSERT INTO dogs(name, breed) VALUES ('Princess Jane', 'Retriever');

## DECIMAL
DECIMAL(5,2) ### 999.99 (5 Digits and 2 digits)

CREATE TABLE items (price DECIMAL(5,2));
INSERT INTO items(price) VALUES (7);
INSERT INTO items(price) VALUES(238934934);
INSERT INTO items(price) VALUES(34.88);
INSERT INTO items(price) VALUES(298.99999);
INSERT INTO items(price) VALUES(1.9999);

## FLOAT AND DOUBLE 
CREATE TABLE thingies(price FLOAT);
INSERT INTO thingies(price) VALUE(88.45);
INSERT INTO thingies(price) VALUES(88877.45);
INSERT INTO thingies(price) VALUE(8485768594.45);

## Creating Our DATE data
CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);

INSERT INTO people (name, birthdate, birthtime, birthdt) 
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');

## CURDATE, CURTIME, and NOW
CURDATE() - give current date
CURTIME() - gives current date
NOW() - gives current datetime

SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();

INSERT INTO people(name, birthdate, birthtime, birthdt) 
VALUES ('Miri', CURDATE(), CURTIME(), NOW());

DELETE FROM people WHERE name = 'Miri';

# Formating Dates and times
DAY()
DAYNAME()
DAYOFWEEK()
DAYOFYEAR()

SELECT name, DAY(birthdate) FROM people;
SELECT name, birthdate, DAY(birthdate) FROM people;
SELECT name, birthdate, DAYNAME(birthdate) FROM people;
SELECT name, birthdate, DAYOFWEEK(birthdate) FROM people;
SELECT name, birthdate, DAYOFYEAR(birthdate) FROM people;

SELECT name, birthtime, DAYOFYEAR(birthtime) FROM people; ## gIVE NULL valaues
SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people;
SELECT name, birthdt, MONTH(birthdt) FROM people;
SELECT name, birthdt, MONTHNAME(birthdt) FROM people;

SELECT name, birthtime, HOUR(birthtime) FROM people;
SELECT name, birthtime, MINUTE(birthtime) FROM people;

# "2017-04-21"   ---->  "April 21 of 2017"
SELECT CONCAT(MONTHNAME(birthdate), ' ', DAY(birthdate), ' of ', YEAR(birthdate)) FROM people;

# DATEFORMAT Link: https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html
SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W %M %Y');
SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W-%M-%Y');
SELECT DATE_FORMAT('2009-10-04 22:23:00', '%W%M%Y');

SELECT DATE_FORMAT(birthdt, '%W') FROM people;
SELECT DATE_FORMAT(birthdt, 'Was born On A %W') FROM people;
SELECT DATE_FORMAT(birthdt, '%m/%d/%y') FROM people; # 11/11/83
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people; # 11/11/1983
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%m') FROM people; # 11/11/1983 at 10:11

# Date Math
DATEDIFF
DATE_ADD
+/-

SELECT * FROM people;
SELECT DATEDIFF(NOW(), birthdate) FROM people;
SELECT name, birthdate, DATEDIFF(NOW(), birthdate) FROM people;



SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) from people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) from people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) from people;

SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;

SELECT birthdt, birthdt + INTERVAL 10 MONTH + INTERVAL 10 HOUR FROM people;

# Working with TIMESTAMPS

CREATE TABLE comments(
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO comments(content) VALUES('lol what a funny article');
INSERT INTO comments(content) VALUES('I am having so much fun');
INSERT INTO comments(content) VALUES('Love life');
SELECT * FROM comments ORDER BY created_at DESC;

CREATE TABLE comment2 (
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO comment2(content) VALUES('lol what a funny article');
INSERT INTO comment2(content) VALUES('I am having so much fun');
INSERT INTO comment2(content) VALUES('Love life');

UPDATE comment2 SET content='THIS IS NOT FUN ANYMORE' WHERE content='lol what a funny article';

SELECT * FROM comment2 ORDER BY changed_at;

###### CHALLANGE SECCTION ##########

CREATE TABLE inventory (
    item_name VARCHAR(100),
    price DECIMAL(8,2), # 999,999.99
    quantity INT 
);

SELECT NOW();
SELECT CURDATE();
SELECT DAYNAME(NOW());
SELECT DAYOFWEEK(NOW());
SELECT DATE_FORMAT(CURDATE(), '%d/%m/%y');
SELECT DATE_FORMAT(CURDATE(), '%d/%m/%y');
SELECT DATE_FORMAT(CURDATE(), '%M %D at %h:%i');

CREATE TABLE tweets(
    content VARCHAR(140),
    Username VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);







