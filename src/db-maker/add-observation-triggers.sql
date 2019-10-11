\connect cdmlite
CREATE TRIGGER observation_insert_trigger
BEFORE INSERT ON lite.observations
FOR EACH ROW EXECUTE PROCEDURE lite.observation_insert_trigger();
