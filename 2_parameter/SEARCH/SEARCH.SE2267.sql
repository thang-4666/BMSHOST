SET DEFINE OFF;
    ,sum(standing*(-1)) standing,sum(withdraw) withdraw, sum(deposit) deposit,sum(senddeposit)  senddeposit
    ,sum(dtoclose) dtoclose, sum(blockwithdraw)  blockwithdraw,
     sum(blockdtoclose) blockdtoclose, max(sb.PARVALUE) PARVALUE, max(seif.BASICPRICE) PRICE
from semast se, sbsecurities sb,securities_info seif
where se.codeid = sb.codeid
and sb.codeid = seif.codeid
and sb.refcodeid is not null
group by SB.refcodeid  ', 'SEMAST', 'frmSEMAST', '', '', NULL, 50, 'N', 30, 'NYNNYYYNNN', 'Y', 'T', '', 'N', '', '');