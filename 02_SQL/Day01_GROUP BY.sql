-- GROUP BY Practice | 14 Sep 2026 | 10 questions
-- Topics: COUNT, SUM, AVG, MIN, MAX, GROUP BY, ORDER BY

create database if not exists deepseek;
use deepseek;

CREATE TABLE IF NOT EXISTS sales (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product VARCHAR(50),
  category VARCHAR(50),
  amount INT,
  sale_date DATE
);

INSERT INTO sales (product, category, amount, sale_date) VALUES
('Pen', 'Stationery', 10, '2026-09-01'),
('Notebook', 'Stationery', 50, '2026-09-01'),
('Coke', 'Beverage', 20, '2026-09-01'),
('Pen', 'Stationery', 10, '2026-09-02'),
('Coke', 'Beverage', 20, '2026-09-02'),
('Chips', 'Snacks', 30, '2026-09-02'),
('Notebook', 'Stationery', 50, '2026-09-03'),
('Chips', 'Snacks', 30, '2026-09-03'),
('Water', 'Beverage', 15, '2026-09-03');

-- Q1. Show the total sales amount for each category.
select category, sum(amount) as total_sales from sales group by category;

-- Q2. Show the number of sales (count) for each product.
select product, count(*) as number_of_sales from sales group by product;

-- Q3. Show the average sale amount for each category, sorted from highest to lowest.
select category, avg(amount) as average_sale_amount from sales group by category order by average_sale_amount desc;

-- Q4. Show the highest sale amount for each product.
select product, max(amount) as highest_sale_amount from sales group by product;

-- Q5. Show the total sales per day (sale_date), sorted by date.
select sale_date, sum(amount) as total_sales_per_day from sales group by sale_date order by sale_date;

-- Q6. Show the lowest sale amount for each category.
select category, min(amount) as lowest_sale_amount from sales group by category;

-- Q7. Show the number of sales (count) for each category, sorted by count highest first.
select category, count(product) as number_of_sales from sales group by category order by number_of_sales desc;

-- Q8. Show the total sales amount per product, but only include products where the total is greater than 20.
select product, sum(amount) as total_sales_amount from sales group by product having total_sales_amount > 20; -- learned about having from code with harry

-- Q9. Show the average sale amount per sale_date, sorted by date ascending.
select sale_date, avg(amount) as average_sale_amount from sales group by sale_date order by sale_date; -- doesn't need the asc here cuz it automatically show the result in ascending order

-- Q10. (Challenge) Show the total sales amount per category, and also show the number of sales per category in the same result.
select category, sum(amount) as total_sales_amount, count(product) as number_of_sales from sales group by category;
