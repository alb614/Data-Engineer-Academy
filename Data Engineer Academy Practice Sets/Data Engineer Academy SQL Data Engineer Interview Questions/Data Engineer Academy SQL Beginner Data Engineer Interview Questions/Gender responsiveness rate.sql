/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the responsiveness rate of each gender. 

-- HINT: The responsiveness rate is the percentage of the users who responded 
-- (replied) out of those contacted(messages sent)

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_users_hinge */

-- SELECT *
-- FROM dim_users_hinge
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_logins_hinge */

-- SELECT *
-- FROM fact_logins_hinge
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT
    
    gender,
    ROUND(100 * SUM(replies)/SUM(messages_sent), 2) AS responsive_rate
    
FROM dim_users_hinge
JOIN fact_logins_hinge
USING(user_id)
GROUP BY gender;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT gender
-- , ROUND(100*(SUM(replies)/SUM(messages_sent)),2)
--   AS responsiveness_rate
-- FROM dim_users_hinge
-- JOIN fact_logins_hinge
-- USING (user_id)
-- GROUP BY gender;