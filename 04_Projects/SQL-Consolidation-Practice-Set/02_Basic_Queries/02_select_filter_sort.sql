-- SELECT, filtering and sorting

-- 6. Display all columns and rows from the customers table.
SELECT 
    *
FROM
    customers;

-- 7. Display only the names and cities of customers living in Dubai.
SELECT 
    customer_name, city
FROM
    customers
WHERE
    city = 'Dubai';

-- 8. Find all products with a price greater than 500.
SELECT 
    *
FROM
    products
WHERE
    price > 500;

-- 9. Retrieve customers whose age is between 25 and 35, inclusive.
SELECT 
    *
FROM
    customers
WHERE
    age BETWEEN 25 AND 35;

-- 10. Find all orders with a status of Completed.
SELECT 
    *
FROM
    orders
WHERE
    status = 'Completed';
    
-- 11. Display all products ordered by price from highest to lowest.
SELECT 
    *
FROM
    products
ORDER BY price DESC;

-- 12. Find the three most expensive products.
SELECT 
    *
FROM
    products
ORDER BY price DESC
LIMIT 3;