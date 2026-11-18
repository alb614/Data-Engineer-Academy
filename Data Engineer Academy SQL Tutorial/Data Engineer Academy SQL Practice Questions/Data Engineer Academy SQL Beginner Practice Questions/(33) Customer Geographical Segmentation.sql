/* Brainstorming section */

-- Create a customer categorization column (called it "Category") with three options: 
-- East Coast, West Coast and Midwest.

-- If the customers are from New York, Boston, or Philadelphia, set category to "East Coast".

-- If the customers are from Los Angeles, San Francisco or Seattle, set category to "West Coast".

-- Else, set category to "Midwest".

-- Return/display the new column data.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT
--      customerid,
--      name,
-- CASE
-- WHEN city = 'New York' THEN 'East Coast'
-- WHEN city = 'Boston' THEN 'East Coast'
-- WHEN city = 'Philadelphia' THEN 'East Coast'
-- WHEN city = 'Los Angeles' THEN 'West Coast'
-- WHEN city = 'San Francisco' THEN 'West Coast'
-- WHEN city = 'Seattle' THEN 'West Coast'
-- ELSE 'Midwest'
-- END AS category
-- FROM customers_prc;
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

/* My solution */

-- Note: I listed out every case when I could just as easily used the IN clause to create a
-- list of values that the city column could take on and assign the categories based on 
-- whether city takes on any given value in the list specified by the IN clause (See 
-- 'Show Solution' for details).

SELECT

     customerid,
     name,
    CASE
    WHEN city = 'New York' THEN 'East Coast'
    WHEN city = 'Boston' THEN 'East Coast'
    WHEN city = 'Philadelphia' THEN 'East Coast'
    WHEN city = 'Los Angeles' THEN 'West Coast'
    WHEN city = 'San Francisco' THEN 'West Coast'
    WHEN city = 'Seattle' THEN 'West Coast'
    ELSE 'Midwest'
    END AS category
    
FROM customers_prc;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT customerid, name,
--       CASE
--           WHEN City IN ('New York', 'Boston', 'Philadelphia') THEN 'East Coast'
--           WHEN City IN ('Los Angeles', 'San Francisco', 'Seattle') THEN 'West Coast'
--           ELSE 'Midwest'
--       END AS Region
-- FROM customers_prc;