##### Section 11. The power of logical Operator ######

# Not equal | != 

SELECT title, released_year FROM books WHERE released_year = 2017;

SELECT title, released_year FROM books WHERE released_year != 2017;

SELECT title, author_lname FROM books;

SELECT title, author_lname FROM books WHERE author_lname = 'Harris';
SELECT title, author_lname FROM books WHERE author_lname != 'Harris';

# NOT LIKE 
SELECT title FROM books WHERE title LIKE 'W%';
SELECT title FROM books WHERE title LIKE '%W%';

SELECT title FROM books WHERE title NOT LIKE 'W%';

# Greater Than (  >  )

SELECT * FROM books ORDER BY released_year;
SELECT * FROM books WHERE released_year > 2000;
SELECT * FROM books WHERE released_year > 2000 ORDER BY released_year;
SELECT * FROM books WHERE released_year > 2000 ORDER BY released_year DESC;

# Greater Than (  >=  )

SELECT * FROM books WHERE released_year >= 2000;
SELECT * FROM books WHERE released_year >= 2000 ORDER BY released_year;
SELECT * FROM books WHERE released_year >= 2000 ORDER BY released_year DESC;

SELECT title, stock_quantity FROM books;
SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100;

SELECT 99 > 1; # boolean logic!!  true = 1
SELECT 99 < 1; # boolean logic!!  false = 0

SELECT 100 > 5; # boolean logic!!  true = 1
SELECT -15 > 15; # boolean logic!!  false = 0
SELECT 9 > -10; # boolean logic!!  true = 1
SELECT 1 > 1; # boolean logic!!  false = 0
SELECT 'a' > 'b'; # boolean logic!!  false = 0
SELECT 'A' > 'a'; # boolean logic!!  false = 1
'A' >=  'a'
-- true

# Greater Than (  <  )
SELECT * FROM books WHERE released_year < 2000;
SELECT title, released_year FROM books;
SELECT title, released_year FROM books ORDER BY released_year;
SELECT * FROM books WHERE released_year < 2000 ORDER BY released_year;
SELECT * FROM books WHERE released_year <=  2000 ORDER BY released_year;

SELECT 3 < -10; # boolean logic!!  false = 0
SELECT -10 < -9; # boolean logic!!  true = 1
SELECT 42 <= 42; # boolean logic!!  true = 1
SELECT 'h' < 'p'; # boolean logic!!  true = 1, becouse h comes before p then is true!!
SELECT 'Q' <= 'q'; # boolean logic!!  true = 1, there are equivalent!! 

# Logical AND 
    ## SELECT books writen by Dave Eggers
SELECT * FROM books WHERE author_lname = 'Eggers';
    ## Published after the year 2010
SELECT * FROM books WHERE released_year > 2010;
    ## Combo
SELECT * FROM books WHERE author_lname = 'Eggers' AND released_year > 2010;
SELECT * FROM books WHERE author_lname = 'Eggers' && released_year > 2010;

SELECT * FROM products WHERE brand = 'lego' AND instock = 'true';

SELECT 1 < 5 && 7 = 9; # boolean logic!!  false = 0

SELECT -10 > -20 && 0 <= 0; # boolean logic!!  true = 1
SELECT -40 <= -0 AND 10 > 40; # boolean logic!!  false = 0
SELECT 54 <= 54 && 'a' = 'A'; # boolean logic!!  true = 1

SELECT * FROM books WHERE author_lname = 'Eggers' AND
released_year > 2010 AND title LIKE '%novel%';

# Logical OR ||
# Just one have to be true in order to be true!!
SELECT * FROM books WHERE author_lname = 'Eggers' || released_year > 2010;

SELECT 40 <= 100 || -2 > 0;  # boolean logic!!  true = 1
SELECT 10 > 5 || 5 = 5; # boolean logic!!  true = 1
SELECT 'a' = 5 || 3000 > 2000; # boolean logic!!  true = 1

SELECT title, author_lname, released_year, stock_quantity FROM books
WHERE author_lname = 'Eggers' || released_year > 2010 OR 
stock_quantity > 100;

# BETWEEN 
    # Normal way
