/* Brainstorming section */

-- Sum all the amounts of all the order on the table.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT SUM(amount) FROM orders_prc

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

SELECT SUM(amount) AS total_amount 
FROM orders_prc;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     SUM(amount) AS TotalAmount 
-- FROM 
--     orders_prc;