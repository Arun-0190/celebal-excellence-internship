-- Q1. Display all columns and rows from the customers table

SELECT * FROM customers;

-- Q2. Retrieve only the first_name, last_name, and city of all customers.
SELECT first_name, last_name, city
FROM customers;

-- Q3. List all unique categories available in the products table.
SELECT DISTINCT category
FROM products;

-- Q4. Identify the Primary Key of each table in the schema. Explain why a Primary Key must be unique and NOT NULL.

-- Primary Keys:
-- customers    -> customer_id
-- products     -> product_id
-- orders       -> order_id
-- order_items  -> item_id
-- A Primary Key must be:
-- 1. UNIQUE
-- 2. NOT NULL
-- UNIQUE ensures no duplicate rows. NOT NULL ensures every row has identification.


-- Q5. What constraints are applied to the email column in the customers table? What would happen if you tried to insert a duplicate email?
-- Answer:
-- The email column has:
-- 1. UNIQUE constraint
-- 2. NOT NULL constraint
-- UNIQUE prevents duplicate emails.
-- NOT NULL ensures email cannot be empty.
-- If a duplicate email is inserted,
-- MySQL throws a duplicate entry error.

INSERT INTO customers
VALUES (
109,
'Test',
'User'
'aarav.s@email.com',
'Mumbai',
'Maharashtra',
'2024-09-01',
TRUE
);

-- Expected Output:
-- Error Code: Duplicate entry

-- Q6. Try inserting a product with unit_price = -50. Explain the error and constraint.
-- Answer:
-- The products table contains a CHECK constraint:
-- CHECK (unit_price > 0)
-- This constraint ensures that product prices cannot be negative or zero. When we try inserting unit_price = -50,
-- MySQL throws a CHECK constraint error because the condition unit_price > 0 fails.

INSERT INTO products
VALUES (
209,
'Faulty Product',
'Electronics',
'TestBrand',
-50,
10
);

-- Expected Output:
-- Error Code: CHECK constraint failed


-- Q7. Retrieve all orders with status = 'Delivered'
-- Answer:
-- WHERE clause is used to filter rows. This query returns only those orders whose status is 'Delivered'.

SELECT *
FROM orders
WHERE status = 'Delivered';

-- Expected Result:
-- order_id -> 1001, 1002, 1004, 1006, 1008, 1010


-- Q8. Find all products in the 'Electronics' category with unit_price greater than 2000
-- Answer:
-- AND operator combines multiple conditions. This query filters products belonging to Electronics category and price > 2000.

SELECT *
FROM products
WHERE category = 'Electronics'
AND unit_price > 2000;

-- Expected Result:
-- Smart Watch
-- Bluetooth Speaker


-- Q9. List all customers who joined in the year 2024 and belong to the state 'Maharashtra'
-- Answer:
-- YEAR() extracts the year from join_date.
-- This query filters customers who: 1. Joined in 2024 2. Belong to Maharashtra

SELECT *
FROM customers
WHERE YEAR(join_date) = 2024
AND state = 'Maharashtra';


-- Q10. Find all orders placed between '2024-08-10' and '2024-08-25' that are NOT cancelled
-- Answer: BETWEEN is inclusive. != operator excludes cancelled orders.

SELECT *
FROM orders
WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25'
AND status != 'Cancelled';


-- Q11. Explain what the index idx_orders_date does
-- Answer:
-- idx_orders_date is an index created on the order_date column of the orders table. It improves query performance by helping
-- MySQL quickly locate rows based on dates instead of scanning the entire table.
-- This is useful for filtering, sorting, and range-based searches on order_date.
-- Example Query benefiting from this index:

SELECT *
FROM orders
WHERE order_date BETWEEN '2024-08-01' AND '2024-08-31';


-- Q12. Will the index be used in: SELECT * FROM customers WHERE YEAR(join_date) = 2024; Rewrite it to be index-friendly
-- Answer:
-- No, the index would NOT be used efficiently because YEAR(join_date) applies a function on the indexed column.
-- This makes the query non-SARGable, forcing MySQL to scan all rows. Index-friendly (SARGable) version:

SELECT *
FROM customers
WHERE join_date >= '2024-01-01'
AND join_date < '2025-01-01';

-- Q13. Count the total number of orders in the orders table
-- Answer:
-- COUNT(*) counts the total number of rows present in the orders table.

SELECT COUNT(*) AS total_orders
FROM orders;


-- Q14. Find the total revenue from all 'Delivered' orders
-- Answer:
-- SUM() calculates the total revenue. WHERE clause filters only Delivered orders.

SELECT SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'Delivered';

-- Q15. Calculate the average unit_price of products in each category
-- Answer:
-- AVG() calculates average price. GROUP BY groups rows category-wise.

SELECT category,
       AVG(unit_price) AS average_price
FROM products
GROUP BY category;


-- Q16. For each order status, find the count of orders and total revenue Sort by total revenue descending
-- Answer:
-- GROUP BY groups rows by status. COUNT(*) counts orders.
-- SUM(total_amount) calculates revenue. ORDER BY sorts results in descending order.

SELECT status,
       COUNT(*) AS total_orders,
       SUM(total_amount) AS total_revenue
FROM orders
GROUP BY status
ORDER BY total_revenue DESC;



-- Q17. Find the most expensive and cheapest product in each category
-- Answer:
-- MAX() returns highest price. MIN() returns lowest price. GROUP BY groups products category-wise.

