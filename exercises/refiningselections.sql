#Feb 2021: refinining selections exercise. 

#I'm going to test out the following keywords on the 'books' table from the 'book_store' database:
#DISTINCT, ORDER BY, LIMIT, LIKE and the wildcards '%' and '_'.
#Here is a list of SQL keywords: https://www.w3schools.com/sql/sql_ref_keywords.asp
#Here is a list of SQL wildcards: https://www.w3schools.com/sql/sql_wildcards.asp

SHOW DATABASES;

USE book_shop

SHOW TABLES;

#First I want to select all books whose titles contain the word 'stories'. 
#Here we make use of the wildcard '%'.
SELECT title FROM books WHERE title LIKE '%stories%'; 

#Next I want to print out the title and page count of the longest book.
#I'm going to order by the descending number of pages, but limit the list to the first book.
SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1; 


#The challange for the following exercises is to only use the keywords and wildcards from above.
#Note that there are probably faster ways of doing these, but that's not the point here.
#To start, I'm going to print a summary containing the title and book for the 3 most recent books.
SELECT CONCAT(title, ' - ', released_year) AS summary FROM books ORDER BY released_year DESC LIMIT 3;

#Find all books with an author last name that contains a space(" ").
SELECT title, author_lname FROM books WHERE author_lname LIKE '% %';

#Find the 3 books with the lowest stock and select title, year, and stock.
SELECT title, released_year, stock_quantity FROM books ORDER BY stock_quantity LIMIT 3;

#Print title and author last name, sorted first by author last name and then by title.
SELECT title, author_lname FROM books ORDER BY author_lname, title;

#And finally, I'm going to sort the list alphabeticaly by last name as if I'm yelling out titles. 
SELECT UPPER(
    CONCAT(' my favorite author is ', 
           author_fname, ' ',author_lname, 
           ' ! ')
) 
AS yell 
FROM books 
ORDER BY author_lname
;

#Hopefully this was a good workout for some simple keywords and wildcard permutations.
