CREATE OR REPLACE TRIGGER ID_KONTA_SEQ_TRG
BEFORE INSERT ON KONTA
FOR EACH ROW WHEN (NEW.ID_KONTA IS NULL)
BEGIN
SELECT ID_KONTA_SEQ.NEXTVAL INTO :NEW.ID_KONTA FROM dual;
END;
/