-- Part 9: Real interview-style business problems

-- 48. Sales performance report: Generate a report showing each product category's total completed revenue, number of completed orders and average order value.
SELECT 
    p.category AS Category,
    SUM(p.price * o.quantity) AS Revenue,
    COUNT(o.order_id) AS Completed_Orders,
    AVG(p.price * o.quantity) AS Average_Order_Value
FROM
    orders o
        INNER JOIN
    products p ON o.product_id = p.product_id
WHERE
    o.status = 'Completed'
GROUP BY Category;

-- 49. Customer analysis: Find the top three customers by completed sales revenue. Show customer name, country, total revenue and rank. Include customers with zero completed revenue only if needed to complete the requested ranking.
SELECT
    c.customer_name AS Customer,
    c.country AS Country,
    COALESCE(SUM(p.price * o.quantity), 0) AS Revenue,
    RANK() OVER (
        ORDER BY COALESCE(SUM(p.price * o.quantity), 0) DESC
    ) AS Ranks
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
    AND o.status = 'Completed'
LEFT JOIN products p
    ON o.product_id = p.product_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.country
ORDER BY Revenue DESC
LIMIT 3;

-- 50. Business decision: Identify the best-selling product by completed revenue and the country generating the highest completed sales revenue. Return the relevant product or country name and its revenue.
-- 50A. Best-selling product by completed revenue
SELECT
    p.product_name AS Product,
    SUM(p.price * o.quantity) AS Revenue
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id
WHERE o.status = 'Completed'
GROUP BY p.product_id, p.product_name
ORDER BY Revenue DESC
LIMIT 1;

-- 50B. Country generating the highest completed sales revenue
SELECT
    c.country AS Country,
    SUM(p.price * o.quantity) AS Revenue
FROM orders o
INNER JOIN products p
    ON o.product_id = p.product_id
INNER JOIN customers c
    ON o.customer_id = c.customer_id
WHERE o.status = 'Completed'
GROUP BY c.country
ORDER BY Revenue DESC
LIMIT 1;