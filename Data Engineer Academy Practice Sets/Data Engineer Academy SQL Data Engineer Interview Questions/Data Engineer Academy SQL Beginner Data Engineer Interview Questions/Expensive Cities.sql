/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- A city is considered too expensive 
-- if its average price per sqft is higher 
-- than 1.25 times the overall average price per sqft 
-- of all cities. 

-- AVG(price/sqft) of given city AS avg_per_city> 
-- 1.25 * AVG(price/sqft) of all cities AS total_avg


-- Describe each city by one 
-- of the statuses: ‘Too expensive’ or ‘Not expensive’

-- SELECT
-- CASE
-- WHEN avg_per_city > total_avg THEN 'Too expensive'
-- ELSE 'Not expensive'
-- END AS status
-- FROM some_table

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_agreements_zillow */

-- SELECT *
-- FROM fact_agreements_zillow
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_real_estate_companies_zillow */

-- SELECT *
-- FROM dim_real_estate_companies_zillow
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    city,
    
    CASE
    WHEN avg_per_city > total_avg THEN 'Too expensive'
    ELSE 'Not expensive'
    END AS stat
    
FROM
(

    SELECT
    
        f1.city,
        
        AVG(price/sqft) AS avg_per_city,
        
        1.25 * (
            SELECT
                AVG(price/sqft)
            FROM fact_agreements_zillow AS f2
        ) AS total_avg
        
    FROM fact_agreements_zillow AS f1 
    GROUP BY f1.city

) AS averages;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- select city,
-- CASE
-- WHEN average > 1.25*(select  avg(price/sqft)
-- from fact_agreements_zillow) THEN "Too expensive"
-- ELSE "Not expensive"
-- END as status
-- FROM
-- (select city, avg(price/sqft) as average
-- from fact_agreements_zillow
-- group by city) as cityaverage;