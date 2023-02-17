SET DEFINE OFF;
SELECT FN_GET_LOCATION(AF.BRID) LOCATION, CF.CUSTODYCD, B.DESACCTNO AFDDI , C.CODEID, C.SYMBOL, C.PARVALUE, A.AFACCTNO,seinf.CURRPRICE,seinf.FLOORPRICE , B.* , CF.IDCODE ,A4.CDCONTENT TRADEPLACE,ROUND(decode(cf.VAT,''Y'',1,0)* B.QTTY*seinf.FLOORPRICE*(SELECT to_number(varvalue) FROM SYSVAR WHERE VARNAME =''TAXRETAIL'')/100) TAX,
CF.FULLNAME
FROM SEMAST A, SERETAIL B, SBSECURITIES C ,AFMAST AF , CFMAST CF ,ALLCODE A4,securities_info seiNF,aftype afty
WHERE A.ACCTNO = B.ACCTNO AND A.CODEID = C.CODEID and  c.codeid = seinf.codeid AND B.QTTY > 0 AND B.STATUS=''N'' AND AF.ACCTNO =A.AFACCTNO AND AF.CUSTID =CF.CUSTID and af.actype=afty.actype
AND A4.CDTYPE = ''SE'' AND A4.CDNAME = ''TRADEPLACE''  AND A4.CDVAL = C.TRADEPLACE
and NOT EXISTS (select 1 from tllog tl where tl.tltxcd =''8878'' and tl.deltd <> ''Y'' and tl.txstatus =''4'' and txnum = b.txnum and txdate = b.txdate)
', 'SEMAST', '', '', '8815', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');