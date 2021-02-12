#Feb 2021:

#This exercise covers a variety of data types:
##CHAR, VARCHAR, DECIMAL, FLOAT, DOUBLE###
###DATE, TIME, and DATETIME################
####CURDATE, CURTIME, NOW, TIMESTAMPS#######
#Doc: https://dev.mysql.com/doc/refman/8.0/en/data-types.html


#Create a new db for all of the exercises:
CREATE DATABASE new_db;

USE new_db


#String types:
#CHAR vs VARCHAR,
#CHAR has a fixed length, ex. CHAR(3),
#VARCHAR has variable length.

CREATE TABLE animal
(name CHAR(5), breed VARCHAR(10));

INSERT INTO animal (name, breed)
VALUES ('buddy', 'husky'),
       ('napoleon', 'mini-poodle'),
       ('princess melodie','toy poodle');

#Notice that 'princess melodie' will be truncated to 'princ'.
SELECT * FROM animal;


#Number types:
#DECIMALS are fixed-point types and calculations are exact,
#FLOATS and DOUBLES are floating-point types and calculations are approximate.
#Doc: https://dev.mysql.com/doc/refman/8.0/en/precision-math.html

CREATE TABLE items
(price DECIMAL(5,2));

INSERT INTO items (price) 
VALUES (99), (99.9), (99.99), (99.999);

#Note that the first three numbers show up as '99.99' while the fourth shows up as '100.00'.
SELECT * FROM items;

#A general rule of thumb for approximate numbers is to use DOUBLE over FLOAT. 
#Float is precise up to ~7 bytes. 
#Double is precise up to ~14 bytes. 

CREATE TABLE pricesuno (price1 FLOAT);

INSERT INTO pricesuno (price1) 
VALUES (98.7654), (9898.7654), (9898987665454.7654);

SELECT * FROM pricesuno;

CREATE TABLE pricesdos (price2 DOUBLE);

INSERT INTO pricesdos (price1) 
VALUES (98.76548), (34978789898.76547878), (7863278893898764.77878787087654354);

SELECT * FROM pricesdos;


#DATE, TIME, and DATETIME:
#DATE stores values with date but w/no time (format: YYYY-MM-DD),
#TIME stores values with time but with no date (format: HH:MM:SS),
#DATETIME stores values with date and time (format: YYYY-MM-DD HH:MM:SS).

CREATE TABLE people 
(name VARCHAR(100), 
 bdate DATE,
 btime TIME,
 birthdt DATETIME
);

INSERT INTO people (name, bdate, btime, birthdt)
VALUES ('Pamella', '1999-12-25', '09:10:11', '1999-12-25 09:10:11'),
       ('Jean', '1989-01-05', '11:09:10', '1989-01-05 11:09:10');


#More DATE/TIME examples:
#CURDATE() gives the current date,
#CURTIME() gives the current time,
#NOW() gives current datetime.

INSERT INTO people (name, bdate, btime, birthdt)
VALUES ('Lucas', CURDATE(), CURTIME(), NOW());

#Let's check the results:
SELECT * FROM people;


#Formatting dates:
#DAY(), DAYNAME(), DAYOFWEEK(), DAYOFYEAR(), etc. 
#Doc: https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html

SELECT name, birthdt, DAY(birthdt) FROM people;
SELECT name, birthdt, DAYNAME(birthdt) FROM people;
SELECT name, birthdt, DAYOFWEEK(birthdt) FROM people;
SELECT name, birthdt, DAYOFYEAR(birthdt) FROM people;

#The next bit of formatting converts something like "2021-02-12" to February 12th, 2021.
SELECT CONCAT(MONTHNAME(birthdt), ' ', DAY(birthdt), ' ', YEAR(birthdt)) FROM people;
#OR
SELECT DATE_FORMAT(birthdt, '%M %D %Y') AS birthdate FROM people;


#Date math: 
SELECT DATEDIFF(NOW(), birthdt) FROM people;
SELECT name, birthdt, DATEDIFF(NOW(), birthdt) FROM people;

#SELECT DATE_ADD(date, INTERVAL expr unit) <- INTERVAL = keyword, expr unit = 10 MONTHS, etc. 
SELECT DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
SELECT DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;
#OR
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people;


#Timestamps:
#Refer to saving information about when something is created
#Doc: https://dev.mysql.com/doc/refman/8.0/en/datetime.html

CREATE TABLE commentsuno (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO commentsuno (content)
VALUES ('this is hilarious!'),
       ("I don't like this one bit")
;

SELECT * FROM commentsuno;

CREATE TABLE commentsdos (
    content VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO commentsdos (content)
VALUES ('this is hilarious!'),
       ("I don't like this one bit")
;

UPDATE commentsdos SET content = 'ok, maybe not so much' WHERE content = 'this is hilarious!';

SELECT * FROM commentsdos;
