/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the most used payment method for each brand.
-- Columns to Display: brand, payment_method

-- WITH CTE AS
-- (
-- SELECT 
--     brand, 
--     payment_method,
--     COUNT(*) AS num_times_method_used,
--     RANK() OVER(PARTITION BY brand ORDER BY COUNT(*) DESC) AS payment_method_rank
-- FROM dim_brands_tesla
-- JOIN fact_sales_tesla
-- USING(brand)
-- GROUP BY brand, payment_method
-- ORDER BY brand
-- )
-- SELECT
--     brand,
--     payment_method
-- FROM CTE
-- WHERE payment_method_rank = 1;

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

/* My solution #1 */

WITH ranked_payment_method_count AS
(
    SELECT 
    
        brand, 
        payment_method,
        COUNT(*) AS num_times_method_used,
        RANK() OVER(PARTITION BY brand ORDER BY COUNT(*) DESC) AS payment_method_rank
    
    FROM dim_brands_tesla
    JOIN fact_sales_tesla
    USING(brand)
    GROUP BY brand, payment_method
    ORDER BY brand
)
SELECT

    brand,
    payment_method

FROM ranked_payment_method_count
WHERE payment_method_rank = 1;

/*----------------------------------------------------------------------------------------------*/

/* My solution #2 */

-- WITH ranked_payment_method_count AS
-- (
--     SELECT 
    
--         dbt.brand, 
--         payment_method,
--         COUNT(*) AS num_times_method_used,
--         RANK() OVER(PARTITION BY dbt.brand ORDER BY COUNT(*) DESC) AS payment_method_rank
    
--     FROM dim_brands_tesla AS dbt, fact_sales_tesla AS fst
--     WHERE dbt.brand = fst.brand
--     GROUP BY dbt.brand, payment_method
--     ORDER BY dbt.brand
-- )
-- SELECT

--     brand,
--     payment_method

-- FROM ranked_payment_method_count
-- WHERE payment_method_rank = 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- select brand, payment_method from 
-- (
-- select brand, count(payment_method) as cnt,
-- payment_method,
-- row_number () over (partition by brand order by count(payment_method) desc) as row_num
-- from 
-- fact_sales_tesla
-- group by brand, payment_method) a
-- where row_num = 1;