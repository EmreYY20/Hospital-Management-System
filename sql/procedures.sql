CREATE OR REPLACE FUNCTION retrieve_doctors_with_departments()
RETURNS TABLE (forename VARCHAR, lastname VARCHAR, dep_name VARCHAR)
AS $$
BEGIN
    -- Retrieve the names of doctors along with the departments they are assigned to
    RETURN QUERY
    SELECT d.forename, d.lastname, dp.dep_name
    FROM doctor AS d
    JOIN department dp ON d.department = dp.dep_code;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION find_total_medicine_count()
RETURNS TABLE (total_count INTEGER)
AS $$
BEGIN
    -- Find the total count of medicines available in the database
    RETURN QUERY
    SELECT SUM(count) AS total_count
    FROM medicine;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION retrieve_patients_with_doctors()
RETURNS TABLE (patient_forename VARCHAR, patient_lastname VARCHAR, doctor_forename VARCHAR, doctor_lastname VARCHAR)
AS $$
BEGIN
    -- Retrieve the names of patients and their assigned doctors' names
    RETURN QUERY
    SELECT p.forename AS patient_forename, p.lastname AS patient_lastname, d.forename AS doctor_forename, d.lastname AS doctor_lastname
    FROM patient p
    JOIN doctor d ON p.assigned_doc = d.DID;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION list_nurses_with_assigned_patients()
RETURNS TABLE (forename VARCHAR, lastname VARCHAR, assigned_patients_count INTEGER)
AS $$
BEGIN
    -- List the nurses along with the number of assigned patients for each nurse
    RETURN QUERY
    SELECT n.forename, n.lastname, COUNT(p.PID) AS assigned_patients_count
    FROM nurse n
    LEFT JOIN patient p ON n.NID = p.assigned_doc
    GROUP BY n.NID, n.forename, n.lastname;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION retrieve_free_rooms()
RETURNS TABLE (room_number VARCHAR, capacity INTEGER)
AS $$
BEGIN
    -- Retrieve the rooms that are currently free and their capacities
    RETURN QUERY
    SELECT room_number, capacity
    FROM room
    WHERE free_of_it = 'yes';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION find_average_age_of_patients_by_doctor()
RETURNS TABLE (doctor_forename VARCHAR, doctor_lastname VARCHAR, average_age_of_patients FLOAT)
AS $$
BEGIN
    -- Find the average age of patients grouped by their assigned doctors
    RETURN QUERY
    SELECT d.forename, d.lastname, AVG(EXTRACT(YEAR FROM age(now(), p.date_of_birth))) AS average_age_of_patients
    FROM patient p
    JOIN doctor d ON p.assigned_doc = d.DID
    GROUP BY d.DID, d.forename, d.lastname;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION retrieve_surgeries_with_details()
RETURNS TABLE (SID INTEGER, treating_doctor_forename VARCHAR, treating_doctor_lastname VARCHAR, treated_patient_forename VARCHAR, treated_patient_lastname VARCHAR)
AS $$
BEGIN
    -- Retrieve the surgeries performed, including the details of the treating doctor and the treated patient
    RETURN QUERY
    SELECT s.SID, d.forename AS treating_doctor_forename, d.lastname AS treating_doctor_lastname,
           p.forename AS treated_patient_forename, p.lastname AS treated_patient_lastname
    FROM surgeries s
    JOIN doctor d ON s.treating_doc = d.DID
    JOIN patient p ON s.treated_pat = p.PID;
END;
$$ LANGUAGE plpgsql;

/* 
-- Query 1: Retrieve the names of doctors along with the departments they are assigned to
    SELECT * FROM retrieve_doctors_with_departments();
    
    -- Query 2: Find the total count of medicines available in the database
    SELECT * FROM find_total_medicine_count();
    
    -- Query 3: Retrieve the names of patients and their assigned doctors' names
    SELECT * FROM retrieve_patients_with_doctors();
    
    -- Query 4: List the nurses along with the number of assigned patients for each nurse
    SELECT * FROM list_nurses_with_assigned_patients();
    
    -- Query 5: Retrieve the rooms that are currently free and their capacities
    SELECT * FROM retrieve_free_rooms();
    
    -- Query 6: Find the average age of patients grouped by their assigned doctors
    SELECT * FROM find_average_age_of_patients_by_doctor();
    
    -- Query 7: Retrieve the surgeries performed, including the details of the treating doctor and the treated patient
    SELECT * FROM retrieve_surgeries_with_details();
*/