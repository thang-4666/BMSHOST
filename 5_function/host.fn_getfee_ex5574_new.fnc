SET DEFINE OFF;
CREATE OR REPLACE FUNCTION FN_GETFEE_EX5574_NEW(PV_CUSTODYCD IN VARCHAR2,P_FEETYPE IN VARCHAR2, P_PRINAMT in NUMBER)
    RETURN NUMBER IS

    V_RESULT NUMBER;
    V_FEEAMT NUMBER;
    V_FEEMAX NUMBER;
    V_FEEMIN NUMBER;
    V_FORP   VARCHAR2(1);
    v_isvat  varchar2(1);
    V_FEERATE     NUMBER(20,4);
    V_VATRATE     NUMBER(20,4);

    P_FEE         NUMBER;
    P_MIN         NUMBER;

BEGIN
  V_FEEAMT :=0;
  V_FEEMAX :=0;
  V_FEEMIN :=0;
  V_RESULT :=0;
  
  select vat into v_isvat from cfmast WHERE CUSTODYCD = PV_CUSTODYCD;
  
  SELECT FEEAMT, MINVAL, MAXVAL,FORP ,FEERATE, VATRATE
  INTO V_FEEAMT,V_FEEMIN,V_FEEMAX,V_FORP ,V_FEERATE,V_VATRATE
  FROM FEEMASTER WHERE FEECD=P_FEETYPE;

  IF V_FORP='P' THEN--rate
      P_FEE:=P_PRINAMT*V_FEERATE/100;
  ELSE
      P_FEE:=V_FEEAMT;
  END IF;

P_MIN:=least(GREATEST(V_FEEMIN,P_FEE),V_FEEMAX);

IF v_isvat='N' THEN 
  V_RESULT:= round(P_MIN);
ELSE
      V_RESULT:=round(p_min/(1+v_vatrate/100));

 END IF;


RETURN V_RESULT;
EXCEPTION
   WHEN OTHERS THEN
    RETURN 0;
END;

 
 
 
 
/
