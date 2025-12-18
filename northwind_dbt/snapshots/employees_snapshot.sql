-- snapshots/customers_snapshot.sql
{% snapshot employees_snapshot %}
{{
  config(
    target_schema='snapshots',
    unique_key='employeeid',
    strategy='check',
    check_cols=['fullname', 'jobtitle', 'city']
  )
}}

SELECT *
FROM {{ ref('stg_employees') }}

{% endsnapshot %}
