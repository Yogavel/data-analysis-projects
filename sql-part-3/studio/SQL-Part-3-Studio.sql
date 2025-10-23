## Part 1:  March - Women's History Month, National Pie Day (3/14), 
St. Patrick's Day (3/17), Season - Spring

### Event 1: Women's History Month

Highlight popular women writers based on ratings from `BooksDB` by writing a query that returns `tag_id`, the number of times each `tag_id` is used and the `tag_name`. Use the `GROUP BY` and `HAVING` clause to narrow your focus and 
try multiple keywords, such as "woman" and "female".

use BooksDB
Select bt.tag_id,t.tag_name, sum(b.books_count) as tot_count
from dbo.book_tags bt 
INNER JOIN dbo.tags t
ON bt.tag_id = t.tag_id
INNER JOIN dbo.books b
on b.book_id = bt.goodreads_book_id
WHERE t.tag_name LIKE '%Female%'
or t.tag_name like '%Women%'
or t.tag_name like '%Woman%'
GROUP BY bt.tag_id, t.tag_name
HAVING SUM(b.ratings_count)>0

-### Event 2: Choose another event from March/Spring

Write a query to return authors, 
titles, ratings, and `tag_id` that you would want to promote during your chosen event.

use BooksDB
SELECT 
b.authors,
b.title,
b.ratings_count,
bt.tag_id
FROM dbo.books AS b
JOIN dbo.book_tags AS bt
ON b.book_id = bt.goodreads_book_id
JOIN BooksDB.dbo.tags AS t
ON bt.tag_id = t.tag_id
WHERE 
t.tag_name LIKE '%Easter%'
OR t.tag_name LIKE '%spring%'
ORDER BY 
b.ratings_count DESC

Record your thoughts about why you wrote the query the way you did.

The query helps to choose authors, titles, 
ratings count and tag ID's related to books 
with Easter or Spring season. The order by 
clause helps list most popular and frequently rated books.

# Part 2: Choose Another Month

Choose another month and plan at least 2 events / promotions and answer the following questions:
1. Which month did you choose? 
I chose Month of November

1. What 2 events / promotions are you highlighting?
I am highlighting Veterans Day and Thanksgiving.


# Part 3: Summarize your Work

For each event write at least one query that 
joins any two tables in `BooksDB` to 
support your choice and record you 
thoughts as to why you used the paticlular query. 
At least one of your queries needs to include a 
`HAVING` clause.


use BooksDB
Select
b.authors,
b.title,
bt.goodreads_book_id,
sum (b.ratings_count) as total_rating
FROM dbo.books AS b
jOIN dbo.book_tags as bt
on b.book_id = bt.goodreads_book_id
Join dbo.tags as t  
on t.tag_id = bt.tag_id
Where b.ratings_count > 4
and t.tag_name LIKE '%Veterans%'
GROUP BY
b.authors,
b.title,
bt.goodreads_book_id




use BooksDB
Select
b.authors,
b.title,
bt.goodreads_book_id,
sum (b.ratings_count) as total_rating
FROM dbo.books AS b
jOIN dbo.book_tags as bt
on b.book_id = bt.goodreads_book_id
Join dbo.tags as t  
on t.tag_id = bt.tag_id
Where t.tag_name LIKE '%Thanksgiving%'
GROUP BY
b.authors,
b.title,
bt.goodreads_book_id
HAVING SUM(b.ratings_count) > 4


### Summarize Event 1

I chose Month of November and my first event is Veterans DAY. 
I joined Books, with book_tags, and tags to connect to 
their tag names. Then I uses Where clause to filter books 
with min of 4 rating Later I summed up the ratings count 
to give me the books with good ratings. 
The WHERE and Sum of ratings count clause ensures 
we see books with popular reader engagement.

### Summarize Event 2

My second event I chose was Thanksgiving and my query 
focuses on filtering Thanksgiving-themed books. 
It joins the same three tables, but I used a 
HAVING clause instead of WHERE to filter on the 
aggregated total ratings. `


