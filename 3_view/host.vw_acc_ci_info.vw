SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_ACC_CI_INFO
(AFACCTNO, CASH_RECEIVING_T0, CASH_RECEIVING_T1, CASH_RECEIVING_T2, CASH_RECEIVING_T3, 
 CASH_RECEIVING_TN, CASH_SENDING_T0, CASH_SENDING_T1, CASH_SENDING_T2, CASH_SENDING_T3, 
 CASH_SENDING_TN, ADVT1, ADVT2, ADVT3)
BEQUEATH DEFINER
AS 
SELECT ST.AFACCTNO,
SUM(CASE WHEN ST.DUETYPE='RM' AND ST.TDAY=0 THEN AMT ELSE 0 END) CASH_RECEIVING_T0,
SUM(CASE WHEN ST.DUETYPE='RM' AND ST.TDAY=1 THEN AMT ELSE 0 END) CASH_RECEIVING_T1,
SUM(CASE WHEN ST.DUETYPE='RM' AND ST.TDAY=2 THEN AMT ELSE 0 END) CASH_RECEIVING_T2,
SUM(CASE WHEN ST.DUETYPE='RM' AND ST.TDAY=3 THEN AMT ELSE 0 END) CASH_RECEIVING_T3,
SUM(CASE WHEN ST.DUETYPE='RM' AND ST.TDAY>3 THEN AMT ELSE 0 END) CASH_RECEIVING_TN,
SUM(CASE WHEN ST.DUETYPE='SM' AND ST.TDAY=0 THEN AMT ELSE 0 END) CASH_SENDING_T0,
SUM(CASE WHEN ST.DUETYPE='SM' AND ST.TDAY=1 THEN AMT ELSE 0 END) CASH_SENDING_T1,
SUM(CASE WHEN ST.DUETYPE='SM' AND ST.TDAY=2 THEN AMT ELSE 0 END) CASH_SENDING_T2,
SUM(CASE WHEN ST.DUETYPE='SM' AND ST.TDAY=3 THEN AMT ELSE 0 END) CASH_SENDING_T3,
SUM(CASE WHEN ST.DUETYPE='SM' AND ST.TDAY>3 THEN AMT ELSE 0 END) CASH_SENDING_TN,
SUM(DECODE(ST.DUETYPE||ST.TDAY, 'RM1', ROUND(AMT*NVL(ST.NDAY,0)*NVL(ADVFEE.INTRATE,0)/(100*360),0), 0)) ADVT1,
SUM(DECODE(ST.DUETYPE||ST.TDAY, 'RM2', ROUND(AMT*NVL(ST.NDAY,0)*NVL(ADVFEE.INTRATE,0)/(100*360),0), 0)) ADVT2,
SUM(DECODE(ST.DUETYPE||ST.TDAY, 'RM3', ROUND(AMT*NVL(ST.NDAY,0)*NVL(ADVFEE.INTRATE,0)/(100*360),0), 0)) ADVT3
FROM ALLCODE CD1, VW_STRADE_FEE_ADV_PAYMENT ADVFEE,
(
SELECT ST.AFACCTNO, ST.DUETYPE, ST.CLEARDAY-SP_BD_GETCLEARDAY(ST.CLEARCD, SB.TRADEPLACE, ST.TXDATE, TO_DATE(SYSVAR.VARVALUE,'DD/MM/RRRR')) TDAY,
st.cleardate - TO_DATE(SYSVAR.VARVALUE,'DD/MM/RRRR') NDAY
, sum(ST.AMT-ST.AAMT-ST.FAMT) AMT
FROM STSCHD ST, SYSVAR, SBSECURITIES SB WHERE SYSVAR.VARNAME = 'CURRDATE' AND ST.CODEID = SB.CODEID
AND (DUETYPE='RM' OR DUETYPE = 'SM') AND ST.STATUS='N'
GROUP BY ST.AFACCTNO, ST.DUETYPE, ST.CLEARDAY-SP_BD_GETCLEARDAY(ST.CLEARCD, SB.TRADEPLACE, ST.TXDATE, TO_DATE(SYSVAR.VARVALUE,'DD/MM/RRRR')),
st.cleardate - TO_DATE(SYSVAR.VARVALUE,'DD/MM/RRRR')
) ST
WHERE CD1.CDTYPE='OD' AND CD1.CDNAME='DUETYPE' AND ST.DUETYPE=CD1.CDVAL 
GROUP BY ST.AFACCTNO
/
