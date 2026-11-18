/* Brainstorming section */

-- Calculate the average order amount for all the order of the entire table.

-- Display the result.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT average of amount
-- FROM orders_prc;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT AVG(amount) AS avg_order_amount
FROM orders_prc;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT AVG(amount) AS AverageOrderAmount
-- FROM orders_prc;