SELECT all_menu.pizza_name, pizzeria.name AS pizzeria_name, all_menu.price
FROM (SELECT * FROM menu) AS all_menu
INNER JOIN pizzeria ON all_menu.pizzeria_id = pizzeria.id
WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza')
ORDER BY 1, 2