#Feb 2021:

#For the following exercises, we're going to run through examples of aggregate functions.
#Aggregate functions operate on sets of values.
#Examples of aggregate functions are: AVG(), COUNT(), MAX(), MIN(), and SUM().
#Official documentation for aggregate functions can be found here:
#https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html

SHOW DATABASES;

USE book_shop

#Make sure the 'books' table is in the database.
SHOW TABLES;

#Print the number of books in the database.
SELECT COUNT(title) AS 'Number of books' FROM books;

#Print out how many books were released each year.
SELECT COUNT(title) AS 'Books per year' FROM books GROUP BY released_year;

#Print out the total number of books in stock.
SELECT SUM(stock_quantity) AS 'Books in stock' FROM books;

#Find the average released year for each author.
SELECT AVG(released_year) AS ' Avg released year', CONCAT(author_fname, ' ', author_lname) AS 'Author' FROM books GROUP BY author_fname;

#Find the full name of the author who wrote the longest book.
SELECT MAX(pages) AS 'Pages', CONCAT(author_fname, ' ', author_lname) AS 'Author' FROM books;

#Print the year, the number of books per year, and the average pages per book. 
SELECT released_year AS 'year', COUNT(title) AS '# books', AVG(pages) AS 'avg pages'FROM books GROUP BY released_year; 
