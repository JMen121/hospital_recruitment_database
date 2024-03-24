
-- The Scenario
-- This is a hospital recruitment database of a local trust, consisting of 3 hospitals(if I have time). 
-- This will be focusing specifically on the Staff Members, Department, Shift-Time, Shift Schedule and Hospital(if i have time)
-- One hospital can have many departments



create database hospital_recruitment;

use hospital_recruitment;

create table Hospital(
Hospital_id Integer Not Null Primary Key,
Name Varchar(255) Not null,
Address VarChar(255) Not null,
phone_number Integer Not Null
);

-- Renamed Hospital to Hospitals because there are many hospitals
alter table Hospital rename Hospitals;


-- create table Departments(
-- Department_id Integer Not Null Primary Key,
-- name Varchar(155) Not null,
-- phone_number Integer,
-- Foreign Key (Hospital_id) References Hospital (Hospital_id)



-- );

-- FirstName varchar(50) NOT NULL,
-- LastName varchar(50) NOT NULL