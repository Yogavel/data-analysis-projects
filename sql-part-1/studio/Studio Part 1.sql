Question 1
Write a query of the books table that returns the TOP
100 results and includes book_id, authors, title, and 
average_rating. Use an alias for at least one column AND
sort the result set in descending order of rating.
What is the number one book?

select top 100
book_id,authors,title,
average_rating as Rating_avg
from books
order by average_rating DESC

Question 2
Write a query to find the least popular book

Select top 1 *
from BooksDB.dbo.books
ORDER BY average_rating ASC

Question 3
Which tag is most popular

Select top 1 tag_id, count(*) as tagcount
from BooksDB.dbo.book_tags
GROUP BY tag_id
ORDER BY count (*) DESC

Question 4
What is the name of the most popular tag

Select top 1 bt.tag_id, t.tag_name, count(*) as tagcount
from BooksDB.dbo.book_tags bt inner JOIN BooksDB.dbo.tags t
on bt.tag_id = t.tag_id
GROUP BY bt.tag_id, t.tag_name
ORDER BY count (*) DESC



Question 5: How many books where released in the first decade of 2000?

SELECT COUNT(*) AS BooksReleased_2ks
FROM BooksDB.dbo.Books
WHERE ([original_publication_year]) BETWEEN 2000 AND 2009


Question 6: How many book titles contain the word, "happy"?

SELECT COUNT(*) as Happybook
FROM BooksDB.dbo.Books
WHERE original_title LIKE '%happy%'


Question 7: List the books from the top 3 authors from Question 1.  
If there is more than one author just use the first one.
 Sort the title alphabetically by `author` and 
 then by `average_rating`, 
 best rated to lowest. Does this order matter in sorting?

select top 3 * 
from BooksDB.dbo.books 
order by authors ASC, average_rating DESC


Question 8: Write a query that returns the number of authors 
whose first name is between rock and roll.

select count (authors) as Authorname
from BooksDB.dbo.books
where authors BETWEEN 'rock' and 'roll'


## Part 2: Find the Answers to Your Own Questions

Your Question:  Click here to add a questions 
that you want to answer and write a query to find the answer!

1. What book has the longest title?

SELECT TOP 1 title, LEN(title) AS TitleLength
FROM BooksDB.dbo.books
ORDER BY LEN(title) DESC


2. Which author wrote most books?

SELECT TOP 1
authors,
COUNT(*) AS total_books
FROM BooksDB.dbo.books
GROUP BY authors
ORDER BY total_books DESC








