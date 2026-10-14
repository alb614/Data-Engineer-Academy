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

c.customer_id, 
c.customer_name,
o.order_id,
o.order_date,
o.order_amount

FROM customers AS c JOIN orders AS o
ON c.customer_id = o.customer_id AND o.order_amount >= 500;

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
-- JOIN 
--     orders o 
-- ON 
--     c.customer_id = o.customer_id
-- AND 
--     o.order_amount >= 500;