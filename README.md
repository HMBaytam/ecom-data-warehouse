---
Domain: E-Commerce / Retail Orders
Data Source: Olist Brazilian E-Commerce
Tools: DuckDB, dbt dbt tests dbt docs
---

# E-Commerce Dimentional Modeling Project

## Phase 0: Enviroment and raw data load
1. Create a python virtual enviroment 
```
python -m venv .venv
```

2. install duckdb and dbt
```
pip install duckdb dbt-core dbt-duckdb
```

3. initialize dbt
```
dbt init
```

4. download CSV data from (Kaggel)[https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce] and save them in a folder named data

5. create duckdb database
```
duckdb olist_dwh_dev.duckdb < scripts/load_raw.sql  
```

The command above creates duckdb database and loads the raw csvs into the database

6. to make sure everything is setup correctly run
```
dbt debug                                                                  
duckdb olist_dwh.duckdb -c "select count(*) from raw.orders;"              
dbt show --inline "select count(*) as n from {{ source('raw','orders') }}" 
```

`dbt debug` makes sure the connection to the database is correct
`duckdb olist_dwh.duckdb -c "select count(*) from raw.orders;"` should give you ~99441
`dbt show --inline "select count(*) as n from {{ source('raw','orders') }}" ` should return the same number as the above query

if everything is as expected you are ready to move to Phase 1