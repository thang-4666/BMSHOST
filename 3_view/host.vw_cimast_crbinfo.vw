SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_CIMAST_CRBINFO
(ACTYPE, ACCTNO, CCYCD, AFACCTNO, CUSTID, 
 OPNDATE, CLSDATE, LASTDATE, DORMDATE, STATUS, 
 PSTATUS, BALANCE, CRAMT, DRAMT, CRINTACR, 
 CRINTDT, ODINTACR, ODINTDT, AVRBAL, MDEBIT, 
 MCREDIT, AAMT, RAMT, BAMT, EMKAMT, 
 MMARGINBAL, MARGINBAL, ICCFCD, ICCFTIED, ODLIMIT, 
 ADINTACR, ADINTDT, FACRTRADE, FACRDEPOSITORY, FACRMISC, 
 MINBAL, ODAMT, NAMT, FLOATAMT, HOLDBALANCE, 
 PENDINGHOLD, PENDINGUNHOLD, COREBANK, RECEIVING, NETTING, 
 MBLOCK, OVAMT, DUEAMT, T0ODAMT, MBALANCE, 
 MCRINTDT, TRFAMT, LAST_CHANGE, DFODAMT, DFDEBTAMT, 
 DFINTDEBTAMT, CIDEPOFEEACR, TRFBUYAMT, INTFLOATAMT, FEEFLOATAMT, 
 DEPOLASTDT, DEPOFEEAMT, HOLDMNLAMT, T0OVDAMT, AVLBALANCE)
BEQUEATH DEFINER
AS 
SELECT CI."ACTYPE",CI."ACCTNO",CI."CCYCD",CI."AFACCTNO",CI."CUSTID",CI."OPNDATE",CI."CLSDATE",CI."LASTDATE",CI."DORMDATE",CI."STATUS",CI."PSTATUS",CI."BALANCE",CI."CRAMT",CI."DRAMT",CI."CRINTACR",CI."CRINTDT",CI."ODINTACR",CI."ODINTDT",CI."AVRBAL",CI."MDEBIT",CI."MCREDIT",CI."AAMT",CI."RAMT",CI."BAMT",CI."EMKAMT",CI."MMARGINBAL",CI."MARGINBAL",CI."ICCFCD",CI."ICCFTIED",CI."ODLIMIT",CI."ADINTACR",CI."ADINTDT",CI."FACRTRADE",CI."FACRDEPOSITORY",CI."FACRMISC",CI."MINBAL",CI."ODAMT",CI."NAMT",CI."FLOATAMT",CI."HOLDBALANCE",CI."PENDINGHOLD",CI."PENDINGUNHOLD",CI."COREBANK",CI."RECEIVING",CI."NETTING",CI."MBLOCK",CI."OVAMT",CI."DUEAMT",CI."T0ODAMT",CI."MBALANCE",CI."MCRINTDT",CI."TRFAMT",CI."LAST_CHANGE",CI."DFODAMT",CI."DFDEBTAMT",CI."DFINTDEBTAMT",CI."CIDEPOFEEACR",CI."TRFBUYAMT",CI."INTFLOATAMT",CI."FEEFLOATAMT",CI."DEPOLASTDT",CI."DEPOFEEAMT",CI."HOLDMNLAMT",CI."T0OVDAMT", NVL(MST.AMT,0) AVLBALANCE
FROM AFMAST AF, CIMAST CI,
    -- Check co bang ke tang tien KH nhung chua chuyen qua NH thi thuc hien + vao suc mua de cho KH dat lenh
       (
          SELECT AFACCTNO ACCTNO, SUM(AMT) AMT
            FROM CRBTRFLOGDTL
            WHERE TXDATE = GETCURRDATE()
                AND TRFCODE = 'TRFSUBTRER'
                AND STATUS = 'S' -- CHI LAY NHUNG BANG KE CO TRANG THAI LA DA GUI SANG BANK
            GROUP BY AFACCTNO
        )MST
WHERE AF.ACCTNO = CI.AFACCTNO AND (AF.COREBANK ='Y' or AF.ALTERNATEACCT ='Y') AND CI.ACCTNO = MST.ACCTNO (+)
/
