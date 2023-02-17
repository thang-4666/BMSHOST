SET DEFINE OFF;
select mst.*, mrmaxqtty-usedmrmaxqtty remainmrmaxqtty from (
select a.actype aftype, c.typename, b.codeid, b.SYMBOL,a.MRRATIORATE,a.MRRATIOLOAN,a.MRPRICERATE,a.MRPRICELOAN,
    a.MRMAXQTTY, fn_getroomusedbybasket(b.codeid, lnb.BASKETID) USEDMRMAXQTTY
from AFSERISK  a, sbsecurities b, aftype c, lnsebasket lnb
where a.codeid=b.codeid and a.actype =c.actype AND c.actype = ''<$KEYVAL>''
and c.lntype = lnb.actype ) mst where 0=0
', 'SECURITIES_INFO', '', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');