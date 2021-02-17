#Feb 2021:

#Create a new db for joins exercises.
CREATE DATABASE joins;

USE joins

#First schema - 'students' with ID's and first_names, and 'papers' with titles, grades, and student_ID's.
CREATE TABLE students
    (student_ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     first_name VARCHAR(100)
    );
    
CREATE TABLE papers
    (titles VARCHAR(100),
     grades INT,
     student_ID INT,
     FOREIGN KEY (student_ID) REFERENCES students(student_ID)
    );


#Next we insert the following information into the 'students' and 'papers' tables.
INSERT INTO students (first_name) VALUES 
('Johnny'), ('Devin'), ('Julian'), ('Adam'), ('Star');

INSERT INTO papers (student_ID, titles, grades) VALUES
(1, 'My First Book Report', 65),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 93),
(3, 'House of Leaves Twenty Years Later', 99),
(4, 'Borges and Magical Realism', 88);


#In order to check that we did everything above correctly, let's print some tables!
SELECT * FROM students, papers 
WHERE students.student_ID = papers.student_ID;

#Print first_name, titles, and grades for students that submitted papers.
SELECT first_name, titles, grades 
FROM students, papers 
    WHERE students.student_ID = papers.student_ID
ORDER BY grades DESC;
#OR
SELECT first_name, titles, grades 
FROM students
INNER JOIN papers 
    ON students.student_ID = papers.student_ID
ORDER BY grades DESC;


#Print first_name, titles, and grades for ALL students.
SELECT first_name, titles, grades 
FROM students
LEFT JOIN papers
    ON students.student_ID = papers.student_ID;


#Print first_name, titles, and grades for all students with MISSING for title and 0 for grade.
SELECT first_name, IFNULL(titles,'MISSING') AS titles, IFNULL(grades,0) AS grades
FROM students
LEFT JOIN papers
    ON students.student_ID = papers.student_ID;


#Print first_name, and the average grade for every student.
SELECT first_name, IFNULL(AVG(grades),0) AS 'AVG GRADES'
FROM students
LEFT JOIN papers
    ON students.student_ID = papers.student_ID
GROUP BY students.student_ID;


#Print first_name, the average grade for every student, and a new column with PASSING/FAILING for passing_status with a threshold for P/F of >75%.