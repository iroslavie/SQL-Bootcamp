SELECT address,
       round((max(age) - (min(age) / max(age)::double precision))::numeric, 2) AS formula,
           round(avg(age), 2) AS average,
           ((max(age) - (min(age) / max(age))) > avg(age)) AS comparison
FROM person
GROUP BY address
ORDER BY 1;
