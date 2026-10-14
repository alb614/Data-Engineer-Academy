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

/* Viewing table sales_prc */

-- SELECT *
-- FROM sales_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT SUM(quantitysold) total_quantity_sold
FROM sales_prc;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     SUM(QuantitySold) AS TotalQuantitySold 
-- FROM 
--     sales_prc;