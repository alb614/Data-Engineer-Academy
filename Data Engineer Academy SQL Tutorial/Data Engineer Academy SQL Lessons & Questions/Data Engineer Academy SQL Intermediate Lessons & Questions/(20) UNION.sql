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

/* Viewing table invoices */

-- SELECT *
-- FROM invoices
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    customer_id,
    order_date AS transaction_date,
    order_amount AS transaction_amount
    
FROM orders
UNION
SELECT

    customer_id,
    invoice_date AS transaction_date,
    total_amount AS transaction_amount
    
FROM invoices;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     customer_id,
--     order_date AS transaction_date,
--     order_amount AS transaction_amount
-- FROM orders
-- UNION
-- SELECT
--     customer_id,
--     invoice_date AS transaction_date,
--     total_amount AS transaction_amount
-- FROM invoices;