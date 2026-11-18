/* Brainstorming section */

-- Group the table the customers (customer_id).

-- Count the number of orders that each customer placed.

-- Select the customers having an order count greater than 1.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT
--      customer_id,
--      COUNT(order_id) AS order_count
-- FROM orders_prc
-- GROUP BY customer_id
-- HAVING order_count > 1;
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

SELECT

     customer_id,
     COUNT(order_id) AS order_count
     
FROM orders_prc
GROUP BY customer_id
HAVING order_count > 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT customer_id, COUNT(*) AS OrderCount
-- FROM orders_prc
-- GROUP BY customer_id 
-- HAVING OrderCount > 1;