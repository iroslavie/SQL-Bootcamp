CREATE FUNCTION fnc_fibonacci(pstop integer default 10)
RETURNS TABLE (fibonacci_num numeric) AS
$$
DECLARE arr_fibonacci_numbers numeric[] := ARRAY [0::numeric, 1::numeric];
    i integer;
BEGIN
    IF (pstop < 3) THEN
        RETURN QUERY SELECT 0::numeric;
        RETURN;
    end if;
    FOR i IN 3..pstop
    LOOP
        arr_fibonacci_numbers[i] = arr_fibonacci_numbers[i-1] + arr_fibonacci_numbers[i-2];
        IF (arr_fibonacci_numbers[i] > pstop) THEN
            arr_fibonacci_numbers := array_remove(arr_fibonacci_numbers, arr_fibonacci_numbers[i]);
            EXIT;
        end if;
    end loop;
    RETURN QUERY
    SELECT unnest(arr_fibonacci_numbers) AS fibonacci_num;
end;
$$
LANGUAGE plpgsql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
