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

/* Viewing table customers */

-- SELECT *
-- FROM customers
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders */

-- SELECT *
-- FROM orders
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution #1 */

-- SELECT

--     c.customer_id,
--     c.customer_name,
--     SUM(o.order_amount) AS total_order_amount,
--     RANK() OVER (ORDER BY SUM(o.order_amount) DESC) AS 'rank'
    
-- FROM customers c
-- JOIN orders o
-- ON c.customer_id = o.customer_id
-- GROUP BY customer_name;

/*-------------------------------------------------------------------------------------------*/

/* ChatGPT assisted solution */

/* This particular query was one that was written with the aid of ChatGPT */

-- WITH totals AS
-- (
--     SELECT

--         c.customer_id,
--         c.customer_name,
--         SUM(o.order_amount) AS total_order_amount
    
--     FROM customers c
--     JOIN orders o
--     ON c.customer_id = o.customer_id
--     GROUP BY c.customer_id, c.customer_name
-- )
-- SELECT

--     customer_id,
--     customer_name,
--     total_order_amount,
--     RANK() OVER (ORDER BY total_order_amount DESC) AS rnk
    
-- FROM totals;

/*-------------------------------------------------------------------------------------------*/

/* My solution #2 */

WITH totalOrderAmt AS
(
	SELECT

		c.customer_id,
		c.customer_name,
		SUM(o.order_amount) AS total_order_amount

	FROM customers AS c
	JOIN orders AS o
	ON c.customer_id = o.customer_id
	GROUP BY c.customer_id
),
rankByOrderAmt AS
(

	SELECT
	
		*,
		RANK() OVER(ORDER BY total_order_amount DESC) AS rnk

	FROM totalOrderAmt

)
SELECT *
FROM rankByOrderAmt;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH amt as
-- (
-- SELECT
--     c.customer_id as customer_id,
--     c.customer_name as customer_name,
--     sum(o.order_amount) as order_amount
-- FROM 
--     orders o
-- INNER JOIN
--     customers c
-- ON
--     o.customer_id = c.customer_id
-- GROUP BY
--     1
-- )
-- SELECT
--     customer_id,
--     customer_name,
--     order_amount,
--     RANK() OVER(ORDER BY order_amount desc) AS 'rank'
-- FROM
--     amt;