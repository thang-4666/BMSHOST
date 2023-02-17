SET DEFINE OFF;
SELECT GREATEST (fn_getbalrightoff(CA.AFACCTNO), 0) IBALANCE, SUBSTR(CAMAST.CAMASTID,1,4) || ''.'' || SUBSTR(CAMAST.CAMASTID,5,6) || ''.'' || SUBSTR(CAMAST.CAMASTID,11,6) CAMASTID,
 CA.AFACCTNO,CF.CUSTODYCD, CF.FULLNAME , CAMAST.CODEID,CA.AUTOID,  CA.PBALANCE  BALANCE, CA.pqtty  QTTY, CA.paamt aamt , ( CASE WHEN CI.COREBANK =''Y'' THEN 0 ELSE 1 END) ISCOREBANK, ( CASE WHEN CI.COREBANK =''Yes'' THEN ''Y'' ELSE ''No'' END) COREBANK,
 SYM.SYMBOL, A1.CDCONTENT STATUS, CA.AFACCTNO ||(CASE WHEN CAMAST.ISWFT=''Y'' THEN (SELECT CODEID FROM SBSECURITIES WHERE REFCODEID =SYMto.CODEID ) ELSE CAMAST.TOCODEID END)  SEACCTNO, CA.AFACCTNO||CAMAST.OPTCODEID OPTSEACCTNO,SYM.PARVALUE PARVALUE, CAMAST.ACTIONDATE,CAMAST.EXPRICE,
(CASE WHEN SUBSTR(CF.custodycd,4,1) = ''F'' THEN to_char( ''Secondary-offer shares, ''||SYM.SYMBOL ||'', exdate on '' || to_char (camast.reportdate,''DD/MM/YYYY'')||'',
ratio '' ||camast.RIGHTOFFRATE ||'', quantity '' ||ca.pqtty ||'', price ''|| CAMAST.EXPRICE ||'', '' || cf.fullname) else to_char(''Đăng ký thực hiện quyền mua, ''||SYM.SYMBOL ||'',SL: ''|| ''<$21QTTY>'' ||'', Giá: '' ||camast.EXPRICE||'',TK: '' ||CF.CUSTODYCD ) end ) || '' (tele)'' description ,
(CA.pqtty+CA.QTTY) MAXQTTY, CA.QTTY BUYQTTY, a2.cdcontent CATYPE, camast.isincode,
camast.REPORTDATE, camast.BEGINDATE, camast.DUEDATE, camast.FRDATETRANSFER, camast.TODATETRANSFER,
CI.BANKAVLBAL, CI.BANKBALANCE
FROM  SBSECURITIES SYM, ALLCODE A1, ALLCODE A2, SBSECURITIES symto,
 CAMAST, CASCHD  CA, AFMAST AF , CFMAST CF , CIMAST CI
  WHERE
   AF.ACCTNO = CI.ACCTNO AND  A1.CDTYPE = ''CA'' AND A1.CDNAME = ''CASTATUS''
   AND A1.CDVAL = CA.STATUS AND  A2.CDTYPE = ''CA'' AND A2.CDNAME = ''CATYPE''
   AND A2.CDUSER=''Y'' and camast.catype = a2.CDVAL AND CAMAST.CODEID = SYM.CODEID
   AND CAMAST.catype=''014'' AND CAMAST.camastid  = CA.camastid
   AND CA.AFACCTNO = AF.ACCTNO AND AF.CUSTID = CF.CUSTID
   and camast.tocodeid = symto.codeid
   AND CA.status IN( ''V'',''M'')AND CA.status <>''Y''
   AND to_date(camast.begindate,''DD/MM/YYYY'') <= to_date(GETCURRDATE,''DD/MM/YYYY'')
   AND to_date(camast.duedate,''DD/MM/YYYY'') >= to_date(GETCURRDATE,''DD/MM/YYYY'')
   AND CA.Pbalance > 0
   AND AF.ACCTNO LIKE ''%<$AFACCTNO>%''', 'CAMAST', '', '', '3394', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');