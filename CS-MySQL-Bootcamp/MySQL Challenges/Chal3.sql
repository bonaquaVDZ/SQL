-- Create a new database shirts_db
-- Create a new table shirts

/* Columns in a Table: shirt_id, article, color, shirt_size, last_worn
Shirt_id - Can not be Null, Primary Key
	 article, color, shirt_size - TEXT,
	 last_worn INT 

Adding Specific Data
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15) */

CREATE DATABASE shirts_db;

CREATE TABLE shirts (
    shirt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    article VARCHAR(100),
    color VARCHAR(100),
    shirt_size CHAR(1),
    last_worn INT
);

INSERT INTO shirts(article, color, shirt_size, last_worn) VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

-- Get All That Data In There With A Single Line
SELECT 
    *
FROM
    shirts;

-- Adding new Shirt : Purple polo shirt, size M last worn 50 days ago
INSERT INTO shirts(article, color, shirt_size,last_worn)
VALUES ("polo shirt", "purple", "M", 50);

-- SELECT all shirts Only Print Out Article and Color
SELECT 
    article, color
FROM
    shirts;

-- SELECT all medium shirt Print Out Everything But shirt_id
SELECT 
    shirt_id
FROM
    shirts
WHERE
    shirt_size = 'M';

-- Update all polo shirts Change Their Size To L
UPDATE shirts 
SET 
    shirt_size = 'L'
WHERE
    article = 'polo shirt';

-- Update the shirt last worn 15 days ago Change last_worn to 0
SELECT 
    *
FROM
    shirts
WHERE
    last_worn = 15;
UPDATE shirts 
SET 
    last_worn = 0
WHERE
    last_worn = 15;

-- Update all white shirts Change size to "XS" and color to "off white"
SELECT * FROM shirts WHERE article="t-shirt" AND color="white";

UPDATE shirts SET shirt_size="X", color="off white" 
WHERE article="t-shirt" AND color="white";

-- Delete all old shirts Last worn 200 days ago 
DELETE FROM shirts WHERE last_worn=200;

-- Delete all tank tops
DELETE FROM shirts WHERE article="tank top";

-- Delete all shirts
DELETE FROM shirts;

-- DROP the entire shirts table
DROP TABLE shirts;
