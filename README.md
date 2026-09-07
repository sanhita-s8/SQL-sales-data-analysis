# SQL-sales-data-analysis
# E-commerce Sales Analysis using SQL

## 📌 Project Overview

This project analyzes e-commerce sales data using SQL to identify revenue trends, customer purchasing behavior, and product performance.

The analysis focuses on answering practical business questions using relational data and analytical SQL techniques.

## 🛠️ Technologies Used

* MySQL
* SQL

## 📂 Database Structure

The project contains four related tables:

* **customers** — Customer information and signup details
* **products** — Product information, categories, and prices
* **orders** — Order details, dates, amounts, and status
* **order_items** — Products and quantities associated with each order

### Relationship

```text
customers
    │
    │ customer_id
    ↓
orders
    │
    │ order_id
    ↓
order_items
    │
    │ product_id
    ↓
products
```

## 🔍 SQL Concepts Demonstrated

* INNER JOIN
* GROUP BY
* HAVING
* Aggregate Functions
* CASE Statements
* Common Table Expressions (CTEs)
* Subqueries
* Window Functions
* RANK()
* ROW_NUMBER()
* LAG()
* Date Functions
* Revenue and customer analysis

## 📊 Business Questions

The project answers questions such as:

1. What is the total revenue generated from completed orders?
2. How many completed orders were placed?
3. Which product categories generate the highest revenue?
4. Who are the top customers by total spending?
5. How does revenue change month by month?
6. What is the average order value?
7. Which products generate the most revenue?
8. Which customers have made multiple purchases?
9. What percentage of revenue does each customer contribute?
10. How does monthly revenue compare with the previous month?
11. How do completed and cancelled orders compare?
12. What was the latest order placed by each customer?

## 📁 Project Structure

```text
ecommerce-sales-sql-analysis/
│
├── README.md
├── schema.sql
├── data.sql
└── analysis_queries.sql
```

### File Description

| File                   | Description                                                 |
| ---------------------- | ----------------------------------------------------------- |
| `schema.sql`           | Creates the database and tables                             |
| `data.sql`             | Inserts sample customers, products, orders, and order items |
| `analysis_queries.sql` | Contains analytical SQL queries                             |

## 🚀 How to Run

### 1. Create the database

Run `schema.sql` in MySQL.

### 2. Load the data

Run `data.sql` after creating the database.

### 3. Run the analysis

Open `analysis_queries.sql` and execute the queries individually to explore the results.

## 🎯 Key Learning Outcomes

This project demonstrates the use of SQL to transform relational data into actionable business insights.

It also provides practical experience with complex SQL concepts including joins, CTEs, subqueries, window functions, ranking, and time-based analysis.
