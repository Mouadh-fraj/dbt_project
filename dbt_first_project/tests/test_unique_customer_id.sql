SELECT
    customer_id
FROM {{ ref('stg_customers') }}
GROUP BY customer_id
HAVING COUNT(customer_id) > 1
