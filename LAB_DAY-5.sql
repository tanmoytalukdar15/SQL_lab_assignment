
-- =================================================
-- CLIENT MASTER, SALES ORDER AND PRODUCTS MASTER
-- MYSQL WORKBENCH
-- =================================================

CREATE DATABASE IF NOT EXISTS SALES_DATABASE;
USE SALES_DATABASE;


-- =================================================
-- 1(a). CREATE CLIENT_MASTER TABLE
-- =================================================

CREATE TABLE Client_Master
(
    Client_no VARCHAR(5),
    Name VARCHAR(20) NOT NULL,
    Address1 VARCHAR(30),
    State VARCHAR(30),
    City VARCHAR(15),

    CONSTRAINT PK_Client PRIMARY KEY (Client_no),

    CONSTRAINT UQ_Client_Name UNIQUE (Name),

    CONSTRAINT CHK_Client_No CHECK (Client_no LIKE 'C%'),

    CONSTRAINT CHK_Client_City
    CHECK (City IN ('Delhi', 'Mumbai', 'Chennai'))
);


-- INSERT DATA INTO CLIENT_MASTER

INSERT INTO Client_Master VALUES
('C01', 'Ivaan', 'Church Rd', 'Maharashtra', 'Mumbai'),
('C02', 'Vandana', 'St.Mary Rd', 'Tamil Nadu', 'Chennai'),
('C03', 'Pramada', 'Mall Rd', 'Maharashtra', 'Mumbai'),
('C04', 'Basu', 'Church Rd', 'Maharashtra', 'Mumbai'),
('C05', 'Ravi', 'Chandni', NULL, 'Delhi'),
('C06', 'Rukmini', 'Mall Rd', 'Maharashtra', 'Mumbai');


-- =================================================
-- 1(b). CREATE PRODUCTS_MASTER TABLE
-- =================================================

CREATE TABLE Products_Master
(
    Product_no VARCHAR(10),

    Description VARCHAR(20) NOT NULL,

    Qty_on_hand INT,

    Sell_price DECIMAL(8,2) NOT NULL,

    Cost_price DECIMAL(8,2) NOT NULL,

    CONSTRAINT PK_Product PRIMARY KEY (Product_no),

    CONSTRAINT UQ_Product_Description UNIQUE (Description),

    CONSTRAINT CHK_Product_No CHECK (Product_no LIKE 'P%'),

    CONSTRAINT CHK_Product_Qty CHECK (Qty_on_hand > 10)
);


-- INSERT DATA INTO PRODUCTS_MASTER

INSERT INTO Products_Master VALUES
('P01', '1.44 Floppies', 100, 525, 500),
('P02', 'Monitors', 25, 12000, 11280),
('P03', 'Mouse', 20, 1050, 1000),
('P04', '1.22 floppies', 100, 525, 500),
('P05', 'Keyboards', 15, 3150, 3050),
('P06', 'Cd drive', 14, 5250, 5100);


-- =================================================
-- 1(c). CREATE SALES_ORDER TABLE
-- =================================================

CREATE TABLE Sales_Order
(
    S_order_no VARCHAR(10),

    S_order_date DATE,

    Client_no VARCHAR(5),

    Salesman_no VARCHAR(10),

    Product_no VARCHAR(10),

    CONSTRAINT PK_Sales_Order PRIMARY KEY (S_order_no),

    CONSTRAINT CHK_S_Order_No CHECK (S_order_no LIKE 'O%'),

    CONSTRAINT CHK_Salesman_No CHECK (Salesman_no LIKE 'S%'),

    CONSTRAINT FK_Sales_Client
    FOREIGN KEY (Client_no)
    REFERENCES Client_Master(Client_no),

    CONSTRAINT FK_Sales_Product
    FOREIGN KEY (Product_no)
    REFERENCES Products_Master(Product_no)
);


-- INSERT DATA INTO SALES_ORDER

INSERT INTO Sales_Order VALUES
('O19001', '1996-01-12', 'C01', 'S01', 'P01'),
('O19002', '1996-01-25', 'C02', 'S02', 'P02'),
('O19003', '1996-02-18', 'C03', 'S03', 'P03'),
('O19004', '1996-04-03', 'C01', 'S01', 'P04'),
('O19005', '1996-05-20', 'C04', 'S02', 'P05'),
('O19006', '1996-05-24', 'C05', 'S04', 'P06');


-- =================================================
-- 2. ADD NOT NULL CONSTRAINT TO ADDRESS1
-- DISPLAY STRUCTURE
-- =================================================

ALTER TABLE Client_Master
MODIFY Address1 VARCHAR(30) NOT NULL;

DESC Client_Master;


-- =================================================
-- 3. CALCULATE PROFIT
-- =================================================

SELECT Product_no, Description,
       Sell_price - Cost_price AS Profit
FROM Products_Master;


-- =================================================
-- 4. CALCULATE TOTAL COST PRICE OF STOCK
-- =================================================

SELECT Product_no, Description,
       Qty_on_hand * Cost_price AS Total_Stock_Cost
FROM Products_Master;


-- =================================================
-- 5. DISPLAY CLIENTS WHOSE NAME STARTS WITH I
-- =================================================

SELECT *
FROM Client_Master
WHERE Name LIKE 'I%';


-- =================================================
-- 6. DISPLAY CLIENTS WHOSE NAME STARTS WITH R
-- AND ENDS WITH I
-- =================================================

SELECT *
FROM Client_Master
WHERE Name LIKE 'R%i';


-- =================================================
-- 7. NAME CONTAINS A AT THIRD AND FIFTH POSITION
-- =================================================

SELECT *
FROM Client_Master
WHERE Name LIKE '__a_a%';


-- =================================================
-- 8. DISPLAY CLIENTS WHOSE NAME CONTAINS AA
-- =================================================

SELECT *
FROM Client_Master
WHERE Name LIKE '%aa%';


-- =================================================
-- 9. DISPLAY CLIENTS WHOSE NAME HAS EXACTLY
-- FOUR CHARACTERS
-- =================================================

SELECT *
FROM Client_Master
WHERE Name LIKE '____';


-- =================================================
-- 10. DISPLAY CLIENTS WHO HAVE NOT MENTIONED STATE
-- =================================================

SELECT *
FROM Client_Master
WHERE State IS NULL;


-- =================================================
-- 11. DISPLAY ORDERS PLACED AFTER JANUARY 1996
-- =================================================

SELECT *
FROM Sales_Order
WHERE S_order_date > '1996-01-31';


-- =================================================
-- 12. UPDATE ORDER DETAILS FOR CLIENT C01
-- =================================================

UPDATE Sales_Order
SET S_order_date = '1996-07-24',
    Product_no = 'P06',
    Salesman_no = 'S04'
WHERE Client_no = 'C01';


-- =================================================
-- 13. CHANGE CITY OF CLIENT C05 TO KOLKATA
-- =================================================

-- This update violates the original City CHECK constraint.
-- Execute the following two statements to allow Kolkata:

ALTER TABLE Client_Master
DROP CHECK CHK_Client_City;

ALTER TABLE