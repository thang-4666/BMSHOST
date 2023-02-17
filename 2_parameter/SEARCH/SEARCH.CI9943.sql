SET DEFINE OFF;
       sts.qtty-sts.aqtty pqtty, v.dfqtty ,v.bqtty,v.rlsqtty,v.DESCRIPTION,
       greatest(round((sts.qtty-sts.aqtty + v.rlsqtty) * v.amt/(v.remainqtty + v.rlsqtty)
                          -v.rlsamt,4),0) paidamt, OD.TLNAME username, A1.CDCONTENT VIA
from stschd sts, v_getDealInfo v,
     afmast af, cfmast cf, sbsecurities sb,
     vw_order_by_broker od, ALLCODE A1
where sts.orgorderid = od.orderid and od.dfacctno = v.acctno
and od.afacctno = af.acctno and af.custid=cf.custid
  AND STS.DELTD <> ''Y'' AND STS.STATUS=''N'' AND STS.DUETYPE=''RM''
  and od.EXECTYPE=''MS'' and sts.qtty-aqtty>0
  and od.codeid=sb.codeid AND OD.via = A1.CDVAL
  AND A1.CDTYPE = ''OD'' AND A1.CDNAME = ''VIA''', 'CIMAST', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');