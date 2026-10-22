-- Q1. Create a view named Product_Revenue_View that shows product name, category, and total revenue (sum of amount).
CREATE VIEW Product_Revenue_View AS
SELECT 
    p.name AS Product,
    p.category AS Category,
    SUM(s.amount) AS Revenue
FROM
    products p
        INNER JOIN
    sales s ON p.product_id = s.product_id
GROUP BY p.name , p.category;

-- Q2. Create a view named Beverage_Sales_View that shows only sales for the 'Beverage' category. Show sale_id, product name, and amount.
CREATE VIEW Beverage_Sales_View AS
    SELECT 
        s.sale_id AS Sale_ID, p.name AS Product, s.amount AS Amount
    FROM
        products p
            INNER JOIN
        sales s ON p.product_id = s.product_id
    WHERE
        p.category = 'Sanitary';

-- Q3. Write a query to SELECT everything from the Product_Revenue_View you created in Q1, but only show products with a revenue greater than 500.
SELECT 
    *
FROM
    Product_Revenue_View
WHERE
    Revenue > 500;

-- Q4. Delete the Beverage_Sales_View you created in Q2.
DROP VIEW Beverage_Sales_View;
