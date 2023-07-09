-- Add primary keys using ALTER TABLE statements

ALTER TABLE department
    ADD PRIMARY KEY (dep_code);

ALTER TABLE doctor
    ADD PRIMARY KEY (DID);

ALTER TABLE medicine
    ADD PRIMARY KEY (NDC);

ALTER TABLE nurse
    ADD PRIMARY KEY (NID);

ALTER TABLE patient
    ADD PRIMARY KEY (PID);

ALTER TABLE room
    ADD PRIMARY KEY (room_number);

ALTER TABLE treatment
    ADD PRIMARY KEY (treatment_id);

ALTER TABLE patient_treatment
    ADD PRIMARY KEY (PTID);

ALTER TABLE surgeries
    ADD PRIMARY KEY (SID);


-- Add foreign keys using ALTER TABLE statements

ALTER TABLE doctor
    ADD CONSTRAINT fk_doctor_department
    FOREIGN KEY (department) REFERENCES department (dep_code)
    ON UPDATE CASCADE
    ON DELETE NO ACTION;

ALTER TABLE patient
    ADD CONSTRAINT fk_patient_doctor
    FOREIGN KEY (assigned_doc) REFERENCES doctor (DID)
    ON UPDATE CASCADE
    ON DELETE NO ACTION;

ALTER TABLE patient
    ADD CONSTRAINT fk_patient_room
    FOREIGN KEY (assigned_room) REFERENCES room (room_number)
    ON UPDATE CASCADE
    ON DELETE NO ACTION;

/*
ALTER TABLE medicine
    ADD CONSTRAINT fk_medicine_patient
    FOREIGN KEY (patient_id) REFERENCES patient (PID)
    ON UPDATE CASCADE
    ON DELETE NO ACTION;
*/

ALTER TABLE room_treatment
    ADD CONSTRAINT fk_room_treatment_room
    FOREIGN KEY (room_number) REFERENCES room (room_number)
    ON UPDATE CASCADE
    ON DELETE NO ACTION;

ALTER TABLE room_treatment
    ADD CONSTRAINT fk_room_treatment_treatment
    FOREIGN KEY (treatment_id) REFERENCES treatment (treatment_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION;

ALTER TABLE surgeries
    ADD CONSTRAINT fk_surgery_room
    FOREIGN KEY (room_number) REFERENCES room (room_number)
    ON UPDATE CASCADE
    ON DELETE NO ACTION;

ALTER TABLE patient_treatment
    ADD CONSTRAINT fk_patient_treatment_patient
    FOREIGN KEY (patient_id) REFERENCES patient (PID)
    ON UPDATE CASCADE
    ON DELETE NO ACTION;

ALTER TABLE patient_treatment
    ADD CONSTRAINT fk_patient_treatment_treatment
    FOREIGN KEY (treatment_id) REFERENCES treatment (treatment_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION;