


WITH source AS (
    SELECT
        product_id,
        LOWER(product_name) AS product_name,
        price,
        expiration_date,
        category
    FROM `starry-diode-450809-k0.dbt_database.products`
)
SELECT * FROM source
WHERE product_id IS NOT NULL
