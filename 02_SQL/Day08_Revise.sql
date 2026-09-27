-- Q1. Show the total quantity sold per category, sorted highest first.
-- select p.category as Category, sum(s.quantity) as Total_Quantity from products p inner join sales s on p.product_id = s.product_id group by Category order by Total_Quantity desc;

-- Q2. Show the average amount per product, sorted highest first.
-- select p.name as Product, avg(s.amount) as Avg_Amount from products p inner join sales s on p.product_id = s.product_id group by Product order by Avg_Amount desc;

-- Q3. Show the highest amount for each customer.
-- select c.name as Customer, max(s.amount) as Highest_Amount from customers c inner join sales s on c.customer_id = s.customer_id group by Customer;

-- Q4. Show categories where total amount > 100.
-- select p.category as Category, sum(s.amount) as Total_Amount from products p inner join sales s on p.product_id = s.product_id group by Category having Total_Amount > 100;

-- Q5. Show customers who made more than 1 purchase.
-- select c.name as Customers, count(*) from customers c inner join sales s on c.customer_id = s.customer_id group by Customers having count(*) > 1;

-- Q6. Show each sale with customer name, product name, quantity, and amount.
-- select c.name as Customers, p.name as Products, s.quantity as Quantity, s.amount as Amount from sales s inner join customers c on s.customer_id = c.customer_id inner join products p on s.product_id = p.product_id;

-- Q7. Show all products and their total quantity. Products with no sales → NULL.
-- select p.name as Product, sum(s.quantity) as Total_Quantity from products p left join sales s on p.product_id = s.product_id group by Product;

-- Q8. Show all customers and their total spending. Customers with no purchases → NULL.
-- select c.name as Customers, sum(s.amount) as Spending from customers c left join sales s on c.customer_id = s.customer_id group by Customers;

-- Q9. Show products whose total revenue is above average (hint: subquery).
-- select p.name as Products, avg(s.amount) as Revenue from products p inner join sales s on p.product_id = s.product_id group by Products having Revenue > ( select avg(amount) from sales);

-- Q10. (Challenge) Show customers who bought products from more than one category.
-- select c.name as Customers from customers c inner join sales s on c.customer_id = s.customer_id inner join products p on p.product_id = s.product_id group by Customers having count(distinct p.category) > 1;