SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "BO0002" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   PV_BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2

)
IS
--
-- PURPOSE: BRIEFLY EXPLAIN THE FUNCTIONALITY OF THE PROCEDURE
--
-- MODIFICATION HISTORY
-- PERSON      DATE    COMMENTS
-- HUYNQ               CREATED
-- ---------   ------  -------------------------------------------
   V_STROPTION        VARCHAR2 (5);       -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STRBRID          VARCHAR2 (4);              -- USED WHEN V_NUMOPTION > 0
   V_STRBRGID           VARCHAR2 (10);



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

   -- END OF GETTING REPORT'S PARAMETERS
   -- GET REPORT'S DATA

      OPEN PV_REFCURSOR
       FOR
--TRAI PHIEU
--KL DANG KY
SELECT MST.ISSTMPDATE TXDATE,MST.BONDID, MST.ISSDATE,A1.cdcontent BONDISSUER,cf.fullname,CF.CUSTID, A2.CDCONTENT GROUPKH,NVL(MST.NOTES,'') NOTES,
 mst.CODEID SYMBOL, MST.TERM,MST.BIDQTTY,BO.BIDQTTY KH_DK,'Y' STATUS,
  BO.WINQTTY KL_TT,BO.AMT,MST.WINQTTY, MST.COUPON,MST.WININTEREST,  BO.BIDINT
FROM BONDIPO MST,SBSECURITIES SB, allcode a, allcode a1,bondcust BO, cfmast cf, ALLCODE A2
WHERE MST.CODEID=SB.symbol(+) and mst.TREASURYBILL = a.cdval and a.cdtype = 'SA' and a.cdname = 'TREASURYBILL'
AND a1.cdname = 'ISSTMP' AND A1.cdtype = 'SA' AND MST.ISSTMP = A1.cdval
and mst.bondid=bo.bondid
and cf.CUSTODYCD=bo.custid
AND A2.CDNAME = 'BONDCUSTTYPE' AND A2.CDTYPE='SA'
AND A2.CDVAL=BO.BONDCUSTTYPE
AND BO.BIDQTTY >0
AND MST.ISSTMPDATE  BETWEEN TO_DATE(F_DATE,'DD/MM/YYYY') AND TO_DATE(T_DATE,'DD/MM/YYYY')

UNION ALL
--KL DANG KY KHONG CANH TRANH
SELECT MST.ISSTMPDATE TXDATE,MST.BONDID, MST.ISSDATE,A1.cdcontent BONDISSUER,cf.fullname,CF.CUSTID, A2.CDCONTENT GROUPKH,NVL(MST.NOTES,'') NOTES,
 mst.CODEID SYMBOL, MST.TERM,MST.BIDQTTY,BO.BIDQTTYL0 KH_DK,'N' STATUS,
  BO.WINQTTY KL_TT,BO.AMT,MST.WINQTTY, MST.COUPON,MST.WININTEREST,  BO.BIDINT
FROM BONDIPO MST,SBSECURITIES SB, allcode a, allcode a1,bondcust BO, cfmast cf, ALLCODE A2
WHERE MST.CODEID=SB.symbol(+) and mst.TREASURYBILL = a.cdval and a.cdtype = 'SA' and a.cdname = 'TREASURYBILL'
AND a1.cdname = 'ISSTMP' AND A1.cdtype = 'SA' AND MST.ISSTMP = A1.cdval
and mst.bondid=bo.bondid
and cf.CUSTODYCD=bo.custid
AND A2.CDNAME = 'BONDCUSTTYPE' AND A2.CDTYPE='SA'
AND A2.CDVAL=BO.BONDCUSTTYPE
AND BO.BIDQTTYL0 >0
AND MST.ISSTMPDATE BETWEEN TO_DATE(F_DATE,'DD/MM/YYYY') AND TO_DATE(T_DATE,'DD/MM/YYYY')
ORDER BY BONDID, CUSTID, BIDINT

         ;

 EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;

 
 
 
 
/