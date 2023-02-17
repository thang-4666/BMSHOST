SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW V_GETACCOUNTAVLADVANCE_TDAY
(CUSTODYCD, AMT, AFACCTNO, AAMT, FAMT, 
 PAIDAMT, PAIDFEEAMT, VATRATE, CLEARDATE, TDAY, 
 DEPOAMT)
BEQUEATH DEFINER
AS 
(
SELECT  sts.custodycd,STS.AMT,STS.AFACCTNO,STS.AAMT,STS.FAMT,STS.PAIDAMT,STS.PAIDFEEAMT,
    STS.VATRATE,STS.CLEARDATE,STS.TDAY,
    greatest(ROUND(LEAST(
        (STS.AMT - EXFEEAMT)*(1-(STS.DAYS*AINTRATE/100/360+STS.DAYS*AFEEBANK/100/360)),
        (STS.AMT - EXFEEAMT)*(1-STS.DAYS*AFEEBANK/100/360)-STS.AMINBAL,
        (STS.AMT - EXFEEAMT)*(1-STS.DAYS*AINTRATE/100/360)-STS.AMINFEEBANK,
        (STS.AMT - EXFEEAMT-STS.AMINBAL-STS.AMINFEEBANK)
        ) ,0),0) DEPOAMT
FROM
v_advanceSchedule_TDAY sts
)
/
