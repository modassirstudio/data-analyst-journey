# Portfolio Projects

Real-world data analysis projects built from scratch.

## Projects

### 1. Shop Sales Analysis Database (SQL)

**File:** `Shop_Sales_Analysis_DB.sql`

**Date:** 19 Sep 2026

**Description:**
A SQL portfolio project simulating a shop's sales system. Built with 3 normalized tables and 10 business analysis queries.

**Database Design:**
- `products` — 10 products across 4 categories (Stationery, Beverage, Snacks)
- `customers` — 5 customers from 3 cities
- `sales` — 20 transactions with quantity and amount

**Relationships:**
- `sales.product_id` → `products.product_id`
- `sales.customer_id` → `customers.customer_id`

**Analysis Questions Answered:**
1. Total sales amount per category
2. Top 5 best-selling products by quantity
3. Customers who spent more than ₹500
4. Products with zero sales (LEFT JOIN)
5. Average sale amount per day
6. Best day of the week by sales
7. City-wise customer count and total sales
8. Products that need restocking (stock < 20)
9. Monthly sales trend
10. Customer who bought the most items

**Skills Demonstrated:**
- Database design (normalization, foreign keys)
- Data insertion (single and multi-row INSERT)
- Aggregation: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `GROUP BY` and `HAVING` clauses
- `INNER JOIN` and `LEFT JOIN`
- Date functions: `YEAR()`, `MONTH()`, `MONTHNAME()`, `DAYNAME()`
- `COUNT(DISTINCT)` for unique counts
- `ORDER BY` and `LIMIT`

**Tools Used:**
- MySQL
- SQL

**How to Run:**
1. Open MySQL / MySQL Workbench
2. Run the `Shop_Sales_Analysis_DB.sql` file
3. All tables will be created and data inserted
4. Queries will execute in order

---

## Upcoming Projects

- **Power BI Dashboard** — Multi-page interactive dashboard from shop sales data
- **Python Data Analysis** — Pandas-based analysis with visualization
- **Excel Automation** — Automated reporting with Power Query

---

## About Me

Self-taught data analyst building real projects from real business data. Currently preparing for Gulf entry-level Data Analyst roles.

- GitHub: https://github.com/modassirstudio
- Portfolio: https://modassirstudio.github.io/Portfolio/
