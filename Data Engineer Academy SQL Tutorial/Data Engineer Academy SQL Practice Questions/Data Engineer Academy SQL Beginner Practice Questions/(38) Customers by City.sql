/* Brainstorming section */

-- Group the table by city.

-- Count the total number of customers per city.

-- Display the total number of customers per city.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT count of customers per city
-- FROM customers_prc
-- GROUP BY city;

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
    COUNT(customerid) AS num_customers

FROM customers_prc
GROUP BY city;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT city, COUNT(*) AS NumberOfCustomers
-- FROM customers_prc
-- GROUP BY city;