SET DEFINE OFF;
from odmast od, stschd sts , sbsecurities sb
where od.orderid=sts.orgorderid  and od.codeid=sb.codeid and sb.tradeplace=''003''
and sts.duetype=''SM'' and sts.deltd <>''Y'' and sts.status =''N''
and od.deltd <>''Y''
group by orderid) where 0=0', 'ODMAST', '', '', '8825', NULL, 50, 'N', 30, '', 'Y', 'T', '', 'N', '', '');