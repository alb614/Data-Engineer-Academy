/* Brainstorming section */

-- Calculate the average order amount of every order on the table.

-- Display the average.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT AVG(amount)
-- FROM orders_prc;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT AVG(amount) AS avg_order_amount
FROM orders_prc;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     AVG(amount) AS AverageOrderAmount 
-- FROM 
--     orders_prc;