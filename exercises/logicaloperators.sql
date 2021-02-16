#Feb 2021:

#This exercise will cover logical operators.
#Doc: https://dev.mysql.com/doc/refman/8.0/en/logical-operators.html

#I'll warm up with the following.
SELECT 99 != 99;

SELECT 20 > 15 && 99 - 80 <= 15;

SELECT 1 IN (9,2) || 11 BETWEEN 10 AND 20; 


#Using the book_shop db.
#Select all books weritten before 1980 (non-inclusive).
SELECT title, CONCAT(author_fname,' ', author_lname) AS author, released_year  FROM books 
WHERE released_year < 1980;


#Select all books written by Eggers or Chabon.
SELECT title, CONCAT(author_fname,' ', author_lname) AS author FROM books 
WHERE author_lname = 'Eggers' || author_lname = 'Chabon';
#OR
SELECT title, CONCAT(author_fname,' ', author_lname) AS author FROM books 
WHERE author_lname IN ('Eggers','Chabon');


#Select all books written by Lahiri, published after 2000.
SELECT title, CONCAT(author_fname,' ', author_lname) AS author, released_year AS 'year' FROM books 
WHERE author_lname = 'Lahiri' && released_year > 2000;


#Select all books with page counts between 100 and 200. 
SELECT title, CONCAT(author_fname,' ', author_lname) AS author, pages FROM books 
WHERE pages >= 100 && pages <= 200;
#OR
SELECT title, CONCAT(author_fname,' ', author_lname) AS author, pages FROM books 
WHERE pages BETWEEN 100 AND 200;


#Select all books where author_lname starts with 'C' or 'S'.
SELECT title, CONCAT(author_fname,' ', author_lname) AS author FROM books 
WHERE author_lname LIKE 'C%' || 
      author_lname LIKE 'S%';
#OR
SELECT title, CONCAT(author_fname,' ', author_lname) AS author FROM books 
WHERE SUBSTR(author_lname,1,1) = 'C' || 
      SUBSTR(author_lname,1,1) = 'S';
#OR
SELECT title, CONCAT(author_fname,' ', author_lname) AS author FROM books 
WHERE SUBSTR(author_lname,1,1) IN ('C', 'S');


#If a title contains 'stories' -> Short Stories,
#Just Kids and A Heartbreaking Work -> Memoir,
#Everything Else -> Novel.
SELECT title, CONCAT(author_fname,' ', author_lname) AS author, 
    CASE 
        WHEN title LIKE '%stories%' THEN 'Short Stories'
        WHEN title = 'Just Kids' || title = 'A Heartbreaking Work%' THEN 'Memoir'
        ELSE 'Novel'
    END AS Genre
FROM books; 


#Select author and the count of how many books the author has. 
SELECT CONCAT(author_fname,' ', author_lname) AS author, 
    CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')    
    END AS COUNT
FROM books
GROUP BY author_lname, author_fname;