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

/* Viewing table customers_prc */

-- SELECT *
-- FROM customers_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

/* I decided to go straight through the query here since I already learned how to approach
this type of query. */

SELECT

    name,
    AVG(amount) AS average_order_amount
    
FROM customers_prc AS c
JOIN orders_prc AS o
ON c.customerid = o.customer_id
GROUP BY name;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT c.name, AVG(o.amount) AS AvgOrderAmount
-- FROM customers_prc c
-- JOIN orders_prc o ON c.customerid = o.customer_id
-- GROUP BY c.name;