/* Brainstorming section */

-- Find the customer who had the longest gap BETWEEN FIRST and LAST orders.
-- Get the name of the customer & duration of the gap.
-- Find the dates of the first & last orders.
-- Calculate the number of days between the first & last orders for each customer who placed
-- order.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Retrieve customers who placed orders | SELECT customers FROM customer_prc JOIN orders_prc
-- Retrieve the duration of the order gap for the customers that placed orders | use DATEDIFF() & ROWNUMBER
-- Retrieve the customer who placed orders with the longest duration of the order gap

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

-- WITH stage1 AS
-- (

-- SELECT

--     c.customerid,
--     c.name,
--     o.order_id,
--     o.order_date,
--     o.amount
    
-- FROM customers_prc AS c
-- JOIN orders_prc AS o
-- ON c.customerid = o.customer_id
-- ORDER BY c.name, o.order_date

-- ),
-- stage2 AS
-- (

-- SELECT

--     s1.name,
--     DATEDIFF(MAX(s1.order_date), MIN(s1.order_date)) AS order_gap
    
-- FROM stage1 AS s1
-- GROUP BY s1.name

-- )
-- SELECT * FROM stage2;
-- SELECT 

-- s2.name,
-- s2.order_gap

-- FROM stage2 AS s2
-- GROUP BY s2.name
-- HAVING s2.order_gap = MAX(s2.order_gap);

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH stage1 AS
(

    SELECT

        c.customerid,
        c.name,
        o.order_id,
        o.order_date,
        o.amount,
        DATEDIFF(MAX(o.order_date), MIN(o.order_date)) AS order_gap
    
    FROM customers_prc AS c
    JOIN orders_prc AS o
    ON c.customerid = o.customer_id
    GROUP BY c.name
    ORDER BY c.name, o.order_date

)
SELECT name, order_gap 
FROM stage1
WHERE order_gap = 
(
    SELECT
        MAX(order_gap)
    FROM stage1
);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT c.name, MAX(DATEDIFF(o2.order_date, o1.order_date)) AS LongestGap
-- FROM customers_prc c
-- JOIN orders_prc o1 ON c.customerid = o1.customer_id
-- JOIN orders_prc o2 ON c.customerid = o2.customer_id
-- WHERE o2.order_id > o1.order_id
-- GROUP BY name
-- ORDER BY LongestGap DESC
-- LIMIT 1;