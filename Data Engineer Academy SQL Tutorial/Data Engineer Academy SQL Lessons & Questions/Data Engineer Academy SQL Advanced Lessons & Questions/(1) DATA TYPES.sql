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

    customer_id,
    customer_name,
    order_id,
    order_date,
    DATEDIFF('2023-06-01', order_date) AS days_since_order
    
FROM customers AS c
JOIN orders AS o
USING(customer_id);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     c.customer_id
--     ,c.customer_name
--     ,o.order_id
--     ,o.order_date
--     ,DATEDIFF('2023-06-01', o.order_date) AS days_since_order
-- FROM 
--     orders o
-- INNER JOIN
--     customers c
-- ON
--     c.customer_id = o.customer_id;