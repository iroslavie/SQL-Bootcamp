CREATE TABLE person_audit (created timestamp with time zone default current_timestamp NOT NULL,
                            type_event char(1) default 'I' NOT NULL,
                            row_id bigint NOT NULL,
                            name varchar NOT NULL,
                            age integer NOT NULL,
                            gender varchar NOT NULL,
                            address varchar NOT NULL);

ALTER TABLE person_audit ADD CONSTRAINT ch_type_event CHECK ( type_event in ('I', 'D', 'U') );

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS
$$
BEGIN
INSERT INTO person_audit (row_id, name, age, gender, address)
VALUES (NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
    AFTER INSERT ON person
    FOR EACH ROW
    EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');