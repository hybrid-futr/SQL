#Feb 2021:

#Use cases for CHAR?
#Some use cases for CHAR are text that we know 100% of the time has a fixed length. 
#For example, a column for US state abbreviations. 


#Create a table using the new data types:

CREATE TABLE inventory (
        voodoo_doll VARCHAR(50),
        price DECIMAL(8,2),
        quantity INT
);

#What is the difference between DATETIME and TIMESTAMP?
#Doc: https://dev.mysql.com/doc/refman/8.0/en/datetime.html
#Both DATETIME and TIMESTAMP data types contain time and date parts.
#DATETIME has a supported range of '1000-01-01 00:00:00' to '9999-12-31 23:59:59', and
#TIMESTAMP has a range of '1970-01-01 00:00:01' UTC to '2038-01-19 03:14:07' UTC. 


#Print out the current time:
SELECT CURTIME();

#Print out the current date (but not time).
SELECT CURDATE();

#Print out the current day of the week (#).
SELECT DAYOFWEEK(CURDATE());

#Print out the current day of the week (name).
SELECT DAYNAME(CURDATE());

#Print out the current day using the format: mm/dd/yyyy.
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y') AS 'mm/dd/yyyy';

#Print out the current day and time using using the format: Month Day @ Time (ex. Jan 4th at 4:45).
SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i') AS 'Month/Day @ Time';

#Create a tweets table that stores:
#+ The tweet content (text, 140 characters)
#+ A username (text)
#+ Time it was created (current time).

CREATE TABLE tweet_table (
        tweet_content VARCHAR(140),
        username VARCHAR(50),
        time_created TIMESTAMP DEFAULT NOW()
);

#Double check tweets table to check if it works:

INSERT INTO tweet_table (tweet_content, username)
VALUES ("Oh my gawd I'm having a blast at Coachella!", "basickel_e");

SELECT * FROM tweet_table;

#And we're done!