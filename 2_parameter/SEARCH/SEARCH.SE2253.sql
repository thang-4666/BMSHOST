SET DEFINE OFF;
from semortage se, afmast af ,cfmast cf,sbsecurities sb,VW_TLLOG_ALL TL
where substr(se.acctno,1,10)= af.acctno
and SE.TXNUM = TL.TXNUM AND SE.TXDATE = TL.TXDATE
and af.custid= cf.custid AND SE.DELTD<>''Y''
and substr(se.acctno,11)= sb.codeid and se.status = ''N'' and se.tltxcd = ''2233'' and se.sendqtty> 0', 'SEMAST', '', '', '2253', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');