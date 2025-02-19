{% snapshot snapshot_orders %}

{{
    config(
        target_database='starry-diode-450809-k0',
        target_schema='snapshots',
        unique_key='order_id',
        strategy='check',
        check_cols=['status', 'total_price', 'customer_id']
    )
}}

SELECT * FROM starry-diode-450809-k0.dbt_database.orders

{% endsnapshot %}
