-- Day 04: SQL Consolidation Test
-- Date: 17 Sep 2026
-- Topics covered:
--   - GROUP BY + Aggregates (Day 1)
--   - HAVING Clause (Day 2)
--   - INNER JOIN (Day 3)
--   - Mixed queries combining all topics
--
-- Score: 15/15
-- Database: products, sales

create database if not exists day4;
use day4;

create table if not exists products (
	product_id int primary key,
    name varchar(50),
    price decimal(10,2),
    category varchar(50)
);

insert into products values
	(101, 'Pen', 10.00, 'Stationery'),
    (102, 'Notebook', 50.00, 'Stationery'),
    (103, 'Coke', 20.00, 'Beverage'),
    (104, 'Chips', 30.00, 'Snacks'),
    (105, 'Water', 15.00, 'Beverage');

create table if not exists sales(
	sale_id int primary key AUTO_INCREMENT,
	product_id INT,
    amount decimal(10,2),
    quantity int,
    sale_date DATE
);

insert into sales(product_id, amount, quantity, sale_date) values
	(101, 10.00, 5, '2026-09-01'),
(102, 50.00, 2, '2026-09-01'),
(103, 20.00, 4, '2026-09-01'),
(101, 10.00, 3, '2026-09-02'),
(103, 20.00, 6, '2026-09-02'),
(104, 30.00, 2, '2026-09-02'),
(102, 50.00, 1, '2026-09-03'),
(104, 30.00, 4, '2026-09-03'),
(105, 15.00, 8, '2026-09-03'),
(101, 10.00, 10, '2026-09-04');

-- Section A — GROUP BY + Aggregates (Day 1)
-- Q1. Show the total amount for each sale_date.
select sale_date, sum(amount) as total_amount from sales group by sale_date;

-- Q2. Show the number of sales for each product_id.
select product_id, count(*) as number_of_sales from sales group by product_id;

-- Q3. Show the average quantity for each product_id, sorted highest first.
select product_id, avg(quantity) as avg_quantity FROM sales GROUP BY product_id order by avg_quantity desc;

-- Section B — HAVING (Day 2)
-- Q4. Show product_ids where the total quantity is greater than 10.
select product_id, sum(quantity) as total_quantity FROM sales group by product_id having total_quantity > 10;

-- Q5. Show sale_dates where the average amount is 20 or more.
select sale_date, avg(amount) as avg_amount from sales group by sale_date having avg_amount >= 20;

-- Q6. Show product_ids where the number of sales is more than 1 AND the total amount is greater than 40.
select product_id, COUNT(*) as number_of_sales, sum(amount) as total_amount from sales GROUP BY product_id having number_of_sales > 1 and total_amount > 40;

-- Section C — INNER JOIN (Day 3)
-- Q7. Show all sales with the product name and amount.
select p.name, s.amount from sales s inner join products p on s.product_id = p.product_id;

-- Q8. Show sale_id, product name, price, and quantity for all sales.
select s.sale_id, p.name, p.price, s.quantity from sales s inner join products p on s.product_id = p.product_id;

-- Q9. Show only sales where the product category is 'Beverage'.
select s.sale_id, s.product_id, s.amount, s.quantity, s.sale_date FROM sales s inner JOIN products p on s.product_id = p.product_id where p.category = 'Beverage';

-- Q10. Show total amount per product name, sorted by total highest first.
select p.name, sum(s.amount) as total_amount from sales s inner JOIN products p on s.product_id = p.product_id GROUP BY p.name order by total_amount desc;

-- Q11. Show product names where the total quantity sold is greater than 5.
select p.name, sum(quantity) as total_quantity from sales s inner join products p on s.product_id = p.product_id group by p.name having total_quantity > 5;

-- Section D — Mixed (All Days)
-- Q12. Show product names where the average amount is 15 or more, but only include sales from 2026-09-02 onwards.
select p.name, avg(s.amount) as avg_amount from sales s inner join products p on s.product_id = p.product_id where s.sale_date >= '2026-09-02' group by p.name having avg_amount >= 15;

-- Q13. Show sale_dates where the total amount is greater than 30, but exclude the Beverage category.
select s.sale_date, sum(s.amount) as total_amount from sales s inner join products p on s.product_id = p.product_id where p.category != 'Beverage' group by s.sale_date having total_amount > 30;

-- Q14. Show product names where the highest quantity sold in a single sale is 5 or more.
select p.name, max(s.quantity) 
FROM sales 
s inner JOIN products p on s.product_id = p.product_id 
group by p.name 
having max(s.quantity) >= 5;

-- Q15. (Challenge) Show category names with:
-- Total sales amount
-- Number of sales
-- Average quantity per sale
-- Sorted by total sales highest first, only include categories with total sales > 50.
select p.category, 
sum(s.amount) as total_sales_amount, COUNT(*) as number_of_sales, avg(s.quantity) as avg_quantity
from sales s inner join products p on s.product_id = p.product_id 
GROUP BY p.category having total_sales_amount > 50 order by total_sales_amount desc;