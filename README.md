**SQL Project – Swiggy-Order Processing **

A real-world style SQL project simulating how data analysts in e‑commerce and quick‑commerce (Swiggy) environments work behind the scenes to manage inventory, clean messy catalog data, and generate business insights from SQL queries.​

🎯 Project Objectives

1. Set up a realistic Quick Commerce Order Processing database using PostgreSQL.​
2. Perform Exploratory Data Analysis (EDA) on product categories, Order status, and pricing.​
3. Implement data cleaning for nulls, invalid prices.​
4. Write business-driven SQL queries for pricing, Delivery Order status, stock Quantity, and revenue estimation.​

📁 Dataset Overview

The dataset is sourced from a Swiggy Order processing listing scraped from the app and shared on Kaggle.​
Each row represents a unique SKU (Stock Keeping Unit), with duplicate product names for different quantities, prices, or discounts, just like a live catalog.​


🧱 1. Database & Table Creation: 
The project uses PostgreSQL with a single-core table Swiggy for SKUs.​

📥 2. Data Import: 
CSV is loaded via pgAdmin’s Import functionality or via \copy from psql.​

🔍 3. Exploratory Data Analysis (EDA): 
Typical EDA queries included:

-Total records, sample rows, and basic sanity checks.
-Null checks across price, quantity, and other columns.
-ProductName order-wise, OrderStatus-wise TotalPrice, TimeOfDay-wise TotalPrice.
-Detection of products with multiple SKUs.​

🧹 4. Data Cleaning: 
Main cleaning steps:
--Products with Quantity and TotalPrice = 0

📊 5. Business Insight Queries
Below are example query patterns matching the insights you described.
-- Q1. Find the top 10 best-value ProductName based on the DiscountApplied.
--Q2. Find the Top 20 best-value products based on the DiscountApplied above 20.
--Q3.Calculate Estimated Revenue for each ProductName
-- Q4. Find all ProductName where UnitPrice is greater than ₹300, and DiscountApplied is less than 1000.
-- Q5. Identify the top 5 ProductName offering the highest average DiscountApplied.
-- Q6. Find the price per Quantity for products above 5 and sort by best value.
--Q7.Group the ProductName into DeliveryTimeMinutes like Low, Medium, Slow.
--Q8.What is the Total Price Per PaymentMethodID 
--Q9.What is the Total Price Per TimeOfDay 


🧩 Tech Stack
-SQL (PostgreSQL) for querying and transformations.​
-pgAdmin for import, schema management, and running queries.​
