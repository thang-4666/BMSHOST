SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('ACCOUNT_NUM','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('ACCOUNT_NUM', 'Quản lý số hợp đồng cầm cố', 'account numbers', 'SELECT NVL(FLD.CVALUE,'' '') ACCNUM, TL.TXNUM, TL.TXDATE, CF.CUSTODYCD,CF.FULLNAME, AF.ACCTNO, SB.SYMBOL
FROM VW_TLLOG_ALL TL, VW_TLLOGFLD_ALL FLD, AFMAST AF, CFMAST CF,SBSECURITIES SB
WHERE TL.TXDATE=FLD.TXDATE
AND TL.TXNUM=FLD.TXNUM
AND FLD.FLDCD=''13''
AND TL.TLTXCD=''2232''
AND AF.ACCTNO=SUBSTR(TL.MSGACCT,1,10)
AND AF.CUSTID=CF.CUSTID
AND SB.CODEID=SUBSTR(TL.MSGACCT,11,6) ', 'ACCOUNT_NUM', 'frmACCOUNT_NUM', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');COMMIT;