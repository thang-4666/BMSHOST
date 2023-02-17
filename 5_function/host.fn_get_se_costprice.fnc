SET DEFINE OFF;
CREATE OR REPLACE FUNCTION fn_get_se_costprice(PV_AFACCTNO IN VARCHAR2, PV_CODEID IN VARCHAR2, PV_CURRCOSTPRICE IN NUMBER)
    RETURN NUMBER IS
-- Purpose: Lay gia von chung khoan CK
-- MODIFICATION HISTORY
-- Person      Date         Comments
-- ---------   ------       -------------------------------------------
-- THANHNM   31/01/2012     Created
    V_RESULT NUMBER;
BEGIN

IF PV_CURRCOSTPRICE>=0 THEN
    RETURN PV_CURRCOSTPRICE;
END IF;


SELECT COSTPRICE INTO V_RESULT
    FROM SEMAST
    WHERE AFACCTNO = REPLACE(PV_AFACCTNO,'.','')
    AND CODEID = PV_CODEID;
RETURN V_RESULT;
EXCEPTION
   WHEN OTHERS THEN
    RETURN 0;
END;
 
 
 
 
 
 
 
 
 
 
 
 
 
/
