SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW V_CONTRAORDER
(ACTYPE, ORDERID, CODEID, AFACCTNO, SEACCTNO, 
 CIACCTNO, TXNUM, TXDATE, TXTIME, EXPDATE, 
 BRATIO, TIMETYPE, EXECTYPE, NORK, MATCHTYPE, 
 VIA, CLEARDAY, CLEARCD, ORSTATUS, PRICETYPE, 
 QUOTEPRICE, STOPPRICE, LIMITPRICE, ORDERQTTY, REMAINQTTY, 
 EXECQTTY, STANDQTTY, CANCELQTTY, ADJUSTQTTY, REJECTQTTY, 
 REJECTCD, CUSTID, EXPRICE, EXQTTY, ICCFCD, 
 ICCFTIED, EXECAMT, EXAMT, FEEAMT, CONSULTANT, 
 VOUCHER, ODTYPE, FEEACR, PORSTATUS, RLSSECURED, 
 SECUREDAMT, MATCHAMT, DELTD, REFORDERID, BANKTRFAMT, 
 BANKTRFFEE, EDSTATUS, CORRECTIONNUMBER, CONTRAFIRM, TRADERID, 
 CLIENTID, CONFIRM_NO, FOACCTNO, HOSESESSION, CONTRAORDERID, 
 PUTTYPE, CONTRAFRM, CONTRAAFACCTNO, CONTRATRADEPHONE, CONTRACUSTODYCD, 
 CONTRAFULLNAME)
BEQUEATH DEFINER
AS 
SELECT a."ACTYPE",a."ORDERID",a."CODEID",a."AFACCTNO",a."SEACCTNO",a."CIACCTNO",a."TXNUM",a."TXDATE",a."TXTIME",a."EXPDATE",a."BRATIO",a."TIMETYPE",a."EXECTYPE",a."NORK",a."MATCHTYPE",a."VIA",a."CLEARDAY",a."CLEARCD",a."ORSTATUS",a."PRICETYPE",a."QUOTEPRICE",a."STOPPRICE",a."LIMITPRICE",a."ORDERQTTY",a."REMAINQTTY",a."EXECQTTY",a."STANDQTTY",a."CANCELQTTY",a."ADJUSTQTTY",a."REJECTQTTY",a."REJECTCD",a."CUSTID",a."EXPRICE",a."EXQTTY",a."ICCFCD",a."ICCFTIED",a."EXECAMT",a."EXAMT",a."FEEAMT",a."CONSULTANT",a."VOUCHER",a."ODTYPE",a."FEEACR",a."PORSTATUS",a."RLSSECURED",a."SECUREDAMT",a."MATCHAMT",a."DELTD",a."REFORDERID",a."BANKTRFAMT",a."BANKTRFFEE",a."EDSTATUS",a."CORRECTIONNUMBER",a."CONTRAFIRM",a."TRADERID",a."CLIENTID",a."CONFIRM_NO",a."FOACCTNO",a."HOSESESSION",a."CONTRAORDERID",a."PUTTYPE",a."CONTRAFRM",AF.ACCTNO CONTRAAFACCTNO, cf.mobilesms CONTRATRADEPHONE, CF.CUSTODYCD CONTRACUSTODYCD, CF.FULLNAME CONTRAFULLNAME
 FROM ODMAST A,ODMAST OD, AFMAST AF, CFMAST CF
WHERE  A.CONTRAORDERID =OD.ORDERID(+) AND OD.AFACCTNO =AF.ACCTNO(+) AND AF.CUSTID=CF.CUSTID(+)
/
