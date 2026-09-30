CREATE DATABASE IF NOT EXISTS day10;
USE day10;

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product VARCHAR(50),
    amount INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers(customer_id, name, city) VALUES
	(1, 'Aman', 'Delhi'),
	(2, 'Rahul', 'Mumbai'),
	(3, 'Sara', 'Delhi'),
	(4, 'Priya', 'Pune'),
	(5, 'John', 'Bangalore'),
	(6, 'Neha', 'Mumbai');
    
INSERT INTO sales(customer_id, product, amount) VALUES
	(1, 'Laptop', 55000),
    (1, 'Mouse', 1000),
    (2, 'Laptop', 60000),
    (2, 'Keyboard', 2500),
    (3, 'Moniter', 15000),
    (3, 'Mouse', 1200),
    (5, 'Laptop', 50000),
    (5, 'Mouse', 800),
    (6, 'Moniter', 18000); 

-- Part A — INNER JOIN
-- Q1 - Display the customer name, city, product, and amount for every sale.
SELECT 
    c.name AS Customer,
    c.city AS City,
    s.product AS Products,
    s.amount AS Price
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id;

-- Q2 - Display:
-- Customer Name | Product | Amount
-- Only show customers who have made a purchase of more than ₹10,000.
SELECT 
    c.name AS Customer, s.product AS Products, s.amount AS Price
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
WHERE
    s.amount > 10000;

-- Q3 - Find the total amount spent by each customer.
-- Expected structure: Customer Name | Total_Spent
SELECT 
    c.name AS Customer_Name, SUM(s.amount) AS Total_Spent
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY c.name;

-- Q4 - Find the total amount spent by customers from Delhi.
SELECT 
    c.name AS Customer, SUM(s.amount) AS Total_Spent
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
WHERE
    c.city = 'Delhi'
GROUP BY c.name;

-- Q5 - Display the customer name and number of purchases made by each customer.
-- Expected: Customer Name | Purchase_Count
SELECT 
    c.name AS Customer, COUNT(s.sale_id) AS Purchase_Count
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY c.name;

-- Part B — LEFT JOIN
-- Q6 - Display all customers, along with their total spending.
-- A customer with no purchase should still appear.
-- Expected: Customer Name | Total_Spent
SELECT 
    c.name AS Customer, SUM(s.amount) AS Total_Spending
FROM
    customers c
        LEFT JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY c.name;

-- Q7 - Find customers who have never made a purchase.
SELECT 
    c.name AS Customer
FROM
    customers c
        LEFT JOIN
    sales s ON c.customer_id = s.customer_id
WHERE
    s.sale_id IS NULL;

-- Q8 - Display all customers and their number of purchases.
-- Customers with no purchases should show: 0
SELECT 
    c.name AS Customer, COUNT(s.sale_id) AS Purchases
FROM
    customers c
        LEFT JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY c.name;

-- Part C — GROUP BY + HAVING
-- Q9 - Find customers whose total spending is greater than ₹20,000.
-- Expected: Customer Name | Total_Spent
SELECT 
    c.name AS Customers, SUM(s.amount) AS Total_Spent
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY c.name
HAVING Total_Spent > 20000; 

-- Q10 - Find cities where the total sales amount is greater than ₹50,000.
-- Expected: City | Total_Sales
SELECT 
    c.city AS City, SUM(s.amount) AS Total_sales
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY c.city
HAVING Total_Sales > 50000;

-- Q11 - Find customers who have made at least 2 purchases.
-- Expected: Customer Name | Purchase_Count
SELECT 
    c.name AS Customer, COUNT(s.sale_id) AS Purchase_Count
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY c.name
HAVING Purchase_Count >= 2;

-- Q12 - Find the average purchase amount for each customer.
-- Expected: Customer Name | Average_Purchase
-- Only show customers whose average purchase is greater than ₹10,000.
SELECT 
    c.name AS Customer, AVG(amount) AS Average_Purchase
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY c.name
HAVING Average_Purchase > 10000;

