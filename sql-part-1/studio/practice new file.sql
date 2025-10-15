Select top 1 *
from BooksDB.[dbo].[book_tags];
Select top 1 *
from BooksDB.[dbo].[books];
Select top 1 *
from BooksDB.[dbo].[tags];
Select top 1 *
from BooksDB.[dbo].[ratings]
Select top 1 *
from BooksDB.[dbo].[to_read]

Select top 1 bt.tag_id, t.tag_name, count(*) as tagcount
from BooksDB.dbo.book_tags bt inner JOIN BooksDB.dbo.tags t
on bt.tag_id = t.tag_id
GROUP BY bt.tag_id, t.tag_name
ORDER BY count (*) DESC

SELECT *
FROM dbo.Books