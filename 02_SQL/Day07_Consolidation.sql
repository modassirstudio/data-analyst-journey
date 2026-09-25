-- Q1. Show the total quantity sold per product, sorted highest first.
select p.name as Product, sum(s.quantity) as Total_Quantity from products p inner join sales s on p.product_id = s.product_id group by Product order by Total_Quantity desc;

-- Q2. Show the average price per category.
select category, avg(price) from products group by category;

-- Q3. Show the highest amount per customer.
select c.name as Customer, max(s.amount) as highest_amount from customers c inner join sales s on c.customer_id = s.customer_id group by c.name order by highest_amount desc;

-- Q4. Show categories where the total amount is greater than ₹300.
select p.category as Categories, sum(s.amount) as total_amount from products p inner join sales s on p.product_id = s.product_id group by p.category having total_amount > 300;

-- Q5. Show products where the average quantity per sale is more than 2.
select p.name as Products, avg(s.quantity) as avg_quantity from products p inner join sales s on p.product_id = s.product_id group by p.name having avg_quantity > 2;

-- Q6. Show each sale with customer name, product name, and amount.
SELECT c.name AS Customer, p.name AS Product, s.amount AS Amount, s.sale_date
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
INNER JOIN customers c ON s.customer_id = c.customer_id
ORDER BY s.sale_date;

-- Q7. Show all customers and their total purchases. Customers with no purchases should show NULL.
select c.name as Customers, sum(s.amount) as Total_Purcahse from customers c left join sales s on c.customer_id = s.customer_id group by c.name;

-- Q8. Show all products and their total quantity sold. Products with no sales should show NULL.
select p.name as Products, sum(s.quantity) as Total_Quantity from products p left join sales s on p.product_id = s.product_id group by p.name;

-- Q9. Show customer names and their most expensive single purchase.
SELECT c.name AS Customer, MAX(s.amount) AS Most_Expensive_Purchase
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.name;

-- Q10. Show product names that were sold in September 2026 but never in 2025 (hint: use NOT IN or LEFT JOIN with condition).
SELECT DISTINCT p.name AS Product
FROM products p
INNER JOIN sales s ON p.product_id = s.product_id
WHERE YEAR(s.sale_date) = 2026 AND MONTH(s.sale_date) = 9
  AND p.product_id NOT IN (
    SELECT product_id FROM sales WHERE YEAR(sale_date) = 2025
  );

-- Q1. Show the total amount sold per month (just month name, no year).
select monthname(sale_date) as Month, sum(amount) as Total_Amount from sales group by monthname(sale_date);

-- Q2. Show the highest quantity sold in a single sale per product.
select p.name as Product, max(s.quantity) as Highest_Quantity from products p inner join sales s on p.product_id = s.product_id group by p.name;

-- Q3. Show the average amount per customer, sorted highest first.
select c.name as Customer, avg(s.amount) as avg_amount from customers c inner join sales s on c.customer_id = s.customer_id group by c.name order by avg(s.amount) desc;

-- Q4. Show customers who made more than 2 purchases.
select c.name as Customers, count(*) as Purchases from customers c inner join sales s on c.customer_id = s.customer_id group by c.name having count(*) > 2;

-- Q5. Show products where the total quantity sold is greater than 5.
select p.name as Product, sum(s.quantity) as Total_Quantity from products p inner join sales s on p.product_id = s.product_id group by p.name having sum(s.quantity) > 5;

-- Q6. Show all sales with product name, customer name, quantity, and date.
select p.name as Product, c.name as Customer, s.quantity as Quantity, s.sale_date as Date from sales s inner join products p on s.product_id = p.product_id inner join customers c on s.customer_id = c.customer_id;

-- Q7. Show all products and their total revenue. Products with no sales → NULL.
select p.name as Product, sum(s.amount) as Revenue from products p left join sales s on p.product_id = s.product_id group by p.name;

-- Q8. Show all customers and their total spending. Customers with no purchases → NULL.
select c.name as Customers, sum(s.amount) as Spending from customers c left join sales s on c.customer_id = s.customer_id group by c.name;

-- Q9. Show customers who bought products from more than one category.
select c.name as Customers from customers c inner join sales s on c.customer_id = s.customer_id inner join products p on s.product_id = p.product_id group by c.name having count(distinct p.category) > 1;

-- Q10. (Challenge) Show products whose average sale amount is higher than the overall average sale amount. (Hint: subquery)
select p.name as Product, avg(s.amount) as avg_amount from products p inner join sales s on p.product_id = s.product_id group by p.name having avg(s.amount) > ( select avg(amount) from sales);