/* Brainstorming section */

-- Determine if there are any orders placed on U.S. federal holidays
-- List them (the orders placed on U.S. federal holidays)
-- Retrieve the orders that were placed during a federal holiday

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- SELECT order_id, order_date, amount, holiday (use CASE)
-- filter out depending on whether the order_date is a U.S. federal holiday (use WHERE with an IN
-- clause that checks the order_date against a list of U.S. federal holidays)


/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders_prc */

-- SELECT *
-- FROM orders_prc;

/*----------------------------------------------------------------------------------------------*/

/* Implementation #1 */

/* This query works but it retrieves data that wasn't requested.  This was my initial
attempt to resolve the task since specific data from the table wasn't stipulated in the
task.*/

-- SELECT

--     order_id, 
--     order_date, 
--     amount, 
--     CASE
--         WHEN DATE_FORMAT(order_date, '%m-%d') = '01-01' THEN 'New Years Day'
--         WHEN DATE_FORMAT(order_date, '%m-%d') = '01-16' THEN 'Martin Luther King Day'
--         WHEN DATE_FORMAT(order_date, '%m-%d') = '01-20' THEN 'Martin Luther King Day'
--         WHEN DATE_FORMAT(order_date, '%m-%d') = '02-17' THEN 'Washingstons Birthday'
--         WHEN DATE_FORMAT(order_date, '%m-%d') = '05-26' THEN 'Memorial Day'
--         WHEN DATE_FORMAT(order_date, '%m-%d') = '06-19' THEN 'Juneteenth'
--         WHEN DATE_FORMAT(order_date, '%m-%d') = '07-04' THEN 'Independence Day'
--         WHEN DATE_FORMAT(order_date, '%m-%d') = '09-01' THEN 'Labor Day'
--         WHEN DATE_FORMAT(order_date, '%m-%d') = '11-11' THEN 'Veterans Day'
--         WHEN DATE_FORMAT(order_date, '%m-%d') = '11-27' THEN 'Thanksgiving'
--         WHEN DATE_FORMAT(order_date, '%m-%d') = '12-25' THEN 'Christmas'
--         ELSE 'Not a holiday'
--         END AS holiday
    
-- FROM orders_prc
-- WHERE DATE_FORMAT(order_date, '%m-%d') IN ('01-01', '01-16', '01-20', '02-17', '05-26', '06-19', '07-04', '09-01', '11-11', '11-27', '12-25');

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT

    EXTRACT(YEAR FROM order_date) AS order_year, 
    DATE_FORMAT(order_date, '%m-%d') AS order_date_formatted, 
    COUNT(*) AS order_count,
    
    -- CASE
    --     WHEN DATE_FORMAT(order_date, '%m-%d') = '01-01' THEN 'New Years Day'
    --     WHEN DATE_FORMAT(order_date, '%m-%d') = '01-16' THEN 'Martin Luther King Day'
    --     WHEN DATE_FORMAT(order_date, '%m-%d') = '01-20' THEN 'Martin Luther King Day'
    --     WHEN DATE_FORMAT(order_date, '%m-%d') = '02-17' THEN 'Washingstons Birthday'
    --     WHEN DATE_FORMAT(order_date, '%m-%d') = '05-26' THEN 'Memorial Day'
    --     WHEN DATE_FORMAT(order_date, '%m-%d') = '06-19' THEN 'Juneteenth'
    --     WHEN DATE_FORMAT(order_date, '%m-%d') = '07-04' THEN 'Independence Day'
    --     WHEN DATE_FORMAT(order_date, '%m-%d') = '09-01' THEN 'Labor Day'
    --     WHEN DATE_FORMAT(order_date, '%m-%d') = '11-11' THEN 'Veterans Day'
    --     WHEN DATE_FORMAT(order_date, '%m-%d') = '11-27' THEN 'Thanksgiving'
    --     WHEN DATE_FORMAT(order_date, '%m-%d') = '12-25' THEN 'Christmas'
    --     ELSE 'Not a holiday'
    --     END AS holiday
    -- I added this CASE statement as a way of labeling the orders according to the holiday
    -- that fall on.  If the date doesn't fall on a holiday, it will not labeled as 
    -- 'Not a holiday'.
    
FROM orders_prc
WHERE DATE_FORMAT(order_date, '%m-%d') IN ('01-01', '01-16', '01-20', '02-17', '05-26', '06-19', '07-04', '09-01', '11-11', '11-27', '12-25')
GROUP BY order_date;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT
--     YEAR(order_date) AS order_year,
--     DATE_FORMAT(order_date, '%m-%d') AS order_date_formatted,
--     COUNT(*) AS order_count
-- FROM orders_prc
-- WHERE DATE_FORMAT(order_date, '%m-%d') IN (
--     '01-01',  -- New Year's Day
--     '07-04',  -- Independence Day
--     '11-11',  -- Veterans Day
--     '11-23',  -- Thanksgiving Day
--     '12-25',  -- Christmas Day
--     '01-20',  -- Inauguration Day (every 4 years)
--     '01-16',  -- Martin Luther King Jr. Day
--     '02-20',  -- Washington's Birthday
--     '05-30',  -- Memorial Day
--     '09-05',  -- Labor Day
--     '10-10',  -- Columbus Day
--     '11-11',  -- Veterans Day
--     '12-31'   -- New Year's Eve (not a federal holiday, but sometimes observed)
--     -- Add more holidays as needed
-- )
-- GROUP BY order_year, order_date_formatted
-- ORDER BY order_year, order_date_formatted;