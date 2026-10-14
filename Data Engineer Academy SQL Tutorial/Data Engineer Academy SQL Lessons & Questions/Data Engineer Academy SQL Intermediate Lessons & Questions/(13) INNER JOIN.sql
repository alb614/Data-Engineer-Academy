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

customers.customer_id,
customer_name,
order_id,
order_date,
order_amount

FROM customers INNER JOIN orders
USING (customer_id);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     c.customer_id,
--     c.customer_name, 
--     o.order_id,
--     o.order_date,
--     o.order_amount
-- FROM
--     customers c
-- INNER JOIN
--     orders o ON c.customer_id = o.customer_id;