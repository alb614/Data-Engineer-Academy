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
    customer_name,
    order_id,
    order_date,
    order_amount
    
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
WHERE MOD(LENGTH(customer_name), 2) = 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     c.customer_id
--     ,c.customer_name
--     ,o.order_id
--     ,o.order_date
--     ,o.order_amount
-- FROM 
--     orders o
-- INNER JOIN
--     customers c
-- ON
--     o.customer_id = c.customer_id
-- WHERE 
--     LENGTH(c.customer_name) % 2 = 1;