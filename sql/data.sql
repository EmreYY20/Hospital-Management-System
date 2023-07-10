INSERT INTO department (dep_code, dep_name)
VALUES ('ACEM', 'Accident and emergency (A&E)'),
       ('ANES', 'Anesthetics'),
       ('CARD', 'Cardiology'),
       ('ENTH', 'Ear, nose and throat'),
       ('GAST', 'Gastroenterology'),
       ('GESE', 'General Services'),
       ('GYNE', 'Gynecology'),
       ('HEMA', 'Hematology'),
       ('NEUR', 'Neurology'),
       ('ONCO', 'Oncology'),
       ('OPHT', 'Ophthalmology'),
       ('RADI', 'Radiology'),
       ('RHEU', 'Rheumatology'),
       ('UROL', 'Urology');


INSERT INTO doctor (DID, forename, lastname, date_of_birth, address, phone_number, department, assigned_patients)
VALUES  (1, 'John', 'Doe', '1985-03-12', '123 Main St, Cityville', '555-1234', 'GESE', NULL),
        (2, 'Jane', 'Smith', '1992-09-28', '456 Elm St, Townsville', '555-5678', 'NEUR', NULL),
        (3, 'Michael', 'Johnson', '1978-06-15', '789 Oak Ave, Villageton', '555-2468', 'RHEU', NULL),
        (4, 'Emily', 'Davis', '1989-12-03', '321 Pine Rd, Hamletown', '555-9876', 'CARD', NULL),
        (5, 'David', 'Taylor', '1995-04-21', '987 Cedar Ln, Boroughville', '555-1357', 'NEUR', NULL),
        (6, 'Sarah', 'Anderson', '1982-11-07', '654 Birch Dr, Townsville', '555-3698', 'GESE', NULL),
        (7, 'Christopher', 'Wilson', '1976-08-29', '789 Elm St, Cityville', '555-2468', 'GESE', NULL),
        (8, 'Jessica', 'Miller', '1990-02-16', '987 Oak Ave, Villageton', '555-7531', 'ONCO', NULL),
        (9, 'Matthew', 'Brown', '1987-05-08', '321 Main St, Hamletown', '555-8642', 'GYNE', NULL),
        (10, 'Olivia', 'Lee', '1998-11-24', '654 Pine Rd, Boroughville', '555-9514', 'CARD', NULL),
        (11, 'Andrew', 'Garcia', '1979-07-17', '123 Cedar Ln, Townsville', '555-2587', 'ONCO', NULL),
        (12, 'Elizabeth', 'Lopez', '1993-01-31', '456 Birch Dr, Cityville', '555-3698', 'ENTH', NULL),
        (13, 'Daniel', 'Clark', '1984-10-22', '789 Elm St, Villageton', '555-7531', 'ANES', NULL),
        (14, 'Ava', 'Rodriguez', '1991-06-06', '987 Oak Ave, Hamletown', '555-9876', 'RADI', NULL),
        (15, 'Sophia', 'Martinez', '1977-03-19', '321 Main St, Boroughville', '555-1357', 'ENTH', NULL),
        (16, 'Joseph', 'Hernandez', '1996-09-12', '654 Pine Rd, Townsville', '555-3698', 'CARD', NULL),
        (17, 'Mia', 'Gonzalez', '1983-05-26', '123 Cedar Ln, Cityville', '555-7531', 'UROL', NULL),
        (18, 'William', 'Perez', '1975-02-09', '456 Birch Dr, Villageton', '555-8642', 'GESE', NULL),
        (19, 'Emily', 'Turner', '1994-08-02', '789 Elm St, Hamletown', '555-2587', 'GAST', NULL),
        (20, 'Ethan', 'Adams', '1988-04-14', '987 Oak Ave, Boroughville', '555-9514', 'GESE', NULL);


INSERT INTO medicine (NDC, name, count)
VALUES  ('1001', 'Aspirin', 100),
        ('2002', 'Amoxicillin', 500),
        ('3003', 'Lisinopril', 250),
        ('4004', 'Simvastatin', 300),
        ('5005', 'Metformin', 200),
        ('6006', 'Atorvastatin', 150),
        ('7007', 'Levothyroxine', 400),
        ('8008', 'Losartan', 350),
        ('9009', 'Omeprazole', 450),
        ('1010', 'Citalopram', 175);


INSERT INTO nurse (NID, forename, lastname, address, phone_number, date_of_birth)
VALUES  (1, 'Lisa', 'Johnson', '123 Elm Street, Anytown, USA', '555-1234', '1990-01-01'),
        (2, 'Emily', 'Smith', '456 Oak Street, Othertown, USA', '555-5678', '1995-02-15'),
        (3, 'Sarah', 'Davis', '789 Maple Street, Somewhere, USA', '555-9876', '1988-07-10'),
        (4, 'Olivia', 'Wilson', '321 Pine Street, Anyplace, USA', '555-4321', '1992-04-20'),
        (5, 'Sophia', 'Taylor', '543 Cedar Street, Nowhere, USA', '555-8765', '1985-09-05'),
        (6, 'Emma', 'Miller', '876 Birch Street, Anytown, USA', '555-3456', '1998-03-15'),
        (7, 'Ava', 'Anderson', '987 Spruce Street, Othertown, USA', '555-7890', '1993-06-12'),
        (8, 'Mia', 'Thomas', '654 Pine Street, Somewhere, USA', '555-6543', '1991-11-25'),
        (9, 'Abigail', 'Harris', '432 Oak Street, Anyplace, USA', '555-9876', '1987-08-30'),
        (10, 'Lily', 'Jones', '789 Cedar Street, Nowhere, USA', '555-2345', '1996-02-05');


