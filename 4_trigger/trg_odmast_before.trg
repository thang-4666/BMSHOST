SET DEFINE OFF;
CREATE OR REPLACE TRIGGER TRG_ODMAST_BEFORE 
 BEFORE
  INSERT OR UPDATE
 ON odmast
REFERENCING NEW AS NEWVAL OLD AS OLDVAL
 FOR EACH ROW
begin
:NEWVAL.last_change:= SYSTIMESTAMP;
END;
/
