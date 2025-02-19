

WITH source AS (
    SELECT
        order_id,
        customer_id,
        product_id,
        quantity,
        order_date,
        total_price,
        shipping_address
    FROM `starry-diode-450809-k0.dbt_database.orders`
)
SELECT * FROM source
WHERE order_id IS NOT NULL
