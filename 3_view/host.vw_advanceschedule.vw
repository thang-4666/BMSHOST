SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW VW_ADVANCESCHEDULE
(CUSTODYCD, CUSTID, FULLNAME, ACCTNO, AUTOADV, 
 ACTYPE, ISVSD, TRFBANK, COREBANK, BANKACCT, 
 BANKCODE, CLEARDATE, TXDATE, CURRDATE, MAXAVLAMT, 
 EXECAMT, AMT, AAMT, PAIDAMT, PAIDFEEAMT, 
 BRKFEEAMT, RIGHTTAX, INCOMETAXAMT, DAYS, FAMT, 
 CLEARDAY, CLEARCD, TRADEPLACE)
BEQUEATH DEFINER
AS 
(

SELECT CF.CUSTODYCD, CF.CUSTID, CF.FULLNAME, AF.ACCTNO, AF.AUTOADV, AF.ACTYPE, NVL(ISVSD,'N') ISVSD,
  --B? THAM S? ÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â? G?I B?NG KÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Â¦Ãƒâ€šÃ‚Â  CHO TÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã‚Â¢ÃƒÂ¢Ã¢â€šÂ¬Ã…Â¡Ãƒâ€šÃ‚Â¬I KHO?N K?T N?I COREBANK
    (CASE WHEN CI.COREBANK='Y' THEN 1 ELSE 0 END) TRFBANK,
    (CASE WHEN CI.COREBANK='Y' THEN 1 ELSE 0 END) COREBANK,
    (CASE WHEN CI.COREBANK='Y' THEN AF.BANKACCTNO ELSE NULL END) BANKACCT,
    (CASE WHEN CI.COREBANK='Y' THEN AF.BANKNAME ELSE NULL END) BANKCODE,
    RF.CLEARDATE, RF.TXDATE, TO_DATE(SY1.varvalue,'DD/MM/YYYY') CURRDATE,
   /*ROUND( RF.EXECAMT-RF.AAMT-RF.BRKFEEAMT-RF.RIGHTTAX- CASE WHEN ODTAXSELLAMT >0
                                                            THEN ODTAXSELLAMT
                                                            ELSE DECODE (CF.VAT,'Y',ADVSELLDUTYRATE,'N',0)*EXECAMT/100 + DECODE (CF.WHTAX,'Y',WHTAXRATE,'N',0)*EXECAMT/100
                                                            END,4) MAXAVLAMT,*/
        ROUND( RF.netexecamt-RF.AAMT-RF.BRKFEEAMT-RF.RIGHTTAX- CASE WHEN ODTAXSELLAMT > 0 THEN ODTAXSELLAMT ELSE TAXSELL END,4) MAXAVLAMT, -- hsx04
   ROUND( RF.EXECAMT,4) EXECAMT, ROUND(RF.AMT,4) AMT, RF.AAMT, RF.PAIDAMT, RF.PAIDFEEAMT, RF.BRKFEEAMT, RF.RIGHTTAX,
   --(case when cf.vat='Y' OR cf.WHTAX='Y' then RF.INCOMETAXAMT else 0 end) INCOMETAXAMT,
   -- CASE WHEN ODTAXSELLAMT >0 THEN ODTAXSELLAMT ELSE DECODE (CF.VAT,'Y',ADVSELLDUTYRATE,'N',0)*EXECAMT/100 + DECODE (CF.WHTAX,'Y',WHTAXRATE,'N',0)*EXECAMT/100 END INCOMETAXAMT,
    CASE WHEN ODTAXSELLAMT > 0 THEN ODTAXSELLAMT ELSE TAXSELL END INCOMETAXAMT, -- hsx04
   --(CASE WHEN RF.CLEARDATE - TO_DATE(SY1.varvalue,'DD/MM/YYYY') =0 THEN 1 ELSE RF.CLEARDATE -TO_DATE(SY1.varvalue,'DD/MM/YYYY') END) DAYS,
    (CASE WHEN RF.CLEARDATE - TO_DATE(SY1.varvalue,'DD/MM/YYYY') =0 and RF.CLEARDATE > RF.TXDATE THEN 1 ELSE RF.CLEARDATE -TO_DATE(SY1.varvalue,'DD/MM/YYYY') END) DAYS,-- hsx04
    RF.FAMT, RF.CLEARDAY, RF.CLEARCD, RF.TRADEPLACE --ngoc.vu-Jira561
FROM AFMAST AF, CIMAST CI, CFMAST CF, SYSVAR SY1,
--Nh?ng deal chua UTTB: Seach ra vÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â  n?p vÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â o giao d?ch 1153: Giao d?ch nÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â y cho ch?n ngu?n
(
     SELECT STS.AFACCTNO, STS.CLEARDATE, STS.TXDATE,NVL(ISVSD,'N') ISVSD,
        SUM(case when NVL(DF.EXECQTTY,0) > 0 then DF.EXECQTTY else STS.QTTY end *  (STS.AMT/STS.QTTY) ) EXECAMT,
        SUM(DECODE(ISVSD,'Y',DF.FAMT,NVL(STS.FAMT,0) - nvl(DFVSD.FAMT,0))) FAMT,
        SUM(DECODE(ISVSD,'Y',DF.AAMT,STS.AAMT - nvl(DFVSD.AAMT,0))) AAMT,
        SUM(STS.PAIDAMT) PAIDAMT, SUM(STS.PAIDFEEAMT) PAIDFEEAMT,
        SUM(case when NVL(DF.EXECQTTY,0) > 0 then DF.EXECQTTY else STS.QTTY end *  (STS.AMT/STS.QTTY)
            - DECODE(ISVSD,'Y',DF.AAMT,STS.AAMT - nvl(DF.AAMT,0))
            - DECODE(ISVSD,'Y',DF.FAMT,NVL(STS.FAMT,0) - nvl(DF.FAMT,0)) + STS.PAIDAMT + STS.PAIDFEEAMT) AMT,
        /*SUM(CASE WHEN (MST.FEEACR<=0 AND MST.TXDATE=TO_DATE(SYS.VARVALUE,'DD/MM/RRRR'))
                 THEN round(ODT.DEFFEERATE* (case when NVL(DF.EXECQTTY,0) > 0 then DF.EXECQTTY else STS.QTTY end *  (STS.AMT/STS.QTTY))/100)
                 ELSE MST.FEEACR END) BRKFEEAMT,*/
        SUM((CASE WHEN (MST.FEEACR<=0 AND MST.TXDATE=TO_DATE(SYS.VARVALUE,'DD/MM/RRRR'))
              THEN round(ODT.DEFFEERATE* (case when NVL(DF.EXECQTTY,0) > 0 then DF.EXECQTTY else STS.QTTY end *  (STS.AMT/STS.QTTY))/100)
              ELSE MST.FEEACR - MST.Feeamt END)) BRKFEEAMT, -- hsx04
        --SUM(STS.ARIGHT) RIGHTTAX, --THU? C? T?C
        SUM(STS.ARIGHT - DECODE(MST.NETEXECAMT+MST.CFNETEXECAMT, MST.EXECAMT, STS.ARIGHT, CEIL((MST.NETEXECAMT+MST.CFNETEXECAMT)*STS.ARIGHT/MST.EXECAMT))) RIGHTTAX, -- hsx04
       -- SUM(case when mst.TAXSELLAMT > 0 then mst.TAXSELLAMT else round((TO_NUMBER(SY0.VARVALUE)+TO_NUMBER(SY1.VARVALUE) )*(case when NVL(DF.EXECQTTY,0) > 0 then DF.EXECQTTY else STS.QTTY end *  (STS.AMT/STS.QTTY) )/100) end) INCOMETAXAMT,
        --SUM(mst.TAXSELLAMT) ODTAXSELLAMT,
        SUM(mst.TAXSELLAMT - DECODE(MST.NETEXECAMT + MST.CFNETEXECAMT, MST.EXECAMT, MST.TAXSELLAMT, CEIL((MST.NETEXECAMT + MST.CFNETEXECAMT)* MST.TAXSELLAMT/MST.EXECAMT))) ODTAXSELLAMT, -- hsx04
        MAX(TO_NUMBER(SY0.VARVALUE)) ADVSELLDUTYRATE,
        MAX(TO_NUMBER(SY1.VARVALUE)) WHTAXRATE,
        MAX(STS.CLEARDAY) CLEARDAY, MAX(STS.CLEARCD) CLEARCD, MAX(SB.TRADEPLACE) TRADEPLACE,
        sum((case when NVL(DF.EXECQTTY,0) > 0 then DF.EXECQTTY else STS.QTTY end *  (STS.AMT/STS.QTTY)) - mst.netexecamt - mst.cfnetexecamt) netexecamt -- hsx04
        ,sum(ROUND((DECODE (CF.VAT,'Y',TO_NUMBER(SY0.VARVALUE),'N',0)*(case when NVL(DF.EXECQTTY,0) > 0 then DF.EXECQTTY else STS.QTTY end *  (STS.AMT/STS.QTTY ) - mst.netexecamt - mst.cfnetexecamt )/100
            + DECODE (CF.WHTAX,'Y',TO_NUMBER(SY1.VARVALUE),'N',0)*(case when NVL(DF.EXECQTTY,0) > 0 then DF.EXECQTTY else STS.QTTY end *  (STS.AMT/STS.QTTY) - mst.netexecamt - mst.cfnetexecamt )/100),0)) TAXSELL

    FROM STSCHD STS, SYSVAR SY0, ODTYPE ODT, SBSECURITIES SB, ODMAST MST, SYSVAR SY1, AFMAST AF, CFMAST CF,
        (
        SELECT ORDERID,ODM.ISVSD, sum(ODM.EXECQTTY) EXECQTTY, sum(ODM.AAMT) AAMT, sum(ODM.FAMT) FAMT
            FROM ODMAPEXT ODM WHERE DELTD <> 'Y' GROUP BY ORDERID,ODM.ISVSD
        ) DF,
        (
         SELECT ORDERID, sum(ODM.EXECQTTY) EXECQTTY, sum(decode(ISVSD,'Y',ODM.AAMT,0)) AAMT, sum(decode(ISVSD,'Y',ODM.FAMT,0)) FAMT
            FROM ODMAPEXT ODM WHERE DELTD <> 'Y' GROUP BY ORDERID
        ) DFVSD,
        (SELECT VARVALUE FROM SYSVAR WHERE VARNAME='CURRDATE' AND GRNAME='SYSTEM') SYS

    WHERE STS.ORGORDERID=MST.ORDERID AND STS.CODEID=SB.CODEID AND MST.ACTYPE = ODT.ACTYPE
        AND STS.DELTD <> 'Y' AND STS.STATUS='N' AND STS.DUETYPE='RM'
        AND SY0.VARNAME = 'ADVSELLDUTY' AND SY0.GRNAME = 'SYSTEM'
        AND SY1.VARNAME = 'WHTAX' AND SY1.GRNAME = 'SYSTEM'
        and NVL(mst.grporder,'N')<>'Y'
        AND MST.errod = 'N'
        AND MST.ORDERID =DFVSD.ORDERID (+)
        AND MST.ORDERID = DF.ORDERID (+)
        --AND MST.ADVVSD <> 'Y' -- KHONG LAY CAM CO VSD
        AND MST.AFACCTNO = AF.ACCTNO AND AF.CUSTID=CF.CUSTID AND CF.CUSTATCOM='Y'
    GROUP BY STS.AFACCTNO, STS.CLEARDATE, STS.TXDATE,NVL(ISVSD,'N')

) RF
WHERE RF.AFACCTNO=AF.ACCTNO (+) AND CI.AFACCTNO=AF.ACCTNO AND AF.CUSTID=CF.CUSTID AND CF.CUSTATCOM='Y' --LOAI DI NHUNG TAI KHOAN LUU KY BEN NGOAI
    --AND CI.COREBANK <> 'Y'  --Khong cho UTTB loai tai khoan Corebank
    AND SY1.VARNAME='CURRDATE' AND SY1.GRNAME='SYSTEM'
)
/