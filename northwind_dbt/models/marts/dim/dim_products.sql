-- models/marts/dim/dim_products.sql
{{ config(
    materialized='table'
) }}

WITH latest_products AS (
    SELECT *
    FROM {{ ref('products_snapshot') }}
    WHERE dbt_valid_to IS NULL  -- versão atual
)

SELECT 
    PROD.productid,
    CAT.categoryname,
    PROD.supplierid,
    PROD.productname,
    PROD.discontinued, 
    PROD.unitsinstock, 
    PROD.unitsonorder,
    PROD.quantityperunit,
    PROD.dbt_valid_from,
    PROD.dbt_valid_to
FROM latest_products AS PROD
INNER JOIN {{ ref('stg_categories') }} AS CAT
    ON PROD.categoryid = CAT.categoryid
ORDER BY PROD.productid
