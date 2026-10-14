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
c.address,
o.order_id,
o.order_date,
o.order_amount,
o.order_status,
o.shipping_address

FROM customers c JOIN orders o
ON c.customer_id = o.customer_id AND c.address = o.shipping_address;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     c.customer_id,
--     c.customer_name,
--     c.address,
--     o.order_id,
--     o.order_date,
--     o.order_amount,
--     o.shipping_address,
--     o.order_status
-- FROM 
--     customers c
-- JOIN 
--     orders o 
-- ON 
--     c.customer_id = o.customer_id 
-- AND 
--     c.address = o.shipping_address;