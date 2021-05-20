##### Section 12: One Two Many #######
# Working with Foreing Keys

SHOW DATABASES;
SELECT DATABASE();
CREATE DATABASE customers_and_orders;
USE customers_and_orders;
DROP TABLE custumers;
DROP DATABASE custumers_and_orders;
DROP TABLE customers, orders;

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

    ## Wrong way
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customers_id INT 
);

    ## Good way
CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customers_id INT,
    FOREIGN KEY(customers_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customers_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       

INSERT INTO orders (order_date, amount, customers_id)
VALUES('2016/06/10', 53.67, 100);


### CROSS JOIN 
SELECT * FROM customers WHERE last_name='Geore';
SELECT * FROM orders WHERE customers_id = 1;

SELECT id FROM customers WHERE last_name = 'George';

SELECT * FROM order WHERE customers_id = 1;
    (
        SELECT id FROM customers
        WHERE last_name = 'George'
    );
    
SELECT * FROM customers, orders;

--- IMPLICIT INNER JOIN
SELECT * FROM customers, orders 
WHERE customers.id = orders.customers_id;

SELECT first_name, last_name, order_date, amount
FROM customers, orders
    WHERE customers.id = orders.customers_id;
    
--- EXPLICIT INNER JOIN (BETTER TI USE THIS ONE)
SELECT * FROM customers
JOIN orders
    ON customers.id = orders.customers_id;
    
SELECT first_name, last_name, order_date, amount
FROM customers
JOIN orders
    ON customers.id = orders.customers_id;

 # Changing the order 
SELECT first_name, last_name, order_date, amount
FROM orders
JOIN customers
    ON customers.id = orders.customers_id;

SELECT * FROM orders
JOIN customers
    ON customers.id = orders.customers_id;

SELECT * FROM customers
JOIN orders
    ON customers.id = orders.customers_id;

### LEFT JOIN 

SELECT first_name, last_name, order_date, amount
FROM customers
JOIN orders
    ON customers.id = orders.customers_id
ORDER BY order_date;

SELECT first_name, last_name, order_date, amount
FROM customers
JOIN orders
    ON customers.id = orders.customers_id
GROUP BY orders.customers_id;

SELECT 
    first_name,
    last_name,
    SUM(amount) AS total_spent
FROM customers
JOIN orders
    ON customers.id = orders.customers_id
GROUP BY orders.customers_id
ORDER BY total_spent DESC;

--- LEFT JOIN 
# customers in the left and orders in the right. 
SELECT * FROM customers
LEFT JOIN orders
    ON customers.id = orders.customers_id;

SELECT first_name, last_name, order_date, amount
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customers_id;
    
SELECT 
    first_name,
    last_name,
    SUM(amount)
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customers_id
GROUP BY customers.id;

SELECT 
    first_name,
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customers_id
GROUP BY customers.id
ORDER BY total_spent;

--- RIGHT JOIN (Works the same as LEFT JOIN)
SELECT * FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customers_id;
    
SELECT 
    IFNULL(first_name, 'MISSING') AS firt,
    IFNULL(last_name,'USER') AS last,
    order_date,
    amount,
    SUM(amount)
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customers_id
GROUP BY first_name, last_name;

--- ON DELETE CASCADE 

    ## Good way
CREATE TABLE orders2(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customers_id INT,
    FOREIGN KEY(customers_id) 
        REFERENCES customers2(id)
        ON DELETE CASCADE
);

CREATE TABLE customers2(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO customers2 (first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders2 (order_date, amount, customers_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
SELECT * FROM orders2;
SELECT * FROM customers2;

DELETE FROM customers WHERE email = 'george@gmail.com'; # Is not allowed
DELETE FROM customers2 WHERE email = 'george@gmail.com'; #allowed

SELECT * FROM orders2;
SELECT * FROM customers2;

#### CHALLANGE SECTION #####
#### CHALLANGE SECTION #####
SELECT DATABASE();
CREATE DATABASE students_and_papers;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100)
);

CREATE TABLE papers(
    title VARCHAR(100),
    grade INT,
    student_id INT,
    FOREIGN KEY(student_id) REFERENCES students(id)
    ON DELETE CASCADE
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);
-- EXERCISE 1
# Implicit way
SELECT first_name, title, grade
FROM students, papers WHERE students.id = papers.student_id;

# Explicit way (using JOIN)
SELECT first_name, title, grade FROM students
JOIN papers
    ON students.id = papers.student_id;

SELECT first_name, title, grade
FROM students
INNER JOIN papers
    ON students.id = papers.student_id
ORDER BY grade DESC;

SELECT first_name, title, grade
FROM students
RIGHT JOIN papers
    ON students.id = papers.student_id
ORDER BY grade DESC;

SELECT first_name, title, grade FROM students
JOIN papers
    ON students.id = papers.student_id
    ORDER BY grade DESC;

-- PROBLEM 2
SELECT first_name, title, grade FROM students
LEFT JOIN papers
    ON students.id = papers.student_id
    ORDER BY grade DESC;

-- PROBLEM 3
SELECT 
    first_name,
    IFNULL(title,'MISSING') AS title,
    IFNULL(grade, 0) AS grade
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id
    ORDER BY grade DESC;

-- PROBLEM 4
SELECT 
    first_name,
    IFNULL(AVG(grade), 0) AS average
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id
    GROUP BY first_name
    ORDER BY grade DESC;
    
SELECT
    first_name,
    IFNULL(AVG(grade), 0) AS average
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id
GROUP BY students.id
ORDER BY average DESC;

-- PROBLEM 5 
SELECT 
    first_name,
    IFNULL(AVG(grade), 0) AS average,
    CASE
        WHEN Avg(grade) IS NULL THEN 'FAILING'
        WHEN AVG(grade) < 75 THEN 'FAILLING'
        ELSE 'PASSING'
    END AS passing_status
FROM students
LEFT JOIN papers
    ON students.id = papers.student_id
    GROUP  BY students.id 
    ORDER  BY average DESC;
    







