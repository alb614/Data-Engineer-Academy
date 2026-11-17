/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Variation in sales by temperature and fuel cost for each month. 

-- By using Subquery

-- Columns to Display: Month, Average Sales, Average Temperature 
-- and Average Fuel price of that month. 

-- SELECT

--     MONTH(f.week_date) AS Month,
--     ROUND(AVG(weekly_sales)) AS Average_Sales,
--     ROUND(AVG(week_temperature), 2) AS Average_Temperature,
--     ROUND(AVG(week_fuel_price), 2) AS Average_Fuel

-- FROM fact_weekly_features_costco AS f
-- JOIN fact_weekly_sales_costco AS s
-- ON f.store_id = s.store_id AND f.week_date = s.week_date
-- GROUP BY Month;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_departments_costco */

-- SELECT *
-- FROM dim_departments_costco
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_stores_costco */

-- SELECT *
-- FROM dim_stores_costco
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_weekly_features_costco */

-- SELECT *
-- FROM fact_weekly_features_costco
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_weekly_sales_costco */

-- SELECT *
-- FROM fact_weekly_sales_costco
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution #1 */

-- SELECT

--     MONTH(f.week_date) AS Month,
--     ROUND(AVG(weekly_sales)) AS Average_Sales,
--     ROUND(AVG(week_temperature), 2) AS Average_Temperature,
--     ROUND(AVG(week_fuel_price), 2) AS Average_Fuel

-- FROM fact_weekly_features_costco AS f
-- JOIN fact_weekly_sales_costco AS s
-- ON f.store_id = s.store_id AND f.week_date = s.week_date
-- GROUP BY Month;

/*----------------------------------------------------------------------------------------------*/

/* My solution #2 */

SELECT

    MONTH(week_date) AS Month,
    ROUND(AVG(weekly_sales)) AS Average_Sales,
    ROUND(AVG(week_temperature), 2) AS Average_Temperature,
    ROUND(AVG(week_fuel_price), 2) AS Average_Fuel

FROM
(
    SELECT
    
        f.week_date,
        weekly_sales,
        week_temperature,
        week_fuel_price
    
    FROM fact_weekly_features_costco AS f
    JOIN fact_weekly_sales_costco AS s
    ON f.store_id = s.store_id AND f.week_date = s.week_date
) AS store_data
GROUP BY Month;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     sales.month_number,
--     avg_sales,
--     avg_temp,
--     avg_fuel_price
-- FROM (
--     SELECT MONTH(week_date) AS month_number,
--         ROUND(AVG(weekly_sales),0) AS avg_sales
--     FROM fact_weekly_sales_costco
--     GROUP BY MONTH(week_date)
-- ) sales
-- JOIN (
--     SELECT MONTH(week_date) AS month_number,
--         ROUND(AVG(week_temperature),2) AS avg_temp,
--         ROUND(AVG(week_fuel_price),2) AS avg_fuel_price
--     FROM fact_weekly_features_costco
--     GROUP BY MONTH(week_date)
-- ) temp_fuel
-- ON sales.month_number = temp_fuel.month_number
-- ORDER BY sales.month_number;