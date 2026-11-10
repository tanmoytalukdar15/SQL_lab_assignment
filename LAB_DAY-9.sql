-- ============================================
-- LAB ASSIGNMENT - 9
-- RETRIEVING DATA FROM MULTIPLE TABLES
-- MYSQL WORKBENCH
-- ============================================

CREATE DATABASE IF NOT EXISTS Lab_Assignment_10;
USE Lab_Assignment_10;

-- ============================================
-- QUESTION 1: CREATE TABLES
-- ============================================

-- Remove old tables if they already exist
DROP TABLE IF EXISTS Invoice;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Customer;


-- A) CREATE CUSTOMER TABLE

CREATE TABLE Customer (
    Cust_id VARCHAR(5) PRIMARY KEY,
    Fname VARCHAR(20) NOT NULL,
    Lname VARCHAR(20),
    Area VARCHAR(10) NOT NULL,
    Phone VARCHAR(15),
    CONSTRAINT chk_cust_id CHECK (Cust_id LIKE 'A%')
);


-- B) CREATE MOVIE TABLE

CREATE TABLE Movie (
    Mv_no INT PRIMARY KEY,
    Title VARCHAR(30) NOT NULL,
    Movie_Type VARCHAR(20) NOT NULL,
    Star VARCHAR(30) NOT NULL,
    Price DECIMAL(6,2) NOT NULL
);


-- C) CREATE INVOICE TABLE

CREATE TABLE Invoice (
    Inv_no VARCHAR(5) PRIMARY KEY,
    Mv_no INT,
    Cust_id VARCHAR(5),
    Issue_date DATE NOT NULL,
    Return_date DATE NOT NULL,

    CONSTRAINT fk_invoice_movie
    FOREIGN KEY (Mv_no) REFERENCES Movie(Mv_no),

    CONSTRAINT fk_invoice_customer
    FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id),

    CONSTRAINT chk_invoice_no CHECK (Inv_no LIKE 'I%')
);


-- ============================================
-- INSERT CUSTOMER RECORDS
-- ============================================

INSERT INTO Customer VALUES
('A01', 'Ivan', 'Bayross', 'SA', '6125467'),
('A02', 'Vandana', 'Saiteal', 'MU', '5560379'),
('A03', 'Pramada', 'Jauguste', 'DA', '4560389'),
('A04', 'Basu', 'Navindi', 'BA', '6125401'),
('A05', 'Ravi', 'Shreedhar', 'NA', NULL),
('A06', 'Rukmini', NULL, 'GH', '5125274');


-- ============================================
-- INSERT MOVIE RECORDS
-- ============================================

INSERT INTO Movie VALUES
(1, 'Bloody', 'Action', 'JC', 181),
(2, 'The Firm', 'Thriller', 'TC', 200),
(3, 'Pretty Woman', 'Romance', 'RG', 151),
(4, 'Home Alone', 'Comedy', 'MC', 150),
(5, 'The Fugitive', 'Thriller', 'MF', 200),
(6, 'Coma', 'Suspense', 'MD', 100),
(7, 'Dracula', 'Horror', 'GO', 150),
(8, 'Quick Change', 'Comedy', 'BM', 100),
(9, 'Gone with the Wind', 'Action', 'CB', 200),
(10, 'Carry on Doctor', 'Comedy', 'LP', 100);


-- ============================================
-- INSERT INVOICE RECORDS
-- ============================================

INSERT INTO Invoice VALUES
('I01', 4, 'A01', '1993-07-23', '1993-07-25'),
('I02', 3, 'A02', '1993-08-12', '1993-08-15'),
('I03', 1, 'A02', '1993-08-15', '1993-08-18'),
('I04', 6, 'A03', '1993-09-10', '1993-09-13'),
('I05', 7, 'A04', '1993-08-05', '1993-08-08'),
('I06', 2, 'A06', '1993-09-18', '1993-09-21'),
('I07', 9, 'A05', '1993-07-07', '1993-07-10'),
('I08', 9, 'A01', '1993-08-11', '1993-08-14'),
('I09', 5, 'A03', '1993-07-06', '1993-07-09'),
('I10', 8, 'A06', '1993-09-03', '1993-09-06');


-- ============================================
-- GROUP A
-- ============================================

-- QUESTION 2
-- Display customer names and movie numbers
-- of all customers who have been issued a movie.

SELECT C.Fname, C.Lname, I.Mv_no
FROM Customer C
JOIN Invoice I
ON C.Cust_id = I.Cust_id;


-- QUESTION 3
-- Display movie number and title issued to Ivan.

SELECT M.Mv_no, M.Title
FROM Movie M
JOIN Invoice I
ON M.Mv_no = I.Mv_no
JOIN Customer C
ON I.Cust_id = C.Cust_id
WHERE C.Fname = 'Ivan';


