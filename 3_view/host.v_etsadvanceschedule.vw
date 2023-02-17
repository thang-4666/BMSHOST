SET DEFINE OFF;
CREATE OR REPLACE FORCE VIEW V_ETSADVANCESCHEDULE
(ISMORTAGE, AFACCTNO, AMT, QTTY, FULLNAME, 
 ADDRESS, LICENSE, FAMT, CUSTODYCD, SYMBOL, 
 AAMT, ORGORDERID, PAIDAMT, PAIDFEEAMT, FEERATE, 
 MINBAL, TXDATE, DES, CLEARDATE, DAYS, 
 DEPOAMT, MAXDEPOAMT, ADVAMT)
BEQUEATH DEFINER
AS 
(
SELECT ISMORTAGE,AFACCTNO,AMT,QTTY,FULLNAME,ADDRESS,LICENSE,FAMT,CUSTODYCD,SYMBOL,AAMT,ORGORDERID,PAIDAMT,
            PAIDFEEAMT,FEERATE,MINBAL,TXDATE,DES,CLEARDATE,DAYS,
            GREATEST(LEAST(ROUND(ADVAMT*(1-FEERATE*DAYS/100/360)), ADVAMT-MINBAL),0) DEPOAMT,
            GREATEST(LEAST(ROUND(ADVAMT*(1-FEERATE*DAYS/100/360)), ADVAMT-MINBAL),0) MAXDEPOAMT,
            GREATEST(ADVAMT,0) ADVAMT
        FROM (
            SELECT  1 ISMORTAGE,STSCHD.AFACCTNO,AMT,QTTY,CFMAST.FULLNAME,CFMAST.ADDRESS,CFMAST.idcode LICENSE,FAMT,
                    CUSTODYCD,STSCHD.SYMBOL,AAMT,ORGORDERID,PAIDAMT,PAIDFEEAMT,
                    SYSVAR1.VARVALUE FEERATE,SYSVAR2.VARVALUE MINBAL,STSCHD.TXDATE,
                    'UTTB cua lenh ' || STSCHD.SYMBOL || ' so ' || substr(ORGORDERID,11,6) || ' khop ngay ' || STSCHD.TXDATE  DES, STSCHD.CLEARDATE,
                (CASE WHEN CLEARDATE -(CASE WHEN LENGTH(SYSVAR.VARVALUE)=10 THEN TO_DATE(SYSVAR.VARVALUE,'DD/MM/YYYY') ELSE CLEARDATE END)=0 THEN 1 ELSE   CLEARDATE -(CASE WHEN LENGTH(SYSVAR.VARVALUE)=10 THEN TO_DATE(SYSVAR.VARVALUE,'DD/MM/YYYY') ELSE CLEARDATE END)END) DAYS,
                ROUND(LEAST(AMT*(100-ODTYPE.DEFFEERATE-STSCHD.SECDUTY)/100,
                      AMT*(100-STSCHD.SECDUTY)/100-ODTYPE.MINFEEAMT)-AAMT-FAMT+PAIDAMT+PAIDFEEAMT) ADVAMT
            FROM
            (SELECT STS.ORGORDERID,STS.TXDATE,MAX(STS.AFACCTNO) AFACCTNO, MAX(STS.CODEID) CODEID,
                    MAX(STS.CLEARDAY) CLEARDAY,MAX(STS.CLEARCD) CLEARCD,SUM(STS.AMT) AMT,
                    SUM(STS.QTTY) QTTY,SUM(STS.FAMT) FAMT,SUM(STS.AAMT) AAMT,SUM(STS.PAIDAMT) PAIDAMT,
                    SUM(STS.PAIDFEEAMT) PAIDFEEAMT,MAX(MST.actype) ACTYPE,MAX(MST.EXECTYPE) EXECTYPE,
                    MAX(AF.custid) CUSTID,max(sts.CLEARDATE) CLEARDATE,MAX(SEC.SYMBOL) SYMBOL,
                   (CASE WHEN MAX(cf.VAT)='Y' THEN TO_NUMBER(MAX(SYS.VARVALUE)) ELSE 0 END) SECDUTY
                FROM STSCHD STS,ODMAST MST,AFMAST AF,SBSECURITIES SEC, AFTYPE TYP, SYSVAR SYS, cfmast cf
                WHERE STS.codeid=SEC.codeid AND STS.orgorderid=MST.orderid and mst.afacctno=af.acctno and af.custid = cf.custid
                AND STS.DELTD <> 'Y' AND STS.STATUS='N' AND STS.DUETYPE='RM' and MST.EXECTYPE<>'MS'
                AND MST.VIA='W' and mst.txdate = (SELECT to_date(SYSVAR.varvalue,'DD/MM/YYYY') FROM SYSVAR WHERE SYSVAR.VARNAME='CURRDATE' AND SYSVAR.GRNAME='SYSTEM')
                    AND AF.ACTYPE=TYP.ACTYPE AND SYS.VARNAME='ADVSELLDUTY' AND SYS.GRNAME='SYSTEM'
                    GROUP BY STS.ORGORDERID,STS.TXDATE
             ) STSCHD,SYSVAR,SYSVAR SYSVAR1,SYSVAR SYSVAR2,ODTYPE,CFMAST
            WHERE AMT+PAIDAMT-AAMT>0
            AND SYSVAR.VARNAME='CURRDATE' AND SYSVAR.GRNAME='SYSTEM'
            AND SYSVAR1.VARNAME='AINTRATE' AND SYSVAR1.GRNAME='SYSTEM'
            AND SYSVAR2.VARNAME='AMINBAL' AND SYSVAR2.GRNAME='SYSTEM'
            AND STSCHD.CUSTID=CFMAST.CUSTID
            AND STSCHD.ACTYPE=ODTYPE.ACTYPE
        ) A WHERE DAYS>0 AND ADVAMT>0
)
/
