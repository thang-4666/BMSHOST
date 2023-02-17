SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW V_RM_GETUNREGREQ
(REQID, BANKCODE, AFACCTNO, BANKACCTNO, CUSTODYCD, 
 IDCODE)
BEQUEATH DEFINER
AS 
SELECT REQ.REQID,REQ.BANKCODE,REQ.AFACCTNO,AF.BANKACCTNO,CF.CUSTODYCD,CF.IDCODE
FROM CRBTXREQ REQ,AFMAST AF,CFMAST CF
WHERE REQ.AFACCTNO=AF.ACCTNO AND AF.CUSTID=CF.CUSTID
AND REQ.OBJTYPE='V' AND REQ.OBJNAME='AFMAST'
AND REQ.TRFCODE='UNREG' AND REQ.STATUS='P'
/