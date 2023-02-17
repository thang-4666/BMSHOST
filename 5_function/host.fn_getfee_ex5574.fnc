SET DEFINE OFF;
CREATE OR REPLACE FUNCTION FN_GETFEE_EX5574(P_FEETYPE IN VARCHAR2, P_PRINAMT in NUMBER)
    RETURN NUMBER IS

    V_RESULT NUMBER;
    V_FEEAMT NUMBER;
    V_FEEMAX NUMBER;
    V_FEEMIN NUMBER;
    V_FORP   VARCHAR2(1);
    V_FEERATE     NUMBER(20,4);
BEGIN
  V_FEEAMT :=0;
  V_FEEMAX :=0;
  V_FEEMIN :=0;
  V_RESULT :=0;
  SELECT FEEAMT, MINVAL, MAXVAL,FORP ,FEERATE
  INTO V_FEEAMT,V_FEEMIN,V_FEEMAX,V_FORP ,V_FEERATE
  FROM FEEMASTER WHERE FEECD=P_FEETYPE;
  IF V_FORP='P' THEN--rate
      V_RESULT:=P_PRINAMT*V_FEERATE/100;
  ELSE
      V_RESULT:=V_FEEAMT;
  END IF;

  IF V_RESULT>V_FEEMAX THEN
     V_RESULT:=V_FEEMAX;
  ELSIF V_RESULT<V_FEEMIN THEN
     V_RESULT:=V_FEEMIN;
  END IF;

RETURN V_RESULT;
EXCEPTION
   WHEN OTHERS THEN
    RETURN 0;
END;

 
 
 
 
/