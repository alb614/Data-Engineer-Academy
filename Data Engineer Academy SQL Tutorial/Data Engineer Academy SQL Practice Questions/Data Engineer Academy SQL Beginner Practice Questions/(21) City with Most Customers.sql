/* Brainstorming section */

-- Make groups using the cities on the table.

-- Count the number of customers in each city group.

-- Select the city group with the highest customer count.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT
--      city,
--      COUNT(*) AS num_customers
-- FROM customers_prc
-- GROUP BY city
-- ORDER BY num_customers DESC
-- LIMIT 1;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table customers_prc */

-- SELECT *
-- FROM customers_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT
     city,
     COUNT(*) AS num_customers
FROM customers_prc
GROUP BY city
ORDER BY num_customers DESC
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT city, COUNT(*) AS CustomerCount
-- FROM customers_prc
-- GROUP BY city
-- ORDER BY CustomerCount DESC
-- LIMIT 1;