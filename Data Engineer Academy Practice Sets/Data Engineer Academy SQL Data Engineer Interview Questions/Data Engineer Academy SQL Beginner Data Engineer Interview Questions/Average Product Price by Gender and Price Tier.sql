/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- For products with available stock above 100 and ordered after January 1, 2023, 
-- calculate the average price by gender. 
-- Additionally, label each average price as 'Premium' if it’s above 170, 
-- otherwise 'Affordable'. Round the average price to 2 decimal places.

-- Output should contain: gender, avg_price, and price_tier.

-- WITH average_price_per_gender AS
-- (
-- SELECT
--     gender,
--     ROUND(AVG(price), 2) AS avg_price
-- FROM dim_product_nike
-- JOIN dim_category_nike
-- USING(category_id)
-- WHERE available_stocks > 100
--     AND DATE_FORMAT(order_date, '%Y-%m-%d') > '2023-01-01'
-- GROUP BY gender
-- )
-- SELECT
--     gender,
--     avg_price,
--     CASE
--         WHEN avg_price > 170 THEN 'Premium'
--     ELSE 'Affordable'
--     END AS price_tier
-- FROM average_price_per_gender;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_product_nike */

-- SELECT *
-- FROM dim_product_nike
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_category_nike */

-- SELECT *
-- FROM dim_category_nike
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH average_price_per_gender AS
(
SELECT
    gender,
    ROUND(AVG(price), 2) AS avg_price
FROM dim_product_nike
JOIN dim_category_nike
USING(category_id)
WHERE available_stocks > 100
    AND DATE_FORMAT(order_date, '%Y-%m-%d') > '2023-01-01'
GROUP BY gender
)
SELECT
    gender,
    avg_price,
    CASE
        WHEN avg_price > 170 THEN 'Premium'
    ELSE 'Affordable'
    END AS price_tier
FROM average_price_per_gender;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     p.gender,
--     ROUND(AVG(p.price), 2) AS avg_price,
--     CASE 
--         WHEN AVG(p.price) > 170 THEN 'Premium'
--         ELSE 'Affordable'
--     END AS price_tier
-- FROM dim_product_nike p
-- JOIN dim_category_nike c ON p.category_id = c.category_id
-- WHERE 
--     c.available_stocks > 100
--     AND p.order_date > '2023-01-01'
-- GROUP BY p.gender;