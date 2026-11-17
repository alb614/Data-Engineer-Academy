/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- For each city, find the year-on-year growth rate of 2024 and 2025.

-- The y-o-y growth rate is the growth of the average price per sqft 
-- of the current year compared to the previous year.
-- (AVG(price/sqft) of 2024 - AVG(price/sqft) of 2023) / AVG(price/sqft) of 2023

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_agreements_zillow */

-- SELECT *
-- FROM fact_agreements_zillow 
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_real_estate_companies_zillow */

-- SELECT *
-- FROM dim_real_estate_companies_zillow 
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution #1 */

-- WITH averages AS
-- (
--     SELECT
    
--         city,
--         purchase_year,
--         AVG(price/sqft) AS average_price_per_sqft
        
--     FROM fact_agreements_zillow 
--     GROUP BY city, purchase_year
--     ORDER BY city
-- ),
-- year_on_year_avg_rates AS
-- (
--     SELECT
    
--         city,
--         purchase_year,
--         100 * (average_price_per_sqft - LAG(average_price_per_sqft, 1) OVER(PARTITION BY city ORDER BY purchase_year)) / LAG(average_price_per_sqft, 1) OVER(PARTITION BY city ORDER BY purchase_year) AS year_on_year_rate
--     FROM averages
-- ),
-- year_on_year_avg_rates_2024 AS
-- (
--     SELECT
    
--         city,
--         year_on_year_rate AS year_on_year_rate_2024
        
--     FROM year_on_year_avg_rates
--     WHERE purchase_year = 2024
-- ),
-- year_on_year_avg_rates_2025 AS
-- (
--     SELECT
    
--         city,
--         year_on_year_rate AS year_on_year_rate_2025
        
--     FROM year_on_year_avg_rates
--     WHERE purchase_year = 2025
-- ),
-- year_on_year_avg_rates_2024_2025 AS
-- (

--     SELECT
    
--         city,
--         year_on_year_rate_2024,
--         year_on_year_rate_2025
        
--     FROM year_on_year_avg_rates_2024
--     JOIN year_on_year_avg_rates_2025
--     USING(city)

-- )
-- SELECT *
-- FROM year_on_year_avg_rates_2024_2025;
    

/*----------------------------------------------------------------------------------------------*/

/* My solution #2 */

WITH averages AS
(
    SELECT
    
        city,
        purchase_year,
        AVG(price/sqft) AS average_price_per_sqft
        
    FROM fact_agreements_zillow 
    GROUP BY city, purchase_year
    ORDER BY city
),
year_on_year_avg_rates AS
(
    SELECT
    
        city,
        purchase_year,
        100 * (average_price_per_sqft - LAG(average_price_per_sqft, 1) OVER(PARTITION BY city ORDER BY purchase_year)) / LAG(average_price_per_sqft, 1) OVER(PARTITION BY city ORDER BY purchase_year) AS year_on_year_rate
    FROM averages
),
year_on_year_avg_rates_2024_2025 AS
(
    SELECT
    
        city,
        CASE
            WHEN purchase_year = 2024 THEN year_on_year_rate
        END AS year_on_year_rate_2024,
        CASE
            WHEN purchase_year = 2025 THEN year_on_year_rate
        END AS year_on_year_rate_2025
        
    FROM year_on_year_avg_rates
)
SELECT
    
    city,
    MAX(year_on_year_rate_2024) AS year_on_year_rate_2024,
    MAX(year_on_year_rate_2025) AS year_on_year_rate_2025
    
FROM year_on_year_avg_rates_2024_2025
GROUP BY city;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution: With modified aliases */

-- WITH average_price_per_city AS (
--     SELECT
--         city
--         ,purchase_year
--         ,AVG(price / sqft) AS avg_price
--     FROM fact_agreements_zillow
--     GROUP BY city, purchase_year
--     ORDER BY city, purchase_year
-- )

-- ,years AS(
--     SELECT
--         *
--         ,LEAD(avg_price,1) OVER (PARTITION BY city ORDER BY purchase_year) AS avg_price_one_year_later
--         ,LEAD(avg_price,2) OVER (PARTITION BY city ORDER BY purchase_year) AS avg_price_two_years_later
--     FROM average_price_per_city
-- )

-- SELECT
--     city
--     ,100 * (avg_price_one_year_later - avg_price) / (avg_price) AS yoy_rate_2024
--     ,100 * (avg_price_two_years_later - avg_price_one_year_later) / (avg_price_one_year_later) AS yoy_rate_2025
-- FROM years
-- WHERE avg_price_two_years_later IS NOT NULL;