SET DEFINE OFF;DELETE FROM SEARCH WHERE 1 = 1 AND NVL(SEARCHCODE,'NULL') = NVL('OD9014','NULL');Insert into SEARCH   (SEARCHCODE, SEARCHTITLE, EN_SEARCHTITLE, SEARCHCMDSQL, OBJNAME, FRMNAME, ORDERBYCMDSQL, TLTXCD, CNTRECORD, ROWPERPAGE, AUTOSEARCH, INTERVAL, AUTHCODE, ROWLIMIT, CMDTYPE, CONDDEFFLD, BANKINQ, BANKACCT, CHKSCOPECMDSQL) Values   ('OD9014', 'View order not in ceiling floor', 'View order not in ceiling floor', 'SELECT MST.ORDERID, MST.ACTYPE, MST.CODEID, CCY.SYMBOL, CCY.PARVALUE, MST.AFACCTNO, MST.SEACCTNO, MST.CIACCTNO,
CF.FULLNAME CUSTNAME, CF.CUSTODYCD, CF.ADDRESS, CF.IDCODE LICENSE, CI.RAMT, CI.AAMT, CI.RAMT-CI.AAMT AVLAMT, CI.BALANCE, CI.ODAMT, CI.BAMT, SE.SECURED,
MST.TXDATE, MST.TXNUM, MST.EXPDATE, MST.BRATIO, MST.BRATIO/100 SRATIO, MST.CLEARDAY, MST.VOUCHER, MST.EXECAMT-MST.EXAMT AVLEXAMT,
MST.QUOTEPRICE, MST.STOPPRICE, MST.LIMITPRICE, MST.EXPRICE, MST.EXQTTY, MST.EXECAMT, MST.EXAMT, MST.FEEAMT, MST.FEEACR, MST.RLSSECURED, MST.MATCHAMT, MST.SECUREDAMT,
(CASE WHEN MST.ORDERQTTY-MST.EXECQTTY-MST.ADJUSTQTTY-MST.CANCELQTTY>0 THEN MST.ORDERQTTY-MST.EXECQTTY-MST.ADJUSTQTTY-MST.CANCELQTTY ELSE 0 END) AVLCANCELQTTY,
(CASE WHEN EXECTYPE=''NB'' OR EXECTYPE=''BC'' THEN 1 ELSE 0 END)*(CASE WHEN MST.SECUREDAMT-MST.MATCHAMT-MST.RLSSECURED>0 THEN MST.SECUREDAMT-MST.MATCHAMT-MST.RLSSECURED ELSE 0 END) AVLCANCELAMT,
(CASE WHEN EXECTYPE=''NB'' OR EXECTYPE=''BC'' THEN 1 ELSE 0 END)*(CASE WHEN MST.SECUREDAMT-(MST.EXPRICE*MST.REMAINQTTY+MST.MATCHAMT)-MST.RLSSECURED>0 THEN MST.SECUREDAMT-(MST.EXPRICE*MST.REMAINQTTY+MST.MATCHAMT)-MST.RLSSECURED ELSE 0 END) AVLSECUREDAMT,
(CASE WHEN EXECTYPE=''NB'' OR EXECTYPE=''BC'' THEN 1 ELSE 1 END)*(CASE WHEN MST.SECUREDAMT-(MST.EXPRICE*MST.REMAINQTTY+MST.MATCHAMT+MST.FEEACR)-MST.RLSSECURED<0 THEN (MST.EXPRICE*MST.REMAINQTTY+MST.MATCHAMT+MST.FEEACR)+ MST.RLSSECURED-MST.SECUREDAMT ELSE 0 END) AVLDEPOSITAMT,
(CASE WHEN MST.ORDERQTTY-MST.REMAINQTTY-MST.EXECQTTY-MST.ADJUSTQTTY-MST.CANCELQTTY>0 THEN MST.ORDERQTTY-MST.REMAINQTTY-MST.EXECQTTY-MST.ADJUSTQTTY-MST.CANCELQTTY ELSE 0 END) QTTY,
(CASE WHEN EXECTYPE=''NB'' OR EXECTYPE=''BC'' THEN ''B'' ELSE ''S'' END) BORS,
(CASE WHEN NORK=''N'' THEN ''N'' ELSE ''A'' END) AORN,
(CASE WHEN MATCHTYPE=''N'' THEN ''N'' ELSE ''P'' END) NORP,  (CASE WHEN MST.REMAINQTTY < MST.ORDERQTTY THEN ''4'' WHEN MST.REMAINQTTY = MST.ORDERQTTY THEN ''5'' ELSE MST.ORSTATUS END) EXORSTATUS,
MST.ORDERQTTY, MST.REMAINQTTY, MST.EXECQTTY, MST.STANDQTTY, MST.CANCELQTTY, MST.ADJUSTQTTY, MST.REJECTQTTY,
MST.TIMETYPE, MST.EXECTYPE, MST.NORK, MST.MATCHTYPE, MST.VIA, MST.CLEARCD, A0.CDCONTENT  ORSTATUS,A1.CDCONTENT PRICETYPE, MST.REJECTCD,
(CASE WHEN MST.EXECTYPE=''MS'' THEN 1 ELSE 0 END) ISMORTAGE
FROM ODMAST MST, AFMAST AF, CFMAST CF, SBSECURITIES CCY, CIMAST CI,SEMAST SE,ALLCODE A0,ALLCODE A1 , SECURITIES_INFO SEINFO
WHERE MST.AFACCTNO = AF.ACCTNO And MST.CIACCTNO = CI.ACCTNO AND MST.SEACCTNO = SE.ACCTNO AND MST.orstatus =''0''
AND MST.REMAINQTTY>0 AND MST.DELTD<> ''Y''
AND AF.CUSTID = CF.CUSTID AND MST.CODEID = CCY.CODEID AND CCY.CODEID = SEINFO.CODEID AND  (MST.QUOTEPRICE > SEINFO.CEILINGPRICE  OR  MST.QUOTEPRICE < SEINFO.FLOORPRICE)
AND A0.CDTYPE=''OD'' AND A0.CDNAME=''ORSTATUS'' AND A0.CDVAL=MST.ORSTATUS AND A1.CDTYPE=''OD'' AND A1.CDNAME=''PRICETYPE'' AND A1.CDVAL=MST.PRICETYPE
', 'ODMAST', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', 'CUSTODYCD');COMMIT;