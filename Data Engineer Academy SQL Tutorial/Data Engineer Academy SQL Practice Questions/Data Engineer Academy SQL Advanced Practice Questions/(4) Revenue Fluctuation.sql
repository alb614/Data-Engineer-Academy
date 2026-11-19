/* Brainstorming section */

-- Need to get only the customers who placed orders.
-- Calculate the difference between their highest and lowest order amounts.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Get MAX(order amount) and MIN(order amount) for each customer that placed an order
-- Find MAX(order amount)-MIN(order amount) to get the revenue fluctuation
-- Select the customer (that placed orders) with the MAX(revenue fluctuation)

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

WITH revenue_fluctuation AS
(
    SELECT

        c.name,
        MAX(o.amount)-MIN(o.amount) AS RevenueFluctuation

    FROM customers_prc AS c
    JOIN orders_prc AS o
    ON c.customerid = o.customer_id
    GROUP BY c.customerid
)
SELECT

    name,
    RevenueFluctuation
    
FROM revenue_fluctuation
WHERE RevenueFluctuation = 
    (
        SELECT
        
            MAX(RevenueFluctuation)
        
        FROM revenue_fluctuation
    );
    
/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT c.name, MAX(o.amount) - MIN(o.amount) AS RevenueFluctuation
-- FROM customers_prc c
-- JOIN orders_prc o ON c.customerid = o.customer_id
-- GROUP BY c.name
-- ORDER BY RevenueFluctuation DESC
-- LIMIT 1;