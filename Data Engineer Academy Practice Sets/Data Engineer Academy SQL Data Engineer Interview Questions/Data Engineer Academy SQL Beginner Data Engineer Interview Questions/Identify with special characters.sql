/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Phone_names contains brand and phone name 
-- joined with special characters like
-- '-', ':', '*', '~', ','. 
-- Only one out of this is present as 
-- delimiter.alter

-- Can you please break down the phone_names 
-- into two columns i.e. brand, model_name, 
-- for example 'Acer * Liquid Z320' 
-- should be displayed along with the other columns 
-- from dim_phones_apple as Acer as brand 
-- and Liquid Z320 as model_name. 
-- There should be no space in either end.

-- Columns to Display: phone_id, phone_names_price_usd, brand

-- SELECT
    
--     phone_id,
--     phone_names,
--     price_usd,
--     CASE
--         WHEN phone_names LIKE '% - %' THEN SUBSTRING_INDEX(phone_names, ' - ', 1)
--         WHEN phone_names LIKE '% : %' THEN SUBSTRING_INDEX(phone_names, ' : ', 1)
--         WHEN phone_names LIKE '% * %' THEN SUBSTRING_INDEX(phone_names, ' * ', 1)
--         WHEN phone_names LIKE '% ~ %' THEN SUBSTRING_INDEX(phone_names, ' ~ ', 1)
--         WHEN phone_names LIKE '% , %' THEN SUBSTRING_INDEX(phone_names, ' , ', 1)
--     END AS brand,
--     CASE
--         WHEN phone_names LIKE '% - %' THEN SUBSTRING_INDEX(phone_names, ' - ', -1)
--         WHEN phone_names LIKE '% : %' THEN SUBSTRING_INDEX(phone_names, ' : ', -1)
--         WHEN phone_names LIKE '% * %' THEN SUBSTRING_INDEX(phone_names, ' * ', -1)
--         WHEN phone_names LIKE '% ~ %' THEN SUBSTRING_INDEX(phone_names, ' ~ ', -1)
--         WHEN phone_names LIKE '% , %' THEN SUBSTRING_INDEX(phone_names, ' , ', -1)
--     END AS model_name
    
-- FROM dim_phones_apple;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_phones_apple */

-- SELECT *
-- FROM dim_phones_apple
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT
    
    phone_id,
    phone_names,
    price_usd,
    CASE
        WHEN phone_names LIKE '% - %' THEN SUBSTRING_INDEX(phone_names, ' - ', 1)
        WHEN phone_names LIKE '% : %' THEN SUBSTRING_INDEX(phone_names, ' : ', 1)
        WHEN phone_names LIKE '% * %' THEN SUBSTRING_INDEX(phone_names, ' * ', 1)
        WHEN phone_names LIKE '% ~ %' THEN SUBSTRING_INDEX(phone_names, ' ~ ', 1)
        WHEN phone_names LIKE '% , %' THEN SUBSTRING_INDEX(phone_names, ' , ', 1)
    END AS brand,
    CASE
        WHEN phone_names LIKE '% - %' THEN SUBSTRING_INDEX(phone_names, ' - ', -1)
        WHEN phone_names LIKE '% : %' THEN SUBSTRING_INDEX(phone_names, ' : ', -1)
        WHEN phone_names LIKE '% * %' THEN SUBSTRING_INDEX(phone_names, ' * ', -1)
        WHEN phone_names LIKE '% ~ %' THEN SUBSTRING_INDEX(phone_names, ' ~ ', -1)
        WHEN phone_names LIKE '% , %' THEN SUBSTRING_INDEX(phone_names, ' , ', -1)
    END AS model_name
    
FROM dim_phones_apple;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH cte AS (
--   SELECT *, 
--     CASE
--       WHEN INSTR(phone_names, '~') > 0 THEN '~'
--       WHEN INSTR(phone_names, ':') > 0 THEN ':'
--       WHEN INSTR(phone_names, ',') > 0 THEN ','
--       WHEN INSTR(phone_names, '*') > 0 THEN '*'
--       WHEN INSTR(phone_names, '-') > 0 THEN '-'
--     END AS delimiter_used
--   FROM dim_phones_apple
-- ), cte2 AS (
--   SELECT *,
--     TRIM(LEFT(phone_names, LOCATE(delimiter_used, phone_names) - 1)) AS brand,
--     TRIM(RIGHT(phone_names, LENGTH(phone_names) - LOCATE(delimiter_used, phone_names) - 1)) AS model_name
--   FROM cte
-- )
-- SELECT 
-- phone_id	
-- ,phone_names	
-- ,price_usd	
-- ,brand	
-- ,model_name
-- FROM cte2;