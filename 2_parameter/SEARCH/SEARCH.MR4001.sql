SET DEFINE OFF;
SELECT b.basketid, b.basketname,''CL'' baskettype,TYP.AUTOID, TYP.SYMBOL, TYP.MRRATIORATE, TYP.MRRATIOLOAN, TYP.MRPRICERATE, TYP.MRPRICELOAN,TYP.MRMAXQTTY,
    fn_getroomusedbybasket(sb.codeid, b.BASKETID) USEDMRMAXQTTY
FROM SECBASKET TYP, sbsecurities sb, basket b
WHERE typ.symbol = sb.symbol AND typ.basketid = b.basketid) bk ORDER BY BASKETID,SYMBOL', 'MRTYPE', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');