SELECT dates_interval::date AS missing_date
FROM (SELECT * FROM person_visits WHERE person_id = 1 OR person_id = 2) AS visited_by_1_2
RIGHT JOIN generate_series('2022-01-01', '2022-01-10', interval '1 day') AS dates_interval ON visited_by_1_2.visit_date = dates_interval
WHERE visited_by_1_2.id IS NULL
ORDER BY 1