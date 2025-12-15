CREATE OR REPLACE FUNCTION fnc_trg_person_audit()
    RETURNS trigger
    LANGUAGE plpgsql
AS
$$
DECLARE
    operation char(1);
    cortege person%ROWTYPE;
BEGIN
    IF TG_OP = 'INSERT' THEN
        cortege := NEW;
    ElSIF TG_OP = 'DELETE' OR TG_OP = 'UPDATE' THEN
        cortege := OLD;
    END IF;

    operation := TG_OP::char(1);

    INSERT INTO person_audit(type_event, row_id, name, age, gender, address)
    VALUES(operation, cortege.id, cortege.name, cortege.age, cortege.gender, cortege.address);

    RETURN NULL;
END;
$$;

CREATE OR REPLACE TRIGGER trg_person_audit AFTER INSERT OR UPDATE OR DELETE
ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_audit();

DROP TRIGGER trg_person_insert_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP TRIGGER trg_person_delete_audit ON person;

DROP FUNCTION fnc_trg_person_insert_audit;
DROP FUNCTION fnc_trg_person_update_audit;
DROP FUNCTION fnc_trg_person_delete_audit;

DELETE FROM person_audit;

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk'); 
UPDATE person SET name = 'Bulat' WHERE id = 10; 
UPDATE person SET name = 'Damir' WHERE id = 10; 
DELETE FROM person WHERE id = 10;