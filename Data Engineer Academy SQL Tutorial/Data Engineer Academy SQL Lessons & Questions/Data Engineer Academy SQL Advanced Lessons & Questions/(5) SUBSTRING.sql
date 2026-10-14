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
    SUBSTRING(category, 1, 5) AS first_5_chars
    
FROM products;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- select 
--     product_id, product_name, SUBSTRING(category, 1, 5) AS first_5_chars 
-- from 
--     products;