/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Which users didn't participated in hackathon from 2021 onwards? 

-- Columns to display: participants_name

-- SELECT 
--     participants_name,
--     SUM(CASE WHEN YEAR(participation_time) >= 2021 THEN 1 ELSE 0 END) AS onward_part_count
-- FROM dim_hackathonUsers_google dhg
-- LEFT JOIN dim_participation_google dpg
-- USING(participant_id)
-- GROUP BY participant_id
-- HAVING onward_part_count = 0;

/*----------------------------------------------------------------------------------------------*/

-- SELECT 
--     participants_name,
--     participation_time,
--     SUM(CASE WHEN participation_time IS NOT NULL AND YEAR(participation_time) >= 2021 THEN 1 ELSE 0 END) AS onward_part_count
-- FROM dim_hackathonUsers_google dhg
-- LEFT JOIN dim_participation_google dpg
-- USING(participant_id)
-- GROUP BY participants_name
-- HAVING onward_part_count = 0;

/*----------------------------------------------------------------------------------------------*/

-- WITH adjusted_dhg AS
-- (
-- SELECT 
--     participant_id,
--     participants_name
-- FROM dim_hackathonUsers_google
-- GROUP BY participants_name
-- ),
-- onward_count AS
-- (
-- SELECT
--     participant_id,
--     participants_name,
--     participation_time
-- FROM adjusted_dhg
-- LEFT JOIN dim_participation_google
-- USING(participant_id)
-- GROUP BY participants_name

-- UNION

-- SELECT
--     participant_id,
--     participants_name,
--     participation_time
-- FROM adjusted_dhg
-- RIGHT JOIN dim_participation_google
-- USING(participant_id)
-- GROUP BY participants_name
-- )
-- SELECT *
-- FROM onward_count;

-- WHERE participants_name LIKE 'Arv%'
-- SUM(CASE WHEN YEAR(participation_time) >= 2021 THEN 1 ELSE 0 END) OVER(PARTITION BY participant_id) AS onward_part_count

/*----------------------------------------------------------------------------------------------*/

-- WITH table_combo AS
-- (
-- SELECT
--     participant_id,
--     participants_name,
--     participation_time,
--     user_created_at
-- FROM dim_participation_google
-- RIGHT JOIN dim_hackathonUsers_google
-- USING(participant_id)
-- ),
-- onward_count AS
-- (
-- SELECT
--     participant_id,
--     participants_name,
--     participation_time,
--     user_created_at,
--     SUM(CASE WHEN participation_time IS NOT NULL AND YEAR(participation_time) >= 2021 THEN 1 ELSE 0 END) AS onward_part_count
-- FROM table_combo
-- GROUP BY participant_id
-- )
-- SELECT *
-- FROM onward_count
-- WHERE onward_part_count = 0
--     AND participants_name = 'Nala';

-- GROUP BY participants_name
-- HAVING onward_part_count = 0
-- WHERE participant_id = '1b155c'
-- WHERE participants_name = 'Kiran Manisha Mohanty'

/*----------------------------------------------------------------------------------------------*/

-- WITH onward_count AS
-- (
-- SELECT
--     participant_id,
--     participants_name,
--     participation_time,
--     user_created_at,
--     SUM(CASE WHEN YEAR(participation_time) >= 2021 THEN 1 ELSE 0 END) AS onward_part_count
-- FROM dim_participation_google
-- RIGHT JOIN dim_hackathonUsers_google
-- USING(participant_id)
-- GROUP BY participant_id
-- )
-- SELECT participants_name
-- FROM onward_count
-- WHERE onward_part_count = 0;
-- --    AND participants_name = 'Arvind C Jayaraman';

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_hackathonUsers_google */

-- SELECT *
-- FROM dim_hackathonUsers_google
-- LIMIT 50;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_participation_google */

-- SELECT *
-- FROM dim_participation_google
-- LIMIT 50;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

-- WITH participation_count AS
-- (
--     SELECT
--         dpg.participant_id,
--         participants_name,
--         participation_time,
--         SUM(CASE WHEN YEAR(participation_time) >= 2021 THEN 1 ELSE 0 END) AS onward_count
--     FROM dim_participation_google AS dpg
--     LEFT JOIN dim_hackathonUsers_google AS dhg
--     USING(participant_id)
--     WHERE participation_time IS NOT NULL
--     GROUP BY dpg.participant_id
-- ),
-- no_participation AS
-- (
--     SELECT
--         dhg.participant_id,
--         participants_name,
--         participation_id,
--         participation_time
--     FROM dim_participation_google AS dpg
--     RIGHT JOIN dim_hackathonUsers_google AS dhg
--     USING(participant_id)
--     WHERE participation_id IS NULL OR participation_time IS NULL
--     GROUP BY dhg.participant_id
-- ),
-- no_part_before_2021 AS
-- (
--     SELECT
--         participants_name,
--         participant_id
--     FROM participation_count
--     WHERE onward_count = 0
    
--     UNION ALL
    
--     SELECT
--         participants_name,
--         participant_id
--     FROM no_participation
-- )
-- SELECT
--     participants_name
-- FROM no_part_before_2021;



/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

SELECT 
    DISTINCT participants_name
FROM dim_hackathonUsers_google
WHERE participant_id NOT IN 
(
    SELECT participant_id 
    FROM dim_participation_google 
    WHERE YEAR(participation_time) >= 2021
);