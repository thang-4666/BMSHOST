SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('SE2220','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('SE2220', 'Tra cứu các lệnh quỹ mở', 'View open fund order book', 'SELECT O.TXDATE, O.TXNUM, CF.CUSTODYCD, O.AFACCTNO, O.CODEID, S.SYMBOL,
A.CDCONTENT DESC_DEALTYPE, O.DEALTYPE, FNC_GET_OPNF_REFACCTNO(O.AFACCTNO, O.CODEID) RFACCTNO, O.NOTES, O.AFACCTNO || O.CODEID ACCTNO, O.STATUS, SS.CDCONTENT DESC_STATUS,
S.PARVALUE, CF.FULLNAME CUSTNAME, CF.ADDRESS, CF.IDCODE LICENSE, T.CDCONTENT IDTYPE, CF.IDDATE, O.busdate,
       O.quoteqtty,
       O.exeqtty,
       O.exeamt,
       o.feeamt,O.BRFEEAMT,
QUOTEAMT
FROM IBDEALS O, SBSECURITIES S, AFMAST AF, CFMAST CF, ALLCODE A, ALLCODE T, ALLCODE SS
WHERE O.CODEID=S.CODEID AND O.AFACCTNO=AF.ACCTNO AND AF.CUSTID=CF.CUSTID
AND O.STATUS=SS.CDVAL AND SS.CDTYPE=''SA'' AND SS.CDNAME=''IBDEALSTS''
AND O.DEALTYPE=A.CDVAL AND A.CDTYPE=''SA'' AND A.CDNAME=''OPNFBORS''
AND O.DEALTYPE IN (''OPFIPO'', ''OPFSPO'', ''OPFBUY'', ''OPFSEL'', ''OPFSWP'', ''OPFSWP'', ''OPFTRO'')
AND CF.IDTYPE=T.CDVAL AND T.CDTYPE=''CF'' AND T.CDNAME=''IDTYPE''', 'SEMAST', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');COMMIT;