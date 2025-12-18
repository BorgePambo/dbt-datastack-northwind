-- models/marts/dim/dim_customers.sql
{{ config(
    materialized='table'
) }}

WITH latest_customers AS (
    SELECT
        customerid,
        contactname,
        contacttitle,
        companyname,
        address,
        postalcode,
        phone,
        city,
        country,
        dbt_valid_from,
        dbt_valid_to
    FROM {{ ref('customers_snapshot') }}
    WHERE dbt_valid_to IS NULL   -- pega apenas a versão atual
)

SELECT *
FROM latest_customers
ORDER BY customerid
