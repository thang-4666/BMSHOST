SET DEFINE OFF;
CREATE OR REPLACE FUNCTION FN_CRB_GETCFACCTBYTRFCODE (v_trfcode in varchar2, v_refvalue in varchar2) RETURN VARCHAR2 IS
  v_return   VARCHAR2(50);
BEGIN
v_return:='';
IF v_trfcode='TRFADPAID' THEN
  --LAY SO TAI KHOAN NGAN HANG THEO SUBACCTNO
  SELECT BANKACCTNO INTO v_return FROM AFMAST WHERE ACCTNO=v_refvalue;
ELSIF v_trfcode='TRFADV2BANK' THEN
  --LAY SO TK LUU THEO THAM SO SUBACCTNO
  SELECT CF.CUSTODYCD INTO v_return FROM CFMAST CF, AFMAST AF WHERE CF.CUSTID=AF.CUSTID AND AF.ACCTNO=v_refvalue;
END IF;
RETURN v_return;
END;

 
 
 
 
 
 
 
 
 
 
 
 
 
 
/