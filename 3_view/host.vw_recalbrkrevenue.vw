SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_RECALBRKREVENUE
(ACTYPE, REACCTNO, AFACCTNO, TXDATE, BRKREVENUE, 
 FRDATE)
BEQUEATH DEFINER
AS 
SELECT AF.ACTYPE, REMST.ACCTNO REACCTNO, MST.AFACCTNO, MST.TXDATE, SUM(MST.FEEACR) BRKREVENUE, MAX(REMST.DAMTLASTDT) FRDATE
FROM REAFLNK LNK, REMAST REMST, SYSVAR, ODMAST MST, AFMAST AF
WHERE AF.ACCTNO=MST.AFACCTNO AND MST.FEEACR>0
AND REMST.ACCTNO=LNK.REACCTNO AND REMST.STATUS='A' AND SYSVAR.GRNAME='SYSTEM' AND SYSVAR.VARNAME='CURRDATE'
AND TO_DATE(SYSVAR.VARVALUE,'DD/MM/RRRR')>=LNK.FRDATE AND TO_DATE(SYSVAR.VARVALUE,'DD/MM/RRRR')<=LNK.TODATE
AND MST.AFACCTNO=LNK.AFACCTNO AND TO_DATE(MST.TXDATE,'DD/MM/RRRR')>NVL(REMST.DAMTLASTDT,TO_DATE(SYSVAR.VARVALUE,'DD/MM/RRRR'))
GROUP BY MST.TXDATE, REMST.ACCTNO, MST.AFACCTNO, AF.ACTYPE
UNION ALL
SELECT AF.ACTYPE, REMST.ACCTNO REACCTNO, MST.AFACCTNO, MST.TXDATE, SUM(MST.FEEACR) BRKREVENUE, MAX(REMST.DAMTLASTDT) FRDATE
FROM REAFLNK LNK, REMAST REMST, SYSVAR, ODMASTHIST MST, AFMAST AF
WHERE AF.ACCTNO=MST.AFACCTNO AND MST.FEEACR>0
AND REMST.ACCTNO=LNK.REACCTNO AND REMST.STATUS='A' AND SYSVAR.GRNAME='SYSTEM' AND SYSVAR.VARNAME='CURRDATE'
AND TO_DATE(SYSVAR.VARVALUE,'DD/MM/RRRR')>=LNK.FRDATE AND TO_DATE(SYSVAR.VARVALUE,'DD/MM/RRRR')<=LNK.TODATE
AND MST.AFACCTNO=LNK.AFACCTNO AND TO_DATE(MST.TXDATE,'DD/MM/RRRR')>NVL(REMST.DAMTLASTDT,TO_DATE(SYSVAR.VARVALUE,'DD/MM/RRRR'))
GROUP BY MST.TXDATE, REMST.ACCTNO, MST.AFACCTNO, AF.ACTYPE
/