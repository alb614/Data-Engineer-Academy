/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders */

-- SELECT *
-- FROM orders
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution #1 */

/* This is my version of the query */

-- SELECT

--     order_id,
--     order_date,
--     order_amount,
--     customer_id,
--     LAG(order_date, 1, NULL) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_order_date,
--     LAG(order_date, 1, 0) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_total_amount
    
-- FROM orders;

/*----------------------------------------------------------------------------------------------*/

/* My solution #2 */

/* I wrote this query to reflect the order of the columns that the expected output portrayed */

-- SELECT

--     order_id,
--     order_date,
--     order_amount,
--     LAG(order_date, 1, NULL) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_order_date,
--     LAG(order_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_total_amount,
--     customer_id
    
-- FROM orders;

/*----------------------------------------------------------------------------------------------*/

/* My solution #3 */

SELECT

	order_id,
	order_date,
	order_amount,
	LAG(order_date, 1) OVER(PARTITION BY customer_id ORDER BY order_date) AS previous_order_date,
	LAG(order_amount, 1) OVER(PARTITION BY customer_id ORDER BY order_date) AS previous_total_amount
    
FROM orders;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     order_id,
--     order_date,
--     order_amount,
--     LAG(order_date) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_order_date,
--     LAG(order_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS previous_total_amount,
--     customer_id
-- FROM
--     orders;