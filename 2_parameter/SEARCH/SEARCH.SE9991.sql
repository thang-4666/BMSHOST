SET DEFINE OFF;
select cf.custodycd, af.acctno afacctno, cf.fullname, sb.symbol,
al.qtty, al.price, al.aright, al.pitrate, al.orgorderid, sepitlog_id,txnum,txdate
from sepitallocate al,  afmast af, cfmast cf, sbsecurities sb
where al.afacctno = af.acctno
and af.custid = cf.custid
and al.codeid= sb.codeid
', 'SEMAST', 'frmSEMAST', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');