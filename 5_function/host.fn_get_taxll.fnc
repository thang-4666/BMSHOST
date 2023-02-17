SET DEFINE OFF;
CREATE OR REPLACE FUNCTION fn_get_taxll (pv_caqtty IN NUMBER, pv_price IN NUMBER,P_CUSTODYCD IN VARCHAR2 )
RETURN NUMBER
iS
    v_result NUMBER(20);
    V_CUSTTYPE NUMBER(20);

BEGIN

SELECT  DECODE(custtype,'B',0,1) INTO V_CUSTTYPE  FROM CFMAST  WHERE CUSTODYCD = REPLACE( P_CUSTODYCD,'''','');

SELECT ROUND(TO_number(varvalue)*(pv_caqtty)*pv_price*V_CUSTTYPE/100,0) INTO v_result
FROM sysvar WHERE varname ='ADVSELLDUTY';

    RETURN v_result;
EXCEPTION WHEN OTHERS THEN
    RETURN 0;
END;

 
 
 
 
 
 
 
 
 
 
 
/