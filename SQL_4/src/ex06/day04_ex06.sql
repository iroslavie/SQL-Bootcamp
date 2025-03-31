CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
    SELECT pizzeria.name AS pizzeria_name
    FROM (SELECT person_id, pizzeria_id, visit_date
          FROM person_visits) my_visits
    INNER JOIN (SELECT * FROM person WHERE name IN ('Dmitriy')) dima_info ON dima_info.id = my_visits.person_id
    INNER JOIN pizzeria ON pizzeria.id = my_visits.pizzeria_id
    INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
    WHERE menu.price < 800 AND my_visits.visit_date = '2022-01-08'