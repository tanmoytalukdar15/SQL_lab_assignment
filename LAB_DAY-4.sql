
-- ============================================
-- STUDENT, MSC AND MCA SQL ASSIGNMENT
-- MYSQL WORKBENCH
-- ============================================


-- 1. Display data from existing EMPLOYEE table.

SELECT * FROM employees;

-- If your table is named EMP or EMPLOYEE instead,
-- use SELECT * FROM EMP;
-- or SELECT * FROM EMPLOYEE;


-- 2. Display structure of EMPLOYEE table.

DESCRIBE employees;


-- 3. Create STUDENT table.

CREATE TABLE Student
(
    Roll DECIMAL(5,0),
    Name VARCHAR(30),
    Age DECIMAL(5,0),
    Course VARCHAR(5),
    Math DECIMAL(6,2),
    Physics DECIMAL(6,2),
    Computer DECIMAL(6,2),
    Birthday DATE
);


-- 4. Create MSc table with same structure
-- but without data.

CREATE TABLE MSc LIKE Student;


-- 5. Display structure of MSc table.

DESCRIBE MSc;


-- 6. Create MCA table with same structure.
-- Rename Name to First_Name and Course to Department.

CREATE TABLE MCA LIKE Student;

ALTER TABLE MCA
CHANGE Name First_Name VARCHAR(30),
CHANGE Course Department VARCHAR(5);


-- 7. Display structure of MCA table.

DESCRIBE MCA;


-- 8. Insert records into Student table.

INSERT INTO Student VALUES
(1, 'Rahul', 19, 'BCA', 79.5, 67, 89, '1993-06-15'),
(2, 'Kunal', 21, 'BCA', 68, 76, 59.5, '1991-08-16'),
(3, 'Aditi', 20, 'MSc', 90, 73, 56, '1992-09-20'),
(4, 'Sumit', 20, 'MCA', 57.5, 78, 81, '1991-12-07'),
(5, 'Anirban', 22, 'MCA', 80, 68, 63, '1994-09-15'),
(6, 'Kumkum', 21, 'BCA', 72, 54.5, 60, '1995-02-08'),
(7, 'Suman', 21, 'BCA', 91.5, 32, 61, '1994-03-10'),
(8, 'Rohit', 22, 'MSc', 85, 76, 92, '1992-04-19');


-- 9. Display all student details.

SELECT * FROM Student;


-- 10. Display details of student with Roll no 5.

SELECT *
FROM Student
WHERE Roll = 5;


-- 11. Display Roll, Name and marks of all subjects.

SELECT Roll, Name, Math, Physics, Computer
FROM Student;


-- 12. Display students belonging to BCA department.

SELECT *
FROM Student
WHERE Course = 'BCA';


-- 13. Insert MCA students from Student table.

INSERT INTO MCA
(Roll, First_Name, Age, Department, Math, Physics, Computer, Birthday)
SELECT Roll, Name, Age, Course, Math, Physics, Computer, Birthday
FROM Student
WHERE Course = 'MCA';


-- 14. Insert MSc students from Student table.

INSERT INTO MSc
SELECT *
FROM Student
WHERE Course = 'MSc';


-- 15. Display structure of Student and MCA tables.

DESCRIBE Student;

DESCRIBE MCA;


-- 16. Display all student details with Course first.

SELECT Course, Roll, Name, Age, Math, Physics, Computer, Birthday
FROM Student;


-- 17. Update Math marks of Roll no 7 from 91 to 95.

UPDATE Student
SET Math = 95
WHERE Roll = 7;


-- 18. Update name of Roll no 4 from Sumit to Sumitava in MCA.

UPDATE MCA
SET First_Name = 'Sumitava'
WHERE Roll = 4;


-- 19. Delete student details with Roll no 2.

DELETE FROM Student
WHERE Roll = 2;


-- 20. Delete all student records from Student table.

DELETE FROM Student;


-- ============================================
-- END OF ASSIGNMENT
-- ============================================
```