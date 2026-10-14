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
    UPPER(product_name) AS ProductNameUpper,
    LOWER(category) AS CategoryLower
    
FROM products;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     product_id,
--     UPPER(product_name) AS ProductNameUpper,
--     LOWER(category) AS CategoryLower
-- FROM
--     products;