# SQL Part 3 Exercises: Joins

This notebook works with `BooksDB`.

**Questions 1-4** focus on how joins work in a more general sense.  If you are not sure how to best answer the questions, try manipulating the queries by changing the order of joins, the length of the TOP, or how they are ordered.

Note: If some of the queries are not returning quickly, you can try closing and restarting Visual Studio Code after a few minutes.

In **questions 5-8**, you will be asked to join tables to find results about titles, tags, and the books users want to read.

As you go through the questions, you will see 'Minimum Desired Output'.  This will provide you with the bare minimum columns needed to answer the questions.  When you write the queries, add as many additional columns as you need to best find your answers.


## QUESTION 1:  Exploring a `LEFT JOIN` using the `books` and `to_read` tables

The code block below has been commented out. To answer this question, you will need to uncomment it by removing the `/*` (line 1) and `*/` (line 16).

**Part A:** Look at Query 1, which table is the 'Left' table and which is the 'Right'?

> Your Answer: dbo.books is the Left table and dbo.to.read is the Right table.

**Part B:** Using table 2, answer the following questions: 
- When we added a `WHERE tr.user_id IS NOT NULL` clause (line 14), how did the table change?  Why?

Where tr.user_id IS NOT NULL filters out row which are NULL in tr.user id as a result 
only the books with entry to_read are listed out when we run the query. 
In other words, the books which has Null rows are not listed.

/*
-- Query 1: LEFT JOIN
SELECT TOP 50 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
LEFT JOIN BooksDB.dbo.to_read AS tr
ON b.best_book_id = tr.book_id
ORDER BY b.average_rating;

-- Query 2: LEFT JOIN USING 'IS NOT NULL'
SELECT TOP 50 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
LEFT JOIN BooksDB.dbo.to_read AS tr
ON b.best_book_id = tr.book_id
WHERE tr.user_id IS NOT NULL
ORDER BY b.average_rating;
*/


## **QUESTION 2:** Exploring `RIGHT` joins with the `books` and `to_read` tables

You will need to uncomment the query to answer the question.

**Part A:** Looking at the query, which table is the 'Left' and which is the 'Right'?

> Your Answer:dbo.books to read is Right  and dbo.books is Left  

**Part B:** How do the RIGHT-joined tables differ from the LEFT-joined tables in Question 1?

> Your Answer: In Question 1 Left join to books table listed out all rows from books table. 
In the second question Right join to_read table will list all rows from 
to_read including matching data from the books table.


/*
-- Query 1: RIGHT JOIN
SELECT TOP 300 b.title, b.average_rating, b.books_count, tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
RIGHT JOIN BooksDB.dbo.to_read AS tr
ON b.best_book_id = tr.book_id;
*/


## **QUESTION 3:** Exploring FULL JOINS with the `books` and `to_read` tables

You will need to uncomment the Query to answer the question.

**Part A:**  Look at the table and explore how it was populated.  Try manipulating the query to better understand how this table works.  Try adding a WHERE clause, or ORDER BY a column on the `books` table.  Based on your exploration, can you think of when you might want a FULL join rather than a LEFT, RIGHT, or INNER?

> Your Answer: All rows from dbo.books and dbo.to_read are listed include matched book id and null.

/*
-- FULL JOIN
SELECT TOP 30 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
FULL JOIN BooksDB.dbo.to_read AS tr
ON b.book_id = tr.book_id;
*/

## **QUESTION 4:** Exploring INNER Joins with the `books` and `to_read` tables

You will need to uncomment the Query to answer the question.

**Part A:**  What does an inner join do?

> Your Answer: Inner Join returns values which are matched within both the joined Tables.

**Part B:** Currently this table has an `'IS NOT NULL'` in the `WHERE` clause. Is this necessary for this table? Why or Why not?

> Your Answer: There is no need to use IS NOT NULL IN WHERE, 
The reason is inner join already lists out only matched id within the joined tables, 
without any listing rows having Null.

**Part C:**  When using SQL, you are usually returning much larger tables so every line of code will add to the compilation and return time.  Rewrite this inner join query so that it contains no redundant code.

> Your Answer:  Update the query in the code box below.

/*
-- INNER JOIN
SELECT TOP 30 b.title, b.average_rating, b.books_count,tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
INNER JOIN BooksDB.dbo.to_read AS tr
ON b.book_id = tr.book_id
WHERE b.title IS NOT NULL
ORDER BY tr.book_id;
*/

Updated Query  

SELECT TOP 30 b.title, b.average_rating, b.books_count, tr.user_id, tr.book_id
FROM BooksDB.dbo.books AS b
INNER JOIN BooksDB.dbo.to_read AS tr
ON b.book_id = tr.book_id
ORDER BY tr.book_id



