-- My Queries

-- Two Aggregate Functions(sum, avg,)
-- Two inbuilt functions (count, floor, isnull,)
--  The 2 joins
-- use majority of the queries data sorting
SELECT sm.FirstName, sm.LastName, st.name AS Shift_Type, ss.Shift_Date
FROM Staff_Member sm
INNER JOIN Staff_schedule ss ON sm.Staff_id = ss.Staff_id
INNER JOIN Shift_type st ON ss.shift_type_id = st.shift_type_id
-- INNER JOIN Hospital h ON h.hospital_id = h.hospital_id
ORDER BY shift_date;
-- order by ss.shift_date;


-- Deleting shifts that are night or late in hospital 1
Delete from shift_type where (name = 'Night shift' OR name = 'late shift') and Hospital_id = 1;
