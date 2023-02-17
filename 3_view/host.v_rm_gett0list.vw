SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW V_RM_GETT0LIST
(CUSTODYCD, ACCTNO, FULLNAME, CAREBY, CBGROUP, 
 AFACCTNO, BANKACCTNO, BANKCODE, BANKNAME, HOLDBALANCE, 
 ADVANCELINE, DEPOFEEAMT, EXECBUYAMT, MUSTHOLDAMT)
BEQUEATH DEFINER
AS 
SELECT CF.CUSTODYCD,AF.ACCTNO,CF.FULLNAME,CF.CAREBY,GRP.GRPNAME CBGROUP,AF.ACCTNO AFACCTNO,AF.BANKACCTNO,
CRB.BANKCODE,CRB.BANKCODE||':'||CRB.BANKNAME BANKNAME,
CI.BALANCE HOLDBALANCE,AF.advanceline,CI.depofeeamt,
B.EXECBUYAMT EXECBUYAMT,- CI.BALANCE + CI.DEPOFEEAMT MUSTHOLDAMT
FROM CIMAST CI,AFMAST AF,CFMAST CF,CRBDEFBANK CRB,TLGROUPS GRP,v_getbuyorderinfo B
WHERE B.AFACCTNO=CI.AFACCTNO
AND CI.AFACCTNO = AF.ACCTNO AND AF.CUSTID=CF.CUSTID
AND CRB.BANKCODE=AF.BANKNAME AND CI.COREBANK='Y' AND CF.CAREBY=GRP.GRPID(+)
AND GREATEST(- CI.BALANCE + CI.DEPOFEEAMT,0)>0
ORDER BY CF.CUSTODYCD ASC
/