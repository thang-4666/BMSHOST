SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_STSCHD_ALL
(AUTOID, DUETYPE, ACCTNO, REFORDERID, TXDATE, 
 CLEARDAY, CLEARCD, AMT, AAMT, QTTY, 
 AQTTY, FAMT, AFACCTNO, STATUS, DELTD, 
 TXNUM, ORGORDERID, CODEID, PAIDAMT, PAIDFEEAMT, 
 COSTPRICE, CLEARDATE, RIGHTQTTY, ARIGHT, DFAMT)
BEQUEATH DEFINER
AS 
select "AUTOID","DUETYPE","ACCTNO","REFORDERID","TXDATE","CLEARDAY","CLEARCD","AMT","AAMT","QTTY","AQTTY","FAMT","AFACCTNO","STATUS","DELTD","TXNUM","ORGORDERID","CODEID","PAIDAMT","PAIDFEEAMT","COSTPRICE","CLEARDATE","RIGHTQTTY","ARIGHT","DFAMT"
from STSCHD where deltd <> 'Y'
union all
select "AUTOID","DUETYPE","ACCTNO","REFORDERID","TXDATE","CLEARDAY","CLEARCD","AMT","AAMT","QTTY","AQTTY","FAMT","AFACCTNO","STATUS","DELTD","TXNUM","ORGORDERID","CODEID","PAIDAMT","PAIDFEEAMT","COSTPRICE","CLEARDATE","RIGHTQTTY","ARIGHT","DFAMT"
from STSCHDHIST where deltd <> 'Y'
/
