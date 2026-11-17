/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- For each category, 
-- find the month-on-month growth rate of every month in 2022. 
-- The m-o-m growth rate is the growth of the revenue of sold products in the current month 
-- compared to the previous month.

-- Note:  Please use 'N/A' in place of month of growth % when it is Null and Inf for Zero(0).

-- Columns to Display: product_category, current_month and mom_growth

-- WITH monthly_rev_by_product AS
-- (
-- SELECT

--     product_category,
--     DATE_FORMAT(obtention_day, '%Y-%m') AS current_month,
--     SUM(price) AS current_monthly_revenue

-- FROM fact_contracts_microsoft fcm
-- JOIN dim_products_microsoft dpm
-- ON fcm.product_id = dpm.product_id
-- WHERE YEAR(obtention_day) = 2022
-- GROUP BY product_category, MONTH(obtention_day)
-- ),
-- prev_and_curr_rev AS
-- (
-- SELECT

--     product_category,
--     current_month,
--     LAG(current_monthly_revenue, 1) OVER(PARTITION BY product_category ORDER BY current_month) AS previous_monthly_revenue,
--     current_monthly_revenue

-- FROM monthly_rev_by_product
-- )
-- SELECT

--     product_category,
--     current_month,
--     CASE
--         WHEN ROUND(100 * (current_monthly_revenue - previous_monthly_revenue) / previous_monthly_revenue, 2) IS NULL THEN 'N/A'
--         ELSE CONCAT(ROUND(100 * (current_monthly_revenue - previous_monthly_revenue) / previous_monthly_revenue, 2), '%')
--     END AS mom_growth


-- FROM prev_and_curr_rev
-- ORDER BY product_category, current_month;

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

/* My solution #1: Without 'Inf' case statement */

-- WITH monthly_rev_by_product AS
-- (
--     SELECT
    
--         product_category,
--         DATE_FORMAT(obtention_day, '%Y-%m') AS current_month,
--         SUM(price) AS current_monthly_revenue
    
--     FROM fact_contracts_microsoft fcm
--     JOIN dim_products_microsoft dpm
--     ON fcm.product_id = dpm.product_id
--     WHERE YEAR(obtention_day) = 2022
--     GROUP BY product_category, MONTH(obtention_day)
-- ),
-- prev_and_curr_rev AS
-- (
--     SELECT
    
--         product_category,
--         current_month,
--         LAG(current_monthly_revenue, 1) OVER(PARTITION BY product_category ORDER BY current_month) AS previous_monthly_revenue,
--         current_monthly_revenue
    
--     FROM monthly_rev_by_product
-- )
-- SELECT

--     product_category,
--     current_month,
--     CASE
--         WHEN previous_monthly_revenue IS NULL THEN 'N/A'
--         ELSE CONCAT(ROUND(100 * (current_monthly_revenue - previous_monthly_revenue) / previous_monthly_revenue, 2), '%')
--     END AS mom_growth

-- FROM prev_and_curr_rev
-- ORDER BY product_category, current_month;

/*----------------------------------------------------------------------------------------------*/

/* My solution #2: With 'Inf' case statement */

WITH monthly_rev_by_product AS
(
    SELECT
    
        product_category,
        DATE_FORMAT(obtention_day, '%Y-%m') AS current_month,
        SUM(price) AS current_monthly_revenue
    
    FROM fact_contracts_microsoft fcm
    JOIN dim_products_microsoft dpm
    ON fcm.product_id = dpm.product_id
    WHERE YEAR(obtention_day) = 2022
    GROUP BY product_category, MONTH(obtention_day)
),
prev_and_curr_rev AS
(
    SELECT
    
        product_category,
        current_month,
        LAG(current_monthly_revenue, 1) OVER(PARTITION BY product_category ORDER BY current_month) AS previous_monthly_revenue,
        current_monthly_revenue
    
    FROM monthly_rev_by_product
)
SELECT

    product_category,
    current_month,
    CASE
        WHEN previous_monthly_revenue IS NULL THEN 'N/A'
        WHEN previous_monthly_revenue = 0 THEN 'Inf'
        ELSE CONCAT(ROUND(100 * (current_monthly_revenue - previous_monthly_revenue) / previous_monthly_revenue, 2), '%')
    END AS mom_growth

FROM prev_and_curr_rev
ORDER BY product_category, current_month;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- -- Calculate Month-over-Month (M-o-M) Revenue Growth Rate for each Product Category in 2022

-- -- 1. Calculate the monthly revenue per product category (CTE: MonthlyRevenue)
-- WITH MonthlyRevenue AS (
--     SELECT
--         T2.Product_category,
--         -- IMPORTANT: Extracts the year and month (YYYY-MM) for proper chronological grouping and ordering.
--         -- Using DATE_FORMAT (common in MySQL)
--         DATE_FORMAT(T1.Obtention_day, '%Y-%m') AS current_month,
--         -- Sum the price for the revenue
--         SUM(T2.Price) AS Current_Month_Revenue
--     FROM
--         fact_contracts_microsoft AS T1
--     JOIN
--         dim_products_microsoft AS T2 ON T1.Product_ID = T2.Product_ID
--     WHERE
--         -- MANDATORY: Filter data explicitly for the year 2022.
--         DATE_FORMAT(T1.Obtention_day, '%Y') = '2022'
--     GROUP BY
--         T2.Product_category,
--         current_month
-- ),

-- -- 2. Calculate the previous month's revenue (CTE: MoMCalculation)
-- MoMCalculation AS (
--     SELECT
--         Product_category,
--         current_month,
--         Current_Month_Revenue,
--         -- Use the LAG window function to get the revenue from the previous row
--         -- partitioned by category and ordered by the full year-month string.
--         LAG(Current_Month_Revenue, 1, NULL) OVER (
--             PARTITION BY Product_category
--             ORDER BY current_month
--         ) AS Previous_Month_Revenue
--     FROM
--         MonthlyRevenue
-- )

-- -- 3. Final selection and calculation of the M-o-M growth rate
-- SELECT
--     Product_category,
--     current_month,
--     -- Calculate Growth Rate: (Current - Previous) / Previous
--     -- Replaced PRINTF with standard SQL functions (ROUND, CONCAT) to bypass the permission error.
--     CASE
--         WHEN Previous_Month_Revenue IS NULL THEN 'N/A' -- First month of the year/category
--         WHEN Previous_Month_Revenue = 0 THEN 'Inf' -- Growth from zero revenue
--         ELSE 
--             CONCAT(
--                 ROUND(
--                     ((Current_Month_Revenue - Previous_Month_Revenue) * 100.0) / Previous_Month_Revenue,
--                     2
--                 ),
--                 '%'
--             )
--     END AS mom_growth
-- FROM
--     MoMCalculation
-- ORDER BY
--     Product_category,
--     current_month;