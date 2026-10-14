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

/* My solution #1 */

-- SELECT

--     product_name,
--     category,
--     unit_price,
--     LEAD(product_name, 1, 'X') OVER (PARTITION BY category ORDER BY unit_price) AS next_product_name,
--     LEAD(unit_price, 1, 0) OVER (PARTITION BY category ORDER BY unit_price) AS next_product_price
    
-- FROM products;

/*----------------------------------------------------------------------------------------------*/

/* My solution #2 */

/* This is the query displaying the information in the same order as the expected output */

SELECT

    product_name,
    unit_price,
    LEAD(product_name, 1, 'X') OVER (PARTITION BY category ORDER BY unit_price) AS next_product_name,
    LEAD(unit_price, 1, 0) OVER (PARTITION BY category ORDER BY unit_price) AS next_product_price,
    category
    
FROM products;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     product_name,
--     unit_price,
--     COALESCE(LEAD(product_name) OVER (PARTITION BY category ORDER BY unit_price), 'X') AS next_product_name,
--     COALESCE(LEAD(unit_price) OVER (PARTITION BY category ORDER BY unit_price), 0) AS next_product_price,
--     category
-- FROM
--     products;