/* Brainstorming section */

-- Picking customers who have placed orders.

-- Group the order-placing customers by city.

-- Calculate the total number of order-placing customers per city.

-- Pick the city that has the most order-placing customers.

-- If there are matches (meaning cities that tie for the most number of
-- order-placing customers), select the first city in alphabetical order.

-- Identify the city from which customers have placed orders the most.
-- If there are matches select the first city in alphabetical order.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH stage1 AS
--  SELECT city, COUNT(name) AS total_orders
--  FROM customers_prc JOIN orders_prc
--  GROUP BY city
-- SELECT *
-- FROM stage1
-- ORDER BY total_orders
-- LIMIT 1;

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

/* My solution */

WITH stage1 AS
(
    SELECT city, COUNT(name) AS total_orders
    FROM customers_prc JOIN orders_prc
    GROUP BY city
)
SELECT city
FROM stage1
ORDER BY total_orders DESC
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT city
-- FROM (
--     SELECT o.customer_id, c.city, COUNT(*) AS order_count
--     FROM orders_prc o
--     JOIN customers_prc c ON o.customer_id = c.customerid
--     GROUP BY o.customer_id, c.city
-- ) AS subquery
-- GROUP BY city
-- ORDER BY SUM(order_count) DESC,city
-- LIMIT 1;