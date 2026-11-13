/* Brainstorming section */

-- For each product category, 
-- calculate the percentage of remaining stock 
-- based on how many products have been sold. 
-- Only include sales made after January 1, 2023. 
-- Round the percentage to 2 decimal places.

-- Columns to Display: 
-- category_name, 
-- quantity_sold, 
-- available_stocks 
-- and remaining_stock_pct

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT
--     category_name,
--     COUNT(*) AS quantity_sold,
--     available_stocks,
--     ROUND(100*(available_stocks - COUNT(*)) / (available_stocks), 2) AS remaining_stock_pct
-- FROM dim_product_nike AS dpn
-- JOIN dim_category_nike AS dcn
-- USING(category_id)
-- WHERE order_date > "2023-01-01"
-- GROUP BY category_id;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_product_nike */

-- SELECT *
-- FROM dim_product_nike
-- ORDER BY category_id, product_name
-- LIMIT 25;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_category_nike */

-- SELECT *
-- FROM dim_category_nike
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT
    category_name,
    COUNT(*) AS quantity_sold,
    available_stocks,
    ROUND(100*(available_stocks - COUNT(*)) / (available_stocks), 2) AS remaining_stock_pct
FROM dim_product_nike AS dpn
JOIN dim_category_nike AS dcn
USING(category_id)
WHERE order_date > "2023-01-01"
GROUP BY category_id;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- -- This query calculates the percentage of stock remaining for each product category
-- -- based on sales made on or after January 1, 2023.

-- WITH SoldQuantities AS (
--     -- 1. Calculate the total quantity sold for each category since 2023-01-01.
--     -- ASSUMPTION: Each row in dim_product_nike represents one unit sold.
--     SELECT
--         dp.category_id,
--         COUNT(dp.entry_id) AS quantity_sold
--     FROM
--         dim_product_nike dp
--     WHERE
--         dp.order_date >= '2023-01-01'
--     GROUP BY
--         dp.category_id
-- )
-- SELECT
--     dc.category_name,
--     -- Use COALESCE to show 0 if a category had no sales after 2023-01-01
--     COALESCE(sq.quantity_sold, 0) AS quantity_sold,
--     dc.available_stocks,
--     -- Calculate Remaining Stock Percentage: ((Available - Sold) / Available) * 100
--     ROUND(
--         (
--             (dc.available_stocks - COALESCE(sq.quantity_sold, 0))
--             * 100.0 -- Use 100.0 for floating-point multiplication
--             / dc.available_stocks
--         ),
--         2 -- Round to 2 decimal places
--     ) AS remaining_stock_pct
-- FROM
--     dim_category_nike dc
-- LEFT JOIN
--     SoldQuantities sq ON dc.category_id = sq.category_id
-- WHERE
--     -- Exclude categories with zero stock to prevent division by zero errors
--     dc.available_stocks > 0
-- ORDER BY
--     remaining_stock_pct DESC;