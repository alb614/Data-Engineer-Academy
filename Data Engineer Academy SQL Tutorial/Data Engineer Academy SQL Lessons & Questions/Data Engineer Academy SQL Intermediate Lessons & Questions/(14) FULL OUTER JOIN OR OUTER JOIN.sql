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

/* Implementation #1 */

-- SELECT

-- c.customer_id,
-- c.customer_name,
-- o.order_id,
-- o.order_date,
-- o.order_amount

-- FROM customers c JOIN orders o
-- ON c.customer_id = o.customer_id;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

	c.customer_id,
	c.customer_name,
	o.order_id,
	o.order_date,
	o.order_amount

FROM 
(
    customers AS c
    LEFT JOIN orders AS o
    ON c.customer_id = o.customer_id
)

UNION

(
    customers AS c
    RIGHT JOIN orders AS o
    ON c.customer_id = o.customer_id
);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     customers.customer_id,
--     customers.customer_name,
--     orders.order_id,
--     orders.order_date,
--     orders.order_amount
-- FROM
--     customers customers
-- LEFT JOIN
--     orders orders
-- ON
--     orders.customer_id = customers.customer_id;