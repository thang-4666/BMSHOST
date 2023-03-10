SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CF0023" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   PV_BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,
   FROM_DATE         IN       VARCHAR2,
   TO_DATE         IN       VARCHAR2,
  -- BRGID          IN       VARCHAR2,

   CAREBY         IN       VARCHAR2,
   I_BRIDGD      IN       VARCHAR2,
   MAKER            IN       VARCHAR2,
   CHECKER         IN       VARCHAR2
)
IS
--
-- PURPOSE: BRIEFLY EXPLAIN THE FUNCTIONALITY OF THE PROCEDURE
--
-- MODIFICATION HISTORY
-- PERSON      DATE    COMMENTS
-- HUYNQ               CREATED
--NGOCVTT EDIT 27/06/15
-- ---------   ------  -------------------------------------------
   V_STROPTION        VARCHAR2 (5);       -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STRBRID          VARCHAR2 (4);              -- USED WHEN V_NUMOPTION > 0
   V_STRAFACCTNO     VARCHAR2 (16);
   V_STRBRGID           VARCHAR2 (10);

   V_STRCAREBY       VARCHAR2 (20);
   V_MAKER           VARCHAR2 (50);
   V_CHECKER          VARCHAR2 (50);
   V_I_BRID           VARCHAR2(40);
