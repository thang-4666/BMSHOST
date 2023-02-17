SET DEFINE OFF;
ca.optcodeid codeid,sb.symbol ISSNAME, cf.custodycd,cf.idcode LICENSE,cf.iddate,cf.idplace,
cf.fullname CUSTNAME,CF.ADDRESS,
catrf.autoid refid,catrf.CUSTNAME2,catrf.LICENSE2,
catrf.ADDRESS2, catrf.IDDATE2,catrf.IDPLACE2,catrf.COUNTRY2,
catrf.TOACCTNO,catrf.TOMEMCUS,cas.autoid, nvl(ca.tocodeid,ca.codeid) tocodeid,
sb_org.symbol SYMBOL_ORG,
ca.codeid codeid_org, ca.isincode,
catrf.feeamt, catrf.VSDSTOCKTYPE
from catransfer catrf,camast ca, caschd cas,cfmast cf ,afmast af ,sbsecurities sb,
sbsecurities sb_org
where
CAS.STATUS IN (''V'',''M'') and cas.outbalance>0
and ca.camastid = cas.camastid  and nvl(ca.tocodeid,ca.codeid) = sb.codeid
and cas.afacctno = af.acctno
and af.custid = cf.custid
and cas.autoid=catrf.caschdid
AND catrf.status=''P''
and ca.codeid=sb_org.codeid
and CATRF.MSGSTATUS in (''P'',''N'',''R'')', 'CAMAST', '', '', '3353', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', 'CUSTODYCD');