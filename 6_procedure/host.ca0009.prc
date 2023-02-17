SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CA0009" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   CACODE         IN       VARCHAR2,
   CUSTODYCD       IN       VARCHAR2,
   TLID           IN       VARCHAR2
  )
IS
--
-- PURPOSE: BRIEFLY EXPLAIN THE FUNCTIONALITY OF THE PROCEDURE
-- BAO CAO TAI KHOAN TIEN TONG HOP CUA NGUOI DAU TU
-- MODIFICATION HISTORY
-- PERSON      DATE    COMMENTS
-- HUNG.LB    23/Aug/2010 UPDATED
-- TRUONGLD MODIFYED 10/04/2010
-- CHAUNH them dk, ten moi gioi 11/05/2012
-- ---------   ------  -------------------------------------------

    CUR             PKG_REPORT.REF_CURSOR;
    V_STROPTION    VARCHAR2 (5);            -- A: ALL; B: BRANCH; S: SUB-BRANCH
    V_STRBRID      VARCHAR2 (4);
    V_STRCACODE    VARCHAR2 (20);
    V_STRCUSTODYCD   VARCHAR2 (20);

BEGIN
   V_STROPTION := OPT;

   IF (V_STROPTION <> 'A') AND (pv_BRID <> 'ALL')
   THEN
      V_STRBRID := pv_BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;

   IF (CACODE <> 'ALL')
   THEN
      V_STRCACODE := CACODE;
   ELSE
      V_STRCACODE := '%%';
   END IF;

    V_STRCUSTODYCD := upper(CUSTODYCD);

   -- GET REPORT'S PARAMETERS

--Tinh ngay nhan thanh toan bu tru


OPEN PV_REFCURSOR
   FOR
    SELECT CF.CUSTODYCD, CF.FULLNAME,CF.MOBILE ,CF.IDCODE, CF.IDDATE,
        CF.IDPLACE,CF.ADDRESS,AF.ACCTNO, ISS.FULLNAME SYMBOL_NAME, SB.SYMBOL,
        SB.PARVALUE,CA.DUEDATE, SUM(CAS.TRADE) TRADE, CA.DESCRIPTION,
        SUM(  CAS.PQTTY+CAS.QTTY) BALANCE, AF.BANKACCTNO, AL.CDCONTENT BANKNAME,
        CA.EXPRICE,AF.COREBANK, al2.CDCONTENT COUNTRY, ca.reportdate
    FROM CAMAST CA,CASCHD CAS,(SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF , AFMAST AF,SBSECURITIES SB,ISSUERS ISS, ALLCODE AL,
        ALLCODE AL2
    WHERE CA.CAMASTID = CAS.CAMASTID
        AND CAS.AFACCTNO = AF.ACCTNO AND AF.CUSTID = CF.CUSTID
        AND CA.CATYPE='014'
        AND NVL(CA.TOCODEID,CA.CODEID) = SB.CODEID--AND CAS.CODEID =SB.CODEID
        AND SB.ISSUERID= ISS.ISSUERID AND CAS.DELTD  <> 'Y' AND CAS.STATUS<>'O'
        AND AL.CDVAL = AF.BANKNAME AND AL.CDNAME ='BANKNAME' AND AL.CDTYPE ='CF'
        AND AL2.CDNAME ='COUNTRY' AND AL2.CDTYPE ='CF' and al2.cdval = cf.country
        AND CA.CAMASTID = V_STRCACODE
        AND CF.CUSTODYCD LIKE V_STRCUSTODYCD
GROUP BY CF.CUSTODYCD, CF.FULLNAME,CF.MOBILE ,CF.IDCODE,CF.IDDATE,CF.IDPLACE,CF.ADDRESS,AF.ACCTNO,
    ISS.FULLNAME ,SB.SYMBOL,SB.PARVALUE,CA.DUEDATE, CA.DESCRIPTION, AF.BANKACCTNO,AL.CDCONTENT,CA.EXPRICE,AF.COREBANK,
    al2.CDCONTENT, ca.reportdate
;

EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;                                                              -- PROCEDURE
 
 
 
 
/