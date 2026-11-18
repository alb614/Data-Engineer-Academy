/* Brainstorming section */

-- Join the tables on the customer ids.

-- Group by customer id.

-- Sum up the order amounts per customer as total order amount.

-- Find the max generated revenue from among the sum of order
-- amounts.

-- Select the customers that have a total order amount that is
-- equivalent to the max generated revenue.


/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH stage1 AS
-- (
--     SELECT c.customerid, c.name, SUM(o.amount) AS total_order_amount
--     FROM customers_prc AS c
--     JOIN orders_prc AS o
--     ON c.customerid = o.customer_id
--     GROUP BY c.customerid
-- )
-- SELECT name, total_order_amount
-- FROM stage1
-- WHERE total_order_amount = 
--     (
--         SELECT MAX(total_order_amount) 
--         FROM stage1
--     );

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

/* My solution */

WITH stage1 AS
(
    SELECT c.customerid, c.name, SUM(o.amount) AS total_order_amount
    FROM customers_prc AS c
    JOIN orders_prc AS o
    ON c.customerid = o.customer_id
    GROUP BY c.customerid
)
SELECT name, total_order_amount
FROM stage1
WHERE total_order_amount = 
    (
        SELECT MAX(total_order_amount) 
        FROM stage1
    );
    
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT c.name, SUM(o.amount) AS TotalRevenue
-- FROM customers_prc c
-- JOIN orders_prc o ON c.customerid = o.customer_id
-- GROUP BY c.name
-- ORDER BY TotalRevenue DESC
-- LIMIT 1;