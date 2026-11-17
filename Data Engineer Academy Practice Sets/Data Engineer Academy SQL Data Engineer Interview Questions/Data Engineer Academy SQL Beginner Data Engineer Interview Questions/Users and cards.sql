/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- List out the users and their cards on which the total_transactions 
-- has exceeded their respective card limit.

-- Columns to Display: User ID, Card ID, Total transactions on the card and the Card Limit.

-- SELECT
--     dcd.user_id,
--     dcd.card_id,
--     ROUND(SUM(amount)) AS total_transactions,
--     card_limit
-- FROM dim_card_details_amex dcd
-- JOIN fact_daily_transactions_amex fdt
-- ON dcd.card_id = fdt.card_id AND dcd.user_id = fdt.user_id
-- GROUP BY dcd.user_id, dcd.card_id
-- HAVING total_transactions > card_limit;

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

    dcd.user_id,
    dcd.card_id,
    ROUND(SUM(amount)) AS total_transactions,
    card_limit
    
FROM dim_card_details_amex dcd
JOIN fact_daily_transactions_amex fdt
ON dcd.card_id = fdt.card_id AND dcd.user_id = fdt.user_id
GROUP BY dcd.user_id, dcd.card_id
HAVING total_transactions > card_limit;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT  txn.user_id AS User_id,
-- 		txn.card_id AS Card_id,
-- 		total_transactions,
-- 		card_limit
-- FROM
-- (
-- 	SELECT  user_id,
-- 			card_id,
-- 			ROUND(SUM(amount),0) AS total_transactions
-- 	FROM fact_daily_transactions_amex
-- 	GROUP BY user_id, 
-- 			 card_id
-- ) txn
-- JOIN dim_card_details_amex cards
--   ON txn.card_id = cards.card_id
--   AND txn.user_id = cards.user_id
-- WHERE total_transactions > card_limit
-- ORDER BY User_id, Card_id;