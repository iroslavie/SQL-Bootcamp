SELECT pizzeria.name
FROM menu
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
INNER JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
INNER JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Dmitriy' AND menu.price < 800 AND person_visits.visit_date = '2022-01-08'
