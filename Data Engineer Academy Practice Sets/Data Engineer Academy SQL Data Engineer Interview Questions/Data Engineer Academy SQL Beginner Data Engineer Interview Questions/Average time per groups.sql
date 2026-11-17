/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Write a query which outputs the average time taken in days from listing created 
-- to second booking for three groups of countries. Round them at 3 decimals. 

-- Group 1 countries should have 'land' as characted in their name, such as England. 
-- Group 2 should have countries ending with letter 'a' 
-- Group 3 should be the 'Other' countries

-- Using the above criteria, create a flag with the column named country_type 
-- and the values being 'Land Countries', 'Ending A Countries', or 'Other countries'

-- Columns to Display: country_type, avg_days_taken

-- WITH CTE AS
-- (
-- SELECT
--     CASE
--         WHEN country LIKE '%land%' THEN 'Land Countries'
--         WHEN country LIKE '%a' THEN 'Ending A Countries'
--         ELSE 'Other'
--     END country_type,
--     listing_id,
--     listing_created_at,
--     reservation_time,
--     RANK() OVER(PARTITION BY listing_id ORDER BY reservation_time) AS rnk
-- FROM dim_bookings_airbnb
-- JOIN dim_listings_airbnb
-- USING(listing_id)
-- GROUP BY country_type, listing_id
-- ORDER BY country_type
-- )
-- SELECT
-- *
-- FROM CTE;

/*----------------------------------------------------------------------------------------------*/

-- WITH CTE AS
-- (
-- SELECT
--     country,
--     listing_id,
--     listing_created_at,
--     reservation_time,
--     RANK() OVER(PARTITION BY country, listing_id ORDER BY reservation_time) AS rnk
-- FROM dim_bookings_airbnb
-- JOIN dim_listings_airbnb
-- USING(listing_id)
-- ),
-- CTE2 AS
-- (
-- SELECT 
--     country,
--     listing_id,
--     listing_created_at,
--     reservation_time,
--     rnk,
--     DATEDIFF(reservation_time, listing_created_at) AS days_taken
-- FROM CTE
-- WHERE rnk = 2
-- )
-- SELECT
--     CASE
--         WHEN country LIKE '%land%' THEN 'Land Countries'
--         WHEN country LIKE '%a' THEN 'Ending A Countries'
--         ELSE 'Other countries'
--     END country_type,
--     ROUND(AVG(days_taken), 3) AS avg_days_taken
-- FROM CTE2
-- GROUP BY country_type
-- ORDER BY country_type;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_bookings_airbnb */

-- SELECT *
-- FROM dim_bookings_airbnb
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_listings_airbnb */

-- SELECT *
-- FROM dim_listings_airbnb
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH ranked_listings_by_country AS
(
    SELECT
        country,
        listing_id,
        listing_created_at,
        reservation_time,
        RANK() OVER(PARTITION BY country, listing_id ORDER BY reservation_time) AS rnk
    FROM dim_bookings_airbnb
    JOIN dim_listings_airbnb
    USING(listing_id)
),
days_from_listing_created_to_second_booking AS
(
    SELECT 
        country,
        listing_created_at,
        reservation_time,
        DATEDIFF(reservation_time, listing_created_at) AS days_taken
    FROM ranked_listings_by_country
    WHERE rnk = 2
)
SELECT

    CASE
        WHEN country LIKE '%land%' THEN 'Land Countries'
        WHEN country LIKE '%a' THEN 'Ending A Countries'
        ELSE 'Other countries'
    END country_type,
    ROUND(AVG(days_taken), 3) AS avg_days_taken

FROM days_from_listing_created_to_second_booking
GROUP BY country_type
ORDER BY country_type;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH cte AS (
--   SELECT *, ROW_NUMBER() OVER (PARTITION BY listing_id ORDER BY reservation_time) AS reservation_number
--   FROM dim_bookings_airbnb
-- ), second_reservation AS (
--   SELECT dl.*, db.reservation_time
--   FROM dim_listings_airbnb dl
--   JOIN cte db ON dl.listing_id = db.listing_id AND reservation_number = 2
-- )
-- SELECT
--   CASE
--     WHEN LOWER(country) LIKE '%land%' THEN 'Land Countries'
--     WHEN UPPER(country) LIKE '%a' THEN 'Ending A Countries'
--     ELSE 'Other countries'
--   END AS country_type,
--   ROUND(AVG(DATEDIFF(reservation_time, listing_created_at)),3) AS avg_days_taken
-- FROM second_reservation
-- GROUP BY 1
-- ORDER BY 1;