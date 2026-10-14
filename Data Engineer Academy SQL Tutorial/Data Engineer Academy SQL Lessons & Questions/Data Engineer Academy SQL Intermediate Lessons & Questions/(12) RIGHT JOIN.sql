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

orders.order_id,
orders.order_date,
orders.order_amount,
customers.customer_name,
customers.email AS customer_email

FROM orders RIGHT JOIN customers 
ON customers.customer_id = orders.customer_id;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     o.order_id,
--     o.order_date,
--     o.order_amount,
--     c.customer_name AS customer_name,
--     c.email AS customer_email
-- FROM
--     orders o
-- RIGHT JOIN
--     customers c ON o.customer_id = c.customer_id;