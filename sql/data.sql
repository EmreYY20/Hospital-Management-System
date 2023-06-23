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
       ('NICE', 'Nice Department'),
       ('None', 'None'),
       ('ONCO', 'Oncology'),
       ('OPHT', 'Ophthalmology'),
       ('RADI', 'Radiology'),
       ('RHEU', 'Rheumatology'),
       ('UROL', 'Urology');


INSERT INTO doctor (DID, forename, lastname, date_of_birth, address, phone_number, department, assigned_patients)
VALUES (1, 'Maxi', 'Musterarzt', '1990-07-18', 'Musterstr. 1, 12345 Frankfurt', '1756482', 'CARD', NULL),
       (6, 'Emre', 'Arzt', '2002-07-18', 'ABC Str.2, 67067 Lu', '147574447', 'CARD', NULL),
       (7, 'Emree', 'Arzt', '2001-09-04', 'Musterstr. 299, 67067 Lu', '11447', 'None', NULL);


INSERT INTO medicine (NDC, name, count)
VALUES ('1212', 'Ibuprofen', 5855),
       ('1224-5855-5225', 'Paracetamol', 44);


INSERT INTO nurse (NID, forename, lastname, address, phone_number, date_of_birth)
VALUES (1, 'Lisa', 'Mannometer', 'Im Zollhof 4, 67059 Ludwigshafen', '01478859742', '2000-07-02'),
       (2, 'Oma', 'Bertha', 'Musterstr. 83, 67067 Ludwigshafen', '014412534', '1920-01-01');


INSERT INTO patient (PID, forename, lastname, age_sex, date_of_birth, address, date_admitted, date_discharged, phone_number, assigned_doc)
VALUES (1, 'James', 'Brown', '21/M', '2001-07-18', 'Coblitzallee 1-9, 68163 Mannheim', '2023-05-16', '2023-05-16', '01761234567', 1),
       (2, 'Emre', 'Iyigün', '21/M', '2001-07-18', 'Musterstraße 2, 67067 Ludwigshafen', '2023-05-17', '2023-05-17', '0176855574', 6),
       (6, 'Nik', 'Yakovlev', '20/M', '2001-01-01', 'Musterstr.1, 68138 Mannheim', '2023-05-17', '2023-05-17', '017644458', 7),
       (7, 'Christian', 'Schmid', '20/M', '2001-02-01', 'Musterstr.2, 68138 Mannheim', '2023-05-17', '2023-05-28', '01764555', 1),
       (10, 'Amy', 'Lemy', '28/F', '1995-07-30', 'Musterstr. 23, 60308 Frankfurt', '2023-05-20', '2023-05-20', '012235874', 1),
       (11, 'Anna', 'Lisa', '22/F', '2000-11-15', 'Musterstr. 12, 10361 Berlin', '2023-05-20', '2023-05-20', '01223658', 6);


INSERT INTO room (room_number, capacity, free_of_it)
VALUES ('A001', 4, '3'),
       ('A002', 1, '1');
