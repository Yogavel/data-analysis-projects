# Lesson 11: SQL Part 2 Studio

> This studio asks you to create queries using the functions from this lesson. As you work through the studio, you may need to create more than one query to return the desired answer.  For others, you may need to combine functions together in order to answer the original query.  The questions have been organized in a way to help you puzzle out the answers.
> 
> Happy querying! 

**The Dataset:**   

> We will be working with the **BooksDB dataset** from Lesson 10.  You should already have access to it.


## The Questions:

1.  Create a query that returns the longest title in the dataset.  We can do this in two steps.

> A. Create a query that returns the length of the longest title.
> 
> B. Create a query that uses the length you found in step A to find the longest title.

SELECT top 1 (LEN(title)) AS TitleLength, Title
FROM BooksDB.dbo.books
ORDER BY LEN(Title) DESC

2.  Use what you learned in question 1 to find the shortest author name.  

> A. Create a query that returns the length of the shortest author.
> 
> B. Create a query that returns the shortest author's name.

SELECT top 1 MIN(LEN(authors)) AS AuthorLength, authors, title
FROM BooksDB.dbo.books
GROUP BY authors, title
ORDER BY AuthorLength ASC

3\. How many titles contain the word "The"?  

> A. Is there a difference between the number of titles that use "The" or "the"?

SELECT title
FROM BooksDB.dbo.books
Where title like '%the%'

There is no difference between the number of titles that use "The" or "the"
I am understanding Sql is not case sensitive.

4.  How many authors' names _start_ with 'Z'?
SELECT COUNT(*) AS AuthorsnamewithZ
FROM BooksDB.dbo.books
WHERE LEFT(authors, 1) = 'Z'

5\. How many books have been identified as printed in a language other than English?  
There are four language codes for English: 'en', 'eng', 'en-US', and 'en-UK'.  
Use LEFT to answer the question.  (Do not use the wildcard)

You might want to use one of these [comparison operators]

SELECT COUNT(*) AS NonEnglishBooks
FROM BooksDB.dbo.books
WHERE LEFT(language_code, 2) <> 'en'

6\. Retry question 5 using SUBSTRING.

SELECT COUNT(*) AS NonEnglishBooks
FROM BooksDB.dbo.books
WHERE SUBSTRING(language_code, 1, 2) <> 'en'

7.  Create a column that returns the title, authors, and language codes.  
Concatenate these elements so that they return in the following way: title by authors in language\_code language.

> A.  Check each selected column to see where any values are NULL.  
Did any of the columns contain NULL values?  If so, which one?

Select CONCAT(title,' by ', authors,' in ', language_code, ' language') AS BookInfo
FROM BooksDB.dbo.books


8.  Update the query in question 7 using COALESCE to change the language code values from NULL to 'unknown'.

> A.  Has this changed the language\_code  where the values are NULL?
Yes it replaces Null values with language code unknown

SELECT 
CONCAT(title, ' by ', authors, ' in ', COALESCE(language_code, 'unknown'), ' language') AS BookInfo
FROM BooksDB.dbo.books

9\. Revisit question 7 using ISNULL instead of COALESCE.

> A.  Has this changed the language\_code  where the values are NULL?
Yes, using ISNULL changes how the language_code values display, the NULL values 
appear as unknow just like when using COALESCE.


SELECT 
CONCAT(title,' by ', authors,' in ', ISNULL(language_code, 'unknown'),' language') AS BookInfo
FROM BooksDB.dbo.books







