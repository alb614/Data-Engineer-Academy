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

/* Viewing table customers */

-- SELECT *
-- FROM customers
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders */

-- SELECT *
-- FROM orders
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    order_id,
    order_status,
    order_amount,
    order_date,
    DATE_ADD(order_date, INTERVAL 7 DAY) AS expected_delivery_date,
    DATE_SUB(order_date, INTERVAL 3 DAY) AS last_cancellation_date,
    c.customer_id,
    customer_name
    
FROM customers AS c JOIN orders AS o
ON c.customer_id = o.customer_id;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     o.order_id,
--     o.order_status,
--     o.order_amount,
--     o.order_date,
--     DATE_ADD(o.order_date, INTERVAL 7 DAY) AS expected_delivery_date,
--     DATE_SUB(o.order_date, INTERVAL 3 DAY) AS last_cancellation_date,
--     c.customer_id,
--     c.customer_name
-- FROM orders o
-- JOIN customers c
--   ON o.customer_id = c.customer_id;