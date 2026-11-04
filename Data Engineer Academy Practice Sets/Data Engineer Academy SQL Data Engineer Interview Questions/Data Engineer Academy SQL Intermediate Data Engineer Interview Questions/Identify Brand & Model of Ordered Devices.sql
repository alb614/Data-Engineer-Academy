/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH order_phone_info AS
-- (
--     SELECT DISTINCT phone_names
--     FROM dim_phoneOrders_apple AS t1
--     JOIN dim_phones_apple AS t2
--     ON t1.phone_id = t2.phone_id
-- )
-- SELECT
--     CASE
--         WHEN INSTR(phone_names, ' - ') > 0 THEN LEFT(phone_names, INSTR(phone_names, ' - ')-1)
--         WHEN INSTR(phone_names, ' : ') > 0 THEN LEFT(phone_names, INSTR(phone_names, ' : ')-1)
--         WHEN INSTR(phone_names, ' * ') > 0 THEN LEFT(phone_names, INSTR(phone_names, ' * ')-1)
--         WHEN INSTR(phone_names, ' ~ ') > 0 THEN LEFT(phone_names, INSTR(phone_names, ' ~ ')-1)
--     END AS brand,
--     CASE
--         WHEN INSTR(phone_names, ' - ') > 0 THEN RIGHT(phone_names, LENGTH(phone_names)-INSTR(phone_names, ' - ')-2)
--         WHEN INSTR(phone_names, ' : ') > 0 THEN RIGHT(phone_names, LENGTH(phone_names)-INSTR(phone_names, ' : ')-2)
--         WHEN INSTR(phone_names, ' * ') > 0 THEN RIGHT(phone_names, LENGTH(phone_names)-INSTR(phone_names, ' * ')-2)
--         WHEN INSTR(phone_names, ' ~ ') > 0 THEN RIGHT(phone_names, LENGTH(phone_names)-INSTR(phone_names, ' ~ ')-2)
--     END AS model_name
-- FROM order_phone_info

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_phoneOrders_apple */

-- SELECT *
-- FROM dim_phoneOrders_apple
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_phones_apple */

-- SELECT *
-- FROM dim_phones_apple
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH order_phone_info AS
(
    SELECT DISTINCT phone_names
    FROM dim_phoneOrders_apple AS t1
    JOIN dim_phones_apple AS t2
    ON t1.phone_id = t2.phone_id
)
SELECT
    CASE
        WHEN INSTR(phone_names, ' - ') > 0 THEN LEFT(phone_names, INSTR(phone_names, ' - ')-1)
        WHEN INSTR(phone_names, ' : ') > 0 THEN LEFT(phone_names, INSTR(phone_names, ' : ')-1)
        WHEN INSTR(phone_names, ' * ') > 0 THEN LEFT(phone_names, INSTR(phone_names, ' * ')-1)
        WHEN INSTR(phone_names, ' ~ ') > 0 THEN LEFT(phone_names, INSTR(phone_names, ' ~ ')-1)
    END AS brand,
    CASE
        WHEN INSTR(phone_names, ' - ') > 0 THEN RIGHT(phone_names, LENGTH(phone_names)-INSTR(phone_names, ' - ')-2)
        WHEN INSTR(phone_names, ' : ') > 0 THEN RIGHT(phone_names, LENGTH(phone_names)-INSTR(phone_names, ' : ')-2)
        WHEN INSTR(phone_names, ' * ') > 0 THEN RIGHT(phone_names, LENGTH(phone_names)-INSTR(phone_names, ' * ')-2)
        WHEN INSTR(phone_names, ' ~ ') > 0 THEN RIGHT(phone_names, LENGTH(phone_names)-INSTR(phone_names, ' ~ ')-2)
    END AS model_name
FROM order_phone_info

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
-- SELECT DISTINCT brand, model_name
-- FROM cte2
-- JOIN dim_phoneOrders_apple dp ON dp.phone_id = cte2.phone_id