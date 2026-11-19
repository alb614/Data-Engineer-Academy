/* Brainstorming section */

-- Pick months in 2023 with no orders.
-- Display list of these months.

-- Extract a list (column) of distinct months where orders were placed in 2023.
-- Generate a list (column) of months that have been compared to the list (column) of 
-- order months.  If a given month is not on the order months list, add it to this list.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH OrderMonths AS
--      SELECT DISTINCT EXTRACT(MONTH FROM order_date) AS order_months_2023
--      FROM orders_prc
--      WHERE EXTRACT(YEAR FROM order_date) = 2023
-- SELECT 
--      CASE
--      WHEN 1 NOT IN order_months THEN 'January'
--      WHEN 2 NOT IN order_months THEN 'February'
--      WHEN 3 NOT IN order_months THEN 'March'
--      WHEN 4 NOT IN order_months THEN 'April'
--      WHEN 5 NOT IN order_months THEN 'May'
--      WHEN 6 NOT IN order_months THEN 'June'
--      WHEN 7 NOT IN order_months THEN 'July'
--      WHEN 8 NOT IN order_months THEN 'August'
--      WHEN 9 NOT IN order_months THEN 'September'
--      WHEN 10 NOT IN order_months THEN 'October'
--      WHEN 11 NOT IN order_months THEN 'November'
--      WHEN 12 NOT IN order_months THEN 'December'
--      END AS non_order_months_2023
-- FROM OrderMonths;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc;
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing tables */

    -- SELECT DISTINCT EXTRACT(MONTH FROM order_date) AS order_months_2023
    -- FROM orders_prc
    -- WHERE EXTRACT(YEAR FROM order_date) = 2023;
    
    -- SELECT 
     
    --     DISTINCT EXTRACT(MONTH FROM order_date) AS order_months_2023,
    --     (1,2,3,4,5,6,7,8,9,10,11,12) AS months
        
    -- FROM orders_prc
    -- WHERE EXTRACT(YEAR FROM order_date) = 2023;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- WITH OrderMonths AS
-- (
--      SELECT DISTINCT EXTRACT(MONTH FROM order_date) AS order_months_2023
--      FROM orders_prc
--      WHERE EXTRACT(YEAR FROM order_date) = 2023
-- )
-- SELECT 
--      CASE
--         WHEN 1 NOT IN order_months_2023 THEN 'January'
--         WHEN 2 NOT IN order_months_2023 THEN 'February'
--         WHEN 3 NOT IN order_months_2023 THEN 'March'
--         WHEN 4 NOT IN order_months_2023 THEN 'April'
--         WHEN 5 NOT IN order_months_2023 THEN 'May'
--         WHEN 6 NOT IN order_months_2023 THEN 'June'
--         WHEN 7 NOT IN order_months_2023 THEN 'July'
--         WHEN 8 NOT IN order_months_2023 THEN 'August'
--         WHEN 9 NOT IN order_months_2023 THEN 'September'
--         WHEN 10 NOT IN order_months_2023 THEN 'October'
--         WHEN 11 NOT IN order_months_2023 THEN 'November'
--         WHEN 12 NOT IN order_months_2023 THEN 'December'
--      END AS non_order_months_2023
-- FROM OrderMonths;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #2 */

-- WITH OrderMonths AS
-- (
--      SELECT DISTINCT EXTRACT(MONTH FROM order_date) AS order_months_2023
--      FROM orders_prc
--      WHERE EXTRACT(YEAR FROM order_date) = 2023
-- )
-- SELECT 
--      CASE
--         WHEN NOT order_months_2023 = 1 THEN 'January'
--         WHEN NOT order_months_2023 = 2 THEN 'February'
--         WHEN NOT order_months_2023 = 3 THEN 'March'
--         WHEN NOT order_months_2023 = 4 THEN 'April'
--         WHEN NOT order_months_2023 = 5 THEN 'May'
--         WHEN NOT order_months_2023 = 6 THEN 'June'
--         WHEN NOT order_months_2023 = 7 THEN 'July'
--         WHEN NOT order_months_2023 = 8 THEN 'August'
--         WHEN NOT order_months_2023 = 9 THEN 'September'
--         WHEN NOT order_months_2023 = 10 THEN 'October'
--         WHEN NOT order_months_2023 = 11 THEN 'November'
--         WHEN NOT order_months_2023 = 12 THEN 'December'
--      END AS non_order_months_2023
-- FROM OrderMonths;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #3 */

-- WITH OrderMonths AS
-- (
--      SELECT 
     
--         DISTINCT EXTRACT(MONTH FROM order_date) AS order_months_2023,
--         (1,2,3,4,5,6,7,8,9,10,11,12) AS months
        
--      FROM orders_prc
--      WHERE EXTRACT(YEAR FROM order_date) = 2023
-- )
-- SELECT 

--      months
     
-- FROM OrderMonths
-- WHERE months NOT IN order_months_2023
-- -- (SELECT order_months_2023 FROM OrderMonths);

/*----------------------------------------------------------------------------------------------*/

/* Implementation #4 */

