-- Inserting Data: 
-- Creating a new Database
CREATE DATABASE tv_review_app;

-- Creating Reviewers Table
CREATE TABLE reviewers (
id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(25),
last_name VARCHAR(25)
);

-- Creating Series Table
CREATE TABLE series (
id INT AUTO_INCREMENT PRIMARY KEY, 
title VARCHAR(100),
released_year YEAR(4),
genre VARCHAR(100)
);

-- Crating Review Table
CREATE TABLE reviews (
id INT AUTO_INCREMENT PRIMARY KEY,
rating DECIMAL(2,1),
series_id INT,
reviewer_id INT,
FOREIGN KEY(series_id) REFERENCES series(id),
FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
);


INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');

INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');

INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);



/* Challenge 1:
+----------------------+--------+
| title                | rating |
+----------------------+--------+
| Archer               |    8.0 |
| Archer               |    7.5 |
| Archer               |    8.5 |
| Archer               |    7.7 |
| Archer               |    8.9 |
| Arrested Development |    8.1 |
| Arrested Development |    6.0 |
| Arrested Development |    8.0 |
| Arrested Development |    8.4 |
| Arrested Development |    9.9 |
| Bob's Burgers        |    7.0 |
| Bob's Burgers        |    7.5 |
| Bob's Burgers        |    8.0 |
| Bob's Burgers        |    7.1 |
| Bob's Burgers        |    8.0 |
+----------------------+--------+
*/

-- #1.1:
SELECT title, rating FROM series
INNER JOIN reviews
ON series.id = reviews.series_id
ORDER BY title LIMIT 15;


/* Challenge 2:
+----------------------+------------+
| title                | avg_rating |
+----------------------+------------+
| General Hospital     |    5.38000 |
| Bob's Burgers        |    7.52000 |
| Seinfeld             |    7.60000 |
| Bojack Horseman      |    7.94000 |
| Arrested Development |    8.08000 |
| Curb Your Enthusiasm |    8.12000 |
| Archer               |    8.12000 |
| Freaks and Geeks     |    8.60000 |
| Stranger Things      |    8.76667 |
| Breaking Bad         |    9.36000 |
| Fargo                |    9.40000 |
| Halt and Catch Fire  |    9.90000 |
+----------------------+------------+
*/

-- #2.1:
SELECT title, ROUND(AVG(rating),2) AS avg_rating 
FROM series
INNER JOIN reviews
ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY AVG(rating);


/* Challenge 3
+------------+-----------+--------+
| first_name | last_name | rating |
+------------+-----------+--------+
| Thomas     | Stoneman  |    8.0 |
| Thomas     | Stoneman  |    8.1 |
| Thomas     | Stoneman  |    7.0 |
| Thomas     | Stoneman  |    7.5 |
| Thomas     | Stoneman  |    9.5 |
| Wyatt      | Skaggs    |    7.5 |
| Wyatt      | Skaggs    |    7.6 |
| Wyatt      | Skaggs    |    9.3 |
| Wyatt      | Skaggs    |    6.5 |
| Wyatt      | Skaggs    |    8.4 |
| Wyatt      | Skaggs    |    9.1 |
| Wyatt      | Skaggs    |    7.8 |
| Wyatt      | Skaggs    |    5.5 |
| Wyatt      | Skaggs    |    8.5 |
| Kimbra     | Masters   |    8.5 |
| Kimbra     | Masters   |    8.0 |
| Kimbra     | Masters   |    7.1 |
| Kimbra     | Masters   |    7.8 |
| Kimbra     | Masters   |    9.0 |
| Kimbra     | Masters   |    7.8 |
+------------+-----------+--------+
*/

-- #3.1:
SELECT first_name, last_name, rating FROM reviewers
INNER JOIN reviews
ON reviewers.id = reviews.reviewer_id
LIMIT 20;


/* Challenge 4
+-----------------------+
| unreviewed_series     |
+-----------------------+
| Malcolm In The Middle |
| Pushing Daisies       |
+-----------------------+
*/

-- #4.1:
SELECT title AS unreviewed_series
FROM series
LEFT JOIN reviews
ON series.id = reviews.series_id
WHERE rating IS NULL;

-- #4.2
SELECT title AS unreviewed_series
FROM series
LEFT JOIN reviews
ON series.id = reviews.series_id
WHERE reviews.series_id IS NULL;


/* Challenge 5
+-----------+------------+
| genre     | avg_rating |
+-----------+------------+
| Animation |    7.86000 |
| Comedy    |    8.16250 |
| Drama     |    8.04375 |
+-----------+------------+
*/

