SET DEFINE OFF;
sb.symbol ,od.orderid,sts.codeid,od.ORDERQTTY,od.QUOTEPRICE,STS1.ACCTNO SEACCTNO
FROM stschd sts, stschd sts1,afmast af, cfmast cf,sbsecurities sb,
     odmast od , aftype aft,mrtype mr
where sts.orgorderid = sts1.orgorderid
and sts.afacctno = af.acctno
and af.custid = cf.custid
and sts.codeid = sb.codeid
and af.actype = aft.actype
and aft.mrtype = mr.actype
AND sts.duetype=''SM'' AND sts.deltd<>''Y'' AND STS.STATUS =''C''
AND sts1.duetype=''RS'' AND sts1.deltd<>''Y'' AND STS1.STATUS =''N''
and mr.mrtype = ''N''
and od.orderid = sts.orgorderid', 'ODMAST', '', 'TXDATE DESC, CUSTODYCD, SYMBOL, ORDERID', '8830', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', 'CUSTID');