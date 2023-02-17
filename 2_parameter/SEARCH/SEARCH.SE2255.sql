SET DEFINE OFF;
  SEC.SYMBOL, SE.COSTPRICE, CF2.PCOD BUYRPCOD,SEC.PARVALUE,
  NVL(D.BICCODE, ''XXAAXXAA'') || CASE WHEN CF2.COUNTRY <> ''234'' THEN ''-CUSF''
                                          WHEN CF2.COUNTRY = ''234'' THEN ''-CUSD''
                                          WHEN SUBSTR(SEO.RECUSTODYCD,4,1) =''F'' THEN ''-CUSF''
                                          ELSE ''-CUSD'' END BUYRDAAS,
  s1.varvalue||SEO.Autoid trfnum 
  FROM SESENDOUT SEO, CFMAST CF, AFMAST AF, SBSECURITIES SEC,SEMAST SE, CFMAST CF2, DEPOSIT_MEMBER D, sysvar s1
  WHERE SUBSTR(SEO.ACCTNO,0,10)=AF.ACCTNO
  AND AF.CUSTID=CF.CUSTID
  AND SEC.CODEID=SEO.CODEID
  AND SE.ACCTNO=SEO.ACCTNO
  and seo.trade+seo.blocked+seo.caqtty>0
  AND SEO.RECUSTODYCD = CF2.CUSTODYCD (+)
  AND SEO.OUTWARD = D.DEPOSITID (+)
  and NOT EXISTS (select 1 from tllog tl where tl.tltxcd =''2244'' and tl.deltd <> ''Y'' and tl.txstatus =''4'' and txnum = SEO.txnum and txdate = SEO.txdate)
  and deltd =''N''
  And s1.grname =''SYSTEM'' and s1.varname =''COMPANYSHORTNAME''', 'SEMAST', 'frmSEMAST', '', '2255', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');