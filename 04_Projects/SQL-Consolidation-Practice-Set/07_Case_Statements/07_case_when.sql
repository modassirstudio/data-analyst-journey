-- Part 7: CASE statements

-- 40. Categorize each product by price:
-- - Budget if price is below 100.
-- - Standard if price is from 100 through 999.
-- - Premium if price is 1000 or above.
SELECT 
    product_name,
    price,
    CASE
        WHEN price < 100 THEN 'Budget'
        WHEN price <= 999 THEN 'Standard'
        ELSE 'Premium'
    END AS Category
FROM
    products;

-- 41. Classify customers by age:
-- - Young if age is below 25.
-- - Adult if age is from 25 through 39.
-- - Senior if age is 40 or above.
SELECT 
    customer_name,
    age,
    CASE
        WHEN age < 25 THEN 'Young'
        WHEN age <= 39 THEN 'Adult'
        ELSE 'Senior'
    END AS Class
FROM
    customers;

-- 42. Display each order with a new column called order_status_group: show Successful for completed orders, In Progress for pending orders and Unsuccessful for cancelled orders.
SELECT 
    order_id AS Orders,
    CASE
        WHEN status = 'Completed' THEN 'Successful'
        WHEN status = 'Pending' THEN 'In Progress'
        ELSE 'Unsuccessful'
    END AS order_status_group
FROM
    orders;

-- 43. Calculate completed sales revenue by country and classify each country's revenue as High if above 3000, Medium if from 1000 through 3000, or Low if below 1000.
SELECT 
    c.country AS Country,
    CASE
        WHEN SUM(p.price * o.quantity) > 3000 THEN 'High'
        WHEN SUM(p.price * o.quantity) > 1000 THEN 'Medium'
        ELSE 'Low'
    END AS Revenue
FROM
    orders o
        INNER JOIN
    customers c ON o.customer_id = c.customer_id
        INNER JOIN
    products p ON o.product_id = p.product_id
GROUP BY Country;
