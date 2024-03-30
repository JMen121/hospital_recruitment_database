-- The Scenario
-- This is a hospital recruitment database of a local trust, consisting of 3 hospitals(if I have time). 
-- This will be focusing specifically on the Staff Members, Department, Shift-Time, Shift Schedule and Hospital(if i have time)
-- One hospital can have many departments

CREATE DATABASE hospital_recruitment;

USE hospital_recruitment;

-- Table for Hospital
CREATE TABLE Hospital(
Hospital_id INTEGER AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(255) NOT NULL,
Address VARCHAR(255) NOT NULL,
phone_number INTEGER NOT NULL
);

-- Table for Department
CREATE TABLE Department(
Department_id INTEGER AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(155) NOT NULL,
Phone_number INTEGER,
Hospital_id INTEGER NOT NULL,
FOREIGN KEY (Hospital_id) REFERENCES Hospital (Hospital_id),
UNIQUE (Phone_number)
);

-- Table for Staff members 
CREATE TABLE Staff_Member(
Staff_id INTEGER AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL,
Phone_number INTEGER NOT NULL, 
Email_address VARCHAR(255),
Age INT NOT NULL CHECK (age>=18),
Role VARCHAR(155),
Clothes_size VARCHAR(10),
Department_id INTEGER NOT NULL,
Hospital_id INTEGER NOT NULL,
FOREIGN KEY (Department_id) REFERENCES Department (Department_id),
FOREIGN KEY (Hospital_id) REFERENCES Hospital (Hospital_id)
);

-- Table for Shift_type
CREATE TABLE Shift_type(
Shift_type_id INTEGER AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100),
Start_time TIME,
End_time TIME,
Hospital_id INTEGER NOT NULL,
FOREIGN KEY (Hospital_id) REFERENCES Hospital (Hospital_id)
); 

-- Table for Staff_Schedule
CREATE TABLE Staff_schedule(
Staff_schedule_id INTEGER AUTO_INCREMENT PRIMARY KEY,
Staff_id INTEGER NOT NULL,
Shift_type_id INTEGER NOT NULL,
Hours_worked DECIMAL,
Shift_Date DATE,
FOREIGN KEY (Shift_type_id) REFERENCES Shift_type(Shift_type_id),
FOREIGN KEY (Staff_id) REFERENCES Staff_Member(Staff_id)
);

-- Had to alter the table in order for the decimals to appear on the table
ALTER TABLE staff_schedule 
MODIFY COLUMN hours_worked DECIMAL (5,2);


-- Inserting into Hospital 

INSERT INTO Hospital ( name, address, phone_number)
VALUES('Highlands Medical','5 Market Pl', '01844205137');

INSERT INTO Hospital ( name, address, phone_number)
VALUES('Good Health Hospital','8 Randolph Pl', '02099205137'),
	  ('Prayer And Protection Hospital','26 Picaddily Pl','01944205137');
      
      
-- Inserting Data into Departments
 INSERT INTO Department ( name, phone_number, Hospital_id)
VALUES('Cardiology','9876543210', '1'),
	 ('Orthopedics', '0987654321', 1),
	 ('Neurology', '02055511122', 6),
     ('Pediatrics','0799998887', 6);
     
-- Inserting Data into Departments without phone number
 INSERT INTO Department ( name, Hospital_id)
 VALUES
       ('Gynecology',1),
	   ('Dermatology',6),
	   ('Oncology', 7),
       ('A & E', 7);
      
-- Inserting Data into Staff_member
 INSERT INTO Staff_member ( FirstName, LastName, phone_number, Email_address, age, Role, clothes_size, department_id,  Hospital_id)
 VALUES
('John', 'Doe', '1234567890', 'john.doe@gmail.com', 30, 'Doctor', 'M', 11, 1),
('Jane', 'Smith', '9876543210', 'jane.smith@gmail.com', 35, 'Nurse', 'XL', 5, 1),
('Michael', 'Johnson', '5551112222', 'michael.johnson@yahoo.com', 28, 'Surgeon', 'L', 6, 6),
('Emily', 'Williams', '9998887777', 'emily.williams@yahoo.com', 25, 'Pediatrician', 'S', 7, 6),
('David', 'Brown', '1234567890', 'david.brown@gmail.com', 40, 'Anesthesiologist', 'XL', 8, 7),
('Sarah', 'Taylor', '9876543210', 'sarah.taylor@yahoo.com', 32, 'Physician Assistant', 'M', 7, 7),
('Matthew', 'Martinez', '5551112222', 'matthew.martinez@gmail.com', 29, 'Surgeon', 'M', 6, 6),
('Robert', 'Williams', '9876543210', 'robert.williams@gmail.com', 38, 'Nurse', 'L', 8, 1), 
('Emma', 'Brown', '5551112222', 'emma.brown@yahoo.com', 26, 'Cleaner', 'S', 9, 7),
('William', 'Jones', '9998887777', 'william.jones@yahoo.com', 31, 'Psychiatrist', 'XL', 10, 7);

