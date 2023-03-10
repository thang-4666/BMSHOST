SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('SE2283','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('SE2283', 'Hủy lệnh quỹ mở (2283)', 'View pending open fund order (wait for 2283)', 'SELECT O.TXDATE, O.TXNUM, CF.CUSTODYCD, O.AFACCTNO, O.CODEID, S.SYMBOL,
A.CDCONTENT DESC_DEALTYPE, O.DEALTYPE, FNC_GET_OPNF_REFACCTNO(O.AFACCTNO, O.CODEID) RFACCTNO, O.NOTES, O.AFACCTNO || O.CODEID ACCTNO,
S.PARVALUE, CF.FULLNAME CUSTNAME, CF.ADDRESS, CF.IDCODE LICENSE, T.CDCONTENT IDTYPE, CF.IDDATE,
O.QUOTEQTTY, O.QUOTEAMT, CF.IDPLACE, O.SWAPQTTY, O.FEEAMT, O.RFCODEID
FROM IBDEALS O, SBSECURITIES S, AFMAST AF, CFMAST CF, ALLCODE A, ALLCODE T
WHERE O.STATUS in (''P'',''S'',''A'',''E'') AND O.CODEID=S.CODEID AND O.AFACCTNO=AF.ACCTNO AND AF.CUSTID=CF.CUSTID
AND O.DEALTYPE=A.CDVAL AND A.CDTYPE=''SA'' AND A.CDNAME=''OPNFBORS''
AND O.DEALTYPE IN (''OPFIPO'', ''OPFSPO'', ''OPFBUY'', ''OPFSEL'', ''OPFSWP'', ''OPFSWP'', ''OPFTRO'')
AND CF.IDTYPE=T.CDVAL AND T.CDTYPE=''CF'' AND T.CDNAME=''IDTYPE''', 'SEMAST', '', '', '2283', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');COMMIT;