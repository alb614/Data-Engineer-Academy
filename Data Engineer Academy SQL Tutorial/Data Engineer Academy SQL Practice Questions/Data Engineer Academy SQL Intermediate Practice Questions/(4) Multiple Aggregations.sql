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

/* Viewing table sales_prc */

-- SELECT *
-- FROM sales_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table products_prc */

-- SELECT *
-- FROM products_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    category,
    SUM(quantitysold) AS total_quantity_sold,
    AVG(price) AS average_price,
    MAX(price) AS max_price
    
FROM sales_prc sp JOIN products_prc pp
ON sp.product = pp.productname
GROUP BY category;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- SELECT *
-- FROM sales_prc JOIN products_prc
-- ON saleid = productid;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT p.category, 
--       SUM(s.quantitysold) AS TotalQuantitySold,
--       AVG(p.price) AS AveragePrice,
--       MAX(p.price) AS MaximumPrice
-- FROM products_prc p
-- JOIN sales_prc s ON p.productname = s.product
-- GROUP BY p.category;