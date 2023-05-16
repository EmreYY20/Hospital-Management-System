-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.medicine
(
    drug_code character varying(255) NOT NULL,
    count integer NOT NULL
);

CREATE TABLE IF NOT EXISTS public.patient
(
    "PID" smallint NOT NULL,
    forename character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    "age/sex" character varying(10) NOT NULL,
    date_of_birth date NOT NULL,
    address character varying(255),
    date_admitted date NOT NULL,
    date_discharged date NOT NULL,
    phone_number character varying(25),
    PRIMARY KEY ("PID")
);

CREATE TABLE IF NOT EXISTS public.doctor
(
    "DID" smallint NOT NULL,
    forename character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    date_of_birth date NOT NULL,
    address character varying(255) NOT NULL,
    phone_number character varying(25) NOT NULL,
    PRIMARY KEY ("DID")
);

CREATE TABLE IF NOT EXISTS public.room
(
    room_number character varying(255) NOT NULL,
    capacity integer,
    status character varying
);

CREATE TABLE IF NOT EXISTS public.nurse
(
    "NID" smallint NOT NULL,
    forename character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    phone_number character varying(25) NOT NULL,
    PRIMARY KEY ("NID")
);

CREATE TABLE IF NOT EXISTS public.record
(
    "RECID" smallint NOT NULL,
    PRIMARY KEY ("RECID")
);

CREATE TABLE IF NOT EXISTS public.department
(
    dep_code character varying(10) NOT NULL,
    dep_name character varying(255) NOT NULL,
    PRIMARY KEY (dep_code)
);
END;