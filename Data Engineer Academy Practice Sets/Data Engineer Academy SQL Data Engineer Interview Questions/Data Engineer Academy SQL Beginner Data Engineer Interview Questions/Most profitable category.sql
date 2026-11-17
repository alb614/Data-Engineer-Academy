/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Select the sold and most profitable product 
-- category for Microsoft 
-- (The category with the highest sales revenue), 
-- fact_contracts_microsoft table 
-- holds the data of sold products.

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

SELECT

    Product_category AS product_category,
    SUM(Price) AS total_amount
    
FROM dim_products_microsoft 
JOIN fact_contracts_microsoft
USING(Product_ID)
GROUP BY Product_category
ORDER BY total_amount DESC
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT product_category, SUM(price) AS total_amount
-- FROM fact_contracts_microsoft
-- JOIN dim_products_microsoft USING (product_id)
-- GROUP BY product_category
-- ORDER BY total_amount DESC
-- LIMIT 1;