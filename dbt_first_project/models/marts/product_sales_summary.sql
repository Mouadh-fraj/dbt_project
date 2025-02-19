{{ config(materialized='table'  ) }}

WITH sales AS (
    SELECT
        product_id,
        SUM(quantity) AS total_sold,
        SUM(total_price) AS total_revenue
    FROM {{ ref('stg_orders') }}
    GROUP BY product_id
)
SELECT
    p.product_id,
    p.product_name,
    p.category,
    COALESCE(s.total_sold, 0) AS total_sold,
     {{ format_currency('s.total_revenue') }} AS total_revenue
FROM {{ ref('stg_products') }} p
LEFT JOIN sales s ON p.product_id = s.product_id
ORDER BY p.product_id ASC