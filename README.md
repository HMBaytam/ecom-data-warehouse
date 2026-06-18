---
Domain: E-Commerce / Retail Orders
Data Source: Olist Brazilian E-Commerce
Tools: DuckDB, dbt dbt tests dbt docs
---

# E-Commerce Dimensional Modeling Project

## Build setup
### Phase 0: Environment and raw data load
1. Create a python virtual environment 
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

4. download CSV data from [Kaggel](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) and save them in a folder named data

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

### Phase 1: Sources and staging
Now that the raw source data is imported into the database, the next step is to setup staging models 

All the staging models live in `models/staging/olist`. The reason for this is to make it easier to add more sources in the future while keeping everything organized

the naming conversion for all staging models are as follows 
`stg_<source name>__<model name>.sql`

The only thing staging models are doing is renaming columns and type casting and keeps the original grain. No joins are made to keep these models atomic