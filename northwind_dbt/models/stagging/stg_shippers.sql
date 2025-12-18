{{ config(materialized='view') }}

SELECT
    SHIPPERID::INT AS shipperid,
    COMPANYNAME::VARCHAR AS companyname,
    PHONE::VARCHAR AS phone,
    _airbyte_extracted_at AS extract_date
FROM {{ source('sources', 'shippers') }}
