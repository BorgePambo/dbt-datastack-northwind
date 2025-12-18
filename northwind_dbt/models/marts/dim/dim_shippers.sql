-- models/marts/dim/dim_shippers.sql
{{ config(
    materialized='table'
) }}

SELECT
    shipperid::NUMBER AS shipperid,   -- se shipperid for número
    companyname::STRING AS companyname,
    phone::STRING AS phone
FROM {{ ref('stg_shippers') }}
ORDER BY shipperid
