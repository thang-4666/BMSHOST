SET DEFINE OFF;
sb.parvalue,(se.qtty-se.sendqtty-se.released) qtty,sb.codeid,cf.address, cf.idcode LICENSE
from semortage se, afmast af ,cfmast cf,sbsecurities sb
where substr(se.acctno,1,10)= af.acctno
and af.custid= cf.custid AND SE.DELTD<>''Y''
and substr(se.acctno,11)= sb.codeid and se.status = ''N'' and se.tltxcd = ''2233''
and (se.qtty-se.sendqtty-se.released)>0 ', 'SEMAST', '', '', '2256', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');