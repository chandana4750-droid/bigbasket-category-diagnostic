-- 01_foundations.sql
-- 1. SELECT / WHERE: orders from Bengaluru
SELECT * FROM orders
WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = 'Bengaluru');

-- 2. DISTINCT: every distinct category
SELECT DISTINCT category
FROM products
ORDER BY category;

-- 3. ORDER BY + LIMIT: five highest-value orders
SELECT *
FROM orders
ORDER BY amount_inr DESC
LIMIT 5;

-- 4. Alias (AS)
SELECT COUNT(*) AS total_orders
FROM orders;

-- 5. IN: orders using two payment modes
SELECT *
FROM orders
WHERE payment_mode IN ('UPI', 'Credit Card');

-- 6. BETWEEN
SELECT *
FROM orders
WHERE amount_inr BETWEEN 100 AND 500;

-- 7. NOT BETWEEN
SELECT *
FROM orders
WHERE amount_inr NOT BETWEEN 100 AND 500;

-- 8. IS NULL: unrated orders
SELECT *
FROM orders
WHERE rating IS NULL;
