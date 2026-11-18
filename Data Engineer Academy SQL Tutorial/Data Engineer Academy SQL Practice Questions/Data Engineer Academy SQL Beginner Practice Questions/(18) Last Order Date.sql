/* Brainstorming section */

-- Order the orders by date in descending order.

-- Select the first order that appears.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT order_date
-- FROM orders_prc
-- ORDER BY order_date DESC
-- LIMIT 1;

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

/* My solution */

-- Note: This query could also have been solved using the MAX aggregate function to find the
-- most recent order_date immediately.

SELECT order_date
FROM orders_prc
ORDER BY order_date DESC
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     max(order_date) AS LastOrderDate 
-- FROM 
--     orders_prc;