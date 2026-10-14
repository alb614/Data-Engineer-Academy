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

/* Viewing table customers */

-- SELECT *
-- FROM customers
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    customer_id,
    customer_name AS FullName,
    TRIM(' ' FROM address) AS TrimmedAddress,
    city
    
FROM customers;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     customer_id,
--     customer_name AS FullName,
--     TRIM(TRAILING' ' FROM address) AS TrimmedAddress,
--     City

-- FROM
--     customers;