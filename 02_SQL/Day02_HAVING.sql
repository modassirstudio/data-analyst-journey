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

-- Q1. Show categories where the total sales amount is greater than 50.
select category, sum(amount) as total_sales from sales group by category having total_sales > 50;

-- Q2. Show products where the number of sales is more than 1.
select product, count(*) as number_of_sales from sales group by product having count(*) > 1;

-- Q3. Show categories where the average sale amount is greater than 20, sorted by average highest first.
select category, avg(amount) as avg_sale from sales group by category having avg(amount) > 20 order by avg_sale desc;

-- Q4. Show products where the highest sale amount is 30 or more.
select product, max(amount) as highest_sale from sales group by product having highest_sale >= 30;

-- Q5. (Challenge) Show categories where the total sales amount is greater than 40, but only include sales from 2026-09-02 onwards.
select category, sum(amount) as total_sales from sales where sale_date >= '2026-09-02' group by category having total_sales > 40;

-- Q6. Show categories where the total sales amount is greater than 30, but only include sales where amount > 10. Sort by total highest first.
select category, sum(amount) as total_sales from sales where amount > 10 group by category having total_sales > 30 order by total_sales desc;

-- Q7. Show products where the average sale amount is 15 or more, and the product had more than 1 sale.
select product, avg(amount) as avg_sale, count(* ) as number_of_sales from sales group by product having avg_sale >= 15 and number_of_sales > 1;

-- Q8. (Challenge) Show sale_date where the total sales amount is greater than 40, only include Beverage category, sorted by date ascending.
select sale_date, sum(amount) as total_sales from sales where category = 'Beverage' group by sale_date having total_sales > 40 order by sale_date asc; 

-- Q1. Show the highest sale amount for each category.
select category, max(amount) as highest_sale from sales group by category;

-- Q2. Show the lowest sale amount for each product.
select product, min(amount) as lowest_sale from sales group by product;

-- Q3. Show the total sales amount for each sale_date.
select sale_date, sum(amount) as sales_amount from sales group by sale_date;

-- Q4. Show the number of sales for each category.
select category, count(*) as number_of_sales from sales group by category;

-- Q5. Show categories where the total sales amount is greater than 40.
select category, sum(amount) as total_sales from sales group by category having total_sales > 40;

-- Q6. Show products where the average sale amount is 20 or more, but only include sales where amount > 10.
select product, avg(amount) as avg_sale from sales where amount > 10 group by product having avg_sale > 20;

-- Q7. Show sale_dates where the total sales amount is greater than 30, but only include the Snacks category.
select sale_date, sum(amount) as total_amount from sales where category = 'Snacks' group by sale_date having total_amount > 30; -- no snacks category has total sales amount greater than 30

-- Q8. Show products where the number of sales is more than 1 AND the highest sale amount is 30 or more.
select product, count(*) as number_of_sales, max(amount) as highest_sale from sales group by product having number_of_sales > 1 and highest_sale >= 30; -- enjoyed this question i just wrote the line like i owned it, no effort

-- Q9. Show categories where the average sale amount is between 15 and 40, sorted by average lowest first.
select category, avg(amount) as avg_sale from sales group by category having avg_sale between 15 and 40 order by avg_sale asc;

-- Q10. (Challenge) Show sale_dates where the total sales amount is greater than 30, but only include sales where amount >= 20, and exclude the Beverage category, sorted by date ascending.
select sale_date, sum(amount) as total_sale from sales where amount >= 20 and category != 'Beverage' group by sale_date having total_sale > 30 order by sale_date asc;
