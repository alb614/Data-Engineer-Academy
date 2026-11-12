/* Brainstorming section */

-- List Total quantities ordered 
-- and Total Sales recorded 
-- by Top 10 oldest customers of the company. 

-- Columns to Display:  
-- Customer Name, 
-- Rank in terms of how long they are a customer with company, 
-- Total Quantities ordered 
-- and Total Sales recorded by them.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH customer_info AS
-- (
--     SELECT
--         dcw.customer_id,
--         customer_name,
--         customer_since,
--         MAX(transaction_date) AS last_order,
--         SUM(quantity_sold) AS total_quantities,
--         ROUND(SUM(quantity_sold * unit_price), 2) AS total_sales
--     FROM dim_customers_walmart AS dcw
--     JOIN fact_daily_transactions_walmart AS fdtw
--     USING(customer_id)
--     GROUP BY dcw.customer_id
-- ),
-- customer_rank AS
-- (
--     SELECT
--         customer_id,
--         customer_name,
--         total_quantities,
--         total_sales,
--         DENSE_RANK() OVER(ORDER BY DATEDIFF(NOW(), customer_since) DESC) AS cust_rnk
--     FROM customer_info
-- )
-- SELECT
--     customer_name,
--     cust_rnk,
--     total_quantities,
--     total_sales
-- FROM customer_rank
-- WHERE cust_rnk <= 10;

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

WITH customer_info AS
(
    SELECT
        dcw.customer_id,
        customer_name,
        customer_since,
        MAX(transaction_date) AS last_order,
        SUM(quantity_sold) AS total_quantities,
        ROUND(SUM(quantity_sold * unit_price), 2) AS total_sales
    FROM dim_customers_walmart AS dcw
    JOIN fact_daily_transactions_walmart AS fdtw
    USING(customer_id)
    GROUP BY dcw.customer_id
),
customer_rank AS
(
    SELECT
        customer_id,
        customer_name,
        total_quantities,
        total_sales,
        DENSE_RANK() OVER(ORDER BY DATEDIFF(NOW(), customer_since) DESC) AS cust_rnk
    FROM customer_info
)
SELECT
    customer_name,
    cust_rnk,
    total_quantities,
    total_sales
FROM customer_rank
WHERE cust_rnk <= 10;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution #1 */

-- WITH Ranked_Customers AS (
--     -- Step 1: Calculate Customer Rank (Time since first joined)
--     SELECT
--         customer_id,
--         customer_name,
--         customer_since,
--         -- Use DENSE_RANK to assign a rank based on the oldest 'customer_since' date.
--         DENSE_RANK() OVER (ORDER BY customer_since ASC) AS customer_rank
--     FROM
--         dim_customers_walmart
-- ),
-- Top_10_Oldest AS (
--     -- Step 2: Filter for the Top 10 Oldest Customers
--     SELECT
--         customer_id,
--         customer_name,
--         customer_rank AS `Rank customer with company`
--     FROM
--         Ranked_Customers
--     WHERE
--         customer_rank <= 10
-- ),
-- Customer_Metrics AS (
--     -- Step 3: Calculate Total Quantities Ordered and Total Sales (rounded to 2 decimal places)
--     SELECT
--         customer_id,
--         SUM(quantity_sold) AS `Total Quantities ordered`,
--         -- Total Sales = SUM(quantity_sold * unit_price)
--         -- Use ROUND() to ensure the total sales is formatted to 2 decimal places
--         ROUND(SUM(quantity_sold * unit_price), 2) AS `Total Sales recorded`
--     FROM
--         fact_daily_transactions_walmart
--     GROUP BY
--         customer_id
-- )
-- -- Step 4: Join the Top 10 Customers with their calculated Metrics
-- SELECT
--     T1.customer_name AS `Customer Name`,
--     T1.`Rank customer with company`,
--     COALESCE(T2.`Total Quantities ordered`, 0) AS `Total Quantities ordered`,
--     COALESCE(T2.`Total Sales recorded`, 0.00) AS `Total Sales recorded` -- COALESCE uses 0.00 for consistency
-- FROM
--     Top_10_Oldest T1
-- LEFT JOIN
--     Customer_Metrics T2 ON T1.customer_id = T2.customer_id
-- ORDER BY
--     T1.`Rank customer with company` ASC;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution #2 */

-- SELECT
--     customer_name,
--     oldest_customer,
--     SUM(txn.quantity_sold) AS total_quantities,
--     ROUND(SUM(txn.quantity_sold*txn.unit_price), 2) AS total_sales
-- FROM
-- (
--     SELECT DISTINCT
--         customer_name,
--         customer_id,
--         DENSE_RANK() OVER(ORDER BY customer_since) AS oldest_customer
--     FROM dim_customers_walmart
-- ) cust
-- JOIN fact_daily_transactions_walmart txn
-- ON txn.customer_id = cust.customer_id
-- WHERE oldest_customer <= 10
-- GROUP BY cust.customer_id, customer_name
-- ORDER BY oldest_customer;