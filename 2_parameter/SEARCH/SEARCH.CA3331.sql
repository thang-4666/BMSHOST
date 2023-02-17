SET DEFINE OFF;
SELECT CA.AUTOID, CA.BALANCE, CA.CAMASTID, 
CA.AFACCTNO,A0.CDCONTENT CATYPE, CA.CODEID, CA.EXCODEID, 
CA.QTTY, CA.AMT, CA.AQTTY,
       CA.AAMT, SYM.SYMBOL, A1.CDCONTENT STATUS,
       CA.AFACCTNO ||(case when camast.iswft=''Y'' then 
(select codeid from sbsecurities where 
refcodeid=symto.codeid) else symto.codeid end) SEACCTNO,
       CA.AFACCTNO || (CASE WHEN CAMAST.EXCODEID IS NULL 
THEN CAMAST.CODEID ELSE CAMAST.EXCODEID END) EXSEACCTNO,
       SYM.PARVALUE PARVALUE, EXSYM.PARVALUE EXPARVALUE, 
CAMAST.REPORTDATE REPORTDATE, CAMAST.ACTIONDATE,
       CFMAST.FULLNAME,CFMAST.ADDRESS, CFMAST.IDCODE, 
CFMAST.CUSTODYCD,CASE WHEN CI.COREBANK=''Y'' THEN 1 ELSE 0 
END COREBANK,
       CASE WHEN CI.COREBANK=''Y'' THEN ''Yes'' ELSE ''No'' 
END ISCOREBANK
       ,decode
(priceaccounting,0,exsym.parvalue,priceaccounting) 
priceaccounting, a0.cdval CATYPEVALUE,
       CA.ISCI,ISSE,CA.PBALANCE, CA.RQTTY, 
CA.TRADE,CAMAST.DESCRIPTION,CA.PQTTY, camast.isincode
FROM CASCHD CA, SBSECURITIES SYM, SBSECURITIES EXSYM, 
ALLCODE A0, ALLCODE A1, CAMAST, AFMAST, CFMAST,CIMAST 
CI,
SBSECURITIES SYMTO
WHERE A0.CDTYPE = ''CA'' AND A0.CDNAME = ''CATYPE'' AND 
A0.CDVAL = CAMAST.CATYPE
AND A1.CDTYPE = ''CA'' AND A1.CDNAME = ''CASTATUS'' AND 
A1.CDVAL = CA.STATUS
AND CA.CAMASTID = CAMAST.CAMASTID AND CAMAST.CODEID = 
SYM.CODEID
AND CA.DELTD =''N''
AND EXSYM.CODEID = (CASE WHEN CAMAST.EXCODEID IS NULL 
THEN CAMAST.CODEID ELSE CAMAST.EXCODEID END)
AND CA.AFACCTNO = AFMAST.ACCTNO AND 
CI.AFACCTNO=AFMAST.ACCTNO
AND AFMAST.CUSTID = CFMAST.CUSTID
and nvl(camast.tocodeid,camast.codeid)=symto.codeid
and ca.status in (''S'',''V'',''M'')
and ca.status not in (''J'',''C'')
and ca.afacctno LIKE ''%<$AFACCTNO>%''', 'CAMAST', '', '', '3331', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');