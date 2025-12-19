# DBT Ecommerce Data Warehouse

## Modern Data Pipeline: dbt + PostgreSQL + Airflow
<img width="1367" height="666" alt="dtb_stage" src="https://github.com/user-attachments/assets/882d7614-67ab-47f5-b77a-d8e80b7d84b2" />


# DBT Ecommerce App

Projeto de exemplo de **Data Warehouse** usando dbt, PostgreSQL e Airflow, baseado no dataset **Northwind**.  
Este projeto tem como objetivo demonstrar um pipeline de ETL/ELT moderno com boas práticas de modelagem dimensional.

---

## 🚀 Tecnologias

- **dbt**: transformação de dados e modelagem dimensional
- **PostgreSQL**: banco de dados transacional
- **Airbyte**: ferramenta de ingestão de dados, que conecta fontes externas ao data warehouse automaticamente.
- **Airflow**: orquestração de DAGs de dados
- **Docker / Docker Compose**: ambientes locais
- **Power BI (opcional)**: visualização de dados a partir das tabelas de fato e dimensões

---

## 📁 Estrutura do Projeto
  Resumo do fluxo de dados:

- **Staging** (stagging) → limpeza e padronização dos dados da fonte.
- **Marts** (dim/ e fact/) → modelagem dimensional para análise.
- **Airflow** → orquestra execução dos pipelines dbt e carregamento de dados.
- **Power BI / Visualização** → relatórios e dashboards a partir das dimensões e fatos.

## Star schema Modelagem
<img width="1271" height="833" alt="diagrama_1" src="https://github.com/user-attachments/assets/2b3cbca5-be41-4767-a4b7-da5d0e56996d" />


## Dependecias:
- **Docker / Airflow**    
        Docker Compose 3.8+ (orquestração)        
        Apache Airflow 2.9.3
        Airbyte (via Docker) → ingestão de dados automatizada de fontes externas para o data warehouse, sem necessidade de código
        Responsável pela orquestração dos pipelines de dados        
        Executa DAGs que disparam dbt e outras tarefas

- **dbt /** 
          dbt-core → núcleo do dbt para transformação de dados
          dbt-snowflake → adaptador para conectar ao Snowflake
          Observação: como o dbt será executado dentro do container Airflow, a instalação precisa ser feita após trocar para usuário airflow no Dockerfile

-  **Python**
    Python 3.10+ (dentro do container do Airflow)]
  
- **|Banco de Dados**
    Snowflake → fonte de dados e destino do dbt
    Airbyte → faz a ingestão direta das fontes (PostgreSQL, CSV, APIs etc.)

- **BI / Visualização**

    Power BI Desktop → conexão ao Snowflake para relatórios e dashboards
          
  

