CREATE INDEX idx_1 ON pizzeria(rating);
SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT menu.pizza_name AS pizza_name,
       max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM menu
INNER JOIN pizzeria pz ON menu.pizzeria_id = pz.id
ORDER BY 1, 2;