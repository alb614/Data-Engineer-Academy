/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the number of users who organized a meeting 

-- SELECT COUNT(participant_id)
-- FROM fact_participations_zoom
-- JOIN dim_meetings_zoom 
-- ON participant_id = organizer_id

-- and who were invited to another meeting they didn't organize 
-- (regardless of the timestamp of the meeting)

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

/* My solution */

SELECT

    COUNT(DISTINCT organizer_id) AS user_count
    
FROM
(
    SELECT 
    
        f.meeting_id,
        f.participant_id,
        f.status,
        d.organizer_id
        
    FROM fact_participations_zoom AS f
    JOIN dim_meetings_zoom AS d
    ON participant_id = organizer_id 
        AND f.meeting_id <> d.meeting_id
    GROUP BY organizer_id
) AS organizer_part;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- select count(distinct m.organizer_id) as user_count
-- from dim_meetings_zoom m,
-- fact_participations_zoom p
-- where m.organizer_id = p.participant_id;