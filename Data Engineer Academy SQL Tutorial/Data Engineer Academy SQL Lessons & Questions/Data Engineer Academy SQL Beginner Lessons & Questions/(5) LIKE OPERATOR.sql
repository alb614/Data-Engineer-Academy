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

SELECT 

    product_id, 
    product_name, 
    category
    
FROM products
WHERE product_name LIKE '%e' AND (category = 'Electronics' OR category = 'Appliances');

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT product_id, product_name, category
-- FROM products
-- WHERE product_name LIKE '%e' AND (category = 'Electronics' OR category = 'Appliances');