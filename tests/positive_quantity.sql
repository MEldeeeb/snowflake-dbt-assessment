-- here i'm using sql queries to create a custom test to make sure that L_QUANTITY is positive without using any macros  
select 
    *
from 
    {{ source('tpch_raw_data', 'LINEITEM') }}
where 
    L_QUANTITY <= 0