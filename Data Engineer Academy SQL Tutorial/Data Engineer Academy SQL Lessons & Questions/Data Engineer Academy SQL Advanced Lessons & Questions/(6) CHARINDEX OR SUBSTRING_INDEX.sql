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

/* Implementation #1 */

/* The following query uses the LOCATE function as a substitute for CHARINDEX (since 
CHARINDEX doesn't exist in MySQL. */

-- SELECT

--     customer_name,
--     SUBSTRING(email, LOCATE('@', email) + 1, LENGTH(email)) AS EmailDomain
    
-- FROM customers;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

/* The following query is an alternative to using the LOCATE function (CHARINDEX function
in SQL Server).  It makes use of the SUBSTRING_INDEX function to retrieve a substring that
starts at the index of '@' and goes to the last char of the string located at the index -1. */

SELECT

    customer_name,
    SUBSTRING_INDEX(email, '@', -1) AS EmailDomain
    
FROM customers;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     customer_name,
--     SUBSTRING_INDEX(email, '@', -1) AS EmailDomain
-- FROM
--     customers;