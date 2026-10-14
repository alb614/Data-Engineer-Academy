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

/* Viewing table products_prc */

-- SELECT *
-- FROM products_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT
    
    productname,
    price AS highest_price
    
FROM products_prc
WHERE price
IN
(
    SELECT
        MAX(price)
    FROM products_prc
);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     productname, price as HighestPrice
-- FROM 
--     products_prc
-- where
--     price = (select max(price) from products_prc);