## **QUESTION 5:**  Using joins to find the most tagged book and the most popular tag

We will be writing 3 queries to find both the most tagged book and that book's most popular tag.

**Part A:**  What is the most tagged book?

Start by joining the `books` and `book_tags` tables ON the `books.best_book_id` and `book_tags.goodreads_book_id`. We want the *most popular* book, so think about ordering the table in a way that will display both the book title and the number of times a book tag has been used.

Minimum Desired output:_  The title of the most tagged book, and the number of times the book has been tagged.

**Title:**

**Part B:** How many different tags have been used for the most tagged book?

Start by joining the `books` and `book_tags` tables ON the `books.best_book_id` and `book_tags.goodreads_book_id`. We want to find the *most popular* tag id, so think about ordering in a way that will display the most popular tag id.

*Minimum Desired Output:* The tag id for the most popular tag used for the most tagged book.

**Tag Id:**

**Part C:** What is this particular tag?

You may return this answer with a simple query.

*Minimum Desired Output:* The tag name for the most popular tag used for the most tagged book.

**Tag Name:**

PART A - ANSWER

SELECT TOP 1 
b.title,
COUNT(bt.tag_id) AS tag_count
FROM BooksDB.dbo.books AS b
JOIN BooksDB.dbo.book_tags AS bt
ON b.best_book_id = bt.goodreads_book_id
GROUP BY b.title
ORDER BY tag_count DESC

PART B - ANSWER

SELECT TOP 1 
b.title,
bt.tag_id,
COUNT(bt.tag_id) AS tag_popular
FROM BooksDB.dbo.books AS b
JOIN BooksDB.dbo.book_tags AS bt
ON b.best_book_id = bt.goodreads_book_id
GROUP BY b.title, bt.tag_id
ORDER BY tag_popular DESC

PART C - ANSWER

SELECT tag_name
FROM BooksDB.dbo.tags
WHERE tag_id = 5207


## QUESTION 6: Find a book based on a tag of your choice using joins.

Some suggestions: any hobbies you like? baking, drawing, etc. how about favorite holidays, subjects, animals, etc?

**Part A:** Explore the tags table for a tag of your choice.  Suggested ideas, try searching for one of your hobbies, a favorite time of year, favorite animal, etc.  Start by querying the tag table for your chosen tag.  (_Hint:_ in order to make sure you find all combinations of your tags, use the wildcard).  If your query returns more than one result, pick your favorite.

Here is an example.  Alyce wanted to search for Halloween books.  She used the wildcard, `%halloween%` and 8 different combinations were found.  Alyce selected `halloween-storytime`, with a tag id of 13877.

*Minimum Desired Output:* tag name and tag id

**Your Tag and Tag Id:**

**Part B:** Now that you have the tag id, find the title that was tagged the most with this tag by joining the `books` and `books_tags` tables.

Alyce joined the book table with the tags table and discovered that "The Little Old Lady Who Was Not Afraid of Anything" was tagged as `halloween-storytime` the most.

*Minimum Desired Output:* title and tag count

**Your Title and Number of times the tag was used:**

use BooksDB
SELECT tag_id, tag_name
FROM tags
WHERE tag_name LIKE '%Birds%



## **QUESTION 7:** What are the top 10 most popular book titles on the 'to read' list?

**Part A:**  Explore how the `to_read` and `books` tables are organized, and then join them.  What will you use as a key?

Your Answer:

**Part B:** Organize your newly joined table in a way that groups popularity based on the title based on users.

*Hint:* Suggest using an alias for the aggregation you will need to run on the `user_id`

*Minimum Desired Output:* title and aliased column


use BooksDB
SELECT TOP 10
b.title,
COUNT(tr.user_id) AS to_read_count
FROM dbo.to_read AS tr
JOIN dbo.books AS b
ON tr.book_id = b.book_id
GROUP BY b.title
ORDER BY to_read_count DESC


## **QUESTION 8:** Largest 'To Read' Lists

**Part A:**  Create a query that returns a table that contains the top 10 users with the most number of titles on their 'to read' list.    Group all the entries by `user_id`.

_Hint:_ You might want an alias for the titles.

_Minimum Desired Output:_ `user_id` and your aliased column of titles.

**Part B:**  The longest list length is 15 titles total, and is shared by 4 different users.  Select one of the uses and print out their entire 'to read' list.

SELECT TOP 10
tr.user_id,
COUNT(tr.book_id) AS total_titles
FROM dbo.to_read AS tr
GROUP BY tr.user_id
ORDER BY total_titles DESC

SELECT 
b.title
FROM dbo.to_read AS tr
JOIN dbo.books AS b
ON tr.book_id = b.book_id
WHERE tr.user_id = 38457