/* Challenge 1
Find the earliest day the user joined
+---------------+
| earliest_date |
+---------------+
| May 2nd 2016  |
+---------------+
*/

-- #1.1:
SELECT 
DATE_FORMAT(created_at,'%M %D %Y') as earliest_date 
FROM users
ORDER BY created_at LIMIT 1;

-- #1.2
SELECT 
DATE_FORMAT(MIN(created_at), '%M %D %Y') as earliest_date
FROM users;

----------------------------------------------------------------

/* Challenge 2
+-----------------------------+---------------------+
| email                       | created_at          |
+-----------------------------+---------------------+
| Friedrich_Kulas@hotmail.com | 2016-05-02 20:28:18 |
+-----------------------------+---------------------+
*/

-- #2.1:
SELECT * FROM users
ORDER BY created_at LIMIT 1;

-- #2.2
-- Subquery method
SELECT * FROM users
WHERE created_at = (SELECT MIN(created_at) FROM users);
----------------------------------------------------------------

/* Challenge 3
Users according to the month they joined.
+-----------+-------+
| month     | count |
+-----------+-------+
| November  |    51 |
| January   |    49 |
| May       |    48 |
| December  |    47 |
| July      |    46 |
| June      |    43 |
| April     |    41 |
| October   |    41 |
| September |    40 |
| March     |    40 |
| August    |    40 |
| February  |    32 |
+-----------+-------+
*/

-- #3.1:
SELECT
DATE_FORMAT(created_at, "%M") AS month,
COUNT(*) AS count
FROM users
GROUP BY month
ORDER BY count DESC;

-- #3.2
SELECT
MONTHNAME(created_at) AS month,
COUNT(*) AS count
FROM users
GROUP BY month
ORDER BY count DESC;

/* Challenge 4
Count Number of Users with Yahoo emails
+-------------+
| yahoo_users |
+-------------+
|         166 |
+-------------+
*/

-- #4.1
SELECT 
email as yahoo_users
FROM users
WHERE email LIKE "%yahoo%";

-- #4.2
SELECT 
COUNT(*) as yahoo_users
FROM users
WHERE email LIKE "%yahoo%";

-- #4.3
SELECT 
COUNT(*) as yahoo_users
FROM users
WHERE email LIKE "%@yahoo.com";


/* Challenge 5
Calculate the Total Number of Users for each Email Host
+----------+-------------+
| provider | total_users |
+----------+-------------+
| gmail    |         190 |
| yahoo    |         166 |
| hotmail  |         159 |
| other    |           3 |
+----------+-------------+
*/

-- #5.1:
SELECT
CASE
WHEN email LIKE "%@gmail.com" THEN "gmail"
WHEN email LIKE "%@yahoo.com" THEN "yahoo"
WHEN email LIKE "%@hotmail.com" THEN "hotmail"
ELSE "other"
END AS provider,
COUNT(*) as total_users
FROM users
GROUP BY provider
ORDER BY total_users;
