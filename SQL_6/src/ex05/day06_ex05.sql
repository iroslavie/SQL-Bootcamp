COMMENT ON TABLE person_discounts IS 'Таблица скидок';
COMMENT ON COLUMN person_discounts.id IS 'Первичный ключ';
COMMENT ON COLUMN person_discounts.person_id IS 'Вторичный ключ из таблицы person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Вторичный ключ из таблицы pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'Скидка'