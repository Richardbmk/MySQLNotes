##### AGRAGATE FUNCTIONS #######

# The count Functions
    ## How many author_fname?
SELECT COUNT(*) FROM books;

SELECT COUNT(DISTINCT author_fname) FROM books;

SELECT COUNT(DISTINCT author_fname, author_lname) FROM books;

    ## How many titles contain "the"
SELECT COUNT(title) FROM books WHERE title LIKE "%the%";
    ## Colt Solution
SELECT COUNT(*) FROM books WHERE title LIKE "%the%";

# THe joys of GROUP BY
## GROUP BY summarizes or aggregates identical data into single rows. 

SELECT title, author_lname FROM books GROUP BY author_lname;

SELECT author_lname, COUNT(*) FROM books GROUP BY author_lname;

### Examples 1
SELECT title, author_fname, author_lname FROM books;
SELECT title, author_fname, author_lname FROM books GROUP BY author_lname;
SELECT title, author_fname, author_lname,
COUNT(*) FROM books GROUP BY author_lname, author_fname;

### Examples 2
SELECT released_year FROM books;
SELECT released_year, COUNT(*) FROM books GROUP BY released_year;
SELECT CONCAT('In ', released_year,' ', COUNT(*), ' book(s) released')
AS Books_released FROM books 
GROUP BY released_year;

# Min and Max Basics
    # Find the minimum released_year
SELECT Min(released_year) FROM books;
SELECT Min(pages) FROM books;

SELECT Max(pages) FROM books;
SELECT Max(released_year) FROM books;

    # What if I want the title of the longest book?
# Wrong way
SELECT Max(pages), title FROM books; # This does not give the right answarer

# The wright way
# SUBQUERIES - A Problem with Min and Max 
SELECT * FROM books WHERE pages = (SELECT Max(pages) FROM books);
SELECT * FROM books WHERE pages = (SELECT Min(pages) FROM books);
SELECT title, pages FROM books WHERE pages = (SELECT Max(pages) FROM books);
SELECT title, pages FROM books WHERE pages = (SELECT Min(pages) FROM books);

# This way does not take much time as the other way
SELECT * FROM books ORDER BY pages ASC LIMIT 1;
SELECT title, pages FROM books ORDER BY pages ASC LIMIT 1;
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

# Using Min and Max with GROUP BY
SELECT Min(released_year) from books;
    ### Minimum released_year for each author 
SELECT author_fname, author_lname, Min(released_year)
FROM books
GROUP BY author_lname, author_fname;

    ### Find the longest page count for each author
SELECT author_fname,author_lname, Max(pages) FROM books GROUP BY author_lname, author_fname;

SELECT 
    CONCAT(author_fname, ' ', author_lname) AS author, 
    MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname, author_fname;

# The SUM Functions
SELECT SUM(pages) FROM books;


# The AVG Functions
SELECT AVG(released_year) FROM books;

SELECT AVG(pages) FROM books;

# The Function AVG with GROUP BY
    ## Calculate the average stock quantity for books released in the same year
SELECT * FROM books GROUP BY released_year;
SELECT title, released_year, AVG(stock_quantity) FROM books GROUP BY released_year;
SELECT author_fname, author_lname, AVG(pages) FROM books GROUP BY author_lname, author_fname;

###### Aggregate Functions Challanges ############
    # 1. PRint the number of books in the database
SELECT COUNT(title) AS Total_books FROM books;
SELECT COUNT(*) FROM books; # Colt solution
    # 2.  How many books were released_year in each year
SELECT released_year, COUNT(title) AS 'Nº book(s)' FROM books GROUP BY released_year;
SELECT COUNT(*) FROM books GROUP BY released_year;# Colt solution
    # 3. Print out the total number of books in stock
SELECT SUM(stock_quantity) FROM books;
    # 4. Find the average released_year for each author
SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY author_lname, author_fname;
    # 5. Find the full name of the author who wrote the longest book
        ### First way!
SELECT title, CONCAT(author_fname,' ', author_lname) AS 'Full Name', pages
FROM books ORDER BY pages DESC LIMIT 1;
        ### Second way!
SELECT title, CONCAT(author_fname,' ', author_lname) AS 'Full Name', pages
FROM books WHERE pages = (SELECT Max(pages) FROM books);
    # 6. Make it happen
SELECT released_year AS year, COUNT(title) AS '# books', AVG(pages) 
AS 'avg pages' FROM books GROUP BY released_year;












