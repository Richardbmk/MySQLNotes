###### Sección 16: Section 16 - Introducing Node #####

CREATE TABLE users (
    email VARCHAR(255) PRIMARY KEY,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users (email) VALUES 
('casandra@yahoo.com'), ('frambryt@gmail.com');

DELETE FROM users;

### Quick Exercises:

#Challange 1

SELECT DATE_FORMAT(created_at, '%M %D %Y') AS earliest_date
FROM users ORDER BY created_at LIMIT 1;
    # Colt solution
SELECT 
    DATE_FORMAT(MIN(created_at), "%M %D %Y") as earliest_date 
FROM users;

#Challange 2
SELECT * FROM users ORDER BY created_at LIMIT 1;
    # Colt Solutoin
SELECT * 
FROM   users 
WHERE  created_at = (SELECT Min(created_at) 
                     FROM   users); 

#Challange 3
SELECT DATE_FORMAT(created_at, '%M') AS month,
       COUNT(*) AS count
FROM users GROUP BY month
ORDER BY count DESC;

 # Colt Solutoin
SELECT Monthname(created_at) AS month, 
       Count(*)              AS count 
FROM   users 
GROUP  BY month 
ORDER  BY count DESC; 



#Challange 4
SELECT COUNT(*)AS yahoo_users FROM users WHERE email LIKE '%yahoo.com';

#Challange 5
SELECT CASE 
            WHEN email LIKE '%@gmail.com' THEN 'gmail'
            WHEN email LIKE '%@yahoo.com' THEN 'yahoo'
            WHEN email LIKE '%@hotmail.com' THEN 'hotmail'
            ELSE 'other'
        END AS provider,
        COUNT(*) AS total_users
FROM users
GROUP  BY provider
ORDER BY total_users DESC;


