SET DEFINE OFF;
se.qtty - se.sendqtty-se.released qtty  ,sb.codeid,cf.address , cf.idcode  LICENSE
from semortage se, afmast af ,cfmast cf,sbsecurities sb,VW_TLLOG_ALL TL
where substr(se.acctno,1,10)= af.acctno
and NOT EXISTS (select 1 from tllog tl where tl.tltxcd =''2232'' and tl.deltd <> ''Y'' and tl.txstatus =''4'' and txnum = se.txnum and txdate = se.txdate)
and SE.TXNUM = TL.TXNUM AND SE.TXDATE = TL.TXDATE
and af.custid= cf.custid and se.status=''N'' AND SE.DELTD<>''Y'' AND SE.STATUS <> ''C''
and substr(se.acctno,11)= sb.codeid and tl.tltxcd = ''2232'' and se.qtty - se.sendqtty-se.released > 0', 'SEMAST', '', '', '2235', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');