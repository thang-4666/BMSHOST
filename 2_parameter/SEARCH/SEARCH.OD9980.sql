SET DEFINE OFF;
cd1.cdcontent bors, cd2.cdcontent norp, ood.qtty, ood.price,cd3.CDCONTENT tradeplace,mst.PRICETYPE PRICETYPE
from ood, allcode cd1,  allcode cd2,odmast mst,sbsecurities sb,allcode cd3
where cd1.cdtype=''OD'' and cd1.cdname=''BORS'' and cd1.cdval=ood.bors and mst.orderid=ood.orgorderid
and sb.codeid=ood.codeid and OOD.bors in (''B'',''S'')
and cd2.cdtype=''OD'' and cd2.cdname=''NORP'' and cd2.cdval=ood.norp
AND cd3.cdtype=''OD'' AND cd3.CDNAME = ''TRADEPLACE'' AND cd3.CDVAL=sb.tradeplace
and oodstatus=''S'' and orgorderid not in (select orderid from stcorderbook)', 'ODMAST', '', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', 'CUSTODYCD');