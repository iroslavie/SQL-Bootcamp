WITH counts_info AS (
SELECT person.name AS name, count(*) AS count_of_visits
FROM person
    INNER JOIN person_visits ON person.id = person_visits.person_id
    INNER JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
GROUP BY 1)
SELECT name, count_of_visits
FROM counts_info
WHERE count_of_visits > 3