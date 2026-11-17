/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the number of positive and negative balances after all transactions are completed

-- (Be careful: there are accounts that have not had any transactions)

-- Columns to Display: number_of_positive_balances, number_of_negative_balances

-- WITH transaction_sum AS
-- (
-- SELECT
--     a.account_id,
--     balance,
--     SUM(CASE WHEN amount IS NOT NULL THEN amount ELSE 0 END) AS total_transactions
-- FROM dim_accounts_stripe AS a
-- LEFT JOIN fact_transactions_stripe AS t
-- ON a.account_id = t.account_id
-- GROUP BY a.account_id
-- )
-- SELECT
--     COUNT(CASE WHEN balance - total_transactions > 0 THEN 1 END) AS number_of_positive_balances,
--     COUNT(CASE WHEN balance - total_transactions < 0 THEN 1 END) AS number_of_negative_balances
-- FROM transaction_sum;


/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_accounts_stripe */

-- SELECT *
-- FROM dim_accounts_stripe
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_transactions_stripe */

-- SELECT *
-- FROM fact_transactions_stripe
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH transaction_sum AS
(
    SELECT
    
        a.account_id,
        balance,
        SUM(CASE WHEN amount IS NOT NULL THEN amount ELSE 0 END) AS total_transactions
        
    FROM dim_accounts_stripe AS a
    LEFT JOIN fact_transactions_stripe AS t
    ON a.account_id = t.account_id
    GROUP BY a.account_id
)
SELECT

    COUNT(CASE WHEN balance - total_transactions > 0 THEN 1 END) AS number_of_positive_balances,
    COUNT(CASE WHEN balance - total_transactions < 0 THEN 1 END) AS number_of_negative_balances

FROM transaction_sum;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution #1 */

-- WITH total_amount_per_person AS (
--   SELECT account_id, SUM(amount) AS total_amount
--   FROM fact_transactions_stripe
--   GROUP BY account_id
-- )
-- SELECT
--   SUM(CASE WHEN (dm.balance - COALESCE(ta.total_amount, 0)) > 0 THEN 1 ELSE 0 END) AS number_of_positive_balances,
--   SUM(CASE WHEN (dm.balance - COALESCE(ta.total_amount, 0)) < 0 THEN 1 ELSE 0 END) AS number_of_negative_balances
-- FROM dim_accounts_stripe dm
-- LEFT JOIN total_amount_per_person ta USING (account_id);

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution #2 */

-- WITH total_amount_per_person (account_id, total_amount) AS 
-- (
-- 	SELECT

-- 		account_id,
-- 		SUM(amount)

-- 	FROM fact_transactions_stripe
-- 	GROUP BY account_id
-- )
-- SELECT

-- 	SUM(CASE WHEN dm.balance >= ta.total_amount OR (dm.balance >= 0 AND ta.total_amount IS NULL) THEN 1 ELSE 0 END) AS number_of_positive_balances,
-- 	SUM(CASE WHEN dm.balance <= ta.total_amount OR (dm.balance < 0 AND ta.total_amount IS NULL) THEN 1 ELSE 0 END) AS number_of_negative_balances

-- FROM dim_accounts_stripe AS dm
-- LEFT JOIN total_amount_per_person AS ta
-- USING(account_id);