-- Part D — CASE
-- Q13 - For every sale, classify the sale amount:
-- >= 50,000 → High
-- >= 10,000 → Medium
-- Otherwise → Low
-- Expected: Product | Amount | Sale_Category
SELECT 
    product,
    amount,
    CASE
        WHEN amount >= 50000 THEN 'High'
        WHEN amount >= 10000 THEN 'Medium'
        ELSE 'Low'
    END AS Sale_Category
FROM
    sales;

-- Q14 - Calculate each customer's total spending and classify them:
-- >= 50,000 → Big Customer
-- >= 20,000 → Good Customer
-- Otherwise → Regular Customer
SELECT 
    c.name AS Customer,
    SUM(s.amount) AS Total_Spending,
    CASE
        WHEN SUM(s.amount) >= 50000 THEN 'Big Customer'
        WHEN SUM(s.amount) >= 20000 THEN 'Good Customer'
        ELSE 'Regular Customer'
    END AS Image
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY c.name;

-- Q15 - Display each customer's total spending and assign a priority:
-- >= 60,000 → Platinum
-- >= 30,000 → Gold
-- >= 10,000 → Silver
-- Otherwise → Bronze
SELECT 
    c.name AS Customer,
    SUM(s.amount) AS Total_Spending,
    CASE
        WHEN SUM(s.amount) >= 60000 THEN 'Platinum'
        WHEN SUM(s.amount) >= 30000 THEN 'Gold'
        WHEN SUM(s.amount) >= 10000 THEN 'Silver'
        ELSE 'Bronze'
    END AS Priority
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY c.name;

-- Part E — JOIN + GROUP BY + HAVING + CASE 🔥
-- Q16 - Find the total sales for each city and classify the city:
-- >= 60,000 → High Sales
-- >= 30,000 → Medium Sales
-- Otherwise → Low Sales
-- Expected: City | Total_Sales | Sales_Category
SELECT 
    c.city AS City,
    SUM(s.amount) AS Total_Sales,
    CASE
        WHEN SUM(s.amount) >= 60000 THEN 'High Sales'
        WHEN SUM(s.amount) >= 30000 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS Sales_Category
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY c.city;

-- Q17 - Find customers whose total spending is greater than ₹20,000 and classify them as:
-- >= 50,000 → VIP
-- >= 30,000 → Premium
-- Otherwise → Regular
SELECT 
    c.name AS Customers,
    SUM(s.amount) AS Total_Spending,
    CASE
        WHEN SUM(s.amount) >= 50000 THEN 'VIP'
        WHEN SUM(s.amount) >= 30000 THEN 'Premium'
        ELSE 'Regular'
    END AS Customer_Image
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY c.name
HAVING Total_Spending > 20000;

-- Q18 - Find the number of customers in each city who have made at least one purchase.
-- Expected: City | Customer_Count
SELECT 
    c.city AS City,
    COUNT(DISTINCT c.customer_id) AS Customer_Count
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY c.city;

-- Q19 - Find the city with customers whose combined spending is greater than ₹50,000.
-- Don't use ORDER BY LIMIT for this one. Practice GROUP BY + HAVING.
SELECT 
    c.city AS City, SUM(s.amount) AS Spending
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY c.city
HAVING Spending > 50000;

-- Q20 — Challenge 🔥
-- Create this report: Customer Name | City | Total_Spent | Purchase_Count | Customer_Type
-- Where Customer_Type is:
-- Total_Spent >= 50,000 → VIP
-- Total_Spent >= 30,000 → Premium
-- Total_Spent >= 10,000 → Regular
-- Otherwise → Low Value
-- Include all customers, even customers who have never purchased anything.
SELECT 
    c.name AS Customer_Name,
    c.city AS City,
    SUM(s.amount) AS Total_Spent,
    COUNT(s.sale_id) AS Purchase_Count,
    CASE
        WHEN SUM(s.amount) >= 50000 THEN 'VIP'
        WHEN SUM(s.amount) >= 30000 THEN 'Premium'
        WHEN SUM(s.amount) >= 10000 THEN 'Regular'
        ELSE 'Low Value'
    END AS Customer_Type
FROM
    customers c
        LEFT JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY Customer_Name , City;
