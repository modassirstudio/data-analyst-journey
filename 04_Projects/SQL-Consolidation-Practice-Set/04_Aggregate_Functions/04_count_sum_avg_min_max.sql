-- Aggregate functions

-- 18. Count the total number of customers.
SELECT 
    COUNT(*) AS Total_Customers
FROM
    customers;

-- 19. Find the total number of orders.
SELECT 
    COUNT(*) AS Total_Orders
FROM
    orders;

-- 20. Calculate the average price of all products.
SELECT 
    AVG(price) AS AVG_Price
FROM
    products;

-- 21. Find the cheapest and most expensive products' prices.
SELECT 
    MIN(price) AS Cheapest, MAX(price) AS Expensive
FROM
    products;

-- 22. Calculate the total quantity of products ordered across all orders.
SELECT 
    SUM(quantity) AS Total_Quantity
FROM
    orders;

-- 23. Calculate the total value of completed orders using the orders and products tables.
SELECT 
    SUM(o.quantity * p.price) AS Total_Sales
FROM
    orders o
        INNER JOIN
    products p ON o.product_id = p.product_id
WHERE
    o.status = 'Completed';

-- 24. Find the average order quantity for completed orders.
SELECT 
    AVG(quantity) AS AVG_Order_Quantity
FROM
    orders
WHERE
    status = 'Completed';

-- 25. Count how many orders are completed, pending and cancelled.
SELECT 
    status AS Status, COUNT(*) AS Order_Count
FROM
    orders
WHERE
    status IN ('Completed' , 'Pending', 'Cancelled')
GROUP BY status;