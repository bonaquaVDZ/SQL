-- Define price as less than 1000000
CREATE TABLE inventory (
item_name VARCHAR(255) NOT NULL,
price DECIMAL(8,2),
quantity INT
);

-- Print Out Current Time, Current Date, Current Date and Time
SELECT CURTIME();
SELECT CURDATE();
SELECT NOW();

-- Print Out the Current Day of The Week (Number)
SELECT DAYOFWEEK(NOW());
SELECT DAYOFWEEK(CURDATE());

-- Print Out the Current Day of The Week (Name)
SELECT DAYNAME(NOW());
SELECT DAYNAME(CURDATE());
SELECT DATE_FORMAT(NOW(), '%W');

-- Print out the current day and time using format: mm/dd/yyyy
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');

/* Print out the current day and time using this format:
January 2nd at 3:15 or April 1st at 10:18 */
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');
SELECT DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 3 MONTH), '%M %D at %h:%i') AS "Formated date";
SELECT DATE_FORMAT('2007-04-1 10:18:33', '%M %D at %h:%i') AS "Formated date";

/* Create a tweets table that stores:
Tweet content (TXT), A Username, Time it was created */
CREATE TABLE tweets (
Content TEXT, 
Username VARCHAR(20) NOT NULL,
Created_time TIMESTAMP DEFAULT NOW()
);
