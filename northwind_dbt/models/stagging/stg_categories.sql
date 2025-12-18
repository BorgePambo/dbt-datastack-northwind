{{ config(materialized='view') }}

SELECT
    CATEGORYID::INT        AS categoryid,
    CATEGORYNAME::VARCHAR AS categoryname,
    _airbyte_extracted_at  AS extract_date
FROM {{ source('sources', 'categories') }}