-- QUESTION 4
-- Display title, customer id and movie number
-- for all movies that are issued.

SELECT M.Title, I.Cust_id, I.Mv_no
FROM Movie M
JOIN Invoice I
ON M.Mv_no = I.Mv_no;


-- QUESTION 5
-- Display title and type of movies issued to Vandana.

SELECT M.Title, M.Movie_Type
FROM Movie M
JOIN Invoice I
ON M.Mv_no = I.Mv_no
JOIN Customer C
ON I.Cust_id = C.Cust_id
WHERE C.Fname = 'Vandana';


-- QUESTION 6
-- Find names of customers issued Action movies.

SELECT DISTINCT C.Fname, C.Lname
FROM Customer C
JOIN Invoice I
ON C.Cust_id = I.Cust_id
JOIN Movie M
ON I.Mv_no = M.Mv_no
WHERE M.Movie_Type = 'Action';


-- QUESTION 7
-- Display movie title, last name and first name
-- for movie number >= 3 in the given format.

SELECT CONCAT(
    'The movie taken by ',
    C.Fname, ' ', C.Lname,
    ' is ', M.Title, '.'
) AS Movie_Details
FROM Customer C
JOIN Invoice I
ON C.Cust_id = I.Cust_id
JOIN Movie M
ON I.Mv_no = M.Mv_no
WHERE M.Mv_no >= 3;


-- QUESTION 8
-- Display customer issued movie having invoice I10.

SELECT C.*
FROM Customer C
JOIN Invoice I
ON C.Cust_id = I.Cust_id
WHERE I.Inv_no = 'I10';


-- QUESTION 9
-- Display customer name, phone and area
-- who have been issued a movie before August.

SELECT DISTINCT C.Fname, C.Lname, C.Phone, C.Area
FROM Customer C
JOIN Invoice I
ON C.Cust_id = I.Cust_id
WHERE I.Issue_date < '1993-08-01';


-- QUESTION 10
-- Display movie number and title issued to
-- Ivan, Vandana and Ravi.

SELECT DISTINCT M.Mv_no, M.Title
FROM Movie M
JOIN Invoice I
ON M.Mv_no = I.Mv_no
JOIN Customer C
ON I.Cust_id = C.Cust_id
WHERE C.Fname IN ('Ivan', 'Vandana', 'Ravi');


-- QUESTION 11
-- List movie number and movie name issued to customers.

SELECT DISTINCT M.Mv_no, M.Title
FROM Movie M
JOIN Invoice I
ON M.Mv_no = I.Mv_no;


-- QUESTION 12
-- Find type and movie numbers issued to A01 and A02.

SELECT DISTINCT M.Movie_Type, M.Mv_no
FROM Movie M
JOIN Invoice I
ON M.Mv_no = I.Mv_no
WHERE I.Cust_id IN ('A01', 'A02');


-- QUESTION 13
-- Find if movie whose star is Tom Cruise
-- has been issued to any customer.

SELECT C.Cust_id
FROM Customer C
JOIN Invoice I
ON C.Cust_id = I.Cust_id
JOIN Movie M
ON I.Mv_no = M.Mv_no
WHERE M.Star = 'Tom Cruise';


-- QUESTION 14
-- Display first name and last name of customers
-- who have been issued a movie.

SELECT DISTINCT C.Fname, C.Lname
FROM Customer C
JOIN Invoice I
ON C.Cust_id = I.Cust_id;


-- QUESTION 15
-- Display movie numbers never issued to customers.

SELECT M.Mv_no
FROM Movie M
WHERE NOT EXISTS (
    SELECT 1
    FROM Invoice I
    WHERE I.Mv_no = M.Mv_no
);


-- ============================================
-- GROUP B
-- USING EXISTING EMP TABLE
-- ============================================

-- QUESTION 16
-- Display employee id, employee name,
-- manager id and manager name.

SELECT
    E.employee_id,
    CONCAT(E.first_name, ' ', E.last_name) AS Employee_Name,
    E.manager_id,
    CONCAT(M.first_name, ' ', M.last_name) AS Manager_Name
FROM EMP E
LEFT JOIN EMP M
ON E.manager_id = M.employee_id;


-- QUESTION 17
-- Display employee name, manager id,
-- manager name and manager's manager name.

SELECT
    CONCAT(E.first_name, ' ', E.last_name) AS Employee_Name,

    E.manager_id,

    CONCAT(M.first_name, ' ', M.last_name) AS Manager_Name,

    CONCAT(MM.first_name, ' ', MM.last_name)
    AS Manager_Manager_Name

FROM EMP E

LEFT JOIN EMP M
ON E.manager_id = M.employee_id

LEFT JOIN EMP MM
ON M.manager_id = MM.employee_id;


-- ============================================
-- END OF LAB ASSIGNMENT - 10
-- ============================================