-- INSERT, UPDATE and DELETE

-- 13. Insert a new customer: customer ID 9, name Khalid, city Muscat, country Oman, age 32.
INSERT INTO 
	customers 
VALUES
	(9,'Khalid', 'Muscat', 'Oman', 32)
;

-- 14. Add a new product: ID 108, product name Tablet, category Electronics, price 1500.
INSERT INTO 
	products
VALUES
	(108, 'Tablet', 'Electronics', 1500.00)
;

-- 15. Update the price of the Mouse from 50 to 60.
UPDATE products 
SET 
    price = 60
WHERE
    product_name = 'Mouse';

-- 16. Change the status of order 1004 from Pending to Completed.
UPDATE orders 
SET 
    status = 'Completed'
WHERE
    order_id = 1004;

-- 17. Delete customer 9 from the database.
DELETE FROM customers 
WHERE
    customer_id = 9;