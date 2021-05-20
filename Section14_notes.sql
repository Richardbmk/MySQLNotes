##### Sección 14: Instagram Database Clone ######
### Cloning Instagram's DB: Users Schema

SHOW DATABASES;
CREATE DATABASE instagram_db;
USE instagram_db;

create TABLE users(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users(username) VALUES
('RichardTheCat'),
('TheMan'),
('JuanGenerator');

SHOW TABLES;
SELECT * FROM users;

# Cloning Instagram's DB: Photos Schema

CREATE TABLE photos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

SHOW TABLES;
DESC photos;

INSERT INTO photos (image_url, user_id) VALUES 
('/SDFI12839', 1),
('/SDFSsdf3239', 2),
('/SDFIse2356739', 2);

SELECT * FROM photos;

SELECT * FROM photos
JOIN users 
    ON photos.user_id = users.id;

SELECT image_url, username FROM photos
JOIN users 
    ON photos.user_id = users.id;

SELECT photos.image_url, users.username FROM photos
JOIN users 
    ON photos.user_id = users.id;

###  Cloning Instagram's DB: Comments Schema

CREATE TABLE comments (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(500) NOT NULL,
    user_id INTEGER NOT NULL,
    photo_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

SHOW TABLES;
DESC comments;

INSERT INTO comments(comment_text, user_id, photo_id) VALUES
('wEEPAA', 1, 2),
('lOVE THIS', 3, 2),
('nOT gOOGD', 2, 1);

#### Cloning Instagram's DB: Likes Schema
### [PRIMARY KEY(user_id, photo_id)] a unic user only can give a like an a unic photo 

CREATE TABLE likes (
    user_id INTEGER,
    photo_id INTEGER,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(user_id, photo_id)
);

INSERT INTO likes(user_id, photo_id) VALUES
(1,1),
(2,1),
(1,2),
(1,3),
(3,3);

--- Wont work becouse the primary key constraint
INSERT INTO likes(user_id, photo_id) VALUES
(1,1);


### Cloning Instagram's DB: Followers Schema
CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (follower_id) REFERENCES users(id),
    FOREIGN KEY (followee_id) REFERENCES users(id),
    PRIMARY KEY (follower_id, followee_id)
);

INSERT INTO follows(follower_id, followee_id) VALUES 
(1,2),
(1,3),
(3,1),
(2,3);

--- It will not work couse of the constraint
INSERT INTO follows(follower_id, followee_id) VALUES 
(1,2);

### Cloning Instagram's DB: Hashtags Part 2
CREATE TABLE tags(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE photo_tags (
    photo_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY (photo_id) REFERENCES photos(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    PRIMARY KEY(photo_id, tag_id)
);

INSERT INTO tags(tag_name) VALUES
('sun'),
('honor'),
('value');

SELECT * FROM tags;

INSERT INTO photo_tags(photo_id, tag_id) VALUES
(1,1),
(1,2),
(2,3),
(3,2);

SELECT * FROM photo_tags;
