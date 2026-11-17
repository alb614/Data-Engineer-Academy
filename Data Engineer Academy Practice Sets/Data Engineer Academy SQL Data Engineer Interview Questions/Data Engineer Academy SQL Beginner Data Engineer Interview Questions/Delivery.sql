/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- List the average Age and Rating of Delivery person 
-- operating in each City type.

-- Columns to Display: City Type, Average Age and Average Rating

-- SELECT  
--     city_type,
--     ROUND(AVG(delivery_person_age), 2) AS average_age,
--     ROUND(AVG(delivery_person_ratings), 2) AS average_rating
-- FROM dim_delivery_person_grubhub
-- JOIN fact_orders_grubhub
-- USING(delivery_person_ID)
-- GROUP BY city_type;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_delivery_person_grubhub */

-- SELECT *
-- FROM dim_delivery_person_grubhub
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_restaurants_grubhub */

-- SELECT *
-- FROM dim_restaurants_grubhub
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_orders_grubhub */

-- SELECT *
-- FROM fact_orders_grubhub
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT  
    city_type,
    ROUND(AVG(delivery_person_age), 2) AS average_age,
    ROUND(AVG(delivery_person_ratings), 2) AS average_rating
FROM dim_delivery_person_grubhub
JOIN fact_orders_grubhub
USING(delivery_person_ID)
GROUP BY city_type;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT  city_type,
-- 		ROUND(AVG(Delivery_person_Age),2) AS avg_age,
-- 		ROUND(AVG(Delivery_person_Ratings),2) AS avg_rating
-- FROM fact_orders_grubhub fact
-- JOIN dim_delivery_person_grubhub del
--   ON fact.Delivery_person_ID = del.Delivery_person_ID
-- GROUP BY city_type;