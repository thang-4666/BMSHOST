SET DEFINE OFF;
SELECT TB.AUTOID , TB.CUSTODYCD,TB.ACCTNO , CF.FULLNAME CUSTNAME, CF.ADDRESS,
CF.IDDATE,CF.IDPLACE,TB.AMT,TB.REFNUM,TB.DES ,getbaldefovd(CI.AFACCTNO) BALANCE ,cf. idcode LICENSE,
(case when ci.corebank =''Y'' then 1 else 0 end) ISCOREBANK
FROM TBLCI1138 TB, CFMAST CF, AFMAST AF,CIMAST CI
WHERE TB.CUSTODYCD = CF.CUSTODYCD AND CF.CUSTID = AF.CUSTID AND CI.ACCTNO = AF.ACCTNO
AND AF.ACCTNO NOT IN (SELECT MSGACCT FROM TLLOG WHERE TLTXCD =''1138'' )
AND TB.ACCTNO = AF.ACCTNO AND NVL(TB.DELTD,''0'') <> ''Y'' ', 'CIMAST', 'frmCIMAST', '', '1138', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');