/* Brainstorming section */

-- Calculate the sum of all the order amounts.

-- Display the result.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT SUM(amount) AS total_revenue
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

SELECT SUM(amount) AS total_revenue
FROM orders_prc;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT SUM(amount) AS TotalRevenue
-- FROM orders_prc;