-- Select All Story Collections (titles that contain "stories")
SELECT title FROM books WHERE title LIKE "%stories%";

-- Find the longest book (Print Out the Title and Page Count)
SELECT title, pages FROM books;
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1;

-- Print a summary containing the title and year, for the 3 most recent books.
SELECT 
	CONCAT(title, "-", released_year) AS summary 
FROM books 
ORDER BY released_year DESC 
LIMIT 0,3;

-- Find all books with an author_lname that contains a space(" ")
SELECT title, author_lname 
FROM books 
WHERE author_lname LIKE "% %";

-- Find The 3 Books With The Lowest Stock (Select title, year and stock)
SELECT title, released_year, stock_quantity 
FROM books 
ORDER BY stock_quantity ASC 
LIMIT 3;

-- Print Title and author_lname, sorted first by author_lname and then by title
SELECT title, author_lname 
FROM books 
ORDER BY author_lname, title; -- 2,1

/* Sorted Alphabetically By Last Name
Concatenate + UPPER cases */
SELECT 
	UPPER(CONCAT("MY FAVOURITE AUTHOR IS ", author_fname, " ", author_lname)) AS yell 
FROM books 
ORDER BY author_lname ASC; 