{{
    config(
    materialized = 'table',
    schema = 'gold'
    )
}}


with oc as(
    select  
        O_ORDERKEY,
        C_CUSTKEY,
        C_NAME
    from {{ ref('stg_orders') }}
), l as(
    select  
        L_ORDERKEY,
        L_EXTENDEDPRICE,
        L_DISCOUNT
    from {{ source('tpch_raw_data', 'LINEITEM') }}
)
select 
    oc.C_CUSTKEY,
    oc.C_NAME,
    sum(l.L_EXTENDEDPRICE* (1 - l.l_discount)) as customer_revenue
from oc
join l on oc.O_ORDERKEY = l.L_ORDERKEY
group by oc.C_CUSTKEY,oc.C_NAME 
