create database sep18_Practice;
use sep18_Practice;

CREATE TABLE products (
  product_id INT PRIMARY KEY,
  name VARCHAR(50),
  price DECIMAL(10,2),
  category VARCHAR(50)
);

INSERT INTO products VALUES
(101, 'Pen', 10.00, 'Stationery'),
(102, 'Notebook', 50.00, 'Stationery'),
(103, 'Coke', 20.00, 'Beverage'),
(104, 'Chips', 30.00, 'Snacks'),
(105, 'Water', 15.00, 'Beverage'),
(106, 'Chocolate', 45.00, 'Snacks'),
(107, 'Marker', 25.00, 'Stationery');

CREATE TABLE sales (
  sale_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  quantity INT,
  amount DECIMAL(10,2),
  sale_date DATE
);

INSERT INTO sales (product_id, quantity, amount, sale_date) VALUES
(101, 5, 10.00, '2026-09-01'),
(102, 2, 50.00, '2026-09-01'),
(103, 4, 20.00, '2026-09-01'),
(101, 3, 10.00, '2026-09-02'),
(103, 6, 20.00, '2026-09-02'),
(104, 2, 30.00, '2026-09-02'),
(102, 1, 50.00, '2026-09-03'),
(104, 4, 30.00, '2026-09-03'),
(105, 8, 15.00, '2026-09-03'),
(101, 10, 10.00, '2026-09-04'),
(106, 3, 45.00, '2026-09-04'),
(103, 5, 20.00, '2026-09-05');

-- Q1. Show the total quantity sold per sale_date.
select sale_date, sum(quantity) FROM sales GROUP BY sale_date;

-- Q2. Show the total amount per product_id, sorted highest first.
select product_id, sum(amount) from sales group by product_id order by sum(amount) desc;

-- Q3. Show product_ids where the total quantity is greater than 5.
select product_id, sum(quantity) from sales group by product_id having sum(quantity) > 5;

-- Q4. Show sale_dates where the average amount is 20 or more.
select sale_date, avg(amount) from sales group by sale_date having avg(amount) >= 20;

-- Q5. Show product_ids where the number of sales is more than 1 AND the total amount > 30.
select product_id, count(sale_id), sum(amount) from sales GROUP BY product_id having count(sale_id) > 1 and sum(amount) > 30;

-- Q6. Show product name and quantity for all sales.
select p.name, s.quantity from products p inner join sales s on p.product_id = s.product_id;

-- Q7. Show all sales with product name, price, and date — only for Beverage category.
select p.name, p.price, s.sale_date from products p inner join sales s on p.product_id = s.product_id where p.category = 'Beverage';

-- Q8. Show total amount per product name, sorted highest first.
select p.name, sum(amount) from products p inner join sales s on p.product_id = s.product_id group by p.name order by sum(amount) desc;

-- Q9. Show all products with their total sales amount. Products with no sales should show NULL.
select p.name, sum(amount) from products p left join sales s on p.product_id = s.product_id group by p.name;

-- Q10. Show only products that have never been sold.
select p.name from products p left join sales s on p.product_id = s.product_id where s.sale_id is null;