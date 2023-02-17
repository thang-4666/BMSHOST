SET DEFINE OFF;
CREATE OR REPLACE FUNCTION fn_caqtty_3315(PV_CAMASTID IN varchar2)
  RETURN  number
  IS

  v_Result      number(20);

BEGIN

SELECT NVL(SUM(QTTY),0) INTO v_Result FROM CASCHD WHERE CAMASTID =PV_CAMASTID AND  DELTD <> 'Y';
    RETURN v_result;
EXCEPTION
   WHEN OTHERS THEN
    RETURN 0;
END;
 
 
 
 
/