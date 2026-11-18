/* Brainstorming section */

-- Filter out all the orders for the year 2022.

-- Group by the month.

-- Calculate the sum of all the order amounts for each month.

-- Display the query result.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month, SUM(amount) AS total_revenue
-- FROM orders_prc
-- WHERE EXTRACT(YEAR FROM order_date) = 2022
-- GROUP BY EXTRACT(MONTH FROM order_date)
-- ORDER BY total_revenue DESC
-- LIMIT 1;

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

/* My solution #1: */

SELECT 

     DATE_FORMAT(order_date, '%Y-%m') AS order_month, 
     SUM(amount) AS total_revenue

FROM orders_prc
WHERE EXTRACT(YEAR FROM order_date) = 2022
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY total_revenue DESC
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* My solution #2: */

-- SELECT 

--      DATE_FORMAT(order_date, '%Y-%m') AS order_month, 
--      SUM(amount) AS total_revenue

-- FROM orders_prc
-- WHERE EXTRACT(YEAR FROM order_date) = 2022
-- GROUP BY EXTRACT(MONTH FROM order_date)
-- HAVING total_revenue = 
-- (
--     SELECT MAX(total_revenue) AS max_total_revenue
--     FROM 
--     (
--         SELECT SUM(amount) AS total_revenue
--         FROM orders_prc
--         WHERE EXTRACT(YEAR FROM order_date) = 2022
--         GROUP BY EXTRACT(MONTH FROM order_date)
--     ) AS TotalRevenueByMonth
-- );

/*----------------------------------------------------------------------------------------------*/

/* My solution #3: */

-- WITH stage1 AS
-- (
--     SELECT 

--         DATE_FORMAT(order_date, '%Y-%m') AS order_month, 
--         SUM(amount) AS total_revenue

--     FROM orders_prc
--     WHERE EXTRACT(YEAR FROM order_date) = 2022
--     GROUP BY EXTRACT(MONTH FROM order_date)
-- )
-- SELECT *
-- FROM stage1
-- WHERE total_revenue =
-- (
--     SELECT MAX(total_revenue)
--     FROM stage1
-- );

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT DATE_FORMAT(order_date, '%Y-%m') AS Month, SUM(amount) AS TotalRevenue
-- FROM orders_prc
-- WHERE YEAR(order_date) = 2022
-- GROUP BY Month
-- ORDER BY TotalRevenue DESC
-- LIMIT 1;