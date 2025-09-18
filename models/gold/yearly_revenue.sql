{{
  config(
    materialized = 'table',
    schema = 'gold'
    )
}}


with stg_orders as(
    select 
        O_ORDERKEY,
        order_year
    from {{ ref('stg_orders') }}
), LINEITEM as(
    select 
    L_ORDERKEY,
    L_EXTENDEDPRICE,
    L_DISCOUNT
    from {{ source('tpch_raw_data', 'LINEITEM') }}
)
select 
    order_year,
    sum(l.L_EXTENDEDPRICE* (1 - l.L_DISCOUNT)) as Yearly_revenue
from stg_orders o 
join LINEITEM l 
on o.O_ORDERKEY = l.L_ORDERKEY
group by order_year
order by order_year