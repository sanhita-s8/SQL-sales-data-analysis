USE ecommerce_sales;

-- =========================================================
-- E-COMMERCE SALES ANALYSIS
-- =========================================================


-- 1. Total revenue from completed orders
SELECT
    SUM(total_amount) AS total_revenue
FROM orders
WHERE status = 'Completed';


-- 2. Total number of completed orders
SELECT
    COUNT(*) AS total_completed_orders
FROM orders
WHERE status = 'Completed';


-- 3. Revenue by product category
SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS category_revenue
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY p.category
ORDER BY category_revenue DESC;


-- 4. Top 5 customers by revenue
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 5;


-- 5. Monthly revenue
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(total_amount) AS monthly_revenue
FROM orders
WHERE status = 'Completed'
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY month;


-- 6. Average order value
SELECT
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
WHERE status = 'Completed';


-- 7. Products ranked by revenue
SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS revenue,
    RANK() OVER (
        ORDER BY SUM(oi.quantity * oi.unit_price) DESC
    ) AS revenue_rank
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'Completed'
GROUP BY p.product_id, p.product_name;


-- 8. Customers with more than one completed order
SELECT
    c.customer_name,
    COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1
ORDER BY order_count DESC;


-- 9. Revenue contribution by customer
WITH customer_revenue AS (
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(o.total_amount) AS revenue
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    WHERE o.status = 'Completed'
    GROUP BY c.customer_id, c.customer_name
)
SELECT
    customer_name,
    revenue,
    ROUND(
        revenue * 100.0 / SUM(revenue) OVER (),
        2
    ) AS revenue_percentage
FROM customer_revenue
ORDER BY revenue DESC;


-- 10. Month-over-month revenue comparison
WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(total_amount) AS revenue
    FROM orders
    WHERE status = 'Completed'
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue,
    revenue - LAG(revenue) OVER (ORDER BY month) AS revenue_change
FROM monthly_revenue
ORDER BY month;


-- 11. Completed vs cancelled orders
SELECT
    status,
    COUNT(*) AS order_count,
    SUM(total_amount) AS order_value
FROM orders
GROUP BY status;


-- 12. Customers and their latest order
WITH ranked_orders AS (
    SELECT
        c.customer_name,
        o.order_id,
        o.order_date,
        o.total_amount,
        ROW_NUMBER() OVER (
            PARTITION BY c.customer_id
            ORDER BY o.order_date DESC
        ) AS order_rank
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
)
SELECT
    customer_name,
    order_id,
    order_date,
    total_amount
FROM ranked_orders
WHERE order_rank = 1;
