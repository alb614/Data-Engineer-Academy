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

/* Viewing table products */

-- SELECT *
-- FROM products
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT product_id, product_name, unit_price
FROM products
WHERE category IN ('Electronics', 'Appliances');

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT product_id, product_name, unit_price
-- FROM products
-- WHERE category IN ('Electronics', 'Appliances');