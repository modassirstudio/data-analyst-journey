
-- Q1. Show each sale with product name, quantity, and a column Size:
-- Quantity ≥ 10 → "Bulk"
-- Quantity ≥ 5 → "Medium"
-- Quantity < 5 → "Small"
SELECT 
    p.name AS Product,
    s.quantity AS Quantity,
    CASE
        WHEN Quantity >= 10 THEN 'Bulk'
        WHEN Quantity >= 5 THEN 'Medium'
        ELSE 'Small'
    END AS Order_Size
FROM
    sales s
        INNER JOIN
    products p ON s.product_id = p.product_id;

-- Q2. Show each sale with product name, amount, and a column Price_Range:
-- Amount ≥ 500 → "High Value"
-- Amount ≥ 100 → "Mid Value"
-- Amount < 100 → "Low Value"
SELECT 
    p.name AS Product,
    s.amount AS Amount,
    CASE
        WHEN Amount >= 500 THEN 'High Value'
        WHEN Amount >= 100 THEN 'Mid Value'
        ELSE 'Low Value'
    END AS Price_Range
FROM
    sales s
        INNER JOIN
    products p ON s.product_id = p.product_id;

-- Q3. Show total sales per day, categorized as:
-- Sales ≥ 5000 → "Excellent Day"
-- Sales ≥ 3000 → "Good Day"
-- Sales < 3000 → "Slow Day"
SELECT 
    DAYNAME(sale_date) AS Day,
    SUM(amount) AS Total_Sales,
    CASE
        WHEN SUM(amount) >= 5000 THEN 'Excellent Day'
        WHEN SUM(amount) >= 3000 THEN 'Good Day'
        ELSE 'Slow Day'
    END AS Performance
FROM
    sales
GROUP BY Day;

-- Q4. Show all sales with a row number (1, 2, 3...) ordered by amount descending.
SELECT sale_id,
       Rank() OVER (ORDER BY amount DESC) as Ranks
FROM sales;

-- Q5. Rank products by their total revenue. Show: Product, Total_Revenue, Rank.
SELECT 
  p.name AS Product,
  SUM(s.amount) AS Revenue,
  RANK() OVER (ORDER BY SUM(s.amount) DESC) AS Ranks
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY p.name;

-- Q6. (Challenge) Show each sale with:
-- Product name
-- Amount
-- Running total of amount (cumulative sum) ordered by sale_date
SELECT 
  p.name AS Product,
  SUM(s.amount) AS Total_Amount,
  s.sale_date as Date,
  RANK( OVER (ORDER BY s.sale_date DESC) AS Ranks
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY p.name;
