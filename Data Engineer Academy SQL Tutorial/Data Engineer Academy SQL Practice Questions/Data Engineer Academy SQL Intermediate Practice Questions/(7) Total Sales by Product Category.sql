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

-- SELECT *
-- FROM sales_prc
-- GROUP BY product;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table products_prc */

-- SELECT *
-- FROM products_prc
-- LIMIT 5;

-- SELECT *
-- FROM products_prc
-- GROUP BY productname;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1: */

-- SELECT

--     saleid,
--     product,
--     SUM(quantitysold) AS totalquantity
    
-- FROM sales_prc
-- GROUP BY product;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #2: */

-- SELECT *
-- FROM products_prc
-- JOIN
-- (
--     SELECT

--     saleid,
--     product,
--     SUM(quantitysold) AS totalquantity
    
--     FROM sales_prc
--     GROUP BY product
-- ) AS grouped_sales_prc
-- ON productname = grouped_sales_prc.product;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #3: */

-- SELECT

--     productname,
--     price,
--     category,
--     total_quantity_sold

-- FROM products_prc
-- JOIN
-- (
--     SELECT

--     saleid,
--     product,
--     SUM(quantitysold) AS total_quantity_sold
    
--     FROM sales_prc
--     GROUP BY product
-- ) AS grouped_sales_prc
-- ON productname = grouped_sales_prc.product;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #4: */

-- SELECT

--     productname,
--     price,
--     category,
--     total_quantity_sold,
--     price * total_quantity_sold AS total_sales_for_product

-- FROM products_prc
-- JOIN
-- (
--     SELECT

--     saleid,
--     product,
--     SUM(quantitysold) AS total_quantity_sold
    
--     FROM sales_prc
--     GROUP BY product
-- ) AS grouped_sales_prc
-- ON productname = grouped_sales_prc.product;

/*----------------------------------------------------------------------------------------------*/

/* My solution: */

SELECT

    category,
    SUM(total_sales_for_product) AS total_sales_amount
    
FROM
(
    SELECT

    productname,
    price,
    category,
    total_quantity_sold,
    price * total_quantity_sold AS total_sales_for_product

    FROM products_prc
    JOIN
    (
        SELECT

        saleid,
        product,
        SUM(quantitysold) AS total_quantity_sold
    
        FROM sales_prc
        GROUP BY product
    ) AS grouped_sales_prc
    ON productname = grouped_sales_prc.product
) AS joined_grouped_sales_and_products
GROUP BY category;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT p.category, SUM(s.quantitysold * p.price) AS TotalSalesAmount
-- FROM products_prc p
-- JOIN sales_prc s ON p.productname = s.product
-- GROUP BY p.category;