SET DEFINE OFF;
CUSTNAME,cf.custodycd,sb.symbol,sb.parvalue,
    se.qtty,sb.codeid,cf.address,cf.idcode LICENSE
from semortage se, afmast af ,cfmast cf,sbsecurities sb,VW_TLLOG_ALL TL
where substr(se.acctno,1,10)= af.acctno
and SE.TXNUM = TL.TXNUM AND SE.TXDATE = TL.TXDATE
and af.custid= cf.custid AND SE.DELTD<>''Y'' and se.sstatus = ''N''
and substr(se.acctno,11)= sb.codeid and se.status = ''N'' and se.tltxcd = ''2233''', 'SEMAST', '', '', '2237', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');