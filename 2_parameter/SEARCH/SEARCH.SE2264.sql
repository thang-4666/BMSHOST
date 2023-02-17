SET DEFINE OFF;
select sed.autoid, ''002'' type,sed.rdate tradedate ,sb.parvalue, SE.costprice PRICE , CF.CUSTODYCD,CF.CUSTID, af.acctno AFACCTNO,SB.CODEID, cf.fullname,cf.idcode,cf.address,sb.symbol,se.STATUS,AF.ACCTNO||SB.CODEID SEACCTNOCR,
AF.ACCTNO||sbwft.CODEID SEACCTNODR
, sed.depotrade TRADE , sed.depoblock blocked
from  sedeposit sed, semast se,afmast af,cfmast cf ,
sbsecurities sb ,sbsecurities sbwft, SECURITIES_INFO SEINFO
where se.afacctno = af.acctno and af.custid = cf.custid and sb.codeid = seinfo.codeid
and se.codeid = sbwft.codeid and sbwft.refcodeid=sb.codeid and sbwft.tradeplace=''006''
and sed.acctno = se.acctno and sed.status =''C'' and sed.depotrade<=se.trade and sed.depoblock<= se.blocked', 'SEMAST', 'frmSEMAST', '', '2264', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');