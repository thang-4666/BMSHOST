SET DEFINE OFF;
FEEAMT
from semortage se, afmast af ,cfmast cf,sbsecurities sb,VW_TLLOG_ALL TL
where substr(se.acctno,1,10)= af.acctno
and SE.TXNUM = TL.TXNUM AND SE.TXDATE = TL.TXDATE
and af.custid= cf.custid and se.status=''N'' AND SE.DELTD<>''Y''
and substr(se.acctno,11)= sb.codeid and tl.tltxcd = ''2232'' and se.sendqtty> 0', 'SEMAST', '', '', '2251', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');