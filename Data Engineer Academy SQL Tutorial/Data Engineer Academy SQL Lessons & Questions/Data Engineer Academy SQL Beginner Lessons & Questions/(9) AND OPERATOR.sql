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

/* Viewing table orders */

-- SELECT *
-- FROM orders
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT order_id, order_date, order_amount
FROM orders
WHERE order_status = 'Processing' AND order_amount > 300;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT order_id, order_date, order_amount
-- FROM orders
-- WHERE order_status = 'Processing' AND order_amount > 300;