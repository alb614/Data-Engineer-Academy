/* Brainstorming section */

-- A two-way unique relationship is established when two people send money back and forth. 
-- Find the number of two-way unique relationships in this data.

-- Columns to Display: 
-- number_of_two_way_relationships

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- WITH uniq_rel AS
-- (
--     SELECT
--         pr1.payer_id AS first_payer,
--         pr1.receiver_id AS first_receiver,
--         pr2.payer_id AS second_payer,
--         pr2.receiver_id AS second_receiver
--     FROM fact_transactions_paypal AS pr1
--     JOIN fact_transactions_paypal AS pr2
--     ON  pr1.receiver_id = pr2.payer_id AND pr1.payer_id = pr2.receiver_id
--     GROUP BY first_payer, first_receiver, second_payer, second_receiver
--     HAVING first_payer > first_receiver
-- )
-- SELECT
--     COUNT(*) as unique_relationships
-- FROM uniq_rel;

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

WITH uniq_rel AS
(
    SELECT
        pr1.payer_id AS first_payer,
        pr1.receiver_id AS first_receiver,
        pr2.payer_id AS second_payer,
        pr2.receiver_id AS second_receiver
    FROM fact_transactions_paypal AS pr1
    JOIN fact_transactions_paypal AS pr2
    ON  pr1.receiver_id = pr2.payer_id AND pr1.payer_id = pr2.receiver_id
    WHERE pr1.payer_id > pr1.receiver_id
)
SELECT
    COUNT(*) as unique_relationships
FROM uniq_rel;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution #1 */

-- -- This query calculates the number of unique two-way relationships,
-- -- where User A sends money to User B, and User B sends money to User A.

-- WITH UniqueTransactions AS (
--     -- 1. Get all unique, distinct (Payer, Receiver) pairs
--     SELECT DISTINCT
--         Payer_id AS Sender,
--         Receiver_id AS Recipient
--     FROM
--         fact_transactions_paypal
-- )
-- -- 2. Self-join to find the reverse transaction (A->B AND B->A)
-- SELECT
--     COUNT(*) AS number_of_two_way_relationships
-- FROM
--     UniqueTransactions AS t_forward
-- JOIN
--     UniqueTransactions AS t_backward
--     -- Join condition: A->B is t_forward.Sender = t_backward.Recipient
--     -- AND B->A is t_forward.Recipient = t_backward.Sender
--     ON t_forward.Sender = t_backward.Recipient
--     AND t_forward.Recipient = t_backward.Sender
-- -- 3. Filter to count each unique relationship only once.
-- -- By ensuring the Sender ID is lexicographically smaller than the Recipient ID,
-- -- we count the pair (A, B) but ignore the reverse pair (B, A).
-- WHERE
--     t_forward.Sender < t_forward.Recipient;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution #2 */

-- WITH relationships AS
-- (
--     SELECT
--         t1.payer_id,
--         t1.receiver_id
--     FROM fact_transactions_paypal t1
--     JOIN fact_transactions_paypal t2
--     ON t1.payer_id = t2.receiver_id AND t1.receiver_id = t2.payer_id
--     WHERE t1.payer_id > t1.receiver_id
-- )
-- SELECT
--     COUNT(payer_id) AS unique_relationships
-- FROM relationships;