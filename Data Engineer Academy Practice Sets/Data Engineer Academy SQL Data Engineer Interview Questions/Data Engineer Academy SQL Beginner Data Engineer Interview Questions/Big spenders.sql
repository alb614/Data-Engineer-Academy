/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- Find the name of persons
-- that made more than 5 transactions

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

SELECT *
FROM
(
    SELECT
    
        name,
        COUNT(*) AS number_of_purchases
        
    FROM fact_transactions_stripe
    JOIN dim_accounts_stripe
    USING(account_id)
    GROUP BY account_id
) AS NumPurch
WHERE number_of_purchases > 5;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- select name, count(*) as number_of_purchases
-- from fact_transactions_stripe
-- join dim_accounts_stripe 
-- using (account_id)
-- group by account_id
-- having count(*) > 5;