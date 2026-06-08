-- MINI PROJECT Q1. Who are the top 5 customers?
-- Answer: Customers are ranked based on highest total sales.
USE superstore_db;
SELECT
    `Customer ID`,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY `Customer ID`
ORDER BY total_sales DESC
LIMIT 5;

-- MINI PROJECT Q2. Who are the bottom 5 customers?
-- Answer: Customers with the lowest total sales are selected.

SELECT
    `Customer ID`,
    SUM(Sales) AS total_sales
FROM orders
GROUP BY `Customer ID`
ORDER BY total_sales ASC
LIMIT 5;

-- MINI PROJECT Q3. Which customers made only one order?
-- Answer: GROUP BY groups customer orders. HAVING filters customers having exactly one order.

SELECT
    `Customer ID`,
    COUNT(`Order ID`) AS total_orders
FROM orders
GROUP BY `Customer ID`
HAVING COUNT(`Order ID`) = 1;

-- MINI PROJECT Q4. Which customers have above-average sales?
-- Answer: First CTE calculates total sales per customer. Subquery calculates average customer sales.
WITH customer_sales AS
(
    SELECT
        `Customer ID`,
        SUM(Sales) AS total_sales
    FROM orders
    GROUP BY `Customer ID`
)
SELECT *
FROM customer_sales
WHERE total_sales >
(
    SELECT AVG(total_sales)
    FROM customer_sales
);

-- MINI PROJECT Q5. What is the highest order value per customer?
-- Answer: MAX(Sales) returns the highest order value for every customer.
SELECT
    `Customer ID`,
    MAX(Sales) AS highest_order_value
FROM orders
GROUP BY `Customer ID`;