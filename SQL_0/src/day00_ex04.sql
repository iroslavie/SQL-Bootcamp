SELECT name || '('|| 'age:' ||  age || ',gender:' || '''' || gender
           || '''' || ',address:' || ''''|| address || ''')' as person_info
FROM person
ORDER BY person_info