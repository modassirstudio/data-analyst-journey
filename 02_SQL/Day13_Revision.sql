-- Q1. Show customer name + total spending, sorted highest first.
SELECT 
    c.name AS Customer, SUM(s.amount) AS Total_Spending
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY Customer
ORDER BY Total_Spending DESC;

-- Q2. Show products with total quantity > 5, sorted highest first.
SELECT 
    p.name AS Product, SUM(s.quantity) AS Total_Quantity
FROM
    products p
        INNER JOIN
    sales s ON p.product_id = s.product_id
GROUP BY Product
HAVING SUM(s.quantity) > 5
ORDER BY Total_Quantity DESC;

-- Q3. Rank customers by total spending using RANK().
SELECT c.name AS Customer,
SUM(s.amount) AS Total_Spending,
	RANK() OVER(ORDER BY sum(s.amount) DESC) AS Ranks
FROM
	customers c 
INNER JOIN
	sales s 
ON
	c.customer_id = s.customer_id
GROUP BY Customer;

-- Q4. Show each sale with a running total of amount ordered by sale_date.
SELECT 
	s.sale_date as Dates,
	s.amount AS Total_Amount,
	SUM(amount) OVER(ORDER BY s.sale_date) AS Running_Total
FROM
	sales s
ORDER BY
	Dates;
    
-- Q5. Show each category with total revenue, number of sales, and rank.
SELECT 
	p.category AS Category,
	SUM(s.amount) as Revenue,
	COUNT(*) AS Number_of_Sales,
	RANK() OVER(ORDER BY SUM(s.amount) DESC) AS Ranks
FROM
	products p
INNER JOIN
	sales s
ON
	p.product_id = s.product_id
GROUP BY 
	Category;