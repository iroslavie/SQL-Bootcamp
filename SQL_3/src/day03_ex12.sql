INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
    persons + (SELECT max(id) FROM person_order) AS id,
    person.id AS person_id,
    (SELECT id FROM menu WHERE menu.pizza_name = 'greek pizza') AS menu_id,
    '2022-02-25' AS order_date
FROM person INNER JOIN generate_series(1, (SELECT count(*) FROM person)) AS persons ON persons = person.id