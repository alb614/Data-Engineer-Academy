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
    YEAR(order_date) AS order_year,
    AVG(order_amount) AS AverageOrderAmount
FROM 
    orders
GROUP BY 
    order_year
ORDER BY
    order_year ASC;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT YEAR(order_date) AS order_year, AVG(order_amount) AS AverageOrderAmount
-- FROM orders
-- GROUP BY order_year
-- ORDER BY order_year;