SELECT title, released_year FROM books WHERE released_year >= 2004 
&& released_year <= 2015;
    # using BETWEEN
SELECT title, released_year FROM books WHERE released_year BETWEEN 2004 AND 2015;

SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015;
SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015 ORDER BY released_year;

# CAST()
SELECT CAST('2017-05-02' AS DATETIME);

SHOW DATABASES;
USE testing_db;
SELECT * FROM people;
    # Not a god practice
SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';
    # God practice
SELECT name, birthdt FROM people WHERE birthdt BETWEEN
CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);

# IN
    # We can do this
SELECT title, author_lname FROM books WHERE author_lname='Carver' OR
author_lname='Lahiri' OR author_lname='Smith';
    # Better way
SELECT title, author_lname FROM books WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
SELECT title, released_year FROM books WHERE released_year IN (2017, 1985);

# NOT IN 
    # We can do this 
SELECT title, released_year FROM books
WHERE released_year != 2000 AND
      released_year != 2002 AND
      released_year != 2004 AND
      released_year != 2006 AND
      released_year != 2008 AND
      released_year != 2010 AND
      released_year != 2012 AND
      released_year != 2014 AND
      released_year != 2016;

    # Better and simple way 
SELECT title, released_year FROM books WHERE released_year
NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);

SELECT title, released_year FROM books WHERE released_year >= 2000
AND released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016);
SELECT title, released_year FROM books WHERE released_year >= 2000
AND released_year NOT IN (2000,2002,2004,2006,2008,2010,2012,2014,2016) ORDER BY released_year;
    # Another fuking level 
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0;
SELECT title, released_year FROM books WHERE released_year >= 2000 AND released_year % 2 != 0 ORDER BY released_year;

# CASE STATEMENTS 

SELECT title, released_year, 
        CASE 
            WHEN released_year >= 2000 THEN 'Modern Lit'
            ELSE '20th Century Lit'
        END AS GENRE
FROM books;

SELECT title, stock_quantity, 
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;

SELECT title, 
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;

SELECT title, stock_quantity, 
    CASE 
        WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
        WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
        ELSE '****'
    END AS STOCK
FROM books;


SELECT title, stock_quantity,
    CASE
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books;

### CHALLANGE SECTION ####

# Evaluate the following... 
SELECT 10 != 10;

SELECT 15 > 14 && 99 - 5 <= 94;

SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10;

# Select All books Written Before 1980 (non inclusive)
SELECT * FROM books WHERE released_year < 1980;

# Select All books written by Eggers Or Chabon
SELECT * FROM books WHERE author_lname = 'Eggers' OR author_lname = 'Chabon';
SELECT * FROM books WHERE author_lname = 'Eggers' || author_lname = 'Chabon';
SELECT * FROM books WHERE author_lname IN ('Eggers', 'Chabon');

# Select all books written by Lahiri, Published after 2000 
SELECT * FROM books WHERE author_lname = 'Lahiri' && released_year > 2000;

# Select all books with page counts between 100 and 200 
SELECT * FROM books WHERE pages BETWEEN 100 AND 200;
SELECT * FROM books WHERE pages >= 100 && pages <= 200;

# Select all books where author_lname starts with a 'C' or an 'S'
SELECT * FROM books WHERE author_lname LIKE 'C%' OR author_lname LIKE 'S%';

SELECT * FROM books
WHERE SUBSTR(author_lname,1,1) IN ('C', 'S');
      



# Case statement. Exercises 1

SELECT title, author_lname,
        CASE
            WHEN title LIKE '%stories%' THEN 'Short Stories'
            WHEN title IN ('Just Kids', 'A Heartbreaking Work of Staggering Genius') THEN 'Memoir'
            ELSE 'Novel'
        END AS TYPE
FROM books;

# Case statement. Exercises 2

SELECT title, author_lname,
        CASE
            WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*),' book')
            ELSE CONCAT(COUNT(*),' books')
        END AS COUNT
FROM books GROUP BY author_lname;


SELECT title, author_lname,
        CASE
            WHEN COUNT(*) = 1 THEN CONCAT(COUNT(*),' book')
            ELSE CONCAT(COUNT(*),' books')
        END AS COUNT
FROM books GROUP BY author_lname, author_fname;








