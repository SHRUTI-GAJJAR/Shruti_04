CREATE DATABASE HR;

USE HR;

CREATE TABLE DEPARTMENT
(
D_ID INT PRIMARY KEY,
D_NAME VARCHAR(15),
D_LOCATION VARCHAR(15)
);

CREATE TABLE EMPLOYE
(
E_ID INT PRIMARY KEY,
F_NAME VARCHAR(20),
L_NAME VARCHAR(20),
JOB_ID VARCHAR(20),
SALARY VARCHAR(10),
HIRE_DATE DATE,
MANAGER_ID INT,
DE_ID INT,
FOREIGN KEY(DE_ID) REFERENCES DEPARTMENT(D_ID)
);

USE HR;

ALTER TABLE EMPLOYE ADD COLUMN COMMISSION INT;

ALTER TABLE EMPLOYE ADD COLUMN MANAGER_NAME VARCHAR(50);

# page no : 1

# 1. Display all information in the tables EMP and DEPT. 

SELECT*FROM EMPLOYE;

SELECT*FROM DEPARTMENT;

# 2. Display only the hire date and employee name for each employee. 

SELECT F_NAME , HIRE_DATE FROM EMPLOYE;

/* 3. Display the ename concatenated with the job ID, separated by a comma and space, and 
name the column Employee and Title */

SELECT CONCAT_WS(",",F_NAME,L_NAME,JOB_ID) EMPLOYEE_AND_TITAL FROM EMPLOYE;

# 4. Display the hire date, name and department number for all clerks. 

SELECT F_NAME,HIRE_DATE,DE_ID,JOB_ID FROM EMPLOYE WHERE JOB_ID IN ("ST_CLERK","PU_CLERK","SH_CLERK"); 

/* 5. Create a query to display all the data from the EMP table. Separate each column by a 
comma. Name the column THE OUTPUT */

SELECT CONCAT_WS(",",E_ID, F_NAME, L_NAME, JOB_ID, SALARY, HIRE_DATE, MANAGER_ID, DE_ID, COMMISSION, MANAGER_NAME) THE_OUTPUT FROM EMPLOYE;


# 6. Display the names and salaries of all employees with a salary greater than 2000. 

SELECT F_NAME,L_NAME,SALARY FROM EMPLOYE WHERE SALARY > 7000;

/* 7. Display the names and dates of employees with the column headers "Name" and "Start 
Date" */


SELECT CONCAT_WS("_",F_NAME,L_NAME) AS NAME , HIRE_DATE AS START_DATE FROM EMPLOYE;

# 8. Display the names and hire dates of all employees in the order they were hired.

SELECT CONCAT_WS("_",F_NAME,L_NAME) NAMES ,HIRE_DATE FROM EMPLOYE ORDER BY HIRE_DATE ASC;

# 9. Display the names and salaries of all employees in reverse salary order. 

SELECT F_NAME,SALARY FROM EMPLOYE ORDER BY SALARY DESC;

/* 10. Display 'ename" and "deptno" who are all earned commission and display salary in 
reverse order.*/

SELECT F_NAME,SALARY,DE_ID FROM EMPLOYE WHERE COMMISSION IS NOT NULL ORDER BY SALARY DESC;

# 11. Display the last name and job title of all employees who do not have a manager 

SELECT L_NAME,JOB_ID FROM EMPLOYE WHERE MANAGER_ID IS NULL;

/* 12. Display the last name, job, and salary for all employees whose job is sales representative 
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000*/

SELECT L_NAME,JOB_ID,SALARY FROM EMPLOYE
WHERE (JOB_ID = 'SA_REP' OR JOB_ID = 'ST_CLERK') AND SALARY NOT IN (2500, 3500, 5000);
  
# PAGE NO - 2

# 1) Display the maximum, minimum and average salary and commission earned. 

SELECT 
   MAX(SALARY) TOTAL_MAX,
   MIN(SALARY) TOTAL_MAX,
   AVG(SALARY) TOTAL_AVG
   FROM EMPLOYE;
   
SELECT 
   MAX(COMMISSION) TOTAL_MAX,
   MIN(COMMISSION) TOTAL_MAX,
   AVG(COMMISSION) TOTAL_AVG
   FROM EMPLOYE;
   
/*   2) Display the department number, total salary payout and total commission payout for 
each department. */

