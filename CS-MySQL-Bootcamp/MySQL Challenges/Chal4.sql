/* Reverse and Uppercase the following sentence
"Why does my cat look at me with such hatred?"*/

SELECT REVERSE(UPPER("Why does my cat look at me with such hatred?"));

-- Replace spaces in titles with '->'
SELECT REPLACE(title, ' ', '->') AS title
FROM books;

-- Print out two columns with default lname and thier palindrome 
SELECT author_lname AS forwards, REVERSE(author_lname) AS backwards FROM books;

-- Print Out Full Name in Caps
SELECT CONCAT(UPPER(author_fname), " ", UPPER(author_lname)) AS "full name in caps"
FROM books;

-- OR
SELECT UPPER(CONCAT(author_fname, " ", author_lname)) AS "full name in caps"
FROM books;

-- Print Out title + "was released in" + released_year
SELECT CONCAT(title, " was released in ", released_year) AS blurb
FROM books;

-- Print book titles and the length of each title
SELECT title, CHAR_LENGTH(title) AS "character count"
FROM books;

/* Short title column where shortened title with "..."
Author column where fname and lname concatenated with ","
Quantity column where count + "in stock" */

SELECT
CONCAT(SUBSTRING(title, 1, 10), "...") AS "short title",
CONCAT_WS(',', author_lname, author_fname) AS author,
CONCAT(stock_quantity, " in stock.") AS quantity
FROM books;

-- After Code Beautifier
SELECT 
  CONCAT(
    SUBSTRING(title, 1, 10), 
    "..."
  ) AS "short title", 
  CONCAT_WS(',', author_lname, author_fname) AS author, 
  CONCAT(stock_quantity, " in stock.") AS quantity 
FROM 
  books;