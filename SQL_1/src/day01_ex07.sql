SELECT order_date, person.name || '(age:'|| person.age || ')'  AS person_information FROM person JOIN
(SELECT person_order.order_date, person_order.person_id FROM person_order) AS tabl ON tabl.person_id = person.id
ORDER BY order_date, person_information