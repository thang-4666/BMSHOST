SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('MR0007','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('MR0007', 'Tra cứu nhanh thông tin món vay', 'Margin information', 'SELECT LS.AUTOID, AF.ACCTNO,CF.CUSTODYCD,LN.ACCTNO LNACCTNO,CF.FULLNAME,LS.OVERDUEDATE,LS.RLSDATE
FROM VW_LNMAST_ALL LN, VW_LNSCHD_ALL LS, AFMAST AF, CFMAST CF
WHERE LN.ACCTNO=LS.ACCTNO
AND LN.TRFACCTNO=AF.ACCTNO
AND AF.CUSTID=CF.CUSTID
AND LS.RLSDATE IS NOT NULL', 'MR0007', 'frmMR0007', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');COMMIT;