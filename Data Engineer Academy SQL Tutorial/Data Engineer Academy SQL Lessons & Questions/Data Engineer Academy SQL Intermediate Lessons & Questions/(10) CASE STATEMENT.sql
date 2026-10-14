/* Brainstorming section */

-- Retrieve product_name, unit_price and column called "PriceCategory"
-- categorize products by three groups: Low, Medium, High
-- conditions for groups:
-- 1. "Low" for products with price less than 200.
-- 2. "Medium" for products with price between 200 and 500.
-- 3. "High" for products with price greater than 500. 

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
product_name, 
unit_price,

    CASE
    WHEN unit_price < 200 THEN "Low"
    WHEN unit_price >= 200 AND unit_price < 500 THEN "Medium"
    WHEN unit_price >= 500 THEN "High"
    END AS PriceCategory
    
FROM products;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT product_name, unit_price,
--     CASE
--         WHEN unit_price < 200 THEN 'Low'
--         WHEN unit_price >= 200 
--         AND unit_price <= 500 THEN 'Medium'
--         ELSE 'High'
--     END AS PriceCategory
-- FROM products;