

WITH source AS (
    SELECT
        customer_id,
        LOWER(first_name) AS first_name,
        LOWER(last_name) AS last_name,
        email,
        birthdate,
        address,
        cc,
        cc_type
    FROM `starry-diode-450809-k0.dbt_database.customer`
)
SELECT * FROM source
WHERE customer_id IS NOT NULL