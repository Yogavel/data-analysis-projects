Question 1: Select the top 1000 rows from the books table.  
Make sure you are able to see all of the columns.

Select top 1000 *
from BooksDB.dbo.books;

Question 2: Count the number of titles.  Are there 10,000 titles as promised by the dataset?

SELECT COUNT(*) AS Titles
FROM BooksDB.dbo.books

Question 3: Count the number of books where the `original_publication_year` is earlier than 1800.

SELECT COUNT(*) AS Booksbefore1800
FROM BooksDB.dbo.Books
WHERE ([original_publication_year]) < 1800;

Question 4: Create a query that displays distinct authors from the table.

SELECT DISTINCT authors
FROM BooksDB.dbo.books;

Question 5: Create a query that displays a count of all the books that contain a language code for English.  
This could be represented in the table as \"eng\" or \"en-\".

SELECT COUNT(*) AS EnglishBooks
FROM BooksDB.dbo.books
WHERE language_code = 'eng'
   OR language_code LIKE 'en-%';

   Question 6: Create a query to check how many original titles 
   were written during World War I era (1914-1921).

   Select Count (*) as WWIBooks
   from BooksDB.dbo.books
   WHERE ([original_publication_year]) BETWEEN 1914 AND 1921;

   Question 1: Select the top 1000 table items ordered by the `tag_id`.

Select top 1000 *
from BooksDB.dbo.book_tags
ORDER BY tag_id;

Question 2: Create a query that counts the number of `goodreads_book_id` grouped by the `tag_id`.

SELECT 
tag_id,
COUNT(goodreads_book_id)
FROM BooksDB.dbo.book_tags
GROUP BY tag_id

Question 1: Create a query that displays the top 1000 items in the table in descending order.
Select top 1000 *
From BooksDB.dbo.ratings
ORDER BY rating DESC


SELECT COUNT(DISTINCT user_id) AS LowRatingUsers
FROM BooksDB.dbo.ratings
WHERE rating < 2;

SELECT COUNT(book_id) AS HighratingBooks
FROM BooksDB.dbo.ratings
WHERE rating > 4;


SELECT *
FROM BooksDB.dbo.tags
WHERE tag_name < 'd' AND tag_name >= 'c';