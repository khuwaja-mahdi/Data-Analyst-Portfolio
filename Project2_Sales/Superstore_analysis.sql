CREATE DATABASE SuperstoreDB;
USE SuperstoreDB;
SELECT COUNT(*) AS total_rows 
FROM [Sample - Superstore];
SELECT TOP 5 * 
FROM [Sample - Superstore];
SELECT * 
FROM [Sample - Superstore];

SELECT 
    Order_ID,
    Customer_Name,
    Sales,
    Profit 
FROM [Sample - Superstore];
SELECT * 
FROM [Sample - Superstore] 
WHERE Region = 'West';

SELECT 
    Region,
    SUM(Sales) AS total_sales
FROM [Sample - Superstore]
GROUP BY Region
ORDER BY total_sales DESC;

SELECT 
    Category,
    SUM(Sales) AS total_sales
FROM [Sample - Superstore]
GROUP BY Category
ORDER BY total_sales DESC;

SELECT 
    Category,
    SUM(Profit) AS total_profit
FROM [Sample - Superstore]
GROUP BY Category
ORDER BY total_profit DESC;

SELECT 
    Ship_Mode,
    COUNT(*) AS total_orders
FROM [Sample - Superstore]
GROUP BY Ship_Mode
ORDER BY total_orders DESC;

SELECT * 
FROM [Sample - Superstore] 
WHERE Profit < 0;
SELECT * 
FROM [Sample - Superstore] 
WHERE Discount > 0.5;
SELECT * 
FROM [Sample - Superstore] 
WHERE State = 'California';

SELECT * 
FROM [Sample - Superstore] 
WHERE Sales > 1000 
AND Profit < 0;
SELECT * 
FROM [Sample - Superstore] 
WHERE Region = 'East' 
OR Region = 'West';

SELECT TOP 10 
    Customer_Name,
    SUM(Sales) AS total_sales
FROM [Sample - Superstore]
GROUP BY Customer_Name
ORDER BY total_sales DESC;

SELECT 
    YEAR(Order_Date)  AS order_year,
    MONTH(Order_Date) AS order_month,
    SUM(Sales)          AS total_sales
FROM [Sample - Superstore]
GROUP BY 
    YEAR(Order_Date),
    MONTH(Order_Date)
ORDER BY 
    order_year,
    order_month;
SELECT TOP 1 
    Sub_Category,
    SUM(Profit) AS total_profit
FROM [Sample - Superstore]
GROUP BY Sub_Category
ORDER BY total_profit DESC;

SELECT 
    Category,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_pct
FROM [Sample - Superstore]
GROUP BY Category
ORDER BY profit_margin_pct DESC;
SELECT 
    Customer_Name,
    COUNT(Order_ID) AS total_orders
FROM [Sample - Superstore]
GROUP BY Customer_Name
HAVING COUNT(Order_ID) > 5
ORDER BY total_orders DESC;

SELECT
    Product_Name,
    SUM(Sales) AS TotalSales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS SalesRank
FROM [Sample - Superstore]
GROUP BY Product_Name;