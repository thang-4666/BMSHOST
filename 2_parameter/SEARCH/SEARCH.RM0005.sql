SET DEFINE OFF;
FROM TLLOG  TL, CITRAN CI , APPTX  APP, CAMAST CA , afmast af, aisysvar ai , caschd
WHERE TL.TXNUM = CI.TXNUM AND TL.TXDATE = CI.TXDATE  AND CI.REF  = CA.CAMASTID
AND APP.APPTYPE =''CI'' AND APP.TXCD = CI.TXCD AND APP.FIELD =''BALANCE''
and ci.acctno = af.acctno and af.bankname =ai.bankcode  and ca.camastid = caschd.camastid and af.acctno = caschd.afacctno  and caschd.deltd <>''Y''
AND TL.TLTXCD =''3379'' and af.corebank =''Y'' and caschd.corebank <>''C'' ', 'GENERAL', '', '', '6641', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');