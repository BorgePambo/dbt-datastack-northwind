# Dockerfile
FROM apache/airflow:2.9.3


# Trocar para usuário airflow
USER airflow


# Instalar dbt (problema: rodando como root)
RUN pip install --no-cache-dir dbt-core dbt-snowflake

