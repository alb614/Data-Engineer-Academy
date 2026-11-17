/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- * Break down listing into 8 similar groups based on the reservation time 
-- and only for the year 2022 and after.

-- Remember this is just sample data, 
-- your output should be a generic way to achieve 
-- which can be scaled to 10 or 12 or can be size down 
-- to 4 or 6 any number by changing at a place. 

-- Columns to Display: reservation_id, listing_id, reservation_time, reservation_groups

-- SELECT

--     reservation_id,
--     listing_id, 
--     reservation_time,
--     NTILE(8) OVER(ORDER BY reservation_time) AS reservation_groups
    
-- FROM dim_bookings_airbnb
-- JOIN dim_listings_airbnb
-- USING(listing_id)
-- WHERE YEAR(reservation_time) >= 2022;

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

SELECT

    reservation_id,
    listing_id, 
    reservation_time,
    NTILE(8) OVER(ORDER BY reservation_time) AS reservation_groups
    
FROM dim_bookings_airbnb
JOIN dim_listings_airbnb
USING(listing_id)
WHERE YEAR(reservation_time) >= 2022;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT *, 
-- NTILE(8) OVER (ORDER BY reservation_time) AS reservation_groups
-- FROM dim_bookings_airbnb
-- WHERE year(reservation_time) >= 2022;