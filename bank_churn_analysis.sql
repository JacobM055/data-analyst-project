-- =====================
-- DATABASE SETUP
-- =====================
CREATE DATABASE bank_churn;
USE bank_churn;

-- Create the table structure matching our CSV columns
CREATE TABLE customers (
    customer_id INT,
    credit_score INT,
    country VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    tenure INT,
    balance DECIMAL(15,2),
    products_number INT,
    credit_card INT,
    active_member INT,
    estimated_salary DECIMAL(15,2),
    churn INT
);

-- Verify the data loaded correctly
-- COUNT(*) counts all rows in the table
USE bank_churn;
SELECT COUNT(*) FROM customers;

-- =====================
-- EXPLORE DATA
-- =====================
SELECT *
FROM customers
LIMIT 10;


-- =============================================
-- QUERY 1: OVERALL CHURN RATE
-- What percentage of customers left the bank?
-- =============================================

-- SELECT tells MySQL what columns we want to see
-- COUNT(*) counts every row in the table = total customers
-- SUM(churn) adds up all the 1s in churn column = total who left
-- ROUND(..., 2) rounds the result to 2 decimal places
-- AS gives each column a readable name in the output
SELECT
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_percentage

-- FROM tells MySQL which table to pull data from
FROM customers;


-- =============================================
-- QUERY 2: CHURN RATE BY COUNTRY
-- Which countries are losing the most customers?
-- =============================================

-- country groups the results by each country
-- COUNT(*) gives total customers per country
-- SUM(churn) gives total churned per country
-- ROUND(SUM(churn) / COUNT(*) * 100, 2) calculates churn rate
-- GROUP BY splits the data into one row per country
SELECT 
    country,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_percentage
FROM customers
GROUP BY country;



-- =============================================
-- QUERY 3: CHURN RATE BY NUMBER OF PRODUCTS
-- Does having more products affect loyalty?
-- =============================================

-- products_number groups customers by how many bank products they have
-- COUNT(*) gives total customers per product group
-- SUM(churn) gives total churned per product group
-- ROUND(SUM(churn) / COUNT(*) * 100, 2) calculates churn rate
-- ORDER BY products_number sorts results from 1 to 4 products
SELECT 
    products_number, 
    COUNT(*) AS total_customers, 
    SUM(churn) AS churned_customers, 
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_percentage 
FROM customers 
GROUP BY products_number
ORDER BY products_number;



-- =============================================
-- QUERY 4: AVERAGE AGE BY CHURN STATUS
-- Are older customers more likely to leave?
-- =============================================

-- churn = 0 means stayed, churn = 1 means left
-- AVG(age) calculates the average age for each group
-- ROUND(..., 2) rounds to 2 decimal places
-- GROUP BY churn splits into two groups: stayed vs churned
SELECT 
    churn,
    ROUND(AVG(age), 2) AS average_age
FROM customers
GROUP BY churn;



-- =============================================
-- QUERY 5: CHURN RATE BY ACTIVE MEMBER STATUS
-- Do inactive members churn more than active ones?
-- =============================================

-- active_member = 1 means actively using the account
-- active_member = 0 means inactive
-- COUNT(*) gives total customers per activity group
-- SUM(churn) gives total churned per activity group
-- ROUND(SUM(churn) / COUNT(*) * 100, 2) calculates churn rate
-- GROUP BY active_member splits into two groups: active vs inactive
SELECT
    active_member,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn) / COUNT(*) * 100, 2) AS churn_percentage
FROM customers
GROUP BY active_member;