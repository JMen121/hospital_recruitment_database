
-- The Scenario
-- This is a hospital recruitment database of a local trust, consisting of 3 hospitals(if I have time). 
-- This will be focusing specifically on the Staff Members, Department, Shift-Time, Shift Schedule and Hospital(if i have time)
-- One hospital can have many departments

create database hospital_recruitment;

use hospital_recruitment;

-- Table for Hospitals 
create table Hospital(
Hospital_id Integer Not Null Primary Key,
Name Varchar(255) Not null,
Address VarChar(255) Not null,
phone_number Integer Not Null
);

-- Renamed Hospital to Hospitals because there are many hospitals
alter table Hospital rename Hospitals;

-- Table for Departments
create table Departments(
Department_id Integer Not Null Primary Key,
Name Varchar(155) Not null,
Phone_number Integer,
Hospital_id Integer Not Null,
Constraint Hospital_id Foreign Key (Hospital_id) References Hospitals (Hospital_id),
Unique (Phone_number)
);

-- Table for Staff members 
create table Staff_Members(
Staff_id Integer Not Null,
FirstName varchar(50) NOT NULL,
LastName varchar(50) NOT NULL,
Phone_number Integer Not Null,
Email_address VarChar(255),
Age int not null check (age>=18),
Role varchar(155),
Clothes_size varchar(10),
Department_id Integer Not Null,
Hospital_id Integer Not Null,
Foreign Key (Department_id) References Departments (Department_id),
Foreign Key (Hospital_id) References Hospitals (Hospital_id)
);

