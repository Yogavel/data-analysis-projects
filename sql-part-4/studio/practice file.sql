


use BooksDB
select title
from books
where authors like '%,%'

use BooksDB
Select title 
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


Step #1 
We need to list tagids for mediation

Select tag_id
from tags
where tag_name LIKE '%Meditation%'

Output: tagids

Step #2
select goodreads_book_id
FROM book_tags
where tag_id IN (123)

Input: tagids
Output: bookids

select goodreads_book_id
FROM book_tags
where tag_id IN (

    Select tag_id
from tags
where tag_name LIKE '%Meditation%'
)


Output: list of bookids


Step #3:

Select title
from books
where book_id in (
    select goodreads_book_id
FROM book_tags
where tag_id IN (

    Select tag_id
    from tags
    where tag_name LIKE '%Meditation%'
)
)


use BooksDB
SELECT original_title, title, average_rating
FROM books
WHERE original_title IS NOT NULL
AND title = original_title
and average_rating >= 4.2
ORDER BY average_rating
DESC;

use BooksDB
with title_table as (select average_rating, title, original_title
from books
where average_rating >= 4.2
INTERSECT
select average_rating, title, original_title
from books 
where title = original_title
EXCEPT
select average_rating, title, original_title
from books
where original_title is NULL)
select title, original_title
from title_table
ORDER BY average_rating desc



with Reader_Rating_Data 
as (select book_id, AVG(rating) as Reader_Rating
from ratings
GROUP BY book_id)
select * from Reader_Rating_Data
where Reader_Rating >= 



use BooksDB
with result1 as (
SELECT original_publication_year, average_rating, title,
(select AVG (rating)
FROM ratings r2
where r2.book_id = b.book_id) as Reader_ratings
from books b
) select original_publication_year, title
from result1
WHERE Reader_ratings > average_rating
order by original_publication_year, title






