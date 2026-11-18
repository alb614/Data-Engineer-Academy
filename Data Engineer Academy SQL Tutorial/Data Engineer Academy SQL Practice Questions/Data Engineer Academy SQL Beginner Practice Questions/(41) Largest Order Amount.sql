/* Brainstorming section */

-- Select the maximum order amount and the date of that order.

-- Display results.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Solution #1:

-- SELECT amount, order date
-- FROM orders_prc
-- ORDER BY amount DESC
-- limit to 1 row;

-- Solution #2:

-- SELECT amount, order_date
-- FROM orders_prc
-- WHERE amount = (SELECT MAX(amount) FROM orders_prc);

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution #1 */

SELECT 

    amount AS largest_amount, 
    order_date

FROM orders_prc
ORDER BY amount DESC
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* My solution #2 */

-- SELECT 

--      amount AS largest_amount, 
--      order_date

-- FROM orders_prc
-- WHERE amount = (SELECT MAX(amount) FROM orders_prc);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     amount AS LargestOrderAmount, 
--     order_date AS OrderDate
-- FROM orders_prc
-- WHERE amount = (SELECT max(amount) FROM orders_prc);