SELECT DE_ID, SUM(SALARY) TOTAL_PAYOUT_SALARY, SUM(COMMISSION) TOTAL_PAYOUT_COMMISSION 
FROM EMPLOYE GROUP BY DE_ID;

# 3) Display the department number and number of employees in each department. 

USE HR;

SELECT D_NAME,D_ID, COUNT(E_ID) AS NUMBER_OF_EMPLOYE
FROM DEPARTMENT
INNER JOIN EMPLOYE
ON DEPARTMENT.D_ID = EMPLOYE.DE_ID
GROUP BY DEPARTMENT.D_ID;

# 4) Display the department number and total salary of employees in each department. 

SELECT DE_ID, SUM(SALARY) TOTAL_SALARY FROM EMPLOYE GROUP BY DE_ID;

/* 5) Display the employee's name who doesn't earn a commission. Order the result set 
without using the column name */

SELECT L_NAME FROM EMPLOYE WHERE COMMISSION IS NULL;

/* 6) Display the employees name, department id and commission. If an Employee doesn't 
earn the commission, then display as 'No commission'. Name the columns appropriately*/

SELECT F_NAME,DE_ID,
CASE 
    WHEN COMMISSION IS NULL THEN "NO COMISSION"
    ELSE "COMMISSION"
END AS "COMMISSION"
FROM EMPLOYE;

/* 7) Display the employee's name, salary and commission multiplied by 2. If an Employee 
doesn't earn the commission, then display as 'No commission. Name the columns 
appropriately*/

SELECT F_NAME AS NAME,SALARY,
CASE	
	WHEN COMMISSION IS NULL THEN "NO COMMISSION"
    ELSE COMMISSION * 2
    END AS COMMISSION
    FROM EMPLOYE;

/* 8) Display the employee's name, department id who have the first name same as another 
employee in the same department*/

USE HR;

SELECT F_NAME,DE_ID FROM EMPLOYE
JOIN EMPLOYE
ON EMPLOYE1.F_NAME = EMPLOYE2.F_NAME;

# 9) Display the sum of salaries of the employees working under each Manager. 

SELECT MANAGER_ID, SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYE GROUP BY MANAGER_ID;

/* 10) Select the Managers name, the count of employees working under and the department 
ID of the manager. */

SELECT MANAGER_ID, COUNT(E_ID) NOMBER_OF_EMPLOYE FROM EMPLOYE GROUP BY MANAGER_ID;

/* 11) Select the employee name, department id, and the salary. Group the result with the 
manager name and the 	employee last name should have second letter 'a! */

SELECT F_NAME,L_NAME,DE_ID,SALARY,MANAGER_NAME FROM EMPLOYE WHERE L_NAME LIKE "_a%";

/* 12) Display the average of sum of the salaries and group the result with the department id. 
Order the result with the department id. */

SELECT DE_ID, SUM(SALARY) FROM EMPLOYE GROUP BY DE_ID ORDER BY DE_ID;

SELECT DE_ID, AVG(SALARY) FROM EMPLOYE GROUP BY DE_ID ORDER BY DE_ID;

# 13) Select the maximum salary of each department along with the department id 

SELECT DE_ID, MAX(SALARY) FROM EMPLOYE GROUP BY DE_ID;

# 14) Display the commission, if not null display 10% of salary, if null display a default value 1

SELECT COMMISSION,
CASE 
    WHEN COMMISSION IS NOT NULL THEN SALARY * 0.10
	ELSE 1 
    END AS CALCULATED_COMMISSION
    FROM EMPLOYE;
 
# PAGE NO - 3

/* 1. Write a query that displays the employee's last names only from the string's 2-5th 
position with the first letter capitalized and all other letters lowercase, Give each column an 
appropriate label. */

SELECT L_NAME , UPPER(SUBSTRING(L_NAME, 2 ,1)) UPPER_NAME , LOWER(SUBSTRING(L_NAME, 3 ,3)) LOWER_NAME FROM EMPLOYE;

/* 2. Write a query that displays the employee's first name and last name along with a " in 
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
month on which the employee has joined.*/

SELECT CONCAT(F_NAME,"-",L_NAME) , MONTHNAME(HIRE_DATE) FROM EMPLOYE;

/*3. Write a query to display the employee's last name and if half of the salary is greater than 
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
1500 each. Provide each column an appropriate label. */

SELECT L_NAME, SALARY,

