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

    customer_name,
    DATE_FORMAT(order_date, '%d/%m/%Y') AS formatted_date,
    DATE_FORMAT(order_date, '%W') AS weekday
    
FROM customers c JOIN orders o
USING (customer_id);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--   c.customer_name,
--   DATE_FORMAT(o.order_date, '%d/%m/%Y') AS formatted_date,
--   DATE_FORMAT(o.order_date, '%W') AS weekday
-- FROM orders o
-- JOIN customers c
--   ON o.customer_id = c.customer_id;