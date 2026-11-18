/* Brainstorming section */

-- Retrieve the product name of the products that have a quantity
-- of less than 170.

-- Display the retrieved data.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT productname
-- FROM products_prc
-- WHERE quantityinstock < 170;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table products_prc */

-- SELECT *
-- FROM products_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT productname
FROM products_prc
WHERE quantityinstock < 170;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT productname 
-- FROM products_prc
-- WHERE quantityinstock  < 170;