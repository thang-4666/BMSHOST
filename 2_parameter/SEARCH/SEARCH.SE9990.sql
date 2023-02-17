SET DEFINE OFF;
select se.autoid,cf.custodycd, sb.symbol , af.acctno afacctno, se.qtty, se.mapqtty,
       se.qtty - se.mapqtty remainqtty, cf.fullname, se.camastid, se.pitrate, se.txdate
from sepitlog se, afmast af, cfmast cf , sbsecurities sb
where se.afacctno = af.acctno and af.custid = cf.custid
and se.codeid= sb.codeid
and se.deltd<>''Y''  and se.QTTY-se.MAPQTTY>0
', 'SEMAST', 'frmSEMAST', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');