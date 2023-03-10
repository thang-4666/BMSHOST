SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('SE8894','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('SE8894', 'Tra cứu giao dịch bán chứng khoán lô lẻ chờ thanh toán chứng khoán', 'View match securities order retail', 'SELECT CF.CUSTODYCD, B.DESACCTNO AFDDI , C.CODEID, C.SYMBOL, C.PARVALUE, A.AFACCTNO,
    B.TXDATE,B.TXNUM,B.ACCTNO,B.PRICE,B.QTTY,B.STATUS,B.DESACCTNO,B.FEEAMT,B.TAXAMT,B.SDATE,B.VDATE,
    CF.IDCODE ,A4.CDCONTENT TRADEPLACE,CASE WHEN CI.COREBANK=''Y'' THEN 0 ELSE 1 END ISCOREBANK,
    B.taxamt TAX,
    CI.DEPOLASTDT, CF.FULLNAME,
    to_char(B.TXDATE,''dd/mm/yyyy'') || b.TXNUM ACCREF, B.PRICE*B.QTTY EXECAMT, B.PITAMT, b.PITQTTY
FROM SEMAST A, SERETAIL B, SBSECURITIES C ,AFMAST AF , CFMAST CF ,ALLCODE A4,AFTYPE afTY,CIMAST CI
WHERE A.ACCTNO = B.ACCTNO AND A.CODEID = C.CODEID AND B.QTTY > 0 and B.STATUS=''I'' AND AF.ACCTNO =A.AFACCTNO AND AF.CUSTID =CF.CUSTID
AND A4.CDTYPE = ''SE'' AND A4.CDNAME = ''TRADEPLACE''  AND A4.CDVAL = C.TRADEPLACE
AND AF.ACTYPE=afty.actype and af.acctno=ci.acctno', 'SEMAST', '', '', '8894', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');COMMIT;