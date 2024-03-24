
-- The Scenario
-- This is a hospital recruitment database of a local trust, consisting of 3 hospitals(if I have time). 
-- This will be focusing specifically on the Staff Members, Department, Shift-Time, Shift Schedule and Hospital(if i have time)
-- One hospital can have many departments



create database hospital_recruitment;

use hospital_recruitment;

create table Hospital(
Hospital_id Integer Not Null,
Hospital_Name varchar(255) Not null,
Location varChar(255) Not null,
);
-- FirstName varchar(50) NOT NULL,
-- LastName varchar(50) NOT NULL