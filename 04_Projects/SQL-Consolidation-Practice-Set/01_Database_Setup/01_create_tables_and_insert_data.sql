-- Database setup
-- 1. Create a database named retail_analytics.
CREATE DATABASE IF NOT EXISTS retail_analytics;

-- 2. Select this database for use.
USE retail_analytics;

-- 3. Create the customers and products tables with the columns and constraints.
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    age INT
);

CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10 , 2 )
);

-- 4. Create the orders table, including the foreign key relationships.
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    status VARCHAR(30),
    FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id),
    FOREIGN KEY (product_id)
        REFERENCES products (product_id)
);

-- 5. Insert the sample data into all three tables.
INSERT INTO customers VALUES
	(1, 'Ahmed', 'Dubai', 'UAE', 28),
	(2, 'Sara', 'Abu Dhabi', 'UAE', 34),
	(3, 'Rahul', 'Delhi', 'India', 25),
	(4, 'Fatima', 'Sharjah', 'UAE', 41),
	(5, 'Omar', 'Riyadh', 'Saudi Arabia', 30),
	(6, 'Priya', 'Mumbai', 'India', 27),
	(7, 'Ali', 'Doha', 'Qatar', 36),
	(8, 'Zain', 'Dubai', 'UAE', 22)
;

INSERT INTO products VALUES
	(101, 'Laptop', 'Electronics', 2500.00),
	(102, 'Mouse', 'Accessories', 50.00),
	(103, 'Keyboard', 'Accessories', 120.00),
	(104, 'Monitor', 'Electronics', 800.00),
	(105, 'Chair', 'Furniture', 450.00),
	(106, 'Desk', 'Furniture', 700.00),
	(107, 'Headphones', 'Electronics', 300.00)
;

INSERT INTO orders VALUES
	(1001, 1, 101, 1, '2026-01-05', 'Completed'),
	(1002, 2, 102, 3, '2026-01-06', 'Completed'),
	(1003, 1, 104, 2, '2026-01-10', 'Completed'),
	(1004, 3, 103, 2, '2026-01-12', 'Pending'),
	(1005, 4, 105, 1, '2026-01-15', 'Completed'),
	(1006, 5, 106, 2, '2026-01-17', 'Cancelled'),
	(1007, 2, 107, 2, '2026-01-20', 'Completed'),
	(1008, 6, 102, 5, '2026-01-22', 'Completed'),
	(1009, 7, 101, 1, '2026-02-01', 'Pending'),
	(1010, 8, 104, 1, '2026-02-03', 'Completed'),
	(1011, 3, 105, 2, '2026-02-05', 'Completed'),
	(1012, 1, 107, 1, '2026-02-08', 'Completed'),
	(1013, 5, 103, 3, '2026-02-10', 'Pending'),
	(1014, 4, 106, 1, '2026-02-12', 'Completed'),
	(1015, 6, 101, 1, '2026-02-15', 'Cancelled')
;