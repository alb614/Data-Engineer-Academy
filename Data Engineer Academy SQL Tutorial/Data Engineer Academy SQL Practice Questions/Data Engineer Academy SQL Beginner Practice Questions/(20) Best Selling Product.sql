/* Brainstorming section */

-- Select the product (by name) with the maximum number of sold units.

-- Display the name of that product.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT 

--     product,
--     tot_quantity_sold

-- FROM 
-- (
--     SELECT
    
--         product,
--         SUM(quantitysold) AS tot_quantity_sold
        
--     FROM sales_prc
--     GROUP BY product
-- ) AS stage1
-- WHERE
--      tot_quantity_sold = (SELECT MAX(tot_quantity_sold) FROM (SELECT product, SUM(quantitysold) AS tot_quantity_sold FROM sales_prc GROUP BY product) AS stage2) AS stage3;

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

/* My solution */

-- Note: Here two aggregate functions were used to get the result (SUM & MAX).
-- When using these two, it may require the usage of subqueries/CTEs.  If one desires to 
-- avoid unnecessarily long code, one can simply use SUM to get the total quantity sold per
-- product after grouping the products and then simply using ORDER BY to avoid the need for 
-- using MAX.  Be sure to use LIMIT 1 after ordering (descending) to select the single 
-- product with the most units sold.

SELECT 

    product,
    tot_quantity_sold

FROM 
(
    SELECT
    
        product,
        SUM(quantitysold) AS tot_quantity_sold
        
    FROM sales_prc
    GROUP BY product
) AS stage1
WHERE
     tot_quantity_sold = (SELECT MAX(tot_quantity_sold) FROM (SELECT product, SUM(quantitysold) AS tot_quantity_sold FROM sales_prc GROUP BY product) AS stage2) AS stage3;
     
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT product, SUM(quantitysold) AS TotalSold
-- FROM sales_prc
-- GROUP BY product
-- ORDER BY TotalSold DESC
-- LIMIT 1;