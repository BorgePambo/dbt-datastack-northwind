-- models/marts/dim/dim_employees.sql
{{ config(
    materialized='table'
) }}

WITH latest_employees AS (
    SELECT *
    FROM {{ ref('employees_snapshot') }}
    WHERE dbt_valid_to IS NULL  -- versão atual
)

SELECT
    employeeid,
    fullname,
    jobtitle,
    city,
    dbt_valid_from,
    dbt_valid_to
FROM latest_employees
ORDER BY employeeid
