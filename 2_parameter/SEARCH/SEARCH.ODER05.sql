SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('ODER05','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('ODER05', 'Sinh lệnh sửa lỗi (8848)', 'Generate new order (8848)', 'SELECT STS.TXDATE, STS.ORDERID, STS.CUSTODYCD, STS.AFACCTNO, STS.CODEID, STS.SYMBOL, STS.EXECTYPEVL, STS.EXECTYPE,
        STS.ORDERQTTY, STS.QUOTEPRICE, STS.MATCHQTTY, STS.MATCHAMT, STS.CLEARDATE,
        STS.TDCUSTODYCD, STS.TDAFACCTNO, NVL(TDSE.SEQTTY,0) TDSEQTTY, STS.TDPP, STS.MATCHQTTY MATCHQTTY2, STS.FULLNAME
FROM
(
    SELECT OD.TXDATE, OD.ORDERID, CF.CUSTODYCD, STS.AFACCTNO, SB.CODEID, SB.SYMBOL, OD.EXECTYPE EXECTYPEVL, A.CDCONTENT EXECTYPE,
        OD.ORDERQTTY, OD.QUOTEPRICE, STS.QTTY MATCHQTTY, STS.AMT MATCHAMT, STS.CLEARDATE,
        CF2.CUSTODYCD TDCUSTODYCD, AF2.ACCTNO TDAFACCTNO, GETAVLPP(AF2.ACCTNO) TDPP, CF.FULLNAME
    FROM STSCHD STS, ODMAST OD, CFMAST CF, AFMAST AF, SBSECURITIES SB, ALLCODE A, CFMAST CF2, AFMAST AF2
    WHERE STS.AFACCTNO = AF.ACCTNO AND CF.CUSTID = AF.CUSTID
        AND STS.CODEID = SB.CODEID AND STS.ORGORDERID = OD.ORDERID
        AND STS.DUETYPE IN (''RM'',''RS'') AND STS.DELTD = ''Y''
        AND OD.ERROD = ''Y'' AND OD.ERRSTS IN (''E'') AND OD.ERRREASON <> ''02''
        AND A.CDTYPE = ''OD'' AND A.CDNAME = ''EXECTYPE'' AND A.CDVAL = OD.EXECTYPE
        --AND STS.TXDATE >= FN_GET_PREVDATE(GETCURRDATE,1)
        AND CF2.CUSTID = AF2.CUSTID
        AND SUBSTR(CF2.CUSTODYCD,4,1) = ''P''
) STS
LEFT JOIN
(
    SELECT CF.CUSTODYCD, AF.ACCTNO, NVL(SE.CODEID,'''') CODEID, nvl(getavlsetrade(se.afacctno, se.codeid),0) SEQTTY
    FROM CFMAST CF, AFMAST AF, SEMAST SE
    WHERE CF.CUSTID = AF.CUSTID
        AND AF.ACCTNO = SE.AFACCTNO
        AND SUBSTR(CF.CUSTODYCD,4,1) = ''P''
        AND SE.TRADE >0
) TDSE
ON STS.TDAFACCTNO = TDSE.ACCTNO AND STS.CODEID = TDSE.CODEID
WHERE 0 = 0', 'ODMAST', '', 'TXDATE DESC, CUSTODYCD, SYMBOL, ORDERID', '8848', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', 'CUSTODYCD');COMMIT;