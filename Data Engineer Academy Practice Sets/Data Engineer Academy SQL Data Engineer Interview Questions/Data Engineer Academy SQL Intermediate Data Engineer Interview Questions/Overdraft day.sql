/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the first day of overdraft of each user. 
-- (The day on which the account balance becomes negative for the first time).

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table fact_transactions_coinbase */

-- SELECT *
-- FROM fact_transactions_coinbase
-- LIMIT 50
-- ORDER BY user_id;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_users_coinbase */

-- SELECT *
-- FROM dim_users_coinbase
-- LIMIT 50;

/*----------------------------------------------------------------------------------------------*/

/* Viewing table dim_crypto_coinbase */

-- SELECT *
-- FROM dim_crypto_coinbase
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

-- WITH transaction_data AS
-- (
--     SELECT
    
--         user_id,
--         name,
--         initial_wallet,
--         f.cryptocurrency,
--         number_of_coins,
--         transaction_type,
--         f.date,
--         price
    
--     FROM dim_users_coinbase du
--     JOIN fact_transactions_coinbase f
--     USING(user_id)
--     JOIN dim_crypto_coinbase dc
--     ON f.date = dc.date AND f.cryptocurrency = dc.Cryptocurrency
--     ORDER BY user_id, f.date
-- ),
-- stage2 AS
-- (

--     SELECT
    
--         user_id,
--         name,
--         initial_wallet,
--         cryptocurrency,
--         number_of_coins,
--         transaction_type,
--         date,
--         price,
--         CASE
--             WHEN transaction_type = 'buy' THEN initial_wallet - number_of_coins * price
--             WHEN transaction_type = 'sale' THEN initial_wallet + number_of_coins * price
--         END AS new_wallet_balance
    
--     FROM transaction_data

-- ),
-- stage3 AS
-- (

--     SELECT
    
--         user_id,
--         name,
--         cryptocurrency,
--         number_of_coins,
--         transaction_type,
--         date,
--         price,
--         CASE
--             WHEN LAG(new_wallet_balance, 1) OVER(PARTITION BY user_id ORDER BY date) IS NOT NULL THEN LAG(new_wallet_balance, 1) OVER(PARTITION BY user_id ORDER BY date)
--             WHEN LAG(new_wallet_balance, 1) OVER(PARTITION BY user_id ORDER BY date) IS NULL THEN initial_wallet
--         END AS current_wallet_balance,
--         new_wallet_balance
        
--     FROM stage2

-- ),
-- stage4 AS
-- (

--     SELECT
    
--         user_id,
--         name,
--         cryptocurrency,
--         number_of_coins,
--         transaction_type,
--         date,
--         price,
--         current_wallet_balance,
--         CASE
--             WHEN current_wallet_balance IS NOT NULL AND transaction_type = 'buy' THEN current_wallet_balance - number_of_coins * price
--             WHEN current_wallet_balance IS NOT NULL AND transaction_type = 'sale' THEN current_wallet_balance + number_of_coins * price
--         END AS new_wallet_balance
    
--     FROM stage3

-- )
-- SELECT *
-- FROM stage4;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

WITH running_acct_balance AS
(
    SELECT
    
        user_id,
        name,
        initial_wallet,
        ftc.date,
        initial_wallet + SUM(CASE WHEN transaction_type = 'sale' THEN number_of_coins * price WHEN transaction_type = 'buy' THEN -1 * number_of_coins * price END) OVER(PARTITION BY user_id ORDER BY ftc.date) AS account_balance
    
    FROM dim_users_coinbase AS duc
    JOIN fact_transactions_coinbase AS ftc
    USING(user_id)
    JOIN dim_crypto_coinbase AS dcc
    ON ftc.cryptocurrency = dcc.cryptocurrency AND ftc.date = dcc.date
),
ranked_negative_acct_balance AS
(
    SELECT
    
        *,
        RANK() OVER(PARTITION BY user_id ORDER BY date) AS rnk
    
    FROM running_acct_balance
    WHERE account_balance < 0
    GROUP BY user_id
)
SELECT

    name,
    date
    
FROM ranked_negative_acct_balance
WHERE rnk = 1;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH user_history AS (
--     SELECT
--         user_id
--         ,name
--         ,initial_wallet
--         ,cryptocurrency
--         ,CASE
--             WHEN transaction_type = 'buy'
--                 THEN -(number_of_coins * price)
--             ELSE (number_of_coins * price)
--         END AS amount
--         ,transaction_type
--         ,date
--     FROM dim_users_coinbase u
--     JOIN fact_transactions_coinbase t
--         USING(user_id)
--     JOIN dim_crypto_coinbase c
--         USING(cryptocurrency, date)
-- )

-- ,cumulative_amount AS (
--     SELECT
--         *
--         ,SUM(amount) OVER (PARTITION BY user_id ORDER BY date) AS cumulative_amount
--     FROM user_history
-- )

-- SELECT
--     name,
--     MIN(date) AS overdraft_day
-- FROM cumulative_amount
-- WHERE initial_wallet + cumulative_amount < 0 
-- GROUP BY user_id
-- ORDER BY user_id, date;