-- DECLARE PROGRAM VARIABLES AS SHOWN ABOVE
BEGIN
   V_STROPTION := OPT;

   IF (V_STROPTION <> 'A') AND (PV_BRID <> 'ALL')
   THEN
      V_STRBRID := PV_BRID;
   ELSE
      V_STRBRID := '%%';
   END IF;

   -- GET REPORT'S PARAMETERS

  --IF (BRGID  <> 'ALL')
  -- THEN
     -- V_STRBRGID  := BRGID;
  -- ELSE
      --V_STRBRGID := '%%';
  -- END IF;



       IF (CAREBY  <> 'ALL')
   THEN
      V_STRCAREBY := CAREBY;
   ELSE
      V_STRCAREBY := '%%';
   END IF;

      IF (MAKER IS NULL OR UPPER(MAKER) = 'ALL')
   THEN
      V_MAKER := '%';
   ELSE
      V_MAKER := MAKER;
   END IF;

       IF (CHECKER IS NULL OR UPPER(CHECKER) = 'ALL')
   THEN
      V_CHECKER := '%';
   ELSE
      V_CHECKER := CHECKER;
   END IF;


       IF (I_BRIDGD IS NULL OR UPPER(I_BRIDGD) = 'ALL')
   THEN
      V_I_BRID := '%';
   ELSE
      V_I_BRID := I_BRIDGD;
   END IF;

   -- END OF GETTING REPORT'S PARAMETERS

   -- GET REPORT'S DATA
   IF (V_STROPTION <> 'A') AND (PV_BRID <> 'ALL')
   THEN
      OPEN PV_REFCURSOR
       FOR
 SELECT distinct (CF.AUT1||CF.AUT2||CF.AUT3||CF.AUT4||CF.AUT5/*||CF.AUT6*/||CF.AUT7||CF.AUT8||CF.AUT9||CF.AUT10||CF.AUT11||CF.AUT12) LINKAUTH,
  CF.FULLNAME ,CF.CUSTODYCD  ,CF.IDCODE ,CF.ADDRESS ,
  CF.FULLNAMEAUTH  FULLNAMEAUTH ,CF.LICENSENO ,CF.VALDATE ,CF.EXPDATE, CF.ADDRESSAUT, MAKER, CHECKER, BRID,BRNAME,USERHUY,STATUS
 FROM ( SELECT
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,1,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '1' ) END)AUT1,
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,2,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '2' ) END)AUT2,
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,3,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '3' ) END)AUT3,
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,4,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '4' ) END)AUT4,
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,5,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '5' ) END)AUT5,
 --( CASE WHEN SUBSTR(CFA.LINKAUTH,6,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '6' ) END)AUT6,
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,7,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '7' ) END)AUT7,
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,8,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '8' ) END)AUT8,
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,9,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '9' ) END)AUT9,
  ( CASE WHEN SUBSTR(CFA.LINKAUTH,10,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '10' ) END)AUT10,
     ( CASE WHEN SUBSTR(CFA.LINKAUTH,11,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '11' ) END)AUT11,
    ( CASE WHEN SUBSTR(CFA.LINKAUTH,12,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '12' ) END)AUT12,
  CF1.FULLNAME ,AF.ACCTNO ,CF1.CUSTODYCD  ,CF1.IDCODE ,CF1.IDDATE , CF1.ADDRESS,
                   case when cfa.custid is null then CFA.FULLNAME else cf2.fullname end FULLNAMEAUTH,
                   case when cfa.custid is null then cfa.LICENSENO else cf2.idcode end LICENSENO,
                   CFA.VALDATE ,CFA.EXPDATE,
                   case when cfa.custid is null then cfa.ADDRESS else cf2.address end ADDRESSAUT,
                     NVL(USER_ID.MAKER,'')MAKER,NVL(USER_ID.CHECKER,'')CHECKER,CF1.BRID,BR.BRNAME,NVL(USER_ID2.MAKER ,'') USERHUY, CFA.DELTD STATUS
         FROM (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF1, AFMAST AF ,BRGRP BR,
          CFAUTH CFA, CFMAST CF2,(   SELECT MA.TO_VALUE CUSTID,MA.MAKER_ID,MA.APPROVE_ID, SUBSTR(MA.RECORD_KEY,11,10) CFCUSTID,NVL(TLP.TLNAME,'') MAKER,NVL(TLP1.TLNAME,'') CHECKER,MIN(MA.MAKER_DT)
    FROM MAINTAIN_LOG MA, TLPROFILES TLP, TLPROFILES TLP1
    WHERE MA.TABLE_NAME='CFMAST' AND MA.ACTION_FLAG='ADD'
    AND MA.CHILD_TABLE_NAME='CFAUTH' AND MA.COLUMN_NAME='CUSTID'
    AND MA.MAKER_ID=TLP.TLID(+)
    AND MA.APPROVE_ID=TLP1.TLID(+)
      AND NVL(MA.MAKER_ID,'000') LIKE V_MAKER
       AND NVL(MA.APPROVE_ID,'000') LIKE V_CHECKER
    GROUP BY MA.RECORD_KEY,TLP.TLNAME,TLP1.TLNAME,MA.TO_VALUE,MA.MAKER_ID,MA.APPROVE_ID ) USER_ID,
    (SELECT MA.TO_VALUE CUSTID,MA.MAKER_ID, SUBSTR(MA.RECORD_KEY,11,10) CFCUSTID,NVL(TLP.TLNAME,'') MAKER,NVL(TLP1.TLNAME,'') CHECKER,MIN(MA.MAKER_DT)
    FROM MAINTAIN_LOG MA, TLPROFILES TLP, TLPROFILES TLP1
    WHERE MA.TABLE_NAME='CFMAST' AND MA.ACTION_FLAG='DELETE'
    AND MA.CHILD_TABLE_NAME='CFAUTH' /*AND MA.COLUMN_NAME='CUSTID'*/
    AND MA.MAKER_ID=TLP.TLID(+)
    AND MA.APPROVE_ID=TLP1.TLID(+)
      AND NVL(MA.MAKER_ID,'000') LIKE '%'
       AND NVL(MA.APPROVE_ID,'000') LIKE '%'
    GROUP BY MA.RECORD_KEY,TLP.TLNAME,TLP1.TLNAME,MA.TO_VALUE,MA.MAKER_ID,MA.APPROVE_ID ) USER_ID2

         WHERE  CF1.CUSTID =AF.CUSTID
         AND CF1.BRID=BR.BRID
         AND CF1.CUSTID=USER_ID.CFCUSTID(+)
         AND CF1.CUSTID =CFA.CFCUSTID
         and CF2.CUSTID(+) = CFA.CUSTID
         AND NVL(USER_ID.MAKER_ID,'000') LIKE V_MAKER
         AND NVL(USER_ID.APPROVE_ID,'000') LIKE V_CHECKER
         AND  CF1.BRID LIKE  V_I_BRID
         AND CFA.VALDATE <=TO_DATE(T_DATE ,'DD/MM/YYYY')
         AND CFA.VALDATE >=TO_DATE(F_DATE ,'DD/MM/YYYY')
         AND CFA.EXPDATE <=TO_DATE(TO_DATE ,'DD/MM/YYYY')
         AND CFA.EXPDATE >=TO_DATE(FROM_DATE ,'DD/MM/YYYY')
         AND NVL(CF1.CAREBY,'-') LIKE  V_STRCAREBY
         AND USER_ID.CFCUSTID= USER_ID2.CFCUSTID(+)
         ORDER BY AF.acctno ,CF1.SHORTNAME
         )CF
         ;


   ELSE
      OPEN PV_REFCURSOR
      FOR

 SELECT distinct (CF.AUT1||CF.AUT2||CF.AUT3||CF.AUT4||CF.AUT5/*||CF.AUT6*/||CF.AUT7||CF.AUT8||CF.AUT9||CF.AUT10||CF.AUT11||CF.AUT12) LINKAUTH,
  CF.FULLNAME ,CF.CUSTODYCD  ,CF.IDCODE ,CF.ADDRESS ,
  CF.FULLNAMEAUTH  FULLNAMEAUTH ,CF.LICENSENO ,CF.VALDATE ,CF.EXPDATE, CF.ADDRESSAUT, MAKER, CHECKER, BRID,BRNAME,USERHUY,STATUS
 FROM ( SELECT
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,1,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '1' ) END)AUT1,
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,2,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '2' ) END)AUT2,
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,3,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '3' ) END)AUT3,
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,4,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '4' ) END)AUT4,
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,5,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '5' ) END)AUT5,
 --( CASE WHEN SUBSTR(CFA.LINKAUTH,6,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL='6' ) END)AUT6,
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,7,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '7' ) END)AUT7,
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,8,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '8' ) END)AUT8,
 ( CASE WHEN SUBSTR(CFA.LINKAUTH,9,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '9' ) END)AUT9,
  ( CASE WHEN SUBSTR(CFA.LINKAUTH,10,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '10' ) END)AUT10,
   ( CASE WHEN SUBSTR(CFA.LINKAUTH,11,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '11' ) END)AUT11,
    ( CASE WHEN SUBSTR(CFA.LINKAUTH,12,1) ='Y' THEN   (SELECT CDCONTENT FROM  ALLCODE AL WHERE AL.cdname ='LINKAUTH'AND CDVAL= '12' ) END)AUT12,
  CF1.FULLNAME ,AF.ACCTNO ,CF1.CUSTODYCD  ,CF1.IDCODE ,CF1.IDDATE , CF1.ADDRESS,
                   case when cfa.custid is null then CFA.FULLNAME else cf2.fullname end FULLNAMEAUTH,
                   case when cfa.custid is null then cfa.LICENSENO else cf2.idcode end LICENSENO,
                   CFA.VALDATE ,CFA.EXPDATE,
                   case when cfa.custid is null then cfa.ADDRESS else cf2.address end ADDRESSAUT,
                      NVL(USER_ID.MAKER,'')MAKER,NVL(USER_ID.CHECKER,'')CHECKER,CF1.BRID,BR.BRNAME,NVL(USER_ID2.MAKER ,'') USERHUY, CFA.DELTD STATUS
         FROM (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0)  CF1, AFMAST AF
         , CFAUTH CFA, CFMAST  CF2, BRGRP BR,
         (   SELECT MA.TO_VALUE CUSTID,MA.MAKER_ID,MA.APPROVE_ID, SUBSTR(MA.RECORD_KEY,11,10) CFCUSTID,NVL(TLP.TLNAME,'') MAKER,NVL(TLP1.TLNAME,'') CHECKER,MIN(MA.MAKER_DT)
    FROM MAINTAIN_LOG MA, TLPROFILES TLP, TLPROFILES TLP1
    WHERE MA.TABLE_NAME='CFMAST' AND MA.ACTION_FLAG='ADD'
    AND MA.CHILD_TABLE_NAME='CFAUTH' AND MA.COLUMN_NAME='CUSTID'
    AND MA.MAKER_ID=TLP.TLID(+)
    AND MA.APPROVE_ID=TLP1.TLID(+)
      AND NVL(MA.MAKER_ID,'000') LIKE V_MAKER
       AND NVL(MA.APPROVE_ID,'000') LIKE V_CHECKER
    GROUP BY MA.RECORD_KEY,TLP.TLNAME,TLP1.TLNAME,MA.TO_VALUE,MA.MAKER_ID,MA.APPROVE_ID ) USER_ID,
    (   SELECT MA.TO_VALUE CUSTID,MA.MAKER_ID,MA.APPROVE_ID, SUBSTR(MA.RECORD_KEY,11,10) CFCUSTID,NVL(TLP.TLNAME,'') MAKER,NVL(TLP1.TLNAME,'') CHECKER,MIN(MA.MAKER_DT)
    FROM MAINTAIN_LOG MA, TLPROFILES TLP, TLPROFILES TLP1
    WHERE MA.TABLE_NAME='CFMAST' AND MA.ACTION_FLAG='DELETE'
    AND MA.CHILD_TABLE_NAME='CFAUTH'
    AND MA.MAKER_ID=TLP.TLID(+)
    AND MA.APPROVE_ID=TLP1.TLID(+)
      AND NVL(MA.MAKER_ID,'000') LIKE V_MAKER
       AND NVL(MA.APPROVE_ID,'000') LIKE V_CHECKER
    GROUP BY MA.RECORD_KEY,TLP.TLNAME,TLP1.TLNAME,MA.TO_VALUE,MA.MAKER_ID,MA.APPROVE_ID ) USER_ID2
         WHERE  CF1.CUSTID =AF.CUSTID
         AND cf1.custid =CFA.cfcustid
         and cf2.custid(+) = cfa.custid
         AND CF1.BRID=BR.BRID
         AND CF1.CUSTID=USER_ID.CFCUSTID(+)
          AND NVL(USER_ID.MAKER_ID,'000') LIKE V_MAKER
         AND NVL(USER_ID.APPROVE_ID,'000') LIKE V_CHECKER
         AND  CF1.BRID LIKE  V_I_BRID
        -- AND SUBSTR(AF.ACCTNO,1,4) LIKE  V_STRBRID
         AND CFA.VALDATE <=TO_DATE(T_DATE ,'DD/MM/YYYY')
         AND CFA.VALDATE >=TO_DATE(F_DATE ,'DD/MM/YYYY')
         AND NVL(CF1.CAREBY,'-') LIKE  V_STRCAREBY
         AND USER_ID.CFCUSTID= USER_ID2.CFCUSTID(+)
                  ORDER BY AF.acctno ,CF1.SHORTNAME
         )CF
         ;


   END IF;
 EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;

 
 
 
 
/