INSERT INTO patient (PID, forename, lastname, age, sex, date_of_birth, address, date_admitted, date_discharged, phone_number, assigned_doc)
VALUES (1, 'John', 'Smith', 30, 'M', '1993-05-10', '123 Main Street, New York', '2023-05-16', '2023-05-18', '555-1234', 1),
       (2, 'Emily', 'Johnson', 28, 'F', '1995-08-12', '456 Elm Street, Los Angeles', '2023-05-17', '2023-05-19', '555-5678', 2),
       (3, 'Michael', 'Williams', 35, 'M', '1988-02-20', '789 Oak Street, Chicago', '2023-05-18', '2023-05-21', '555-7890', 8),
       (4, 'Emma', 'Jones', 27, 'F', '1996-07-05', '234 Maple Avenue, Houston', '2023-05-19', '2023-05-21', '555-4321', 6),
       (5, 'William', 'Brown', 32, 'M', '1991-11-15', '567 Pine Street, Miami', '2023-05-20', '2023-05-23', '555-8765', 6),
       (6, 'Olivia', 'Davis', 25, 'F', '1998-04-22', '890 Cedar Lane, Seattle', '2023-05-21', '2023-05-23', '555-9876', 1),
       (7, 'James', 'Miller', 29, 'M', '1994-09-30', '345 Oak Street, Atlanta', '2023-05-22', '2023-05-24', '555-2345', 5),
       (8, 'Sophia', 'Wilson', 26, 'F', '1997-03-18', '678 Elm Street, Boston', '2023-05-23', '2023-05-25', '555-6789', 2),
       (9, 'Alexander', 'Anderson', 31, 'M', '1992-06-28', '901 Maple Avenue, San Francisco', '2023-05-24', '2023-05-27', '555-3456', 3),
       (10, 'Isabella', 'Taylor', 24, 'F', '1999-01-08', '123 Pine Street, Dallas', '2023-05-25', '2023-05-27', '555-7890', 1),
       (11, 'Daniel', 'Martin', 33, 'M', '1990-09-05', '456 Oak Street, Washington D.C.', '2023-05-26', '2023-05-28', '555-2345', 2),
       (12, 'Mia', 'Thompson', 23, 'F', '2000-02-14', '789 Cedar Lane, Philadelphia', '2023-05-27', '2023-05-30', '555-6789', 3),
       (13, 'David', 'Garcia', 28, 'M', '1995-05-01', '234 Maple Avenue, Phoenix', '2023-05-28', '2023-05-30', '555-1234', 7),
       (14, 'Ava', 'Martinez', 26, 'F', '1997-10-11', '567 Pine Street, San Diego', '2023-05-29', '2023-06-01', '555-5678', 2),
       (15, 'Joseph', 'Robinson', 30, 'M', '1993-03-23', '890 Cedar Lane, Denver', '2023-05-30', '2023-06-01', '555-7890', 11),
       (16, 'Sofia', 'Clark', 25, 'F', '1998-08-08', '345 Oak Street, Las Vegas', '2023-05-31', '2023-06-03', '555-4321', 8),
       (17, 'Christopher', 'Rodriguez', 29, 'M', '1994-01-17', '678 Elm Street, Orlando', '2023-06-01', '2023-06-03', '555-8765', 2),
       (18, 'Abigail', 'Lee', 27, 'F', '1996-06-27', '901 Maple Avenue, Nashville', '2023-06-02', '2023-06-05', '555-9876', 13),
       (19, 'Andrew', 'Walker', 32, 'M', '1991-12-13', '123 Pine Street, Austin', '2023-06-03', '2023-06-05', '555-2345', 4),
       (20, 'Madison', 'Hall', 24, 'F', '1999-07-26', '456 Oak Street, San Antonio', '2023-06-04', '2023-06-07', '555-6789', 2);


INSERT INTO room (room_number, capacity, free_of_it)
VALUES  ('None', 0, '0'),
        ('A001', 4, '3'),
        ('A002', 1, '1'),
        ('A003', 2, '2'),
        ('A004', 3, '2'),
        ('A005', 1, '1'),
        ('A006', 2, '2'),
        ('A007', 4, '3'),
        ('A008', 1, '1'),
        ('A009', 3, '2'),
        ('A010', 2, '2'),
        ('A011', 1, '1'),
        ('A012', 4, '3'),
        ('A013', 3, '2');


INSERT INTO surgeries (SID, surgery_room, treating_doc, treated_pat)
VALUES (1, '02', 1, 1);
