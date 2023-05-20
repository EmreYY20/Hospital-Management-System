SELECT d.dep_code, d.dep_name, string_agg(doc.forename::text, ', ') AS doctors
FROM department d
LEFT JOIN doctor doc ON d.dep_code = doc.department
GROUP BY d.dep_code, d.dep_name;
