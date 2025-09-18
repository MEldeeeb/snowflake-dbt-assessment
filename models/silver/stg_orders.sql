{{
    {{
      config(
        materialized = 'view',
        schema = 'silver'
        )
    }}
}}

with orders as(
    select * from {{ source('tpch_raw_data', 'ORDERS') }}
), customer as (
    select * from {{ source('tpch_raw_data', 'CUSTOMER') }}
)
select 
    o.O_ORDERKEY,
    c.C_CUSTKEY,
    c.C_NAME,
    o.O_ORDERDATE,
    DATE_PART(YEAR, o.O_ORDERDATE) as order_year,
    o.O_TOTALPRICE
from orders o
join customer c 
on o.O_CUSTKEY = c.C_CUSTKEY