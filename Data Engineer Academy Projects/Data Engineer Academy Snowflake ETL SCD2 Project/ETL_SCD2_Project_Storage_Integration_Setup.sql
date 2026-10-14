USE SCHEMA MYDB.BRONZE;

 
-- Creates the storage integration
CREATE STORAGE INTEGRATION snowflake_storage_s3_etl_scd2

  TYPE = EXTERNAL_STAGE

  STORAGE_PROVIDER = 'S3'

  ENABLED = TRUE

  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::422725201341:role/scd2role'

  STORAGE_ALLOWED_LOCATIONS = ('s3://scd2-data-bucket-alb2147deastudent1/raw_data/');

DESC INTEGRATION snowflake_storage_s3_etl_scd2;


-- Creates a file format to read ".csv" files
CREATE OR REPLACE FILE FORMAT MY_CSV_FORMAT

  TYPE = CSV

  FIELD_DELIMITER = ','

  FIELD_OPTIONALLY_ENCLOSED_BY = '"'

  SKIP_HEADER = 1

  NULL_IF = ('NULL', 'null')

  EMPTY_FIELD_AS_NULL = true;

  
-- Creates external stage
CREATE STAGE snowflake_external_stage_etl_scd2

  STORAGE_INTEGRATION = snowflake_storage_s3_etl_scd2

  URL = 's3://scd2-data-bucket-alb2147deastudent1/raw_data/'

  FILE_FORMAT = MY_CSV_FORMAT;


-- Tests the created stage
ls @snowflake_external_stage_etl_scd2;

-- Recreate the file format now that the MYDB.BRONZE schema is selected
CREATE OR REPLACE FILE FORMAT MY_CSV_FORMAT

  TYPE = CSV

  FIELD_DELIMITER = ','

  FIELD_OPTIONALLY_ENCLOSED_BY = '"'

  SKIP_HEADER = 1

  NULL_IF = ('NULL', 'null')

  EMPTY_FIELD_AS_NULL = true;

  -- Create the landing table
CREATE OR REPLACE TABLE 

MYDB.BRONZE.WORK_PRODUCT_COPY

(

    PRODUCT_ID VARCHAR(255) NOT NULL COLLATE 'en-ci'

,PRODUCT_NAME VARCHAR(255) NOT NULL COLLATE 'en-ci'

,CATEGORY VARCHAR(255) COLLATE 'en-ci'

,SELLING_PRICE VARCHAR(50) COLLATE 'en-ci'

    ,MODEL_NUMBER VARCHAR(50) COLLATE 'en-ci'

,ABOUT_PRODUCT VARCHAR(5000) COLLATE 'en-ci'

,PRODUCT_SPECIFICATION VARCHAR(5000) COLLATE 'en-ci'

,TECHNICAL_DETAILS VARCHAR(50000) COLLATE 'en-ci'

,SHIPPING_WEIGHT VARCHAR(30) COLLATE 'en-ci'

,PRODUCT_DIMENSIONS VARCHAR(100) COLLATE 'en-ci'

    ,INSERT_DTS TIMESTAMP_NTZ(6) NOT NULL

    ,UPDATE_DTS TIMESTAMP_NTZ(6) NOT NULL

    ,SOURCE_FILE_NAME VARCHAR(255) NOT NULL

    ,SOURCE_FILE_ROW_NUMBER VARCHAR(255) NOT NULL);

-- Check the contents of the WORK_PRODUCT_COPY table
SELECT * FROM MYDB.BRONZE.WORK_PRODUCT_COPY;

-- Check the contents of the PRODUCT_SNAPSHOT snapshot table
SELECT * FROM PC_DBT_DB.SNAPSHOTS.PRODUCT_SNAPSHOT;

-- Check the contents of the PRODUCT_VIEW view
SELECT * FROM PC_DBT_DB.GOLD.PRODUCT_VIEW;

-- After ingesting the new data from Product_Dim_1.csv, check the updated PRODUCT_VIEW view
-- This is to view the altered record (i.e. PRODUCT_ID = '4c69b61db1fc16e7013b43fc926e502d')
SELECT * FROM PC_DBT_DB.GOLD.PRODUCT_VIEW
WHERE PRODUCT_ID = '4c69b61db1fc16e7013b43fc926e502d';