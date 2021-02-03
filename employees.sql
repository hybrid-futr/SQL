#Feb 2021:
#The following exercise builds a company DATABASE with a TABLE of employees.
#We use the AUTO_INCREMENT keyword here which allows a unique number to be generated automatically when a new row is inserted in the table.
#We also use the NOT NULL condition which enforces a column to not accept NULL values. 
#We can use the DEFAULT command to set a default value for a column, and the PRIMARY KEY constraint to set a unique record number.  


#Within the mySQL CLI:
mysql-ctl cli

#A preliminary check of available DATABASES. 
SHOW DATABASES; 

#Let's create the DATABASE and then create the TABLE.
CREATE DATABASE company;

#Access the db.
USE company

#The condition for the TABLE is that we have an employee id which auto increments, first, middle and last names, an age, and a current employment status.
#We cannot have NULL entries for the id, the first and last name, and the current empoyment status.
#We also want the PRIMARY KEY to be the id. 
CREATE TABLE employees (
    id INT AUTO_INCREMENT NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    age INT NOT NULL,
    current_status VARCHAR(50) NOT NULL DEFAULT 'employed',
    PRIMARY KEY (id)
);

#OR

#The second solution has PRIMARY KEY defined on the first line. 
CREATE TABLE employees (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    age INT NOT NULL,
    current_status VARCHAR(50) NOT NULL DEFAULT 'employed',
);

#SHOW and DESCRIBE.
SHOW TABLES;
DESC employees;

#Use INSERT INTO to populate a row. 
INSERT INTO employees(first_name, last_name, age) VALUES ('JR', 'Smith', 32);

#SELECT * FROM works just fine. 
SELECT * FROM employees;

#Now we got something to work with!
