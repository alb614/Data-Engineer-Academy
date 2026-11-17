/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- List the locations in Descending order of the Highest Sales recorded. 

-- Columns to display: location_city, total_sales

-- SELECT
--     location_city,
--     SUM(quantity_sold * unit_price) AS total_sales
-- FROM dim_location_walmart
-- JOIN fact_daily_transactions_walmart
-- USING(location_id)
-- GROUP BY location_city
-- ORDER BY total_sales DESC;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_customers_walmart */

-- SELECT *
-- FROM dim_customers_walmart
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_location_walmart */

-- SELECT *
-- FROM dim_location_walmart
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_products_walmart */

-- SELECT *
-- FROM dim_products_walmart
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_daily_transactions_walmart */

-- SELECT *
-- FROM fact_daily_transactions_walmart
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT
    location_city,
    SUM(quantity_sold * unit_price) AS total_sales
FROM dim_location_walmart
JOIN fact_daily_transactions_walmart
USING(location_id)
GROUP BY location_city
ORDER BY total_sales DESC;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT  location_city,
-- 		SUM(quantity_sold*unit_price) AS total_sales
-- FROM fact_daily_transactions_walmart txn
-- JOIN dim_location_walmart loc 
--   ON txn.location_id = loc.location_id
-- GROUP BY location_city
-- ORDER BY total_sales DESC;