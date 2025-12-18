{{ config(materialized='view') }}

WITH unique_customers AS (
    SELECT
        CUSTOMERID::VARCHAR   AS customerid,
        CONTACTNAME::VARCHAR  AS contactname,
        CONTACTTITLE::VARCHAR AS contacttitle,
        COMPANYNAME::VARCHAR  AS companyname,
        ADDRESS::VARCHAR      AS address,
        POSTALCODE::VARCHAR   AS postalcode,
        PHONE::VARCHAR        AS phone,
        CITY::VARCHAR         AS city,
        COUNTRY::VARCHAR      AS country,
        _airbyte_extracted_at AS extract_date,
        ROW_NUMBER() OVER (
            PARTITION BY CUSTOMERID
            ORDER BY _airbyte_extracted_at DESC
        ) AS ranking
    FROM {{ source('sources', 'customers') }}
)

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
    extract_date
FROM unique_customers
WHERE ranking = 1