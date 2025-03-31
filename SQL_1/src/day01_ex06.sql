SELECT action_date, person.name AS person_name FROM person JOIN
(SELECT person_order.order_date AS action_date, person_order.person_id FROM person_order
INTERSECT
SELECT person_visits.visit_date, person_visits.person_id FROM person_visits) AS tabl ON tabl.person_id = person.id
ORDER BY action_date, person_name DESC