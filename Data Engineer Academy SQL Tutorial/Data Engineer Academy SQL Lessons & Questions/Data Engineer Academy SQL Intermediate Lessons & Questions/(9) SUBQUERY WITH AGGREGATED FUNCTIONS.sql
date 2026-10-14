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

-- SELECT customer_name 
-- FROM customers AS c
-- WHERE c.customer_id IN 
--     (SELECT o.customer_id 
--      FROM orders AS o 
--      GROUP BY o.customer_id
--      HAVING SUM(order_amount) > (SELECT AVG(order_amount) 
--                                      FROM orders));
                                     
/*-------------------------------------------------------------------------------------------*/

/* My solution #2 */

-- SELECT 
    
--     customer_name
    
-- FROM customers AS c
-- JOIN orders AS o
-- ON c.customer_id = o.customer_id
-- GROUP BY c.customer_id
-- HAVING SUM(order_amount) >  
--     (
--         SELECT
        
--             AVG(order_amount)
            
--         FROM orders
--     );
    
/*-------------------------------------------------------------------------------------------*/

/* My solution #3 */

-- SELECT

--     s.customer_name
    
-- FROM
-- (
--     SELECT  
    
--         customer_name,
--         SUM(order_amount) AS total_amount
        
--     FROM customers
--     JOIN orders
--     USING(customer_id)
--     GROUP BY customer_name
-- ) AS s
-- WHERE s.total_amount > 
-- (
--     SELECT
    
--         AVG(order_amount)
        
--     FROM orders
-- );

/*-------------------------------------------------------------------------------------------*/

/* My solution #4 */

/* This is a 4th solution that doesn't use joining.  It makes use of the customer_id key that 
appears as a foreign key in the orders table.*/

SELECT

	customer_name

FROM
(
	SELECT
		c.customer_id,
		c.customer_name
	FROM customers c
	WHERE
	(
		SELECT
		
			SUM(order_amount) AS sum_order_amount

		FROM orders o
		WHERE c.customer_id = o.customer_id
	) > 
	(
		SELECT

			AVG(order_amount) AS avg_order_amount

		FROM orders
	)
) AS stage2;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--   customer_name
-- FROM 
--     customers 
-- WHERE 
--     customer_id IN (SELECT 
--                         customer_id
--                     FROM 
--                         orders
--                     GROUP BY 
--                         customer_id
--                     HAVING SUM(order_amount) > (SELECT 
--                                                     AVG(order_amount)
--                                                 FROM 
--                                                     orders)
--                     );