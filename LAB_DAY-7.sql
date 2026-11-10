-- ============================================
-- LAB ASSIGNMENT - 7
-- EMPLOYEE_DETAILS TABLE
-- MYSQL WORKBENCH
-- ============================================

CREATE DATABASE IF NOT EXISTS LAB7;
USE LAB7;

-- 1. CREATE EMPLOYEE_DETAILS TABLE

CREATE TABLE Employee_Details
(
    EMPLOYEE_ID INT NOT NULL,
    FIRST_NAME VARCHAR(20),
    LAST_NAME VARCHAR(25) NOT NULL,
    HIRE_DATE DATE NOT NULL,
    JOB_ID VARCHAR(10) NOT NULL,
    SALARY DECIMAL(8,2),
    COMMISSION_PCT DECIMAL(2,2),
    MANAGER_ID INT,
    DEPARTMENT_ID INT,

    CONSTRAINT PK_EMPLOYEE
    PRIMARY KEY (EMPLOYEE_ID)
);

-- INSERT 20 EMPLOYEE RECORDS

INSERT INTO Employee_Details VALUES
(100,'Steven','King','1987-06-17','AD_PRES',24000,NULL,NULL,90),
(101,'Neena','Kochhar','1989-09-21','AD_VP',17000,NULL,100,90),
(102,'Lex','De Haan','1993-01-13','AD_VP',17000,NULL,100,90),
(103,'Alexander','Hunold','1990-01-03','IT_PROG',9000,NULL,102,60),
(104,'Bruce','Ernst','1991-05-21','IT_PROG',6000,NULL,103,60),
(107,'Diana','Lorentz','1999-02-07','IT_PROG',4200,NULL,103,60),
(124,'Kevin','Mourgos','1999-11-16','ST_MAN',5800,NULL,100,50),
(141,'Trenna','Rajs','1995-10-17','ST_CLERK',3500,NULL,124,50),
(142,'Curtis','Davies','1997-01-29','ST_CLERK',3100,NULL,124,50),
(143,'Randall','Matos','1998-03-15','ST_CLERK',2600,NULL,124,50),
(144,'Peter','Vargas','1998-07-09','ST_CLERK',2500,NULL,124,50),
(149,'Eleni','Zlotkey','2000-01-29','SA_MAN',10500,0.20,100,80),
(174,'Ellen','Abel','1996-05-11','SA_REP',11000,0.30,149,80),
(176,'Jonathon','Taylor','1998-03-24','SA_REP',8600,0.20,149,80),
(178,'Kimberely','Grant','1999-05-24','AD_ASST',4400,NULL,101,10),
(200,'Jennifer','Whalen','1987-09-17','MK_MAN',13000,NULL,100,20),
(201,'Michael','Hartstein','1996-02-17','MK_REP',6000,NULL,100,20),
(202,'Pat','Fay','1997-08-17','AC_MGR',12000,NULL,101,110),
(205,'Shelley','Higgins','1994-06-07','AC_ACCOUNT',8300,NULL,101,110),
(206,'William','Gietz','1994-06-07','AC_ACCOUNT',8300,NULL,205,110);

-- DISPLAY ALL RECORDS

SELECT * FROM Employee_Details;

-- ============================================
-- 2. LOWER CASE FIRST NAME
-- DEPARTMENT 20, 50 OR 80
-- ============================================

SELECT LOWER(FIRST_NAME) AS First_Name
FROM Employee_Details
WHERE DEPARTMENT_ID IN (20,50,80);

-- ============================================
-- 3. UPPER CASE LAST NAME
-- DEPARTMENT 10, 110 OR 60
-- ============================================

SELECT UPPER(LAST_NAME) AS Last_Name
FROM Employee_Details
WHERE DEPARTMENT_ID IN (10,110,60);

-- ============================================
-- 4. DISPLAY JOB_ID IN Sa_Rep FORMAT
-- ============================================

SELECT CONCAT(
    UPPER(LEFT(SUBSTRING_INDEX(JOB_ID,'_',1),1)),
    LOWER(SUBSTRING(SUBSTRING_INDEX(JOB_ID,'_',1),2)),
    '_',
    UPPER(LEFT(SUBSTRING_INDEX(JOB_ID,'_',-1),1)),
    LOWER(SUBSTRING(SUBSTRING_INDEX(JOB_ID,'_',-1),2))
) AS Job_Format
FROM Employee_Details;

