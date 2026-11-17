/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the final transaction balance of each city 

-- GROUP BY city

-- (the difference between all the money received by the city inhabitants 
-- and the money sent)

-- SUM(money received) - SUM(money sent) AS final_balance

-- and display the result in descending order of the transaction balance.
-- ORDER BY final_balance DESC 

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

/* My solution #1 */

WITH amt_received_by_city AS
(
    SELECT
    
        city,
        SUM(amount) AS total_amount_sent
    
    FROM dim_accounts_paypal d
    JOIN fact_transactions_paypal f
    ON d.Account_id = f.Receiver_id
    GROUP BY city
    ORDER BY city
),
amt_sent_by_city AS
(

    SELECT
    
        city,
        SUM(amount) AS total_amount_received
    
    FROM dim_accounts_paypal d
    JOIN fact_transactions_paypal f
    ON d.Account_id = f.Payer_id
    GROUP BY city
    ORDER BY city

)
SELECT
    city,
    total_amount_sent - total_amount_received AS final_balance
FROM amt_received_by_city
JOIN amt_sent_by_city
USING(city)
ORDER BY final_balance DESC;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #2 */

-- SELECT
    
--     city,
--     SUM(f1.amount) AS total_amount_sent,
--     SUM(f2.amount) AS total_amount_received
--     -- SUM(f1.Amount) - SUM(f2.Amount) AS final_balance
-- FROM dim_accounts_paypal d
-- LEFT JOIN fact_transactions_paypal f1
-- ON d.Account_id = f1.Receiver_id
-- LEFT JOIN fact_transactions_paypal f2
-- ON d.Account_id = f2.Payer_id
-- GROUP BY city
-- ORDER BY city;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- WITH city_payments AS (
--   SELECT city, SUM(amount) AS total_amount_paid
--   FROM fact_transactions_paypal
--   JOIN dim_accounts_paypal
--     ON fact_transactions_paypal.payer_id = dim_accounts_paypal.account_id
--   GROUP BY city
-- ),
-- city_receptions AS (
--   SELECT city, SUM(amount) AS total_amount_received
--   FROM fact_transactions_paypal
--   JOIN dim_accounts_paypal
--     ON fact_transactions_paypal.receiver_id = dim_accounts_paypal.account_id
--   GROUP BY city
-- )
-- SELECT city, total_amount_received - total_amount_paid AS city_balance
-- FROM city_payments
-- JOIN city_receptions
-- USING (city)
-- ORDER BY city_balance DESC;