SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_ODMAST_TRADEPLACE_ALL
(TRADEPLACE, ACTYPE, ORDERID, CODEID, AFACCTNO, 
 SEACCTNO, CIACCTNO, TXNUM, TXDATE, TXTIME, 
 EXPDATE, BRATIO, TIMETYPE, EXECTYPE, NORK, 
 MATCHTYPE, VIA, CLEARDAY, CLEARCD, ORSTATUS, 
 PRICETYPE, QUOTEPRICE, STOPPRICE, LIMITPRICE, ORDERQTTY, 
 REMAINQTTY, EXECQTTY, STANDQTTY, CANCELQTTY, ADJUSTQTTY, 
 REJECTQTTY, REJECTCD, CUSTID, EXPRICE, EXQTTY, 
 ICCFCD, ICCFTIED, EXECAMT, EXAMT, FEEAMT, 
 CONSULTANT, VOUCHER, ODTYPE, FEEACR, PORSTATUS, 
 RLSSECURED, SECUREDAMT, MATCHAMT, DELTD, REFORDERID, 
 BANKTRFAMT, BANKTRFFEE, EDSTATUS, CORRECTIONNUMBER, CONTRAFIRM, 
 TRADERID, CLIENTID, CONFIRM_NO, FOACCTNO, HOSESESSION, 
 CONTRAORDERID, PUTTYPE, CONTRAFRM, DFACCTNO, LAST_CHANGE, 
 DFQTTY, STSSTATUS, FEEBRATIO, TLID, SSAFACCTNO, 
 ADVIDREF, NOE, GRPORDER, GRPAMT, EXCFEEAMT, 
 EXCFEEREFID, ISDISPOSAL, TAXRATE, TAXSELLAMT, CANCELSTATUS)
BEQUEATH DEFINER
AS 
select fn_symbol_tradeplace(od.codeid,TO_CHAR(od.TXDATE ,'DD/MM/YYYY')) tradeplace, od."ACTYPE",od."ORDERID",od."CODEID",od."AFACCTNO",od."SEACCTNO",od."CIACCTNO",od."TXNUM",od."TXDATE",od."TXTIME",od."EXPDATE",od."BRATIO",od."TIMETYPE",od."EXECTYPE",od."NORK",od."MATCHTYPE",od."VIA",od."CLEARDAY",od."CLEARCD",od."ORSTATUS",od."PRICETYPE",od."QUOTEPRICE",od."STOPPRICE",od."LIMITPRICE",od."ORDERQTTY",od."REMAINQTTY",od."EXECQTTY",od."STANDQTTY",od."CANCELQTTY",od."ADJUSTQTTY",od."REJECTQTTY",od."REJECTCD",od."CUSTID",od."EXPRICE",od."EXQTTY",od."ICCFCD",od."ICCFTIED",od."EXECAMT",od."EXAMT",od."FEEAMT",od."CONSULTANT",od."VOUCHER",od."ODTYPE",od."FEEACR",od."PORSTATUS",od."RLSSECURED",od."SECUREDAMT",od."MATCHAMT",od."DELTD",od."REFORDERID",od."BANKTRFAMT",od."BANKTRFFEE",od."EDSTATUS",od."CORRECTIONNUMBER",od."CONTRAFIRM",od."TRADERID",od."CLIENTID",od."CONFIRM_NO",od."FOACCTNO",od."HOSESESSION",od."CONTRAORDERID",od."PUTTYPE",od."CONTRAFRM",od."DFACCTNO",od."LAST_CHANGE",od."DFQTTY",od."STSSTATUS",od."FEEBRATIO",od."TLID",od."SSAFACCTNO",od."ADVIDREF",od."NOE",od."GRPORDER",od."GRPAMT",od."EXCFEEAMT",od."EXCFEEREFID",od."ISDISPOSAL",od."TAXRATE",od."TAXSELLAMT", OD."CANCELSTATUS"
from vw_odmast_all od
/
