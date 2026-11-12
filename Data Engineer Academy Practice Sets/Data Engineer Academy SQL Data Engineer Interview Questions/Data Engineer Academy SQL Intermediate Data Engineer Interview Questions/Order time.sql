/* Brainstorming section */

-- Taking 45 mins as the threshold for delivery since the Order time 
-- after which an order is classified 'LATE', 
-- list the Percent of Orders that were Late with respect to each type of Road traffic.

-- Columns to Display: 
-- road_traffic, percent_orders_late

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH delivery_status_labeling AS
-- (
--     SELECT
--         road_traffic,
--         CASE
--             WHEN TIMESTAMPDIFF(MINUTE, order_time, order_picked_time) + delivery_duration > 45 THEN "LATE"
--             ELSE "ON TIME"
--         END AS delivery_status
--     FROM fact_orders_grubhub
--     ORDER BY road_traffic
-- ),
-- num_late_and_total_orders_per_traffic_condition AS
-- (
--     SELECT
--         road_traffic,
--         SUM(CASE WHEN delivery_status = "LATE" THEN 1 ELSE 0 END) AS num_late_orders,
--         COUNT(*) AS total_orders
--     FROM delivery_status_labeling
--     GROUP BY road_traffic
-- )
-- SELECT
--     road_traffic,
--     100 * num_late_orders / total_orders AS percent_orders_late
-- FROM num_late_and_total_orders_per_traffic_condition;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_delivery_person_grubhub */

-- SELECT *
-- FROM dim_delivery_person_grubhub
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_restaurants_grubhub */

-- SELECT *
-- FROM dim_restaurants_grubhub
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_orders_grubhub */

-- SELECT *
-- FROM fact_orders_grubhub
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH delivery_status_labeling AS
(
    SELECT
        road_traffic,
        CASE
            WHEN TIMESTAMPDIFF(MINUTE, order_time, order_picked_time) + delivery_duration > 45 THEN "LATE"
            ELSE "ON TIME"
        END AS delivery_status
    FROM fact_orders_grubhub
    ORDER BY road_traffic
),
num_late_and_total_orders_per_traffic_condition AS
(
    SELECT
        road_traffic,
        SUM(CASE WHEN delivery_status = "LATE" THEN 1 ELSE 0 END) AS num_late_orders,
        COUNT(*) AS total_orders
    FROM delivery_status_labeling
    GROUP BY road_traffic
)
SELECT
    road_traffic,
    100 * num_late_orders / total_orders AS percent_orders_late
FROM num_late_and_total_orders_per_traffic_condition
ORDER BY percent_orders_late DESC;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- -- This query calculates the percentage of orders classified as 'LATE'
-- -- by measuring the TOTAL fulfillment time (Restaurant Wait Time + Delivery Duration)
-- -- against a 45-minute threshold, grouped by road traffic.

-- WITH OrderTotalTime AS (
--     SELECT
--         road_traffic,
--         order_id,
--         -- Calculate the total time from Order Time to Delivery Completion.
--         -- Assumes TIMESTAMPDIFF(MINUTE, ...) for the wait time calculation.
--         (TIMESTAMPDIFF(MINUTE, order_time, order_picked_time) + delivery_duration) AS total_delivery_time
--     FROM
--         fact_orders_grubhub
--     -- Ensure road_traffic is not NULL for grouping
--     WHERE
--         road_traffic IS NOT NULL
-- )
-- SELECT
--     road_traffic,
--     -- Calculate the percentage of late orders: (Total Late Orders / Total Orders) * 100
--     ROUND(
--         (SUM(CASE WHEN total_delivery_time > 45 THEN 1 ELSE 0 END) * 100.0) / COUNT(order_id),
--         4 -- Rounding to 4 decimal places for precision
--     ) AS percent_orders_late
-- FROM
--     OrderTotalTime
-- GROUP BY
--     road_traffic
-- ORDER BY
--     percent_orders_late DESC;