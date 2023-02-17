SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "SP_BD_GETDEALS_SUM" (PV_REFCURSOR IN OUT PKG_REPORT.REF_CURSOR, custodycd IN VARCHAR2)
  IS
  V_PARAFILTER VARCHAR2(10);
BEGIN
    V_PARAFILTER:=custodycd;
    OPEN PV_REFCURSOR FOR
    SELECT MST.ORGORDERID ORDERID, MST.SYMBOL, MST.MATCHPRICE PRICE, MST.MATCHQTTY QTTY, MST.MATCHPRICE*MST.MATCHQTTY MATCHAMT,
    MST.CONFIRM_NO, A0.CDCONTENT BORS_DESC, MST.BORS, REFMST.AFACCTNO
    FROM IOD MST, ALLCODE A0, ODMAST REFMST,cfmast cf,afmast af
    WHERE A0.CDTYPE='OD' AND A0.CDNAME='BORS' AND MST.BORS=A0.CDVAL AND REFMST.AFACCTNO=af.acctno
    AND cf.custid=af.custid AND cf.custodycd=V_PARAFILTER
  AND mst.deltd <> 'Y'
    AND MST.ORGORDERID=REFMST.ORDERID;
EXCEPTION
    WHEN others THEN
        return;
END;

 
 
 
 
/