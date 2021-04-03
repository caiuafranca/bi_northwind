# Projeto de estudo DBT

## Case - Criar um DW (BigQuery) com os Dados do Northwind de um banco relacional (POSTGRES)

- 1 - Etapa de Ingestão de dados usei o Stitch para efetuar a gestão dos dados no BigQuery
- 2 - Modelagem (dimensional) de dados usando o DBT
    - Area de Stage
    - Area de Mart
    - Testes
        - Teste de Schema: model/mart/dim_products.yml
        - Teste de Dados:  tests/test_dim_products.sql
- 3 - Modelagem preditiva usando BigQuery ML para prever vendas futuras
### Using the starter project
Try running the following commands:
- dbt deps
- dbt test
- dbt run

### Resources:
- Google BigQuery
- DBT Core
- DBT Utils
- DBT dbt_ML (plugin para modelagem preditiva)