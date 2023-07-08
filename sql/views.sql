-- Simple View
-- This view retrieves the details of doctors from the doctor table.
-- It includes their ID, forename, lastname, date_of_birth, address, phone_number, department, and assigned_patients.
CREATE VIEW vw_doctor_details AS
SELECT DID, forename, lastname, date_of_birth, address, phone_number, department, assigned_patients
FROM doctor;

-- Materialized View
-- This materialized view calculates the patient count for each doctor.
-- It retrieves the doctor's ID, forename, lastname, and the number of patients assigned to them.
-- The patient count is obtained by performing a left join between the doctor and patient tables, and then grouping the results by the doctor's ID, forename, and lastname.
-- The materialized view stores the computed result, allowing for faster query execution and reduced overhead on subsequent queries.
CREATE MATERIALIZED VIEW mv_doctor_patient_count AS
SELECT d.DID, d.forename, d.lastname, COUNT(p.PID) AS patient_count
FROM doctor d
LEFT JOIN patient p ON d.DID = p.assigned_doc
GROUP BY d.DID, d.forename, d.lastname;

-- Refresh the materialized view to populate initial data
-- This statement refreshes the materialized view, updating the stored data based on the underlying tables.
-- It ensures that the materialized view contains the most up-to-date information.
REFRESH MATERIALIZED VIEW mv_doctor_patient_count;
