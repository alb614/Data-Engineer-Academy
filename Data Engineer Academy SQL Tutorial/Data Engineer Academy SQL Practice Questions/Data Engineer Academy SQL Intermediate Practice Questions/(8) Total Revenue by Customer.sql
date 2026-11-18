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

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table customers_prc */

-- SELECT *
-- FROM customers_prc
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

# Calculate the total revenue
# for each customer.

SELECT

    c.name,
    SUM(o.amount) AS total_revenue

FROM customers_prc c
JOIN orders_prc o
ON c.customerid = o.customer_id
GROUP BY c.customerid;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT c.name, SUM(o.amount) AS TotalRevenue
-- FROM customers_prc c
-- JOIN orders_prc o ON c.customerid = o.customer_id
-- GROUP BY c.name;