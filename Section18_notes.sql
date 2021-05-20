## 315. Introduction to Database Triggers###

# The Syntax
CREATE TRIGGER trigger_name
    trigger_name trigger_event ON table_name FOR EACH ROW
    BEGIN
    ...
    END;

# Writing Our First Trigger Part 1

CREATE DATABASE trigger_demo;
USE trigger_demo;

CREATE TABLE users (
    username VARCHAR(100),
    age INT
);

INSERT INTO users(username, age) VALUES("Richard",25);
INSERT INTO users(username, age) VALUES("Mike",15);
SELECT * FROM users;

DELIMITER $$

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ;

INSERT INTO users(username, age) VALUES("Dany",35);
INSERT INTO users(username, age) VALUES("Sam",17);


## 318. Preventing Instagram Self-Follows With Triggers

DELIMITER $$

CREATE TRIGGER example_cannot_follow_self
     BEFORE INSERT ON follows FOR EACH ROW
     BEGIN
        IF NEW.follower_id = NEW.following_id
        THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Cannot follow yourself'
        END IF;
     END;
$$

DELIMITER ;


## 319. Creating Logger Triggers
DELIMITER $$

CREATE TRIGGER capture_unfollow
    AFTER DELETE ON follows FOR EACH ROW
    BEGIN
        INSERT INTO unfollows(follower_id, followee_id)
        VALUES(OLD.follower_id, OLD.followee_id);
    END;
$$

DELIMITER $$
 #Another way to do the same

CREATE TRIGGER create_unfollow
    AFTER DELETE ON follows FOR EACH ROW 
BEGIN
    INSERT INTO unfollows
    SET follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
END$$

DELIMITER ;

# 320. Managing Triggers And A Warning
SHOW TRIGGERS;
DROP TRIGGER must_be_adult;


