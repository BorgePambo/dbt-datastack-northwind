{{ config(materialized='view') }}


WITH calc_employee AS (
    SELECT 
        EMPLOYEEID,
        TITLEOFCOURTESY,
        CONCAT(FIRSTNAME, ' ', LASTNAME) AS fullname,
        TITLE AS jobtitle,
        DATEDIFF(year, BIRTHDATE, CURRENT_DATE()) AS age,
        DATEDIFF(year, HIREDATE, CURRENT_DATE()) AS lengthofservice,
        CITY,
        _airbyte_extracted_at AS extract_date
    FROM {{ source('sources', 'employees') }}
)
SELECT *
FROM calc_employee
