/* Brainstorming section */

-- Retrieve a list of customer_id and customer_name
-- along with the total number of orders as "order_count" they have placed 
-- and the total amount as "total_amount" they have spent 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT 
--     c.customer_id, 
--     c.customer_name,
--     COUNT(o.order_id),
--     SUM(o.order_amount)
-- FROM customers AS c 
-- LEFT JOIN orders AS o 
--     ON c.customer_id = o.customer_id
-- GROUP BY c.customer_id; 

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

	c.customer_id,
	c.customer_name,
	COUNT(o.order_id) AS order_count,
	COALESCE(SUM(o.order_amount), 0) AS total_amount

FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING order_count > 0;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     c.customer_id,
--     c.customer_name,
--     COUNT(o.order_id) AS order_count,
--     SUM(o.order_amount) AS total_amount
-- FROM 
--     customers c
-- WHERE o.order_amount >=1
-- LEFT JOIN 
--     orders o
-- ON 
--     c.customer_id = o.customer_id
-- GROUP BY
--     c.customer_id, c.customer_name;