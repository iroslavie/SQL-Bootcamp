WITH ord_and_vis AS (
(SELECT pizzeria.name AS name, count, 'visit' AS action_type
FROM pizzeria
INNER JOIN (SELECT pizzeria_id, count(*) AS count
             FROM person_visits
             GROUP BY person_visits.pizzeria_id) pers_vis ON pizzeria.id = pers_vis.pizzeria_id)
UNION
(SELECT pizzeria.name AS name, count(*) AS count, 'order' AS action_type
FROM pizzeria
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_order ON menu.id = person_order.menu_id
GROUP BY pizzeria.name))

SELECT name, SUM(count) AS total_count
FROM ord_and_vis
GROUP BY name
ORDER BY total_count DESC, name