/* Brainstorming section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* Pseudocode section */

-- 

/*----------------------------------------------------------------------------------------------*/
/*oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo*/
/*----------------------------------------------------------------------------------------------*/

/* My implementation & solution section */

/*----------------------------------------------------------------------------------------------*/

/* Viewing table orders */

-- SELECT *
-- FROM orders
-- LIMIT 5;

/*----------------------------------------------------------------------------------------------*/

/* My solution */

SELECT appointment_id, appointment_datetime AS scheduled_time
FROM patient_appointments
WHERE doctor_id IS NULL;

/*----------------------------------------------------------------------------------------------*/

/* DE Academy solution */

-- SELECT 
--     appointment_id, 
--     appointment_datetime AS scheduled_time
-- FROM 
--     patient_appointments
-- WHERE 
--     doctor_id IS NULL;