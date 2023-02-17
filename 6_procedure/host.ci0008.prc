SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE ci0008 (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2
       )
IS
--
-- PURPOSE: BRIEFLY EXPLAIN THE FUNCTIONALITY OF THE PROCEDURE
-- BAO CAO THONG KE PHI LUU KY
-- MODIFICATION HISTORY
-- PERSON      DATE    COMMENTS
-- NGOCVTT   20-07-15  CREATED
-- ---------   ------  -------------------------------------------

   V_STROPTION    VARCHAR2 (5);            -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STRBRID      VARCHAR2 (4);            -- USED WHEN V_NUMOPTION > 0
   V_STRAFACCTNO  VARCHAR2 (20);
   V_STRCCYCD     VARCHAR2(20);
   V_STRAFTYPE    VARCHAR2(10);
   V_STRTYPELG    VARCHAR2(10);
   V_STRSTATUS    VARCHAR2(10);

BEGIN
   V_STROPTION := OPT;

   IF (V_STROPTION <> 'A') AND (pv_BRID <> 'ALL')
   THEN
      V_STRBRID := pv_BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;

   -- GET REPORT'S PARAMETERS


    -- GET REPORT'S DATA

OPEN PV_REFCURSOR
FOR
 SELECT  SE.TXDATE,
--Ngay 23/03/2017 CW NamTv them sectype 011 
              SUM(CASE WHEN  SUBSTR(CF.CUSTODYCD,4,1)='F' AND SB.SECTYPE IN ('001','002','007','008','111','011') THEN SE.QTTY*SE.DAYS ELSE 0 END) OUT_CP,
              SUM(CASE WHEN  SUBSTR(CF.CUSTODYCD,4,1)='F' AND SB.SECTYPE IN ('003','006','222') THEN SE.QTTY*SE.DAYS ELSE 0 END) OUT_TP,
              SUM(CASE WHEN  SUBSTR(CF.CUSTODYCD,4,1)='C' AND SB.SECTYPE IN ('001','002','007','008','111','011') THEN SE.QTTY*SE.DAYS ELSE 0 END) IN_CP,
              SUM(CASE WHEN SUBSTR(CF.CUSTODYCD,4,1)='C' AND SB.SECTYPE IN ('003','006','222') THEN SE.QTTY*SE.DAYS ELSE 0 END) IN_TP,
              SUM(CASE WHEN SUBSTR(CF.CUSTODYCD,4,1)='P' AND SB.SECTYPE IN ('001','002','007','008','111','011') THEN SE.QTTY*SE.DAYS ELSE 0 END) TD_CP,
              SUM(CASE WHEN SUBSTR(CF.CUSTODYCD,4,1)='P' AND SB.SECTYPE IN ('003','006','222') THEN SE.QTTY*SE.DAYS ELSE 0 END) TD_TP,
              ROUND(SUM(NVL(SE.QTTY*SE.VSDFEEAMT*SE.DAYS/30,0))) FEE

      FROM SEDEPOBAL SE, AFMAST AF, (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF,SBSECURITIES SB
      WHERE AF.CUSTID=CF.CUSTID
              AND AF.ACCTNO=SUBSTR(SE.ACCTNO,1,10)
              AND SB.CODEID=SUBSTR(SE.ACCTNO,11,6)
              AND SE.DELTD<>'Y'
              AND SB.ISSEDEPOFEE='Y'
              AND SB.SECTYPE IN ('001','002','007','008','111','003','006','222','011') --Ngay 23/03/2017 CW NamTv them sectype 011
              AND SE.TXDATE BETWEEN TO_DATE(F_DATE,'DD/MM/YYYY') AND TO_DATE(T_DATE,'DD/MM/YYYY')
              GROUP BY SE.TXDATE
              ORDER BY TXDATE;

EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;                                                              -- PROCEDURE
 
/