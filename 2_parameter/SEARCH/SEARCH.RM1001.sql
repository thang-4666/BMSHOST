SET DEFINE OFF;
CRB.BANKCODE,CRB.BANKCODE||'':''||CRB.BANKNAME BANKNAME,
CI.BALANCE HOLDBALANCE,AF.advanceline,CI.depofeeamt, NVL(C.SECUREAMT_INDAY,0) SECUREAMT_INDAY,B.trfbuyamt_over,NVL(c.trft0amt_inday,0) trft0amt_inday,NVL(C.trfsecuredamt_inday,0) trfsecuredamt_inday,
NVL(C.SECUREAMT_INDAY,0) + B.trfbuyamt_over T0BALANCE,NVL(C.trft0amt_inday,0) + NVL(C.trfsecuredamt_inday,0) T2BALANCE,
B.EXECBUYAMT + B.BUYFEEACR EXECBUYAMT,(ci.trfbuyamt + b.execbuyamt + b.buyfeeacr - CI.BALANCE + CI.DEPOFEEAMT) MUSTHOLDAMT
FROM CIMAST CI,AFMAST AF,CFMAST CF,CRBDEFBANK CRB,TLGROUPS GRP,v_getbuyorderinfo B,vw_trfbuyinfo_inday C
WHERE B.AFACCTNO=CI.AFACCTNO AND B.afacctno=C.afacctno(+)
AND CI.AFACCTNO = AF.ACCTNO AND AF.CUSTID=CF.CUSTID
AND CRB.BANKCODE=AF.BANKNAME AND CI.COREBANK=''Y'' AND CF.CAREBY=GRP.GRPID(+)
AND (ci.trfbuyamt + b.execbuyamt + b.buyfeeacr - CI.BALANCE + CI.DEPOFEEAMT)>0', 'CRBTRFLOG', '', 'CF.CUSTODYCD ASC', '6640', 0, 100, 'N', 30, '', 'Y', 'T', '', 'N', '', '');