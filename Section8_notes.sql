# Using DISTINCT()
SELECT DISTINCT author_lname FROM books; # Usefull if we dont want duplicate data

# We have to diferent author with the same last name, what we could do?
SELECT DISTINCT CONCAT(author_fname,' ',author_lname) FROM books;

SELECT DISTINCT author_fname, author_lname FROM books;

# Sorting Data with ORDER BY
SELECT author_lname FROM books;
SELECT author_lname FROM books ORDER BY author_lname;

SELECT title FROM books;
SELECT title FROM books ORDER BY title; # Ascending by default 

# ORDER BY with DESC
SELECT author_lname FROM books ORDER BY author_lname DESC;
SELECT author_lname FROM books ORDER BY author_lname ASC; # tHERE IS NO NIT TO DO THIS
SELECT released_year FROM books ORDER BY released_year;

# More exemple
SELECT title, pages, released_year FROM books ORDER BY released_year;
SELECT title, pages FROM books ORDER BY released_year;

SELECT title, author_fname, author_lname FROM books ORDER BY 2; # The 2 is a shortcut,
# ... order the second element in the list (order by author_fname).
SELECT title, author_fname, author_lname FROM books ORDER BY 1; # (order by title
SELECT title, author_fname, author_lname FROM books ORDER BY 3; # order by author_lname

SELECT title, author_lname FROM books ORDER BY 1 DESC;

# is possible to order with to elements
SELECT author_fname, author_lname FROM books
ORDER BY author_lname, author_fname; # Ather sort by author_lname then sort by author_fname

# using LIMIT
SELECT title FROM books;
SELECT title FROM books LIMIT 3;
SELECT title FROM books LIMIT 5;
SELECT * FROM books LIMIT 3;

# COmbo ORDER BY, LIMIT, DESC
SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 5;

# A way to specify the starting point and the ending point 
SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 0,5;

# DOcumentation say to retrieve all rows...
SELECT * FROM books LIMIT 5,18446744073709551615; # IT just have to be a big number!!

# Better searching with LIKE. PART1
    #  WHERE author_fname LIKE '%da%';
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%';
    #  WHERE author_fname LIKE 'da%';
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%';    

SELECT title FROM books WHERE title LIKE '%the%';
# Better searching with LIKE. PART2
    # WHERE stock_quantity LIKE '____'; # FOUR UNDERSCOR (_ _ _ _)

SELECT title, stock_quantity FROM books;


# Exemple with phone nomber
(235)234-0987 LIKE '(___)___-___';

# What about if I'm loking for % o _ 
WHERE title LIKE '%\%%'
WHERE title LIKE '%\_%'

SELECT title FROM books;
SELECT title FROM books WHERE title LIKE '%\_%';
SELECT title FROM books WHERE title LIKE '%\%%';

########## EXERCISES ################
# Exercises 1:
SELECT title FROM books WHERE title LIKE '%stories%';

# Exercises 2:
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

# Exercises 3:
SELECT CONCAT(title, ' - ', released_year)
AS summary FROM books ORDER BY released_year DESC LIMIT 3;

# Exercises 4:
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

# Exercises 5:
SELECT title, released_year, stock_quantity 
FROM books ORDER BY stock_quantity LIMIT 3;

# Exercises 5:
SELECT title, author_lname FROM books ORDER BY author_lname, title;

# Exercises 6:
SELECT UPPER(CONCAT('My favorite actor is ',
author_fname, ' ', author_lname, '!'))
AS yell FROM books
ORDER BY author_lname;
    





