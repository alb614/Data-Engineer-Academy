/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- 

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

/* Implementation #1: */

/* This query gave me an error.  However, I learned that aggregate functions can be used in
HAVING clauses without the need to implement a subquery to retrieve the desired data first. */

-- SELECT name
-- FROM customers_prc AS c
-- OUTER JOIN orders_prc AS o
-- ON c.customerid = o.customer_id
-- GROUP BY name
-- HAVING
-- (
--     SELECT
    
--         SUM(amount)
        
--     FROM customers_prc AS c
--     OUTER JOIN orders_prc AS o
--     ON c.customerid = o.customer_id
--     GROUP BY name
-- ) AS sum_of_amount > 250;

/*----------------------------------------------------------------------------------------------*/

/* My solution: */

SELECT name
FROM customers_prc AS c
JOIN orders_prc AS o
ON c.customerid = o.customer_id
GROUP BY name
HAVING SUM(amount) > 250;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT c.name
-- FROM customers_prc c
-- JOIN orders_prc o ON c.customerid = o.customer_id
-- GROUP BY c.name
-- HAVING SUM(o.amount) > 250;