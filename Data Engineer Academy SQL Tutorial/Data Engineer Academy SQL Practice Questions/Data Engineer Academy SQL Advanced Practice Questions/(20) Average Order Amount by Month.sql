/* Brainstorming section */

-- Select all the row containing orders with order year 2022.

-- Of the rows selected, group the rows by the order months.

-- Calculate the average order amount per month group.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH stage1 AS
--      SELECT *
--      FROM orders_prc
--      WHERE YEAR(order_date) = 2022
-- stage2 AS
--      SELECT
--          order_id,
--          customer_id,
--          MONTH(order_date) AS order_month,
--          amount
--      FROM stage1
-- stage3 AS
--      SELECT
--          AVG(amount) AS avg_order_amount
--      FROM stage2
--      GROUP BY order_month
-- SELECT *
-- FROM stage3;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc;
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution #1: */

SELECT DATE_FORMAT(order_date, '%Y-%m') AS order_month, AVG(amount) AS avg_monthly_amount
FROM orders_prc
WHERE EXTRACT(YEAR FROM order_date) = 2022
GROUP BY order_month;

/*----------------------------------------------------------------------------------------------*/

/* My solution #2: */

-- WITH stage1 AS
-- (
--      SELECT *
--      FROM orders_prc
--      WHERE YEAR(order_date) = 2022
-- ),
-- stage2 AS
-- (
--      SELECT
--          order_id,
--          customer_id,
--          order_date,
--          MONTH(order_date) AS order_month,
--          amount
--      FROM stage1
-- ),
-- stage3 AS
-- (
--      SELECT
--          DATE_FORMAT(order_date, '%Y-%m') AS month,
--          AVG(amount) AS avg_order_amount
--      FROM stage2
--      GROUP BY order_month
-- )
-- SELECT *
-- FROM stage3;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT DATE_FORMAT(order_date, '%Y-%m') AS Month, AVG(amount) AS AvgOrderAmount
-- FROM orders_prc
-- WHERE YEAR(order_date) = 2022
-- GROUP BY Month;