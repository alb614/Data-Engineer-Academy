/* Brainstorming section */

-- Need to retrieve customer names
-- The retrieved customer data should be from customers that placed orders
-- customers_prc & orders_prc tables need to be joined
-- Need to get the month & year of the order date
-- The month & year of the order date will be the condition used to selected the customers
-- Count the order dates based on the month and year making sure that at least 2 different
-- months within the 2022 year are counted.
-- If the count is greater than or equal to 2 then select the name of that customer

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Retrieve name | SELECT name
-- From customers_prc JOIN orders_prc
-- Condition: If the month of at least 2 orders in the year 2022 for a given customer are
-- different, then select the name of that customer.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table customers_prc */

-- SELECT *
-- FROM customers_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- SELECT name
-- FROM customers_prc AS c
-- JOIN orders_prc AS o
-- ON c.customerid = o.customer_id
-- GROUP BY c.customerid
-- HAVING
-- (
--     SELECT
    
--         COUNT(order_id) AS order_in_distinct_months
        
--     FROM orders_prc
--     GROUP BY customer_id
-- );

/*----------------------------------------------------------------------------------------------*/

/* Implementation #2 */

-- WITH stage1 AS
-- (
--     SELECT 
    
--         c.name AS stage1_name,
--         o.order_date AS stage1_order_date,
--         EXTRACT(MONTH FROM o.order_date) AS stage1_order_month
        
--     FROM customers_prc AS c
--     JOIN orders_prc AS o
--     ON c.customerid = o.customer_id
--     GROUP BY c.customerid
--     HAVING EXTRACT(YEAR FROM o.order_date) = 2022
-- )
-- SELECT

--     stage1_name
    
-- FROM stage1
-- WHERE COUNT(DISTINCT stage1_order_month) >= 2;

/*------------------------------------------------------------------------------------------*/

/* Implementation #3 */

-- WITH stage1 AS
-- (
--     SELECT 
    
--         c.name AS stage1_name,
--         o.order_date AS stage1_order_date,
--         EXTRACT(MONTH FROM o.order_date) AS stage1_order_month
        
--     FROM customers_prc AS c
--     JOIN orders_prc AS o
--     ON c.customerid = o.customer_id
--     WHERE EXTRACT(YEAR FROM o.order_date) = 2022
--     ORDER BY stage1_name
-- )
-- SELECT

--     stage1_name
    
-- FROM stage1
-- WHERE 
--     (
--         SELECT
        
--             COUNT(DISTINCT stage1_order_month)
            
--         FROM stage1
--     ) >= 2
-- GROUP BY stage1_name;

/*------------------------------------------------------------------------------------------*/

/* Implementation #4 */

-- WITH stage1 AS
-- (
--     SELECT 
    
--         c.name,
--         o.order_date,
--         EXTRACT(MONTH FROM o.order_date) AS stage1_order_month
        
--     FROM customers_prc AS c
--     JOIN orders_prc AS o
--     ON c.customerid = o.customer_id
--     WHERE EXTRACT(YEAR FROM o.order_date) = 2022
--     ORDER BY name
-- )
-- SELECT

--     name
    
-- FROM stage1
-- GROUP BY name
-- HAVING 
--     (
--         SELECT
        
--             COUNT(DISTINCT stage1_order_month)
            
--         FROM stage1
--     ) >= 2;
    
/*------------------------------------------------------------------------------------------*/

/* Implementation #5 */

-- WITH stage1 AS
-- (
--     SELECT 
    
--         c.name,
--         o.order_date,
--         EXTRACT(MONTH FROM o.order_date) AS stage1_order_month
        
--     FROM customers_prc AS c
--     JOIN orders_prc AS o
--     ON c.customerid = o.customer_id
--     WHERE EXTRACT(YEAR FROM o.order_date) = 2022
--     ORDER BY name
-- )
-- SELECT

--     DISTINCT name
    
-- FROM stage1
-- WHERE 
-- (
--     SELECT
        
--         COUNT(DISTINCT stage1_order_month)
            
--     FROM stage1
-- ) >= 2;

/*------------------------------------------------------------------------------------------*/

/* My solution */

WITH stage1 AS
(
    SELECT 
    
        c.name,
        o.order_date,
        EXTRACT(MONTH FROM o.order_date) AS stage1_order_month
        
    FROM customers_prc AS c
    JOIN orders_prc AS o
    ON c.customerid = o.customer_id
    WHERE EXTRACT(YEAR FROM o.order_date) = 2022
    ORDER BY name
),
stage2 AS
(
    SELECT

        DISTINCT name,
        COUNT(DISTINCT stage1_order_month) AS stage2_num_distinct_order_month
    
    FROM stage1
    GROUP BY name
)
SELECT
    
    name
    
FROM stage2
WHERE stage2_num_distinct_order_month >= 2;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT name
-- FROM customers_prc
-- WHERE customerid IN (
--     SELECT customer_id
--     FROM orders_prc
--     WHERE DATE_FORMAT(order_date, '%Y') = '2022'
--     GROUP BY customer_id
--     HAVING COUNT(DISTINCT DATE_FORMAT(order_date, '%Y-%m')) = 2
-- );