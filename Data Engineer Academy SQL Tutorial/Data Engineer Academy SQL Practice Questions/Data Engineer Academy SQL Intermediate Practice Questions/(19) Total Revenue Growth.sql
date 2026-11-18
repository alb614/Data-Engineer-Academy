/* Brainstorming section */

-- Filter the table by the year 2023 and the months between and including April to May.

-- Group the table by month.

-- Calculate the total revenue (sum of the order amounts) per month.

-- Return the query results.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH stage1 AS
-- (
--     SELECT

--         DATE_FORMAT(order_date, '%Y-%m') AS order_month,
--         SUM(amount) AS total_revenue

--     FROM orders_prc
--     WHERE EXTRACT(YEAR FROM order_date) = 2023
--           AND EXTRACT(MONTH FROM order_date) BETWEEN 3 AND 6
--     GROUP BY order_month
-- ),
-- stage2 AS
-- (
--     SELECT *,

--         COALESCE(LAG(total_revenue) OVER (ORDER BY order_month), 0) AS previous_total_revenue
    
--     FROM stage1
-- )
-- SELECT

--     total_revenue - previous_total_revenue AS total_revenue_growth
    
-- FROM stage2
-- WHERE previous_total_revenue > 0;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution: */

WITH stage1 AS
(
    SELECT

        DATE_FORMAT(order_date, '%Y-%m') AS order_month,
        SUM(amount) AS total_revenue

    FROM orders_prc
    WHERE EXTRACT(YEAR FROM order_date) = 2023
          AND EXTRACT(MONTH FROM order_date) BETWEEN 3 AND 6
    GROUP BY order_month
),
stage2 AS
(
    SELECT *,

        COALESCE(LAG(total_revenue) OVER (ORDER BY order_month), 0) AS previous_total_revenue
    
    FROM stage1
)
SELECT

    total_revenue - previous_total_revenue AS total_revenue_growth
    
FROM stage2
WHERE previous_total_revenue > 0;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     (SELECT SUM(amount) 
--      FROM orders_prc 
--      WHERE DATE_FORMAT(order_date, '%Y-%m') = '2023-05') - (SELECT SUM(amount) 
--                                                             FROM orders_prc 
--                                                             WHERE DATE_FORMAT(order_date, '%Y-%m') = '2023-04') AS RevenueGrowth;