-- Part 8: Window functions — RANK and OVER

-- 44. Rank all products by price from highest to lowest using RANK().
SELECT
    p.product_name AS Products,
    p.price AS Price,
    RANK() OVER (ORDER BY p.price DESC) AS Ranks
FROM products p;

-- 45. Rank products by price within each product category. Use PARTITION BY and ORDER BY.
SELECT
    p.product_name AS Products,
    p.category AS Category,
    p.price AS Price,
    RANK() OVER (
        PARTITION BY p.category
        ORDER BY p.price DESC
    ) AS Ranks
FROM products p;

-- 46. Display every order alongside its customer's total number of orders, without collapsing the rows into groups.
SELECT
    o.*,
    COUNT(o.order_id) OVER (
        PARTITION BY o.customer_id
    ) AS Total_Orders
FROM orders o;

-- 47. Rank customers by their total completed sales revenue from highest to lowest. Display the customer name, total revenue and rank.
SELECT
    c.customer_name AS Customer,
    SUM(p.price * o.quantity) AS Revenue,
    RANK() OVER (
        ORDER BY SUM(p.price * o.quantity) DESC
    ) AS Ranks
FROM orders o
INNER JOIN customers c
    ON o.customer_id = c.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id
GROUP BY Customer;
