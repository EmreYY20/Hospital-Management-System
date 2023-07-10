CREATE TABLE IF NOT EXISTS department (
    dep_code VARCHAR(10) NOT NULL,
    dep_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS doctor (
    DID SERIAL NOT NULL,
    forename VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(25) NOT NULL,
    department VARCHAR(10) NOT NULL,
    assigned_patients INTEGER
);

CREATE TABLE IF NOT EXISTS medicine (
    NDC VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    count INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS nurse (
    NID SERIAL NOT NULL,
    forename VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(25) NOT NULL,
    date_of_birth DATE NOT NULL,
    governing_room INTEGER
);

CREATE TABLE IF NOT EXISTS patient (
    PID SERIAL NOT NULL,
    forename VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    age INTEGER NOT NULL,
    sex CHAR(1) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(255) NOT NULL,
    date_admitted DATE NOT NULL,
    date_discharged DATE,
    phone_number VARCHAR(25) NOT NULL,
    assigned_doc INTEGER,
    assigned_room VARCHAR(5)
);

CREATE TABLE IF NOT EXISTS room (
    room_number VARCHAR(5) NOT NULL,
    capacity INTEGER NOT NULL,
    free_of_it VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS treatment (
    treatment_id SERIAL NOT NULL,
    treatment_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS patient_treatment (
    PTID SERIAL NOT NULL,
    patient_id INTEGER NOT NULL,
    treatment_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS room_treatment (
    RTID SERIAL NOT NULL,
    room_number VARCHAR(255) NOT NULL,
    treatment_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS surgeries (
    SID SERIAL NOT NULL,
    surgery_room INTEGER NOT NULL,
    treating_doc INTEGER NOT NULL,
    treated_pat INTEGER NOT NULL,
    room_number VARCHAR(255)
);