-- #5.1:
SELECT genre, ROUND(AVG(rating),2) AS avg_rating FROM series
INNER JOIN reviews
ON series.id = reviews.series_id
GROUP BY genre;

/* Challenge 6
+------------+-----------+-------+-----+-----+---------+----------+
| first_name | last_name | COUNT | MIN | MAX | AVG     | STATUS   |
+------------+-----------+-------+-----+-----+---------+----------+
| Thomas     | Stoneman  |     5 | 7.0 | 9.5 | 8.02000 | ACTIVE   |
| Wyatt      | Skaggs    |     9 | 5.5 | 9.3 | 7.80000 | ACTIVE   |
| Kimbra     | Masters   |     9 | 6.8 | 9.0 | 7.98889 | ACTIVE   |
| Domingo    | Cortes    |    10 | 5.8 | 9.1 | 7.83000 | ACTIVE   |
| Colt       | Steele    |    10 | 4.5 | 9.9 | 8.77000 | ACTIVE   |
| Pinkie     | Petit     |     4 | 4.3 | 8.8 | 7.25000 | ACTIVE   |
| Marlon     | Crafford  |     0 | 0.0 | 0.0 | 0.00000 | INACTIVE |
+------------+-----------+-------+-----+-----+---------+----------+
*/

-- #6.1:
-- With Case statement
SELECT 
first_name, 
last_name, 
COUNT(rating) AS COUNT, 
IFNULL(MIN(rating), 0) AS MIN, 
IFNULL(MAX(rating),0) AS MAX,
IFNULL(AVG(rating), 0) AS AVG,
CASE
WHEN MIN(rating) IS NULL THEN "INACTIVE"
ELSE "ACTIVE"
END AS "STATUS"
FROM reviewers
LEFT JOIN reviews
ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;

-- #6.2
-- With If Condition
SELECT 
first_name, 
last_name, 
COUNT(rating) AS COUNT, 
IFNULL(MIN(rating), 0) AS MIN, 
IFNULL(MAX(rating),0) AS MAX,
ROUND(IFNULL(AVG(rating), 0),2) AS AVG,
IF(COUNT(rating) >= 1, "ACTIVE", "INACTIVE") AS STATUS
FROM reviewers
LEFT JOIN reviews
ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;

-- #6.3
-- With POWER USER
SELECT first_name, 
last_name, 
COUNT(rating) AS COUNT, 
IFNULL(Min(rating), 0) AS MIN, 
IFNULL(Max(rating), 0) AS MAX, 
ROUND(IFNULL(AVG(rating), 0), 2) AS AVG, 
CASE 
WHEN Count(rating) >= 10 THEN 'POWER USER' 
WHEN Count(rating) > 0 THEN 'ACTIVE' 
ELSE 'INACTIVE' 
END AS STATUS 
FROM reviewers 
LEFT JOIN reviews 
ON reviewers.id = reviews.reviewer_id 
GROUP  BY reviewers.id;

/* Challenge 7
+----------------------+--------+-----------------+
| title                | rating | reviewer        |
+----------------------+--------+-----------------+
| Archer               |    8.0 | Thomas Stoneman |
| Archer               |    7.7 | Domingo Cortes  |
| Archer               |    8.5 | Kimbra Masters  |
| Archer               |    7.5 | Wyatt Skaggs    |
| Archer               |    8.9 | Colt Steele     |
| Arrested Development |    8.4 | Pinkie Petit    |
| Arrested Development |    9.9 | Colt Steele     |
| Arrested Development |    8.1 | Thomas Stoneman |
| Arrested Development |    6.0 | Domingo Cortes  |
| Arrested Development |    8.0 | Kimbra Masters  |
| Bob's Burgers        |    7.0 | Thomas Stoneman |
| Bob's Burgers        |    8.0 | Domingo Cortes  |
| Bob's Burgers        |    7.1 | Kimbra Masters  |
| Bob's Burgers        |    7.5 | Pinkie Petit    |
| Bob's Burgers        |    8.0 | Colt Steele     |
+----------------------+--------+-----------------+
*/

-- #7.1:
SELECT title,
rating,
CONCAT(first_name, " ", last_name) AS reviewer
FROM reviewers
INNER JOIN reviews
ON reviewers.id = reviews.reviewer_id
INNER JOIN series
ON series.id = reviews.series_id
ORDER BY title;

-- #7.2
SELECT title,
rating,
CONCAT(first_name, " ", last_name) AS reviewer
FROM reviews
INNER JOIN reviewers
ON reviewers.id = reviews.reviewer_id
INNER JOIN series
ON series.id = reviews.series_id
ORDER BY title LIMIT 15;