SET DEFINE OFF;
MST.AFACCTNO, MST.TXAMT, CF.CUSTODYCD, CF.FULLNAME, TYP.TYPENAME
FROM CRBTXREQ MST, AFMAST AF, CFMAST CF, AFTYPE TYP
WHERE MST.STATUS=''P'' AND MST.TRFCODE=''HOLD'' AND MST.AFACCTNO=AF.ACCTNO AND AF.CUSTID=CF.CUSTID AND AF.ACTYPE=TYP.ACTYPE', 'BANKINFO', '', '', '6620', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');