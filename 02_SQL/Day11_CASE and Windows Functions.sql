USE day6;

-- Q1. Show each sale with product name, quantity, and a Size column:
-- 	Quantity ≥ 10 → "Bulk"
-- 	Quantity ≥ 5 → "Medium"
-- 	Else → "Small"
SELECT 
    p.name AS Product,
    s.quantity AS Quantity,
    CASE
        WHEN s.quantity >= 10 THEN 'Bulk'
        WHEN s.quantity >= 5 THEN 'Medium'
        ELSE 'Small'
    END AS Size
FROM
    sales s
        INNER JOIN
    products p ON s.product_id = p.product_id;
    
-- Q2. Show each sale with product name, amount, and a Price_Range:
-- 	Amount ≥ 500 → "High Value"
-- 	Amount ≥ 100 → "Mid Value"
-- 	Else → "Low Value"
SELECT 
    p.name AS Product,
    s.amount AS Amount,
    CASE
        WHEN s.amount >= 500 THEN 'High Value'
        WHEN s.amount >= 100 THEN 'Mid Value'
        ELSE 'Low Value'
    END AS Price_Range
FROM
    sales s
        INNER JOIN
    products p ON s.product_id = p.product_id;
    
-- Q3. Show total sales per day, classified as:
-- 	Sales ≥ 5000 → "Excellent Day"
-- 	Sales ≥ 3000 → "Good Day"
-- 	Else → "Slow Day"
SELECT 
    sale_date AS Date,
    SUM(amount) AS Total_Sales,
    CASE
        WHEN SUM(amount) >= 5000 THEN 'Excellent Day'
        WHEN SUM(amount) >= 3000 THEN 'Good Day'
        ELSE 'Slow Day'
    END AS Performance
FROM
    sales
GROUP BY Date;

-- Q4. Show all sales with a row number (1, 2, 3...) ordered by amount descending.
SELECT *,
	ROW_NUMBER() OVER(ORDER BY amount DESC) AS row_num
FROM sales;

-- Q5. Rank products by total revenue. Show: Product, Total_Revenue, Rank.
SELECT 
    p.name AS Product, 
    SUM(s.amount) AS Total_Revenue, 
    RANK() OVER (ORDER BY SUM(s.amount) DESC) AS Ranks 
FROM products p 
INNER JOIN sales s 
    ON p.product_id = s.product_id 
GROUP BY p.name;
