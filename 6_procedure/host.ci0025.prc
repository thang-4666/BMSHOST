SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CI0025" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   TXNUM          IN       VARCHAR2
 )
IS
--
-- PURPOSE: BRIEFLY EXPLAIN THE FUNCTIONALITY OF THE PROCEDURE
-- Hop dong vay ung truoc tien ban chung khoan
-- MODIFICATION HISTORY
-- PERSON      DATE         COMMENTS
-- ThanhNM   04-03-2012    CREATED
-- ---------   ------  -------------------------------------------
   V_STROPTION      VARCHAR2 (5);            -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STRBRID        VARCHAR2 (4);                   -- USED WHEN V_NUMOPTION > 0
   V_TXNUM          VARCHAR2 (20);
   V_STRAFACCTNO    VARCHAR2(10);

BEGIN
   V_STROPTION := OPT;
   V_STRAFACCTNO:='';
   IF (V_STROPTION <> 'A') AND (pv_BRID <> 'ALL')
   THEN
      V_STRBRID := pv_BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;

-- GET REPORT'S PARAMETERS
   V_TXNUM    := TXNUM;

 SELECT acctno  INTO V_STRAFACCTNO  FROM ADSCHD WHERE AUTOID = V_TXNUM;
-- GET REPORT'S DATA
    OPEN  PV_REFCURSOR FOR

    SELECT A.*,NVL(B.ODAVLAMT,0) ODAVLAMT   FROM
    (
    SELECT CF.CUSTID, CF.CUSTODYCD, AF.ACCTNO, CF.FULLNAME, CF.ADDRESS, CF.IDTYPE, CF.IDCODE, CF.IDDATE,
           CF.IDPLACE, SCH.CLEARDT, SCH.ODDATE, SCH.TXDATE, SCH.TXNUM,
           (TO_DATE(SCH.CLEARDT, 'DD/MM/RRRR') - TO_DATE(SCH.TXDATE,'DD/MM/RRRR')) ADVDAYS,
           SCH.AMT, (SCH.FEEAMT ) FEEAMT, (SCH.AMT + SCH.FEEAMT ) ADVAMT,
           SCH.PAIDAMT,ADT.ADVRATE
    FROM (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF, AFMAST AF, ADSCHD SCH, ADTYPE ADT
    WHERE CF.CUSTID = AF.CUSTID AND AF.ACCTNO = SCH.ACCTNO
    AND SCH.ADTYPE = ADT.ACTYPE
    AND SCH.DELTD='N' AND SCH.AUTOID = V_TXNUM ) A
    LEFT JOIN
    (
    SELECT STS.AFACCTNO, STS.CLEARDATE, STS.TXDATE,
    SUM(STS.AMT) EXECAMT,
    SUM(CASE WHEN MST.FEEACR<=0 THEN ODT.DEFFEERATE*STS.AMT/100 ELSE MST.FEEACR END) BRKFEEAMT,
       --Phi moi gioi
    SUM(STS.ARIGHT) RIGHTTAX, --thue co tuc
    SUM(TO_NUMBER(SY0.VARVALUE)*STS.AMT/100) INCOMETAXAMT, --thue ban
    SUM(STS.AMT) - SUM(CASE WHEN MST.FEEACR<=0 THEN ODT.DEFFEERATE*STS.AMT/100 ELSE MST.FEEACR END)
    - SUM(STS.ARIGHT) - SUM(TO_NUMBER(SY0.VARVALUE)*STS.AMT/100)  ODAVLAMT
    FROM (SELECT * FROM STSCHD UNION ALL SELECT * FROM STSCHDHIST ) STS,
    (SELECT * FROM  ODMAST UNION ALL SELECT * FROM ODMASTHIST) MST, SYSVAR SY0, ODTYPE ODT, SBSECURITIES SB
    WHERE STS.ORGORDERID=MST.ORDERID AND STS.CODEID=SB.CODEID AND MST.ACTYPE = ODT.ACTYPE
    AND STS.DELTD <> 'Y' AND STS.DUETYPE='RM'
    AND SY0.VARNAME = 'ADVSELLDUTY' AND SY0.GRNAME = 'SYSTEM'
    AND STS.AFACCTNO = V_STRAFACCTNO
    GROUP BY  STS.AFACCTNO,STS.CLEARDATE, STS.TXDATE
    ) B
    ON A.CLEARDT = B.CLEARDATE AND A.ODDATE = B.TXDATE AND A.ACCTNO = B.AFACCTNO
    ;


EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;                                                              -- PROCEDURE

 
 
 
 
/
