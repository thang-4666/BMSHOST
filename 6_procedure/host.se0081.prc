SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "SE0081"
   (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   I_DATE         IN       VARCHAR2,
   PV_CUSTODYCD   IN       VARCHAR2

   ) IS


   V_STROPT         VARCHAR2(5);
   V_STRBRID        VARCHAR2(100);
   V_STRCUSTODYCD   VARCHAR2(50);


BEGIN

      V_STROPT := OPT;

   IF (V_STROPT <> 'A') AND (pv_BRID <> 'ALL')
   THEN
      V_STRBRID := pv_BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;

V_STRCUSTODYCD:=UPPER(PV_CUSTODYCD);
     ---GET REPORT DATA:

OPEN PV_REFCURSOR
FOR
SELECT TO_DATE(I_DATE,'DD/MM/YYYY') CUR, FULLNAME, CUSTODYCD, ADDRESS, IDCODE, IDDATE,IDPLACE, TCPH_NAME,SUM(NAMT) AMT, FIELD,SYMBOL, SYMBOL1,SUM(TOTAL) TOTAL,AVGPRICE
FROM(
       SELECT CF.FULLNAME,CF.CUSTODYCD, CF.ADDRESS, CF.IDCODE, CF.IDDATE,CF.IDPLACE, ISS.FULLNAME TCPH_NAME,
              TL.namt, TL.field,(case when SB.REFSYMBOL is null then SB.SYMBOL else SB.REFSYMBOL end) SYMBOL,
              SB.SYMBOL SYMBOL1, NVL(TL.NAMT,0)*SE.AVGPRICE TOTAL,SE.AVGPRICE
       FROM (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF, AFMAST AF1,AFMAST AF2, AFTYPE AFT1, AFTYPE AFT2, MRTYPE MR1, MRTYPE MR2,
               VW_SETRAN_GEN TL,VW_TLLOGFLD_ALL FLD1, VW_TLLOGFLD_ALL FLD2,
               (
                 SELECT SB.CODEID, SB.SYMBOL,SB.PARVALUE,SB.ISSUERID,
                       (CASE WHEN SB.REFCODEID IS NULL THEN SB.TRADEPLACE ELSE SB1.TRADEPLACE END) TRADEPLACE,
                       SB1.CODEID REFCODEID, SB1.SYMBOL REFSYMBOL
                 FROM SBSECURITIES SB, SBSECURITIES SB1
                 WHERE SB.REFCODEID = SB1.CODEID(+)
                       and sb.sectype <> '004') SB,
               ISSUERS ISS,  (SELECT CODEID, AVGPRICE,getcurrdate TXDATE FROM SECURITIES_INFO
                       UNION ALL SELECT CODEID, AVGPRICE,HISTDATE TXDATE FROM SECURITIES_INFO_HIST) SE
       WHERE  CF.CUSTODYCD=TL.CUSTODYCD
          AND SUBSTR(TL.acctno,11,6)=SB.CODEID
          AND TL.TLTXCD='2242'
          AND TL.field IN ('TRADE','BLOCKED')
          AND TL.TXTYPE='D'
          AND ISS.ISSUERID=SB.ISSUERID
          AND SB.CODEID=SE.CODEID
          AND SE.TXDATE=TL.TXDATE
          AND TL.TXDATE = TO_DATE(I_DATE,'DD/MM/YYYY')
          AND CF.CUSTODYCD=V_STRCUSTODYCD
          AND TL.TXDATE=FLD1.TXDATE AND TL.TXNUM=FLD1.TXNUM AND FLD1.FLDCD='02'
          AND TL.TXDATE=FLD2.TXDATE AND TL.TXNUM=FLD2.TXNUM AND FLD2.FLDCD='04'
          AND FLD1.CVALUE=AF1.ACCTNO AND AF1.ACTYPE=AFT1.ACTYPE AND AFT1.MRTYPE=MR1.ACTYPE AND MR1.MRTYPE='N'
          AND FLD2.CVALUE=AF2.ACCTNO AND AF2.ACTYPE=AFT2.ACTYPE AND AFT2.MRTYPE=MR2.ACTYPE AND MR2.MRTYPE='T')
GROUP BY FULLNAME, CUSTODYCD, ADDRESS, IDCODE, IDDATE,IDPLACE, TCPH_NAME, FIELD,SYMBOL, SYMBOL1,AVGPRICE
ORDER BY SYMBOL,SYMBOL1,field
         ;


EXCEPTION
    WHEN OTHERS THEN
        RETURN ;
END; -- Procedure

 
 
 
 
/