-- Inserting Data into Staff_member without phone number
 INSERT INTO Staff_member ( FirstName, LastName, age, Role, clothes_size, department_id,  Hospital_id)
 VALUES
 ('Jessica', 'Anderson', 'jessica.anderson@yahoo.com', 27, 'Cardiologist', 'S', 5, 6),
 ('Alice', 'Johnson', 'alice.johnson@gmail.com', 33, 'Neurologist', 'M', 12, 1);
 
-- Update the professions
 UPDATE Staff_member
 SET role = 'Nurse'
 WHERE staff_id IN (15,20);
 
--  Insert into Shift_type ( name, Start_time, End_time, Hospital_id)
 INSERT INTO Shift_type ( name, Start_time, End_time, Hospital_id)
 VALUES
('Early Shift', '07:45:00', '16:15:00',1 ),
('Early Shift', '07:45:00', '16:15:00', 6 ),
('Early Shift', '07:45:00', '16:15:00', 7 ),
('Night Shift', '22:45:00', '08:45:00', 1 ),
('Night Shift', '22:45:00', '08:45:00', 6 ),
('Night Shift', '22:45:00', '08:45:00', 7 ),
('Late Shift', '15:15:00',  '23:45:00', 1 ),
('Late Shift', '15:15:00',  '23:45:00', 6 ),
('Late Shift', '15:15:00',  '23:45:00', 7 );

-- Insert Data for Staff_Schedule(hours_worked, Shift_date,staff_id, shift_type_id)

INSERT INTO Staff_Schedule (hours_worked, Shift_date,staff_id, shift_type_id)
VALUES
(8.5, '2024-03-27', 11, 1),
(8.5, '2024-03-25', 12, 1),
(10.0, '2024-03-26', 13, 5),
(8.5, '2024-03-28', 30, 2),
(8.5, '2024-03-29', 15, 9),
(8.5, '2024-03-30', 16, 3),
(8.5, '2024-03-31', 17, 2),
(8.5, '2024-03-27', 18, 1),
(8.5, '2024-03-25', 19, 9),
(8.5, '2024-03-26', 20, 3),
(8.5, '2024-03-28', 21, 1),
(8.5, '2024-03-29', 22, 1),
(10.0, '2024-03-30', 23, 5),
(10.0, '2024-03-31', 24, 6),
(8.5, '2024-03-27', 25, 3),
(8.5, '2024-03-25', 26, 9),
(10.0, '2024-03-26', 26, 6),
(10.0, '2024-03-28', 15, 6),
(8.5, '2024-03-25', 22, 1),
(8.5, '2024-03-30', 28, 1),
(8.5, '2024-03-31', 18, 1),
(8.5, '2024-03-27', 27, 3),
(8.5, '2024-03-27', 29, 9),
(10.0, '2024-03-27', 23, 5),
(8.5, '2024-03-27', 13, 2),
(8.5, '2024-03-27', 15, 9),
(8.5, '2024-03-27', 24, 8),
(10.0, '2024-03-27', 16, 6);

-- Updating Staff members last names and email address- realised I created a mistake
UPDATE Staff_member 
SET 
    LastName = CASE
        WHEN Staff_id = 11 THEN 'García'
        WHEN Staff_id = 12 THEN 'Dubois'
        WHEN Staff_id = 13 THEN 'Ivanov'
        WHEN Staff_id = 14 THEN 'Romano'
        WHEN Staff_id = 15 THEN 'Choi'
        WHEN Staff_id = 16 THEN 'Tanaka'
        WHEN Staff_id = 17 THEN 'Ahmed'
        WHEN Staff_id = 18 THEN 'Schneider'
        WHEN Staff_id = 19 THEN 'Wang'
        WHEN Staff_id = 20 THEN 'Kumar'
    END,
    Email_address = CASE
        WHEN Staff_id = 11 THEN 'john.García@gmail.com'
        WHEN Staff_id = 12 THEN 'jane.Dubois@gmail.com'
        WHEN Staff_id = 13 THEN 'michael.Ivanov@yahoo.com'
        WHEN Staff_id = 14 THEN 'emily.romano@yahoo.com'
        WHEN Staff_id = 15 THEN 'david.Choi@gmail.com'
        WHEN Staff_id = 16 THEN 'sarah.Tanaka@yahoo.com'
        WHEN Staff_id = 17 THEN 'matthew.Ahmed@gmail.com'
        WHEN Staff_id = 18 THEN 'robert.schneider@gmail.com'
        WHEN Staff_id = 19 THEN 'emma.wang@yahoo.com'
        WHEN Staff_id = 20 THEN 'william.kumar@yahoo.com'
    END
WHERE
    Staff_id BETWEEN 11 AND 20;

-- had to delete the info in staff schedule as I had made a decimal mistake
 DELETE FROM Staff_schedule;
