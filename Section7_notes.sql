# SECTION 7. The World Of String Functions

# Using AWS C9. 

# First create a file and put this data inside:
	# Name of the file: first_file.sql
CREATE TABLE cats 
    (
        cat_id INT NOT NULL AUTO_INCREMENT,
        name VARCHAR(100),
        AGE INT,
        PRIMARY KEY(cat_id)
    );
    
	# Initiation of Mysql
ec2-user:~/environment/mysql_course $ sudo service mysqld start
ec2-user:~/environment/mysql_course $ mysql -uroot -p 

	# Creating a database
mysql> CREATE DATABASE cat_app;
mysql> SHOW DATABASES;
mysql> USE cat_app;
mysql> SELECT database();

	# Execuitn the file: first_file.sql
mysql> source first_file.sql;
mysql> SHOW TABLES;

	# Executing sql in another file
mysql> source testing/insert.sql;

# Anohter exercise with books. File provided by Colt. 
# Name of the file: book-data.sql
mysql> CREATE DATABASE book_shop;
mysql> SHOW DATABASE;
mysql> USE book_shop;
mysql> SELECT database();
mysql> source book-data.sql;
mysql> SELECT * FROM books; 

# Now is time to use Functions with this data!!
# Function CONCAT
mysql> SELECT author_fname, author_lname FROM books;
mysql> SELECT CONCAT('Hello', 'Richar');
mysql> SELECT CONCAT('Hello', '...',  'Richar');


mysql> SELECT CONCAT(author_fname, ' ', author_lname)
FROM books;
mysql> SELECT CONCAT(author_fname, ' ', author_lname)
AS 'full name' FROM books;    

mysql> SELECT author_fname AS first, author_lname AS last,
CONCAT(author_fname, ' ', author_lname) AS full 
FROM books;

mysql> SELECT author_fname AS first, author_lname AS last,
CONCAT(author_fname, ', ', author_lname) AS full 
FROM books;

# Function CONCAT_WS
mysql> SELECT CONCAT_WS(' - ', title, author_fname, author_lname)
FROM books;


# Function SUBSTRINT
SELECT SUBSTRING('Hello WOrld', 1, 4); # First letter until 4
SELECT SUBSTRING('Hello WOrld', 7); # 7 to the end
SELECT SUBSTRING('Hello WOrld', 1, 4) AS BadWord;
SELECT SUBSTRING('Hello World', -3);
SELECT SUBSTRING('Hello World', -7);

# SUBSTRING() or SUBSTR() with tables
SELECT title FROM books;
SELECT SUBSTRING("Where I'm Calling From: Selected Stories",
 1, 10);
 
SELECT SUBSTRING(title, 1, 10) FROM books;
mysql>  SELECT SUBSTRING(title, 1, 10) FROM books;
mysql>  SELECT SUBSTRING(title, 1, 10)  AS 'Short Title' FROM books;

SELECT SUBSTR(title, 1, 10) FROM books;
mysql>  SELECT SUBSTR(title, 1, 10) FROM books;
mysql>  SELECT SUBSTR(title, 1, 10)  AS 'Short Title' FROM books;


# Compbination of SUBSTRING() & CONCAT()

## Mini-Exercise

# The wrong answer but without error
SELECT SUBSTRING(title, 1, 10) AS 'Short Title',
CONCAT('...', 'Short Title') FROM books; 

# The desired answer
SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS shortTitle FROM books; 

# THe way Coolt write it 
SELECT 
    CONCAT
        (
        SUBSTRING(title, 1, 10),
        '...'
        ) AS shortTitle 
FROM books; 

# Function REPLACE()

SELECT REPLACE('Hello Word', 'Hell', '%$#@');
SELECT REPLACE('Hello Word', 'Hell', '***');
SELECT REPLACE('Hello Word', 'l', '7');
SELECT REPLACE('Hello Word', 'l', '0');
SELECT REPLACE('HellO Word', 'o', '*'); # It is CASESENSITIVE
SELECT REPLACE('cheese bread coffee milk', ' ', ' and ');

# REPLACE() with the Tables
SELECT REPLACE(title, 'e', '3') FROM books;

# Combo with RAPLACE()
SELECT 
    SUBSTRING(REPLACE(title, 'e', '8'),1,10)
FROM books;    

SELECT 
    SUBSTRING(REPLACE(title, 'e', '8'),1,10) AS 'wITHsTHING'
FROM books; 

# Function REVERSE()
SELECT REVERSE('Hello World');
SELECT REVERSE('meow meow meow');
#REVERSE() with Tables
SELECT REVERSE(author_fname) FROM books;
# REVERSE() combo
SELECT CONCAT('woof', REVERSE('woof'));
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

# Function CHAR_LENGTH()
SELECT CHAR_LENGTH('Hello Word');
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;


# mini Exercise combo with CHAR_LENGT()
SELECT CONCAT
    (
        author_lname,
        ' is ',
        CHAR_LENGTH(author_lname),
        ' characters long'
    ) AS lengthName
FROM books; 

# Function UPPER() and LOWER() 
SELECT UPPER('love richard');
SELECT LOWER('LOVE');

SELECT UPPER(title) FROM books;

# mini Exercise combo with UPPER() or LOWER()
SELECT
  CONCAT(UPPER('My favorite book is the '), UPPER(title)) AS yelling
FROM books;

# Note about string function
    #This work
SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps'
FROM books;
    #This doesn't 
SELECT CONCAT(UPPER(author_fname, ' ', author_lname)) AS 'full name in caps' 
FROM books; # UPPER only takes one argument and CONCAT takes two
# ... or more arguments, so they can't be switched in that way.

    #Possible way 
SELECT
  CONCAT
    (
        UPPER(author_fname),
        ' ',
        UPPER(author_lname)
    ) AS 'full name in caps'
FROM books; # But, the first example above would be better
# ... (more DRY*) because you wouldn't need to call UPPER two times.


# String Function Challange [EXERCICES]
### Exercices 1
SELECT REVERSE(UPPER("why does my cat look at me with such hatred?"))
AS REVUPPER;
### Exercices 2
SELECT
  REPLACE
  (
  CONCAT('I', ' ', 'like', ' ', 'cats'),
  ' ',
  '-'
  );

### Exercices 3
SELECT REPLACE(title, ' ', '->') AS title FROM books;

### Exercices 4
SELECT UPPER(CONCAT(author_fname,' ',author_lname))
AS 'full name in caps' FROM books;

### Exercices 5
SELECT CONCAT(title,' was released in ', released_year) AS blurb FROM books;

### Exercices 6
SELECT title AS title, CHAR_LENGTH(title) AS 'character count' FROM books;

### Exercices 7
SELECT CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
CONCAT(author_lname,',',author_fname) AS 'author',
CONCAT(stock_quantity, ' in stock') AS 'quantity' FROM books;

### Exercices 8
SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards FROM books;





