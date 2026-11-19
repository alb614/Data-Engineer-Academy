/* Brainstorming section */

-- Calculate number of orders on weekends.
-- Retrieve the day of the week from the order date.
-- Use the day of the week to create a condition where only the orders with days of the 
-- week that are weekends are included.
-- Display the number of orders on weekends.
-- Display the total number of orders.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- COUNT orders when day of week is either Sat or Sun
-- COUNT all orders

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM order_prc;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- SELECT

--     DATE_FORMAT(order_date, '%W')
    
-- FROM
--     orders_prc;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH weekend_order_data AS
(
    SELECT
    
        order_id,
        COUNT(order_id) AS num_weekend_orders
        
    FROM
        orders_prc
    WHERE
        DATE_FORMAT(order_date, '%W') IN ('Saturday', 'Sunday')
), all_order_data AS
(
    SELECT

        order_id,
        COUNT(order_id) AS total_num_orders
    
    FROM
        orders_prc
)
SELECT
    
    num_weekend_orders,
    total_num_orders
    
FROM weekend_order_data
JOIN all_order_data
USING(order_id);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     SUM(CASE WHEN DAYOFWEEK(order_date) IN (1, 7) THEN 1 ELSE 0 END) AS WeekendOrders,
--     COUNT(*) AS TotalOrders
-- FROM orders_prc;