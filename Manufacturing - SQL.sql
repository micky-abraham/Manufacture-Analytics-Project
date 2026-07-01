CREATE DATABASE MANUFACTURING;

USE MANUFACTURING;

CREATE TABLE Fact_Production
(
Doc_Num VARCHAR(50),
Date_FK DATE,
Buyer_ID VARCHAR(20),
Customer_Code VARCHAR(20),
Employee_Code VARCHAR(20),
Machine_Code VARCHAR(20),
Operation_Code VARCHAR(20),
Dept_ID VARCHAR(20),
Item_Code VARCHAR(20),
Delivery_Status VARCHAR(20),
Is_Repeat_Order VARCHAR(20),
WO_Qty INT,
Press_QTY INT,
Processed_Qty INT,
Produced_Qty INT,
Rejected_Qty INT,
Today_Manufactured_Qty INT,
Total_Qty INT,
Total_Value DOUBLE,
Per_Day_Machine_Cost DOUBLE,
Rejection_Rate_Pct DOUBLE,
Efficiency_Rate_Pct DOUBLE,
Machine_Utilization_Pct DOUBLE,
Cost_Per_Unit DOUBLE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Fact_Production.csv'
INTO TABLE Fact_Production
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

SELECT * FROM Fact_Production;

SELECT * FROM Dim_Buyer;
ALTER TABLE Dim_Buyer RENAME COLUMN ï»¿Buyer_ID TO Buyer_ID;

SELECT * FROM Dim_Customer;
ALTER TABLE Dim_Customer RENAME COLUMN ï»¿Customer_Code TO Customer_Code;

SELECT * FROM Dim_Date;
ALTER TABLE Dim_Date RENAME COLUMN ï»¿Date TO Date;

SELECT * FROM Dim_Department;
ALTER TABLE Dim_Department RENAME COLUMN ï»¿Dept_ID TO Dept_ID;

SELECT * FROM Dim_Employee;
ALTER TABLE Dim_Employee RENAME COLUMN ï»¿Employee_Code TO Employee_Code;

SELECT * FROM Dim_Item;
ALTER TABLE Dim_Item RENAME COLUMN ï»¿Item_Code TO Item_Code;

SELECT * FROM Dim_Machine;
ALTER TABLE Dim_Machine RENAME COLUMN ï»¿Machine_Code TO Machine_Code;

SELECT * FROM Dim_Operation;
ALTER TABLE Dim_Operation RENAME COLUMN ï»¿Operation_Code TO Operation_Code;

SHOW TABLES;


#-------------- DATA VALIDATION - STAR SCHEMA DATA MODELING

SELECT F.Machine_Code, B.Buyer_Name, C.Customer_Name, E.Employee_Name
FROM Fact_Production F
JOIN Dim_Buyer B ON F.Buyer_ID = B.Buyer_ID
JOIN Dim_Customer C ON F.Customer_Code = C.Customer_Code
JOIN Dim_Employee E ON F.Employee_Code = E.Employee_Code
JOIN dim_Date D ON F.Date_FK = D.Date;


#-------------- KPI 

#----- 1. MANUFACTURE QTY

SELECT SUM(Produced_Qty) AS Manufacture_Qty
FROM Fact_Production;



#----- 2. REJECTED QTY

SELECT SUM(Rejected_Qty) AS Rejected_Qty
FROM Fact_Production;



#----- 3. PROCESSED QTY

SELECT SUM(Processed_Qty) AS Processed_Qty
FROM Fact_Production;



#----- 4. WASTAGE PERCENTAGE

SELECT CONCAT(ROUND(SUM(Rejected_Qty)/SUM(Processed_Qty)*100),'%') AS Wastage_Percentage
FROM Fact_Production;



#----- 5. EMPLOYEE WISE REJECTED QTY

SELECT E.Employee_Name, SUM(F.Rejected_Qty) AS Rejected_Qty
fROM Fact_Production F 
JOIN Dim_Employee E ON F.Employee_Code = E.Employee_Code
GROUP BY E.Employee_Name
ORDER BY Rejected_Qty DESC;



#----- 6. MACHINE WISE REJECTED QTY

SELECT M.Machine_Type, SUM(F.Rejected_Qty) AS Rejected_Qty
fROM Fact_Production F 
JOIN Dim_Machine M ON F.Machine_Code = M.Machine_Code
GROUP BY M.Machine_Type
ORDER BY Rejected_Qty DESC;



#----- 7. PRODUCTION COMPARISON TREND 

SELECT MONTHNAME(Date_FK) AS Month, SUM(Produced_Qty) AS Manufactured_Qty
FROM Fact_Production
GROUP BY Month, Month(Date_FK)
ORDER BY Month(Date_FK);



#----- 8. MANUFACTURE VS REJECTED

SELECT MONTHNAME(D.Date) AS Month, SUM(F.Produced_Qty) AS Manufactured_Qty, SUM(F.Rejected_Qty) AS Rejected_Qty
FROM Fact_Production F
JOIN Dim_Date D ON F.Date_FK = D.Date
GROUP BY Month, Month(D.Date)
ORDER BY Month(D.Date);



#----- 9. DEPARTMENT WISE MANUFACTURE VS REJECTED

SELECT P.Department_Name, SUM(F.Produced_Qty) AS Manufactured_Qty, SUM(F.Rejected_Qty) AS Rejected_Qty
FROM Fact_Production F
JOIN Dim_Department P ON F.Dept_ID = P.Dept_ID
GROUP BY 1
ORDER BY 2 DESC;



#----- 10. ON TIME DELIVERY RATE

SELECT CONCAT(ROUND(COUNT(DISTINCT CASE WHEN Delivery_Status IN ('Early','On Time') THEN Customer_Code END)*100
/COUNT(DISTINCT Customer_Code)),'%') AS On_Time_Delivery_Rate
FROM Fact_Production;



#----- 11. REPEAT ORDER RATIO

SELECT CONCAT(ROUND(COUNT(DISTINCT CASE WHEN Is_Repeat_Order = 'Yes' THEN Customer_Code END)*100
/ COUNT(DISTINCT Customer_Code)),'%') AS Repeat_Order_Rate
FROM Fact_Production;



#----- 12. PER DAY PRODUCTION EFFICIENCY

SELECT Date_FK, CONCAT(ROUND(SUM(Today_Manufactured_Qty)/SUM(Processed_Qty)*100),'%') AS Per_Day_Efficiency
FROM Fact_Production
GROUP BY 1
ORDER BY 1 ASC;


