-- 03_reporting.sql

-- (a) Product revenue tiers by Delivered revenue
WITH product_revenue AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(o.amount_inr) AS total_revenue
    FROM products p
    LEFT JOIN orders o
      ON p.product_id = o.product_id
     AND o.status = 'Delivered'
    GROUP BY p.product_id, p.product_name
)
SELECT
    product_id,
    product_name,
    COALESCE(total_revenue, 0) AS total_revenue,
    CASE
        WHEN COALESCE(total_revenue, 0) >= 3000 THEN 'High'
        WHEN COALESCE(total_revenue, 0) >= 1000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_tier
FROM product_revenue
ORDER BY total_revenue DESC;

-- (b) Monthly-by-category business report
SELECT
    p.category AS category,
    strftime('%Y-%m', o.order_date) AS month,
    COUNT(o.order_id) AS order_count,
    SUM(o.amount_inr) AS total_revenue,
    AVG(o.amount_inr) AS avg_revenue
FROM orders o
INNER JOIN products p ON o.product_id = p.product_id
WHERE o.status = 'Delivered'
GROUP BY p.category, strftime('%Y-%m', o.order_date)
ORDER BY category, month;

-- (c) Category target variance report
WITH category_revenue AS (
    SELECT
        p.category,
        SUM(o.amount_inr) AS total_revenue
    FROM orders o
    INNER JOIN products p ON o.product_id = p.product_id
    WHERE o.status = 'Delivered'
    GROUP BY p.category
)
SELECT
    cr.category,
    cr.total_revenue,
    ct.target_revenue_inr,
    (ct.target_revenue_inr - cr.total_revenue) AS variance,
    ((cr.total_revenue - ct.target_revenue_inr) * 100.0) / ct.target_revenue_inr AS percentage_variance,
    CASE
        WHEN cr.total_revenue >= ct.target_revenue_inr THEN 'Above Target'
        WHEN (ct.target_revenue_inr - cr.total_revenue) <= ct.target_revenue_inr * 0.15
            THEN 'Below Target - Watch'
        ELSE 'Below Target - Critical'
    END AS target_status
FROM category_revenue cr
INNER JOIN category_targets ct ON cr.category = ct.category
ORDER BY cr.category;
