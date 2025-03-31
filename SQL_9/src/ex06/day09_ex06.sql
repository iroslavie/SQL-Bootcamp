CREATE FUNCTION fnc_person_visits_and_eats_on_date(pperson person.name%TYPE default 'Dmitriy',
                                                   pprice menu.price%TYPE default 500,
                                                   pdate person_visits.visit_date%TYPE default '2022-01-08')
RETURNS TABLE (pizzeria_name pizzeria.name%TYPE) AS
$$
BEGIN
RETURN QUERY
    SELECT pizzeria.name AS pizzeria_name FROM pizzeria
    INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
    INNER JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
    INNER JOIN person ON person_visits.person_id = person.id
    WHERE person.name = pperson AND menu.price < pprice AND person_visits.visit_date = pdate;
END;
$$
LANGUAGE plpgsql

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
