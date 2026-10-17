-- GROUP BY and HAVING

-- 26. Count the number of customers in each country.
SELECT 
    country AS Country, COUNT(country) AS No_of_Customers
FROM
    customers
GROUP BY Country;

-- 27. Find the average product price in each category.
SELECT 
    category AS Category, AVG(price) AS Average_Price
FROM
    products
GROUP BY Category;

-- 28. Calculate the total quantity ordered for each product ID.
SELECT 
    product_id AS Product_ID, SUM(quantity) AS Total_Quantity
FROM
    orders
GROUP BY Product_ID;

-- 29. Find the number of orders for each order status.
SELECT 
    status AS Status, COUNT(order_id) AS Orders
FROM
    orders
GROUP BY Status;

-- 30. Find the total completed sales revenue for each product category.
SELECT 
    p.category AS Category, SUM(p.price * o.quantity) AS Revenue
FROM
    products p
        INNER JOIN
    orders o ON p.product_id = o.product_id
WHERE
    o.status = 'Completed'
GROUP BY Category;

-- 31. Display only product categories whose average price is greater than 500.
SELECT 
    p.product_name AS Product, AVG(p.price) AS Average_Price
FROM
    products p
GROUP BY Product
HAVING Average_Price > 500;

-- 32. Find customers who have placed more than one order. Display their customer IDs and order counts.
SELECT 
    customer_id AS Customer_ID, COUNT(order_id) AS Orders
FROM
    orders
GROUP BY Customer_ID
HAVING Orders > 1;
