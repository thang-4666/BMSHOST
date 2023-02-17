SET DEFINE OFF;
CREATE OR REPLACE FUNCTION fn_1153_getpromotionfee( PV_AFACCTNO IN VARCHAR2,pv_FEERATE IN NUMBER)
    RETURN NUMBER IS
    v_Result            NUMBER(20,4);
    V_PROMOTIONRATE     NUMBER(20,4);

BEGIN
    V_PROMOTIONRATE := 1000;
    begin
        SELECT MIN (FEERATE) INTO V_PROMOTIONRATE FROM (
        SELECT ADP.AFACCTNO, MST.FEERATE FROM ADPRMFEECF ADP , ADPRMFEEMST MST
        WHERE GETCURRDATE BETWEEN ADP.VALDATE AND ADP.EXPDATE AND ADP.STATUS = 'A'
            AND ADP.PROMOTIONID = MST.AUTOID
            AND ADP.AFACCTNO = UPPER(PV_AFACCTNO)
        )
        GROUP BY AFACCTNO;
    EXCEPTION WHEN OTHERS THEN
        V_PROMOTIONRATE := 1000;
    end;
    IF NVL(V_PROMOTIONRATE,1000) > pv_FEERATE THEN
        v_Result := pv_FEERATE;
    ELSE
        v_Result := NVL(V_PROMOTIONRATE,1000);
    END IF;


    RETURN v_Result;

EXCEPTION
   WHEN OTHERS THEN
    RETURN 0;
END;

 
 
 
 
/