-- Q1. Show each product's total revenue. If revenue > 1000, label it "Top Product". Otherwise, label it "Standard Product".
SELECT 
    p.name AS Product,
    SUM(s.amount) AS Revenue,
    CASE
        WHEN SUM(s.amount) > 1000 THEN 'Top Product'
        ELSE 'Standard Product'
    END AS Label
FROM
    products p
        INNER JOIN
    sales s ON p.product_id = s.product_id
GROUP BY Product;

-- Q2. Show each category's average amount. If the average is > 100, label it "High Ticket". If > 50, label it "Mid Ticket". Otherwise, "Low Ticket".
SELECT 
    p.category AS Category,
    AVG(s.amount) AS Average_Amount,
    CASE
        WHEN AVG(s.amount) > 100 THEN 'High Ticket'
        WHEN AVG(s.amount) > 50 THEN 'Mid Ticket'
        ELSE 'Low Ticket'
    END AS Label
FROM
    products p
        INNER JOIN
    sales s ON p.product_id = s.product_id
GROUP BY Category;

-- Q3. Show each customer and their total number of purchases. If they bought more than 3 times, label them "Loyal".
SELECT 
    c.name AS Customer,
    COUNT(s.sale_id) AS Number_of_Purchases,
    CASE
        WHEN COUNT(s.sale_id) > 3 THEN 'Loyal'
    END AS Label
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY Customer;

-- Q4. Show the total quantity sold per sale_date. If the total quantity is > 10, label it as "Bulk Day".
SELECT 
    sale_date AS Date,
    SUM(quantity) AS Total_Quantity,
    CASE
        WHEN SUM(quantity) > 10 THEN 'Bulk Day'
    END AS Label
FROM
    sales
GROUP BY Date;

-- Q5. (Challenge) Show each customer's total spending, and categorize them as "VIP" (>= 10000), "Premium" (>= 5000), or "Basic". Sort the results by VIP first.
SELECT 
    c.name AS Customer,
    SUM(s.amount) AS Total_Spending,
    CASE
        WHEN SUM(s.amount) >= 10000 THEN 'VIP'
        WHEN SUM(s.amount) >= 5000 THEN 'Premium'
        ELSE 'Basic'
    END AS Category
FROM
    customers c
        INNER JOIN
    sales s ON c.customer_id = s.customer_id
GROUP BY Customer
ORDER BY Total_Spending DESC;

=XLOOKUP("Notebook",A2:A11, B2:B11, "Out of Stock")
=IFERROR(INDEX(B2:B11, MATCH("Pen", A2:A11, 0)), "Check Name")
=IFERROR(XLOOKUP("Chocolate", A2:A11, B2:B11), "Product not Found")