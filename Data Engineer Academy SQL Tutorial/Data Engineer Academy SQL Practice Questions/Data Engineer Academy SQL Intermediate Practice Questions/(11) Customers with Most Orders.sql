/* Brainstorming section */

-- Inner join the tables given.

-- Group the inner joined tables by customerid.

-- Retrieve the customer name and the count of the number of orders placed per customer.

-- Order the table by the count of the number of orders placed per customer in descending
-- order.

-- Limit the number of displayed rows to 3 (or whatever number of customers you want to
-- to display).

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT name, COUNT(order_id) AS num_orders
-- FROM customers_prc c
-- JOIN orders_prc o
-- ON c.customerid = o.customer_id
-- GROUP BY o.customer_id
-- ORDER BY num_orders DESC
-- LIMIT 2;

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

/* My solution #1: */

SELECT name, COUNT(order_id) AS num_orders
FROM customers_prc c
JOIN orders_prc o
ON c.customerid = o.customer_id
GROUP BY o.customer_id
ORDER BY num_orders DESC
LIMIT 2;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH CustomerOrdersCount AS(
--     SELECT 
--         c.name, 
--         COUNT(*) AS NumberOfOrders
--     FROM customers_prc c
--     JOIN orders_prc o ON c.customerid = o.customer_id
--     GROUP BY c.name
-- )
-- SELECT
--     *
-- FROM CustomerOrdersCount
-- WHERE NumberOfOrders=(
--     SELECT 
--         MAX(NumberOfOrders) 
--     FROM CustomerOrdersCount);