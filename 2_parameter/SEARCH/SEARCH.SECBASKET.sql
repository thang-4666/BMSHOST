SET DEFINE OFF;
SELECT TYP.AUTOID, TYP.SYMBOL, TYP.MRRATIORATE, TYP.MRRATIOLOAN, TYP.MRPRICERATE, TYP.MRPRICELOAN,TYP.MRMAXQTTY,
    fn_getroomusedbybasket(sb.codeid, BASKETID) USEDMRMAXQTTY, sb.basicprice, typ.ISCATEGORY
FROM SECBASKET TYP, securities_info sb
WHERE typ.symbol = sb.symbol and typ.BASKETID=''<$KEYVAL>'') bk ORDER BY SYMBOL', 'SA.SECBASKET', 'frmSECBASKET', '', '', 0, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');