/* Brainstorming section */

-- Define a VIP customer as someone who has made more than two orders
-- Get the customers who have placed orders

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Retrieve all customers who have placed orders

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table customers_prc */

-- SELECT *
-- FROM customers_prc;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- SELECT

--     c.customerid,
--     c.name,
--     o.order_id,
--     o.order_date,
--     o.amount
    
-- FROM customers_prc AS c
-- JOIN orders_prc AS o
-- ON c.customerid = o.customer_id;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #2 */

-- WITH OrderCount AS
-- (
--     SELECT

--         c.customerid,
--         c.name,
--         o.order_id,
--         o.order_date,
--         o.amount,
--         COUNT(o.order_id) AS order_count
    
--     FROM customers_prc AS c
--     JOIN orders_prc AS o
--     ON c.customerid = o.customer_id
--     GROUP BY c.customerid
-- )
-- SELECT

--     name
    
-- FROM OrderCount
-- WHERE order_count > 2;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH OrderCount AS
(
    SELECT

        c.name,
        COUNT(o.order_id) AS order_count
    
    FROM customers_prc AS c
    JOIN orders_prc AS o
    ON c.customerid = o.customer_id
    GROUP BY c.customerid
)
SELECT

    name
    
FROM OrderCount
WHERE order_count > 2;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT c.name
-- FROM customers_prc c
-- JOIN orders_prc o ON c.customerid = o.customer_id
-- GROUP BY c.name
-- HAVING COUNT(DISTINCT o.order_id) > 2;