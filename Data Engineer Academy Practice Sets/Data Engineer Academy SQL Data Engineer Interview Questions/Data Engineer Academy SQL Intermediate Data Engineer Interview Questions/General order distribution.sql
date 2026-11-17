/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Generate Order Distribustion, how many customers have purchased what number of orders?

-- Like 2 orders done by 5 unique customers, and 10 orders by 20 unique customers and so on. 
-- Columns to Display: order_count, number_of_customers

-- WITH order_count_per_customer AS
-- (
--     SELECT
    
--         customer_id,
--         COUNT(order_id) AS order_count
    
--     FROM shopify_customer
--     RIGHT JOIN shopify_order_history
--     USING(customer_id)
--     GROUP BY 1
-- ),
-- num_cust_per_order_count AS
-- (
-- SELECT

--     order_count,
--     COUNT(DISTINCT customer_id) AS number_of_customers

-- FROM order_count_per_customer
-- GROUP BY 1
-- )
-- SELECT * FROM num_cust_per_order_count;

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

WITH order_count_per_customer AS
(
    SELECT
    
        customer_id,
        COUNT(order_id) AS order_count
    
    FROM shopify_customer
    RIGHT JOIN shopify_order_history
    USING(customer_id)
    GROUP BY 1
),
num_cust_per_order_count AS
(
SELECT

    order_count,
    COUNT(DISTINCT customer_id) AS number_of_customers

FROM order_count_per_customer
GROUP BY 1
)
SELECT * FROM num_cust_per_order_count;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT order_count,
--       Count(DISTINCT customer_id) AS number_of_customers
-- FROM   (SELECT customer_id,
--               Count(DISTINCT order_id) AS order_count
--         FROM   shopify_order_history
--         GROUP  BY 1) temp
-- GROUP  BY 1
-- ORDER  BY 1;