/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Write a SQL query to generate a sales report 
-- by quarter for each product description (the description column in shopify_product table).

-- Only include orders where the order status is Completed.

-- Output should be 
-- quarter, 
-- description, 
-- and product_revenue, 
-- sorted by timeline descending. 
-- Limit the output to 20 rows.

-- Columns to Display: year_quarter, description, product_revenue

-- SELECT 
--     CASE
--         WHEN MONTH(order_time) BETWEEN 1 AND 3 THEN CONCAT(DATE_FORMAT(order_time, '%Y'), '-', 1)
--         WHEN MONTH(order_time) BETWEEN 4 AND 6 THEN CONCAT(DATE_FORMAT(order_time, '%Y'), '-', 2)
--         WHEN MONTH(order_time) BETWEEN 7 AND 9 THEN CONCAT(DATE_FORMAT(order_time, '%Y'), '-', 3)
--         WHEN MONTH(order_time) BETWEEN 10 AND 12 THEN CONCAT(DATE_FORMAT(order_time, '%Y'), '-', 4)
--     END AS year_quarter,
--     description, 
--     SUM(unit_price * units) AS product_revenue
-- FROM shopify_customer JOIN shopify_order_history USING(customer_id) 
-- JOIN shopify_product USING(product_id)
-- WHERE order_status = 'Completed'
-- GROUP BY year_quarter, description
-- ORDER BY year_quarter DESC, description
-- LIMIT 20;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table shopify_customer */

-- SELECT *
-- FROM shopify_customer
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table shopify_order_history */

-- SELECT *
-- FROM shopify_order_history
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table shopify_product */

-- SELECT *
-- FROM shopify_product
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    CASE
        WHEN MONTH(order_time) BETWEEN 1 AND 3 THEN CONCAT(DATE_FORMAT(order_time, '%Y'), '-', 1)
        WHEN MONTH(order_time) BETWEEN 4 AND 6 THEN CONCAT(DATE_FORMAT(order_time, '%Y'), '-', 2)
        WHEN MONTH(order_time) BETWEEN 7 AND 9 THEN CONCAT(DATE_FORMAT(order_time, '%Y'), '-', 3)
        WHEN MONTH(order_time) BETWEEN 10 AND 12 THEN CONCAT(DATE_FORMAT(order_time, '%Y'), '-', 4)
    END AS year_quarter,
    description, 
    SUM(unit_price * units) AS product_revenue
    
FROM shopify_customer 
JOIN shopify_order_history 
USING(customer_id) 
JOIN shopify_product 
USING(product_id)
WHERE order_status = 'Completed'
GROUP BY year_quarter, description
ORDER BY year_quarter DESC, description
LIMIT 20;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 

-- concat(EXTRACT(YEAR FROM order_time),'-',EXTRACT(Quarter FROM order_time)) 

-- AS year_quarter,
    
--       b.description,
--       Sum(a.units* b.unit_price)  AS product_revenue
       
-- FROM   shopify_order_history a
--       LEFT JOIN shopify_product b
--               ON a.product_id = b. product_id
-- WHERE  order_status = 'Completed'
-- GROUP  BY 1, 2
-- ORDER  BY year_quarter DESC
-- LIMIT 20;