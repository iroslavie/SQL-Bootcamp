SELECT menu1.pizza_name, pizzeria1.name AS pizzeria_name1, pizzeria2.name AS pizzeria_name2, menu1.price
FROM menu AS menu1
INNER JOIN menu AS menu2
    ON menu1 <> menu2
    AND menu1.price = menu2.price
    AND menu1.pizzeria_id > menu2.pizzeria_id
    AND menu1.pizza_name = menu2.pizza_name
INNER JOIN pizzeria AS pizzeria1 ON menu1.pizzeria_id = pizzeria1.id
INNER JOIN pizzeria AS pizzeria2 ON menu2.pizzeria_id = pizzeria2.id
ORDER BY 1
