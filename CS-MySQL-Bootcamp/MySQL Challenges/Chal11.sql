/* Database Triggers - SQL statements that are automatically run when a specific table is changed */

-- Syntax
CREATE TRIGGER trigger_name 
    trigger_time trigger_event ON table_name FOR EACH ROW
    BEGIN
    ...
    END;

-- First Part
CREATE TABLE users (
    username VARCHAR(100), 
    age INT
);

INSERT INTO users (username, age)
VALUES ("bobby", 23);


INSERT INTO users (username, age)
VALUES ("Julia", 16);

-- Second Part
-- Simple Validation
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


-- Preventing Self-follows with Triggers
-- Example
DELIMITER $$

CREATE TRIGGER trigger_name
     trigger_time trigger_event ON table_name FOR EACH ROW
     BEGIN
     END;
$$

DELIMITER ;


-- Real Code
-- We will use instagram data
-- Table: follows
DELIMITER $$

CREATE TRIGGER prevent_self_follows
     BEFORE INSERT ON follows FOR EACH ROW
     BEGIN
          IF NEW.follower_id = NEW.followee_id
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot follow yourself, silly';
          END IF;
     END;
$$

DELIMITER ;

-- My Test
INSERT INTO follows (follower_id, followee_id)
VALUES (4,4);


-- Creating Logger Triggers
-- Syntax 1
DELIMITER $$

CREATE TRIGGER create_unfollow
    AFTER DELETE ON follows FOR EACH ROW 
BEGIN
    INSERT INTO unfollows
    SET follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
END$$

DELIMITER ;


-- Syntax 2
DELIMITER $$

CREATE TRIGGER create_unfollow
    AFTER DELETE ON follows FOR EACH ROW 
BEGIN
    INSERT INTO unfollows (follower_id, followee_id)
    VALUES (OLD.follower_id, OLD.followee_id)
END$$

DELIMITER ;


-- Check what to delete.
SELECT * FROM follows LIMIT 5;

-- Deleting from Follows
DELETE FROM follows WHERE follower_id=2 AND followee_id=1;

-- Check deleting rows in unfollows table
SELECT * FROM unfollows;

-- Delete all followers with id 4
DELETE FROM follows WHERE follower_id=4;

-- Check removing rows and ids.
SELECT * FROM unfollows;



-- Creating unfollows table by example of follows table
CREATE TABLE unfollows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

-- Managing Triggers
-- Listing triggers
SHOW triggers;

-- Removing triggers
DROP TRIGGER triger_name;

-- Attention
-- TRIGGERS CAN MAKE DEBUGGING HARD!