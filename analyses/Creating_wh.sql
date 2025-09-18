-- Verifing that the SNOWFLAKE_SAMPLE_DATA database is available
show databases like '%sample%';

SHOW TABLES IN snowflake_sample_data.tpch_sf1;

SELECT 
COUNT(*) FROM 
snowflake_sample_data.tpch_sf1.lineitem ;


select * FROM snowflake_sample_data.tpch_sf1.lineitem limit 5 ;

----------------------------------------------------------------------------
-- get some info about the account 
SELECT CURRENT_ACCOUNT();
SELECT CURRENT_USER();


----------------------------------------------------------------------------
-- creating DEV_WH 
CREATE OR REPLACE WAREHOUSE DEV_WH
    WITH WAREHOUSE_SIZE = 'XSMALL'
    AUTO_SUSPEND = 60
    AUTO_RESUME = TRUE
    INITIALLY_SUSPENDED = TRUE;


-- creating tpch_db 
CREATE OR REPLACE DATABASE tpch_db;