SET DEFINE OFF;
, af.acctno AFACCTNO,af.acctno ciacctno,od.orderqtty ORDERQTTY, od.quoteprice ORDERPRICE, io.matchprice MATCHPRICE,io.matchqtty MATCHQTTY,io.matchprice* io.matchqtty EXECAMT, AL.CDCONTENT EXECTYPE
from tllog tl, odmast od , sbsecurities sb, cfmast cf, afmast af,iod io,allcode al
where tl.msgacct= od.orderid and tl.tltxcd in(''8804'',''8809'')
and sb.codeid= od.codeid and od.afacctno = af.acctno
and af.custid= cf.custid and io.txnum= tl.txnum
and io.txdate = tl.txdate   and tl.deltd <>''Y'' AND OD.errod =''N''
and (SELECT COUNT(*) FROM sbbatchsts WHERE bchdate = getcurrdate AND bchsts =''Y'')=0
and al.cdtype =''OD'' AND AL.CDNAME=''EXECTYPE'' AND AL.CDVAL =OD.EXECTYPE', 'ODMAST', '', '', '8835', NULL, -1, 'N', 30, '', 'Y', 'T', '', 'N', '', '');