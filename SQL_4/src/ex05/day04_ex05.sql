CREATE VIEW v_price_with_discount AS
    SELECT person.name, menu.pizza_name, menu.price, new_menu_price.discount_price
    FROM person_order
    INNER JOIN menu ON person_order.menu_id = menu.id
    INNER JOIN person ON person_order.person_id = person.id
    INNER JOIN (SELECT id, round(price -  price*0.1) AS discount_price
    FROM menu) new_menu_price ON new_menu_price.id = menu.id
ORDER BY 1, 2