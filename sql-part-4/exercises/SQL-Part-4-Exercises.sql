
# Exercises: Complex queries

For the exercises, you are tasked with writing five 
queries that will help you delve deeper into BooksDB. 
You can choose whether you want to use a correlated 
subquery, a nested subquery, the UNION operator, 
the INTERSECT operator, or the EXCEPT operator for each one. You may not use joins or add multiple statements to the WHERE clause.

1. Write a query that will return the number of users 
who rated a book above it's average rating.



use BooksDB
select COUNT(DISTINCT user_id) AS UsersAboveAverage
from ratings r
Where r.rating > 
(
select average_rating
from books b
Where b.book_id = r.book_id)






2. Write a query that returns the book ids of 
all books that have over 1000 ratings of 1 star 
or over 1000 ratings of 5 stars.


SELECT book_id
FROM books
WHERE ratings_1 > 1000

Intersect

SELECT book_id
FROM books
WHERE ratings_5 > 1000

Select book_id, title, ratings_5
from books


3. Write a query that returns the book ids of all books 
that have over 1000 ratings of 1 star and over 1000 
ratings of 5 stars.


use booksdb
SELECT book_id
FROM ratings
WHERE rating = 1
GROUP BY book_id
HAVING COUNT(*) > 1000

INTERSECT

SELECT book_id
FROM ratings
WHERE rating = 5
GROUP BY book_id
HAVING COUNT(*) > 1000


4. Write a query that returns the book ids of books 
that have a language code of
 "en-US" and not a langugae code of "en-GB".

use booksdb
SELECT book_id
FROM books
WHERE language_code = 'en-US'

EXCEPT

SELECT book_id
FROM books
WHERE language_code = 'en-GB'


5. Write a query that returns the names of the tags 
and the tag ids for tags 
that were used over 100,000 times for a book. 

use booksdb
SELECT tag_id, tag_name
FROM tags t 
where tag_id in (
select tag_id
FROM book_tags 
WHERE count > 100000
)

    


select count
from book_tags