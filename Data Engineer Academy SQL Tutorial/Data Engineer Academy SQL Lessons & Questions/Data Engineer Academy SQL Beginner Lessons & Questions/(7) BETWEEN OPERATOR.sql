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
WHERE order_date BETWEEN '2023-01-01' AND '2023-06-30';

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT order_id, order_date, order_amount
-- FROM orders
-- WHERE order_date BETWEEN '2023-01-01' AND '2023-06-30';