{{ config(materialized='view') }}

SELECT
    ORDERID::INT        AS orderid,
    CUSTOMERID::VARCHAR AS customerid,
    EMPLOYEEID::INT     AS employeeid,
    ORDERDATE::DATE     AS orderdate,
    REQUIREDDATE::DATE  AS requireddate,
    SHIPPEDDATE::DATE   AS shippeddate,
    SHIPVIA::INT        AS shipvia,
    FREIGHT::FLOAT      AS freight,
    SHIPNAME::VARCHAR   AS shipname,
    SHIPADDRESS::VARCHAR AS shipaddress,
    SHIPCITY::VARCHAR    AS shipcity,
    SHIPREGION::VARCHAR  AS shipregion,
    SHIPPOSTALCODE::VARCHAR AS shippostalcode,
    SHIPCOUNTRY::VARCHAR AS shipcountry,
    _airbyte_extracted_at AS extract_date
FROM {{ source('sources', 'orders') }}