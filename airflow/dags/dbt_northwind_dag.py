from datetime import datetime
from airflow.decorators import dag
from airflow.operators.bash import BashOperator

default_args = {'owner': 'airflow', 'depends_on_past': False, 'retries': 1}

@dag(
    dag_id='dbt_northwind',
    start_date=datetime(2025, 12, 18),
    schedule_interval='@daily',
    catchup=False,
    default_args=default_args,
    tags=['dbt', 'northwind']
)
def dbt_northwind():
    dbt_snapshot = BashOperator(
        task_id='dbt_snapshot',
        bash_command='cd /opt/airflow/northwind_dbt && dbt snapshot --profiles-dir /home/airflow/.dbt'
    )
    dbt_run = BashOperator(
        task_id='dbt_run',
        bash_command='cd /opt/airflow/northwind_dbt && dbt run --profiles-dir /home/airflow/.dbt'
    )
    dbt_snapshot >> dbt_run

dag = dbt_northwind()
