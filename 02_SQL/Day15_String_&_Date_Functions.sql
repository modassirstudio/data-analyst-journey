-- 🎯 SQL TOPIC - String & Date functions (5 queries)

-- Q1. Show all product names in UPPERCASE and their length.
SELECT 
    UPPER(name) AS NAME, LENGTH(name) AS LENGTH
FROM
    products;

-- Q2. Show customer names and their cities combined like: Modassir from Bihar Sharif.
SELECT 
    CONCAT(name, ' from ', city) AS Customers_with_City
FROM
    customers;

-- Q3. Extract the first 3 characters of each product name. (Use SUBSTRING)
SELECT 
    SUBSTRING(name, 1, 3) AS Extracted_Name
FROM
    products;

-- Q4. Show the number of days between today (CURDATE()) and each sale_date.
SELECT 
    sale_date, DATEDIFF(CURDATE(), sale_date) AS Days_difference
FROM
    sales; 

-- Q5. Show products where the name contains the word "Pipe".
SELECT 
    name
FROM
    products
WHERE
    name LIKE '%Pipe%';
