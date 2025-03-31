SELECT menu.pizza_name, menu.price, pizzeria.name
FROM (SELECT menu.id FROM menu
      EXCEPT
      SELECT person_order.menu_id FROM person_order) AS dont_buy
INNER JOIN menu ON dont_buy.id = menu.id
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
ORDER BY 1, 2