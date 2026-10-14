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

/* My solution */

SELECT
    CONCAT('$', CAST(SUM(order_amount) AS CHAR)) AS total_amount_string
FROM orders
WHERE order_status = 'Completed';

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     CONCAT('$', CAST(SUM(order_amount) AS CHAR)) AS total_amount_string
-- FROM 
--     orders
-- WHERE
--     order_status = 'Completed';