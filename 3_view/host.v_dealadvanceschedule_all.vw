SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW V_DEALADVANCESCHEDULE_ALL
(AFACCTNO, AMT, FULLNAME, CUSTODYCD, COREBANK, 
 EXECAMT, AAMT, FAMT, PAIDAMT, PAIDFEEAMT, 
 VATRATE, FEERATE, FEEBANK, FEECMP, ADVMINAMT, 
 DEPOAMT, MAXDEPOAMT, MINBAL, MINFEEBANK, CMPFEEAMT, 
 BANKFEEAMT, VATAMT, DES, CLEARDATE, DAYS, 
 TXDATE, VAT, ADVAMT, RIGHTVAT, ADTYPE, 
 ADTYPENAME, SRCTYPE, SRCNAME, CIACCTNO, CUSTBANK, 
 REMAINPOOL, CIDRAWNDOWN, BANKDRAWNDOWN, CMPDRAWNDOWN, AUTODRAWNDOWN, 
 FILTERID)
BEQUEATH DEFINER
AS 
(
SELECT MST.AFACCTNO,MST.AMT,MST.FULLNAME,MST.CUSTODYCD,
                MST.COREBANK,MST.EXECAMT,MST.AAMT,MST.FAMT,MST.PAIDAMT,MST.PAIDFEEAMT,
                MST.VATRATE,MST.FEERATE,MST.FEEBANK, MST.FEECMP, MST.advminamt,
                MST.DEPOAMT,DEPOAMT MAXDEPOAMT,MST.MINBAL, MST.MINFEEBANK,
                GREATEST (ROUND(ADVAMT*MST.DAYS*FEECMP/100/360/(1+MST.DAYS*FEECMP/100/360)),MST.MINBAL) CMPFEEAMT,
                GREATEST (ROUND(ADVAMT*MST.DAYS*FEEBANK/100/360/(1+MST.DAYS*FEEBANK/100/360)),MST.MINFEEBANK) BANKFEEAMT,
                GREATEST (ROUND(ADVAMT*MST.DAYS*FEECMP/100/360/(1+MST.DAYS*FEECMP/100/360)),MST.MINBAL)* avatrate /100 +
                GREATEST (ROUND(ADVAMT*MST.DAYS*FEEBANK/100/360/(1+MST.DAYS*FEEBANK/100/360)),MST.MINFEEBANK) * avatrate /100 VATAMT, /*10/100 VATAMT,*/
                MST.DES,MST.CLEARDATE,MST.DAYS, MST.TXDATE,
                avatrate  VAT, ADVAMT, RIGHTVAT, MST.ADTYPE, MST.ADTYPENAME, MST.SRCTYPE, MST.SRCNAME, MST.ciacctno, MST.custbank, MST.REMAINPOOL,
                CIDRAWNDOWN, BANKDRAWNDOWN, CMPDRAWNDOWN,
                (CASE WHEN BANKDRAWNDOWN=1 THEN 0 ELSE 1 END) AUTODRAWNDOWN,
                MST.AFACCTNO || MST.ADTYPE || to_char(MST.TXDATE,'DDMMYYYY') || to_char(MST.CLEARDATE,'DDMMYYYY') FILTERID

        FROM (
                SELECT  STS.AFACCTNO,STS.AMT,CF.FULLNAME,CF.CUSTODYCD,CASE WHEN CI.COREBANK='Y' THEN 0 ELSE 1 END COREBANK,
                    STS.EXECAMT,STS.AAMT,STS.FAMT,STS.PAIDAMT,STS.PAIDFEEAMT,
                    STS.VATRATE,STS.FEERATE,STS.ADVBANKRATE FEEBANK, STS.advminamt, STS.ADVMINFEEBANK MINFEEBANK,sts.rightvat,
                    STS.ADVRATE FEECMP,STS.ADVMINFEE MINBAL,
                    'Ung truoc tien ban ngay ' || to_char(STS.TXDATE,'DD/MM/YYYY') || ' thanh toan ngay ' || to_char(STS.CLEARDATE,'DD/MM/YYYY')   DES,
                    STS.CLEARDATE,STS.DAYS, STS.TXDATE,
                    ROUND(LEAST(LEAST(
                    (STS.AMT - EXFEEAMT)/(1+(STS.DAYS*ADVRATE/100/360+STS.DAYS*ADVBANKRATE/100/360))-sts.rightvat,
                    (STS.AMT - EXFEEAMT)/(1+STS.DAYS*ADVBANKRATE/100/360) - STS.ADVMINFEE-sts.rightvat,
                    (STS.AMT - EXFEEAMT)/(1+STS.DAYS*ADVRATE/100/360) - STS.ADVMINFEEBANK-sts.rightvat,
                    (STS.AMT - EXFEEAMT-STS.ADVMINFEE-STS.ADVMINFEEBANK)-sts.rightvat
                    ),abs(CI.BALANCE)) ,0) DEPOAMT,
                    LEAST(STS.AMT - EXFEEAMT - sts.rightvat,
                            ABS(CI.BALANCE)
                                + GREATEST (ROUND(ABS(CI.BALANCE)*STS.DAYS*ADVRATE/100/360),STS.ADVMINFEE)
                                + GREATEST (ROUND(ABS(CI.BALANCE)*STS.DAYS*ADVBANKRATE/100/360),STS.ADVMINFEEBANK)
                                ) ADVAMT,
                    STS.ADTYPE, STS.ADTYPENAME, STS.RRTYPE SRCTYPE, A1.CDCONTENT SRCNAME, sts.ciacctno, sts.custbank, sts.avatrate,
                    fn_getavailablepool(STS.ADTYPE, STS.RRTYPE)  REMAINPOOL,
                    decode(STS.RRTYPE, 'O', 1,0) CIDRAWNDOWN,
                    decode(STS.RRTYPE, 'B', 1,0) BANKDRAWNDOWN,
                    decode(STS.RRTYPE, 'C', 1,0) CMPDRAWNDOWN
                FROM v_advanceSchedule_all sts, AFMAST AF, CIMAST CI, CFMAST CF, ALLCODE A1
                WHERE STS.AFACCTNO =AF.ACCTNO
                        AND AF.CUSTID=CF.CUSTID
                        AND CI.AFACCTNO=AF.ACCTNO
                        AND CI.BALANCE < 0
                        AND STS.RRTYPE = A1.CDVAL AND A1.CDTYPE='LN' AND A1.CDNAME ='RRTYPE'
        ) MST
        WHERE DEPOAMT >= 0 AND ADVAMT >= MST.ADVMINAMT AND DAYS>0
)
/
