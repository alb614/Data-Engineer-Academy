/* Brainstorming section */

--

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Which driver added the highest number of cars 
-- in 2022 as compared to 2021?

-- Output should be name, years onboarding, net_gain. 


-- WITH number_of_cars_2021 AS
-- (
-- SELECT

--     ddu.driver_id,
--     ddu.name,
--     COALESCE(COUNT(dvu.vehicle_id), 0) AS onboarded_2021

-- FROM dim_Drivers_uber AS ddu
-- LEFT JOIN (SELECT * FROM dim_vehicles_uber WHERE EXTRACT(YEAR FROM onboarded_time) = 2021) AS dvu
-- ON ddu.driver_id = dvu.driver_id
-- GROUP BY ddu.driver_id
-- ),
-- number_of_cars_2022 AS
-- (
-- SELECT

--     ddu.driver_id,
--     ddu.name,
--     COALESCE(COUNT(dvu.vehicle_id), 0) AS onboarded_2022

-- FROM dim_Drivers_uber AS ddu
-- LEFT JOIN (SELECT * FROM dim_vehicles_uber WHERE EXTRACT(YEAR FROM onboarded_time) = 2022) AS dvu
-- ON ddu.driver_id = dvu.driver_id
-- GROUP BY ddu.driver_id
-- )
-- SELECT
--     n2021.name,
--     onboarded_2021,
--     onboarded_2022,
--     onboarded_2022 - onboarded_2021 AS net_gain
-- FROM number_of_cars_2021 AS n2021
-- JOIN number_of_cars_2022 AS n2022
-- USING(driver_id)
-- ORDER BY net_gain DESC
-- LIMIT 1;


-- SELECT name, driver_id
-- FROM dim_Drivers_uber
-- WHERE name = 'Taylor Timothy'

-- SELECT driver_id, vehicle_id, onboarded_time
-- FROM dim_vehicles_uber
-- WHERE driver_id = '99615f'


/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_Drivers_uber */

-- SELECT *
-- FROM dim_Drivers_uber
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_vehicleLoginDetails_uber */

-- SELECT *
-- FROM dim_vehicleLoginDetails_uber
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_vehicles_uber */

-- SELECT *
-- FROM dim_vehicles_uber
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH number_of_cars_2021 AS
(
    SELECT
    
        ddu.driver_id,
        ddu.name,
        COALESCE(COUNT(dvu.vehicle_id), 0) AS onboarded_2021
    
    FROM dim_Drivers_uber AS ddu
    LEFT JOIN (SELECT * FROM dim_vehicles_uber WHERE EXTRACT(YEAR FROM onboarded_time) = 2021) AS dvu
    ON ddu.driver_id = dvu.driver_id
    GROUP BY ddu.driver_id
),
number_of_cars_2022 AS
(
    SELECT
    
        ddu.driver_id,
        ddu.name,
        COALESCE(COUNT(dvu.vehicle_id), 0) AS onboarded_2022
    
    FROM dim_Drivers_uber AS ddu
    LEFT JOIN (SELECT * FROM dim_vehicles_uber WHERE EXTRACT(YEAR FROM onboarded_time) = 2022) AS dvu
    ON ddu.driver_id = dvu.driver_id
    GROUP BY ddu.driver_id
)
SELECT

    n2021.name,
    onboarded_2021,
    onboarded_2022,
    onboarded_2022 - onboarded_2021 AS net_gain
    
FROM number_of_cars_2021 AS n2021
JOIN number_of_cars_2022 AS n2022
USING(driver_id)
ORDER BY net_gain DESC
LIMIT 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH cte AS (
--   SELECT name,
--     COUNT(CASE WHEN YEAR(onboarded_time) = 2021 THEN vehicle_id END) AS onboarded_2021,
--     COUNT(CASE WHEN YEAR(onboarded_time) = 2022 THEN vehicle_id END) AS onboarded_2022
--   FROM dim_Drivers_uber dd
--   LEFT JOIN dim_vehicles_uber dv ON dv.driver_id = dd.driver_id
--   GROUP BY 1
--   ORDER BY 3 DESC
-- )
-- SELECT *, onboarded_2022 - onboarded_2021 AS net_gain
-- FROM cte
-- ORDER BY 4 DESC
-- LIMIT 1;