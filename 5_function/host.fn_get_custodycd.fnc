SET DEFINE OFF;
CREATE OR REPLACE FUNCTION FN_GET_CUSTODYCD(PV_CUSTODYCD IN VARCHAR2) RETURN varchar2
IS
BEGIN
    RETURN PV_CUSTODYCD;
EXCEPTION WHEN OTHERS THEN
    RETURN 0;
END;
 
 
 
 
/