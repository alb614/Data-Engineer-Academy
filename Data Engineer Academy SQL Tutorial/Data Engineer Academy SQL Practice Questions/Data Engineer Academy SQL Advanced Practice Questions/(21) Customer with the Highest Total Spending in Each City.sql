/* Brainstorming section */

-- Determine the customer with the highest total spending in each city 

-- city, name, SUM(amount) AS total_amount_spent
-- GROUP BY city

-- and provide the customer's name and the total spending.

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

/* My solution #1 */

WITH total_spent AS
(
    SELECT
    
        city, 
        name, 
        SUM(amount) AS total_amount_spent
        
    FROM orders_prc o
    LEFT JOIN customers_prc c
    ON o.customer_id = c.customerid
    GROUP BY city, o.customer_id
),
rank_by_total_spent AS
(
    SELECT
    
      *,
      RANK() OVER(PARTITION BY city ORDER BY total_amount_spent DESC) AS rnk
       
    FROM total_spent
)
SELECT

    city,
    name,
    total_amount_spent
    
FROM rank_by_total_spent
WHERE rnk = 1
ORDER BY name

/*----------------------------------------------------------------------------------------------*/

/* My solution #2 */

-- SELECT

--     city,
--     name,
--     total_amount_spent
    
-- FROM 
-- (

--     SELECT
    
--       *,
--       RANK() OVER(PARTITION BY city ORDER BY total_amount_spent DESC) AS rnk
       
--     FROM 
--     (
    
--         SELECT
    
--         city, 
--         name, 
--         SUM(amount) AS total_amount_spent
        
--         FROM orders_prc o
--         LEFT JOIN customers_prc c
--         ON o.customer_id = c.customerid
--         GROUP BY city, o.customer_id
    
--     ) AS total_spent

-- ) AS rank_by_total_spent
-- WHERE rnk = 1
-- ORDER BY name

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 

--     city, 
--     name, 
--     SUM(amount) AS TotalSpending

-- FROM customers_prc c
-- JOIN orders_prc o 
-- ON c.customerid = o.customer_id
-- GROUP BY city, name
-- HAVING TotalSpending = 
--     (
--         SELECT MAX(TotalSpending) 
--         FROM 
--             (
--                 SELECT 
--                     city, 
--                     name, 
--                     SUM(amount) AS TotalSpending 
--                 FROM customers_prc c
--                 JOIN orders_prc o 
--                 ON c.customerid = o.customer_id 
--                 GROUP BY city, name
--             ) AS Subquery 
--         WHERE Subquery.city = c.city
--     );