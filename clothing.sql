#Feb 2021:
#This exercise practices the building out of basic structures and then implements CRUD commands. 
#The setup is that we have to categorize a variety of clothes. 

#Open the command line.
mysql-ctl cli

#Create a DATABASE and a TABLE. 
CREATE DATABASE shirt_db;

SHOW DATABASES;

USE shirt_db

CREATE TABLE shirts
(
shirt_id  INT NOT NULL AUTO_INCREMENT,
article    VARCHAR(100),
color   VARCHAR(100),
shirt_size     VARCHAR(100),
last_worn INT,
PRIMARY KEY (shirt_id)
);

#Check that things work.
DESC shirts;

#Insert data into the TABLE.
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES
('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

#Select the entire TABLE just to make sure that we're good.
SELECT * FROM shirts

#Add a single new shirt.
INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ('polo shirt','purple', 'M', 50);

#Select article and color from shirts.
SELECT article, color FROM shirts;

#Select article, color, shirt_size, last_worn from Medium shirts.
SELECT article, color, shirt_size, last_worn FROM shirts WHERE shirt_size='M';

#Update all polo shirts to be Large. 
SELECT * FROM shirts WHERE article='polo shirt';
UPDATE shirts SET shirt_size='L'
WHERE article='polo shirt';

#Update shorts that were worn 15 days ago to 0.
SELECT * FROM shirts WHERE last_worn=15;
UPDATE shirts SET last_worn=0
WHERE last_worn=15;

#Update all white shirts to 'XS' and 'off white'. The shirts shrunk and some color got on them.
SELECT * FROM shirts WHERE color='white';
UPDATE shirts SET shirt_size='XS', color='off white'
WHERE color='white';

#Delete all old shirts.
SELECT * FROM shirts WHERE last_worn=200;
DELETE FROM shirts WHERE last_worn=200;

#Delete all tank tops.
SELECT * FROM shirts WHERE article='tank top';
DELETE FROM shirts WHERE article='tank top';

#Delete all shirts.
DELETE FROM shirts; 

#Drop the entire shirts table because I'm throwing out all of my shirts!
DROP TABLE shirts; 
