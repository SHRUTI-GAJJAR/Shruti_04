
/* (Module 4) DA - SQL - Introduction and Getting started with sql 
Assessment 1: */

CREATE DATABASE DPET;

USE DPET;

CREATE TABLE WORKER 
(
WORKER_ID INT PRIMARY KEY,
F_NAME VARCHAR(50), 
L_NAME VARCHAR(50), 
SALARY VARCHAR (10), 
JOINING_DATE DATE, 
DEPARTMENT VARCHAR(25) 
);

# QUERIES FOR WORKER TABLE 

/* 1. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME 
Ascending and DEPARTMENT Descending. */

SELECT * FROM WORKER ORDER BY F_NAME ASC,DEPARTMENT DESC;

/* 2.Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” 
from the Worker table. */

SELECT * FROM WORKER WHERE F_NAME IN ("VIPUL","SATISH") ;

/* 3. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and 
contains six alphabets. */

SELECT * FROM WORKER WHERE F_NAME LIKE "_____h";

# 4. Write an SQL query to print details of the Workers whose SALARY lies between 1. 

SELECT * FROM WORKER WHERE SALARY >= 1;
 
# 5. Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
 
SELECT F_NAME,L_NAME, COUNT(*) FROM WORKER
GROUP BY F_NAME,L_NAME HAVING COUNT(*) > 1 ;

# 6. Write an SQL query to show the top 6 records of a table. 

SELECT * FROM WORKER LIMIT 6;

# 7. Write an SQL query to fetch the departments that have less than five people in them. 

SELECT DEPARTMENT FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) < 5;

# 8. Write an SQL query to show all departments along with the number of people in there. 

SELECT WORKER_ID FROM WORKER GROUP BY WORKER_ID HAVING COUNT(WORKER_ID);

/* 9. Write an SQL query to print the name of employees having the highest salary in each 
department. */

SELECT F_NAME,L_NAME,SALARY FROM WORKER WHERE SALARY = (SELECT MAX(SALARY) FROM WORKER );



/* Question 2: Open school database, then select student table and use following SQL statements. 
TYPE THE STATEMENT, PRESS ENTER AND NOTE THE OUTPUT */

CREATE DATABASE SCHOOL;

USE SCHOOL;

CREATE TABLE STUDENTS
(
 STD_ID INT PRIMARY KEY, 
 STD_NAME VARCHAR(20), 
 SEX VARCHAR(10), 
 PERCENTAGE INT, 
 CLASS INT, 
 SEC VARCHAR(15), 
 STREAM_ VARCHAR(20), 
 DOB DATE
 );
 
# 1 To display all the records form STUDENT table. SELECT * FROM student ; 

SELECT*FROM STUDENTS;

/* 2. To display any name and date of birth from the table STUDENT. SELECT StdName, DOB 
FROM student ; */

SELECT STD_NAME, DOB FROM STUDENTS;

/* 3. To display all students record where percentage is greater of equal to 80 FROM student table. 
SELECT * FROM student WHERE percentage >= 80; */

SELECT  * FROM STUDENTS WHERE PERCENTAGE >= 80;

/* 4. To display student name, stream and percentage where percentage of student is more than 80 
SELECT StdName, Stream, Percentage WHERE percentage > 80; */

SELECT STD_NAME, STREAM_,PERCENTAGE FROM STUDENTS WHERE PERCENTAGE > 80;

/* 5. To display all records of science students whose percentage is more than 75 form student table. 
SELECT * FORM student WHERE stream = ‘Science’ AND percentage > 75;*/

SELECT * FROM STUDENTS WHERE STREAM_ = "SCIENCE" AND PERCENTAGE > 75;




























