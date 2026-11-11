/* Brainstorming section */

-- Calculate the Year over Year(Y-O-Y) increase 
-- in the Total Unique Products ordered for Italy and Japan.
-- Columns to Display: 
-- country
-- (Year on Year) their respective Percent increase in Total Unique Products Ordered from 2010 to 2011

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH year_over_year AS
-- (
--     SELECT
--         country,
--         year,
--         num_products,
--         LAG(num_products, 1) OVER(PARTITION BY country ORDER BY year) AS prev_num_products
--     FROM
--     (
--         SELECT
--             country,
--             YEAR(invoice_date) AS year,
--             COUNT(DISTINCT stock_code) AS num_products
--         FROM dim_customer_salesforce AS dcs
--         JOIN fact_daily_invoices_salesforce AS fdis
--         ON dcs.customer_id = fdis.customer_id
--         WHERE country IN ("Italy", "Japan")
--             AND YEAR(invoice_date) IN ('2010', '2011')
--         GROUP BY country, year
--         ORDER BY country, year
--     ) AS sub
-- )
-- SELECT
--     country,
--     CONCAT(CAST(ROUND(100 * (num_products - prev_num_products) / prev_num_products, 0) AS CHAR), "%") AS Year_over_Year_Increase
-- FROM year_over_year
-- WHERE prev_num_products IS NOT NULL;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_customer_salesforce */

-- SELECT *
-- FROM dim_customer_salesforce
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_stock_description_salesforce */

-- SELECT *
-- FROM dim_stock_description_salesforce
-- ORDER BY stock_code
-- LIMIT 50;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_daily_invoices_salesforce */

-- SELECT *
-- FROM fact_daily_invoices_salesforce
-- ORDER BY invoice_number
-- LIMIT 50;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH year_over_year AS
(
    SELECT
        country,
        year,
        num_products,
        LAG(num_products, 1) OVER(PARTITION BY country ORDER BY year) AS prev_num_products
    FROM
    (
        SELECT
            country,
            YEAR(invoice_date) AS year,
            COUNT(DISTINCT stock_code) AS num_products
        FROM dim_customer_salesforce AS dcs
        JOIN fact_daily_invoices_salesforce AS fdis
        ON dcs.customer_id = fdis.customer_id
        WHERE country IN ("Italy", "Japan")
            AND YEAR(invoice_date) IN ('2010', '2011')
        GROUP BY country, year
        ORDER BY country, year
    ) AS sub
)
SELECT
    country,
    CONCAT(CAST(ROUND(100 * (num_products - prev_num_products) / prev_num_products, 0) AS CHAR), "%") AS Year_over_Year_Increase
FROM year_over_year
WHERE prev_num_products IS NOT NULL;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     country, 
--     CONCAT(ROUND((Orders_2011 - Orders_2010)*100/Orders_2010), '%') AS Year_over_Year_Increase
-- FROM
-- (
--     SELECT 
--         country,
--         SUM(CASE WHEN Invoice_year = 2010 THEN Total_orders ELSE 0 END) AS Orders_2010,
--         SUM(CASE WHEN Invoice_year = 2011 THEN Total_orders ELSE 0 END) AS Orders_2011
--     FROM
--     (
--         SELECT 
--             country,
--             YEAR(invoice_date) AS Invoice_year,
--             COUNT(DISTINCT stock_code) AS Total_orders
--         FROM fact_daily_invoices_salesforce
--         JOIN dim_customer_salesforce
--         ON fact_daily_invoices_salesforce.customer_id = dim_customer_salesforce.customer_id
--         WHERE country IN ('Italy', 'Japan')
--         GROUP BY country,YEAR(invoice_date)
--     ) order_total
--     GROUP BY country
-- ) percent_increase;