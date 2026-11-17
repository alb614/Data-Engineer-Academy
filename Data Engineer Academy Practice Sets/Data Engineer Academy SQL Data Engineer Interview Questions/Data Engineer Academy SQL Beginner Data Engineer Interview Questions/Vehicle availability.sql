/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Users login details are available in dim_vehicleLoginDetails_uber tables,  
-- 1 indicates vehicles is available to book and vice-versa. 
-- Can you let us know how many vehicles were available to book before 2022 started?

-- Column to display: how many vehicles were available to book

-- SELECT
--     COUNT(DISTINCT vehicle_id) AS vehicle_count
-- FROM dim_vehicleLoginDetails_uber
-- WHERE is_vehicle_available = 1
--     AND YEAR(login_time) < 2022;

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

SELECT

    COUNT(DISTINCT vehicle_id) AS vehicle_count
    
FROM dim_vehicleLoginDetails_uber
WHERE is_vehicle_available = 1
    AND YEAR(login_time) < 2022;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution #1 */

-- SELECT 
-- COUNT(DISTINCT vehicle_id)
-- FROM dim_vehicleLoginDetails_uber
-- WHERE year(login_time) < 2022
-- AND is_vehicle_available = 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution #2 */

-- WITH available_vehicles (
-- 	SELECT
-- 		vehicle_id
-- 		, is_vehicle_available
-- 		, login_time
-- 	FROM
-- 		dim_vehicleLoginDetails_uber
-- 	WHERE
-- 		YEAR(login_time) < 2022
-- 	AND
-- 		is_vehicle_available = 1
-- )
-- SELECT COUNT(DISTINCT vehicle_id)
-- FROM available_vehicles;