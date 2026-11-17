/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Show the number of participants for each country.

-- The output should have two columns: participant_country, participation_count.

-- Hint: Total Participations is participant_count


-- SELECT

--     participant_country,
--     COUNT(DISTINCT participant_id) AS participation_count

-- FROM dim_hackathonUsers_google
-- RIGHT JOIN dim_participation_google
-- USING(participant_id)
-- GROUP BY participant_country
-- ORDER BY participant_country;



/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_hackathonUsers_google */

-- SELECT *
-- FROM dim_hackathonUsers_google
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_participation_google */

-- SELECT *
-- FROM dim_participation_google
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    participant_country,
    COUNT(DISTINCT participant_id) AS participation_count

FROM dim_hackathonUsers_google
RIGHT JOIN dim_participation_google
USING(participant_id)
GROUP BY participant_country
ORDER BY participant_country;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     dh.participant_country,
--     COUNT(DISTINCT dp.participant_id) AS participation_count
-- FROM dim_hackathonUsers_google dh
-- JOIN dim_participation_google dp 
--     ON dh.participant_id = dp.participant_id
-- GROUP BY dh.participant_country;