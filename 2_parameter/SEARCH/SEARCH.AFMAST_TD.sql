SET DEFINE OFF;
substr(cf.custodycd,5,6) custodycd ,
SUBSTR(af.ACCTNO,1,4) || ''.'' || SUBSTR(af.ACCTNO,5,6)
afACCTNO, cf.idcode, cf.fullname, typename, cf.iddate,
cf.idplace
from cfmast cf, afmast af, aftype t
where cf.custid = af.custid and af.actype = t.actype and substr(cf.custodycd,4,1) = ''P'' ', 'AFMAST_TD', ' ', '', '', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');