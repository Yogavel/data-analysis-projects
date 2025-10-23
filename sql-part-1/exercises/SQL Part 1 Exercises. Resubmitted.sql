
Question 1: Select the top 1000 rows from the books table.  Make sure you are able to see all of the columns.

Select top 1000 *
FROM BooksDB.dbo.books

Question 2: Count the number of titles.  Are there 10,000 titles as promised by the dataset?

SELECT COUNT(*) AS Titles
FROM BooksDB.dbo.books

Question 3: Count the number of books where the `original_publication_year` is earlier than 1800.

SELECT COUNT(*) AS Booksbefore1800
FROM BooksDB.dbo.Books
WHERE ([original_publication_year]) < 1800

Question 4: Create a query that displays distinct authors from the table.

SELECT DISTINCT authors
FROM BooksDB.dbo.books

Question 5: Create a query that displays a count of all the books that contain a language code for English.  This could be represented in the table as \"eng\" or \"en-\".

SELECT COUNT(*) AS EnglishBooks
FROM BooksDB.dbo.books
WHERE language_code = 'eng'
OR language_code LIKE 'en-%'


Question 6: Create a query to check how many original titles were written during World War I era (1914-1921).

Select Count (*) as WWIBooks
from BooksDB.dbo.books
WHERE ([original_publication_year]) BETWEEN 1914 AND 1921

B. BOOK TAGS TABLE

Question 1: Select the top 1000 table items ordered by the `tag_id`.

Select top 1000 *
from BooksDB.dbo.book_tags
ORDER BY tag_id

Question 2: Create a query that counts the number of `goodreads_book_id` grouped by the `tag_id`.

SELECT 
tag_id,
COUNT(goodreads_book_id)
FROM BooksDB.dbo.book_tags
GROUP BY tag_id

Question 3: In the last query, we created a new, unnamed column.  Use `AS` to create an alias to provide a name of your choice to this new column.

SELECT 
tag_id,
COUNT(goodreads_book_id) AS Goodbooks
FROM BooksDB.dbo.book_tags
GROUP BY tag_id


C. RATINGS TABLE

Question 1: Create a query that displays the top 1000 items in the table in descending order.

Select top 1000 *
From BooksDB.dbo.ratings
ORDER BY rating DESC

Question 2: Create a query that returns the total number of users that have given a rating of less than 2.

SELECT COUNT(DISTINCT user_id) AS LowRatingUsers
FROM BooksDB.dbo.ratings
WHERE rating < 2


Question 3: Create a query that returns the sum of books that have a rating of 4 or higher.

SELECT COUNT(book_id) AS HighratingBooks
FROM BooksDB.dbo.ratings
WHERE rating > 4

D. TAGS TABLE

Question 1: Create a query that returns table items where the `tag_name` describes the book as a mystery.

Hint: Use the wildcard to find the word mystery at the beginning, middle, and end of a `tag_name`

Select *
from BooksDB.dbo.tags
where tag_name like '%Mystery%'


Question 2: Run the query below. In your own words, what is it returning?

SELECT *
FROM BooksDB.dbo.tags
WHERE tag_name < 'd' AND tag_name >= 'c'

Your Answer: It lists all tags that starts with C and nothing that starts with D


To READ TABLE  

Question 1:  Create a query that uses the `user_id` to count the total number of books that each user wants to read.  Print the results in ascending order by `user_id` under the alias 'Total Books To Read'.

Hint: You can use both `GROUP BY` and `ORDER BY` to complete this query.


Select USER_ID,
count (*) as Total_Books_to_Read
From BooksDB.dbo.ratings
GROUP BY USER_ID
ORDER BY USER_ID ASC


Question 2: Create a query that uses `user_id` to count the total number of books each user wants to read.  Have the results sort the table by the total number of `book_ids` in descending order and under the alias 'Total Books To Read'.

Hint: You can use both `GROUP BY` and `ORDER BY` to complete this query.

Select USER_ID,
count (book_id) as Total_Books_to_Read
From BooksDB.dbo.ratings
GROUP BY user_id
ORDER BY [Total_Books_to_Read] DESC