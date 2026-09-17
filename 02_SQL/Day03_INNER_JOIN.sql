use codewithharry;
create table if not exists products(
	product_id int primary key,
    name varchar(50),
    price decimal(10,2),
    category varchar(50)
);

insert into products values
	(101, 'Pen', 10.00, 'Stationary'),
    (102, 'Notebook', 50.00, 'Statinary'),
    (103, 'Coke', 20.00, 'Beverage'),
    (104, 'Chips', 30.00, 'Snacks'),
    (105, 'Water', 15.00, 'Beverage');

create table if not exists sales(
	sale_id int primary key auto_increment,
    product_id int,
    amount decimal(10,2),
    sale_date date
);

insert into sales(product_id, amount, sale_date) values
	(101, 10.00, '2026-09-01'),
    (102, 50.00, '2026-09-01'),
    (103, 20.00, '2026-09-01'),
    (101, 10.00, '2026-09-02'),
    (103, 20.00, '2026-09-02'),
    (104, 30.00, '2026-09-02'),
    (999, 25.00, '2026-09-03');
    
-- Q1. Show all sales with their product name and amount. (INNER JOIN)
select s.sale_id, s.product_id, p.name, s.amount, s.sale_date from sales s inner join products p on s.product_id = p.product_id;

-- Q2. Show sale_id, product name, price, and sale_date for all sales.
select s.sale_id, p.name, s.amount, s.sale_date from sales s inner join products p on s.product_id = p.product_id;

-- Q3. Show only the sales where the product category is 'Beverage'. (JOIN + WHERE)
select s.sale_id, s.product_id, s.amount, s.sale_date from sales s inner join products p on s.product_id = p.product_id where p.category = 'Beverage';

-- Q4. Show total sales amount per product name. (JOIN + GROUP BY)
select p.name, sum(amount) as total_sale_amount from sales s inner join products p on s.product_id = p.product_id group by p.name;

-- Q5. (Challenge) Show product name and total sales amount per product, sorted by total highest first, and only include products with total sales greater than 20.
select p.name, sum(s.amount) from sales s inner join products p on s.product_id = p.product_id group by p.name having sum(s.amount) > 20 order by sum(s.amount) desc;