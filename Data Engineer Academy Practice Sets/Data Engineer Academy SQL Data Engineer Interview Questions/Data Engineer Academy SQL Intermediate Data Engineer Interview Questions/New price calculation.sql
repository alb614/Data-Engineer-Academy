/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the price of each car at the time of sale. 
-- Display the two highest prices for each brand.

-- Assume the start price is from January 2023 and all the cars were sold later that year.

-- Columns to Display: brand, price

-- WITH price_calculation AS
-- (
-- SELECT

--     VIN,
--     brand,
--     POW(1 + (monthly_inflation_rate / 100), TIMESTAMPDIFF(MONTH, '2023-01-01', sale_date))  * start_price AS price
    
-- FROM fact_sales_tesla
-- LEFT JOIN dim_brands_tesla
-- USING(brand)
-- ),
-- select_distinct_model_prices AS
-- (
-- SELECT

--     DISTINCT price,
--     brand

-- FROM price_calculation
-- ),
-- ranked_sales_per_model_by_price AS
-- (
-- SELECT

--     TRUNCATE(price, 0) AS price,
--     brand,
--     ROW_NUMBER() OVER(PARTITION BY brand ORDER BY price DESC) AS rnk
    
-- FROM select_distinct_model_prices
-- )
-- SELECT

--     brand,
--     price
    
-- FROM ranked_sales_per_model_by_price
-- WHERE rnk IN (1, 2)
-- ORDER BY brand;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_brands_tesla */

-- SELECT *
-- FROM dim_brands_tesla
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_sales_tesla */

-- SELECT *
-- FROM fact_sales_tesla
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH price_calculation AS
(
    SELECT
    
        VIN,
        brand,
        POW(1 + (monthly_inflation_rate / 100), TIMESTAMPDIFF(MONTH, '2023-01-01', sale_date))  * start_price AS price
        
    FROM fact_sales_tesla
    LEFT JOIN dim_brands_tesla
    USING(brand)
),
select_distinct_model_prices AS
(
    SELECT
    
        DISTINCT price,
        brand
    
    FROM price_calculation
),
ranked_sales_per_model_by_price AS
(
    SELECT
    
        TRUNCATE(price, 0) AS price,
        brand,
        ROW_NUMBER() OVER(PARTITION BY brand ORDER BY price DESC) AS rnk
        
    FROM select_distinct_model_prices
)
SELECT

    brand,
    price
    
FROM ranked_sales_per_model_by_price
WHERE rnk IN (1, 2)
ORDER BY brand;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH car_prices AS (
-- SELECT vin, brand,
-- TRUNCATE(start_price * POWER(1 + monthly_inflation_rate/100 , EXTRACT(month FROM sale_date)-1), 0) AS price
-- FROM fact_sales_tesla
-- JOIN dim_brands_tesla USING(brand)
-- )
-- SELECT DISTINCT brand, price
-- FROM (
-- SELECT *, DENSE_RANK() OVER(PARTITION BY brand ORDER BY price DESC) AS rnk
-- FROM car_prices
-- ) t
-- WHERE t.rnk < 3;