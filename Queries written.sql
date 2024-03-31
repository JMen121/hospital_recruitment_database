-- My Queries

--  Query to find out how what day each staff is working on, in what hospital
SELECT sm.FirstName, sm.LastName, st.name AS Shift_Type, ss.Shift_Date, h.name AS Hospital, d.name AS Department
FROM Staff_Member sm
INNER JOIN Staff_schedule ss ON sm.Staff_id = ss.Staff_id
INNER JOIN Shift_type st ON ss.shift_type_id = st.shift_type_id
INNER JOIN Hospital h ON h.hospital_id = h.hospital_id
INNER JOIN Department d on d.department_id = d.department_id
ORDER BY shift_date;

-- Using an aggregate function to find out how many hours David Choi has worked this week
SELECT sm.FirstName, sm.LastName, SUM(ss.hours_worked) AS Total_Hours
FROM Staff_member sm
Inner JOIN Staff_schedule ss ON sm.Staff_id = ss.Staff_id
WHERE sm.FirstName = 'David' AND LastName = 'Choi';
-- answer is 27 hours

-- Selecting Staff members in Good Health Hospital and identifying the average age in the hospital and rounding it to the nearest integer
SELECT Floor(AVG(sm.age)) AS Average_Age, h.Name AS Hospital
FROM Staff_Member sm
Inner JOIN Department d ON sm.Department_id = d.Department_id
Inner JOIN Hospital h ON d.Hospital_id = h.Hospital_id
WHERE h.Name = 'Good Health Hospital';

-- The local Trust has realised that some departments have not written their phone numbers, but not sure which?
Select d.name As department_name, d.phone_number, h.name as Hospital_name
 From Department d
 Left Join Hospital h ON d.hospital_id = h.hospital_id
 where d.phone_number is null;

-- Deleting shifts that are night or late in hospital 1
DELETE FROM shift_type WHERE (name = 'Night shift' OR name = 'late shift') AND Hospital_id = 1;
