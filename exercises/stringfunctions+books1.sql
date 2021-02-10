#Feb 2021: 

##The following is important to know:##

##You can execute an sql file using the 'source' command before the path to the file, i.e. 'folder/file.sql', in the cli.
##This makes it easy to edit an external file and update the code more easily. 
##Viola!

#For this exercise we're going to create a database for a small book shop.
#I'm doing the following to the database:
#-creating and populating a table called 'books'. 
#-practicing simple functions on the tables columns. 
#-practicing complex functions on the tables columns.

#Now let's have some fun :)

SHOW DATABASES;

CREATE DATABASES book_shop;

USE book_shop

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);


#SIMPLE STRUCTURES: The following are examples of passing columns to simple function structures.

#  SELECT 
#      CONCAT
#      (
#              SUBSTRING(title, 1, 10),
#          '...'
#      ) AS 'short title'
# FROM books;

# SELECT 
#     SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) AS 'weird string'
# FROM books;

# 'woof' 'foow'
# SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

# SELECT CHAR_LENGTH('Hello World');

# SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;

# "Eggers is 6 characters long"

# SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long ')
# FROM books;

# SELECT UPPER('Hello World');

# SELECT UPPER( title) FROM books;

# SELECT CONCAT('MY FAVORITE BOOK IS', UPPER(title)) FROM books;

# SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;


#COMPLEX STRUCTURES: The following are examples of more complex function structures. 
#Lets start with reversing the character order of the string in the following sentence and printing the characters in uppercase.

# SELECT UPPER(REVERSE('Why does does everything look blue at dusk and dawn?'));

#Ok, now back to the  'book' table. 

# SELECT 
#     REPLACE
#     (
#     CONCAT('I', ' ', 'like', ' ', 'cats'),
#     ' ',
#     ' '
#     );
  
# #Replace every space in title names with '->'. 
# SELECT 
#     REPLACE(title, ' ', '->') AS title
# FROM books;

# SELECT author_lname AS 'forwards', REVERSE(author_lname) AS backwards FROM books;

# SELECT CONCAT(UPPER(author_fname), ' ',UPPER(author_lname)) AS 'full name in caps' FROM books; \
# #OR
# SELECT UPPER(CONCAT(author_fname, ' ',author_lname)) AS 'full name in caps' FROM books; 

# SELECT CONCAT(title, ' was released in ',released_year) AS blurb FROM books; 

# SELECT title, CHAR_LENGTH(title) AS 'character count' FROM books; 

SELECT 
  CONCAT
  (
    SUBSTRING(title, 1, 10), 
    '...'
  ) 
  AS 'short title', 
  CONCAT(author_lname, ',', author_fname) AS author, 
  CONCAT(stock_quantity, ' in stock ') AS quantity 
FROM 
  books
ORDER BY 
  title
  DESC
 LIMIT 3
;
