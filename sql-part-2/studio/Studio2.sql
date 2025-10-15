SELECT top 1 (LEN(title)) AS TitleLength, Title
FROM BooksDB.dbo.books
ORDER BY LEN(Title) DESC


SELECT top 1 MIN(LEN(authors)) AS AuthorLength, authors, title
FROM BooksDB.dbo.books
GROUP BY authors, title
ORDER BY AuthorLength ASC

SELECT title
FROM BooksDB.dbo.books
Where title like '%the%'

Select COUNT(*)
FROM BooksDB.dbo.books
WHERE authors LIKE '%Z%'


How many authors' names _start_ with 'Z'?
LEFT(authors, 1) = Z

SELECT COUNT(*) AS AuthorsnamewithZ
FROM BooksDB.dbo.books
WHERE LEFT(authors, 1) = 'Z'


SELECT 
CONCAT(title,' by ', authors,' in ', ISNULL(language_code, 'unknown'),' language') AS BookInfo
FROM BooksDB.dbo.books


SELECT COUNT(*) AS NonEnglishBooks
FROM BooksDB.dbo.books
WHERE LEFT(language_code, 2) <> 'en'

SELECT COUNT(*) AS NonEnglishBooks
FROM BooksDB.dbo.books
WHERE SUBSTRING(language_code, 1, 2) <> 'en'