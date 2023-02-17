SET DEFINE OFF;
       SEC.SYMBOL || '': '' || ISS.fullname DISPLAY,
       SEC.SYMBOL || '': '' || ISS.fullname EN_DISPLAY,
       ISS.fullname DESCRIPTION, SEC.PARVALUE, SEINFO.BASICPRICE PRICE,
       SEC.SYMBOL, SEC.CODEID, SEC.INTPERIOD, SEC.INTRATE,
       SEC.SYMBOL OPTSYMBOL
  FROM SBSECURITIES SEC, SECURITIES_INFO SEINFO, ISSUERS ISS
 WHERE SEC.CODEID = SEINFO.CODEID
   AND SEC.SECTYPE <> ''004''
   AND SEC.issuerid = ISS.issuerid
 ORDER BY SEC.SYMBOL ', ' ', ' ', 'Y', 'N', 'Y', ' ', ' ', 'Y', 'C', '', '', '', 'CODEID', '##########', '', '', '', '', 'C', 'N', 'MAIN', '', '', '', 'N', 'P_CODEID', 'Y', '', 'N', '', '', '', 'N');