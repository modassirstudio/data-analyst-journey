create database if NOT exists day5;
use day5;

create table if NOT exists products(
	product_id int primary key,
    name varchar(50)
);

insert into products value
(101, 'Pen'),
(102, 'Notebook'),
(103, 'Coke'),
(104, 'Chips'),
(105, 'Water');

create table if NOT exists sales(
	sale_id int primary key AUTO_INCREMENT,
    product_id int,
    amount int
);
    
insert INTO sales(product_id, amount) values
	(101, 10),
    (101, 10),
    (102, 50),
    (103, 20);

select p.name, sum(s.amount) as total_sales from products p inner join sales s on p.product_id = s.product_id GROUP BY p.name;

select p.name, sum(s.amount) as total_sales from products p left join sales s on p.product_id = s.product_id group by p.name;

select p.name as Products from products p left join sales s on p.product_id = s.product_id where s.product_id is null;

DROP table if exists products;

DROP table if exists sales;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name VARCHAR(50),
  price DECIMAL(10,2)
);

INSERT INTO products VALUES
(101, 'Pen', 10.00),
(102, 'Notebook', 50.00),
(103, 'Coke', 20.00),
(104, 'Chips', 30.00),
(105, 'Water', 15.00),
(106, 'Chocolate', 45.00);

CREATE TABLE sales (
  sale_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  amount DECIMAL(10,2),
  sale_date DATE
);

INSERT INTO sales (product_id, amount, sale_date) VALUES
(101, 10.00, '2026-09-01'),
(102, 50.00, '2026-09-01'),
(103, 20.00, '2026-09-01'),
(101, 10.00, '2026-09-02'),
(103, 20.00, '2026-09-02'),
(104, 30.00, '2026-09-02'),
(102, 50.00, '2026-09-03'),
(104, 30.00, '2026-09-03'),
(105, 15.00, '2026-09-03');

-- Q1. Show all products with their total sales amount. Products without sales should show NULL.
select p.name as Products, sum(s.amount) as total_sales from products p left join sales s on p.product_id = s.product_id GROUP BY p.name;

-- Q2. Show all products with their number of sales. Products without sales should show 0 or NULL.
select p.name as Products, count(s.sale_id) as number_of_sales from products p left join sales s on p.product_id = s.product_id group by p.name;

-- Q3. Show only the products that have never been sold (no sales at all).
select p.name as Products from products p left join sales s on p.product_id = s.product_id where s.sale_id is null;

-- Q4. Show all products and their sales for the date 2026-09-02 only. Products with no sales on that date should still appear (with NULL).
select p.name as Products, count(s.sale_id) as sales from products p left join sales s on p.product_id = s.product_id and s.sale_date = '2026-09-02' group by Products; -- your question is wrong i think

-- Q5. (Challenge) Show all products with total sales amount. Sort by total sales highest first, and put NULLs last.
select p.name as Products, sum(s.amount) as total_sales_amount from products p left join sales s on p.product_id = s.product_id group by Products order by total_sales_amount desc; -- the nulls placed at last automatically which is what i expected

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 🎯 Q1 — INNER JOIN + Filter
-- Show product name and total sales amount for products that have at least one sale. Sort by total sales highest first.
select p.name as Product_name, sum(s.amount) as total_sales_amount from products p inner join sales s on p.product_id = s.product_id group by Product_name order by total_sales_amount desc;

-- 🎯 Q2 — LEFT JOIN + NULL check
-- Show all products and their total sales amount. Products with no sales should show NULL.
select p.name as Products, sum(s.amount) as total_sales_amount from products p left join sales s on p.product_id = s.product_id group by Products;

-- 🎯 Q3 — LEFT JOIN + WHERE trap
-- Show all products and their sales for 2026-09-03 only. Products with no sales on that date should still appear (with NULL).
select p.name Products, count(s.sale_id) as sales from products p left join sales s on p.product_id = s.product_id and sale_date = '2026-09-03' group by Products;
