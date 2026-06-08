-- Q1. Find all orders where sales are greater than the average sales (Subquery)
-- Answer: The subquery calculates average sales. The main query returns orders whose sales are greater than the average.
SELECT *
FROM orders
WHERE Sales >
(
    SELECT AVG(Sales)
    FROM orders
);

-- Q2. Find the highest sales order for each customer (Subquery)
-- Answer: First, subquery calculates maximum sales for every customer. Then JOIN matches those values. Using WHERE directly results in long query completion time resulting in crash.
SELECT o.*
FROM orders o
INNER JOIN
(
    SELECT
        `Customer ID`,
        MAX(Sales) AS max_sales
    FROM orders
    GROUP BY `Customer ID`
) m
ON o.`Customer ID` = m.`Customer ID`
AND o.Sales = m.max_sales;

-- Q3. Calculate total sales for each customer (CTE)
-- Answer: CTE improves query readability by storing temporary aggregated results.
WITH customer_sales AS
(
    SELECT
        `Customer ID`,
        SUM(Sales) AS total_sales
    FROM orders
    GROUP BY `Customer ID`
)
SELECT *
FROM customer_sales;

-- Q4. Find customers whose total sales are above average (CTE + Subquery)
-- Answer: First, CTE calculates total sales per customer. Then subquery calculates the average total sales among all customers.
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

-- Q5. Rank all customers based on total sales (Window Function)
-- Answer: RANK() assigns rankings based on descending total sales. Higher sales receive better ranks.

SELECT
    `Customer ID`,
    SUM(Sales) AS total_sales,

    RANK() OVER
    (
        ORDER BY SUM(Sales) DESC
    ) AS customer_rank

FROM orders
GROUP BY `Customer ID`;

-- Q6. Assign row numbers to each order within a customer (Window Function + PARTITION BY)
-- Answer: PARTITION BY separates rows customer-wise. ROW_NUMBER() assigns sequential numbers to orders within each customer.
SELECT
    `Customer ID`,
    `Order ID`,
    Sales,

    ROW_NUMBER() OVER
    (
        PARTITION BY `Customer ID`
        ORDER BY Sales DESC
    ) AS row_num

FROM orders;

-- Q7. Display top 3 customers based on total sales (Window Function)
-- Answer: RANK() ranks customers by total sales. Outer query filters top 3 ranks.

WITH ranked_customers AS
(
    SELECT
        `Customer ID`,
        SUM(Sales) AS total_sales,

        RANK() OVER
        (
            ORDER BY SUM(Sales) DESC
        ) AS customer_rank

    FROM orders
    GROUP BY `Customer ID`
)

SELECT *
FROM ranked_customers
WHERE customer_rank <= 3;