-- WITH OrderMonths AS
-- (
--      SELECT 
     
--         DISTINCT EXTRACT(MONTH FROM order_date) AS order_months_2023,
        
--      FROM orders_prc
--      WHERE EXTRACT(YEAR FROM order_date) = 2023
-- ),
-- Months AS
-- (
--     SELECT
        
--         (1,2,3,4,5,6,7,8,9,10,11,12) AS months
-- )
-- SELECT 

--      months
     
-- FROM OrderMonths
-- WHERE months NOT IN order_months_2023
-- -- (SELECT order_months_2023 FROM OrderMonths);

/*----------------------------------------------------------------------------------------------*/

/* Implementation #5 */

-- WITH OrderMonths AS
-- (
--      SELECT DISTINCT EXTRACT(MONTH FROM order_date) AS order_months_2023
--      FROM orders_prc
--      WHERE EXTRACT(YEAR FROM order_date) = 2023
-- )
-- SELECT 
--      CASE
--         WHEN 1 NOT IN (SELECT order_months_2023 FROM OrderMonths) THEN '2023-01'
--         WHEN 2 NOT IN (SELECT order_months_2023 FROM OrderMonths) THEN '2023-02'
--         WHEN 3 NOT IN (SELECT order_months_2023 FROM OrderMonths) THEN '2023-03'
--         WHEN 4 NOT IN (SELECT order_months_2023 FROM OrderMonths) THEN '2023-04'
--         WHEN 5 NOT IN (SELECT order_months_2023 FROM OrderMonths) THEN '2023-05'
--         WHEN 6 NOT IN (SELECT order_months_2023 FROM OrderMonths) THEN '2023-06'
--         WHEN 7 NOT IN (SELECT order_months_2023 FROM OrderMonths) THEN '2023-07'
--         WHEN 8 NOT IN (SELECT order_months_2023 FROM OrderMonths) THEN '2023-08'
--         WHEN 9 NOT IN (SELECT order_months_2023 FROM OrderMonths) THEN '2023-09'
--         WHEN 10 NOT IN (SELECT order_months_2023 FROM OrderMonths) THEN '2023-10'
--         WHEN 11 NOT IN (SELECT order_months_2023 FROM OrderMonths) THEN '2023-11'
--         WHEN 12 NOT IN (SELECT order_months_2023 FROM OrderMonths) THEN '2023-12'
--      END AS non_order_months_2023
-- FROM OrderMonths;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #6 */

-- WITH OrderMonths AS
-- (
--      SELECT 
     
--         DISTINCT EXTRACT(MONTH FROM order_date) AS order_months_2023,
--         (1,2,3,4,5,6,7,8,9,10,11,12) AS months
        
--      FROM orders_prc
--      WHERE EXTRACT(YEAR FROM order_date) = 2023
-- ),
-- Months AS 
-- (
--     SELECT 
     
--         (1,2,3,4,5,6,7,8,9,10,11,12) AS months
        
--     FROM orders_prc
-- ),
-- JoinedMonths
-- (
-- )
-- SELECT 

--      months
     
-- FROM OrderMonths
-- WHERE months NOT IN order_months_2023
-- -- (SELECT order_months_2023 FROM OrderMonths);

/*----------------------------------------------------------------------------------------------*/

/* Implementation #7 */

-- WITH MonthsIn2023 AS
-- (
--     SELECT
    
--         EXTRACT(MONTH FROM order_date) AS order_month,
--         COALESCE(COUNT(*), 0) AS num_orders
        
--     FROM orders_prc
--     WHERE EXTRACT(YEAR FROM order_date) = 2023
--     GROUP BY order_month
-- )
-- SELECT order_month, num_orders
-- FROM MonthsIn2023;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH MonthsIn2023 AS 
(
      SELECT '2023-01' AS YearMonth
      UNION SELECT '2023-02'
      UNION SELECT '2023-03'
      UNION SELECT '2023-04'
      UNION SELECT '2023-05'
      UNION SELECT '2023-06'
      UNION SELECT '2023-07'
      UNION SELECT '2023-08'
      UNION SELECT '2023-09'
      UNION SELECT '2023-10'
      UNION SELECT '2023-11'
      UNION SELECT '2023-12'
)
SELECT 

    m.YearMonth AS MissingMonth

FROM MonthsIn2023 m
LEFT JOIN orders_prc o 
ON m.YearMonth = DATE_FORMAT(order_date, '%Y-%m')
WHERE o.order_id IS NULL;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH MonthsIn2023 AS (
--     SELECT '2023-01' AS YearMonth
--     UNION SELECT '2023-02'
--     UNION SELECT '2023-03'
--     UNION SELECT '2023-04'
--     UNION SELECT '2023-05'
--     UNION SELECT '2023-06'
--     UNION SELECT '2023-07'
--     UNION SELECT '2023-08'
--     UNION SELECT '2023-09'
--     UNION SELECT '2023-10'
--     UNION SELECT '2023-11'
--     UNION SELECT '2023-12'
-- )

-- SELECT m.YearMonth AS MissingMonth
-- FROM MonthsIn2023 m
-- LEFT JOIN orders_prc o ON m.YearMonth = DATE_FORMAT(order_date, '%Y-%m')
-- WHERE o.order_id IS NULL;