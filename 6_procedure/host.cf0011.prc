SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "CF0011" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   OPT            IN       VARCHAR2,
   pv_BRID           IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   F_DATE         IN       VARCHAR2,
   T_DATE         IN       VARCHAR2,
   PV_CUSTODYCD   IN       VARCHAR2,
   TLID            IN       VARCHAR2
)
IS
--
-- PHIEU TINH LAI
-- MODIFICATION HISTORY
-- PERSON         DATE           COMMENTS
-- QUOCTA      16/01/2012      EDIT FOR BVS
-- CHAUNH  27/2/2012  edit date
-- ---------   ------  -------------------------------------------

   V_STROPTION         VARCHAR2 (5);            -- A: ALL; B: BRANCH; S: SUB-BRANCH
   V_STRBRID           VARCHAR2 (4);            -- USED WHEN V_NUMOPTION > 0

   V_FROMDATE          DATE;
   V_TODATE            DATE;
   V_STRCUSTODYCD      VARCHAR2(20);
   V_STRTLID           VARCHAR2(6);

BEGIN

    V_STROPTION := OPT;
     V_STRTLID:= TLID;

    IF (V_STROPTION <> 'A') AND (pv_BRID <> 'ALL')
    THEN
         V_STRBRID := pv_BRID;
    ELSE
         V_STRBRID := '%%';
    END IF;

-- GET REPORT'S PARAMETERS
    V_FROMDATE        := TO_DATE(F_DATE, SYSTEMNUMS.C_DATE_FORMAT);
    V_TODATE          := TO_DATE(T_DATE, SYSTEMNUMS.C_DATE_FORMAT);

    IF (PV_CUSTODYCD <> 'ALL' OR PV_CUSTODYCD <> '' OR PV_CUSTODYCD <> NULL)
    THEN
         V_STRCUSTODYCD    :=    PV_CUSTODYCD;
    ELSE
         V_STRCUSTODYCD    :=    '%';
    END IF;


-- GET REPORT'S DATA
      OPEN PV_REFCURSOR
      FOR

         SELECT CF.FULLNAME, CF.CUSTODYCD, CF.ADDRESS, 'VND' MNT,
                CIT.FRDATE, CIT.TODATE, CIT.IRRATE, CIT.INTBAL,
                CIT.INTAMT, AF.ACCTNO AFACCTNO
         FROM   AFMAST AF, (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF, (SELECT * FROM CIINTTRAN UNION ALL SELECT * FROM CIINTTRANA) CIT
         WHERE  AF.CUSTID        =   CF.CUSTID
         AND    AF.ACCTNO        =   CIT.ACCTNO
         AND    CIT.INTTYPE      =   'CR'
         AND    CIT.TODATE >= V_FROMDATE AND  CIT.TODATE <= V_TODATE
         AND    CF.CUSTODYCD     LIKE V_STRCUSTODYCD
         ORDER  BY CIT.TODATE

         ;
 EXCEPTION
   WHEN OTHERS
   THEN
      RETURN;
END;

 
 
 
 
/
