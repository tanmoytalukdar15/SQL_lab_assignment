-- ============================================
-- LAB ASSIGNMENT - 8
-- SET OPERATORS
-- MYSQL WORKBENCH
-- ============================================

CREATE DATABASE IF NOT EXISTS LAB8;
USE LAB8;


-- ============================================
-- 1. CREATE SPORTS_STUD TABLE
-- ============================================

CREATE TABLE Sports_Stud
(
    ROLL INT,
    NAME VARCHAR(30),
    DEPT VARCHAR(5),
    SPORTS_FEE INT,

    CONSTRAINT PK_SPORTS PRIMARY KEY (ROLL),

    CONSTRAINT UQ_SPORTS_NAME UNIQUE (NAME),

    CONSTRAINT CHK_SPORTS_DEPT
    CHECK (DEPT IN ('IT','CS')),

    CONSTRAINT CHK_SPORTS_FEE
    CHECK (SPORTS_FEE >= 1000)
);


-- INSERT DATA INTO SPORTS_STUD

INSERT INTO Sports_Stud VALUES
(1,'Aman','IT',1200),
(7,'Anurag','CS',1500),
(2,'Binay','IT',1000),
(8,'Chiranjit','CS',1700);


-- ============================================
-- CREATE CULTURAL_STUD TABLE
-- ============================================

CREATE TABLE Cultural_Stud
(
    ROLL INT,
    NAME VARCHAR(30),
    DEPT VARCHAR(5),
    CUL_FEES INT,

    CONSTRAINT PK_CULTURAL PRIMARY KEY (ROLL),

    CONSTRAINT UQ_CULTURAL_NAME UNIQUE (NAME),

    CONSTRAINT CHK_CULTURAL_DEPT
    CHECK (DEPT IN ('IT','CS')),

    CONSTRAINT CHK_CULTURAL_FEES
    CHECK (CUL_FEES >= 600)
);


-- INSERT DATA INTO CULTURAL_STUD

INSERT INTO Cultural_Stud VALUES
(1,'Aman','IT',700),
(2,'Binay','IT',700),
(3,'Bipul','CS',600),
(4,'Joy','CS',600),
(5,'Surojit','IT',700),
(6,'Wasim','CS',600);


-- DISPLAY BOTH TABLES

SELECT * FROM Sports_Stud;

SELECT * FROM Cultural_Stud;


-- ============================================
-- 2. DISPLAY ALL DISTINCT STUDENTS
-- USING UNION
-- ============================================

SELECT ROLL, NAME, DEPT
FROM Sports_Stud

UNION

SELECT ROLL, NAME, DEPT
FROM Cultural_Stud;


-- ============================================
-- 3. DISPLAY ALL STUDENTS INCLUDING DUPLICATES
-- USING UNION ALL
-- ============================================

SELECT ROLL, NAME, DEPT
FROM Sports_Stud

UNION ALL

SELECT ROLL, NAME, DEPT
FROM Cultural_Stud;


-- ============================================
-- 4. DISPLAY STUDENTS WORKING IN BOTH GROUPS
-- USING INTERSECT
-- ============================================

SELECT ROLL, NAME, DEPT
FROM Sports_Stud

INTERSECT

SELECT ROLL, NAME, DEPT
FROM Cultural_Stud;


-- ============================================
-- 5. DISPLAY STUDENTS WORKING ONLY IN SPORTS
-- USING EXCEPT
-- ============================================

SELECT ROLL, NAME, DEPT
FROM Sports_Stud

EXCEPT

SELECT ROLL, NAME, DEPT
FROM Cultural_Stud;


-- ============================================
-- 6. DISPLAY STUDENTS WORKING ONLY IN CULTURAL
-- USING EXCEPT
-- ============================================

SELECT ROLL, NAME, DEPT
FROM Cultural_Stud

EXCEPT

SELECT ROLL, NAME, DEPT
FROM Sports_Stud;


-- ============================================
-- 7. DISPLAY ROLL, SPORTS FEE AND CULTURAL FEE
-- OF STUDENTS WORKING IN BOTH GROUPS
-- ============================================

SELECT
S.ROLL,
S.SPORTS_FEE,
C.CUL_FEES
FROM Sports_Stud S
INNER JOIN Cultural_Stud C
ON S.ROLL = C.ROLL;


-- ============================================
-- 8. ADD BIRTHDAY COLUMN TO BOTH TABLES
-- ============================================

ALTER TABLE Sports_Stud
ADD BIRTHDAY DATE;

ALTER TABLE Cultural_Stud
ADD BIRTHDAY DATE;


-- INSERT BIRTHDAY DATA INTO SPORTS_STUD

UPDATE Sports_Stud
SET BIRTHDAY = CASE ROLL
    WHEN 1 THEN '2004-05-15'
    WHEN 7 THEN '2003-08-20'
    WHEN 2 THEN '2004-11-10'
    WHEN 8 THEN '2003-03-25'
END;


-- INSERT BIRTHDAY DATA INTO CULTURAL_STUD

UPDATE Cultural_Stud
SET BIRTHDAY = CASE ROLL
    WHEN 1 THEN '2004-05-15'
    WHEN 2 THEN '2004-11-10'
    WHEN 3 THEN '2003-07-12'
    WHEN 4 THEN '2004-01-18'
    WHEN 5 THEN '2003-09-22'
    WHEN 6 THEN '2004-12-05'
END;


-- DISPLAY UPDATED TABLES

SELECT * FROM Sports_Stud;

SELECT * FROM Cultural_Stud;


-- ============================================
-- 9. DISPLAY DISTINCT STUDENT NAME, AGE
-- AND MONTH OF BIRTH
-- ============================================

SELECT