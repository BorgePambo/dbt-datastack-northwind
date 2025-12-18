
{{ config(materialized='view') }}

SELECT
    ORDERID::INT            AS orderid,
    PRODUCTID::INT          AS productid,
    UNITPRICE::NUMERIC(10,2) AS unitprice,
    QUANTITY::INT           AS quantity,
    DISCOUNT::FLOAT         AS discount,
    _airbyte_extracted_at   AS extract_date
FROM {{ source('sources', 'orderdetails') }}