CASE 
    WHEN SALARY / 2 > 10000 THEN SALARY * 10% + 1500
    ELSE SALARY * 11.5% + 1500
    END AS "SALARY WITH BONUS"
FROM EMPLOYE;

/* 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
department id, salary and the manager name all in Upper case, if the Manager name 
consists of 'z' replace it with '$! */

SELECT E_ID, SUBSTRING(E_ID, 2 , "00") , SUBSTRING(E_ID, 3 , "E") , DE_ID,SALARY,MANAGER_NAME, UPPER(REPLACE(MANAGER_NAME,"Z", "$"))
FROM EMPLOYE;

/*5. Write a query that displays the employee's last names with the first letter capitalized and 
all other letters lowercase, and the length of the names, for all employees whose name 
starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
employees' last names */

SELECT L_NAME, UPPER(SUBSTRING(L_NAME , 1, 1)), LOWER(SUBSTRING(L_NAME, 2)), LENGTH(L_NAME)
FROM EMPLOYE 
WHERE L_NAME LIKE "J%" OR "A%" OR "M%" ORDER BY L_NAME ;

/*6. Create a query to display the last name and salary for all employees. Format the salary to 
be 15 characters long, left-padded with $. Label the column SALARY */

SELECT L_NAME, LPAD(L_NAME, 15, "$") SALARY FROM EMPLOYE;

# 7. Display the employee's name if it is a palindrome 

SELECT reverse(F_NAME) FROM EMPLOYE;

# 8. Display First names of all employees with initcaps. 
 
 SELECT inticap(F_NAME) FROM EMPLOYE;
 
/* 9. From LOCATIONS table, extract the word between first and second space from the 
STREET ADDRESS column. */

SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(dept_location , ' ', 2), ' ', -1)
 from location ;

/* 10. Extract first letter from First Name column and append it with the Last Name. Also add 
"@systechusa.com" at the end. Name the column as e-mail address. All characters should 
be in lower case. Display this along with their First Name. */

SELECT F_NAME, LOWER(LEFT(F_NAME, 1) || L_NAME || "@systechusa.com") "E-MAIL ADRESS" FROM EMPLOYE;

# 11. Display the names and job titles of all employees with the same job as Trenna. 

SELECT F_NAME,JOB_ID FROM EMPLOYE WHERE JOB_ID = (SELECT JOB_ID FROM EMPLOYE WHERE F_NAME = "Trenna");

/* 12. Display the names and department name of all employees working in the same city as 
Trenna.*/

SELECT F_NAME,D_NAME FROM EMPLOYE
JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID
WHERE D_LOCATION = (SELECT E_CITY FROM EMPLOYE WHERE F_NAME = "Trenna");

# 13. Display the name of the employee whose salary is the lowest. 

SELECT F_NAME,SALARY FROM EMPLOYE WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYE);

# 14. Display the names of all employees except the lowest paid.

SELECT F_NAME FROM EMPLOYE WHERE SALARY > (SELECT MIN(SALARY) FROM EMPLOYE);

# PAGE NO - 4

/* 1. Write a query to display the last name, department number, department name for all 
employees. */

SELECT L_NAME,DE_ID,D_NAME
FROM EMPLOYE
JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID;	

/* 2. Create a unique list of all jobs that are in department 4. Include the location of the 
department in the output.  */

SELECT JOB_ID,D_LOCATION FROM EMPLOYE
JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID;

/* 3. Write a query to display the employee last name,department name,location id and city of 
all employees who earn commission. */

SELECT L_NAME,D_NAME,D_LOCATION FROM EMPLOYE
JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID
WHERE COMMISSION IS NOT NULL;

/* 4. Display the employee last name and department name of all employees who have an 'a' 
in their last name */

SELECT L_NAME,D_NAME FROM EMPLOYE
JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID
WHERE L_NAME LIKE "%a";

/* 5. Write a query to display the last name,job,department number and department name for 
all employees who work in ATLANTA. */

SELECT L_NAME,JOB_ID,DE_ID,D_NAME,D_LOCATION FROM EMPLOYE
JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID
WHERE D_LOCATION = "Atlanta";

/* 6. Display the employee last name and employee number along with their manager's last 
name and manager number. */

SELECT L_NAME,E_ID,MANAGER_LNAME,MANAGER_ID FROM EMPLOYE
JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID;

