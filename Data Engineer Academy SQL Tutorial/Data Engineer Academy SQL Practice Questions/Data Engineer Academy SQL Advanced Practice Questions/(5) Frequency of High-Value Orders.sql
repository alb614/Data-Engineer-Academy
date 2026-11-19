/* Brainstorming section */

-- Find the number of orders
-- with an amount greater than $100 for each customer

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- COUNT orders
-- for customers that placed orders | JOIN
-- WHERE amount > 100
-- for each customer | GROUP BY

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table customers_prc */

-- SELECT *
-- FROM customers_prc;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    c.name,
    COUNT(o.order_id) AS order_count
    
FROM customers_prc c
JOIN orders_prc o
ON c.customerid = o.customer_id
WHERE o.amount > 100
GROUP BY c.name;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT c.name, COUNT(*) AS HighValueOrders
-- FROM customers_prc c
-- JOIN orders_prc o ON c.customerid = o.customer_id
-- WHERE o.amount > 100
-- GROUP BY c.name;