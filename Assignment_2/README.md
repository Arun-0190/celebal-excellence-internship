# SQL-Based E-Commerce Sales Analysis & Business Insights

## Project Overview
This project focuses on analyzing an e-commerce sales database for ShopEase, a mid-sized online retail company operating across India. The objective was to extract meaningful business insights using SQL by working with relational database concepts, filtering techniques, aggregation functions, joins, indexing, constraints, CASE statements, and transactions.

The project simulates real-world business scenarios where data analysts use SQL to understand customer behavior, product performance, sales trends, and operational efficiency.

---

# Business Problems Solved

Using SQL queries, the following business insights were analyzed:

- Identifying delivered, pending, shipped, and cancelled orders
- Understanding customer purchase patterns
- Evaluating product category performance
- Calculating revenue generated from completed orders
- Analyzing pricing distribution across products
- Studying customer demographics and joining trends
- Understanding relationships between customers, orders, and products
- Performing transactional operations safely using ACID principles

---

# Key SQL Concepts Used

## Data Retrieval
- SELECT
- DISTINCT
- WHERE
- BETWEEN
- ORDER BY

## Aggregation & Analysis
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()
- GROUP BY
- HAVING

## Joins & Relationships
- INNER JOIN
- LEFT JOIN
- Foreign Keys
- Referential Integrity

## Database Constraints
- PRIMARY KEY
- FOREIGN KEY
- UNIQUE
- NOT NULL
- CHECK constraints

## Advanced SQL
- CASE Statements
- Transactions
- COMMIT & ROLLBACK
- ACID Properties
- Index Optimization

---

# Important Business Insights Extracted

## Revenue Insights
- Delivered orders generated the highest revenue.
- Electronics products contributed significantly to total sales value.
- Premium products had higher average order values compared to budget products.

## Customer Insights
- Maharashtra had multiple active customers in the dataset.
- Premium customers showed repeated purchase behavior.
- Customers joining in 2024 contributed actively to transactions.

## Product Insights
- Electronics category had the highest average pricing.
- Home products were mostly budget-friendly.
- Certain products like Bluetooth Speakers and Running Shoes belonged to premium pricing tiers.

## Operational Insights
- Indexes improve filtering performance on frequently searched columns.
- Foreign key constraints maintain data consistency.
- Transactions ensure safe multi-step order processing.

---

# Database Schema

The database consists of four relational tables:

1. customers
2. products
3. orders
4. order_items

These tables are connected using primary and foreign key relationships to simulate a real-world e-commerce system.

---

# Tools & Technologies Used

- MySQL
- MySQL Workbench
- GitHub

---

# Project Structure

```text
cei-sql-week2-task/
│
├── schema.sql
├── insert_data.sql
├── queries.sql
├── README.md
└── screenshots/
```

---

# Learning Outcomes

Through this project, the following practical database skills were strengthened:

- Writing optimized SQL queries
- Understanding relational database design
- Applying joins for multi-table analysis
- Using aggregation for business reporting
- Implementing constraints for data integrity
- Managing transactions safely
- Improving query performance using indexes

---

# Conclusion

This project demonstrates how SQL can be used not only for data retrieval but also for generating meaningful business insights from structured datasets. It reflects practical industry-level database operations and analytical thinking commonly used in data analysis and data engineering workflows.