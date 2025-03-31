CREATE FUNCTION func_minimum(arr numeric[])
RETURNS numeric AS
$$
DECLARE
    min_value numeric;
    i INTEGER;
BEGIN
    min_value := arr[1];
    FOR i IN SELECT generate_subscripts(arr, 1)
    LOOP
        IF arr[i] < min_value THEN
            min_value := arr[i];
        END IF;
    END LOOP;
    RETURN min_value;
end;
$$
LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);


