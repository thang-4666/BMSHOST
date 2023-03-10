SET DEFINE OFF;
CREATE OR REPLACE FUNCTION fn_seqtty_3315(PV_CAMASTID IN varchar2)
  RETURN  number
  IS

  v_Result      number(20);

BEGIN

SELECT NVL(SUM(TRADE+BLOCKED),0) INTO v_Result FROM SEMAST  WHERE ACCTNO
IN (SELECT AFACCTNO ||SB.CODEID FROM CASCHD CA,sbsecurities SB  WHERE  CA.CODEID = SB.REFCODEID AND CAMASTID =PV_CAMASTID AND  DELTD <> 'Y');

  RETURN v_result;
EXCEPTION
   WHEN OTHERS THEN
    RETURN 0;
END;
 
 
 
 
/
