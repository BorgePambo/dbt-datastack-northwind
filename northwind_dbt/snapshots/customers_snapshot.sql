-- snapshots/customers_snapshot.sql
{% snapshot customers_snapshot %}
{{
  config(
    target_schema='snapshots',
    unique_key='customerid',
    strategy='check',
    check_cols=['contactname', 'address', 'phone', 'city', 'country']
  )
}}

SELECT *
FROM {{ ref('stg_customers') }}

{% endsnapshot %}