/* 7. Display the employee last name and employee number along with their manager's last 
name and manager number (including the employees who have no manager). */

SELECT L_NAME,E_ID,MANAGER_LNAME,MANAGER_ID FROM EMPLOYE
LEFT JOIN DEPARTMENT
ON EMPLOYE.MANAGER_ID = EMPLOYE.MANAGER_LNAME;

/* 8. Create a query that displays employees last name,department number,and all the 
employees who work in the same department as a given employee. */

USE HR;

SELECT L_NAME,DE_ID FROM EMPLOYE
JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID;

/* 9. Create a query that displays the name,job,department name,salary,grade for all 
employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) */

SELECT F_NAME,JOB_ID,DE_ID,SALARY ,
CASE 
    WHEN SALARY >= 50000 THEN "A"
    WHEN SALARY >= 30000 THEN "B"
    ELSE "C"
    END AS GRADE
FROM EMPLOYE
JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID;

/* 10. Display the names and hire date for all employees who were hired before their 
managers along withe their manager names and hire date. Label the columns as Employee 
name, emp_hire_date,manager name,man_hire_date*/

ALTER TABLE EMPLOYE ADD COLUMN M_HIRE_DATE DATE;

SELECT F_NAME,HIRE_DATE,MANAGER_NAME,MANAGER_LNAME FROM EMPLOYE
JOIN DEPARTMENT 
ON EMPLOYE.MANAGER_ID = EMPLOYE.E_ID
WHERE HIRE_DATE < M_HIRE_DATE 
ORDER BY HIRE_DATE;

# PAGE NO - 5

/* 1. Write a query to display employee numbers and employee name (first name, last name) 
of all the sales employees who received an amount of 2000 in bonus. */

USE HR;

ALTER TABLE EMPLOYE ADD COLUMN E_BONUS VARCHAR(25) ;

SELECT E_ID,F_NAME,L_NAME FROM EMPLOYE 
JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID
WHERE E_BONUS = 2000;

/* 2. Fetch address details of employees belonging to the state CA. If address is null, provide 
default value N/A. */
 
SELECT  * , COALESCE(E_ADDRESS, "N/A") ADRESS FROM EMPLOYE;

-- USE DATABASE ADVENTURE_WORKS FOR TABLE PRODUCTS AND SALES

/* 3. Write a query that displays all the products along with the Sales OrderID even if an order 
has never been placed for that product. */

SELECT P_ID,P_NAME,S_ORDER_ID FROM PRODUCTS
LEFT JOIN SALES 
ON PRODUCT.P_ID = SALES.PS_ID;

# 4. Find the subcategories that have at least two different prices less than $15. 

/* 5. A. Write a query to display employees and their manager details. Fetch employee id, 
employee first name, and manager id, manager name.
B. Display the employee id and employee name of employees who do not have manager. */

SELECT E_ID,F_NAME,MANAGER_ID,MANAGER_NAME FROM EMPLOYE
LEFT JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID
WHERE MANAGER_ID IS NULL;

/* 6. A. Display the names of all products of a particular subcategory 15 and the names of their 
vendors.
B. Find the products that have more than one vendor. */

# 7. Find all the customers who do not belong to any store. 

SELECT C.CUSTOMER_ID, C.CUSTOMER_ID
FROM CUSTOMER 
LEFT JOIN STORE ON C.STORE_ID = S.STORE_ID
WHERE S.STORE_ID IS NULL;

/* 8. Find sales prices of product 718 that are less than the list price recommended for that 
product. */

SELECT SALES_PRICE
FROM SALES_TABLE
WHERE PRODUCT_ID = 718 AND SALES_PRICE < (
    SELECT LIST_PRICE 
    FROM PRODUCTS_TABLE 
    WHERE PRODUCT_ID = 718
);

# 9. Display product number, description and sales of each product in the year 2001. 

SELECT 
    P.PRODUCT_ID,
    P.DESCRIPTION,
    SUM(S.SALES_AMOUNT) AS TOTAL_SALES
FROM PRODUCTS P
JOIN SALES S ON P.PRODUCT_ID = S.PRODUCT_ID
WHERE YEAR(S.SALE_DATE) = 2001
GROUP BY 
    P.PRODUCT_ID,
    P.DESCRIPTION;

/* 10. Build the logic on the above question to extract sales for each category by year. Fetch 
Product Name, Sales_2001, Sales_2002, Sales_2003. */

