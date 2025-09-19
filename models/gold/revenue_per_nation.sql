{{
  config(
    materialized = 'table',
    schema = 'gold'
    )
}}

with n as (
    select 
        N_NAME,
        N_NATIONKEY
    from {{ ref('Nations') }}
), nations_orders as(
    select 
        so.C_NATIONKEY,
        n.N_NAME,
        so.O_ORDERKEY
    from {{ ref('stg_orders') }} so
    join n on n.N_NATIONKEY = so.C_NATIONKEY
), l as(
    select
        L_ORDERKEY,
        L_EXTENDEDPRICE,
        L_DISCOUNT
    from {{ source('tpch_raw_data', 'LINEITEM') }} 

)

select
    no.N_NAME,
    sum(l.L_EXTENDEDPRICE* (1 - l.L_DISCOUNT)) as revenue_per_nation
from nations_orders no
join l on no.O_ORDERKEY = l.L_ORDERKEY
group by no.N_NAME
order by revenue_per_nation desc