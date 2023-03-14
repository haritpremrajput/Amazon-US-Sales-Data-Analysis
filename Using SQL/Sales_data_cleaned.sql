-- Creating new databse
CREATE DATABASE Sales_data;

-- View database
SHOW DATABASES;

-- Select database
USE sales_data;


-- Create Table
DROP TABLE IF EXISTS all_data;
CREATE TABLE all_data
	( Order_ID MEDIUMINT,
	  Product VARCHAR(64),
      Quantity_Ordered SMALLINT,
      Price_Each FLOAT,
      Order_Date VARCHAR(64),
      Purchase_Address VARCHAR(256),
      Order_Month SMALLINT,
      Sales MEDIUMINT,
      City TINYTEXT
	 );

-- View schema
SELECT * FROM all_data;
SELECT count(*) FROM all_data;

-- Best Month for Sale
SELECT Order_Month, SUM(Sales) AS Sales_in_USD FROM all_data GROUP BY Order_Month ORDER BY Order_Month DESC;
/* DECEMBER is best month for sales */

-- Which city has max orders placed
SELECT city, SUM(Quantity_Ordered) AS Number_of_Orders FROM all_data GROUP BY city ORDER BY Number_of_Orders DESC;
/* San Francisco city has placed max orders */

-- Which city generates max revenue
SELECT city, SUM(Sales) AS Total_Sales_in_USD FROM all_data GROUP BY city ORDER BY Total_Sales_in_USD DESC;
/* San Francisco city generates max revenue */

-- Which hour of the day saw max surge in orders

/* Check datatype of Order_date column */ 
SELECT DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'sales_data' AND 
TABLE_NAME   = 'all_data' AND COLUMN_NAME  = 'Order_Date';

/* Check datatype of all columns */
SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'sales_data' AND 
TABLE_NAME   = 'all_data' AND COLUMN_NAME  in 
(Select COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sales_data' AND 
TABLE_NAME   = 'all_data');

-- Which product sold most?
SELECT Product, SUM(Quantity_Ordered) AS Sum_of_Quantity_Ordered FROM all_data GROUP BY Product ORDER BY Sum_of_Quantity_Ordered DESC;

 /* Batteries sold the most followed by Charging cable */
 
 
 -- Average Sales vs Quantity Ordered
SELECT Product, ROUND(AVG(Sales),2) as Average_Sales_in_US_Dollars, SUM(Quantity_Ordered) AS Sum_of_Quantity_Ordered FROM all_data GROUP BY Product;



