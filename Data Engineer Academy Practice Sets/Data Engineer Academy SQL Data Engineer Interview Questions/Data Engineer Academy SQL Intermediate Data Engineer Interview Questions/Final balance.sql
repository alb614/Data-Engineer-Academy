/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the number of accounts that have a final balance 
-- (after all transactions have been completed) greater than $1,000.

-- Be careful: there are accounts that have not made paying transactions and accounts that have not received
-- Columns to Display: number_of_accounts

-- WITH account_balance_stage1 AS
-- (
-- SELECT
--     account_id,
--     balance,
--     COALESCE(SUM(payer_trans.amount), 0) AS total_amount_paid,
--     COALESCE(SUM(receiver_trans.amount), 0) AS total_amount_received
-- FROM dim_accounts_paypal AS d
-- RIGHT JOIN fact_transactions_paypal AS payer_trans
-- ON d.account_id = payer_trans.payer_id
-- RIGHT JOIN fact_transactions_paypal AS receiver_trans
-- ON d.account_id = receiver_trans.receiver_id
-- GROUP BY account_id
-- ORDER BY account_id
-- ),
-- account_balance_stage2 AS
-- (
-- SELECT
--     account_id,
--     balance,
--     balance + total_amount_received - total_amount_paid AS final_balance
-- FROM account_balance_stage1
-- )
-- SELECT 
--     COUNT(account_id) AS number_of_balances
--     -- account_id,
--     -- balance,
--     -- final_balance
-- FROM account_balance_stage2
-- WHERE final_balance > 1000;

/*----------------------------------------------------------------------------------------------*/

-- WITH account_balance_payer_stage1 AS
-- (
--     SELECT
    
--         account_id,
--         balance,
--         COALESCE(SUM(payer_trans.amount), 0) AS total_amount_paid
        
--     FROM dim_accounts_paypal AS d
--     LEFT JOIN fact_transactions_paypal AS payer_trans
--     ON d.account_id = payer_trans.payer_id
--     GROUP BY account_id
--     ORDER BY account_id
-- ),
-- account_balance_receiver_stage1 AS
-- (
--     SELECT
    
--         account_id,
--         balance,
--         COALESCE(SUM(receiver_trans.amount), 0) AS total_amount_received
        
--     FROM dim_accounts_paypal AS d
--     LEFT JOIN fact_transactions_paypal AS receiver_trans
--     ON d.account_id = receiver_trans.receiver_id
--     GROUP BY account_id
--     ORDER BY account_id
-- ),
-- account_balance_stage2 AS
-- (
--     SELECT
    
--         p.account_id,
--         p.balance,
--         p.balance + total_amount_received - total_amount_paid AS final_balance
        
--     FROM account_balance_payer_stage1 AS p
--     JOIN account_balance_receiver_stage1 AS r
--     USING(account_id)
-- )
-- SELECT 
--     COUNT(account_id) AS number_of_balances
--     -- account_id,
--     -- balance,
--     -- final_balance
-- FROM account_balance_stage2
-- WHERE final_balance > 1000;


/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_accounts_paypal */

-- SELECT *
-- FROM dim_accounts_paypal
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_transactions_paypal */

-- SELECT *
-- FROM fact_transactions_paypal
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH account_balance_payer_stage1 AS
(
    SELECT
    
        account_id,
        balance,
        COALESCE(SUM(payer_trans.amount), 0) AS total_amount_paid
        
    FROM dim_accounts_paypal AS d
    LEFT JOIN fact_transactions_paypal AS payer_trans
    ON d.account_id = payer_trans.payer_id
    GROUP BY account_id
    ORDER BY account_id
),
account_balance_receiver_stage1 AS
(
    SELECT
    
        account_id,
        balance,
        COALESCE(SUM(receiver_trans.amount), 0) AS total_amount_received
        
    FROM dim_accounts_paypal AS d
    LEFT JOIN fact_transactions_paypal AS receiver_trans
    ON d.account_id = receiver_trans.receiver_id
    GROUP BY account_id
    ORDER BY account_id
),
account_balance_stage2 AS
(
    SELECT
    
        p.account_id,
        p.balance,
        p.balance + total_amount_received - total_amount_paid AS final_balance
        
    FROM account_balance_payer_stage1 AS p
    JOIN account_balance_receiver_stage1 AS r
    USING(account_id)
)
SELECT

    COUNT(account_id) AS number_of_balances
    
FROM account_balance_stage2
WHERE final_balance > 1000;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH payers AS (
--   SELECT payer_id, SUM(amount) AS amount_paid
--   FROM fact_transactions_paypal
--   GROUP BY payer_id
-- ),
-- receivers AS (
--   SELECT receiver_id, SUM(amount) AS amount_received
--   FROM fact_transactions_paypal
--   GROUP BY receiver_id
-- )
-- SELECT COUNT(*) AS number_of_accounts
-- FROM dim_accounts_paypal
-- LEFT JOIN payers
--   ON payers.payer_id = dim_accounts_paypal.account_id
-- LEFT JOIN receivers
--   ON receivers.receiver_id = dim_accounts_paypal.account_id
-- WHERE balance - COALESCE(amount_paid, 0) + COALESCE(amount_received, 0) > 1000;