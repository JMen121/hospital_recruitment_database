
-- The Scenario
-- This is a hospital recruitment database of a local trust, consisting of 3 hospitals(if I have time). 
-- This will be focusing specifically on the Staff Members, Department, Shift-Time, Shift Schedule and Hospital(if i have time)
-- One hospital can have many departments

create database hospital_recruitment;

use hospital_recruitment;

-- Table for Hospital
create table Hospital(
Hospital_id Integer Auto_increment Primary Key,
Name Varchar(255) Not null,
Address VarChar(255) Not null,
phone_number Integer Not Null
);

-- Table for Department
create table Department(
Department_id Integer Auto_increment Primary Key,
Name Varchar(155) Not null,
Phone_number Integer,
Hospital_id Integer Not Null,
Foreign Key (Hospital_id) References Hospital (Hospital_id),
Unique (Phone_number)
);

-- Table for Staff members 
create table Staff_Member(
Staff_id Integer Auto_increment Primary key,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Phone_number Integer Not Null, 
Email_address VarChar(255),
Age int not null check (age>=18),
Role varchar(155),
Clothes_size varchar(10),
Department_id Integer Not Null,
Hospital_id Integer Not Null,
Foreign Key (Department_id) References Department (Department_id),
Foreign Key (Hospital_id) References Hospital (Hospital_id)
);

-- Table for Shift_type
create table Shift_type(
Shift_type_id Integer Auto_increment Primary Key,
name varchar(100),
Start_time time,
End_time time,
Hospital_id Integer Not Null,
Foreign Key (Hospital_id) References Hospital (Hospital_id)
); 

-- Table for Staff_Schedule
create table Staff_schedule(
Staff_schedule_id Integer Auto_increment Primary Key,
Staff_id Integer Not Null,
Shift_type_id Integer Not Null,
Hours_worked decimal,
Shift_Date Date,
Foreign Key (Shift_type_id) References Shift_type(Shift_type_id),
Foreign Key (Staff_id) References Staff_Member(Staff_id)
);

-- Had to alter the table in order for the decimals to appear on the table
Alter Table staff_schedule 
Modify Column hours_worked decimal (5,2);


-- Inserting into Hospital 

Insert into Hospital ( name, address, phone_number)
Values('Highlands Medical','5 Market Pl', '01844205137');

Insert into Hospital ( name, address, phone_number)
Values('Good Health Hospital','8 Randolph Pl', '02099205137'),
	  ('Prayer And Protection Hospital','26 Picaddily Pl','01944205137');
      
      
-- Inserting Data into Departments
 Insert into Department ( name, phone_number, Hospital_id)
Values('Cardiology','9876543210', '1'),
	 ('Orthopedics', '0987654321', 1),
	 ('Neurology', '02055511122', 6),
     ('Pediatrics','0799998887', 6);
     
-- Inserting Data into Departments without phone number
 Insert into Department ( name, Hospital_id)
 Values
       ('Gynecology',1),
	   ('Dermatology',6),
	   ('Oncology', 7),
       ('A & E', 7);
      
-- Inserting Data into Staff_member
 Insert into Staff_member ( FirstName, LastName, phone_number, Email_address, age, Role, clothes_size, department_id,  Hospital_id)
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
 Insert into Staff_member ( FirstName, LastName, age, Role, clothes_size, department_id,  Hospital_id)
 VALUES
 ('Jessica', 'Anderson', 'jessica.anderson@yahoo.com', 27, 'Cardiologist', 'S', 5, 6),
 ('Alice', 'Johnson', 'alice.johnson@gmail.com', 33, 'Neurologist', 'M', 12, 1);
 
-- Update the professions
 update Staff_member
 set role = 'Nurse'
 Where staff_id IN (15,20);
 
--  Insert into Shift_type ( name, Start_time, End_time, Hospital_id)
 Insert into Shift_type ( name, Start_time, End_time, Hospital_id)
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

-- Deleting shifts that are night or late in hospital 1
Delete from shift_type where (name = 'Night shift' OR name = 'late shift') and Hospital_id = 1;

-- Insert Data for Staff_Schedule(hours_worked, Shift_date,staff_id, shift_type_id)

Insert into Staff_Schedule (hours_worked, Shift_date,staff_id, shift_type_id)
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

-- had to delete the info in staff schedule as I had made a decimal mistake
 delete from staff_schedule;