SELECT 
    PRODUCT_NAME,
    SUM(CASE WHEN Year = 2001 THEN SALES ELSE 0 END) AS SALES_2001,
    SUM(CASE WHEN Year = 2002 THEN SALES ELSE 0 END) AS SALES_2002,
    SUM(CASE WHEN Year = 2003 THEN SALES ELSE 0 END) AS SALES_2003
FROM 
    SALES_DATE
GROUP BY 
    PRODUCT_NAME;

# PAGE NO - 6

/* 1. Write a query to display the last name and hire date of any employee in the same 
department as SALES. */

SELECT L_NAME,HIRE_DATE FROM EMPLOYE
JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID
WHERE D_NAME = "SALES";

/* 2. Create a query to display the employee numbers and last names of all employees who 
earn more than the average salary. Sort the results in ascending order of salary. */

SELECT E_ID,L_NAME FROM EMPLOYE 
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYE)
ORDER BY SALARY ASC;

/* 3. Write a query that displays the employee numbers and last names of all employees who 
work in a department with any employee whose last name contains a' u */

SELECT E_ID,L_NAME FROM EMPLOYE
WHERE DE_ID IN (SELECT DISTINCT DE_ID FROM EMPLOYE
WHERE L_NAME LIKE "%u%") ;

/* 4. Display the last name, department number, and job ID of all employees whose 
department location is ATLANTA. */

SELECT L_NAME,DE_ID,JOB_ID FROM EMPLOYE
JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID
WHERE D_LOCATION = "Atlanta";

# 5. Display the last name and salary of every employee who reports to FILLMORE. 

SELECT L_NAME,SALARY FROM EMPLOYE
WHERE SUPERVISIOR = "FILMORE";

/* 6. Display the department number, last name, and job ID for every employee in the 
OPERATIONS department. */

SELECT D_ID,L_NAME,JOB_ID FROM EMPLOYE
JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID
WHERE D_NAME = "Opration";

/* 7. Modify the above query to display the employee numbers, last names, and salaries of all 
employees who earn more than the average salary and who work in a department with any 
employee with a 'u'in their name. */

SELECT E_ID,L_NAME,SALARY FROM EMPLOYE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYE)
AND DE_ID IN (SELECT DE_ID FROM EMPLOYE WHERE L_NAME LIKE "%u%");

/* 8. Display the names of all employees whose job title is the same as anyone in the sales 
dept.*/

SELECT F_NAME,D_NAME FROM EMPLOYE 
JOIN DEPARTMENT
ON EMPLOYE.DE_ID = DEPARTMENT.D_ID
WHERE JOB_ID IN (SELECT JOB_ID FROM EMPLOYE WHERE D_NAME = "SALES") ;

/* 9. Write a compound query to produce a list of employees showing raise percentages, 
employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
given a 15% raise, and employees in department 6 are not given a raise. */

USE HR;

SELECT E_ID,SALARY,
CASE 
	WHEN DE_ID IN (1, 3) THEN '5%'
	WHEN DE_ID = 2 THEN '10%'
	WHEN DE_ID IN (4, 5) THEN '15%'
	ELSE '0%' 
 END AS RAISED_PERCENTAGE
 FROM EMPLOYE;
 
/* 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last 
names and salaries. */

SELECT L_NAME,SALARY FROM EMPLOYE
ORDER BY SALARY DESC LIMIT 3;

/* 11. Display the names of all employees with their salary and commission earned. Employees 
with a null commission should have O in the commission column */

SELECT F_NAME,SALARY FROM EMPLOYE WHERE COMMISSION = 0;

/* 12. Display the Managers (name) with top three salaries along with their salaries and 
department information.*/

SELECT MANAGER_NAME,SALARY,DE_ID FROM EMPLOYE 
ORDER BY SALARY LIMIT 3;

# PAGE NO - 7

/* 1. Find the date difference between the hire date and resignation date for all the 
employees. Display in no. of days, months and year(1 year 3 months 5 days). 
Emp ID Hire Date Resignation Date 
1 //200o 7/1o/2013 
2 4/12/2003 3/8/2017 
3 22/9/2012 21/6/2015 
4 13/4/2015 NULL 
5 03/06/2016 NULL 
6 08/08/2017 NULL 
7 13/11/2016 NULL   */     

