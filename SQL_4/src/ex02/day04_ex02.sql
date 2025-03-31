CREATE VIEW v_generated_dates AS
    SELECT dates::date
    FROM generate_series('2022-01-01', '2022-01-31', interval '1 day') dates
ORDER BY 1