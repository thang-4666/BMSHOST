SET DEFINE OFF;
CREATE OR REPLACE FUNCTION fn_lnprminmast_rate3(pv_rate2 IN VARCHAR2,pv_rate3 IN VARCHAR2)
    RETURN number IS
    v_Result  VARCHAR2(10);

BEGIN
IF TO_NUMBER( pv_rate3) <>0 THEN
RETURN TO_NUMBER( pv_rate3) ;
ELSE
RETURN TO_NUMBER( pv_rate2*1.5);
END IF;

EXCEPTION
   WHEN OTHERS THEN
    RETURN 0;
END;

 
 
 
 
/