SELECT category,
       MAX(unit_price) AS most_expensive,
       MIN(unit_price) AS cheapest
FROM products
GROUP BY category;


-- Q18. List all product categories where average unit_price > 2000

-- Answer:
-- HAVING filters grouped results. AVG(unit_price) calculates category average.

SELECT category,
       AVG(unit_price) AS average_price
FROM products
GROUP BY category
HAVING AVG(unit_price) > 2000;


-- Q19. Display each order along with customer's first_name and last_name using INNER JOIN
-- Answer:
-- INNER JOIN combines rows from customers and orders tables where customer_id matches.
-- Only matching records from both tables are returned.

SELECT 
    o.order_id,
    o.order_date,
    c.first_name,
    c.last_name,
    o.total_amount
FROM orders o
INNER JOIN customers c
ON o.customer_id = c.customer_id;

-- Q20. Using LEFT JOIN, list ALL customers and their orders (if any)
-- Answer:
-- LEFT JOIN returns all rows from the left table (customers). Matching rows from orders are shown. If no order exists, NULL values appear.

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.status
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id;


-- Q21. Use JOIN across orders, order_items, and products tables
-- Answer:
-- Multiple INNER JOINs combine: orders, order_items, products
-- This helps retrieve complete order item details.

SELECT 
    o.order_id,
    p.product_name,oi.quantity,
    oi.unit_price,oi.discount_pct
FROM orders o
INNER JOIN order_items oi
ON o.order_id = oi.order_id
INNER JOIN products p
ON oi.product_id = p.product_id;

-- Q22. Explain LEFT JOIN vs RIGHT JOIN and FULL OUTER JOIN
-- Answer:
-- LEFT JOIN:
-- Returns all rows from the left table and matching rows from the right table.
-- Example:
-- customers LEFT JOIN orders shows all customers even if they have no orders.
-- RIGHT JOIN:
-- Returns all rows from the right table and matching rows from the left table. 
-- Example:
-- customers RIGHT JOIN orders shows all orders even if matching customer data is missing.
-- FULL OUTER JOIN:
-- Returns all rows from both tables, whether matching exists or not.
-- It is useful when we want complete data from both tables including unmatched rows.

-- Q23. Identify all Foreign Key relationships in the schema
-- Answer:
-- Foreign Key Relationships:
-- 1. orders.customer_id REFERENCES customers(customer_id)
-- 2. order_items.order_id REFERENCES orders(order_id)
-- 3. order_items.product_id REFERENCES products(product_id)
-- Foreign Keys maintain referential integrity.
-- If we try inserting: customer_id = 999 into orders table,
-- MySQL throws a Foreign Key constraint error because customer_id 999 does not exist in customers table.
INSERT INTO orders
VALUES (
1011,
999,
'2024-09-01',
'Pending',
1000.00
);

-- Q24. Classify products into Budget, Mid-Range, and Premium using CASE statement
-- Answer: CASE statement is used for conditional logic.
-- Products are classified as: Budget     -> unit_price < 1000 Mid-Range  -> unit_price BETWEEN 1000 AND 3000 Premium    -> unit_price > 3000

SELECT 
    product_name,
    unit_price,
    CASE
        WHEN unit_price < 1000 THEN 'Budget'
        WHEN unit_price BETWEEN 1000 AND 3000 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS price_tier
FROM products;


-- Q25. Count how many orders are 'Delivered' vs 'Not Delivered' using CASE inside aggregate function 
-- Answer: CASE is used inside SUM() to count conditionally.
-- Delivered orders are counted separately, while all other statuses are grouped as Not Delivered.
SELECT
    SUM(
        CASE
            WHEN status = 'Delivered' THEN 1
            ELSE 0
        END
    ) AS delivered_orders,

    SUM(
        CASE
            WHEN status != 'Delivered' THEN 1
            ELSE 0
        END
    ) AS not_delivered_orders
FROM orders;

-- Q26. Explain ACID properties

-- Answer:
-- A -> Atomicity - Ensures a transaction is completed fullyor not executed at all.
-- Example: During bank transfer, money should either deduct and deposit both successfully,or neither should happen.
-- C -> Consistency - Ensures database remains valid before and after transaction.
-- Example: Account balance rules should remain correct after money transfer.
-- I -> Isolation - Multiple transactions should not interfere with each other.
-- Example: Two users withdrawing money simultaneously should not corrupt account balance.
-- D -> Durability - Once transaction is committed, data remains permanently saved.
-- Example: After successful bank transfer, data should remain saved even ifsystem crashes.

-- Q27. Write a SQL transaction that: 1. Inserts a new order 2. Inserts two order items 3. Updates stock quantities 4. Uses COMMIT and ROLLBACK

-- Answer: START TRANSACTION begins the transaction. If all queries succeed -> COMMIT If any query fails -> ROLLBACK

START TRANSACTION;
-- Insert new order
INSERT INTO orders
VALUES (
1011,
102,
CURDATE(),
'Pending',
1598.00
);
-- Insert order items
INSERT INTO order_items
VALUES
(5016, 1011, 206, 1, 1299.00, 0),
(5017, 1011, 208, 1, 299.00, 0);

-- Update stock quantity
UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 206;

UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 208;

COMMIT;

-- If any query fails:
-- ROLLBACK;