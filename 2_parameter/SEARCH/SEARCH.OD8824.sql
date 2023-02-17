SET DEFINE OFF;
SYM.SYMBOL, SYM.CODEID, SYM.PARVALUE,0 VATAMT, SCHD.AFACCTNO, SCHD.AFACCTNO CIACCTNO, SCHD.AFACCTNO || SCHD.CODEID SEACCTNO,
A1.CDCONTENT DESC_DUETYPE,A2.CDCONTENT DESC_CLEARCD,A3.CDCONTENT DESC_STATUS,A4.CDCONTENT DESC_DELTD,
(CASE WHEN (SCHD.AMT + (OD.FEEACR-OD.FEEAMT) - (OD.SECUREDAMT-OD.RLSSECURED))>0 THEN (SCHD.AMT + (OD.FEEACR-OD.FEEAMT) - (OD.SECUREDAMT-OD.RLSSECURED)) ELSE 0 END) CRSECUREDAMT,
SCHD.STATUS, SCHD.TXDATE, SCHD.CLEARCD, SCHD.CLEARDAY, SCHD.AMT, SCHD.AMT TRFAMT, SCHD.AAMT, SCHD.QTTY,SCHD.QTTY RCVQTTY, SCHD.AQTTY, SCHD.FAMT, ROUND(SCHD.AMT/SCHD.QTTY,4) MATCHPRICE,
SCHD.ORGORDERID ORDERID, OD.SECUREDAMT, OD.RLSSECURED, OD.FEEAMT, OD.FEEACR, OD.SECUREDAMT-OD.RLSSECURED AVLSECUREDAMT, OD.FEEACR-OD.FEEAMT AVLFEEAMT
FROM AFMAST AF, CFMAST CF, STSCHD SCHD, ODMAST OD, SBSECURITIES SYM, ALLCODE A1,ALLCODE A2,ALLCODE A3,ALLCODE A4 ,SYSVAR
WHERE SCHD.AFACCTNO = AF.ACCTNO AND AF.CUSTID = CF.CUSTID AND SCHD.ORGORDERID=OD.ORDERID AND SYM.CODEID=SCHD.CODEID
AND SCHD.DUETYPE=''RS'' AND SCHD.STATUS=''N'' AND SCHD.DELTD<>''Y''
AND A1.CDTYPE = ''OD'' AND A1.CDNAME = ''DUETYPE'' AND A1.CDVAL= SCHD.DUETYPE
AND A2.CDTYPE = ''OD'' AND A2.CDNAME = ''CLEARCD'' AND A2.CDVAL= SCHD.CLEARCD
AND A3.CDTYPE = ''OD'' AND A3.CDNAME = ''CALENDARSTATUS'' AND A3.CDVAL= SCHD.STATUS
AND A4.CDTYPE = ''SY'' AND A4.CDNAME = ''YESNO'' AND A4.CDVAL= SCHD.DELTD
AND SYSVAR.GRNAME=''SYSTEM'' AND SYSVAR.VARNAME=''CURRDATE''
AND GETDUEDATE(SCHD.TXDATE,SCHD.CLEARCD,SYM.TRADEPLACE,SCHD.CLEARDAY)=TO_DATE(SYSVAR.VARVALUE,''dd/MM/YYYY'')
ORDER BY TXDATE, MODCODE) WHERE 0=0 ', 'ODMAST', '', '', '8824', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');