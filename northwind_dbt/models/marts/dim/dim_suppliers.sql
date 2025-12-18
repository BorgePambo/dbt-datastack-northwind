-- models/marts/dim/dim_suppliers.sql
{{ config(
    materialized='table'
) }}

WITH latest_suppliers AS (
    SELECT *
    FROM {{ ref('suppliers_snapshot') }}
    WHERE dbt_valid_to IS NULL  -- versão atual
)

SELECT
    supplierid,
    companyname,
    contactname,
    contacttitle,
    address,
    city,
    region,
    postalcode,
    country,
    phone,
    dbt_valid_from,
    dbt_valid_to
FROM latest_suppliers
ORDER BY supplierid
