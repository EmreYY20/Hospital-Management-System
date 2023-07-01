CREATE TABLE IF NOT EXISTS department
(
    dep_code VARCHAR(10) NOT NULL,
    dep_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (dep_code)
);

CREATE TABLE IF NOT EXISTS doctor
(
    DID SERIAL NOT NULL,
    forename VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(25) NOT NULL,
    department VARCHAR,
    assigned_patients INTEGER,
    PRIMARY KEY (DID)
);

CREATE TABLE IF NOT EXISTS medicine
(
    NDC VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    count INTEGER NOT NULL,
    PRIMARY KEY (NDC)
);

CREATE TABLE IF NOT EXISTS nurse
(
    NID SERIAL NOT NULL,
    forename VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(25) NOT NULL,
    date_of_birth DATE,
    PRIMARY KEY (NID)
);

CREATE TABLE IF NOT EXISTS patient
(
    PID SERIAL NOT NULL,
    forename VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    age_sex VARCHAR(10) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(255),
    date_admitted DATE NOT NULL,
    date_discharged DATE,
    phone_number VARCHAR(25),
    assigned_doc INTEGER,
    PRIMARY KEY (PID)
);

CREATE TABLE IF NOT EXISTS room
(
    room_number VARCHAR(255) NOT NULL,
    capacity INTEGER,
    free_of_it VARCHAR,
    PRIMARY KEY (room_number)
);

CREATE TABLE IF NOT EXISTS surgeries (
  SID smallserial NOT NULL,
  surgery_room integer NOT NULL,
  treating_doc integer NOT NULL,
  treated_pat integer NOT NULL,
  PRIMARY KEY (SID)
);

ALTER TABLE doctor
    ADD CONSTRAINT department FOREIGN KEY (department)
    REFERENCES department (dep_code)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE patient
    ADD CONSTRAINT did FOREIGN KEY (assigned_doc)
    REFERENCES doctor (DID)
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;
