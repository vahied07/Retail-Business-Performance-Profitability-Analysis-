
/*Total Revenue & Total Profit by Product*/

SELECT 
    Description as Product,
    SUM(TotalPrice) AS Total_Revenue,
    SUM(TotalPrice - (UnitPrice * 0.7 * Quantity)) AS Total_Profit
FROM online_retail_cleaned
GROUP BY Description
ORDER BY Total_Profit DESC;




 /*Top 10 Most Profitable Products*/

SELECT 
    Description as Product,
    SUM(TotalPrice - (UnitPrice * 0.7 * Quantity)) AS Profit
FROM online_retail_cleaned
GROUP BY Description
ORDER BY Profit DESC
LIMIT 10;



/* Monthly Sales Trend */

SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
    SUM(TotalPrice) AS Monthly_Revenue
FROM online_retail_cleaned
GROUP BY Month
ORDER BY Month;



/* Country-wise Revenue  */

SELECT 
    Country,
    SUM(TotalPrice) AS Total_Revenue
FROM online_retail_cleaned
GROUP BY Country
ORDER BY Total_Revenue DESC;


/*Top 5 Most Frequently Ordered Products*/

SELECT 
    Description as Product,
    COUNT(*) AS Order_Count,
    SUM(Quantity) AS Total_Units
FROM online_retail_cleaned
GROUP BY Description
ORDER BY Order_Count DESC
LIMIT 5;



/*Average Order Value (AOV) by month */

SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
    SUM(TotalPrice) / COUNT(DISTINCT InvoiceNo) AS Avg_Order_Value
FROM online_retail_cleaned
GROUP BY Month
ORDER BY Month;



/* Monthly Unique Customer Count*/

SELECT 
    DATE_FORMAT(InvoiceDate, '%Y-%m') AS Month,
    COUNT(DISTINCT CustomerID) AS Unique_Customers
FROM online_retail_cleaned
GROUP BY Month
ORDER BY Month;


/*Top 10 Products by Total Revenue*/

SELECT 
    Description,
    SUM(TotalPrice) AS Total_Revenue
FROM online_retail_cleaned
GROUP BY Description
ORDER BY Total_Revenue DESC
LIMIT 10;



/*Top 5 Countries by Revenue (excluding 'United Kingdom')*/

SELECT 
    Country,
    SUM(TotalPrice) AS Revenue
FROM online_retail_cleaned
WHERE Country != 'United Kingdom'
GROUP BY Country
ORDER BY Revenue DESC
LIMIT 5;


/*Revenue per Transaction Size (Low vs High Spend Orders) */

SELECT 
    CASE 
        WHEN TotalPrice < 100 THEN 'Low Value Order'
        WHEN TotalPrice BETWEEN 100 AND 500 THEN 'Mid Value Order'
        ELSE 'High Value Order'
    END AS Order_Type,
    COUNT(*) AS Num_Orders,
    SUM(TotalPrice) AS Total_Revenue
FROM online_retail_cleaned
GROUP BY Order_Type;



















 

