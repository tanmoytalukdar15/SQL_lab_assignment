-- ==========================================
-- EMPLOYEE TABLE ASSIGNMENT
-- ==========================================

-- 1. Create EMPLOYEE table

CREATE TABLE EMPLOYEE
(
    EMPLOYEE_ID NUMBER(6),
    LAST_NAME VARCHAR2(25),
    JOB_ID VARCHAR2(10),
    SALARY NUMBER(8,2),
    COMM_PCT NUMBER(4,2),
    MGR_ID NUMBER(6),
    DEPARTMENT_ID NUMBER(4)
);


-- 2. Insert records into EMPLOYEE table

INSERT INTO EMPLOYEE VALUES (198, 'Connell', 'SH_CLERK', 2600, 2.5, 124, 50);

INSERT INTO EMPLOYEE VALUES (199, 'Grant', 'SH_CLERK', 2600, 2.2, 124, 50);

INSERT INTO EMPLOYEE VALUES (200, 'Whalen', 'AD_ASST', 4400, 1.3, 101, 10);

INSERT INTO EMPLOYEE VALUES (201, 'Hartstein', 'IT_PROG', 6000, NULL, 100, 20);

INSERT INTO EMPLOYEE VALUES (202, 'Fay', 'AC_MGR', 6500, NULL, 210, 20);

INSERT INTO EMPLOYEE VALUES (203, 'Mavris', 'AD_VP', 7500, NULL, 101, 40);

INSERT INTO EMPLOYEE VALUES (204, 'Baer', 'AD_PRES', 3500, 1.5, 101, 90);

INSERT INTO EMPLOYEE VALUES (205, 'Higgins', 'AC_MGR', 2300, NULL, 101, 60);

INSERT INTO EMPLOYEE VALUES (206, 'Gitz', 'IT_PROG', 5000, NULL, 103, 60);

INSERT INTO EMPLOYEE VALUES (100, 'King', 'AD_ASST', 8956, 0.3, 108, 100);

INSERT INTO EMPLOYEE VALUES (101, 'Kochar', 'SH_CLERK', 3400, 1.3, 118, 30);

COMMIT;


-- 3. Display employee_id, last_name and job_id

SELECT EMPLOYEE_ID, LAST_NAME, JOB_ID
FROM EMPLOYEE;


-- 4. Display all employees of department 60

SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT_ID = 60;


-- 5. Display employee details whose last name is King

SELECT *
FROM EMPLOYEE
WHERE LAST_NAME = 'King';


-- 6. Display unique job_id with alias JOB_TITLE

SELECT DISTINCT JOB_ID AS JOB_TITLE
FROM EMPLOYEE;


-- 7. Display last_name, salary and salary increased by 300

SELECT LAST_NAME, SALARY, SALARY + 300 AS "Increased Salary"
FROM EMPLOYEE;


-- 8. Display annual compensation with one-time bonus of 100

SELECT LAST_NAME, SALARY,
       (SALARY * 12) + 100 AS "Annual Compensation"
FROM EMPLOYEE;


-- 9. Display employees who get commission

SELECT *
FROM EMPLOYEE
WHERE COMM_PCT IS NOT NULL;


-- 10. Display employees who do not get commission

SELECT *
FROM EMPLOYEE
WHERE COMM_PCT IS NULL;


-- 11. Display employee_id, department_id and salary
-- of employees whose salary is greater than 5000

SELECT EMPLOYEE_ID, DEPARTMENT_ID, SALARY
FROM EMPLOYEE
WHERE SALARY > 5000;


-- 12. Display last_name and salary between 4000 and 7000

SELECT LAST_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 4000 AND 7000;


-- 13. Display employees whose salary is 6000, 6500 or 7000

SELECT *
FROM EMPLOYEE
WHERE SALARY IN (6000, 6500, 7000);


-- 14. Display employees working in departments 10, 20, 30 or 50

SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT_ID IN (10, 20, 30, 50);


-- 15. Display employees whose salary is not equal to 5000

SELECT *
FROM EMPLOYEE
WHERE SALARY <> 5000;


-- 16. Display all clerks working in the organization

SELECT *
FROM EMPLOYEE
WHERE JOB_ID LIKE '%CLERK%';


-- 17. Display employees who are clerks, programmers or assistants

SELECT *
FROM EMPLOYEE
WHERE JOB_ID LIKE '%CLERK%'
   OR JOB_ID LIKE '%PROG%'
   OR JOB_ID LIKE '%ASST%';


-- 18. Display clerks whose salary is less than 3000

SELECT *
FROM EMPLOYEE
WHERE JOB_ID LIKE '%CLERK%'
AND SALARY < 3000;


-- 19. Display last_name and mgr_id of employees
-- whose salary is above 3000 and work under manager 101

SELECT LAST_NAME, MGR_ID
FROM EMPLOYEE
WHERE SALARY > 3000
AND MGR_ID = 101;


-- 20. Update job_id to Grade_A for employees
-- whose salary is greater than 5000

UPDATE EMPLOYEE
SET JOB_ID = 'Grade_A'
WHERE SALARY > 5000;

COMMIT;


-- Display EMPLOYEE table after updating

SELECT *
FROM EMPLOYEE;