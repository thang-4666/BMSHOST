SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_STRADE_CA_REGRIGHTOFF
(CUSTODYCD, AFACCTNO, SYMBOL, SYMNAME, CAMASTID, 
 STATUS, CATYPE, BALANCE, QTTY, PQTTY, 
 TOTALQTTY, RIGHTOFFRATE, EXPRICE, REPORTDATE, FRDATETRANSFER, 
 TODATETRANSFER, DUEDATE, ACTIONDATE)
BEQUEATH DEFINER
AS 
(
SELECT  CF.CUSTODYCD, CA.AFACCTNO, SYM.SYMBOL, ISU.Fullname SYMNAME, CAMAST.CAMASTID, A1.CDCONTENT STATUS, A2.CDCONTENT CATYPE,
CA.balance + CA.pbalance BALANCE, CA.QTTY, CA.PQTTY, CA.QTTY+CA.PQTTY TOTALQTTY, CAMAST.RIGHTOFFRATE,
CAMAST.EXPRICE, CAMAST.REPORTDATE, CAMAST.FRDATETRANSFER, CAMAST.todatetransfer, CAMAST.DUEDATE, CAMAST.ACTIONDATE
FROM SBSECURITIES SYM, SBSECURITIES OPTSYM, ALLCODE A1, CAMAST, CASCHD CA, AFMAST AF, CFMAST CF, CIMAST CI, ALLCODE A2, issuers ISU, sysvar sys
WHERE AF.ACCTNO = CI.ACCTNO AND CA.AFACCTNO = AF.ACCTNO AND AF.CUSTID = CF.CUSTID
AND CAMAST.CODEID = SYM.CODEID AND CAMAST.OPTCODEID = OPTSYM.CODEID AND CAMAST.camastid  = CA.camastid
AND CA.status IN( 'A','M') AND CA.DELTD <>'Y' AND CAMAST.catype='014' AND CA.PBALANCE > 0 AND CA.PQTTY > 0
AND A1.CDTYPE = 'CA' AND A1.CDNAME = 'CASTATUS' AND A1.CDVAL = CA.STATUS
AND SYS.VARNAME = 'CURRDATE' AND SYS.GRNAME = 'SYSTEM' AND CAMAST.duedate >= TO_DATE (VARVALUE,'DD/MM/RRRR')
AND CAMAST.CATYPE = A2.CDVAL AND A2.CDTYPE = 'CA' AND A2.CDNAME = 'CATYPE'
AND SYM.Issuerid = ISU.ISSUERID)
/
