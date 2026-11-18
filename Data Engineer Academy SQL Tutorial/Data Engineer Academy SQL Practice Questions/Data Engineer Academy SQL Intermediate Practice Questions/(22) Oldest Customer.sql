/* Brainstorming section */

-- Join the given tables since we need data from both (name and order date).

-- Order the given table by order date in ascending order (earliest to latest order date).

-- Limit the output to one row in order to view the customer with the earliest order date.

-- Retrieve the customer name and order date.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT name, order_date
-- FROM customers_prc c
-- JOIN orders_prc o ON c.customerid = o.customer_id
-- ORDER BY order_date
-- LIMIT 1;

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

SELECT name, order_date
FROM customers_prc c
JOIN orders_prc o ON c.customerid = o.customer_id
ORDER BY order_date
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT c.name, MIN(o.order_date) AS FirstOrderDate
-- FROM customers_prc c
-- JOIN orders_prc o ON c.customerid = o.customer_id
-- GROUP BY c.name
-- ORDER BY FirstOrderDate
-- LIMIT 1;