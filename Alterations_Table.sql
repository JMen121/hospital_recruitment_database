-- Changes made whilst editing table

-- Renamed Hospital to Hospitals because there are many hospitals
alter table Hospital rename Hospitals;

-- Change data type in Hospitals table
ALTER TABLE Hospitals MODIFY Phone_number VARCHAR(20) NOT NULL;

-- Change data type in Departments table
ALTER TABLE Departments MODIFY Phone_number VARCHAR(20);

-- Change data type in Staff_Members table
ALTER TABLE Staff_Members MODIFY Phone_number VARCHAR(20) NOT NULL;


-- Add foreign key constraint in Staff_Members table
ALTER TABLE Staff_Members ADD CONSTRAINT fk_hospital_id FOREIGN KEY (Hospital_id) REFERENCES Hospitals(Hospital_id);

-- Add foreign key constraint in Shift_type table
ALTER TABLE Shift_type ADD CONSTRAINT fk_hospital_id_shift FOREIGN KEY (Hospital_id) REFERENCES Hospitals(Hospital_id);
