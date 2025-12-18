{{ config(materialized='view') }}

WITH unique_products AS (
    SELECT
        PRODUCTID,
        CATEGORYID,
        SUPPLIERID,
        UNITPRICE,
        PRODUCTNAME,
        DISCONTINUED,
        UNITSINSTOCK,
        UNITSONORDER,
        QUANTITYPERUNIT,
        _airbyte_extracted_at AS extract_date,
        ROW_NUMBER() OVER (
            PARTITION BY PRODUCTID
            ORDER BY _airbyte_extracted_at DESC
        ) AS ranking
    FROM {{ source('sources', 'products') }}
)

SELECT
    PRODUCTID,
    CATEGORYID,
    SUPPLIERID,
    UNITPRICE,
    PRODUCTNAME,
    DISCONTINUED,
    UNITSINSTOCK,
    UNITSONORDER,
    QUANTITYPERUNIT,
    extract_date
FROM unique_products
WHERE ranking = 1
