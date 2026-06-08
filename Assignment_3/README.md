# Advanced SQL Sales Analysis using Subqueries, CTEs, and Window Functions

## Project Overview

This project focuses on analyzing Superstore sales data using advanced SQL concepts such as:

- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Ranking Functions
- PARTITION BY
- Aggregations
- JOIN operations

The objective was to derive customer sales insights and perform analytical business queries on retail sales data.

---

# Dataset Used

Superstore Dataset containing:
- Customer information
- Product details
- Sales records
- Profit and discount data
- Order-level transactions

---

# Tasks Performed

## Step 1: Data Preparation
- Imported CSV dataset into MySQL
- Created `superstore_raw` table
- Built normalized tables:
  - customers
  - orders
  - products
- Inserted distinct records using `SELECT DISTINCT`

---

## Step 2: SQL Analysis

### Subqueries
- Orders above average sales
- Highest sales order per customer

### CTEs
- Total sales per customer
- Customers with above-average sales

### Window Functions
- Customer ranking based on sales
- Row numbering within customers
- Top 3 customers by sales

---

## Step 3: Final Combined Query

Created a final analytical query using:
- JOIN
- CTE
- Window Functions

The query displays:
- Customer Name
- Total Sales
- Sales Rank

---

# Mini Project Insights

Additional customer sales analysis performed:

- Top 5 customers
- Bottom 5 customers
- Customers with only one order
- Above-average sales customers
- Highest order value per customer

---

# Key SQL Concepts Used

- SELECT
- GROUP BY
- ORDER BY
- HAVING
- Subqueries
- Correlated Subqueries
- CTE (`WITH`)
- RANK()
- ROW_NUMBER()
- PARTITION BY
- INNER JOIN
- Aggregate Functions

---

# Tools & Technologies

- MySQL
- MySQL Workbench
- VS Code
- GitHub

---

# Learning Outcomes

Through this project, the following practical SQL skills were strengthened:

- Writing analytical SQL queries
- Understanding query optimization
- Using Window Functions effectively
- Performing customer sales analysis
- Structuring complex SQL using CTEs
- Solving business problems using SQL

---

# Conclusion

This project demonstrates how advanced SQL can be used to analyze retail sales data, identify customer trends, rank business performance, and generate meaningful insights using industry-relevant analytical SQL techniques.