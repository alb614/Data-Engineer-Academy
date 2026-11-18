/* Brainstorming section */

-- 1st way to do it:

-- Join the given tables (since we need names and amounts found on each table).

-- Group the joined table by customerid (or customer_id) since this is a unique identifier
-- (key).  [Some may use the customer name].

-- Calculate the average order amount per customer within each customer group.

-- To filter out the customer with the highest average order amount: order the table by
-- average order amounts in descending order and use a limit of 1 to select the top
-- average order amount.

-- Display the customer name and average order amount for the top average order amount.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT
--      c.name,
--      AVG(o.amount) AS avg_amount
-- FROM customers_prc c
-- JOIN orders_prc o ON c.customerid = o.customer_id
-- GROUP BY c.customerid
-- ORDER BY avg_amount DESC
-- LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

-- SELECT
--      c.name,
--      AVG(o.amount) AS avg_amount
-- FROM customers_prc c
-- JOIN orders_prc o ON c.customerid = o.customer_id
-- GROUP BY c.customerid
-- HAVING avg_amount = 
-- (
--     SELECT MAX(avg_amount) AS max_avg_amount
--     FROM
--     (
--         SELECT
--             AVG(o.amount) AS avg_amount
--         FROM customers_prc c
--         JOIN orders_prc o ON c.customerid = o.customer_id
--         GROUP BY c.customerid
--     ) AS AvgAmount
-- );

/*----------------------------------------------------------------------------------------------*/

-- WITH stage1 AS
-- (
--     SELECT
--         c.customerid,
--         c.name,
--         AVG(o.amount) AS avg_amount
--     FROM customers_prc c
--     JOIN orders_prc o ON c.customerid = o.customer_id
--     GROUP BY c.customerid 
-- )
-- SELECT
--     name,
--     avg_amount
-- FROM stage1
-- WHERE avg_amount =
-- (
--     SELECT
--         MAX(avg_amount) AS max_avg_amount
--     FROM stage1
-- );

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table customers_prc */

-- SELECT *
-- FROM customers_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution: */

SELECT
     c.name,
     AVG(o.amount) AS avg_amount
FROM customers_prc c
JOIN orders_prc o ON c.customerid = o.customer_id
GROUP BY c.customerid
ORDER BY avg_amount DESC
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT c.name, AVG(o.amount) AS AvgOrderAmount
-- FROM customers_prc c
-- JOIN orders_prc o ON c.customerid = o.customer_id
-- GROUP BY c.name
-- ORDER BY AvgOrderAmount DESC
-- LIMIT 1;