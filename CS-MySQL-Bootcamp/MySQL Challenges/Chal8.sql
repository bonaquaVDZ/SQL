-- Ex 1
SELECT 15 > 14 && 99 - 5 <= 94; -- True
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; -- True
SELECT 1 IN (5,3); -- False;

-- Select all books written before 1989 (non inclusive)
SELECT title, released_year FROM books
WHERE released_year < 1989;

-- Select all books written by Eggers Or Chabon
SELECT title, author_lname FROM books
WHERE author_lname IN ("Eggers", "Chabon");

SELECT title, author_lname FROM books
WHERE author_lname = "Eggers" OR author_lname = "Chabon";

-- Select all books written by Lahiri, published after 2000
SELECT title, author_lname, released_year FROM books
WHERE author_lname = 'Lahiri' AND
released_year >= 2000;

-- Select all books with page counts between 100 and 200
SELECT title, pages FROM books
WHERE pages BETWEEN 100 AND 200;

SELECT title, pages FROM books
WHERE pages >=100 AND pages <= 200;

-- Select all books where author_lname starts with a "C" or an 'S'
SELECT title, author_lname FROM books
WHERE author_lname LIKE "C%" OR
author_lname LIKE "S%";

SELECT title, author_lname FROM books
WHERE SUBSTR(author_lname,1,1) = "C" OR
SUBSTR(author_lname,1,1) = "S";

SELECT title, author_lname FROM books
WHERE SUBSTR(author_lname,1,1) IN ("C", "S");

/* Case statements
If title contains "stories" -> Short Stories
Just "Kids" and "A Heartbreaking Work" -> Memoir
Everything else -> Novel */

SELECT title, author_lname,
CASE
WHEN title LIKE "%stories%" THEN "Short Stories"
WHEN title LIKE "%kids%" OR title LIKE "%a heartbreaking work%" THEN "Memoir"
ELSE "Novel"
END AS TYPE
FROM books;

SELECT title, author_lname,
CASE
WHEN title LIKE "%stories%" THEN "Short Stories"
WHEN title = "Just Kids" OR title = "A Heartbreaking Work of Staggering Genius" THEN "Memoir"
ELSE "Novel"
END AS TYPE
FROM books;

/* 
How many books each author has written in a COUNT column
+-----------------------------------------------------+----------------+---------+
| title                                               | author_lname   | COUNT   |
+-----------------------------------------------------+----------------+---------+
| What We Talk About When We Talk About Love: Stories | Carver         | 2 books |
| The Amazing Adventures of Kavalier & Clay           | Chabon         | 1 book  |
| White Noise                                         | DeLillo        | 1 book  |
| A Hologram for the King: A Novel                    | Eggers         | 3 books |
| Oblivion: Stories                                   | Foster Wallace | 2 books |
| Norse Mythology                                     | Gaiman         | 3 books |
| 10% Happier                                         | Harris         | 1 book  |
| fake_book                                           | Harris         | 1 book  |
| The Namesake                                        | Lahiri         | 2 books |
| Lincoln In The Bardo                                | Saunders       | 1 book  |
| Just Kids                                           | Smith          | 1 book  |
| Cannery Row                                         | Steinbeck      | 1 book  |
+-----------------------------------------------------+----------------+---------+
Our goal is table above
*/

SELECT author_fname, author_lname, 
CASE
WHEN COUNT(*) = 1 THEN '1 book'
ELSE CONCAT(COUNT(*), ' books')
END AS COUNT
FROM books
GROUP BY author_lname, author_fname
ORDER BY COUNT(*);
