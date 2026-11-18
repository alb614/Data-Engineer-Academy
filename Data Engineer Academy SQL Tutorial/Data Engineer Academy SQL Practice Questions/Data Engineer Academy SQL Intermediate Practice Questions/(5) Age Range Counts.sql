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

/* Implementation #1 */

-- SELECT

--     CASE
--     WHEN age < 30 THEN COUNT(age)
--     END AS under_30,
    
--     CASE
--     WHEN age >= 30 AND age < 40 THEN COUNT(age)
--     END AS between_30_and_40,
    
--     CASE
--     WHEN age > 40 THEN COUNT(age)
--     END AS over_40
        
-- FROM customers_prc;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #2 */

-- SELECT

--     -- (
--     --     SELECT
--     --         COUNT(age)
--     --     FROM customers_prc
--     --     WHERE age < 30
--     -- )
--     -- CASE
--     -- WHEN age < 30 THEN (SELECT COUNT(age) FROM customers_prc WHERE age < 30)
--     -- END AS under_30 LIMIT 1,
    
--     CASE
--     WHEN age > 30 AND age < 40 THEN (SELECT COUNT(age) FROM customers_prc WHERE age > 30 AND age < 40)
--     END AS between_30_and_40
    
-- FROM customers_prc
-- LIMIT 2;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #3 */

-- SELECT
--     between_30_and_40
-- FROM (SELECT customerid, COUNT(age) AS between_30_and_40 FROM customers_prc WHERE age > 30 AND age < 40) AS t2;

-- SELECT
--     COUNT(t1.age) AS under_30
-- FROM customers_prc AS t1 JOIN customers_prc t2 ON(t1.customerid) JOIN customers_prc t3 ON(t2.customerid)
-- WHERE t1.age < 30;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    below_30,
    bet_30_and_40,
    over_40
    
FROM
    (SELECT

        customerid,
        COUNT(age) AS below_30
    
    FROM customers_prc
    WHERE age < 30) AS a

    JOIN

    (SELECT

        customerid,
        COUNT(age) AS bet_30_and_40
    
    FROM customers_prc
    WHERE age >= 30 AND age <= 40) AS b

    ON a.customerid = a.customerid
    
    JOIN

    (SELECT

        customerid,
        COUNT(age) AS over_40
    
    FROM customers_prc
    WHERE age >= 40) AS c
    
    ON a.customerid = a.customerid;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     SUM(CASE WHEN age < 30 THEN 1 ELSE 0 END) AS Under30,
--     SUM(CASE WHEN age >= 30 AND age <= 40 THEN 1 ELSE 0 END) AS Between30And40,
--     SUM(CASE WHEN age > 40 THEN 1 ELSE 0 END) AS Over40
-- FROM customers_prc;