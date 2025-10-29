
SELECT title
FROM books
WHERE book_id IN (
SELECT book_id
FROM book_tags
WHERE tag_id = (
SELECT tag_id
    FROM tags
WHERE tag_name = '%Meditation%'
)
);

Select Title 
from books
WHERE book_id IN (
Select distinct goodreads_book_id
from book_tags
where tag_id IN (
select distinct tag_id 
from tags 
where tag_name like '%Meditation%'
)
)



use BooksDB
with result1 as (
SELECT original_publication_year, title, average_rating,
(select AVG (rating)
FROM ratings r2
where r2.book_id = b.book_id) as ratings
from books b
) select *
from result1
WHERE ratings > average_rating




GROUP BY original_publication_year, title, average_rating


Having AVG(rating) > average_rating

select * 
from ratings
where book_id = 2767052

SELECT DISTINCT b.title, b.original_publication_year
FROM books b
WHERE b.book_id IN (
SELECT r.book_id
FROM ratings r
WHERE r.rating > (
SELECT AVG(r2.rating)
FROM ratings r2
WHERE r2.book_id = r.book_id
)
)
ORDER BY b.original_publication_year, b.title;




use BooksDB
Select top 10 *
from books
WHERE book_id = 3




use BooksDB
SELECT original_title, title, average_rating
FROM books
WHERE original_title IS NOT NULL
AND title = original_title
and average_rating >= 4.2
ORDER BY average_rating
DESC;



## QUESTION 4:  Thisbe

Thisbe is planning to make a long-term display of 
popular books that she will update monthly, 
reflecting different time periods. 
 She wants to make it reader-centric by including 
 titles that readers have averagely rated 
 higher than the book's actual average rating. 

**Part A:**   Write a query that compares the publication time with average reader ratings.

**Part B:**  She wants the list ordered by year, then the book title


SELECT title, original_publication_year, 
(SELECT AVG(r2.rating)
FROM ratings r2
WHERE r2.book_id = b.book_id) AS avg_reader_rating
FROM books b;


SELECT DISTINCT b.title, b.original_publication_year
FROM books b
WHERE b.book_id IN (
SELECT r.book_id
FROM ratings r
WHERE r.rating > (
SELECT AVG(r2.rating)
FROM ratings r2
WHERE r2.book_id = r.book_id
)
)
ORDER BY b.original_publication_year, b.title;