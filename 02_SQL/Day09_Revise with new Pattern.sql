-- Q1. Show the average quantity sold per product, sorted highest first.
select p.name as Product, avg(s.quantity) as Avg_quantity from products p inner join sales s on p.product_id = s.product_id group by Product order by Avg_quantity desc;

-- Q2. Show customers who made purchases in September 2026, with their total spending.
select c.name as Customer, sum(s.amount) as Spending from customers c inner join sales s on c.customer_id = s.customer_id where s.sale_date >= '2026-09-01' group by Customer;

-- Q3. Show the highest quantity sold in a single sale per category.
select p.category as Category, max(s.quantity) as Highest_quantity from products p inner join sales s on p.product_id = s.product_id group by Category;

-- Q4. Show categories where the average amount is above 25.
select p.category as Category, avg(s.amount) as Avg_amount from products p inner join sales s on p.product_id = s.product_id group by Category having Avg_amount > 25;

-- Q5. Show customers who bought more than 3 items total.
select c.name as Customer, sum(s.quantity) as Items from customers c inner join sales s on c.customer_id = s.customer_id group by Customer having Items > 3;

-- Q6. Show each sale with: customer name, product name, category, quantity, amount, and date.
select c.name as Customer, p.name as Product, p.category as Category, s.quantity as Quantity, s.amount as Amount, s.sale_date as Date from sales s inner join customers c on s.customer_id = c.customer_id inner join products p on s.product_id = p.product_id;

-- Q7. Show all categories and their total revenue. Categories with no sales → NULL.
select p.category as Category, sum(s.amount) as Revenue from products p left join sales s on p.product_id = s.product_id group by Category;

-- Q8. Show all customers and their total spending. Sort descending.
select c.name as Customer, sum(s.amount) as Spending from customers c inner join sales s on c.customer_id = s.customer_id group by Customer order by Spending desc;

-- Q9. Show products that have never been sold (LEFT JOIN + NULL check).
select p.name as Product from products p left join sales s on p.product_id = s.product_id where s.sale_id is null;

-- Q10. (Challenge) Show customers whose total spending is above the overall average customer spending.
select c.name as Customers, sum(s.amount) as Spending from customers c inner join sales s on c.customer_id = s.customer_id group by Customers having Spending > (select avg(amount) from sales);