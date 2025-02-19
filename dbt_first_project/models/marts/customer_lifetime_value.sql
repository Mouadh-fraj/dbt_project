{{ config(materialized='table') }}

WITH orders AS (
    SELECT
        customer_id,
        SUM(total_price) AS total_spent,
        COUNT(order_id) AS total_orders
    FROM {{ ref('stg_orders') }}
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COALESCE(o.total_spent, 0) AS total_spent,
    COALESCE(o.total_orders, 0) AS total_orders
FROM {{ ref('stg_customers') }} c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY c.customer_id ASC

