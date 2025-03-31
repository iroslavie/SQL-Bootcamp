SELECT pizzeria.name AS name, count(*) AS count_of_orders, round(avg(menu.price), 2) AS average_price,
       max(menu.price) AS max_price, min(menu.price) AS min_price
FROM pizzeria
INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
INNER JOIN person_order ON menu.id = person_order.menu_id
GROUP BY 1
ORDER BY 1