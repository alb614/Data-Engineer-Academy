/* Brainstorming section */

-- Filter out the orders placed in the year 2022.

-- Group the table by month.

-- Count the number of order per month.

-- Display results.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, COUNT(order_id) AS num_orders
-- FROM orders_prc
-- WHERE EXTRACT(YEAR FROM order_date) = 2022
-- GROUP BY EXTRACT(MONTH FROM order_date);

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

/* My solution */

SELECT 

    DATE_FORMAT(order_date, '%Y-%m') AS month, 
    COUNT(order_id) AS num_orders

FROM orders_prc
WHERE EXTRACT(YEAR FROM order_date) = 2022
GROUP BY EXTRACT(MONTH FROM order_date);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT DATE_FORMAT(order_date, '%Y-%m') AS Month, COUNT(*) AS NumberOfOrders
-- FROM orders_prc
-- WHERE YEAR(order_date) = 2022
-- GROUP BY Month;