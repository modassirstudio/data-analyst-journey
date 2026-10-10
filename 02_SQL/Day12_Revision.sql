-- Q1. Show each customer with their total spending. Include customers who never purchased.
SELECT 
    c.name AS Customer, SUM(s.amount) AS Total_Spending
FROM
    customers c
        LEFT JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY Customer;

-- Q2. Show product names with total quantity sold, sorted highest first. Only show products with total quantity > 5.
SELECT 
    p.name AS Product, SUM(s.quantity) AS Total_Quantity
FROM
    products p
        INNER JOIN
    sales s ON p.product_id = s.product_id
GROUP BY Product
HAVING Total_Quantity > 5
ORDER BY Total_Quantity DESC;

-- Q3. Rank customers by their total spending using RANK(). Show: Customer Name, Total Spending, Rank.
SELECT c.name AS Customer,
SUM(s.amount) AS Total_Spending,
	RANK() OVER(ORDER BY SUM(s.amount) DESC) AS Ranks
FROM
	customers c
INNER JOIN
	sales s
	ON c.customer_id = s.customer_id
	GROUP BY Customer;

-- Q4. Show each sale with a running total of amount ordered by sale_date.
SELECT
	s.sale_date AS Date,
    s.amount AS Amount,
    SUM(s.amount) OVER(ORDER BY s.sale_date) AS Running_Total
FROM sales s
ORDER BY s.sale_date;


-- Q5. (Challenge) Show each category with: Total revenue, Number of sales, Average revenue per sale and Rank of the category by revenue
SELECT p.category AS Category,
SUM(s.amount) AS Revenue,
COUNT(*) AS Number_of_sales,
AVG(s.amount) as Average_Revenue,
	RANK() OVER(ORDER BY SUM(s.amount) DESC) AS Ranks
FROM
	products p
INNER JOIN
	sales s
	ON p.product_id = s.product_id
	GROUP BY Category;