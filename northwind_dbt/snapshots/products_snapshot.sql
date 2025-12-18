{% snapshot products_snapshot %}
{{
  config(
    target_schema='snapshots',
    unique_key='productid',
    strategy='check',
    check_cols=['productname', 'unitprice', 'unitsinstock']
  )
}}

SELECT *
FROM {{ ref('stg_products') }}

{% endsnapshot %}
