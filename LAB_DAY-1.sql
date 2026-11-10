CREATE DATABASE LAB;
USE LAB;
CREATE TABLE EMP1(
ID INT CHECK(ID BETWEEN 0 AND 99),
Name VARCHAR(10),
Basic DECIMAL(6,2),
Designation VARCHAR(10),
Age INT CHECK(AGE BETWEEN 0 AND 99));

DROP TABLE EMP1;
DESCRIBE EMP1;

ALTER TABLE EMP1
MODIFY Basic INT;

ALTER TABLE EMP1
MODIFY Name VARCHAR(15);

CREATE TABLE EMP_trainee(
Emp_ID INT CHECK(Emp_ID BETWEEN 0 AND 99),
Name VARCHAR(15),
Basic INT,
Designation VARCHAR(10),
Age INT CHECK(AGE BETWEEN 0 AND 99));

INSERT INTO EMP1
(ID,Name,Basic,Designation,Age)
VALUES 
(1,"Rohit",6700,"Manager",24),
(2,"sunil",6200,"engineer",27),
(3,"payel",6300,"enginner",26),
(4,"kunal",6700,"trainee",28),
(5,"sunita",6230,"trainee",26),
(6,"bimal",7000,"trainee",25);
SELECT * FROM EMP1;

INSERT INTO EMP_trainee (Emp_ID,Name,Basic,Designation,Age)
SELECT ID, Name, Basic,Designation,Age
FROM EMP1
WHERE Designation = "Trainee";
SELECT * FROM EMP_trainee;