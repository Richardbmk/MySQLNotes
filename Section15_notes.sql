##### Sección 15: Sección 15: Working With Lots Of Instagram
Data ######

##### Loading The JUMBO dataset
source myslq_course/ig-clone-data.sql;
SHOW TABLES;
SELECT COUNT(*) FROM likes;

## 255. Instagram Clone Challenge 1
DESC comments;
DESC follows;
DESC likes;
DESC photo_tags;
DESC photos;
DESC tags;
DESC users;

SELECT * FROM users
ORDER BY created_at
LIMIT 5;

### 257. Instagram Clone Challenge 2
SELECT id, username, DATE_FORMAT(created_at, '%W')  FROM users;
SELECT id, username, DATE_FORMAT(created_at, '%w') AS 'Day of the week' FROM users;


SELECT COUNT(*)  AS 'Day of the week' FROM users;

SELECT COUNT(*) AS Monday FROM users WHERE DATE_FORMAT(created_at, '%w') LIKE 0;
SELECT COUNT(*) AS Tuesday FROM users WHERE DATE_FORMAT(created_at, '%w') LIKE 1;
SELECT COUNT(*) AS Wendnesday FROM users WHERE DATE_FORMAT(created_at, '%w') LIKE 2;
SELECT COUNT(*) AS Thursday FROM users WHERE DATE_FORMAT(created_at, '%w') LIKE 3;
SELECT COUNT(*) AS Friday FROM users WHERE DATE_FORMAT(created_at, '%w') LIKE 4;
SELECT COUNT(*) AS Saturday FROM users WHERE DATE_FORMAT(created_at, '%w') LIKE 5;
SELECT COUNT(*) AS Sunday FROM users WHERE DATE_FORMAT(created_at, '%w') LIKE 6;

SELECT 
      DATE_FORMAT(created_at, '%w') AS day,
      COUNT(*) AS result
FROM users
GROUP BY day;

SELECT 
      DATE_FORMAT(created_at, '%W') AS day,
      COUNT(*) AS result
FROM users
GROUP BY day
ORDER BY result DESC
LIMIT 2;

SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;

## Instagram Clone Challenge 3

SELECT * FROM photos;
SELECT * FROM users;

SELECT username, image_url FROM photos
RIGHT JOIN users 
    ON photos.user_id = users.id
ORDER BY image_url;

SELECT username,
       IFNULL(image_url, 'Never posted') AS status
FROM photos
RIGHT JOIN users 
    ON photos.user_id = users.id
ORDER BY image_url;

SELECT username, image_url FROM photos
RIGHT JOIN users 
    ON photos.user_id = users.id
WHERE image_url IS NULL;

SELECT username
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;

## Instagram Clone Challenge 4
SELECT * FROM likes;
SELECT * FROM photos;

SELECT photos.id,
       photos.image_url,
       COUNT(*) AS total
FROM photos
INNER JOIN likes
        ON likes.photo_id = photos.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

SELECT photos.id,
       photos.image_url,
       username,
       COUNT(*) AS total
FROM photos
INNER JOIN likes
        ON likes.photo_id = photos.id
INNER JOIN users
        ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;

### Instagram Clone Challenge 5
--- WRONG!!!
SELECT users.id,
       username,
       comment_text,
       COUNT(*) AS TotalComments
       FROM users
INNER JOIN comments 
        ON users.id = comments.user_id
GROUP BY username
ORDER BY TotalComments;

total number of photos / total number of users
SELECT COUNT(*) FROM photos;
SELECT COUNT(*) FROM users;
SELECT 1/5;

SELECT (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg;

### Instagram Clone Challenge 6
SELECT * FROM tags;
SELECT * FROM photo_tags;
DESC tags;
DESC photo_tags;

SELECT tag_name,
        COUNT(*) AS NumUsers
FROM tags
INNER JOIN photo_tags
        ON tags.id = photo_tags.tag_id
GROUP BY tag_name
ORDER BY NumUsers DESC
LIMIT 5;

SELECT tags.tag_name, 
       Count(*) AS total 
FROM   photo_tags 
       JOIN tags 
         ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5;

### Instagram Clone Challenge 7
SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos);



