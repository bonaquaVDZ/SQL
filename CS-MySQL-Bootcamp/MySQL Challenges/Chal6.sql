-- Print the number of books in the database
SELECT COUNT(*) FROM books;
SELECT COUNT(title) FROM books;
SELECT COUNT(title) AS "The number of books" FROM books;
SELECT CONCAT("The total amount of books is ", COUNT(title)) AS "COUNT" FROM books;

-- Print out how many books were released in each year
SELECT released_year, COUNT(title)
FROM books
GROUP BY released_year;

SELECT CONCAT(COUNT(title), " were released in ", released_year) AS "Amount of books"
FROM books
GROUP BY released_year;

-- Print out the total number of books in stock
SELECT SUM(stock_quantity) AS "Total amount of books in Stock: "
FROM books;

-- Find the average released_year for each author
SELECT author_fname, author_lname, AVG(released_year)
FROM books
GROUP BY author_lname, author_fname;

SELECT author_fname AS First_name, author_lname AS Last_name, AVG(released_year)
FROM books
GROUP BY author_lname, author_fname
ORDER BY AVG(released_year);

-- Find the full name of the author who wrote the longest book
SELECT CONCAT_WS(" ",author_fname, author_lname) AS full_name, MAX(pages)
FROM books
GROUP BY author_lname, author_fname;

SELECT CONCAT_WS(" ",author_fname, author_lname) AS full_name, MAX(pages)
FROM books
GROUP BY author_lname, author_fname
ORDER BY MAX(pages) DESC LIMIT 1;

SELECT CONCAT_WS(" ",author_fname, author_lname) AS full_name, pages
FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

-- Last Challenge
SELECT released_year AS year, COUNT(title) AS "# books", AVG(pages) AS "avg pages"
FROM books
GROUP BY released_year
ORDER BY released_year;

SELECT released_year AS year, COUNT(*) AS "# of books", AVG(pages) AS "avg pages"
FROM books
GROUP BY released_year
ORDER BY released_year;