SELECT E_ID, HIRE_DATE, R_DATE,
CONCAT(FLOOR(DATEDIFF(R_DATE, HIRE_DATE) / 365), ' years ',
FLOOR((DATEDIFF(R_DATE, HIRE_DATE) % 365) / 30), ' months ',
(DATEDIFF(R_DATE, HIRE_DATE) % 365) % 30, ' days'
) AS TIME_DIFF FROM EMPLOYE;

/* 2) Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd, 
yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900) */

SELECT HIRE_DATE, DATE_FORMAT(HIRE_DATE ,"%d / %m/ %Y") MON_DD FROM EMPLOYE;

/*3) Calcuate experience of the employee till date in Years and months
(example 1 year and 3 months)*/

SELECT 
    DATEDIFF(CURRENT_DATE, HIRE_DATE) / 365 AS years,
    (DATEDIFF(CURRENT_DATE, HIRE_DATE) % 365) / 30 AS months
FROM 
    EMPLOYE;

/*4) Display the count of days in the previous quarter*/

SELECT COUNT(curdate()), quarter(CURYEAR());

# 5) Fetch the previous Quarter's second week's first day's date

SET @StartOfPreviousQuarter = DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()) - 1, 0);
SET @EndOfPreviousQuarter = DATEADD(DAY, -1, DATEADD(QUARTER,
 DATEDIFF(QUARTER, 0, GETDATE()), 0));
SET @SecondWeekFirstDay = DATEADD(WEEK, 1, DATEADD(DAY, 1 - DATEPART
(WEEKDAY, DATEADD(DAY, 1, @StartOfPreviousQuarter)), @StartOfPreviousQuarter));
SELECT @SecondWeekFirstDay AS PreviousQuarterSecondWeekFirstDay;

# 6) Fetch the financial year's 15th week's dates (Format: Mon DD YYYY)

SET @FinancialYearStart = DATEADD(YEAR, CASE WHEN MONTH(GETDATE()) < 4 
THEN -1 ELSE 0 END, DATEFROMPARTS(YEAR(GETDATE()), 4, 1));
SET @FinancialYearEnd = DATEADD(DAY, -1, DATEADD(YEAR, 1, @FinancialYearStart));
SET @StartDateOfWeek15 = DATEADD(WEEK, 14, @FinancialYearStart);
SET @EndDateOfWeek15 = DATEADD(DAY, 6, @StartDateOfWeek15);
SELECT FORMAT(@StartDateOfWeek15, 'ddd MMM dd yyyy') AS StartDateOfWeek15,
FORMAT(@EndDateOfWeek15, 'ddd MMM dd yyyy') AS EndDateOfWeek15;

/*7) Find out the date that corresponds to the last Saturday of January, 
2015 using with clause. */

SELECT CAST('2015-01-01' AS DATE) AS Date 
UNION ALL SELECT DATEADD(DAY, 1, Date) 
FROM Calendar WHERE MONTH(Date) = 1 
WHERE DATENAME(WEEKDAY, Date) = 'Saturday';

# Use Airport Database :-

CREATE DATABASE AIRPORT;

USE AIRPORT;

CREATE TABLE FLIGHTS
(
 P_ID INT PRIMARY KEY,
 P_NAME VARCHAR(50),
 GENDER VARCHAR(50),
 FLIGHT_DATE DATE,
 DEPARTURE_TIME TIME,
 ARRITVAL_TIME TIME,
 DEPARTURE_AIRPORT VARCHAR(50),
 ARRIVAL_AIRPORT VARCHAR(50)
 );
 
# 8) Find the number of days elapsed between first and last flights of a passenger.

SELECT P_ID, DATEDIFF(DAY, MIN(FLIGHT_DATE), MAX(FLIGHT_DATE)) AS DAYS_ELAPSED
FROM FLIGHTS GROUP BY P_ID;

/*9) Find the total duration in minutes and in seconds of the flight from Rostov
 to Moscow.*/
 
SELECT SUM(DATEDIFF(MINUTE, DEPARTURE_TIME, ARRIVAL_TIME)),
SUM(DATEDIFF(SECOND, DEPARTURE_TIME, ARRIVAL_TIME))
FROM FLIGHTS
WHERE DEPARTURE_AIRPORT = 'Rostov' AND ARRIVAL_AIRPORT = 'Moscow';


















































































































































































































































































































































































































































 



    







	












