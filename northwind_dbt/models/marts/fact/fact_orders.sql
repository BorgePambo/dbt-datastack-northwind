{{ config(
    materialized='table'
) }}

SELECT
    OD.ORDERID,
    P.PRODUCTID,
    O.CUSTOMERID,
    O.EMPLOYEEID,
    O.SHIPVIA AS SHIPPERID,
    P.SUPPLIERID,
    OD.UNITPRICE,
    OD.QUANTITY,
    OD.DISCOUNT,
    O.ORDERDATE,
    O.REQUIREDDATE,
    O.SHIPPEDDATE,
    O.FREIGHT,
    O.SHIPNAME,
    O.SHIPADDRESS,
    O.SHIPCITY,
    O.SHIPPOSTALCODE,
    O.SHIPCOUNTRY
FROM {{ ref('stg_orderdetails') }} AS OD
INNER JOIN {{ ref('stg_orders') }} AS O
    ON OD.ORDERID = O.ORDERID
INNER JOIN {{ ref('dim_products') }} AS P
    ON OD.PRODUCTID = P.PRODUCTID
ORDER BY OD.ORDERID, OD.PRODUCTID