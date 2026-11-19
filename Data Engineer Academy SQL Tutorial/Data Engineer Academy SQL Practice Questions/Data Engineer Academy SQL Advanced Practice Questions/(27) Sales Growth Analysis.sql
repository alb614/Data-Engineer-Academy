/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Calculate the percentage increase 
-- in total sales from the previous year to the current year

-- SUM(amount) AS total_sales
-- LAG(total_sales, 1, 0) OVER(ORDER BY YEAR(order_date))

-- using the orders_prc table.

-- FROM orders_prc
-- GROUP BY EXTRACT(YEAR FROM order_date)

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution #1 */

WITH total_sales_per_year AS
(

    SELECT 
            
        EXTRACT(YEAR FROM order_date) AS current_year, 
        SUM(amount) AS current_year_sales
                
    FROM orders_prc
    GROUP BY EXTRACT(YEAR FROM order_date)

),
current_and_previous_sales AS
(

    SELECT
        
            *, 
            LAG(current_year_sales, 1, 0) OVER() AS previous_year_sales
            
    FROM total_sales_per_year

)
SELECT 

    *,
    CASE
        WHEN previous_year_sales = 0 THEN 0.00
        ELSE
    ROUND(100 * (current_year_sales - previous_year_sales) / previous_year_sales, 2)
    END AS percentage_increase
    
FROM current_and_previous_sales;

/*----------------------------------------------------------------------------------------------*/

/* My solution #2 */

-- SELECT 

--     *,
--     CASE
--         WHEN previous_year_sales = 0 THEN 0.00
--         ELSE ROUND(100 * (current_year_sales - previous_year_sales) / previous_year_sales, 2)
--     END AS percentage_increase

-- FROM
-- (
--     SELECT
    
--         *, 
--         LAG(current_year_sales, 1, 0) OVER() AS previous_year_sales
        
--     FROM
--     (
--         SELECT 
        
--             current_year, 
--             SUM(amount) AS current_year_sales
            
--         FROM
--         (
--             SELECT 
            
--                 EXTRACT(YEAR FROM order_date) AS current_year,
--                 amount
                
--             FROM orders_prc
--         ) AS sales_per_year
--         GROUP BY current_year
--     ) AS total_sales_per_year
-- ) AS current_and_previous_sales;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH YearlySales AS (
--   SELECT
--     YEAR(order_date) AS order_year,
--     SUM(amount) AS total_sales
--   FROM
--     orders_prc
--   GROUP BY
--     YEAR(order_date)
-- )

-- SELECT
--   current_year.order_year AS current_year,
--   current_year.total_sales AS current_year_sales,
--   COALESCE(previous_year.total_sales, 0) AS previous_year_sales,
--   CASE
--     WHEN previous_year.total_sales IS NOT NULL
--     THEN ROUND((current_year.total_sales - previous_year.total_sales) / previous_year.total_sales * 100, 2)
--     ELSE 0
--   END AS percentage_increase
-- FROM
--   YearlySales current_year
-- LEFT JOIN
--   YearlySales previous_year ON current_year.order_year = previous_year.order_year + 1
-- ORDER BY
--   current_year.order_year;