-- Basic SELECT
		-- 1. count records
SELECT 
    COUNT(*)
FROM
    superstore_sales;
    
		-- 2. top 10 recods
SELECT 
    *
FROM
    superstore_sales
LIMIT 10;

		-- 3. distinct category
SELECT DISTINCT
    category
FROM
    superstore_sales;
    
    
-- FILTERING + SORTING

		-- 1. Filter Technology category
SELECT *
FROM
    superstore_sales
WHERE
    Category = 'Technology';

		-- 2. Top 10 products by sales
SELECT 
    Category, `Product Name`, profit, sales
FROM
    superstore_sales
ORDER BY sales DESC
LIMIT 10;


-- AGGREGATIONS
		-- 1. Total Sales by Category
SELECT 
    category, round(SUM(sales),2) AS total_sales_per_category
FROM
    superstore_sales
GROUP BY Category
ORDER BY total_sales_per_category DESC;


		-- 2. Average Profit by Region
SELECT 
    region, AVG(profit) AS average_profit
FROM
    superstore_sales
GROUP BY region
ORDER BY average_profit DESC;

		-- 3. Total Orders by Segment
SELECT 
    segment, COUNT(sales) AS total_orders_by_segment
FROM
    superstore_sales
GROUP BY Segment
ORDER BY total_orders_by_segment DESC;

		-- 4. summary of aggregation
SELECT 
    category, segment, region,
    ROUND(SUM(sales), 2) AS sales,
    ROUND(SUM(profit), 2) AS profit
FROM
    superstore_sales
GROUP BY category , segment , region
ORDER BY sales DESC;


-- HAVING
      -- 1. Total Sales by Category where category > 455000
SELECT 
    category, round(SUM(sales),2) AS total_sales
FROM
    superstore_sales
GROUP BY Category 
having total_sales>455000
ORDER BY total_sales DESC;


-- BETWEEN & LIKE
		-- 1. Date Range Sales
SELECT *
FROM
    superstore_sales
WHERE
    `order date` BETWEEN '01-01-2019' AND '30-06-2019';

		-- 2. Customer details Search
SELECT *
FROM
    superstore_sales
WHERE
    `customer name` LIKE 'Ben%';


-- TOP 5 CUSTOMERS
SELECT 
    `customer name`, ROUND(SUM(sales), 2) total_spent
FROM
    superstore_sales
GROUP BY `Customer Name`
ORDER BY total_spent DESC
LIMIT 5;