-- ============================================
-- 5. CONCATENATE FIRST NAME AND LAST NAME
-- ============================================

SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) AS Employee_Name
FROM Employee_Details;

-- ============================================
-- 6. LENGTH OF LAST NAME OF EMPLOYEES
-- WHO GET COMMISSION
-- ============================================

SELECT LAST_NAME, LENGTH(LAST_NAME) AS Name_Length
FROM Employee_Details
WHERE COMMISSION_PCT IS NOT NULL;

-- ============================================
-- 7. POSITION OF LETTER 'a' IN FIRST NAME
-- ============================================

SELECT FIRST_NAME,
       LOCATE('a',FIRST_NAME) AS Position
FROM Employee_Details;

-- ============================================
-- 8. CONCATENATED NAME, LAST NAME LENGTH
-- AND POSITION OF 'a' IN LAST NAME
-- FOR EMPLOYEES WHOSE JOB_ID CONTAINS CLERK
-- ============================================

SELECT
CONCAT(FIRST_NAME,' ',LAST_NAME) AS Employee_Name,
LENGTH(LAST_NAME) AS Name_Length,
LOCATE('a',LAST_NAME) AS Position
FROM Employee_Details
WHERE JOB_ID LIKE '%CLERK%';

-- ============================================
-- 9. DISPLAY SALARY IN 10 DIGITS
-- PAD WITH $ ON LEFT OR RIGHT
-- ============================================

SELECT
SALARY,
LPAD(SALARY,10,'$') AS Left_Padded,
RPAD(SALARY,10,'$') AS Right_Padded
FROM Employee_Details;

-- ============================================
-- 10. TRIM 'e' FROM FIRST NAME
-- ============================================

SELECT TRIM(BOTH 'e' FROM FIRST_NAME) AS Trimmed
FROM Employee_Details
WHERE FIRST_NAME LIKE '%e%';

-- ============================================
-- 11. DEPARTMENT, SALARY AND HIRE DATE
-- FIRST NAME CONTAINS EXACTLY 6 CHARACTERS
-- ============================================

SELECT
DEPARTMENT_ID,
SALARY,
DATE_FORMAT(HIRE_DATE,'%d-%b-%Y') AS Hire_Date
FROM Employee_Details
WHERE CHAR_LENGTH(FIRST_NAME)=6;

-- ============================================
-- 12. JOB_ID AND POSITION OF 'e'
-- IN FIRST NAME
-- ============================================

SELECT
JOB_ID,
LOCATE('e',FIRST_NAME) AS Position
FROM Employee_Details
WHERE FIRST_NAME LIKE '%e%';

-- ============================================
-- 13. LAST NAME WHERE REP STARTS
-- AT FOURTH POSITION OF JOB_ID
-- ============================================

SELECT LAST_NAME
FROM Employee_Details
WHERE SUBSTRING(JOB_ID,4,3)='REP';

-- ============================================
-- 14. REMAINDER OF SALARY DIVIDED BY 3000
-- FOR SALES REPRESENTATIVES
-- ============================================

SELECT
LAST_NAME,
MOD(SALARY,3000) AS Remainder
FROM Employee_Details
WHERE JOB_ID='SA_REP';

-- ============================================
-- 15. DISPLAY SALARY IN $7,000.00 FORMAT
-- ============================================

SELECT CONCAT('$',FORMAT(SALARY,2)) AS Formatted_Salary
FROM Employee_Details;

-- ============================================
-- 16. DISPLAY SALARY IN $7000 FORMAT
-- DEPARTMENT 60, 90 OR 110
-- ============================================

SELECT
CONCAT('$',CAST(SALARY AS UNSIGNED)) AS Formatted_Salary
FROM Employee_Details
WHERE DEPARTMENT_ID IN (60,90,110);

-- ============================================
-- 17. DISPLAY COMMISSION
-- IF NO COMMISSION DISPLAY NO COMMISSION
-- ============================================

