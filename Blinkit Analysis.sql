create database blinkitdb;
use blinkitdb;
SELECT * FROM blinkit_data;
SELECT COUNT(*) FROM blinkit_data;

#DATA_CLEANING 

UPDATE blinkit_data
SET `Item Fat Content` = 
  CASE 
 WHEN `Item Fat Content` IN ('LF', 'low fat') THEN 'Low Fat'
 WHEN `Item Fat Content` = 'reg' THEN 'Regular'
ELSE `Item Fat Content`
  END;

select distinct(`Item Fat Content`) from blinkit_data;

#1. TOTAL SALES:

select sum(sales) from blinkit_data;
select sum(sales) as Total_Sales from blinkit_data;
select cast(sum(sales)/ 1000000 as decimal(10,2)) as Total_Sales_Million from blinkit_data;

#2. AVG SALES:

select avg(Sales) from blinkit_data;
SELECT ROUND(AVG(Sales)) AS Avg_Sales FROM blinkit_data;

#3. NO OF ITEMS:

SELECT COUNT(*) AS No_of_Orders FROM blinkit_data;

#4. AVG RATING:

SELECT CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating FROM blinkit_data;

#5.Total Sales by Fat Content:

SELECT `Item Fat Content`, CAST(SUM(Sales) AS DECIMAL(10,2)) AS Total_Sales
FROM blinkit_data GROUP BY `Item Fat Content`;

#6.Total Sales by Item Type:

SELECT `Item Type`, CAST(SUM(Sales) AS DECIMAL(10,2)) AS Sales FROM blinkit_data
GROUP BY `Item Type` ORDER BY Sales DESC;

#7.Fat Content by Outlet for Total Sales:

SELECT 
  `Outlet Location Type`,
  SUM(CASE WHEN `Item Fat Content` = 'Low Fat' THEN Sales ELSE 0 END) AS Low_Fat,
  SUM(CASE WHEN `Item Fat Content` = 'Regular' THEN Sales ELSE 0 END) AS Regular
FROM blinkit_data
GROUP BY `Outlet Location Type`
ORDER BY `Outlet Location Type`;

#8.Total Sales by Outlet Establishment:

SELECT `Outlet Establishment Year`, CAST(SUM(Sales) AS DECIMAL(10,2)) AS Sales
FROM blinkit_data
GROUP BY `Outlet Establishment Year`
ORDER BY `Outlet Establishment Year`;

#9.Percentage of Sales by Outlet Size:

SELECT 
    `Outlet Size`, 
    CAST(SUM(Sales) AS DECIMAL(10,2)) AS Sales,
    CAST((SUM(Sales) * 100.0 / SUM(SUM(Sales)) OVER()) AS DECIMAL(10,2)) AS Sales_Percentage
FROM blinkit_data
GROUP BY `Outlet Size`
ORDER BY Sales DESC;

#10.Sales by Outlet Location:

SELECT `Outlet Location Type`, CAST(SUM(Sales) AS DECIMAL(10,2)) AS Sales
FROM blinkit_data
GROUP BY `Outlet Location Type`
ORDER BY Sales DESC;












