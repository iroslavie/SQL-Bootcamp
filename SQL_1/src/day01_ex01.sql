SELECT names.object_name FROM (SELECT pizza_name AS object_name, 'menu' AS identity FROM menu
     UNION ALL
     SELECT name AS object_name, 'person' AS identity FROM person
     ORDER BY identity DESC, object_name) AS names