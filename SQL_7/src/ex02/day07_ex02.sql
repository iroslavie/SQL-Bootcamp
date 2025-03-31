(SELECT pizzeria.name, count, 'visit' AS action_type
 FROM pizzeria
 INNER JOIN (SELECT pizzeria_id, count(*) AS count
             FROM person_visits
             GROUP BY person_visits.pizzeria_id) AS pers_vis ON pizzeria.id = pers_vis.pizzeria_id
 ORDER BY 2 DESC
 LIMIT 3)
UNION
(SELECT pizzeria.name, count(*) AS count, 'order' AS action_type
 FROM pizzeria
 INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
 INNER JOIN person_order ON menu.id = person_order.menu_id
 GROUP BY pizzeria.name
 ORDER BY 2 DESC
 LIMIT 3)
ORDER BY 3, 2 DESC