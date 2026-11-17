/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- List Department-wise average sales in 2021. Round to nearest whole number

-- Columns to Display: dept_name, avg_sales

-- SELECT dept_name, ROUND(AVG(weekly_sales), 0) AS avg_sales
-- FROM fact_weekly_sales_costco JOIN dim_departments_costco USING(dept_id)
-- WHERE YEAR(week_date) = 2021
-- GROUP BY dept_id;

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

/* My solution */

SELECT 

    dept_name, 
    ROUND(AVG(weekly_sales), 0) AS avg_sales
    
FROM fact_weekly_sales_costco 
JOIN dim_departments_costco 
USING(dept_id)
WHERE YEAR(week_date) = 2021
GROUP BY dept_id;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT  dept_name,
--     ROUND(AVG(weekly_sales),0) AS avg_sales
-- FROM fact_weekly_sales_costco sale
-- JOIN dim_departments_costco dept
-- ON sale.dept_id = dept.dept_id
-- WHERE year(week_date) = 2021
-- GROUP BY dept_name
-- ORDER BY avg_sales DESC;