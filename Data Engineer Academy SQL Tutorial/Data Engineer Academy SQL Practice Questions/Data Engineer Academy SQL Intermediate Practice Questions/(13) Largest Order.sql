/* Brainstorming section */

-- Join the given tables.

-- Group the table by customer name or ID (ID is preferable since they are unique).

-- Calculate the maximum order amount per customer using the MAX aggregated function.

-- Retrieve and display the result set.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT c.name, MAX(amount) AS max_order_amount
-- FROM orders_prc o
-- JOIN customers_prc c
-- ON o.customer_id = c.customerid
-- GROUP BY o.customer_id;

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

/* Viewing table customers_prc */

-- SELECT *
-- FROM customers_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT c.name, MAX(amount) AS max_order_amount
FROM orders_prc o
JOIN customers_prc c
ON o.customer_id = c.customerid
GROUP BY o.customer_id;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT c.name, MAX(o.amount) AS LargestOrderAmount
-- FROM customers_prc c
-- JOIN orders_prc o ON c.customerid = o.customer_id
-- GROUP BY c.name;