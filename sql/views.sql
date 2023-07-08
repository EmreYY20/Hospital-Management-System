-- Simple View
CREATE OR REPLACE VIEW vw_patient_details AS
SELECT PID, forename, lastname, age_sex, address, date_admitted, date_discharged, phone_number, assigned_doc
FROM patient;


-- Materialized View
CREATE MATERIALIZED VIEW mv_doctor_patient_count AS
SELECT d.DID, d.forename, d.lastname, COUNT(p.PID) AS patient_count
FROM doctor d
LEFT JOIN patient p ON d.DID = p.assigned_doc
GROUP BY d.DID, d.forename, d.lastname;

-- Refresh the materialized view to populate initial data
REFRESH MATERIALIZED VIEW mv_doctor_patient_count;

