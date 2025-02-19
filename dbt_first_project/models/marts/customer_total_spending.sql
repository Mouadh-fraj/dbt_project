{{ config(materialized='table'  ) }}

SELECT
    customer_id,
    {{ format_currency('total_spent') }} AS total_spent
FROM {{ ref('customer_lifetime_value') }}
ORDER BY customer_id ASC