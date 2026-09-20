# Shop Sales Analysis Database

A SQL portfolio project simulating a shop's sales system.

## Database Design

- `products` — 10 products across 4 categories
- `customers` — 5 customers from 3 cities
- `sales` — 20 transactions

## Tables & Relationships

- `sales.product_id` → `products.product_id`
- `sales.customer_id` → `customers.customer_id`

## Analysis Questions Answered

1. Total sales amount per category
2. Top 5 best-selling products by quantity
3. Customers who spent more than ₹500
4. Products with zero sales
5. Average sale amount per day
6. Best day of the week by sales
7. City-wise customer count and total sales
8. Products that need restocking
9. Monthly sales trend
10. Customer who bought the most items

## Skills Demonstrated

- Database design (normalization, foreign keys)
- Data insertion
- Aggregation (GROUP BY, HAVING)
- JOINs (INNER, LEFT)
- Date functions (YEAR, MONTH, DAYNAME)
- DISTINCT for unique counts
- Subqueries (if added)

## Tools

- MySQL
- SQL

## How to Run

1. Open MySQL
2. Run the `.sql` file
3. All queries will execute in order
