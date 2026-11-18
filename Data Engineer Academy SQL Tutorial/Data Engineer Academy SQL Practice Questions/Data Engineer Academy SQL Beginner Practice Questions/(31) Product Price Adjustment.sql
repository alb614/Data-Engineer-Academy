/* Brainstorming section */

-- Filter out all the products in the Electronics category.

-- Change the price of all the Electronics products to 10%
-- more.

-- Display the product name and the price increase.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT productid, productname, price, CAST(1.1 * price AS DECIMAL(10, 4)) AS price_increase
-- FROM products_prc
-- WHERE category = 'Electronics';

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

-- Note: Apparently, you can get the desired result without using
-- the CAST function to get 4 decimal places.

SELECT 

    productid, 
    productname, 
    price, 
    ROUND(CAST(1.1 * price AS DECIMAL(10, 4)), 3) AS price_increase
    
FROM products_prc
WHERE category = 'Electronics';

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     productid,
--     productname, 
--     price, 
--     (price * 1.10) AS increasedprice
-- FROM products_prc
-- WHERE 
--     category = 'Electronics';