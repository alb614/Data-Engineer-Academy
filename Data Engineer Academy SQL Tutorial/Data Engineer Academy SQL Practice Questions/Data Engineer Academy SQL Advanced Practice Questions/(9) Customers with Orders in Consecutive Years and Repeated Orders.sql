/* Brainstorming section */

-- Find customers who placed orders in at least two consecutive years. 

-- This means placed orders in 2 or more consecutive years.

-- Had more than one order in at least one of those years.

-- This means more than one order in 1 or more years.

-- We are talking about only customers that placed orders. (Will JOIN tables)

-- Perhaps, we will order the table by order year and customer id.

-- Perhaps, we can choose the distinct names in the joined table to create a means by which
-- the number of times any given name appears from one year to the next can be count to 
-- keep track of the number of times orders were placed in consecutive years.

-- Perhaps, we can use a CASE statement to create a column that keeps track of the count for
-- the number of times any given name appears from one year to the next.  Maybe even 
-- partitioning the joined table by name.

-- Perhaps, we can use a CASE statement to create a column the keeps track of the number of
-- orders for a given year by keeping track of the number of times a year in repeated within
-- a partition.

-- Perhaps, placing the query in a CTE with a CASE statement that generates a column that
-- keeps track of the number of times that an order has an order that was place in the
-- previous year (using LAG?) and 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT name
-- FROM customers_prc JOIN orders_prc 
-- ORDER BY order year, name


/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc*/

-- SELECT *
-- FROM orders_prc;
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table customers_prc*/

-- SELECT *
-- FROM customers_prc;
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- SELECT 
--     YEAR(o.order_date) AS order_year,
--     c.name
-- FROM customers_prc c
-- JOIN orders_prc o
-- ON c.customerid = o.customer_id
-- ORDER BY c.name, YEAR(o.order_date);

/*----------------------------------------------------------------------------------------------*/

/* Implementation #2 */

-- WITH stage1 AS
-- (
--     SELECT 
--         YEAR(o.order_date) AS order_year,
--         c.name
--     FROM customers_prc c
--     JOIN orders_prc o
--     ON c.customerid = o.customer_id
--     ORDER BY c.name, YEAR(o.order_date)
-- ), 
-- stage2 AS
-- (
--     SELECT
--         order_year,
--         name,
        
--         CASE
--         WHEN order_year - COALESCE(LAG(order_year) OVER(PARTITION BY name), 0) = 1 THEN 1
--         ELSE 0
--         END AS consec_year_order_count,
        
--         CASE
--         WHEN order_year = COALESCE(LAG(order_year) OVER(PARTITION BY name), 0) THEN 1
--         ELSE 0
--         END AS same_year_order_count
--     FROM stage1
-- ),
-- stage3 AS
-- (
--     SELECT
--         name,
--         SUM(consec_year_order_count) AS sum_cyoc,
--         SUM(same_year_order_count) AS sum_syoc
--     FROM stage2
--     GROUP BY name
-- )
-- SELECT *
-- FROM stage3;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH stage1 AS
(
    SELECT 
        YEAR(o.order_date) AS order_year,
        c.name
    FROM customers_prc c
    JOIN orders_prc o
    ON c.customerid = o.customer_id
    ORDER BY c.name, YEAR(o.order_date)
), 
stage2 AS
(
    SELECT
        order_year,
        name,
        
        CASE
        WHEN order_year - COALESCE(LAG(order_year) OVER(PARTITION BY name ORDER BY order_year), 0) = 1 THEN 1
        ELSE 0
        END AS consec_year_order_count,
        
        CASE
        WHEN order_year = COALESCE(LAG(order_year) OVER(PARTITION BY name ORDER BY order_year), 0) THEN 1
        ELSE 0
        END AS same_year_order_count
    FROM stage1
),
stage3 AS
(
    SELECT 

        name,
        SUM(consec_year_order_count) AS sum_consec_year_order_count,
        SUM(same_year_order_count) AS sum_same_year_order_count
    
    FROM stage2
    GROUP BY name
    HAVING sum_consec_year_order_count >= 2 AND sum_same_year_order_count >= 1
)
SELECT name
FROM stage3;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH orders_by_year AS (
--   SELECT customer_id, YEAR(order_date) AS order_year, COUNT(*) AS order_count
--   FROM orders_prc
--   GROUP BY customer_id, YEAR(order_date)
-- ),
-- has_consecutive_years AS (
--   SELECT o1.customer_id
--   FROM orders_by_year o1
--   JOIN orders_by_year o2
--     ON o1.customer_id = o2.customer_id
--     AND o1.order_year = o2.order_year - 1
-- ),
-- has_multi_order_year AS (
--   SELECT DISTINCT customer_id
--   FROM orders_by_year
--   WHERE order_count > 1
-- )
-- SELECT name
-- FROM customers_prc
-- WHERE customerid IN (
--   SELECT customer_id
--   FROM has_consecutive_years
--   INTERSECT
--   SELECT customer_id
--   FROM has_multi_order_year
-- );