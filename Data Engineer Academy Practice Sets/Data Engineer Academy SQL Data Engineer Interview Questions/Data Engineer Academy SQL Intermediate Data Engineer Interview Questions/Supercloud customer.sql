/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- A Microsoft Azure Supercloud customer is a customer 
-- who buys at least 1 product from each product category. 
-- Find the number of supercloud customers.

-- Columns to Display: supercloud_customers

-- WITH customer_prod_data AS
-- (
-- SELECT

--     customer_id,
--     COUNT(DISTINCT product_category) AS num_distinct_product_categories_bought,
--     (SELECT COUNT(DISTINCT product_category) FROM dim_products_microsoft) AS num_products 

-- FROM fact_contracts_microsoft
-- JOIN dim_products_microsoft
-- USING(product_id)
-- GROUP BY customer_id
-- )
-- SELECT

--     SUM(
--         CASE
--             WHEN num_distinct_product_categories_bought = num_products THEN 1
--         END
--     ) AS supercloud_customers
-- FROM customer_prod_data;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_contracts_microsoft */

-- SELECT *
-- FROM fact_contracts_microsoft
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_products_microsoft  */

-- SELECT *
-- FROM dim_products_microsoft 
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH customer_prod_data AS
(
    SELECT
    
        customer_id,
        COUNT(DISTINCT product_category) AS num_distinct_product_categories_bought,
        (SELECT COUNT(DISTINCT product_category) FROM dim_products_microsoft) AS num_products 
    
    FROM fact_contracts_microsoft
    JOIN dim_products_microsoft
    USING(product_id)
    GROUP BY customer_id
)
SELECT

    SUM(
        CASE
            WHEN num_distinct_product_categories_bought = num_products THEN 1
        END
    ) AS supercloud_customers
    
FROM customer_prod_data;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH supercloud AS (
--   SELECT
--     customer_id,
--     COUNT(DISTINCT product_category) as unique_count
--   FROM fact_contracts_microsoft
--   JOIN dim_products_microsoft
--     using (product_id)
--   GROUP BY customer_id
-- )
-- SELECT COUNT(*) AS supercloud_customers
-- FROM supercloud
-- WHERE unique_count = (
--   SELECT COUNT(DISTINCT product_category)
--   FROM dim_products_microsoft
-- );