{{ config(materialized = "view") }}

SELECT
    supplierid::INT AS supplierid,
    companyname::STRING AS companyname,
    contactname::STRING AS contactname,
    contacttitle::STRING AS contacttitle,
    address::STRING AS address,
    city::STRING AS city,
    region::STRING AS region,
    postalcode::STRING AS postalcode,
    country::STRING AS country,
    phone::STRING AS phone,
    fax::STRING AS fax,
    homepage::STRING AS homepage,
    _airbyte_extracted_at::TIMESTAMP AS extract_date
FROM {{ source('sources', 'suppliers') }}
