-- Verification results for deterministic BigBasket capstone dataset
-- SELECT COUNT(*) FROM products;  -- 31
-- SELECT COUNT(*) FROM customers; -- 50
-- SELECT COUNT(*) FROM orders;    -- 500
-- SELECT COUNT(*) FROM category_targets; -- 6
-- SELECT status, COUNT(*) FROM orders GROUP BY status ORDER BY status;
-- Cancelled = 42, Delivered = 434, Pending = 24

SELECT 'products' AS table_name, COUNT(*) AS row_count FROM products
UNION ALL SELECT 'customers', COUNT(*) FROM customers
UNION ALL SELECT 'orders', COUNT(*) FROM orders
UNION ALL SELECT 'category_targets', COUNT(*) FROM category_targets;

SELECT status, COUNT(*) AS order_count
FROM orders
GROUP BY status
ORDER BY status;
