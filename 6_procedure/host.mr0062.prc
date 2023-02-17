SET DEFINE OFF;
CREATE OR REPLACE PROCEDURE "MR0062" (
   PV_REFCURSOR   IN OUT   PKG_REPORT.REF_CURSOR,
   pv_OPT         IN       VARCHAR2,
   pv_BRID        IN       VARCHAR2,
   TLGOUPS        IN       VARCHAR2,
   TLSCOPE        IN       VARCHAR2,
   I_DATE         IN       VARCHAR2,
   I_BRID         IN       VARCHAR2
)
IS

----------------------------
--BAO CAO CHI TIET P11
--NGOCVTT 14/04/2015

-- ---------   ------  -------------------------------------------
   l_STROPTION        VARCHAR2 (5);       -- A: ALL; B: BRANCH; S: SUB-BRANCH
   l_STRBRID          VARCHAR2 (4);

   V_IDATE           DATE;
   V_CUDATE        DATE;
   V_INBRID         VARCHAR2(4);
   V_STRBRID        VARCHAR2 (50);
   V_STROPTION      VARCHAR2(10);
   v_BRID        VARCHAR2(20);


BEGIN

   V_STROPTION := upper(pv_OPT);
   V_INBRID := pv_BRID;

 -- END OF GETTING REPORT'S PARAMETERS

    if(upper(I_BRID) = 'ALL' or I_BRID is null) then
        v_BRID := '%%';
    else
        v_BRID := UPPER(I_BRID);
    end if ;
V_IDATE:=TO_DATE(I_DATE,'DD/MM/RRRR');

   ----
-- GET REPORT'S DATA
OPEN PV_REFCURSOR FOR

    SELECT V_IDATE INDATE, BR.BRNAME,CF.CUSTODYCD,AF.ACCTNO,ROUND(NVL(CI.BALANCE,0)+NVL(CI.RECEIVING,0)-NVL(V.AMT,0)) SO_DU,
    CF.FULLNAME, AFT.MRTYPE
    FROM (SELECT * FROM CFMAST WHERE FNC_VALIDATE_SCOPE(BRID, CAREBY, TLSCOPE, pv_BRID, TLGOUPS)=0) CF,AFMAST AF, AFTYPE AFT, MRTYPE MR,BRGRP BR,CIMAST CI,
        (SELECT AFACCTNO,NVL(SUM(SECUREAMT),0)+NVL(SUM(ADVAMT),0) AMT
        FROM V_GETBUYORDERINFO
        GROUP BY AFACCTNO) V
    WHERE CF.BRID=BR.BRID
        AND CF.CUSTID=AF.CUSTID
        AND AF.ACTYPE=AFT.ACTYPE
        AND CI.AFACCTNO=AF.ACCTNO
        AND MR.ACTYPE=AFT.MRTYPE
        AND MR.MRTYPE <>'N'
        AND MR.STATUS<>'N'
        AND CF.BRID LIKE v_BRID
        AND AF.ACCTNO=V.AFACCTNO
    ORDER BY CF.CUSTODYCD, AF.ACCTNO

    ;
 EXCEPTION
   WHEN OTHERS
   THEN
        RETURN;
END;
 
 
 
 
/