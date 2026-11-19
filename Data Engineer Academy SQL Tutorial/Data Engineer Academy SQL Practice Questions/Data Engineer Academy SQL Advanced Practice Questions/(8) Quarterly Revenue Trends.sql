/* Brainstorming section */

-- Analyze the quarterly revenue trends for 2022 & 2023.
-- Provide the total revenue for each quarter.
-- Revenue means the sum of the order amounts.
-- Calculate the revenue for every group of 3 months.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Retrieve the year, the month, and the quarterly revenue
-- Find SUM(amount) to find the revenue
-- Partition the table by quarter


/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH quarter_p1 AS
(
    SELECT
    
        order_id,
        CASE
            WHEN EXTRACT(MONTH FROM order_date) BETWEEN 1 AND 3 THEN CONCAT(EXTRACT(YEAR FROM order_date), 'Q1')
            WHEN EXTRACT(MONTH FROM order_date) BETWEEN 4 AND 6 THEN CONCAT(EXTRACT(YEAR FROM order_date), 'Q2')
            WHEN EXTRACT(MONTH FROM order_date) BETWEEN 7 AND 9 THEN CONCAT(EXTRACT(YEAR FROM order_date), 'Q3')
            WHEN EXTRACT(MONTH FROM order_date) BETWEEN 10 AND 12 THEN CONCAT(EXTRACT(YEAR FROM order_date), 'Q4')
        END AS order_quarter 
    
    FROM orders_prc
),
quarter_p2 AS
(
    SELECT

        EXTRACT(YEAR FROM order_date) AS order_year,
        q.order_quarter,
        SUM(amount) OVER(PARTITION BY q.order_quarter ORDER BY q.order_quarter) AS total_revenue
    
    FROM orders_prc o
    JOIN quarter_p1 q
    USING(order_id)
)
SELECT

    order_quarter,
    total_revenue

FROM quarter_p2
WHERE order_year > 2021
GROUP BY order_year, order_quarter;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     CONCAT(YEAR(order_date), 'Q', QUARTER(order_date)) AS Quarter,
--     SUM(amount) AS TotalRevenue
-- FROM orders_prc
-- WHERE YEAR(order_date) IN (2022,2023)
-- GROUP BY Quarter;