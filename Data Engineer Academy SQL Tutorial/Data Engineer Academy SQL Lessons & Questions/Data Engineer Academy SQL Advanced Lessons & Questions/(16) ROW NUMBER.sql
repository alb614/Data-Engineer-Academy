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

    ROW_NUMBER() OVER (ORDER BY order_amount DESC) AS row_num,
    order_id,
    customer_id,
    order_date,
    order_amount
    
FROM orders
LIMIT 3;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     ROW_NUMBER() OVER (ORDER BY order_amount DESC) AS row_num,
--     order_id,
--     customer_id,
--     order_date,
--     order_amount
-- FROM
--     orders
-- ORDER BY
--     order_amount DESC
-- LIMIT 3;