/* Brainstorming section */

-- Identify users who upgraded from a Gold card to a Platinum card, 
-- where the Platinum card was acquired immediately after the Gold card. 
-- For each such user: 
-- calculate the percentage increase in card limit between the two cards. 
-- Use Subquery

-- Output must contain: 
-- user_id, 
-- card_id (the Gold card ID), 
-- next_card_id (the Platinum card ID), 
-- percent_increase (percentage increase in card limit, from Gold to Platinum)

-- Order the results by percent_increase in descending order.

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT
--     *
-- FROM
-- (
-- SELECT
--     t1.user_id,
--     t1.card_id AS card_id_1,
--     t1.card_type AS card_type_1,
--     t1.account_open_date AS account_open_date_1,
--     t1.card_expiry AS card_expiry_1,
--     t1.card_limit AS card_limit_1,
--     t2.card_id AS card_id_2,
--     t2.card_type AS card_type_2,
--     t2.account_open_date AS account_open_date_2,
--     t2.card_expiry AS card_expiry_2,
--     t2.card_limit AS card_limit_2,
--     DENSE_RANK() OVER(PARTITION BY t1.user_id ORDER BY DATEDIFF(t2.account_open_date, t1.account_open_date)) AS open_date_diff_rnk
-- FROM dim_card_details_amex t1
-- JOIN dim_card_details_amex t2
-- ON t1.user_id = t2.user_id AND t1.card_type = "Gold" AND t2.card_type = "Platinum"
-- WHERE t2.account_open_date > t1.account_open_date
-- ) sub
-- WHERE open_date_diff_rnk = 1;

-- SELECT
--     user_id,
--     card_id,
--     next_card_id,
--     100 * (next_card_limit - card_limit) / card_limit AS percent_increase
-- FROM
-- (
--     SELECT
--         user_id,
--         card_id,
--         LEAD(card_id, 1) OVER(PARTITION BY user_id ORDER BY account_open_date) AS next_card_id,
--         card_type,
--         LEAD(card_type, 1) OVER(PARTITION BY user_id ORDER BY account_open_date) AS next_card_type,
--         account_open_date,
--         card_expiry,
--         card_limit,
--         LEAD(card_limit, 1) OVER(PARTITION BY user_id ORDER BY account_open_date) AS next_card_limit,
--         DENSE_RANK() OVER(PARTITION BY user_id ORDER BY account_open_date) AS open_date_rnk
--     FROM dim_card_details_amex
-- ) sub
-- WHERE card_type = "Gold" AND next_card_type = "Platinum"
-- ORDER BY percent_increase DESC;

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_card_details_amex  */

-- SELECT *
-- FROM dim_card_details_amex 
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_daily_transactions_amex */

-- SELECT *
-- FROM fact_daily_transactions_amex
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT
    user_id,
    card_id,
    next_card_id,
    100 * (next_card_limit - card_limit) / card_limit AS percent_increase
FROM
(
    SELECT
        user_id,
        card_id,
        LEAD(card_id, 1) OVER(PARTITION BY user_id ORDER BY account_open_date) AS next_card_id,
        card_type,
        LEAD(card_type, 1) OVER(PARTITION BY user_id ORDER BY account_open_date) AS next_card_type,
        account_open_date,
        card_expiry,
        card_limit,
        LEAD(card_limit, 1) OVER(PARTITION BY user_id ORDER BY account_open_date) AS next_card_limit,
        DENSE_RANK() OVER(PARTITION BY user_id ORDER BY account_open_date) AS open_date_rnk
    FROM dim_card_details_amex
) sub
WHERE card_type = "Gold" AND next_card_type = "Platinum"
ORDER BY percent_increase DESC;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT  user_id,
--                 card_id,
--                 next_card_id,
--                 ((next_card_limit - card_limit)/card_limit)*100 AS percent_increase
-- FROM
-- (
-- 	SELECT  user_id,
-- 			card_id,
-- 			card_type,
-- 			card_limit,
-- 			LEAD(card_id,1) OVER (PARTITION BY user_id ORDER BY account_open_date) AS next_card_id,
-- 			LEAD(card_type,1) OVER (PARTITION BY user_id ORDER BY account_open_date) AS next_card_type,
-- 			LEAD(card_limit,1) OVER (PARTITION BY user_id ORDER BY account_open_date) AS next_card_limit
-- 	FROM dim_card_details_amex
-- ) next_purchase
-- WHERE card_type = 'Gold'
--   AND next_card_type = 'Platinum'
-- ORDER BY percent_increase DESC;