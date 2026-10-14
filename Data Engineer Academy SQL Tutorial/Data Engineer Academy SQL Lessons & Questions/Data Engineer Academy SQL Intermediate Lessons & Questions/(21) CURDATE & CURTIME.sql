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

/* Viewing table customers */

-- SELECT *
-- FROM customers
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- SELECT

--     order_id,
--     order_status,
--     order_amount,
--     c.customer_id,
--     customer_name,
--     -- CURDATE() AS ReportDate,  -- gives the current date with an alias
--     -- CURTIME() AS ReportTime,  -- gives the current time with an alias
--     -- NOW() AS ReportGeneratedAt -- gives the current date and time with an alias
    
-- FROM orders AS o OUTER JOIN customers AS c
-- ON o.customer_id = c.customer_id;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

(
    SELECT
    
    	o.order_id,
    	o.order_status,
    	o.order_amount,
    	c.customer_id,
    	c.customer_name,
    -- 	CURDATE() AS ReportDate,
    -- 	CURTIME() AS ReportTime,
    -- 	NOW() AS ReportGeneratedAt
    
    FROM orders AS o
    LEFT JOIN customers AS c
    ON c.customer_id = o.customer_id 
    WHERE NOT o.order_status IS NULL
)

UNION

(
    SELECT
    
    	o.order_id,
    	o.order_status,
    	o.order_amount,
    	c.customer_id,
    	c.customer_name,
    -- 	CURDATE() AS ReportDate,
    -- 	CURTIME() AS ReportTime,
    -- 	NOW() AS ReportGeneratedAt
    
    FROM orders AS o
    RIGHT JOIN customers AS c
    ON c.customer_id = o.customer_id 
    WHERE NOT o.order_status IS NULL
);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     o.order_id,
--     o.order_status,
--     o.order_amount,
--     c.customer_id,
--     c.customer_name,
--     -- CURDATE() AS ReportDate,
--     -- CURTIME() AS ReportTime,
--     -- NOW() AS ReportGeneratedAt
-- FROM orders o
-- JOIN customers c
--     ON o.customer_id = c.customer_id;