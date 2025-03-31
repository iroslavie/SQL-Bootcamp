SELECT person.name, count_of_visits
FROM person
    INNER JOIN (SELECT person_id, count(*) AS count_of_visits
FROM person_visits
GROUP BY person_id) count_vis ON person.id = count_vis.person_id
ORDER BY count_of_visits DESC
LIMIT 4