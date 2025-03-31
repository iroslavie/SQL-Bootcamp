SELECT first_person_names.name AS person_name1, second_person_names.name AS person_name2, first_person_names.address AS common_address
FROM person AS first_person_names
INNER JOIN person AS second_person_names ON first_person_names.id > second_person_names.id AND first_person_names.address = second_person_names.address
ORDER BY 1,2,3