SELECT
LAST_NAME,
IFNULL(CAST(COMMISSION_PCT AS CHAR),'No Commission') AS COMM
FROM Employee_Details;

-- ============================================
-- 18. NUMBER OF DAYS ELAPSED
-- BETWEEN TODAY AND HIRE DATE
-- ============================================

SELECT
LAST_NAME,
ROUND(DATEDIFF(CURDATE(),HIRE_DATE)) AS Days_Elapsed
FROM Employee_Details;

-- ============================================
-- 19. NUMBER OF WEEKS ELAPSED
-- ============================================

SELECT
LAST_NAME,
ROUND(DATEDIFF(CURDATE(),HIRE_DATE)/7,2) AS Weeks_Elapsed
FROM Employee_Details;

-- ============================================
-- 20. NUMBER OF YEARS ELAPSED
-- ============================================

SELECT
LAST_NAME,
ROUND(DATEDIFF(CURDATE(),HIRE_DATE)/365.25) AS Years_Elapsed
FROM Employee_Details;

-- ============================================
-- 21. EMPLOYEE NAME AND MONTHS WORKED
-- ============================================

SELECT
CONCAT(FIRST_NAME,' ',LAST_NAME) AS Employee_Name,
TIMESTAMPDIFF(MONTH,HIRE_DATE,CURDATE()) AS MONTHS_WORKED
FROM Employee_Details;

-- ============================================
-- 22. EMPLOYEE NAME AND LAST DAY OF
-- THE MONTH IN WHICH EMPLOYEE WAS HIRED
-- ============================================

SELECT
CONCAT(FIRST_NAME,' ',LAST_NAME) AS Employee_Name,
LAST_DAY(HIRE_DATE) AS Last_Day
FROM Employee_Details;

-- ============================================
-- 23. DISPLAY HIRING YEAR IN WORDS
-- ============================================

SELECT
CONCAT(FIRST_NAME,' ',LAST_NAME) AS Employee_Name,
CASE YEAR(HIRE_DATE)
    WHEN 1987 THEN 'Nineteen Eighty-Seven'
    WHEN 1989 THEN 'Nineteen Eighty-Nine'
    WHEN 1990 THEN 'Nineteen Ninety'
    WHEN 1991 THEN 'Nineteen Ninety-One'
    WHEN 1993 THEN 'Nineteen Ninety-Three'
    WHEN 1994 THEN 'Nineteen Ninety-Four'
    WHEN 1995 THEN 'Nineteen Ninety-Five'
    WHEN 1996 THEN 'Nineteen Ninety-Six'
    WHEN 1997 THEN 'Nineteen Ninety-Seven'
    WHEN 1998 THEN 'Nineteen Ninety-Eight'
    WHEN 1999 THEN 'Nineteen Ninety-Nine'
    WHEN 2000 THEN 'Two Thousand'
    ELSE CAST(YEAR(HIRE_DATE) AS CHAR)
END AS Hiring_Year
FROM Employee_Details;

-- ============================================
-- 24. DATE FIVE MONTHS LATER FROM TODAY
-- ============================================

SELECT DATE_ADD(CURDATE(),INTERVAL 5 MONTH) AS `FUTURE DATE`;

-- ============================================
-- 25. EMPLOYEE NAME, DAY AND DATE OF JOINING
-- ============================================

SELECT
CONCAT(FIRST_NAME,' ',LAST_NAME) AS Employee_Name,
DAYNAME(HIRE_DATE) AS Joining_Day,
DATE_FORMAT(HIRE_DATE,'%d-%b-%Y') AS Joining_Date
FROM Employee_Details;

-- ============================================
-- 26. ANNUAL SALARY AND ROUNDED ANNUAL SALARY
-- ============================================

SELECT
CONCAT(FIRST_NAME,' ',LAST_NAME) AS Employee_Name,
(SALARY*12)+IFNULL(COMMISSION_PCT,0) AS Annual_Salary,
ROUND((SALARY*12)+IFNULL(COMMISSION_PCT,0),2)
AS Rounded_Annual_Salary
FROM Employee_Details;

-- ============================================
-- END OF LAB ASSIGNMENT - 7
-- ============================================
```