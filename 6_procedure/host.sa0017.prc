SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE SA0017  (
   PV_REFCURSOR             IN OUT   PKG_REPORT.REF_CURSOR,
   OPT                      IN       VARCHAR2,
   PV_BRID                  IN       VARCHAR2,
   TLGOUPS                  IN       VARCHAR2,
   TLSCOPE                  IN       VARCHAR2,
   F_DATE                   IN       VARCHAR2,
   T_DATE                   IN       VARCHAR2,
   PV_CUSTODYCD             IN       VARCHAR2
           )
IS
    v_currdate date;
    V_CUSTODYCD VARCHAR2(50);
BEGIN
    v_currdate:=getcurrdate;
    IF  (upper(PV_CUSTODYCD) <> 'ALL' )
    THEN
          V_CUSTODYCD := upper(REPLACE (PV_CUSTODYCD,' ','_'));
    ELSE
          V_CUSTODYCD := '%';
    END IF;
OPEN PV_REFCURSOR
FOR
SELECT  CF.CUSTODYCD CUSTODYCD, CF.FULLNAME FULLNAME,
        OL.MACADDRESS MACADDRESS, OL.IPADDRESS IPADDRESS, OL.TXDATE TXDATE,
        OL.OTAUTHTYPE OTAUTHTYPE, OL.ACCTNO ACCTNO,OL.ORDERID ORDERID, OL.VIA VIA,
        OL.SERIALNUMSIG  SERIA, FT.PRICE PRICE, FT.SYMBOL SYMBOL,FT.QUANTITY QTTY,FT.EXECTYPE STATUS
FROM CFMAST CF,AFMAST AF, ODAUTH_LOG OL, VW_FOMAST_ALL FT--,OTRIGHT OT
WHERE CF.CUSTID = AF.CUSTID
--AND OT.DELTD <> 'Y'
--AND CF.CUSTID = OT.CFCUSTID
--AND OT.AUTHTYPE = OL.OTAUTHTYPE
AND AF.ACCTNO = OL.ACCTNO(+)
AND AF.ACCTNO = FT.AFACCTNO
AND OL.ORDERID = FT.ACCTNO
AND CF.CUSTODYCD LIKE  V_CUSTODYCD
AND TO_DATE(OL.TXDATE,'DD/MM/YYYY') >= to_date(F_DATE,'dd/mm/yyyy')
AND TO_DATE(OL.TXDATE,'DD/MM/YYYY') <= to_date(T_DATE,'dd/mm/yyyy')
ORDER BY OL.AUTOID ASC;

EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;--thunt
 
/