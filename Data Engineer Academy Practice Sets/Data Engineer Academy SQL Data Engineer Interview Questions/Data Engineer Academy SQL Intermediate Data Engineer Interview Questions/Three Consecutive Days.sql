/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the number of users invited to meetings on three consecutive days

-- COUNT(participant_id) AS participant_count

-- Need timestamp data for the meetings the participants were invited to:

-- JOIN fact_participations_zoom
-- USING(meeting_id)

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_participations_zoom */

-- SELECT *
-- FROM fact_participations_zoom
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_meetings_zoom  */

-- SELECT *
-- FROM dim_meetings_zoom 
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution: Assisted by SQL AI Tutor */

WITH meeting_date AS
(
    SELECT
    
        DISTINCT participant_id,
        CAST(start_timestamp AS DATE) AS start_date
        
    FROM fact_participations_zoom
    JOIN dim_meetings_zoom
    USING(meeting_id)
),
next_meeting_dates AS
(

    SELECT
    
        participant_id,
        start_date,
        LEAD(start_date, 1) OVER(PARTITION BY participant_id ORDER BY start_date) AS next_meeting_start_date,
        LEAD(start_date, 2) OVER(PARTITION BY participant_id ORDER BY start_date) AS next_next_meeting_start_date
    
    FROM meeting_date

),
consec_count AS
(
    SELECT 
    
        participant_id

    FROM next_meeting_dates
    WHERE DATEDIFF(next_next_meeting_start_date, next_meeting_start_date) = 1 
        AND DATEDIFF(next_next_meeting_start_date, start_date) = 2
)
SELECT 

     COUNT(DISTINCT participant_id) AS participant_count
    
FROM consec_count;

/*----------------------------------------------------------------------------------------------*/

/* SQL AI Tutor solution */

-- WITH distinct_meeting_dates AS
-- (
--     -- Step 1: Remove multiple meetings on the same day for a participant
--     SELECT DISTINCT
--         participant_id,
--         CAST(start_timestamp AS DATE) AS meeting_date
--     FROM fact_participations_zoom
--     JOIN dim_meetings_zoom USING(meeting_id)
-- ),
-- next_dates AS
-- (
--     -- Step 2: Find the date of the next meeting, and the meeting after that
--     SELECT 
--         participant_id,
--         meeting_date,
--         -- Omitting the default value inherently defaults to NULL, avoiding cast errors
--         LEAD(meeting_date, 1) OVER(PARTITION BY participant_id ORDER BY meeting_date) AS next_meeting_date,
--         LEAD(meeting_date, 2) OVER(PARTITION BY participant_id ORDER BY meeting_date) AS next_next_meeting_date
--     FROM distinct_meeting_dates
-- ),
-- consecutive_streaks AS
-- (
--     -- Step 3: Check if the dates are exactly 1 and 2 days apart
--     SELECT 
--         participant_id
--     FROM next_dates
--     WHERE DATEDIFF(next_meeting_date, meeting_date) = 1 
--       AND DATEDIFF(next_next_meeting_date, meeting_date) = 2
-- )
-- -- Step 4: Count the distinct participants who achieved this at least once
-- SELECT 
--     COUNT(DISTINCT participant_id) AS participant_count
-- FROM consecutive_streaks;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH meeting AS (
-- SELECT

--     participant_id,
--     DATE(start_timestamp) AS start_timestamp,
--     DATE(end_timestamp) AS end_timestamp
    
-- FROM fact_participations_zoom p
-- JOIN dim_meetings_zoom m
--     ON p.meeting_id = m.meeting_id
-- ORDER BY participant_id, start_timestamp
-- )

-- SELECT COUNT(DISTINCT m1.participant_id) AS participant_count
-- FROM meeting m1
-- JOIN meeting m2
--     ON m1.participant_id = m2.participant_id
--     AND m2.start_timestamp = m1.start_timestamp + INTERVAL 1 DAY
-- JOIN meeting m3
--     ON m1.participant_id = m3.participant_id
--     AND m3.start_timestamp = m2.start_timestamp + INTERVAL 1 DAY;