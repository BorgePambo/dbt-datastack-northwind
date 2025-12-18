{% snapshot suppliers_snapshot %}
{{
  config(
    target_schema='snapshots',
    unique_key='supplierid',
    strategy='check',
    check_cols=['companyname', 'contactname', 'address','city', 'country', 'phone']
  )
}}

SELECT *
FROM {{ ref('stg_suppliers') }}

{% endsnapshot %}
