SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW V_CA3301
(BALANCE, RQTTY, PBALANCE, QTTY, AMT, 
 MQTTY, NMQTTY, AQTTY, AAMT, CAMASTID, 
 CUSTODYCD, CATYPE, CODEID, EXCODEID, SYMBOL, 
 SYMBOLDIS, STATUS, PARVALUE, EXPARVALUE, REPORTDATE, 
 ACTIONDATE, DESCRIPTION, FULLNAME, IDCODE, ADDRESS, 
 INQTTY, REGISQTTY, SENDQTTY, SENDPBALANCE, SENDRQTTY, 
 SENDAMT, ISINCODE)
BEQUEATH DEFINER
AS 
SELECT SUM(balance) balance,SUM(RQTTY) RQTTY, SUM(pbalance) pbalance, SUM(qtty) qtty, SUM(amt) amt, SUM(MQTTY) MQTTY, SUM(NMQTTY) NMQTTY,
SUM(aqtty) aqtty ,SUM(aamt) aamt,
 camastid, custodycd,max(CATYPE) CATYPE ,max(codeid) codeid,max(EXCODEID) EXCODEID, max(SYMBOL) SYMBOL, max(SYMBOLDIS) SYMBOLDIS,
 max(STATUS) STATUS,max(PARVALUE) PARVALUE, max(PARVALUE) EXPARVALUE, max(REPORTDATE) REPORTDATE, max(ACTIONDATE) ACTIONDATE,
 max(description) description,max(fullname) fullname,max(idcode) idcode, max(address) address,
 SUM(INQTTY) INQTTY, SUM(REGISQTTY) REGISQTTY,
 SUM(sendqtty) sendqtty,SUM(sendpbalance)sendpbalance,SUM(sendrqtty)sendrqtty,SUM(sendamt)sendamt, ISINCODE
  FROM v_ca3302 GROUP BY camastid, custodycd, ISINCODE
/
