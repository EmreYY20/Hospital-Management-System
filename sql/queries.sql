-- 1. Query: Retrieve the names of doctors along with the departments they are assigned to
-- Description: This query retrieves the names of doctors and their corresponding departments.
SELECT d.forename, d.lastname, dp.dep_name
FROM doctor AS d
JOIN department dp ON d.department = dp.dep_code;

-- 2. Query: Find the total count of medicines available in the database
-- Description: This query calculates the total count of medicines available in the database.
SELECT SUM(count) AS total_count
FROM medicine;

-- 3. Query: Retrieve the names of patients and their assigned doctors' names
-- Description: This query retrieves the names of patients and their assigned doctors' names.
SELECT p.forename AS patient_forename, p.lastname AS patient_lastname, d.forename AS doctor_forename, d.lastname AS doctor_lastname
FROM patient p
JOIN doctor d ON p.assigned_doc = d.DID;

-- 4. Query: List the nurses along with the number of assigned patients for each nurse
-- Description: This query lists the nurses along with the number of assigned patients for each nurse.
SELECT n.forename, n.lastname, COUNT(p.PID) AS assigned_patients_count
FROM nurse n
LEFT JOIN patient p ON n.NID = p.assigned_doc
GROUP BY n.NID, n.forename, n.lastname;

-- 5. Query: Retrieve the rooms that are currently free and their capacities
-- Description: This query retrieves the rooms that are currently free and their capacities.
SELECT room_number, capacity
FROM room
WHERE free_of_it = 'yes';

-- 6. Query: Find the average age of patients grouped by their assigned doctors
-- Description: This query calculates the average age of patients grouped by their assigned doctors.
SELECT d.forename, d.lastname, AVG(EXTRACT(YEAR FROM age(now(), p.date_of_birth))) AS average_age_of_patients
FROM patient p
JOIN doctor d ON p.assigned_doc = d.DID
GROUP BY d.DID, d.forename, d.lastname;

-- 7. Query: Retrieve the surgeries performed, including the details of the treating doctor and the treated patient
-- Description: This query retrieves the surgeries performed, including the details of the treating doctor and the treated patient.
SELECT s.SID, d.forename AS treating_doctor_forename, d.lastname AS treating_doctor_lastname, p.forename AS treated_patient_forename, p.lastname AS treated_patient_lastname
FROM surgeries s
JOIN doctor d ON s.treating_doc = d.DID
JOIN patient p ON s.treated_pat = p.PID;

-- 8. Query: Get all underage patients (age < 18)
-- Description: This query retrieves all underage patients (age < 18) from the Patient table.
SELECT *
FROM Patient
WHERE CAST(SPLIT_PART(age_sex, '/', 1) AS INTEGER) < 18;

-- 9. Query: Medicines with Low Stock
-- Description: This query retrieves the medicines where the stock count is less than 10 and require reloading.
SELECT NDC, name, count
FROM medicine
WHERE count < 10;

-- 10. Query: Patients with Multiple Admissions
-- Description: This query retrieves the patients who have been admitted to the hospital multiple times. It provides insights into recurring hospital visits and patient readmissions.
SELECT p.forename, p.lastname, COUNT(DISTINCT p.date_admitted) AS admission_count
FROM patient p
GROUP BY p.forename, p.lastname
HAVING COUNT(DISTINCT p.date_admitted) > 1;

-- 11. Query: Total Number of Assigned Patients by Department
-- Description: This query calculates the total number of assigned patients for each department. It provides the overall patient workload distribution across departments.
SELECT dp.dep_name, SUM(d.assigned_patients) AS total_assigned_patients
FROM department dp
JOIN doctor d ON dp.dep_code = d.department
GROUP BY dp.dep_name
ORDER BY total_assigned_patients DESC;