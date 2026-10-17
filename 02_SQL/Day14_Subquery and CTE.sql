-- Q1. Write a CTE that calculates total revenue per customer. Then select customers with revenue > 500.
WITH total_revenue AS (
    SELECT
        c.name AS Customers,
        SUM(s.amount) AS revenue
    FROM customers c
    INNER JOIN sales s
        ON c.customer_id = s.customer_id
    GROUP BY c.name
)
SELECT *
FROM total_revenue
WHERE revenue > 500;

-- Q2. Write a subquery in FROM that calculates total quantity per product. Then find the average quantity.
SELECT 
    AVG(total_quantity) AS avg_quantity
FROM
    (SELECT 
        p.name, SUM(s.quantity) AS total_quantity
    FROM
        products p
    INNER JOIN sales s ON p.product_id = s.product_id
    GROUP BY p.name) AS product_quantities;

-- Q3. (Challenge) Write a CTE that ranks products by revenue. Then filter to only top 3.
WITH total_revenue AS (
    SELECT
        p.name,
        SUM(s.amount) AS revenue,
        RANK() OVER (
            ORDER BY SUM(s.amount) DESC
        ) AS ranks
    FROM products p
    INNER JOIN sales s
        ON p.product_id = s.product_id
    GROUP BY p.name
)
SELECT *
FROM total_revenue
ORDER BY revenue DESC
LIMIT 3;
