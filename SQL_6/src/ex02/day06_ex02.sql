SELECT person.name, menu.pizza_name, menu.price,
       (menu.price * ((100 - person_discounts.discount) / 100)) AS discount_price,
       pizzeria.name AS pizzeria_name
FROM person_order
INNER JOIN person ON person_order.person_id = person.id
INNER JOIN menu ON person_order.menu_id = menu.id
INNER JOIN person_discounts ON person.id = person_discounts.person_id AND menu.pizzeria_id = person_discounts.pizzeria_id
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1, 2