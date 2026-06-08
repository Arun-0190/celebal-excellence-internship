-- STEP 3. Final Combined Query
-- Objective: Display:
-- -- 1. Customer Name
-- -- 2. Total Sales
-- -- 3. Rank
-- Using: JOIN + CTE + Window Function

-- Answer: CTE calculates total sales per customer. JOIN combines customer details. RANK() assigns rankings based on sales.
USE superstore_db;
WITH customer_sales AS
(
    SELECT
        o.`Customer ID`,
        c.`Customer Name`,
        SUM(o.Sales) AS total_sales

    FROM orders o

    INNER JOIN customers c
    ON o.`Customer ID` = c.`Customer ID`

    GROUP BY
        o.`Customer ID`,
        c.`Customer Name`
)

SELECT
    `Customer Name`,
    total_sales,

    RANK() OVER
    (
        ORDER BY total_sales DESC
    ) AS sales_rank

FROM customer_sales;