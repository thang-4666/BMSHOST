SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('ODBK15','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('ODBK15', 'Bảng kê mua chứng khoán lô lẻ', 'Depository center: Statement of oddlot', 'SELECT MST.OBJNAME, MST.TXDATE, MST.OBJKEY,
MST.AFACCTNO, MST.BANKCODE, MST.BANKACCT, MST.STATUS, MST.TXAMT, RF.*
FROM CRBTXREQ MST, (SELECT *
FROM   (SELECT DTL.REQID, DTL.FLDNAME, NVL(DTL.CVAL,DTL.NVAL) REFVAL
        FROM   CRBTXREQ MST, CRBTXREQDTL DTL WHERE MST.STATUS=''P'' AND MST.REQID=DTL.REQID AND MST.TRFCODE=''SEODDLOT'')
PIVOT  (MAX(REFVAL) AS R FOR (FLDNAME) IN
(''QTTY'' as QTTY, ''LICENSE'' as LICENSE, ''IDDATE'' as IDDATE,
''CUSTNAME'' as CUSTNAME, ''CUSTODYCD'' as CUSTODYCD, ''BOARD'' as BOARD, ''SYMBOL'' as SYMBOL))
ORDER BY REQID) RF
WHERE MST.REQID=RF.REQID', 'BANKINFO', 'SEODDLOT', 'TXDATE, OBJKEY', 'EXEC', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');COMMIT;