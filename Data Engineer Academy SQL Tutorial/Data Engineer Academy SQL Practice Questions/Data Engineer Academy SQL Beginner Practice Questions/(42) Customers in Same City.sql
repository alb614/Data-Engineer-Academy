/* Brainstorming section */

-- Select the names of customers from the city of New York.

-- Display the names.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT name
-- FROM customers_prc
-- WHERE city = 'New York';

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

SELECT name
FROM customers_prc
WHERE city = 'New York';

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT name
-- FROM customers_prc
-- WHERE city = 'New York';