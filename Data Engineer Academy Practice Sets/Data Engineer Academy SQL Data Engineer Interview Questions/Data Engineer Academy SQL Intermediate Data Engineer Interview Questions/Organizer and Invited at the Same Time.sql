/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the number of users who organized a meeting

-- COUNT(organizer_id)

-- and who were invited to another meeting 

-- FROM dim_meetings_zoom
-- JOIN fact_participations_zoom
-- ON organizer_id = participant_id

-- whose timestamp overlaps with the organized meeting 
-- timestamp.

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

/* Viewing table dim_meetings_zoom */

-- SELECT *
-- FROM dim_meetings_zoom
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH meeting_data AS
(
    SELECT
    
        d1.meeting_id AS organizer_meeting_id,
        d1.organizer_id,
        d1.start_timestamp AS organizer_start_timestamp,
        d1.end_timestamp AS organizer_end_timestamp,
        f.meeting_id AS other_meeting_id,
        f.participant_id,
        f.status,
        d2.start_timestamp AS other_meeting_start_timestamp,
        d2.end_timestamp AS other_meeting_end_timestamp
        
    FROM dim_meetings_zoom d1
    JOIN fact_participations_zoom f
    ON organizer_id = participant_id
    JOIN dim_meetings_zoom d2
    ON f.meeting_id = d2.meeting_id
)

SELECT 

    COUNT(*) AS participant_count

FROM meeting_data
WHERE 
(organizer_start_timestamp < other_meeting_start_timestamp
AND organizer_end_timestamp > other_meeting_start_timestamp
) OR
(organizer_start_timestamp < other_meeting_end_timestamp
AND organizer_end_timestamp > other_meeting_end_timestamp
) OR
(organizer_start_timestamp >= other_meeting_start_timestamp
AND organizer_end_timestamp < other_meeting_end_timestamp
);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT COUNT(DISTINCT fp.participant_id) AS participant_count
-- FROM fact_participations_zoom fp
-- JOIN dim_meetings_zoom dm ON fp.meeting_id = dm.meeting_id
-- JOIN dim_meetings_zoom dm2 ON fp.participant_id = dm2.organizer_id
-- WHERE dm2.start_timestamp < dm.end_timestamp
-- AND dm2.end_timestamp > dm.start_timestamp;