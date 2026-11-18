/* Brainstorming section */

-- Filter out the cities that have more than one customer (at least 2 customers).

-- Group the table by city.

-- Count the number of customers per city.

-- Display results.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT

--      city,
--      num_cust

-- FROM
-- (
--      SELECT *, COUNT(customerid) AS num_cust
--      FROM customers_prc
--      GROUP BY city 
-- ) AS customers_prc_modded
-- WHERE num_cust > 1;

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

-- Note: After looking at the solution, I realized that I didn’t need to solve 
-- this task using a subquery.  I could’ve just calculated the number of customers 
-- per city (given the table is grouped by city) and then used a HAVING clause to 
-- filter out the cities whose customer count is less than 2.

SELECT

     city,
     num_cust

FROM
(
     SELECT *, COUNT(customerid) AS num_cust
     FROM customers_prc
     GROUP BY city 
) AS customers_prc_modded
WHERE num_cust > 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT city, COUNT(*) AS NumberOfCustomers
-- FROM customers_prc
-- GROUP BY city
-- HAVING COUNT(*) > 1;