-- My Queries
USE hospital_recruitment;
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
INNER JOIN Department d ON sm.Department_id = d.Department_id
INNER JOIN Hospital h ON d.Hospital_id = h.Hospital_id
WHERE h.Name = 'Good Health Hospital';

-- The local Trust has realised that some departments have not written their phone numbers, but not sure which?
SELECT d.name AS department_name, d.phone_number, h.name AS Hospital_name
 FROM Department d
 LEFT JOIN Hospital h ON d.hospital_id = h.hospital_id
 WHERE d.phone_number IS NULL;

Delimiter //
CREATE PROCEDURE GetStaffCountByDepartment()
BEGIN
    SELECT d.Name AS Department_Name, COUNT(sm.Staff_id) AS Staff_Count
    FROM Department d
    LEFT JOIN Staff_Member sm ON d.Department_id = sm.Department_id
    GROUP BY d.Name;
END //

DELIMITER ;

-- How many staff there are in each department- great for scaleability
CALL GetStaffCountByDepartment();

-- Deleting shifts that are night or late in hospital 1
DELETE FROM shift_type WHERE (name = 'Night shift' OR name = 'late shift') AND Hospital_id = 1;
