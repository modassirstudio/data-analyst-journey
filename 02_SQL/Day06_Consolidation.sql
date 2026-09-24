-- Q1. Show total sales amount per category, sorted highest first.
select p.category as Category, sum(s.amount) as Total_sales_amount from products p inner join sales s on p.product_id = s.product_id group by Category order by Total_sales_amount desc;

-- Q2. Show top 5 products by total quantity sold.
select p.name as Products, sum(s.quantity) as Total_quantity from products p inner join sales s on p.product_id = s.product_id group by Products order by Total_quantity desc limit 5;

-- Q3. Show customers who spent more than ₹100, sorted by spending highest first.
select c.name as Customers, sum(s.amount) as Spending from customers c inner join sales s on c.customer_id = s.customer_id group by Customers having Spending > 100 order by Spending desc;

-- Q4. Show products that have never been sold (LEFT JOIN).
select p.name as Products from products p left join sales s on p.product_id = s.product_id where s.sale_id is null;

-- Q5. Show the average sale amount per day, sorted by date.
select sale_date as Day, avg(amount) as Avg_sale_amount from sales group by Day order by Day;

-- Q6. Show the best day of the week by total sales (use DAYNAME).
select dayname(sale_date) as best_day_of_the_week, sum(amount) as total_sales from sales group by best_day_of_the_week order by total_sales desc limit 1;

-- Q7. Show city-wise customer count and total sales.
select c.city as City, sum(s.amount) as Total_sales, count(distinct c.customer_id) as Customer_count from customers c inner join sales s on c.customer_id = s.customer_id group by City;

-- Q8. Show products that need restocking (stock < 20).
select name as Products from products where stock < 20;

-- Q9. Show monthly sales trend (year, month, month_name, total sales).
select year(sale_date) as Year, month(sale_date) as Month, monthname(sale_date) as Month_Name, sum(amount) as total_sales from sales group by Year, Month, Month_Name order by Year, Month;

-- Q10. Show the customer who bought the most items (total quantity).
select c.name as Customer, sum(s.quantity) as total_quantity from customers c inner join sales s on c.customer_id = s.customer_id group by Customer order by total_quantity desc limit 1;